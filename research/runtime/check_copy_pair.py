#!/usr/bin/env python3
"""Check scoped register-copy selection without changing other copy flags."""
import hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division/copy-pair';OUT.mkdir(exist_ok=True)
CC=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc';PLUGIN=OUT.parent/'copy_add_zero.so'
attr='__attribute__((matching_thumb_copy_add_zero_pair(0, 2))) '
body='unsigned fixture(unsigned a,unsigned b,unsigned c) { register unsigned held asm("r4")=b; register unsigned result asm("r2")=c; asm volatile("" : "+r"(held), "+r"(result)); return result; }\n'
def compile_case(name,source,extra=(),plugin=True):
 path=OUT/(name+'.c');path.write_text(source);asm=path.with_suffix('.s');obj=path.with_suffix('.o');blob=path.with_suffix('.bin')
 result=subprocess.run([str(CC),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-Werror=attributes',*(['-fplugin='+str(PLUGIN)] if plugin else []),*extra,str(path),'-o',str(asm)],capture_output=True,text=True)
 (OUT/(name+'.log')).write_text(result.stdout+result.stderr)
 if result.returncode:return result,None
 subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(blob)],check=True)
 return result,blob.read_bytes()
r,selected=compile_case('selected',attr+body);assert r.returncode==0,r.stderr
r,plain=compile_case('plain',body);assert r.returncode==0
r,control=compile_case('control',body,plugin=False);assert r.returncode==0 and plain==control
assert len(selected)==len(plain)
diffs=[i for i in range(0,len(plain),2) if plain[i:i+2]!=selected[i:i+2]]
assert len(diffs)==1
at=diffs[0];assert plain[at:at+2]==bytes.fromhex('1000') and selected[at:at+2]==bytes.fromhex('101c')
variants={'same-register':attr.replace('(0, 2)','(0, 0)'),'high-register':attr.replace('(0, 2)','(0, 8)'),
 'negative-register':attr.replace('(0, 2)','(-1, 2)'),'string-register':attr.replace('(0, 2)','("r0", 2)'),
 'missing-copy':attr.replace('(0, 2)','(0, 3)'),
 'conflicting-contract':attr+'__attribute__((matching_thumb_copy_add_zero)) '}
for name,value in variants.items():
 r,_=compile_case(name,value+body);assert r.returncode and ('copy_add_zero' in r.stderr or 'copy add zero' in r.stderr),(name,r.stderr)
for name,extra in [('arm-mode',['-marm']),('high-option',['-fplugin-arg-copy_add_zero-preserve-thumb-high-copies'])]:
 r,_=compile_case(name,attr+body,extra);assert r.returncode and 'copy add zero' in r.stderr
print(json.dumps(dict(changed_halfwords=1,selected_pair=[0,2],other_copy_bytes_unchanged=True,unannotated_unchanged=True,rejected_cases=list(variants)+['arm-mode','high-option'],plugin_source_sha256=hashlib.sha256((ROOT/'tools/arm-dispatch/copy_add_zero.cc').read_bytes()).hexdigest(),plugin_sha256=hashlib.sha256(PLUGIN.read_bytes()).hexdigest()),indent=2))
