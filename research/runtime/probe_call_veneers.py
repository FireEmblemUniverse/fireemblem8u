#!/usr/bin/env python3
"""Probe register-call C lowering; does not replace the production archive."""
import hashlib, json, subprocess
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
out = ROOT / '.deps/runtime-veneers'
out.mkdir(parents=True, exist_ok=True)
cc = ROOT / '.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
subprocess.run(['python3', str(ROOT/'tools/arm-dispatch/build_tail_transfer.py'), '--compiler', str(cc), '--output-dir', str(out)], check=True)
original = out/'original.o'
original.write_bytes(subprocess.check_output(['arm-none-eabi-ar', 'p', str(ROOT/'.deps/runtime-c/libgcc.a'), '_call_via_rX.o']))
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(original),str(out/'original.bin')],check=True)
reference=(out/'original.bin').read_bytes()
rows=[]
for r in range(15):
    src=out/f'r{r}.c'
    src.write_text(f'register void (*destination)(void) __asm__("r{r}");\n__attribute__((matching_tail_transfer)) void veneer(void) {{ destination(); }}\n')
    asm=out/f'r{r}.s'
    command=[str(cc),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-fplugin='+str(out/'tail_transfer.so'),'-fplugin-arg-tail_transfer-private-frame64',f'-fplugin-arg-tail_transfer-indirect-register={r}',str(src),'-o',str(asm)]
    result=subprocess.run(command,text=True,capture_output=True)
    row=dict(register=r,exit=result.returncode,diagnostics=result.stderr)
    if result.returncode==0:
        obj=out/f'r{r}.o'; blob=out/f'r{r}.bin'
        subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],check=True)
        subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(blob)],check=True)
        actual=blob.read_bytes()
        row.update(candidate_hex=actual.hex(),reference_entry_hex=reference[r*4:r*4+4].hex(),transfer_exact=actual==reference[r*4:r*4+2])
        assert row['transfer_exact']
    else:
        assert r>=8 and 'failed to initialize plugin' in result.stderr
    rows.append(row)
assert sum(row.get('transfer_exact',False) for row in rows)==8
report=dict(scope='Research only: transfer instruction comparison; padding, high registers, execution model and archive integration remain unverified.',reference_sha256=hashlib.sha256(reference).hexdigest(),plugin_source_sha256=hashlib.sha256((ROOT/'tools/arm-dispatch/tail_transfer.cc').read_bytes()).hexdigest(),results=rows)
(ROOT/'docs/runtime-call-veneer-probe.json').write_text(json.dumps(report,indent=2)+'\n')
print('8/15 register transfers exact; 7 rejected by existing plugin contract; no production replacement')
