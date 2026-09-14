#!/usr/bin/env python3
"""Reject unsupported incoming-flag contracts and displaced entry/core layouts."""
import json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division'
source=(ROOT/'research/runtime/smod_shared_flags.c').read_text()
base=[str(ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
base+=['-fplugin='+str(OUT/(p+'.so')) for p in ('leaf_frame','saved_sign_frame','thumb_sign_branches')]
option='-fplugin-arg-thumb_sign_branches-incoming-r1-flags'
variants={'prefix-work':source.replace('    BASE();','    dividend += 1; BASE();',1),'missing-bit-register':source.replace('register unsigned bit asm("r3");','unsigned bit;'),'wrong-sign-register':source.replace('if (divisor & 0x80000000u)','if (dividend & 0x80000000u)')}
for name,text in variants.items():
 src=OUT/('shared-'+name+'.c');src.write_text(text)
 r=subprocess.run([*base,option,str(src),'-o',str(src.with_suffix('.s'))],capture_output=True,text=True)
 assert r.returncode,(name,r.stderr)
for name,flags in [('duplicate',[option,option]),('valued',[option+'=1'])]:
 r=subprocess.run([*base,*flags,str(ROOT/'research/runtime/smod_shared_flags.c'),'-o',str(OUT/'shared-invalid.s')],capture_output=True,text=True);assert r.returncode,name
script=(OUT/'smod-complete.ld').read_text();needle=str(OUT/'smod-complete-smod_entry.o')+'(.text)'
assert needle in script
bad=OUT/'shared-displaced.ld';bad.write_text(script.replace(needle,needle+' SHORT(0);'))
r=subprocess.run(['arm-none-eabi-ld','-T',str(bad),*[str(OUT/f'smod-complete-{n}.o') for n in ('smod_entry','smod_shared_flags','divzero')],'-R',str(ROOT/'fireemblem8.elf'),'-o',str(OUT/'shared-displaced.elf')],capture_output=True,text=True)
assert r.returncode and 'core must fall through' in r.stderr,r.stderr
print(json.dumps(dict(rejected_sources=list(variants),invalid_options_rejected=2,displaced_core_rejected=True),indent=2))
