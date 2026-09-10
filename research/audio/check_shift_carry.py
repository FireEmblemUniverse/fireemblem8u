#!/usr/bin/env python3
"""Check retained right shifts and discarded-bit branches, including all NZCV."""
import argparse, random, subprocess
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/shift-carry-guards';out.mkdir(exist_ok=True)
    attr='__attribute__((matching_shift_carry)) '
    def source(n,reverse=False):
        compare='>= 0' if reverse else '< 0'
        return 'register unsigned counter asm("r1"); register unsigned result asm("r0");\n'+attr+f'void fixture(void) {{ unsigned discarded=counter << {32-n}; counter >>= {n}; asm("" : "+r"(counter)); if (__builtin_expect((int)discarded {compare},1)) result=counter; }}\n'
    def compile_case(name,text,extra=(),plugin=True):
        src=out/(name+'.c');src.write_text(text);obj=src.with_suffix('.o')
        args=[a.compiler,'-c','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-Werror=attributes']
        if plugin:args+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/shift_carry.so')]
        return subprocess.run(args+list(extra)+[str(src),'-o',str(obj)],capture_output=True,text=True),obj
    rng=random.Random(0xca221);cases=0
    for n in range(1,32):
        values=[0,1,0xffffffff,0x80000000,(1<<(n-1))-1,1<<(n-1),1<<n]+[rng.getrandbits(32) for _ in range(64)]
        for reverse in (False,True):
            result,obj=compile_case(f'shift-{n}-{int(reverse)}',source(n,reverse));assert not result.returncode,result.stderr
            binary=obj.with_suffix('.bin');subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
            code=binary.read_bytes();assert code[:2]==(0x0800|(n<<6)|9).to_bytes(2,'little') and code[3]==(0xd2 if reverse else 0xd3),code.hex()
            assert len(code)==8 and code[4:]==bytes.fromhex('08007047'),code.hex()
            for base in (0x08001000,0x03002000):
                uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(base,0x1000);uc.mem_write(base,code)
                for value in values:
                    shifted=value>>n;carry=(value>>(n-1))&1;skip=carry if reverse else not carry
                    target=base+(6 if skip else 4)
                    for flags in range(16):
                        regs=[0x12340000+i for i in range(13)];regs[1]=value;expected=regs.copy();expected[1]=shifted
                        for i,x in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),x)
                        uc.reg_write(r.UC_ARM_REG_SP,0x02000800);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
                        uc.emu_start(base|1,target,count=2)
                        assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected
                        assert uc.reg_read(r.UC_ARM_REG_PC)==target and uc.reg_read(r.UC_ARM_REG_SP)==0x02000800 and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef
                        outflags=((shifted==0)<<2)|(carry<<1)|(flags&1)
                        assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|outflags<<28
                        cases+=1
    text=source(3)
    tests=[('wrong_bit',text.replace('<< 29','<< 28'),()),('wrong_shift',text.replace('>>= 3','>>= 2'),()),('missing_tie',text.replace('asm("" : "+r"(counter));',''),()),('extra_work',text.replace('if (__builtin_expect','result++; if (__builtin_expect'),()),('live_copy',text.replace('result=counter','result=discarded'),()),('high_counter',text.replace('counter asm("r1")','counter asm("r8")'),()),('shift32',source(32),()),('arm',text,('-marm',)),('long_target',text.replace('result=counter;', '{ asm volatile(".rept 160; nop; .endr"); result=counter; }'),())]
    for name,text,extra in tests:
        result,_=compile_case(name,text,extra);assert result.returncode and 'shift carry' in result.stderr,(name,result.stderr)
    plain=source(3).replace(attr,'');result,obj=compile_case('plain',plain,plugin=False);assert not result.returncode
    baseline=obj.read_bytes();result,obj=compile_case('plain',plain);assert not result.returncode and obj.read_bytes()==baseline
    print(f'{cases} shift/carry executions pass across 31 shifts, two polarities and ROM/RAM; {len(tests)} invalid forms reject; unannotated object unchanged.')
if __name__=='__main__':main()
