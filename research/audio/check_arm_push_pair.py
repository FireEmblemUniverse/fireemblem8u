#!/usr/bin/env python3
"""Reject invalid private push-pair and LR word-load contracts."""
import argparse, subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/push-pair-guards';out.mkdir(exist_ok=True)
    source=(ROOT/'src/m4a_resample_setup.c').read_text()
    def compile_case(name,text,sp='push2',lr='load-word',extra=()):
        src=out/(name+'.c');src.write_text(text)
        cmd=[a.compiler,'-c',str(src),'-o',str(src.with_suffix('.o')),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes']
        for plugin in ('byte_preincrement','arm_adjacent'):cmd+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend'/f'{plugin}.so')]
        return subprocess.run(cmd+['-fplugin-arg-arm_adjacent-destination=SoundMainRAM_Resample','-fplugin-arg-arm_adjacent-sp-input='+sp,'-fplugin-arg-arm_adjacent-lr-input='+lr,*extra],capture_output=True,text=True)
    result=compile_case('accepted',source);assert not result.returncode,result.stderr
    tests=[('wrong_step',source.replace('- 8','- 12'),'push2','load-word',()),
           ('wrong_offset',source.replace('setupFrame->savedProduct','setupFrame->mixer.samplesRemaining'),'push2','load-word',()),
           ('reverse_registers',source.replace('setupChannel asm("r4")','setupChannel asm("r12")').replace('setupProduct asm("r12")','setupProduct asm("r4")'),'push2','load-word',()),
           ('barrier',source.replace('    setupFrame->savedProduct','    asm volatile("" ::: "memory");\n    setupFrame->savedProduct'),'push2','load-word',()),
           ('extra_stack',source.replace('    setupCurrent = *setupSource;', '    setupCurrent = setupFrame->savedProduct;\n    setupCurrent = *setupSource;'),'push2','load-word',()),
           ('extra_lr_load',source.replace('    setupCurrent = *setupSource;', '    setupFraction = ((volatile struct SoundChannel *)setupChannel)->fw;\n    setupCurrent = *setupSource;'),'push2','load-word',()),
           ('lr_arithmetic',source.replace('    setupCurrent = *setupSource;', '    setupFraction++;\n    setupCurrent = *setupSource;'),'push2','load-word',()),
           ('lr_no_load',source.replace('((volatile struct SoundChannel *)setupChannel)->fw','setupProduct'),'push2','load-word',()),
           ('read_only_lr',source,'push2','read-only',()),('wrong_frame',source,'pop2','load-word',()),
           ('debug',source,'push2','load-word',('-g',)),('unwind',source,'push2','load-word',('-funwind-tables',)),('thumb',source,'push2','load-word',('-mthumb',))]
    for name,text,sp,lr,extra in tests:
        result=compile_case(name,text,sp,lr,extra)
        assert result.returncode and ('ARM adjacent' in result.stderr or (name=='thumb' and 'ARM mode' in result.stderr)),(name,result.stderr)
    print(f'Push/LR candidate accepted; {len(tests)} invalid contracts rejected.')
if __name__=='__main__':main()
