#!/usr/bin/env python3
"""Check private repeated-branch contract rejection boundaries."""
import argparse
from pathlib import Path
import subprocess
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/repeat-guards';out.mkdir(exist_ok=True)
    source=(ROOT/'src/m4a_wrap.c').read_text()
    def compile_case(name,text,transfer='branch',destination='SoundMainRAM_ResampleWrap',extra=()):
        src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
        command=[a.compiler,'-c',str(src),'-o',str(obj),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes']
        for plugin in ('signed_sum','arm_adjacent'):command+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend'/f'{plugin}.so')]
        command+=['-fplugin-arg-arm_adjacent-destination='+destination,'-fplugin-arg-arm_adjacent-early=SoundMainRAM_ResampleReload','-fplugin-arg-arm_adjacent-transfer='+transfer]
        return subprocess.run(command+list(extra),capture_output=True,text=True)
    result=compile_case('accepted',source);assert not result.returncode,result.stderr
    rejects=[('wrong_transfer',source,'invalid','SoundMainRAM_ResampleWrap',()),('wrong_destination',source,'branch','missing',()),('work_after_repeat',source.replace('    SoundMainRAM_ResampleWrap();','    SoundMainRAM_ResampleWrap(); wrapSkip++;'),'branch','SoundMainRAM_ResampleWrap',()),('work_after_reload',source.replace('SoundMainRAM_ResampleReload();','SoundMainRAM_ResampleReload(); wrapSkip++;'),'branch','SoundMainRAM_ResampleWrap',()),('extra_return',source.replace('    s64 total', '    if (wrapSkip == 7) return;\n    s64 total'),'branch','SoundMainRAM_ResampleWrap',()),('debug',source,'branch','SoundMainRAM_ResampleWrap',('-g',)),('unwind',source,'branch','SoundMainRAM_ResampleWrap',('-funwind-tables',)),('thumb',source,'branch','SoundMainRAM_ResampleWrap',('-mthumb',))]
    for name,text,transfer,target,extra in rejects:
        result=compile_case(name,text,transfer,target,extra);assert result.returncode,(name,'unexpected success')
        assert 'ARM adjacent' in result.stderr or 'initialize plugin' in result.stderr or (name=='thumb' and 'ARM mode' in result.stderr),(name,result.stderr)
    print(f'Repeated-branch candidate accepted; {len(rejects)} invalid contracts rejected. Execution coverage: check_soundmain_wrap.py.')
if __name__=='__main__':main()
