#!/usr/bin/env python3
"""Compare C register assignments around the active monitor SWI with legacy code."""
import hashlib,json,re,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
receipt=json.loads((ROOT/'docs/runtime-rebuild.json').read_text())
base=Path(receipt['build_directory'])/'libc/arm'
original=(base/'syscalls.i').read_text()
pattern=r'do_AngelSWI \(int reason, void \* arg\)\n\{.*?\n\}'
assert len(re.findall(pattern,original,re.S))==1
OUT=ROOT/'.deps/runtime-syscalls/probe';OUT.mkdir(parents=True,exist_ok=True)
variants={
 'tied': '''do_AngelSWI (int reason, void * arg)
{
  register int value asm ("r0") = reason;
  register void * argument asm ("r1") = arg;
  asm volatile ("swi %a3" : "=r" (value) : "0" (value), "r" (argument), "i" (0xAB) : "lr");
  return value;
}''',
 'readwrite': '''do_AngelSWI (int reason, void * arg)
{
  register int value asm ("r0") = reason;
  register void * argument asm ("r1") = arg;
  asm volatile ("swi %a2" : "+r" (value), "+r" (argument) : "i" (0xAB) : "lr");
  return value;
}'''}
rows=[];reference=None
for name,body in [('baseline',None),*variants.items()]:
    text=original if body is None else re.sub(pattern,lambda m:body,original,flags=re.S)
    source=OUT/(name+'.i');asm=OUT/(name+'.s');obj=OUT/(name+'.o');blob=OUT/(name+'.bin')
    source.write_text(text)
    result=subprocess.run([str(ROOT/'tools/agbcc/bin/old_agbcc'),'-O2','-fno-builtin',str(source),'-o',str(asm)],capture_output=True,text=True)
    row=dict(variant=name,compile_exit=result.returncode,diagnostics=result.stderr,source_sha256=hashlib.sha256(text.encode()).hexdigest())
    if result.returncode==0:
        asm.write_text(asm.read_text()+'\n.text\n.align 2,0\n')
        result=subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],capture_output=True,text=True)
        row['assemble_exit']=result.returncode;row['assemble_diagnostics']=result.stderr
        if result.returncode==0:
            subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(blob)],check=True)
            code=blob.read_bytes()
            if reference is None:reference=code
            row.update(text_bytes=len(code),text_sha256=hashlib.sha256(code).hexdigest(),exact_reference_text=code==reference,swi_sites=len(re.findall(r'\bswi\s+171',asm.read_text())))
    rows.append(row)
assert rows[0]['compile_exit']==0 and rows[0]['assemble_exit']==0
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(base/'syscalls.o'),str(OUT/'reference.bin')],check=True)
assert reference==(OUT/'reference.bin').read_bytes()
report=dict(compiler_sha256=hashlib.sha256((ROOT/'tools/agbcc/bin/old_agbcc').read_bytes()).hexdigest(),variants=rows,scope='Research only; byte comparison of complete unrelocated syscall text. No semantic or integration claim.')
(ROOT/'docs/runtime-syscall-move-probe.json').write_text(json.dumps(report,indent=2)+'\n')
for row in rows:print(row)
