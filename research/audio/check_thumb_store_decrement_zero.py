#!/usr/bin/env python3
"""Check full-width decrement/store/zero semantics and reject unsafe folds."""
import argparse, json, random, subprocess
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/store-decrement-zero-guards';out.mkdir(parents=True,exist_ok=True)
    attr='__attribute__((matching_thumb_store_decrement_zero)) '
    source='''register volatile unsigned value asm("r0");
register volatile unsigned result asm("r1");
register volatile unsigned char *buffer asm("r4");
extern void done(void);
ATTR__attribute__((matching_tail_transfer)) void fixture(void) {
 value-=1; asm("" : "+r"(value)); buffer[16]=value;
 if (value==0) result=11; else result=22;
 done();
}
'''.replace('ATTR',attr)
    def compile_case(text,plugin=True,mode='-mthumb'):
        src=out/'fixture.c';obj=out/'fixture.o';src.write_text(text)
        command=[a.compiler,'-c','-O1','-fno-reorder-blocks','-fno-if-conversion','-fno-if-conversion2',mode,'-mcpu=arm7tdmi','-mabi=apcs-gnu',
                 '-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),
                 '-fplugin-arg-tail_transfer-destination=done',
                 '-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches']
        if plugin:command+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_store_decrement_zero.so')]
        result=subprocess.run(command+[str(src),'-o',str(obj)],capture_output=True,text=True)
        return result,obj
    for inverted in (False,True):
        result,obj=compile_case(source if not inverted else source.replace("value==0", "value!=0"));assert result.returncode==0,result.stderr
        script=out/'candidate.ld';script.write_text('SECTIONS { .text 0x08000000 : { *(.text) } done = 0x08000100; }')
        elf=out/'candidate.elf';binary=out/'candidate.bin'
        subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True)
        subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
        code=binary.read_bytes();assert code[:4]==bytes.fromhex('01382074'),code.hex()
        uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000);uc.mem_write(0x08000000,code);uc.mem_map(0x02000000,0x1000)
        rng=random.Random(0xfe800dec);values=list(range(256))+[0x7fffffff,0x80000000,0x80000001,0xfffffffe,0xffffffff]+[rng.getrandbits(32) for _ in range(256)]
        for value in values:
            for flags in range(16):
                regs=[rng.getrandbits(32) for _ in range(13)];regs[0]=value;regs[4]=0x02000100
                memory=bytearray([0xa5])*0x1000;uc.mem_write(0x02000000,bytes(memory))
                uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
                for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
                uc.reg_write(r.UC_ARM_REG_SP,0x02000800);uc.reg_write(r.UC_ARM_REG_LR,0x12345679)
                uc.emu_start(0x08000001,0x08000100,count=20)
                answer=(value-1)&0xffffffff;regs[0]=answer;regs[1]=11 if ((answer==0) != inverted) else 22
                memory[0x110]=answer&255
                assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==regs
                assert bytes(uc.mem_read(0x02000000,0x1000))==memory
                # Final MOVS has N=Z=0, preserving the SUBS carry/overflow.
                cv=((value>=1)<<1)|(((value^1)&(value^answer))>>31)
                assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|cv<<28,(value,flags)
                assert uc.reg_read(r.UC_ARM_REG_SP)==0x02000800 and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
                assert uc.reg_read(r.UC_ARM_REG_PC)==0x08000100
    rejects=[('step_two',source.replace('value-=1','value-=2')),
             ('signed_branch',source.replace('value==0','(int)value>0')),
             ('nonzero_compare',source.replace('value==0','value==2')),
             ('word_store',source.replace('unsigned char *buffer','unsigned *buffer')),
             ('large_offset',source.replace('buffer[16]','buffer[32]')),
             ('different_stored_value',source.replace('buffer[16]=value','buffer[16]=result')),
             ('intervening_write',source.replace('if (value==0)','buffer[1]=7; if (value==0)')),
             ('no_tail',source.replace('__attribute__((matching_tail_transfer))',''))]
    for name,text in rejects:
        result,_=compile_case(text);assert result.returncode and ('decrement/store' in result.stderr or 'tail' in result.stderr),(name,result.stderr)
    plain=source.replace(attr,'');result,obj=compile_case(plain,False);assert not result.returncode,result.stderr
    before=obj.read_bytes();result,obj=compile_case(plain);assert not result.returncode and obj.read_bytes()==before,result.stderr
    report=dict(executions=len(values)*32,rejected_forms=len(rejects),unannotated_unchanged=True,
                scope='Full-width values including zero, signed overflow and random words, every initial NZCV, exact registers/RAM/SP/LR and SUBS flags preserved by final MOVS.')
    (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
