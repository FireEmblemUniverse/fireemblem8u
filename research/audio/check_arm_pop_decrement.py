#!/usr/bin/env python3
"""Reject invalid source-decrement/two-word restore contracts."""
import argparse, subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/pop-decrement-guards';out.mkdir(exist_ok=True)
    source=(ROOT/'src/m4a_resample_finish.c').read_text()
    def compile_case(name,text,frame='pop2-decrement',extra=()):
        src=out/(name+'.c');src.write_text(text)
        return subprocess.run([a.compiler,'-c',str(src),'-o',str(src.with_suffix('.o')),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/arm_adjacent.so'),'-fplugin-arg-arm_adjacent-destination=SoundMainRAM_SaveResampled','-fplugin-arg-arm_adjacent-sp-input='+frame,*extra],capture_output=True,text=True)
    result=compile_case('accepted',source);assert not result.returncode,result.stderr
    tests=[('wrong_decrement',source.replace('-= 1','-= 2'),'pop2-decrement',()),
           ('missing_decrement',source.replace('    finishSource -= 1;\n',''),'pop2-decrement',()),
           ('barrier',source.replace('    finishChannel =','    asm volatile("" ::: "memory");\n    finishChannel ='),'pop2-decrement',()),
           ('wrong_step',source.replace('+ 8','+ 12'),'pop2-decrement',()),
           ('wrong_offset',source.replace('finishFrame->savedProduct','finishFrame->mixer.samplesRemaining'),'pop2-decrement',()),
           ('extra_stack',source.replace('    SoundMainRAM_SaveResampled();','    finishSource = finishFrame->savedProduct;\n    SoundMainRAM_SaveResampled();'),'pop2-decrement',()),
           ('wrong_mode',source,'pop2',()),('debug',source,'pop2-decrement',('-g',)),('unwind',source,'pop2-decrement',('-funwind-tables',)),('thumb',source,'pop2-decrement',('-mthumb',))]
    for name,text,frame,extra in tests:
        result=compile_case(name,text,frame,extra);assert result.returncode and 'ARM adjacent' in result.stderr,(name,result.stderr)
    print(f'Decrement/restore candidate accepted; {len(tests)} invalid contracts rejected.')
if __name__=='__main__':main()
