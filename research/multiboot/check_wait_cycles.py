#!/usr/bin/env python3
"""Verify complete calibrated wait bytes and region-dependent execution."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/multiboot-delay'
parser=argparse.ArgumentParser();parser.add_argument('--production',action='store_true');args=parser.parse_args()
if args.production:
 source=ROOT/'src/sio_multiboot_wait.c'
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(ROOT/'src/sio_multiboot_wait.o'),str(OUT/'wait.bin')],check=True)
else:
 source=ROOT/'research/multiboot/wait_cycles.c'
 subprocess.run(['python3',str(ROOT/'tools/arm-dispatch/build_thumb_countdown.py')],check=True)
 flags=['-O1','-ffixed-r2','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-schedule-insns','-fno-schedule-insns2','-fno-if-conversion','-fno-if-conversion2','-Werror=attributes','-fplugin='+str(OUT/'thumb_countdown.so')]
 subprocess.run([str(ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'),*flags,'-c',str(source),'-o',str(OUT/'wait.o')],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'wait.o'),str(OUT/'wait.bin')],check=True)
code=(OUT/'wait.bin').read_bytes();reference=(ROOT/'baserom.gba').read_bytes()[0x4e024:0x4e03c]
assert code==reference and len(code)==24
rng=random.Random(0xe024);cases=0
for base,step in [(0x0804e024,13),(0x02001000,12),(0x03001000,4)]:
 # Prefix count is the instructions before the loop, including PC read.
 prefix={13:8,12:5,4:9}[step]
 values=list(range(257))+[0x80000000,0x80000001,0xffffffff]+[rng.randrange(4096) for _ in range(256)]
 for index,cycles in enumerate(values):
  u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(base&~0xfff,0x1000);u.mem_write(base,code)
  u.reg_write(r.UC_ARM_REG_CPSR,0x3f|((index%16)<<28))
  initial=[rng.getrandbits(32) for _ in range(15)];initial[0]=cycles;initial[14]=(base+0x100)|1
  for n,v in enumerate(initial):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),v)
  trace=[];writes=[]
  u.hook_add(UC_HOOK_CODE,lambda u,a,s,d:trace.append(a))
  u.hook_add(UC_HOOK_MEM_WRITE,lambda u,a,addr,s,v,d:writes.append((addr,s,v)))
  u.emu_start(base|1,base+0x100,count=3000)
  signed=cycles if cycles<0x80000000 else cycles-0x100000000
  iterations=max(1,(signed+step-1)//step)
  assert trace.count(base+18)==iterations and trace.count(base+20)==iterations
  assert len(trace)==prefix+iterations*2+1 and not writes
  expected=initial.copy();expected[0]=(cycles-iterations*step)&0xffffffff;expected[1]=step;expected[2]=(base+4)>>24
  assert [u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(15)]==expected
  assert u.reg_read(r.UC_ARM_REG_PC)==base+0x100
  cases+=1
report=dict(cases=cases,exact_instruction_bytes=24,retained_pc_read_bytes=2,recovered_loop_bytes=4,regions=['ROM','EWRAM','IWRAM'],source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),code_sha256=hashlib.sha256(code).hexdigest(),production_integrated=args.production,scope='Full function with region-dependent PC read, exact instruction count, register results, no writes and return. Instruction-count parity is not a model of memory wait-state timing; hardware PC read remains assembly.')
(ROOT/('docs/multiboot-wait.json' if args.production else 'docs/multiboot-wait-research.json')).write_text(json.dumps(report,indent=2)+'\n');print(cases,'full-function cases pass; 24 bytes exact')
