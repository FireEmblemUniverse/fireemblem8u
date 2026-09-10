#!/usr/bin/env python3
"""Verify opt-in Thumb single-word writeback and its preserved flags."""
import argparse, random, subprocess
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--plugin',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/thumb-word-guards';out.mkdir(exist_ok=True)
    attr='__attribute__((matching_thumb_word_postincrement)) '
    source='register unsigned value asm("r0"); register unsigned dest asm("r5");\n'+attr+'void fixture(void) { *(volatile unsigned *)dest = value; dest += 4; asm("" : "+r"(dest)); }\n'
    def compile_case(name,text,mode='-mthumb',plugin=True):
        src=out/(name+'.c');src.write_text(text);obj=src.with_suffix('.o')
        result=subprocess.run([a.compiler,'-c','-O1',mode,'-mcpu=arm7tdmi','-mabi=apcs-gnu','-Werror=attributes',*(['-fplugin='+str(Path(a.plugin).resolve())] if plugin else []),str(src),'-o',str(obj)],capture_output=True,text=True)
        return result,obj
    rng=random.Random(0x57a);values=[n*0x01010101 for n in range(256)]+[rng.getrandbits(32) for _ in range(128)]
    cases=0
    for base,value_reg in ((5,0),(6,0),(0,3),(1,7)):
        text=source.replace('value asm("r0")',f'value asm("r{value_reg}")').replace('dest asm("r5")',f'dest asm("r{base}")')
        result,obj=compile_case(f'pair-{base}-{value_reg}',text);assert not result.returncode,result.stderr
        binary=obj.with_suffix('.bin');subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
        code=binary.read_bytes();assert code==(0xc000|(base<<8)|(1<<value_reg)).to_bytes(2,'little')+b'\x70\x47',code.hex()
        uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000);uc.mem_write(0x08000000,code);uc.mem_map(0x02000000,0x1000);uc.mem_map(0x03000000,0x8000)
        trace=[];uc.hook_add(UC_HOOK_MEM_WRITE,lambda u,k,addr,size,val,t:t.append((addr,size,val)),trace)
        for value in values:
            for address in (0x02000000,0x02000ffc,0x03007000):
                for flags in range(16):
                    for thumb in (False,True):
                        initial=[0x12340000+i for i in range(13)];initial[base]=address;initial[value_reg]=value;expected=initial.copy();expected[base]+=4
                        uc.mem_write(address-0 if address==0x02000000 else address-4,bytes([0xa5])*(8 if address in (0x02000000,0x02000ffc) else 12));trace.clear()
                        for i,x in enumerate(initial):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),x)
                        lr=0x08000100|thumb;uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,lr);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
                        uc.emu_start(0x08000001,0x08000100,count=3)
                        assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected
                        assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000 and uc.reg_read(r.UC_ARM_REG_LR)==lr
                        assert uc.reg_read(r.UC_ARM_REG_CPSR)==(0x33 if thumb else 0x13)|flags<<28
                        assert uc.reg_read(r.UC_ARM_REG_PC)==0x08000100 and trace==[(address,4,value)]
                        assert int.from_bytes(uc.mem_read(address,4),'little')==value
                        cases+=1
    tests=[('arm',source,'-marm'),('high_base',source.replace('dest asm("r5")','dest asm("r8")'),'-mthumb'),('wrong_step',source.replace('+= 4','+= 8'),'-mthumb'),('byte',source.replace('volatile unsigned *','volatile unsigned char *'),'-mthumb'),('barrier',source.replace('dest += 4','asm volatile("" ::: "memory"); dest += 4'),'-mthumb'),('both_modes',source.replace('matching_thumb_word_postincrement','matching_thumb_word_postincrement,matching_word_postincrement'),'-mthumb')]
    for name,text,mode in tests:
        result,_=compile_case(name,text,mode);assert result.returncode and 'word postincrement' in result.stderr,(name,result.stderr)
    # A high C binding may be copied into a valid low-register RTL operand.
    result,obj=compile_case('high_value',source.replace('value asm("r0")','value asm("r8")'));assert not result.returncode,result.stderr
    binary=obj.with_suffix('.bin');subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
    assert binary.read_bytes()==bytes.fromhex('434608c57047')
    plain=source.replace(attr,'');result,obj=compile_case('plain',plain,plugin=False);assert not result.returncode
    baseline=obj.read_bytes();result,obj=compile_case('plain',plain,plugin=True);assert not result.returncode and obj.read_bytes()==baseline
    print(f'{cases} Thumb writeback executions pass; {len(tests)} invalid forms reject; unannotated object unchanged.')
if __name__=='__main__':main()
