#!/usr/bin/env python3
"""Compare wrapper code and synthetic BIOS handoff/return behavior."""
from pathlib import Path
import argparse,hashlib,json,random,subprocess
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/bios-wrappers';OUT.mkdir(parents=True,exist_ok=True)
parser=argparse.ArgumentParser()
parser.add_argument('--source',type=Path,default=ROOT/'research/bios/wrappers.c')
parser.add_argument('--rom',type=Path,default=ROOT/'baserom.gba')
parser.add_argument('--integrated',action='store_true')
parser.add_argument('--compiler',default='arm-none-eabi-gcc')
parser.add_argument('--plugin',type=Path)
parser.add_argument('--wrappers',nargs='+')
parser.add_argument('--expected-mismatch',nargs='*',default=['DivRem','ArcTan2','Sqrt'])
parser.add_argument('--seeds',type=int,default=4)
args=parser.parse_args()
source=args.source
assert args.seeds > 0
subprocess.run([args.compiler,*(['-fplugin='+str(args.plugin.resolve()),'-Werror=attributes'] if args.plugin else []),'-c','-O2','-falign-functions=2','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-ffunction-sections','-I',str(ROOT/'include'),str(source),'-o',str(OUT/'candidate.o')],check=True)
names=['ArcTan2','BgAffineSet','CpuFastSet','CpuSet','Div','DivArm','DivRem','HuffUnComp','LZ77UnCompVram','LZ77UnCompWram','MultiBoot','ObjAffineSet','RLUnCompVram','RLUnCompWram','RegisterRamReset','SoundBiasReset','SoundBiasSet','Sqrt','VBlankIntrWait']
if args.integrated:names=[name for name in names if name not in ('ArcTan2','DivRem','Sqrt')]
if args.wrappers:names=args.wrappers
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
rom=args.rom.read_bytes();reports=[];rng=random.Random(0xdf4770)
for name in names:
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text.'+name,str(OUT/'candidate.o'),str(OUT/'wrapper.bin')],check=True)
 candidate=(OUT/'wrapper.bin').read_bytes();start=symbols[name]
 size=6 if name in ('DivRem','MultiBoot','SoundBiasReset','SoundBiasSet','VBlankIntrWait') else 4
 original=rom[start-0x08000000:start-0x08000000+size]
 svc=next(int.from_bytes(original[n:n+2],'little')&255 for n in range(0,len(original),2) if original[n+1]==0xdf)
 diffs=0;flagdiffs=0;regdiffs=0
 for flags in range(16):
  for seed in range(args.seeds):
   inputs=[rng.getrandbits(32) for _ in range(13)]
   outputs={n:rng.getrandbits(32) for n in (0,1,2,3,12)}
   if name in ('ArcTan2','Sqrt'):outputs[0]=(0,1,0x8000,0xffff)[seed % 4]
   snapshots=[];handoffs=[]
   for draft in (False,True):
    u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(0x08000000,len(rom));u.mem_write(0x08000000,rom)
    u.mem_map(0x03000000,0x8000)
    if draft:u.mem_write(0x080f0000,candidate)
    u.reg_write(r.UC_ARM_REG_CPSR,0x3f|((15-flags)<<28))
    for n,value in enumerate(inputs):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),value)
    u.reg_write(r.UC_ARM_REG_SP,0x03007000);u.reg_write(r.UC_ARM_REG_LR,0x080ff001)
    state={'svc':0,'returned':False,'writes':[]}
    def hook(u,address,size,state):
     if address==0x080ff000:state['returned']=True;u.emu_stop();return
     instruction=int.from_bytes(u.mem_read(address,2),'little')
     if instruction&0xff00==0xdf00:
      assert instruction&255==svc,(name,draft,hex(address),hex(instruction),svc)
      state['svc']+=1
      handoffs.append([u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(13)]+[u.reg_read(r.UC_ARM_REG_CPSR)])
      for n,value in outputs.items():u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),value)
      u.reg_write(r.UC_ARM_REG_CPSR,0x3f|(flags<<28))
      u.reg_write(r.UC_ARM_REG_PC,(address+2)|1)
    def write(u,access,address,size,value,state):state['writes'].append((address,size,value))
    u.hook_add(UC_HOOK_CODE,hook,state);u.hook_add(UC_HOOK_MEM_WRITE,write,state)
    u.emu_start((0x080f0000 if draft else start)|1,0,count=20)
    assert state['returned'] and state['svc']==1 and not state['writes']
    snapshots.append([u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(15)]+[u.reg_read(r.UC_ARM_REG_CPSR)])
   assert handoffs[0]==handoffs[1],name
   diff=snapshots[0]!=snapshots[1];diffs+=diff
   regdiffs+=snapshots[0][:-1]!=snapshots[1][:-1];flagdiffs+=snapshots[0][-1]!=snapshots[1][-1]
 exact=candidate==original
 if name not in args.expected_mismatch:assert exact and diffs==0,name
 else:assert not exact and flagdiffs>0 and regdiffs==0,name
 reports.append(dict(name=name,original_instruction_bytes=size,candidate_bytes=len(candidate),instruction_bytes_exact=exact,cases=16*args.seeds,register_difference_cases=regdiffs,flag_difference_cases=flagdiffs,svc=svc))
print(json.dumps(dict(compiler_version=subprocess.check_output([args.compiler,'--version'],text=True).splitlines()[0],plugin_sha256=hashlib.sha256(args.plugin.read_bytes()).hexdigest() if args.plugin else None,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),wrappers=reports,exact_wrappers=sum(x['instruction_bytes_exact'] for x in reports),total_cases=sum(x['cases'] for x in reports),production_integrated=args.integrated,scope='Synthetic BIOS hook checks incoming registers/flags, prescribed output registers/flags, no wrapper stack writes and final return. ArcTan2/Sqrt outputs stay within their declared 16-bit range. Does not implement or validate BIOS services, memory effects, timing, errors or hardware interrupt behavior. SoftReset remains outside this draft.'),indent=2))
