#!/usr/bin/env python3
"""Verify entry PUSH folding, rejected frames and explicit opt-in."""
import argparse
from pathlib import Path
import subprocess
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--plugin',type=Path,required=True);a=p.parse_args()
    out=ROOT/'.deps/address-filter-match/stack-guards';out.mkdir(exist_ok=True)
    source='register volatile unsigned value asm("r0");\n__attribute__((matching_stack_word))\nvoid fixture(void) { volatile unsigned saved=value; value=0; value=saved; }\n'
    flags=['-S','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding']
    def compile_case(name,text,extra=(),plugin=True):
        src=out/(name+'.c');src.write_text(text);dest=out/(name+'.s')
        r=subprocess.run([a.compiler,*flags,*extra,*(['-fplugin='+str(a.plugin.resolve())] if plugin else []),str(src),'-o',str(dest)],capture_output=True,text=True)
        return r,dest
    r,d=compile_case('accepted',source);assert not r.returncode and '\tpush\t{r0}' in d.read_text() and '\tpop\t{r0}' in d.read_text(),r.stderr
    for name,text,extra in [('no_frame',source.replace('volatile unsigned saved=value; value=0; value=saved;', 'value=0;'),()),('large_frame',source.replace('volatile unsigned saved=value; value=0; value=saved;', 'volatile unsigned saved[2]; saved[0]=value; saved[1]=value; value=saved[0]+saved[1];'),()),('missing_restore',source.replace('value=saved;', 'value=1;'),()),('unwind',source,('-funwind-tables',))]:
        r,d=compile_case(name,text,extra);assert r.returncode and 'stack word' in r.stderr,(name,r.stderr)
    plain=source.replace('__attribute__((matching_stack_word))','')
    r,d=compile_case('plain',plain,plugin=False);assert not r.returncode,r.stderr
    original=d.read_bytes();r,d=compile_case('plain',plain);assert not r.returncode and original==d.read_bytes(),r.stderr
    print('PUSH/POP accepted; absent frame, larger frame, missing restore and unwind metadata rejected; unannotated output unchanged.')
if __name__=='__main__':main()
