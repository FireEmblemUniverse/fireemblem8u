#!/usr/bin/env python3
"""Validate signed-division sign branch contract and exact core output."""
import json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division/sign-controls';OUT.mkdir(exist_ok=True)
CC=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
source=(ROOT/'research/runtime/sdiv_sign.c').read_text()
base=[str(CC),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-DMATCHING_COPY_ADD_ZERO','-Werror=attributes']
base+=['-fplugin='+str(ROOT/'.deps/runtime-c/plugins'/(x+'.so')) for x in ('copy_add_zero','leaf_frame','leaf_r4_frame')]
base+=['-fplugin-arg-copy_add_zero-preserve-thumb-high-copies','-fplugin-arg-leaf_r4_frame-thumb-return']
plugin='-fplugin='+str(OUT.parent/'thumb_sign_branches.so')
def compile(name,text,flags,enabled=True):
 src=OUT/(name+'.c');src.write_text(text);asm=src.with_suffix('.s')
 r=subprocess.run([*base,*([plugin] if enabled else []),*flags,str(src),'-o',str(asm)],capture_output=True,text=True)
 return r,asm
r,asm=compile('accepted',source,[]);assert not r.returncode,r.stderr
obj=asm.with_suffix('.o');blob=asm.with_suffix('.bin')
subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(blob)],check=True)
symbols={x.split()[-1]:int(x.split()[0],16) for x in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(x.split())==3}
a=symbols['__divsi3']-0x08000000+4
assert blob.read_bytes()==(ROOT/'baserom.gba').read_bytes()[a:a+132]
variants={'wrong-register':(source.replace('if (divisor & 0x80000000u)','if (result & 0x80000000u)'),[]),'wrong-threshold':(source.replace('divisor & 0x80000000u','(int)divisor > 1'),[]),'missing-test':(source.replace('if (divisor & 0x80000000u)','if (0)'),[]),'arm':(source,['-marm']),'debug':(source,['-g']),'unwind':(source,['-funwind-tables'])}
for name,(text,flags) in variants.items():
 r,_=compile(name,text,flags);assert r.returncode,name
plain=source.replace(', matching_thumb_sign_branches','')
r,a=compile('plain',plain,[],False);assert not r.returncode,r.stderr
r,b=compile('unannotated',plain,[]);assert not r.returncode,r.stderr
def body(p):return '\n'.join(x for x in p.read_text().splitlines() if '.file' not in x)
assert body(a)==body(b)
print(json.dumps(dict(exact_core_bytes=132,rejected_contracts=list(variants),unannotated_unchanged=True),indent=2))
