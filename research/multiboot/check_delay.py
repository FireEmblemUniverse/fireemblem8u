#!/usr/bin/env python3
"""Check countdown semantics against original flags and compiled defined C."""
import hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/multiboot-delay';OUT.mkdir(exist_ok=True)
source=ROOT/'research/multiboot/delay.c'
subprocess.run(['arm-none-eabi-gcc','-O2','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-c',str(source),'-o',str(OUT/'delay.o')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'delay.o'),str(OUT/'delay.bin')],check=True)
candidate=(OUT/'delay.bin').read_bytes();original=(ROOT/'baserom.gba').read_bytes()[0x4e036:0x4e03a]
assert original.hex()=='401afddc'
# The observed compiler shape has four loop instructions. Fail if it changes.
assert candidate[:8].hex()=='0300401a9942fbdb',candidate.hex()
u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(0x02000000,0x1000)
u.mem_write(0x02000000,original);u.mem_write(0x02000100,candidate)
rng=random.Random(0x4e036);cases=0;overflow_examples=[]
signed=lambda x:x if x<0x80000000 else x-0x100000000
for step in (4,12,13):
 values=[0,1,step-1,step,step+1,0x7fffffff,0x80000000,0x80000001,0xffffffff]+[rng.getrandbits(32) for _ in range(4096)]
 for index,cycles in enumerate(values):
  expected=(cycles-step)&0xffffffff;repeat=signed(cycles)>step
  for base,count in ((0x02000000,2),(0x02000100,4)):
   u.reg_write(r.UC_ARM_REG_CPSR,0x3f|((index%16)<<28))
   u.reg_write(r.UC_ARM_REG_R0,cycles);u.reg_write(r.UC_ARM_REG_R1,step)
   u.emu_start(base|1,0,count=count)
   assert u.reg_read(r.UC_ARM_REG_R0)==expected
   assert u.reg_read(r.UC_ARM_REG_PC)==(base if repeat else base+count*2)
  if index<9 and repeat!=(signed(expected)>0):overflow_examples.append(dict(cycles=hex(cycles),step=step,result=hex(expected),original_repeats=repeat,wrapped_positive_repeats=signed(expected)>0))
  cases+=1
assert overflow_examples
report=dict(cases=cases,steps=[4,12,13],original_loop_bytes=4,candidate_loop_bytes=8,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),candidate_sha256=hashlib.sha256(candidate).hexdigest(),overflow_examples=overflow_examples,production_integrated=False,scope='One countdown iteration, wrapped result and branch decision from original SUBS/BGT and compiled defined C. Covers directed signed-overflow boundaries and random words. Candidate has extra MOV/CMP and is not timing-exact; flags/register clobbers and full calibrated wait are not equivalent yet.')
(ROOT/'docs/multiboot-delay-research.json').write_text(json.dumps(report,indent=2)+'\n');print(cases,'iteration cases pass; timing-exact compilation remains open')
