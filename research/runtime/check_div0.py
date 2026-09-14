#!/usr/bin/env python3
"""Verify the empty Thumb-only hook, all preserved state, and contract rejections."""
import hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division/div0-controls';OUT.mkdir(exist_ok=True)
source=(ROOT/'research/runtime/div0.c').read_text();plugin=OUT.parent/'empty_thumb_return.so'
base=[str(ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
def compile(name,text,flags):
 src=OUT/(name+'.c');src.write_text(text);asm=src.with_suffix('.s')
 result=subprocess.run([*base,*flags,str(src),'-o',str(asm)],capture_output=True,text=True)
 return result,asm
flags=['-fplugin='+str(plugin),'-DMATCHING_DIV0']
result,asm=compile('accepted',source,flags);assert not result.returncode,result.stderr
obj=asm.with_suffix('.o');blob=asm.with_suffix('.bin')
subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(blob)],check=True)
code=blob.read_bytes();assert code==(ROOT/'baserom.gba').read_bytes()[0xd1990:0xd1992] and len(code)==2
rng=random.Random(0xd190);cases=0
for flags_value in range(16):
 for seed in range(8):
  for sp in (0x03001000,0x03004000,0x03007000):
   u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(0x080d1000,0x1000);u.mem_map(0x080ff000,0x1000);u.mem_map(0x03000000,0x8000);u.mem_write(0x080d1990,code)
   initial=[rng.getrandbits(32) for _ in range(13)]+[sp,0x080ff001]
   cpsr=0x3f|(flags_value<<28);u.reg_write(r.UC_ARM_REG_CPSR,cpsr)
   for n,value in enumerate(initial):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),value)
   writes=[];returned=[]
   u.hook_add(UC_HOOK_MEM_WRITE,lambda u,a,addr,size,value,data:writes.append((addr,size,value)))
   def stop(u,addr,size,data):
    if addr==0x080ff000:returned.append(True);u.emu_stop()
   u.hook_add(UC_HOOK_CODE,stop);u.emu_start(0x080d1991,0,count=4)
   assert returned and not writes and u.reg_read(r.UC_ARM_REG_CPSR)==cpsr
   assert [u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(15)]==initial
   cases+=1
variants={'nonvoid':(source.replace('void runtime_div0(void) {}','unsigned runtime_div0(void) {return 0;}'),[]),'argument':(source.replace('runtime_div0(void)','runtime_div0(unsigned x)'),[]),'store':(source.replace('{}','{*(volatile unsigned*)0x03000000=0;}'),[]),'call':('extern void other(void);\n'+source.replace('{}','{other();}'),[]),'arm':(source,['-marm']),'debug':(source,['-g']),'unwind':(source,['-funwind-tables'])}
for name,(text,extra) in variants.items():
 result,_=compile(name,text,[*flags,*extra]);assert result.returncode,name
result,a=compile('plain',source,[]);assert not result.returncode
result,b=compile('unannotated',source,flags[:1]);assert not result.returncode
def body(p):return '\n'.join(x for x in p.read_text().splitlines() if '.file' not in x)
assert body(a)==body(b)
print(json.dumps(dict(exact_instruction_bytes=2,cases=cases,all_registers_flags_and_stack_preserved=True,rejected_contracts=list(variants),unannotated_unchanged=True,source_sha256=hashlib.sha256(source.encode()).hexdigest(),plugin_sha256=hashlib.sha256(plugin.read_bytes()).hexdigest(),production_integrated=False,scope='Thumb caller only; original MOV-PC return does not implement interworking.'),indent=2))
