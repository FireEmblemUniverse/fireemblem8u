#!/usr/bin/env python3
"""Check both carry polarities through the private early-exit contract."""
import argparse
from pathlib import Path
import random
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/carry-early-guards';out.mkdir(exist_ok=True)
    source=(ROOT/'src/m4a_fixed_lane.c').read_text()
    def compile_case(name,text,extra=()):
        src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
        command=[a.compiler,'-c',str(src),'-o',str(obj),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/add_carry.so'),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/arm_adjacent.so'),'-fplugin-arg-arm_adjacent-destination=SoundMainRAM_FixedWordFinish','-fplugin-arg-arm_adjacent-early=SoundMainRAM_ShortMix',*extra]
        return subprocess.run(command,capture_output=True,text=True),obj
    rng=random.Random(0xca44);values=[0,1,0x3fffffff,0x40000000,0x7fffffff,0x80000000,0xbfffffff,0xc0000000,0xffffffff]+[rng.getrandbits(32) for _ in range(64)]
    cases=0
    for reverse in (False,True):
        result,obj=compile_case('set' if reverse else 'clear',source.replace('if (!carry)','if (carry)') if reverse else source);assert not result.returncode,result.stderr
        elf=obj.with_suffix('.elf');binary=obj.with_suffix('.bin')
        subprocess.run(['arm-none-eabi-ld','-Ttext=0x08001000','--entry=SoundMainRAM_ShortCount','--defsym=SoundMainRAM_ShortMix=0x08001100','--defsym=SoundMainRAM_FixedWordFinish=0x08001008',str(obj),'-o',str(elf)],check=True)
        subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
        code=binary.read_bytes();assert len(code)==8 and (code[7]>>4)==(2 if reverse else 3),code.hex()
        for base in (0x08001000,0x03002000):
            uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(base,0x1000);uc.mem_write(base,code)
            for value in values:
                answer=(value+0x40000000)&0xffffffff;carry=value>=0xc0000000;overflow=bool((~(value^0x40000000)&(value^answer))&0x80000000)
                outflags=((answer>>31)<<3)|((answer==0)<<2)|(carry<<1)|overflow
                target=base+(256 if (carry if reverse else not carry) else 8)
                for flags in range(16):
                    regs=[0x12340000+i for i in range(13)];regs[5]=value;expected=regs.copy();expected[5]=answer
                    for i,x in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),x)
                    uc.reg_write(r.UC_ARM_REG_SP,0x02000800);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x13|flags<<28)
                    uc.emu_start(base,target,count=3)
                    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected
                    assert uc.reg_read(r.UC_ARM_REG_PC)==target and uc.reg_read(r.UC_ARM_REG_CPSR)==0x13|outflags<<28
                    assert uc.reg_read(r.UC_ARM_REG_SP)==0x02000800 and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef
                    cases+=1
    rejects=[('after_call',source.replace('        SoundMainRAM_ShortMix();','        SoundMainRAM_ShortMix(); laneOutput++;'),()),('extra_return',source.replace('    u32 next;','    u32 next; if(laneOutput == 7) return;'),()),('debug',source,('-g',)),('unwind',source,('-funwind-tables',))]
    for name,text,extra in rejects:
        result,_=compile_case(name,text,extra)
        # The extra return breaks the carry pattern before the adjacent pass runs.
        diagnostic = 'add carry found no eligible sequence' if name == 'extra_return' else 'ARM adjacent'
        assert result.returncode and diagnostic in result.stderr,(name,result.stderr)
    print(f'{cases} carry-set/clear early-transfer executions pass in ROM/copied code; {len(rejects)} invalid contracts rejected.')
if __name__=='__main__':main()
