#!/usr/bin/env python3
"""Verify exact signed-modulus nonzero path and complete state equivalence."""
import json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division'
cmd=[str(ROOT/'.deps/arm-oracle-venv/bin/python'),str(ROOT/'research/runtime/check_udiv.py'),'--operation','signed-modulus','--source',str(ROOT/'research/runtime/smod_sign.c'),'--optimization','Os','--nonzero-only','--require-state-match','--compiler',str(ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc')]
for path in [ROOT/'.deps/runtime-c/plugins/leaf_frame.so',OUT/'saved_sign_frame.so',OUT/'thumb_sign_branches.so']:
 cmd+=['--extra-plugin',str(path)]
r=json.loads(subprocess.check_output(cmd,text=True))
symbols={x.split()[-1]:int(x.split()[0],16) for x in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(x.split())==3}
a=symbols['__modsi3']-0x08000000;original=(ROOT/'baserom.gba').read_bytes()[a:a+206]
code=(OUT/'udiv.bin').read_bytes()
assert len(code)==194 and code==original[:4]+original[6:196]
r['exact_nonzero_path_excluding_zero_branch']=True
r['omitted_original_ranges']=[{'offset':4,'bytes':2},{'offset':196,'bytes':10}]
r['scope']='All original nonzero-path bytes match after removing only the zero-branch halfword and ten-byte zero handler. All final registers, CPSR and stack writes match for nonzero divisors. Full helper is not yet matched or integrated.'
print(json.dumps(r,indent=2))
