#!/usr/bin/env python3
"""Check bounded Thumb countdown flags/fallthrough and reject unsafe contracts."""
import argparse, random, subprocess
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/shift-loop-guards';out.mkdir(exist_ok=True)
    text='''register volatile unsigned counter asm("r1");
register volatile unsigned result asm("r0");
__attribute__((matching_shift_carry, matching_shift_loop_fallthrough))
void fixture(void) {
 unsigned discarded=counter << 31; counter >>= 1;
 asm("" : "+r"(counter));
 if (__builtin_expect((int)discarded < 0,1)) result=counter;
 do { result=counter; counter-=1; } while ((int)counter>0);
}
'''
    def compile_case(name,source,extra=()):
        src=out/(name+'.c');src.write_text(source);obj=src.with_suffix('.o')
        args=[a.compiler,'-c','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/shift_carry.so')]
        return subprocess.run(args+list(extra)+[str(src),'-o',str(obj)],capture_output=True,text=True),obj
    result,obj=compile_case('valid',text);assert not result.returncode,result.stderr
    binary=obj.with_suffix('.bin');subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
    code=binary.read_bytes();assert code[-4:-2]==bytes.fromhex('0139') and code[-1]==0xdc,code.hex()
    assert bytes.fromhex('7047') not in code
    rng=random.Random(0x10af);values=list(range(256))+[0x7ffffffe,0x7fffffff]+[rng.getrandbits(31) for _ in range(256)];cases=0
    displacement=int.from_bytes(code[-2:-1],'little',signed=True)*2
    for base in (0x08001000,0x03002000):
        uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(base,0x1000);uc.mem_write(base,code)
        for value in values:
            for flags in range(16):
                regs=[0x12340000+i for i in range(13)];regs[1]=value;expected=regs.copy();expected[1]=(value-1)&0xffffffff
                for i,x in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),x)
                uc.reg_write(r.UC_ARM_REG_SP,0x02000800);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
                target=base+len(code)+(2+displacement if value>1 else 0)
                uc.emu_start((base+len(code)-4)|1,target,count=2)
                assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected
                assert uc.reg_read(r.UC_ARM_REG_PC)==target and uc.reg_read(r.UC_ARM_REG_SP)==0x02000800 and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef
                outflags=8 if value==0 else 6 if value==1 else 2
                assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|outflags<<28
                cases+=1
    tests=[
      ('no_base_contract',text.replace('matching_shift_carry, ',''),()),
      ('counter_body_write',text.replace('do { result=counter;', 'do { counter+=result; result=counter;'),()),
      ('counter_unbounded',text.replace('do {', 'counter=result; do {'),()),
      ('decrement_two',text.replace('counter-=1','counter-=2'),()),
      ('wrong_condition',text.replace('(int)counter>0','(int)counter!=0'),()),
      ('call',text.replace('do {', 'do { extern void outside(void); outside();'),()),
      ('stack_access',text.replace('do {','volatile unsigned local=counter; do { result=local;'),()),
      ('arguments',text.replace('fixture(void)','fixture(unsigned input)'),()),
      ('nonvoid',text.replace('void fixture','unsigned fixture').replace('\n}', '\nreturn result;\n}'),()),
      ('debug',text,('-g',)),('unwind',text,('-funwind-tables',)),
      ('executable_asm',text.replace('do {','do { asm volatile("nop");'),()),
    ]
    for name,source,extra in tests:
        result,_=compile_case(name,source,extra)
        assert result.returncode and ('shift loop' in result.stderr or 'shift carry' in result.stderr),(name,result.stderr)
    print(f'{cases} countdown boundary executions pass for zero, positive bounds and all NZCV in ROM/RAM; {len(tests)} unsafe contracts reject.')
if __name__=='__main__':main()
