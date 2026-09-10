#!/usr/bin/env python3
"""Reject invalid incoming-stack word-store contracts."""
import argparse, subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/store0-guards';out.mkdir(exist_ok=True)
    source=(ROOT/'src/m4a_sample_entry.c').read_text()
    def compile_case(name,text,frame='store0',extra=()):
        src=out/(name+'.c');src.write_text(text)
        return subprocess.run([a.compiler,'-c',str(src),'-o',str(src.with_suffix('.o')),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/arm_adjacent.so'),'-fplugin-arg-arm_adjacent-destination=SoundMainRAM_FixedSetup','-fplugin-arg-arm_adjacent-early=SoundMainRAM_ResampleSetup','-fplugin-arg-arm_adjacent-sp-input='+frame,*extra],capture_output=True,text=True)
    result=compile_case('accepted',source);assert not result.returncode,result.stderr
    tests=[('wrong_offset',source.replace('entryFrame->samplesRemaining','entryFrame->channelsRemaining'),'store0',()),
           ('byte_store',source.replace('entryFrame->samplesRemaining','*(volatile u8 *)entryFrame'),'store0',()),
           ('halfword_store',source.replace('entryFrame->samplesRemaining','*(volatile u16 *)entryFrame'),'store0',()),
           ('extra_store',source.replace('    entryRight =','    entryFrame->channelsRemaining = entryCount;\n    entryRight ='),'store0',()),
           ('extra_read',source.replace('    entryRight =','    entryType = entryFrame->channelsRemaining;\n    entryRight ='),'store0',()),
           ('late_store',source.replace('    entryFrame->samplesRemaining = entryCount;\n','').replace('    entryLeft =','    entryFrame->samplesRemaining = entryCount;\n    entryLeft ='),'store0',()),
           ('barrier',source.replace('    entryFrame->samplesRemaining','    asm volatile("" ::: "memory");\n    entryFrame->samplesRemaining'),'store0',()),
           ('missing_sp',source.replace('asm("sp")','asm("r9")'),'store0',()),
           ('wrong_frame',source,'frame64',()),('debug',source,'store0',('-g',)),('unwind',source,'store0',('-funwind-tables',)),('thumb',source,'store0',('-mthumb',))]
    for name,text,frame,extra in tests:
        result=compile_case(name,text,frame,extra)
        assert result.returncode and 'ARM adjacent' in result.stderr,(name,result.stderr)
    print(f'Incoming-SP store candidate accepted; {len(tests)} invalid contracts rejected.')
if __name__=='__main__':main()
