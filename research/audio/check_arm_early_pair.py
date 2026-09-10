#!/usr/bin/env python3
"""Reject unsupported two-exit/private-LR shapes around fixed-rate setup."""
import argparse, subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/early-pair-guards';out.mkdir(exist_ok=True)
    source=(ROOT/'src/m4a_fixed_setup.c').read_text()
    def compile_case(name,text,target='SoundMainRAM_Short',lr='remainder',extra=()):
        src=out/(name+'.c');src.write_text(text)
        cmd=[a.compiler,'-c',str(src),'-o',str(src.with_suffix('.o')),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes']
        for plugin in ('subtract_compare','arm_adjacent'):cmd+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend'/f'{plugin}.so')]
        return subprocess.run(cmd+['-fplugin-arg-arm_adjacent-destination=SoundMainRAM_Packed','-fplugin-arg-arm_adjacent-early-pair='+target,'-fplugin-arg-arm_adjacent-lr-input='+lr,*extra],capture_output=True,text=True)
    result=compile_case('accepted',source);assert not result.returncode,result.stderr
    tests=[('wrong_early',source,'missing','remainder',()),('wrong_lr',source,'SoundMainRAM_Short','read-only',()),
           ('nonzero_assignment',source.replace('setupRemainder = 0;','setupRemainder = 1;'),'SoundMainRAM_Short','remainder',()),
           ('extra_assignment',source.replace('setupRemainder = 0;','setupRemainder = 0; setupRequested++;'),'SoundMainRAM_Short','remainder',()),
           ('extra_short_work',source.replace('SoundMainRAM_Short();','SoundMainRAM_Short(); setupCount++;'),'SoundMainRAM_Short','remainder',()),
           ('extra_packed_work',source.replace('SoundMainRAM_Packed();','SoundMainRAM_Packed(); setupCount++;'),'SoundMainRAM_Short','remainder',()),
           ('barrier',source.replace('setupRemainder = 0;','setupRemainder = 0; asm volatile("" ::: "memory");'),'SoundMainRAM_Short','remainder',()),
           ('wrong_lr_math',source.replace('setupRemainder -= setupRequested;','setupRemainder ^= setupRequested;'),'SoundMainRAM_Short','remainder',()),
           ('stack_write',source.replace('    previous = setupCount;', '    *(volatile u32 *)__builtin_frame_address(0) = setupCount;\n    previous = setupCount;'),'SoundMainRAM_Short','remainder',()),
           ('debug',source,'SoundMainRAM_Short','remainder',('-g',)),('unwind',source,'SoundMainRAM_Short','remainder',('-funwind-tables',)),('thumb',source,'SoundMainRAM_Short','remainder',('-mthumb',))]
    for name,text,target,lr,extra in tests:
        result=compile_case(name,text,target,lr,extra)
        assert result.returncode and ('ARM adjacent' in result.stderr or (name=='thumb' and 'ARM mode' in result.stderr)),(name,result.stderr)
    print(f'Two-exit candidate accepted; {len(tests)} invalid contracts rejected.')
if __name__=='__main__':main()
