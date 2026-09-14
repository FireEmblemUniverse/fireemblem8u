#!/usr/bin/env python3
"""Verify the six-byte signed-modulus entry and rejected source contracts."""
import hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division'
source=(ROOT/'research/runtime/smod_entry.c').read_text()
base=[str(ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
plugin='-fplugin='+str(OUT/'smod_entry.so')
def compile(name,text,flags):
 src=OUT/(name+'.c');src.write_text(text);asm=src.with_suffix('.s')
 r=subprocess.run([*base,*flags,str(src),'-o',str(asm)],capture_output=True,text=True)
 return r,asm
r,asm=compile('smod-entry-accepted',source,[plugin,'-DMATCHING_ENTRY']);assert not r.returncode,r.stderr
obj=asm.with_suffix('.o');elf=asm.with_suffix('.elf');blob=asm.with_suffix('.bin')
subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],check=True)
script=OUT/'smod-entry.ld';script.write_text('SECTIONS { .text 0x080d1994 : { *(.text) } }\nASSERT(SIZEOF(.text)==6,"entry size")\n')
subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'--defsym','runtime_divzero=0x080d1a58','-o',str(elf)],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(blob)],check=True)
assert blob.read_bytes()==(ROOT/'baserom.gba').read_bytes()[0xd1994:0xd199a]
variants={'wrong-bit':(source.replace('runtimeBit = 1','runtimeBit = 2'),[]),'wrong-register':(source.replace('asm("r3")','asm("r2")'),[]),'wrong-target':(source.replace('runtime_udiv','wrong_target'),[]),'wrong-test':(source.replace('== 0','== 1'),[]),'extra-work':(source.replace('runtimeBit = 1;','runtimeBit = 1; runtimeDivisor++;'),[]),'arm':(source,['-marm']),'debug':(source,['-g']),'unwind':(source,['-funwind-tables'])}
for name,(text,flags) in variants.items():
 r,_=compile('smod-entry-'+name,text,[plugin,'-DMATCHING_ENTRY',*flags]);assert r.returncode,name
r,a=compile('smod-entry-plain',source,[]);assert not r.returncode
r,b=compile('smod-entry-unannotated',source,[plugin]);assert not r.returncode
def body(p):return '\n'.join(x for x in p.read_text().splitlines() if '.file' not in x)
assert body(a)==body(b)
print(json.dumps(dict(exact_entry_bytes=6,source_sha256=hashlib.sha256(source.encode()).hexdigest(),plugin_sha256=hashlib.sha256((OUT/'smod_entry.so').read_bytes()).hexdigest(),rejected_contracts=list(variants),unannotated_unchanged=True,scope='Entry bytes at original address; full shared-flags handoff still requires integration and runtime modeling.'),indent=2))
