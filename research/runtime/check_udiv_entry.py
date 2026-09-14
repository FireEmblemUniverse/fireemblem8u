#!/usr/bin/env python3
"""Reject unsupported dispatcher contracts and displaced fallthrough layouts."""
import json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division'
CC=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
source=(ROOT/'research/runtime/udiv_entry.c').read_text()
base=[str(CC),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
plugin='-fplugin='+str(OUT/'udiv_entry.so')
def compile(name,text,flags):
 p=OUT/f'entry-control-{name}.c';p.write_text(text)
 return subprocess.run([*base,*flags,str(p),'-o',str(OUT/f'entry-control-{name}.s')],capture_output=True,text=True)
variants={
 'wrong-condition':(source.replace('== 0','== 1'),[]),
 'wrong-register':(source.replace('asm("r1")','asm("r2")'),[]),
 'wrong-target':(source.replace('runtime_divzero','other_target'),[]),
 'added-work':(source.replace('    if (','    runtimeDivisor += 1;\n    if ('),[]),
 'returnable-targets':(source.replace(' __attribute__((noreturn))',''),[]),
 'parameters':(source.replace('runtime_entry(void)','runtime_entry(unsigned x)'),[]),
 'arm':(source,['-marm']),
 'debug':(source,['-g']),
 'unwind':(source,['-funwind-tables']),
}
for name,(text,flags) in variants.items():
 result=compile(name,text,[plugin,'-DMATCHING_ENTRY',*flags])
 assert result.returncode and 'udiv entry requires' in result.stderr,(name,result.stderr)
for name,flags in [('plain',[]),('unannotated',[plugin])]:
 result=compile(name,source,flags);assert not result.returncode,result.stderr
# Compiler .file directives differ because controls have different filenames.
def body(name):return '\n'.join(line for line in (OUT/f'entry-control-{name}.s').read_text().splitlines() if '.file' not in line)
assert body('plain')==body('unannotated')
script=(OUT/'complete.ld').read_text()
# Inject a halfword between entry and nonzero core; this must fail the assertion.
needle=str(OUT/'complete-udiv_entry.o')+'(.text)'
bad=script.replace(needle,needle+' SHORT(0);')
(OUT/'entry-displaced.ld').write_text(bad)
result=subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'entry-displaced.ld'),*[str(OUT/f'complete-{n}.o') for n in ('udiv_entry','udiv_layout','divzero')],'-R',str(ROOT/'fireemblem8.elf'),'-o',str(OUT/'entry-displaced.elf')],capture_output=True,text=True)
assert result.returncode and 'core must fall through' in result.stderr,result.stderr
print(json.dumps(dict(rejected_contracts=list(variants),unannotated_unchanged=True,displaced_core_rejected=True),indent=2))
