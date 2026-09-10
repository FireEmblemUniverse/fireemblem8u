#!/usr/bin/env python3
"""Reject invalid private early-exit/frame contracts around the matching candidate."""
import argparse
from pathlib import Path
import subprocess
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/early-guards';out.mkdir(exist_ok=True)
    source=(ROOT/'src/m4a_advance.c').read_text()
    def compile_case(name,text,early='SoundMainRAM_ResampleLoop',lr='masked',extra=()):
        src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
        command=[a.compiler,'-c',str(src),'-o',str(obj),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes']
        for plugin in ('arm_adjacent','subtract_compare','byte_preincrement','subtract_zero'):command+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend'/f'{plugin}.so')]
        command+=['-fplugin-arg-arm_adjacent-destination=SoundMainRAM_ResampleNoAdvance','-fplugin-arg-arm_adjacent-lr-input='+lr]
        if early:command+=['-fplugin-arg-arm_adjacent-early='+early]
        return subprocess.run(command+list(extra),capture_output=True,text=True)
    result=compile_case('accepted',source);assert not result.returncode,result.stderr
    rejects=[('missing_option',source,None,'masked',()),('wrong_target',source,'missing','masked',()),('same_target',source,'SoundMainRAM_ResampleNoAdvance','masked',()),('wrong_lr_contract',source,'SoundMainRAM_ResampleLoop','read-only',()),('wrong_mask',source.replace('~0x3F800000u','~0x00800000u'),'SoundMainRAM_ResampleLoop','masked',()),('assign_lr',source.replace('advanceFraction &= ~0x3F800000u;','advanceFraction = advanceRemaining;'),'SoundMainRAM_ResampleLoop','masked',()),('early_work_after_call',source.replace('SoundMainRAM_ResampleLoop();','SoundMainRAM_ResampleLoop(); advanceCurrent++;'),'SoundMainRAM_ResampleLoop','masked',()),('work_after_adjacent',source.replace('    SoundMainRAM_ResampleNoAdvance();','    SoundMainRAM_ResampleNoAdvance(); advanceCurrent++;'),'SoundMainRAM_ResampleLoop','masked',()),('extra_return',source.replace('    u32 previous;','    u32 previous; if (advanceCurrent == 7) return;'),'SoundMainRAM_ResampleLoop','masked',()),('debug',source,'SoundMainRAM_ResampleLoop','masked',('-g',)),('unwind',source,'SoundMainRAM_ResampleLoop','masked',('-funwind-tables',)),('thumb',source,'SoundMainRAM_ResampleLoop','masked',('-mthumb',))]
    for name,text,early,lr,extra in rejects:
        result=compile_case(name,text,early,lr,extra)
        assert result.returncode,(name,'unexpected success')
        assert 'ARM adjacent' in result.stderr or 'initialize plugin' in result.stderr or (name=='thumb' and 'ARM mode' in result.stderr),(name,result.stderr)
    print(f'Matching early-exit candidate compiles; {len(rejects)} invalid contracts rejected. Execution coverage: check_soundmain_advance.py.')
if __name__=='__main__':main()
