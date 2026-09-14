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
parts=[('smod_entry',['smod_entry'],['-DMATCHING_ENTRY']),
 ('smod_shared_flags',['leaf_frame','saved_sign_frame','thumb_sign_branches'],['-Druntime_smod=runtime_udiv','-fplugin-arg-thumb_sign_branches-incoming-r1-flags']),
 ('divzero',['divzero_return'],[])]
for name,plugins,flags in parts:
 run([CC,'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes',*['-fplugin='+str(OUT/(p+'.so')) for p in plugins],*flags,ROOT/'research/runtime'/f'{name}.c','-o',OUT/f'smod-complete-{name}.s'])
 run(['arm-none-eabi-as','-mcpu=arm7tdmi',OUT/f'smod-complete-{name}.s','-o',OUT/f'smod-complete-{name}.o'])
script='SECTIONS { .text 0x080d1994 : { '+ ' '.join(str(OUT/f'smod-complete-{name}.o')+'(.text)' for name,_,_ in parts)+' } }\n'
script+='ASSERT(runtime_udiv == runtime_entry + 6, "core must fall through")\nASSERT(runtime_divzero == runtime_entry + 196, "zero path misplaced")\nASSERT(SIZEOF(.text) == 206, "helper size")\nASSERT((runtime_entry & 3) == 0, "entry alignment")\n'
(OUT/'smod-complete.ld').write_text(script)
run(['arm-none-eabi-ld','-T',OUT/'smod-complete.ld',*[OUT/f'smod-complete-{name}.o' for name,_,_ in parts],'-R',ROOT/'fireemblem8.elf','-o',OUT/'smod-complete.elf'])
run(['arm-none-eabi-objcopy','-O','binary','-j','.text',OUT/'smod-complete.elf',OUT/'smod-complete.bin'])
result=json.loads(run([ROOT/'.deps/arm-oracle-venv/bin/python',ROOT/'research/runtime/check_udiv.py','--operation','signed-modulus','--assembled-helper',OUT/'smod-complete.bin','--require-exact-helper']).stdout)
result['compiler']=str(CC)
result['optimization']='Os'
result['fragment_sha256']={name:hashlib.sha256((ROOT/'research/runtime'/f'{name}.c').read_bytes()).hexdigest() for name,_,_ in parts}
result['compiler_plugin_sha256']={p:hashlib.sha256((OUT/(p+'.so')).read_bytes()).hexdigest() for _,plugins,_ in parts for p in plugins}
result['linker_script']=script
print(json.dumps(result,indent=2))
