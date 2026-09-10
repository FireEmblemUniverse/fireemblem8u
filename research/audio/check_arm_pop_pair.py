#!/usr/bin/env python3
"""Reject invalid private ARM two-word pop contracts."""
import argparse
from pathlib import Path
import subprocess
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/pop-pair-guards';out.mkdir(exist_ok=True)
    source=(ROOT/'src/m4a_stop.c').read_text()
    def compile_case(name,text,frame='pop2',extra=()):
        src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
        return subprocess.run([a.compiler,'-c',str(src),'-o',str(obj),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/arm_adjacent.so'),'-fplugin-arg-arm_adjacent-destination=SoundMainRAM_Partial','-fplugin-arg-arm_adjacent-transfer=branch','-fplugin-arg-arm_adjacent-sp-input='+frame,*extra],capture_output=True,text=True)
    result=compile_case('accepted',source);assert not result.returncode,result.stderr
    rejects=[('wrong_frame',source,'frame64',()),('wrong_step',source.replace('+ 8','+ 12'),'pop2',()),('reverse_registers',source.replace('asm("r4")','asm("r12")').replace('stopProduct asm("r12")','stopProduct asm("r4")'),'pop2',()),('wrong_offset',source.replace('stopFrame->savedProduct','stopFrame->mixer.samplesRemaining'),'pop2',()),('barrier',source.replace('    stopProduct =','    asm volatile("" ::: "memory");\n    stopProduct ='),'pop2',()),('extra_stack_read',source.replace('    stopRemaining = 0;', '    stopRemaining = stopFrame->mixer.samplesRemaining;'),'pop2',()),('missing_sp',source.replace('asm("sp")','asm("r8")'),'pop2',()),('debug',source,'pop2',('-g',)),('unwind',source,'pop2',('-funwind-tables',)),('thumb',source,'pop2',('-mthumb',))]
    for name,text,frame,extra in rejects:
        result=compile_case(name,text,frame,extra);assert result.returncode and 'ARM adjacent' in result.stderr,(name,result.stderr)
    print(f'Private pop-pair candidate accepted; {len(rejects)} invalid contracts rejected. Execution coverage: check_soundmain_stop.py.')
if __name__=='__main__':main()
