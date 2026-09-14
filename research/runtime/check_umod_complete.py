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
parts=[('umod_entry',['umod_entry'],[]),
 ('umod_entry_state',['leaf_frame','leaf_r4_frame'],['-fplugin-arg-leaf_r4_frame-thumb-return','-fplugin-arg-leaf_r4_frame-zero-r2-return']),
 ('divzero',['divzero_return'],[])]
for name,plugins,flags in parts:
 run([CC,'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes',*['-fplugin='+str(OUT/(p+'.so')) for p in plugins],*flags,ROOT/'research/runtime'/f'{name}.c','-o',OUT/f'mod-complete-{name}.s'])
 run(['arm-none-eabi-as','-mcpu=arm7tdmi',OUT/f'mod-complete-{name}.s','-o',OUT/f'mod-complete-{name}.o'])
script='SECTIONS { .text 0x080d1b4c : { '+ ' '.join(str(OUT/f'mod-complete-{name}.o')+'(.text)' for name,_,_ in parts)+' } }\n'
script+='ASSERT(runtime_umod == runtime_mod_entry + 12, "core must fall through")\nASSERT(runtime_divzero == runtime_mod_entry + 182, "zero path misplaced")\nASSERT(SIZEOF(.text) == 192, "helper size")\nASSERT((runtime_mod_entry & 3) == 0, "entry alignment")\n'
(OUT/'mod-complete.ld').write_text(script)
run(['arm-none-eabi-ld','-T',OUT/'mod-complete.ld',*[OUT/f'mod-complete-{name}.o' for name,_,_ in parts],'-R',ROOT/'fireemblem8.elf','-o',OUT/'mod-complete.elf'])
run(['arm-none-eabi-objcopy','-O','binary','-j','.text',OUT/'mod-complete.elf',OUT/'mod-complete.bin'])
result=json.loads(run([ROOT/'.deps/arm-oracle-venv/bin/python',ROOT/'research/runtime/check_udiv.py','--operation','modulus','--assembled-helper',OUT/'mod-complete.bin','--require-exact-helper']).stdout)
result['compiler']=str(CC)
result['optimization']='Os'
result['fragment_sha256']={name:hashlib.sha256((ROOT/'research/runtime'/f'{name}.c').read_bytes()).hexdigest() for name,_,_ in parts}
result['compiler_plugin_sha256']={p:hashlib.sha256((OUT/(p+'.so')).read_bytes()).hexdigest() for _,plugins,_ in parts for p in plugins}
result['linker_script']=script
print(json.dumps(result,indent=2))
