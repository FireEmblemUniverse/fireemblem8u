#!/usr/bin/env python3
"""Reject unsupported saved-sign frames and preserve unannotated compilation."""
import json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division/saved-sign-controls';OUT.mkdir(exist_ok=True)
source=(ROOT/'research/runtime/smod_frame.c').read_text()
base=[str(ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes','-fplugin='+str(ROOT/'.deps/runtime-c/plugins/leaf_frame.so')]
plugin='-fplugin='+str(OUT.parent/'saved_sign_frame.so')
def compile(name,text,flags=(),enabled=True):
 src=OUT/(name+'.c');src.write_text(text);asm=src.with_suffix('.s')
 r=subprocess.run([*base,*([plugin] if enabled else []),*flags,str(src),'-o',str(asm)],capture_output=True,text=True)
 return r,asm
r,asm=compile('accepted',source);assert not r.returncode,r.stderr
s=asm.read_text();assert 'push\t{r4}\n\tpush\t{r0}' in s and s.count('pop\t{r4}')==2
variants={'wrong-store':(source.replace('sign = dividend','sign = divisor'),[]),'extra-store':(source.replace('work = sign;', 'sign = dividend; work = sign;'),[]),'extra-load':(source.replace('work = sign;', 'dividend += sign; work = sign;'),[]),'wrong-load-destination':(source.replace('work = sign;', 'divisor = sign; BASE(); work = divisor;'),[]),'arm':(source,['-marm']),'debug':(source,['-g']),'unwind':(source,['-funwind-tables'])}
for name,(text,flags) in variants.items():
 r,_=compile(name,text,flags);assert r.returncode,(name,r.stderr)
plain=source.replace(', matching_saved_sign_frame','')
r,a=compile('plain',plain,enabled=False);assert not r.returncode,r.stderr
r,b=compile('unannotated',plain);assert not r.returncode,r.stderr
def body(p):return '\n'.join(x for x in p.read_text().splitlines() if '.file' not in x)
assert body(a)==body(b)
print(json.dumps(dict(rejected_contracts=list(variants),unannotated_unchanged=True,two_pushes_and_pops=True),indent=2))
