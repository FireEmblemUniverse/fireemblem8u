#!/usr/bin/env python3
"""Research compiler bridge: preserve legacy allocation and insert compiled C cores."""
import hashlib,json,re,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
subprocess.run(['python3',str(ROOT/'research/runtime/probe_syscall_cores.py')],check=True)
rebuild=json.loads((ROOT/'docs/runtime-rebuild.json').read_text())
base=Path(rebuild['build_directory'])/'libc/arm'
out=ROOT/'.deps/runtime-syscalls/member';out.mkdir(parents=True,exist_ok=True)
source=(base/'syscalls.i').read_text()
template='mov r0, %1; mov r1, %2; swi %a3; mov %0, r0'
assert source.count(template)==1
# This marker preserves original operand allocation but has no executable body.
# It requires the C-core bridge below; it is not a standalone implementation.
source=source.replace(template,'@ recovered_monitor %0 %1 %2')
(out/'syscalls.i').write_text(source)
subprocess.run([str(ROOT/'tools/agbcc/bin/old_agbcc'),'-O2','-fno-builtin',str(out/'syscalls.i'),'-o',str(out/'marked.s')],check=True)
cores=json.loads((ROOT/'docs/runtime-syscall-core-probe.json').read_text())
sites=json.loads((ROOT/'docs/runtime-syscall-inline.json').read_text())['sites']
result=[];index=0
for line in (out/'marked.s').read_text().splitlines():
    if '@ recovered_monitor' not in line:result.append(line);continue
    m=re.fullmatch(r'\s*@ recovered_monitor (\w+) (\w+) (\w+)',line);assert m,line
    d,a,b=m.groups();site=sites[index]
    assert site['assembly']==f'mov r0, {a}; mov r1, {b}; swi 171; mov {d}, r0'
    assert cores['sites'][index]['core_offset']==0 and cores['sites'][index]['exact_contiguous_core']
    asm=(ROOT/f'.deps/runtime-syscalls/cores/{index}.s').read_text()
    body=asm.split('core:\n',1)[1].split('\t.size\tcore,',1)[0]
    # Retain compiler-generated operations and syntax switches, omit only its return.
    lines=body.splitlines();instructions=[];kept=[]
    for part in lines:
        stripped=part.strip()
        if not stripped or stripped.startswith('@'):continue
        if stripped=='bx\tlr':continue
        if not stripped.startswith('.'):instructions.append(stripped)
        kept.append(part)
    assert len(instructions)==4 and instructions[2]=='swi 171',instructions
    result+=['\t.syntax unified',*kept,'\t.syntax divided']
    index+=1
assert index==13
asm=out/'syscalls.s';asm.write_text('\n'.join(result)+'\n.text\n.align 2,0\n')
obj=out/'syscalls.o'
subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],check=True)
texts=[]
for name,path in [('candidate',obj),('original',base/'syscalls.o')]:
    blob=out/(name+'.bin');subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(path),str(blob)],check=True);texts.append(blob.read_bytes())
assert texts[0]==texts[1]
def symbols(path):return subprocess.check_output(['arm-none-eabi-nm','-S',str(path)],text=True)
def relocs(path):return '\n'.join(subprocess.check_output(['arm-none-eabi-readelf','-r',str(path)],text=True).splitlines()[1:])
assert symbols(obj)==symbols(base/'syscalls.o')
assert relocs(obj)==relocs(base/'syscalls.o')
report=dict(core_probe_sha256=hashlib.sha256((ROOT/'docs/runtime-syscall-core-probe.json').read_bytes()).hexdigest(),exact_text_bytes=len(texts[0]),exact_symbol_table=True,exact_relocations=True,compiled_core_sites=index,member_sha256=hashlib.sha256(obj.read_bytes()).hexdigest(),marker_source_sha256=hashlib.sha256(source.encode()).hexdigest(),scope='Research two-compiler bridge. Marker-only source requires externally generated C cores and is not independently executable. Production unchanged; formal bridge validation and integration remain pending.')
(ROOT/'docs/runtime-syscall-member-probe.json').write_text(json.dumps(report,indent=2)+'\n')
print('Complete 1124-byte syscall text, symbols and relocations match with 13 compiled C cores')
