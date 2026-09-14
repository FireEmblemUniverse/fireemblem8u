#!/usr/bin/env python3
"""Measure C sign-test spellings before introducing a compiler encoding contract."""
import hashlib,json,re,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division/sign-probes';OUT.mkdir(exist_ok=True)
source=(ROOT/'research/runtime/sdiv_copy.c').read_text()
variants={'mask':source,'signed-cast':source,'shift':source,'unsigned-bound':source}
for reg in ('divisor','dividend','work'):
 test=f'{reg} & 0x80000000u'
 variants['signed-cast']=variants['signed-cast'].replace(test,f'(int){reg} < 0')
 variants['shift']=variants['shift'].replace(test,f'{reg} >> 31')
 variants['unsigned-bound']=variants['unsigned-bound'].replace(test,f'{reg} >= 0x80000000u')
rows=[]
for name,text in variants.items():
 src=OUT/(name+'.c');src.write_text(text);asm=src.with_suffix('.s')
 command=[str(ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-DMATCHING_COPY_ADD_ZERO']
 command+=['-fplugin='+str(ROOT/'.deps/runtime-c/plugins'/(p+'.so')) for p in ('copy_add_zero','leaf_frame','leaf_r4_frame')]
 command+=['-fplugin-arg-copy_add_zero-preserve-thumb-high-copies','-fplugin-arg-leaf_r4_frame-thumb-return',str(src),'-o',str(asm)]
 subprocess.run(command,check=True)
 branches=re.findall(r'^\s*(b(?:ge|pl|lt|mi))\s',asm.read_text(),re.M)
 rows.append(dict(expression=name,sign_branches=branches,source_sha256=hashlib.sha256(text.encode()).hexdigest()))
print(json.dumps(dict(probes=rows,scope='Compile-only sign-expression probes; behavioral evidence belongs to the tested copy candidate.'),indent=2))
