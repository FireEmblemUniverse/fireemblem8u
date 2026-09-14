#!/usr/bin/env python3
"""Record the remaining signed-modulus stack shape before implementing its contract."""
import hashlib,json,re,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division'
source=ROOT/'research/runtime/smod_layout.c';asm=OUT/'smod-frame-probe.s'
cc=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
plugin=ROOT/'.deps/runtime-c/plugins/leaf_frame.so'
subprocess.run([str(cc),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-fplugin='+str(plugin),str(source),'-o',str(asm)],check=True)
lines=[x.strip() for x in asm.read_text().splitlines()]
r5=[x for x in lines if re.search(r'\br5\b',x)]
assert r5==['push\t{r0, r4, r5}','pop\t{r1, r4, r5}'],r5
memory=[x for x in lines if re.match(r'(?:ldr|str)\b',x)]
assert memory==['str\tr0, [sp]','ldr\tr4, [sp]'],memory
assert not any(re.match(r'bl(?:x)?\s',x) for x in lines)
print(json.dumps(dict(source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),plugin_sha256=hashlib.sha256(plugin.read_bytes()).hexdigest(),r5_references=r5,explicit_memory_operations=memory,no_calls=True,scope='Compiler-output structural probe: r5 appears only in save/restore; the sign uses one SP-local store/load. Does not yet transform or prove a replacement frame.'),indent=2))
