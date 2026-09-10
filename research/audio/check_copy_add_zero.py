#!/usr/bin/env python3
"""Check ARM copy encoding opt-in and reject unsupported uses."""
import argparse
from pathlib import Path
import subprocess
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--plugin',type=Path,required=True);a=p.parse_args()
    out=ROOT/'.deps/audio-multiply-match/guards';out.mkdir(exist_ok=True)
    attr='__attribute__((matching_copy_add_zero)) '
    source=attr+'unsigned fixture(unsigned a,unsigned b) { return b; }\n'
    def compile_case(name,text,mode='-marm',plugin=True):
        src=out/(name+'.c');src.write_text(text);dest=out/(name+'.s')
        result=subprocess.run([a.compiler,'-S','-O1',mode,'-mcpu=arm7tdmi','-mabi=apcs-gnu',*(['-fplugin='+str(a.plugin.resolve())] if plugin else []),str(src),'-o',str(dest)],capture_output=True,text=True)
        return result,dest
    result,dest=compile_case('accepted',source);assert not result.returncode and '\tadd\tr0, r1, #0' in dest.read_text(),result.stderr
    for name,text,mode in [('thumb',source,'-mthumb'),('no_copy',source.replace('return b','return a'),'-marm'),('constant',source.replace('return b','return 7'),'-marm')]:
        result,_=compile_case(name,text,mode);assert result.returncode and 'copy add zero' in result.stderr,result.stderr
    thumb_source=source.replace('matching_copy_add_zero','matching_thumb_copy_add_zero')
    result,dest=compile_case('thumb_accepted',thumb_source,'-mthumb');assert not result.returncode and '\tadds\tr0, r1, #0' in dest.read_text(),result.stderr
    for name,text,mode in [('thumb_on_arm',thumb_source,'-marm'),('thumb_no_copy',thumb_source.replace('return b','return a'),'-mthumb'),('thumb_constant',thumb_source.replace('return b','return 7'),'-mthumb'),('both',thumb_source.replace('matching_thumb_copy_add_zero','matching_thumb_copy_add_zero,matching_copy_add_zero'),'-mthumb'),('high_register','register unsigned high asm("r8"); __attribute__((matching_thumb_copy_add_zero)) unsigned fixture(void) { return high; }','-mthumb')]:
        result,_=compile_case(name,text,mode);assert result.returncode and 'copy add zero' in result.stderr,result.stderr
    plain=source.replace(attr,'');result,dest=compile_case('plain',plain,plugin=False);assert not result.returncode,result.stderr
    before=dest.read_bytes();result,dest=compile_case('plain',plain);assert not result.returncode and before==dest.read_bytes(),result.stderr
    print('ARM/Thumb copies accepted; eight unsupported mode/copy contracts rejected; unannotated output unchanged.')
if __name__=='__main__':main()
