#!/usr/bin/env python3
"""Isolated pinned agbcc experiment exposing its existing NOP RTL as a builtin."""
import hashlib,json,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/event-nop';OUT.mkdir(exist_ok=True)
revision='da598c1d918402c42c0c0d7128ba14567f3175e9'
build=Path(tempfile.mkdtemp(prefix='agbcc-nop-build-',dir=ROOT/'.deps'))
subprocess.run(['git','clone','--quiet','--no-checkout','--no-hardlinks',str(ROOT/'.deps/agbcc'),str(build)],check=True)
subprocess.run(['git','checkout','--quiet','--detach',revision],cwd=build,check=True)
def replace(path,old,new):
 p=build/path;s=p.read_text();assert s.count(old)==1,(path,s.count(old));p.write_text(s.replace(old,new))
replace('gcc/tree.h','  BUILT_IN_CONSTANT_P,','  BUILT_IN_MATCHING_NOP,\n  BUILT_IN_CONSTANT_P,')
replace('gcc/c-decl.c','  builtin_function ("__builtin_constant_p", default_function_type,','  builtin_function ("__builtin_matching_nop",\n                    build_function_type (void_type_node, endlink),\n                    BUILT_IN_MATCHING_NOP, NULL);\n\n  builtin_function ("__builtin_constant_p", default_function_type,')
replace('gcc/expr.c','    case BUILT_IN_ABS:\n','    case BUILT_IN_MATCHING_NOP:\n        emit_insn (gen_matching_nop (GEN_INT (get_max_uid ())));\n        return const0_rtx;\n\n    case BUILT_IN_ABS:\n')
p=build/'gcc/thumb.md'
p.write_text(p.read_text()+'\n(define_insn "matching_nop"\n  [(unspec_volatile [(match_operand 0 "const_int_operand" "n")] 99)]\n  ""\n  "mov r8, r8")\n')
with (OUT/'compiler-build.log').open('w') as log:subprocess.run(['make','-C',str(build/'gcc'),'-j1','normal'],stdout=log,stderr=subprocess.STDOUT,check=True)
compiler=build/'gcc/agbcc'
report=dict(revision=revision,build_directory=str(build),compiler=str(compiler),compiler_sha256=hashlib.sha256(compiler.read_bytes()).hexdigest(),sources={p:hashlib.sha256((build/p).read_bytes()).hexdigest() for p in ('gcc/tree.h','gcc/c-decl.c','gcc/expr.c','gcc/thumb.md')},production_integrated=False)
(OUT/'compiler.json').write_text(json.dumps(report,indent=2)+'\n');print(compiler)
