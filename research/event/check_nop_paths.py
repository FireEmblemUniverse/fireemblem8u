#!/usr/bin/env python3
"""Verify two event identity/return paths and the direct-C compiler boundary."""
import hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/event-nop';OUT.mkdir(exist_ok=True)
source=ROOT/'research/event/nop.c'
subprocess.run(['arm-none-eabi-gcc','-O2','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-c',str(source),'-o',str(OUT/'nop.o')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'nop.o'),str(OUT/'nop.bin')],check=True)
symbol=next(line.split() for line in subprocess.check_output(['arm-none-eabi-nm','-S',str(OUT/'nop.o')],text=True).splitlines() if line.split()[-1]=='EventIdentity')
size=int(symbol[1],16)
candidate=(OUT/'nop.bin').read_bytes()[:size];assert candidate==bytes.fromhex('7047')
rom=(ROOT/'baserom.gba').read_bytes();code=rom[0x84320:0x8432e]
assert code.hex()=='c04600e0c04607b030bc01bc0047'
rng=random.Random(0x84320);cases=0
for start in (0x08084320,0x08084324):
 for case in range(256):
  u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(0x08084000,0x1000);u.mem_map(0x03000000,0x8000);u.mem_write(0x08084320,code)
  regs=[rng.getrandbits(32) for _ in range(15)];regs[13]=0x03004000
  flags=(case%16)<<28;u.reg_write(r.UC_ARM_REG_CPSR,flags|0x3f)
  for n,value in enumerate(regs):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),value)
  saved=[rng.getrandbits(32),rng.getrandbits(32),0x08084801]
  u.mem_write(regs[13]+28,b''.join(x.to_bytes(4,'little') for x in saved))
  writes=[];u.hook_add(UC_HOOK_MEM_WRITE,lambda u,a,addr,size,value,d:writes.append((addr,size,value)))
  u.emu_start(start|1,0x08084800,count=10)
  expected=regs.copy();expected[0]=saved[2];expected[4:6]=saved[:2];expected[13]+=40
  assert [u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(15)]==expected
  assert u.reg_read(r.UC_ARM_REG_CPSR)==flags|0x3f and u.reg_read(r.UC_ARM_REG_PC)==0x08084800 and not writes
  cases+=1
report=dict(cases=cases,paths=['0x08084320','0x08084324'],retained_nop_bytes=4,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),direct_c_bytes=candidate.hex(),direct_c_identity_eliminated=True,production_changed=False,scope='Original NOP/shared-return paths with randomized saved registers and all flag profiles. Direct volatile r8 self-assignment is eliminated by GCC and is not a matching replacement. Does not execute event search, dispatch or game actions.')
(ROOT/'docs/event-nop-research.json').write_text(json.dumps(report,indent=2)+'\n');print(cases,'return-path cases pass; direct C identity is eliminated')
