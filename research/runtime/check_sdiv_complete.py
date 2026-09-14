#!/usr/bin/env python3
"""Build the three private C fragments with enforced layout, then model the helper."""
import hashlib,json,subprocess,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/runtime-division'
CC=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
def run(args):
 result=subprocess.run([str(a) for a in args],capture_output=True,text=True)
 if result.returncode:
  sys.stderr.write(result.stderr)
  result.check_returncode()
 return result
parts=[('udiv_entry',['udiv_entry'],['-DMATCHING_ENTRY']),
 ('sdiv_sign',['copy_add_zero','leaf_frame','leaf_r4_frame','thumb_sign_branches'],['-DMATCHING_COPY_ADD_ZERO','-Druntime_sdiv=runtime_udiv','-fplugin-arg-leaf_r4_frame-thumb-return','-fplugin-arg-copy_add_zero-preserve-thumb-high-copies']),
 ('divzero',['divzero_return'],[])]
for name,plugins,flags in parts:
 run([CC,'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes',*['-fplugin='+str(OUT/(p+'.so')) for p in plugins],*flags,ROOT/'research/runtime'/f'{name}.c','-o',OUT/f'sdiv-complete-{name}.s'])
 run(['arm-none-eabi-as','-mcpu=arm7tdmi',OUT/f'sdiv-complete-{name}.s','-o',OUT/f'sdiv-complete-{name}.o'])
script='SECTIONS { .text 0x080d18fc : { '+ ' '.join(str(OUT/f'sdiv-complete-{name}.o')+'(.text)' for name,_,_ in parts)+' } }\n'
script+='ASSERT(runtime_udiv == runtime_entry + 4, "core must fall through")\nASSERT(runtime_divzero == runtime_entry + 136, "zero path misplaced")\nASSERT(SIZEOF(.text) == 146, "helper size")\nASSERT((runtime_entry & 3) == 0, "entry alignment")\n'
(OUT/'sdiv-complete.ld').write_text(script)
run(['arm-none-eabi-ld','-T',OUT/'sdiv-complete.ld',*[OUT/f'sdiv-complete-{name}.o' for name,_,_ in parts],'-R',ROOT/'fireemblem8.elf','-o',OUT/'sdiv-complete.elf'])
run(['arm-none-eabi-objcopy','-O','binary','-j','.text',OUT/'sdiv-complete.elf',OUT/'sdiv-complete.bin'])
result=json.loads(run([ROOT/'.deps/arm-oracle-venv/bin/python',ROOT/'research/runtime/check_udiv.py','--operation','signed-division','--assembled-helper',OUT/'sdiv-complete.bin','--require-exact-helper']).stdout)
result['compiler']=str(CC)
result['optimization']='Os'
result['fragment_sha256']={name:hashlib.sha256((ROOT/'research/runtime'/f'{name}.c').read_bytes()).hexdigest() for name,_,_ in parts}
result['compiler_plugin_sha256']={p:hashlib.sha256((OUT/(p+'.so')).read_bytes()).hexdigest() for _,plugins,_ in parts for p in plugins}
result['linker_script']=script
print(json.dumps(result,indent=2))
