#!/usr/bin/env python3
"""Check countdown semantics against original flags and compiled defined C."""
import hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/multiboot-delay';OUT.mkdir(exist_ok=True)
source=ROOT/'research/multiboot/delay.c'
subprocess.run(['python3',str(ROOT/'tools/arm-dispatch/build_thumb_countdown.py')],check=True)
compiler=str(ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc')
plugin=['-DMATCHING_COUNTDOWN','-Werror=attributes','-fplugin='+str(OUT/'thumb_countdown.so')]
subprocess.run([compiler,*plugin,'-O2','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-c',str(source),'-o',str(OUT/'delay.o')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'delay.o'),str(OUT/'delay.bin')],check=True)
candidate=(OUT/'delay.bin').read_bytes();original=(ROOT/'baserom.gba').read_bytes()[0x4e036:0x4e03a]
assert original.hex()=='401afddc'
# The restricted conversion must reproduce the two original loop instructions.
assert candidate[:4]==original,candidate.hex()
u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(0x02000000,0x1000)
u.mem_write(0x02000000,original);u.mem_write(0x02000100,candidate)
rng=random.Random(0x4e036);cases=0;overflow_examples=[]
signed=lambda x:x if x<0x80000000 else x-0x100000000
for step in (4,12,13):
 values=[0,1,step-1,step,step+1,0x7fffffff,0x80000000,0x80000001,0xffffffff]+[rng.getrandbits(32) for _ in range(4096)]
 for index,cycles in enumerate(values):
  expected=(cycles-step)&0xffffffff;repeat=signed(cycles)>step
  states=[]
  for base,count in ((0x02000000,2),(0x02000100,2)):
   u.reg_write(r.UC_ARM_REG_CPSR,0x3f|((index%16)<<28))
   for n in range(15): u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),0x12340000+n)
   u.reg_write(r.UC_ARM_REG_R0,cycles);u.reg_write(r.UC_ARM_REG_R1,step)
   u.emu_start(base|1,0,count=count)
   assert u.reg_read(r.UC_ARM_REG_R0)==expected
   assert u.reg_read(r.UC_ARM_REG_PC)==(base if repeat else base+count*2)
   states.append([u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(15)]+[u.reg_read(r.UC_ARM_REG_CPSR)])
  assert states[0]==states[1]
  if index<9 and repeat!=(signed(expected)>0):overflow_examples.append(dict(cycles=hex(cycles),step=step,result=hex(expected),original_repeats=repeat,wrapped_positive_repeats=signed(expected)>0))
  cases+=1
assert overflow_examples
rejected=[]
for name,text,extra in [
 ('wrong_condition',source.read_text().replace('(int)before > (int)step','before > step'),[]),
 ('wrong_subtract',source.read_text().replace('cycles -= step','cycles -= step + 1'),[]),
 ('debug',source.read_text(),['-g']),
 ('arm',source.read_text(),['-marm']),
]:
 p=OUT/(name+'.c');p.write_text(text)
 bad=subprocess.run([compiler,*plugin,'-O2','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu',*extra,'-c',str(p),'-o',str(OUT/(name+'.o'))],capture_output=True,text=True)
 assert bad.returncode and 'Thumb countdown' in bad.stderr,bad.stderr
 rejected.append(name)

for name,opts in [('plain',[]),('unannotated',[x for x in plugin if x.startswith('-fplugin=')])]:
 subprocess.run([compiler,*opts,'-O2','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-c',str(source),'-o',str(OUT/(name+'.o'))],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/(name+'.o')),str(OUT/(name+'.bin'))],check=True)
assert (OUT/'plain.bin').read_bytes()==(OUT/'unannotated.bin').read_bytes()
report=dict(unannotated_control_unchanged=True,backend_sha256=hashlib.sha256((ROOT/'tools/arm-dispatch/matching.md').read_bytes()).hexdigest(),pass_sha256=hashlib.sha256((ROOT/'tools/arm-dispatch/thumb_countdown.cc').read_bytes()).hexdigest(),rejected=rejected,cases=cases,steps=[4,12,13],original_loop_bytes=4,candidate_loop_bytes=4,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),candidate_sha256=hashlib.sha256(candidate).hexdigest(),overflow_examples=overflow_examples,production_integrated=False,scope='One countdown iteration, all registers/flags, wrapped result and branch decision from original SUBS/BGT and compiled defined C. Covers directed signed-overflow boundaries and random words. Isolated compiled loop bytes match; full calibrated function integration remains open.')
(ROOT/'docs/multiboot-delay-matching.json').write_text(json.dumps(report,indent=2)+'\n');print(cases,'iteration cases pass; exact isolated loop bytes match')
