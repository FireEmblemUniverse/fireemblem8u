#!/usr/bin/env python3
"""Validate guarded signed-byte preincrement and conditional access behavior."""
import argparse
from pathlib import Path
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_READ
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--plugin',type=Path,required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/preincrement-guards';out.mkdir(exist_ok=True)
    attr='__attribute__((matching_byte_preincrement)) '
    head='register unsigned other asm("r1"); register volatile int value asm("r0"); register volatile signed char *volatile source asm("r3"); register volatile unsigned step asm("r9"); register unsigned condition asm("r2");\n'
    def compile_case(name,source,plugin=True,mode='-marm'):
        src=out/(name+'.c');obj=out/(name+'.o');src.write_text(source)
        result=subprocess.run([a.compiler,'-c','-O1',mode,'-mcpu=arm7tdmi','-mabi=apcs-gnu',*(['-fplugin='+str(a.plugin.resolve())] if plugin else []),str(src),'-o',str(obj)],capture_output=True,text=True)
        return result,obj
    def binary(obj):
        path=obj.with_suffix('.bin');subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(path)],check=True);return path.read_bytes()
    cases=0
    for name,body,offsets,conditions in [('immediate','value=*++source;',[1],[1]),('register','source+=step; value=*source;',[0,1,2,127,255,511,0xffffffff,0xffffff80],[1]),('conditional','if (condition) { source+=step; value=*source; }',[0,1,2,127,255,511,0xffffffff,0xffffff80],[0,1])]:
        source=head+attr+'void fixture(void) { '+body+' }\n'
        result,obj=compile_case(name,source);assert not result.returncode,result.stderr
        folded=binary(obj)
        result,obj=compile_case(name+'_baseline',source.replace(attr,''),False);assert not result.returncode,result.stderr
        baseline=binary(obj);assert len(baseline)-len(folded)==8,(name,baseline.hex(),folded.hex())
        machines=[]
        for code in (baseline,folded):
            uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x08000000,0x1000);uc.mem_write(0x08000000,code);uc.mem_map(0x02000000,0x2000)
            trace=[]
            def access(uc,kind,address,size,value,trace):trace.append((address,size,int.from_bytes(uc.mem_read(address,size),'little')))
            uc.hook_add(UC_HOOK_MEM_READ,access,trace,begin=0x02000000,end=0x02001fff);machines.append((uc,trace))
        for offset in offsets:
            address=(0x02000800+offset)&0xffffffff
            for condition in conditions:
                for byte in range(256):
                    for flags in range(16):
                        raw=bytearray([0xa5])*0x2000;raw[address-0x02000000]=byte
                        initial=[0x12340000+i for i in range(13)];initial[2]=condition;initial[3]=0x02000800;initial[9]=offset
                        snapshots=[]
                        for uc,trace in machines:
                            uc.mem_write(0x02000000,bytes(raw));trace.clear()
                            for i,value in enumerate(initial):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
                            uc.reg_write(r.UC_ARM_REG_CPSR,0x13|flags<<28);uc.reg_write(r.UC_ARM_REG_SP,0x02001800);uc.reg_write(r.UC_ARM_REG_LR,0x08000100)
                            uc.emu_start(0x08000000,0x08000100,count=20)
                            assert uc.reg_read(r.UC_ARM_REG_PC)==0x08000100
                            assert uc.reg_read(r.UC_ARM_REG_SP)==0x02001800 and uc.reg_read(r.UC_ARM_REG_LR)==0x08000100
                            active=name!='conditional' or condition
                            assert uc.reg_read(r.UC_ARM_REG_R0)==((byte if byte<128 else byte-256)&0xffffffff if active else initial[0])
                            assert uc.reg_read(r.UC_ARM_REG_R3)==(address if active else initial[3])
                            assert trace==([(address,1,byte)] if active else [])
                            assert bytes(uc.mem_read(0x02000000,len(raw)))==raw
                            snapshots.append(([uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)],uc.reg_read(r.UC_ARM_REG_CPSR),trace.copy()))
                        assert snapshots[0]==snapshots[1],(name,offset,condition)
                        cases+=1
    source=head+attr+'void fixture(void) { value=*++source; }\n'
    rejects=[('thumb',source,'-mthumb'),('unsigned',source.replace('signed char','unsigned char'),'-marm'),('word',source.replace('signed char','int'),'-marm'),('two',source.replace('*++source','*(source+=2)'),'-marm'),('decrement',source.replace('*++source','*--source'),'-marm'),('no_update',source.replace('*++source','*source'),'-marm'),('barrier',source.replace('value=*++source;','source++; asm volatile("" ::: "memory"); value=*source;'),'-marm'),('store',source.replace('value=*++source;','source++; *source=0; value=*source;'),'-marm')]
    for name,source,mode in rejects:
        result,_=compile_case('reject_'+name,source,True,mode);assert result.returncode and 'byte preincrement' in result.stderr,(name,result.stderr)
    plain=head+'void fixture(void) { value=*++source; }\n'
    result,obj=compile_case('plain',plain,False);assert not result.returncode;before=obj.read_bytes()
    result,obj=compile_case('plain',plain);assert not result.returncode and obj.read_bytes()==before
    print(f'{cases} baseline/folded executions pass; {len(rejects)} rejected forms; unannotated object unchanged.')
if __name__=='__main__':main()
