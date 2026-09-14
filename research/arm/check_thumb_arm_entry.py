#!/usr/bin/env python3
"""Check exact private Thumb-to-ARM entries and reject unsupported contracts/layouts."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/arm-veneers';OUT.mkdir(exist_ok=True)
CC=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc';PLUGIN=OUT/'thumb_arm_entry.so'
parser=argparse.ArgumentParser();parser.add_argument('--source',type=Path,default=ROOT/'research/arm/thumb_arm_entry.c');parser.add_argument('--plugin',type=Path,default=PLUGIN);parser.add_argument('--rom',type=Path,default=ROOT/'baserom.gba');parser.add_argument('--integrated',action='store_true');args=parser.parse_args();PLUGIN=args.plugin.resolve()
source=args.source.read_text()
names=['ClearOAMBuffer','CallARM_FillTileRect','TileMap_FillRect','CALLARM_ColorFadeTick','TileMap_CopyRect','ComputeChecksum32']
bodies=['ArmCall_Clear','ArmCall_Tsa','ArmCall_Fill','ArmCall_Fade','ArmCall_Copy','ArmCall_Checksum']
targets=['ClearOam','TmApplyTsa','TmFillRect','ColorFadeTick','TmCopyRect','Checksum32']
sections=['clear','tsa','fill','fade','copy','checksum']
def compile_case(name,text,extra=(),plugin=True):
 p=OUT/(name+'.c');p.write_text(text);obj=OUT/(name+'.o')
 flags=['-S','-O2','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-ffunction-sections','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes']
 result=subprocess.run([str(CC),*flags,*(['-fplugin='+str(PLUGIN)] if plugin else []),*extra,str(p),'-o',str(obj.with_suffix('.s'))],capture_output=True,text=True)
 (OUT/(name+'.log')).write_text(result.stdout+result.stderr)
 if result.returncode==0: result=subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi','-mthumb-interwork',str(obj.with_suffix('.s')),'-o',str(obj)],capture_output=True,text=True)
 return result,obj
res,obj=compile_case('entries',source);assert res.returncode==0,res.stderr
symbols={x.split()[-1]:int(x.split()[0],16) for x in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(x.split())==3}
script='SECTIONS { .text 0x080d7498 : {\n'
for name,body,section in zip(names,bodies,sections):
 script+=f' *(.text.{name}) *(.text.arm_call_{section})\n'
script+='} }\n'
for name,body in zip(names,bodies):script+=f'ASSERT(({name} & 3) == 0 && {body} == {name} + 4, "entry/body layout");\n'
script+='\n'.join(f'{name} = 0x{symbols[name]:x};' for name in targets)
(OUT/'entries.ld').write_text(script)
def link(path):return subprocess.run(['arm-none-eabi-ld','-T',str(path),str(obj),str(ROOT/'src/arm/call_wrappers.o'),'-o',str(OUT/'entries.elf')],capture_output=True,text=True)
res=link(OUT/'entries.ld');assert res.returncode==0,res.stderr
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'entries.elf'),str(OUT/'entries.bin')],check=True)
code=(OUT/'entries.bin').read_bytes();rom=args.rom.read_bytes();assert len(code)==48 and code==rom[0xd7498:0xd74c8]
wrong=OUT/'displaced.ld';wrong.write_text(script.replace('*(.text.arm_call_clear)', '. += 4; *(.text.arm_call_clear)'))
assert link(wrong).returncode!=0
misaligned=OUT/'misaligned.ld';misaligned.write_text(script.replace('0x080d7498','0x080d749a').replace(': {', ': SUBALIGN(2) {'))
assert link(misaligned).returncode!=0
assert link(OUT/'entries.ld').returncode==0
variants={'wrong-destination':(source.replace('entry("ArmCall_Clear")','entry("Wrong")'),()),'arm-mode':(source,('-marm',)),
 'extra-store':(source.replace('{ ArmCall_Clear', '{ *(volatile unsigned *)0x03001000=0; ArmCall_Clear'),()),
 'changed-argument':(source.replace('ArmCall_Clear(dst, count);','ArmCall_Clear(dst, count+1);'),()),
 'returning-call':(source.replace('__attribute__((noreturn))',''),()),'unwind':(source,('-funwind-tables',)),
 'debug':(source,('-g',))}
for name,(text,extra) in variants.items():
 result,_=compile_case(name,text,extra);assert result.returncode and 'Thumb ARM entry requires' in result.stderr,(name,result.stderr)
plain=source
for body in bodies:plain=plain.replace('__attribute__((matching_thumb_arm_entry("'+body+'")))','')
a,left=compile_case('plain-plugin',plain);b,right=compile_case('plain-control',plain,plugin=False);assert a.returncode==b.returncode==0
for name in names:
 chunks=[]
 for ob in (left,right):
  path=OUT/(ob.stem+'.bin');subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text.'+name,str(ob),str(path)],check=True);chunks.append(path.read_bytes())
 assert chunks[0]==chunks[1]
rng=random.Random(0xb47);cases=0
for index,target in enumerate(targets):
 start=0x080d7498+8*index
 for flags in range(16):
  for seed in range(4):
   for lr in (0x080ff000,0x080ff001):
    values=[rng.getrandbits(32) for _ in range(13)];snapshots=[]
    for draft in (False,True):
     u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(0x08000000,len(rom));u.mem_write(0x08000000,rom);u.mem_map(0x03000000,0x8000)
     if draft:u.mem_write(0x080d7498,code)
     u.reg_write(r.UC_ARM_REG_CPSR,0x3f|(flags<<28))
     for n,v in enumerate(values):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),v)
     u.reg_write(r.UC_ARM_REG_SP,0x03007000);u.reg_write(r.UC_ARM_REG_LR,lr)
     state={'trace':[],'writes':[]}
     def hook(u,address,size,state):
      state['trace'].append(address)
      if address==symbols[target]:u.emu_stop()
     def write(u,access,address,size,value,state):state['writes'].append((address,size,value))
     u.hook_add(UC_HOOK_CODE,hook,state);u.hook_add(UC_HOOK_MEM_WRITE,write,state);u.emu_start(start|1,0,count=4)
     assert state['trace']==[start,start+4,symbols[target]] and not state['writes']
     snapshot=[u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(15)]+[u.reg_read(r.UC_ARM_REG_CPSR)]
     assert snapshot==values+[0x03007000,lr,0x1f|(flags<<28)]
     snapshots.append(snapshot)
    assert snapshots[0]==snapshots[1];cases+=1
print(json.dumps(dict(exact_region_bytes=48,candidate_entry_bytes=24,cases=cases,rejected_contracts=list(variants),rejected_displaced_layout=True,rejected_misaligned_layout=True,unannotated_unchanged=True,source_sha256=hashlib.sha256(source.encode()).hexdigest(),plugin_sha256=hashlib.sha256(PLUGIN.read_bytes()).hexdigest(),production_integrated=args.integrated,scope='Exact six entry candidates linked to existing C ARM branches. Checks mode switch, untouched registers/flags/LR/SP, branch targets and skipped NOP; stops before executing target routines. Actual target routines and whole-game behavior are outside this model.'),indent=2))
