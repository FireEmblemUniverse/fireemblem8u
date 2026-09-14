#!/usr/bin/env python3
"""Verify payload IRQ priority search C bytes and all normal pending masks."""
import hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_ARM,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];out=ROOT/'.deps/payload-irq-search';out.mkdir(exist_ok=True)
subprocess.run(['python3',str(ROOT/'tools/arm-dispatch/build_arm_noreturn_frame.py'),'--output-dir',str(out)],check=True)
command=['arm-none-eabi-gcc','-c','-O2','-fno-cse-follow-jumps','-fno-shrink-wrap','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes','-fplugin='+str(out/'arm_noreturn_frame.so'),'-fplugin-arg-arm_noreturn_frame-callee=PayloadIrqSelected','-fplugin-arg-arm_noreturn_frame-fold-halts=2','-fplugin-arg-arm_noreturn_frame-adjacent=PayloadIrqSelected',str(ROOT/'research/payload/irq_search.c'),'-o',str(out/'search.o')]
p=subprocess.run(command,capture_output=True,text=True);assert p.returncode==0,p.stderr
script=out/'search.ld';script.write_text('SECTIONS { .text 0x02010058 : { *(.text) } PayloadIrqSelected = 0x02010100; ASSERT(SIZEOF(.text)==168,"search size changed") /DISCARD/ : { *(*) } }')
subprocess.run(['arm-none-eabi-ld','-T',str(script),str(out/'search.o'),'-o',str(out/'search.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary',str(out/'search.elf'),str(out/'search.bin')],check=True)
code=(out/'search.bin').read_bytes();images=[]
for name in ('mgfembp','mgfembp_20030206','mgfembp_20030219'):
 assert code==(ROOT/f'mgfembp/{name}.bin').read_bytes()[0x58:0x100]
 images.append(name)
regs=[getattr(r,f'UC_ARM_REG_R{n}') for n in range(15)];rng=random.Random(0x10058)
masks=[0xc0,1,2,4,8,0x10,0x20,0x100,0x200,0x400,0x800,0x1000]
cases=0
for pending in range(0x4000):
 initial=[rng.getrandbits(32) for _ in regs];initial[2]=pending|(0xffff<<16);initial[13]=0x03004000
 u=Uc(UC_ARCH_ARM,UC_MODE_ARM);u.mem_map(0x02010000,0x1000);u.mem_write(0x02010058,code)
 u.reg_write(r.UC_ARM_REG_CPSR,0x1f|((pending&15)<<28))
 for reg,v in zip(regs,initial):u.reg_write(reg,v)
 writes=[];u.hook_add(UC_HOOK_MEM_WRITE,lambda u,a,addr,size,v,data:writes.append((addr,size,v)))
 u.emu_start(0x02010058,0x02010100,count=64)
 assert not writes and [u.reg_read(reg) for reg in regs[3:]]==initial[3:]
 assert u.reg_read(regs[1])==pending
 if pending&0x2000:
  assert u.reg_read(r.UC_ARM_REG_PC)==0x02010060 and u.reg_read(regs[0])==0x2000 and u.reg_read(regs[2])==initial[2]
 else:
  chosen=next(((i,m) for i,m in enumerate(masks) if pending&m),(12,0))
  assert u.reg_read(r.UC_ARM_REG_PC)==0x02010100
  assert u.reg_read(regs[0])==pending&chosen[1] and u.reg_read(regs[2])==chosen[0]*4
 cases+=1
report=dict(exact_images=images,exact_code_bytes=len(code),pending_masks_tested=cases,grouped_priority_mask='0xc0',source_sha256=hashlib.sha256((ROOT/'research/payload/irq_search.c').read_bytes()).hexdigest(),scope='Research priority-search block only. Enumerates all 14-bit pending masks with IE=0xffff, including bit13 halt. Checks selected mask/table offset and preserved registers; not full IRQ entry, mode switching or callback execution.')
(ROOT/'docs/payload-irq-search-research.json').write_text(json.dumps(report,indent=2)+'\n');print(cases,'priority-search masks pass; 168 bytes match all three payloads')
