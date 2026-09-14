#!/usr/bin/env python3
"""Check the explicit zero-r2 return option and inherited frame guards."""
import contextlib,io,json
from pathlib import Path
with contextlib.redirect_stdout(io.StringIO()):
 import check_leaf_r4_frame as base
source=(base.ROOT/'research/runtime/umod_entry_state.c').read_text()
flags=['-fplugin-arg-leaf_r4_frame-thumb-return','-fplugin-arg-leaf_r4_frame-zero-r2-return']
r,code=base.compile_case('umod-exact',source,flags)
assert not r.returncode,r.stderr
assert code==(base.ROOT/'baserom.gba').read_bytes()[0xd1b58:0xd1c02]
variants={
 'wrong-zero-register':source.replace('if (overdone) {','if (bit) {'),
 'wrong-condition':source.replace('if (overdone) {','if (overdone == 1) {'),
 'post-return-work':source.replace('return dividend;','return dividend + 1;'),
}
for name,text in variants.items():
 r,_=base.compile_case(name,text,flags);assert r.returncode,(name,r.stderr)
for name,extra in [('missing-thumb-return',flags[1:]),('duplicate-option',flags+[flags[1]]),('valued-option',[flags[0],flags[1]+'=1'])]:
 r,_=base.compile_case(name,source,extra);assert r.returncode,name
print(json.dumps(dict(exact_core_bytes=170,altered_contracts_rejected=list(variants),invalid_options_rejected=3,inherited_frame_controls_pass=True),indent=2))
