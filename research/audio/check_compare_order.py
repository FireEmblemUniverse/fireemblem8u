#!/usr/bin/env python3
"""Check the explicit comparison-order contract and unsupported comparisons."""
import argparse
from pathlib import Path
import subprocess
ROOT=Path(__file__).resolve().parents[2]

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler',required=True)
    p.add_argument('--plugin',type=Path,required=True)
    a=p.parse_args();out=ROOT/'.deps/address-filter-match/guards';out.mkdir(exist_ok=True)
    header='register volatile unsigned left asm("r0");\nregister volatile unsigned right asm("r2");\nregister volatile unsigned result asm("r3");\n'
    def source(condition,attribute=True):
        return header+('__attribute__((matching_compare_order))\n' if attribute else '')+'void fixture(void) { if ('+condition+') result=1; else result=2; }\n'
    flags=['-S','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-if-conversion','-fno-if-conversion2','-fno-reorder-blocks']
    def compile_case(name,text,plugin=True):
        path=out/(name+'.c');path.write_text(text);dest=out/(name+'.s')
        r=subprocess.run([a.compiler,*flags,*(['-fplugin='+str(a.plugin.resolve())] if plugin else []),str(path),'-o',str(dest)],capture_output=True,text=True)
        return r,dest
    for n,op in enumerate(('<','>','<=','>=')):
        r,d=compile_case('unsigned'+str(n),source('left '+op+' right'))
        assert not r.returncode,r.stderr
        assert '\tcmp\tr2, r0' in d.read_text(),d.read_text()
    for n,condition in enumerate(('left == right','left != right','(int)left < (int)right','left < 10')):
        r,d=compile_case('rejected'+str(n),source(condition))
        assert r.returncode and ('unsigned inequality' in r.stderr or 'no register comparison' in r.stderr),r.stderr
    r,d=compile_case('plain',source('left < right',False),False);assert not r.returncode,r.stderr
    original=d.read_bytes()
    r,d=compile_case('plain',source('left < right',False),True);assert not r.returncode and d.read_bytes()==original,r.stderr
    print('Four unsigned relations accepted; equality, inequality, signed and immediate-only contracts rejected; unannotated output unchanged.')

if __name__=='__main__':main()
