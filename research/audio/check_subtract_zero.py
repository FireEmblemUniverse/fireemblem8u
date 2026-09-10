#!/usr/bin/env python3
"""Check tied decrement folding, exact SUBS flags and equality-only guards."""
import argparse
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--plugin',type=Path,required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/subtract-zero-guards';out.mkdir(exist_ok=True)
    attr='__attribute__((matching_subtract_zero)) '
    source='register unsigned count asm("r9"); register volatile unsigned value asm("r0"); register unsigned other asm("r1");\n'+attr+'void fixture(void) { count--; asm("" : "+r"(count)); if(count==0) value+=other; else value-=other; }\n'
    def compile_case(name,text,plugin=True,mode='-marm'):
        src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
        result=subprocess.run([a.compiler,'-c','-O1',mode,'-mcpu=arm7tdmi','-mabi=apcs-gnu',*(['-fplugin='+str(a.plugin.resolve())] if plugin else []),str(src),'-o',str(obj)],capture_output=True,text=True)
        return result,obj
    def binary(obj):
        path=obj.with_suffix('.bin');subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(path)],check=True);return path.read_bytes()
    result,obj=compile_case('folded',source);assert not result.returncode,result.stderr
    code=binary(obj);assert code[:4]==struct.pack('<I',0xe2599001),code.hex()
    result,obj=compile_case('baseline',source.replace(attr,''),False);assert not result.returncode,result.stderr
    baseline=binary(obj);assert len(baseline)==len(code)+4,(code.hex(),baseline.hex())
    machines=[]
    for data in (baseline,code):
        uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x08000000,0x1000);uc.mem_write(0x08000000,data);machines.append(uc)
    rng=random.Random(0xfe800);values=list(range(256))+[0x7ffffffe,0x7fffffff,0x80000000,0x80000001,0xfffffffe,0xffffffff]+[rng.getrandbits(32) for _ in range(256)]
    cases=0
    for count in values:
        for flags in range(16):
            for thumb in (0,1):
                initial=[rng.getrandbits(32) for _ in range(13)];initial[9]=count
                answer=(count-1)&0xffffffff;expected=initial.copy();expected[9]=answer
                expected[0]=(initial[0]+initial[1] if answer==0 else initial[0]-initial[1])&0xffffffff
                for folded,uc in enumerate(machines):
                    for i,value in enumerate(initial):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
                    uc.reg_write(r.UC_ARM_REG_CPSR,0x13|flags<<28);uc.reg_write(r.UC_ARM_REG_SP,0x02000800);uc.reg_write(r.UC_ARM_REG_LR,0x08000100|thumb)
                    uc.emu_start(0x08000000,0x08000100,count=10)
                    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected
                    expected_flags=((answer>>31)<<3)|((answer==0)<<2)|((count>=1)<<1)|(((count^1)&(count^answer))>>31) if folded else ((answer>>31)<<3)|((answer==0)<<2)|2
                    assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x13|(thumb<<5)|(expected_flags<<28)
                    assert uc.reg_read(r.UC_ARM_REG_SP)==0x02000800 and uc.reg_read(r.UC_ARM_REG_LR)==0x08000100|thumb
                    assert uc.reg_read(r.UC_ARM_REG_PC)==0x08000100
                cases+=1
    rejects=[('thumb',source,'-mthumb'),('signed_condition',source.replace('count==0','(int)count>0'),'-marm'),('wrong_comparison',source.replace('count==0','count==2'),'-marm'),('step_two',source.replace('count--;','count-=2;'),'-marm'),('missing_tie',source.replace('asm("" : "+r"(count));',''),'-marm'),('nonidentity',source.replace('"+r"','"=r"'),'-marm'),('barrier',source.replace('count--;','count--; asm volatile("" ::: "memory");'),'-marm'),('flags_asm',source.replace('if(count==0)','asm volatile("mrs r2, cpsr" ::: "r2"); if(count==0)'),'-marm')]
    for name,text,mode in rejects:
        result,_=compile_case('reject_'+name,text,True,mode);assert result.returncode and 'subtract zero' in result.stderr,(name,result.stderr)
    plain=source.replace(attr,'');result,obj=compile_case('plain',plain,False);assert not result.returncode;before=obj.read_bytes()
    result,obj=compile_case('plain',plain);assert not result.returncode and obj.read_bytes()==before
    print(f'{cases} baseline/folded executions pass; {len(rejects)} rejected forms; unannotated object unchanged.')
if __name__=='__main__':main()
