#!/usr/bin/env python3
"""Check the exact isolated divide-by-zero path and compiler contract."""
import hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division/divzero';OUT.mkdir(exist_ok=True)
CC=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc';PLUGIN=OUT.parent/'divzero_return.so'
source=(ROOT/'research/runtime/divzero.c').read_text()
def compile_case(name,text,extra=(),plugin=True):
 path=OUT/(name+'.c');path.write_text(text);asm=path.with_suffix('.s');obj=path.with_suffix('.o')
 flags=['-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes']
 result=subprocess.run([str(CC),*flags,*(['-fplugin='+str(PLUGIN)] if plugin else []),*extra,str(path),'-o',str(asm)],capture_output=True,text=True)
 (OUT/(name+'.log')).write_text(result.stdout+result.stderr)
 if result.returncode==0:subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],check=True)
 return result,obj
res,obj=compile_case('candidate',source);assert res.returncode==0,res.stderr
start=0x080d1b42
(OUT/'candidate.ld').write_text('SECTIONS { .text 0x080d1b42 : { *(.text) } }\n')
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'candidate.ld'),str(obj),'-R',str(ROOT/'fireemblem8.elf'),'-o',str(OUT/'candidate.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
code=(OUT/'candidate.bin').read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert len(code)==10 and code==rom[start-0x08000000:start-0x08000000+10]
variants={'wrong-call':(source.replace('__div0','other'),()),'nonzero-result':(source.replace('return 0','return 1'),()),
 'store':(source.replace('__div0();','__div0(); *(volatile unsigned *)0x03001000 = 1;'),()),
 'extra-call':(source.replace('__div0();','__div0(); __div0();'),()),
 'arguments':(source.replace('runtime_divzero(void)','runtime_divzero(unsigned x)'),()),
 'arm-mode':(source,('-marm',)),'unwind':(source,('-funwind-tables',)),'debug':(source,('-g',))}
for name,(text,extra) in variants.items():
 res,_=compile_case(name,text,extra);assert res.returncode and 'division zero return requires' in res.stderr,(name,res.stderr)
plain=source.replace('__attribute__((matching_divzero_return))','')
a,left=compile_case('unannotated-plugin',plain);b,right=compile_case('unannotated-control',plain,plugin=False);assert a.returncode==b.returncode==0
blobs=[]
for path in (left,right):
 dest=path.with_suffix('.bin');subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(path),str(dest)],check=True);blobs.append(dest.read_bytes())
assert blobs[0]==blobs[1]
rng=random.Random(0xd170);cases=0
for flags in range(16):
 for seed in range(4):
  for sp in (0x03001000,0x03007000,0x03007f00):
   values=[rng.getrandbits(32) for _ in range(13)];records=[]
   for draft in (False,True):
    u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(0x08000000,len(rom));u.mem_write(0x08000000,rom);u.mem_map(0x03000000,0x8000)
    if draft:u.mem_write(start,code)
    u.reg_write(r.UC_ARM_REG_CPSR,0x3f|(flags<<28))
    for n,v in enumerate(values):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),v)
    u.reg_write(r.UC_ARM_REG_SP,sp);u.reg_write(r.UC_ARM_REG_LR,0x080ff001)
    state={'returned':False,'div0':0,'writes':[]}
    def hook(u,address,size,state):
     if address==0x080d1990:state['div0']+=1
     if address==0x080ff000:state['returned']=True;u.emu_stop()
    def write(u,access,address,size,value,state):state['writes'].append((address,size,value))
    u.hook_add(UC_HOOK_CODE,hook,state);u.hook_add(UC_HOOK_MEM_WRITE,write,state);u.emu_start(start|1,0,count=12)
    assert state['returned'] and state['div0']==1 and state['writes']==[(sp-4,4,0x080ff001)]
    regs=[u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(15)]
    assert regs[0]==0 and regs[1:13]==values[1:13] and regs[13]==sp and regs[14]==start+7
    assert u.reg_read(r.UC_ARM_REG_CPSR)==0x3f|(1<<30)|((flags&3)<<28)
    records.append((regs,u.reg_read(r.UC_ARM_REG_CPSR),state))
   assert records[0]==records[1];cases+=1
print(json.dumps(dict(exact_bytes=10,cases=cases,rejected_contracts=list(variants),unannotated_unchanged=True,source_sha256=hashlib.sha256(source.encode()).hexdigest(),plugin_sha256=hashlib.sha256(PLUGIN.read_bytes()).hexdigest(),production_integrated=False,scope='Isolated legacy zero path at original address, executing actual __div0. Checks registers, flags, one saved LR write and restored SP. Thumb return address only; full dispatcher and runtime integration remain pending.'),indent=2))
