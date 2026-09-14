#!/usr/bin/env python3
"""Measure normalization-layout candidates without crediting production coverage."""
import hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division/umod-layout';OUT.mkdir(exist_ok=True)
CC=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc';source=ROOT/'research/runtime/umod_r4_core.c'
original=(ROOT/'baserom.gba').read_bytes()[0xd1b58:0xd1c02]
assert len(original)==170
options=[['-fno-crossjumping'],['-fno-tree-tail-merge'],['-fno-crossjumping','-fno-tree-tail-merge'],['-fno-reorder-blocks','-fno-crossjumping'],[],['-fno-reorder-blocks'],['-fno-tree-loop-optimize'],['-fno-reorder-blocks','-fno-tree-loop-optimize'],['-fno-guess-branch-probability'],['-fno-reorder-blocks','-fno-guess-branch-probability'],['-fno-tree-dominator-opts','-fno-thread-jumps'],['-fno-reorder-blocks','-fno-tree-dominator-opts','-fno-thread-jumps']]
rows=[]
for n,extra in enumerate(options):
 asm=OUT/(str(n)+'.s');obj=asm.with_suffix('.o');blob=asm.with_suffix('.bin')
 cmd=[str(CC),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-DMATCHING_COPY_ADD_ZERO','-Werror=attributes']
 cmd+=['-fplugin='+str(ROOT/'.deps/runtime-c/plugins'/(name+'.so')) for name in ('leaf_frame','leaf_r4_frame')]
 cmd+=['-fplugin-arg-leaf_r4_frame-thumb-return']
 r=subprocess.run([*cmd,*extra,str(source),'-o',str(asm)],capture_output=True,text=True,timeout=20)
 (OUT/(str(n)+'.log')).write_text(r.stdout+r.stderr)
 if r.returncode:rows.append(dict(flags=extra,accepted=False,diagnostic=r.stderr));continue
 subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(blob)],check=True)
 code=blob.read_bytes();diffs=[i for i in range(0,min(len(code),len(original)),2) if code[i:i+2]!=original[i:i+2]]
 rows.append(dict(flags=extra,accepted=True,bytes=len(code),different_halfword_offsets=diffs,exact=code==original))
print(json.dumps(dict(source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),original_core_bytes=170,probes=rows),indent=2))
