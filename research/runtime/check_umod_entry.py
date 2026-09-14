#!/usr/bin/env python3
"""Negative controls for the private modulus entry compiler contract."""
import json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division'
source=(ROOT/'research/runtime/umod_entry.c').read_text()
base=[str(ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
plugin='-fplugin='+str(OUT/'umod_entry.so')
variants={'wrong-bit':(source.replace('runtimeBit = 1','runtimeBit = 2'),[]),'signed-compare':(source.replace('runtimeDividend >= runtimeDivisor','(int)runtimeDividend >= (int)runtimeDivisor'),[]),'wrong-target':(source.replace('runtime_umod','wrong_target'),[]),'extra-work':(source.replace('runtimeBit = 1;','runtimeBit = 1; runtimeDividend++;'),[]),'returnable-call':(source.replace(' __attribute__((noreturn))',''),[]),'arm':(source,['-marm']),'debug':(source,['-g']),'unwind':(source,['-funwind-tables'])}
def compile(name,text,flags):
 src=OUT/(name+'.c');src.write_text(text)
 return subprocess.run([*base,*flags,str(src),'-o',str(OUT/(name+'.s'))],capture_output=True,text=True)
for name,(text,flags) in variants.items():
 result=compile('mod-control-'+name,text,[plugin,*flags]);assert result.returncode and 'umod entry requires' in result.stderr,(name,result.stderr)
plain=source.replace('__attribute__((matching_umod_entry))','')
for name,flags in [('mod-plain',[]),('mod-unannotated',[plugin])]:
 r=compile(name,plain,flags);assert not r.returncode,r.stderr
def body(name):return '\n'.join(x for x in (OUT/(name+'.s')).read_text().splitlines() if '.file' not in x)
assert body('mod-plain')==body('mod-unannotated')
print(json.dumps(dict(rejected_contracts=list(variants),unannotated_unchanged=True),indent=2))
