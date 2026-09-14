#!/usr/bin/env python3
"""Guard the restricted r4-only leaf-frame transformation."""
import hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division/r4-controls';OUT.mkdir(exist_ok=True)
CC=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
plugins=[OUT.parent/(name+'.so') for name in ('copy_add_zero','leaf_frame','leaf_r4_frame')]
source=(ROOT/'research/runtime/udiv_r4_leaf.c').read_text()
def compile_case(name,text,extra=(),prune=True):
 path=OUT/(name+'.c');path.write_text(text);asm=path.with_suffix('.s');obj=path.with_suffix('.o');blob=path.with_suffix('.bin')
 cmd=[str(CC),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-DMATCHING_COPY_ADD_ZERO','-Werror=attributes']
 cmd+=['-fplugin='+str(p) for p in (plugins if prune else plugins[:2])]
 result=subprocess.run([*cmd,*extra,str(path),'-o',str(asm)],capture_output=True,text=True)
 (OUT/(name+'.log')).write_text(result.stdout+result.stderr)
 if result.returncode:return result,None
 subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(blob)],check=True)
 return result,blob.read_bytes()
r,matched=compile_case('accepted',source);assert r.returncode==0,r.stderr
text=(OUT/'accepted.s').read_text();assert 'push\t{r4}' in text and 'pop\t{r4}' in text and 'push\t{r4, r5, r6}' not in text
plain=source.replace(', matching_leaf_r4_frame','')
r,left=compile_case('unannotated-plugin',plain);assert r.returncode==0
r,right=compile_case('unannotated-control',plain,prune=False);assert r.returncode==0 and left==right
variants={
 'memory-store':(source.replace('done:', 'done: *(volatile unsigned *)0x03001000 = result;'),()),
 'memory-load':(source.replace('done:', 'done: result += *(volatile unsigned *)0x03001000;'),()),
 'stack-reference':(source.replace('done:', 'done: asm volatile("" : : "r"(__builtin_frame_address(0)));'),()),
 'live-r5':(source.replace('done:', 'done: asm volatile("" : : : "r5");'),()),
 'live-r6':(source.replace('done:', 'done: asm volatile("" : : : "r6");'),()),
 'instruction-asm':(source.replace('done:', 'done: asm volatile("nop");'),()),
 'missing-leaf-contract':(source.replace('matching_leaf_frame, ',''),()),
 'call':(source.replace('done:', 'done: __div0();'),()),
 'unwind':(source,('-funwind-tables',)),
 'debug':(source,('-g',)),
 'arm-mode':(source,('-marm',)),
}
for name,(text,extra) in variants.items():
 r,_=compile_case(name,text,extra);assert r.returncode,(name,'unexpected acceptance')
 assert 'leaf' in r.stderr or 'copy add zero' in r.stderr,(name,r.stderr)
print(json.dumps(dict(accepted_single_r4_save_restore=True,unannotated_unchanged=True,rejected_cases=list(variants),plugin_source_sha256=hashlib.sha256((ROOT/'tools/arm-dispatch/leaf_r4_frame.cc').read_bytes()).hexdigest(),plugin_sha256=hashlib.sha256(plugins[2].read_bytes()).hexdigest()),indent=2))
