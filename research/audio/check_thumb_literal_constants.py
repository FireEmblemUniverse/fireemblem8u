#!/usr/bin/env python3
"""Verify literal loads preserve flags and reject unsupported explicit contracts."""
import argparse,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/literal-constants';out.mkdir(exist_ok=True);attr='__attribute__((matching_thumb_literal_constants)) '
 def compile(name,source,values=('1584',),plugin=True,mode='-mthumb'):
  src=out/(name+'.c');obj=out/(name+'.o');src.write_text(source)
  cmd=[a.compiler,'-c','-O1',mode,'-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes']
  if plugin:cmd+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_literal_constants.so')]+['-fplugin-arg-thumb_literal_constants-value='+value for value in values]
  result=subprocess.run(cmd+[str(src),'-o',str(obj)],capture_output=True,text=True);return result,obj
 def fixture(value):return 'register volatile unsigned result asm("r0"); '+attr+f'void fixture(void) {{ result = {value}u; asm("" : "+r"(result)); }}'
 cases=0
 for value in (0,1,255,256,848,1584,0x7fffffff):
  result,obj=compile('positive',fixture(value),values=(str(value),));assert not result.returncode,result.stderr
  binary=obj.with_suffix('.bin');subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True);code=binary.read_bytes();assert code[:2]==bytes.fromhex('0048') and code[2:4]==bytes.fromhex('7047') and len(code)==8
  for base in (0x08001000,0x03002000):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(base,0x1000);uc.mem_write(base,code)
   for flags in range(16):
    regs=[0xa9870000+i for i in range(13)];wanted=regs.copy();wanted[0]=value
    for i,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),v)
    uc.reg_write(r.UC_ARM_REG_SP,0x02001000);uc.reg_write(r.UC_ARM_REG_LR,base+0x101);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
    uc.emu_start(base|1,base+0x100,count=3)
    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==wanted
    assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
    assert uc.reg_read(r.UC_ARM_REG_SP)==0x02001000 and uc.reg_read(r.UC_ARM_REG_LR)==base+0x101 and uc.reg_read(r.UC_ARM_REG_PC)==base+0x100
    cases+=1
 source=fixture(1584)
 negatives=[('already_lowered',attr+'unsigned fixture(void) { return 256u; }',{'values':('256',)}),('absent',source.replace('1584u','7u'),{}),('arm',source,{'mode':'-marm'}),('missing_option',source,{'values':()}),('duplicate',source,{'values':('1584','1584')}),('negative',source,{'values':('-1',)}),('too_large',source,{'values':('2147483648',)}),('malformed',source,{'values':('1584x',)}),('unused_second',source,{'values':('1584','848')})]
 for name,text,options in negatives:
  result,_=compile(name,text,**options);assert result.returncode,(name,result.stderr)
 plain=source.replace(attr,'');result,obj=compile('plain',plain,plugin=False);assert not result.returncode,result.stderr
 before=obj.read_bytes();result,obj=compile('plain',plain);assert not result.returncode and obj.read_bytes()==before,result.stderr
 print(f'{cases} literal return executions pass; nine invalid contracts reject; unannotated output unchanged.')
if __name__=='__main__':main()
