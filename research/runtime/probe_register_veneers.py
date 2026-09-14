#!/usr/bin/env python3
"""Probe register-call C lowering; does not replace the production archive."""
import hashlib, json, subprocess
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
out = ROOT / '.deps/runtime-veneers'
out.mkdir(parents=True, exist_ok=True)
cc = ROOT / '.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
subprocess.run(['python3', str(ROOT/'tools/arm-dispatch/build_register_veneer.py'), '--compiler', str(cc), '--output-dir', str(out)], check=True)
original = out/'original.o'
original.write_bytes(subprocess.check_output(['arm-none-eabi-ar', 'p', str(ROOT/'.deps/runtime-c/libgcc.a'), '_call_via_rX.o']))
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(original),str(out/'original.bin')],check=True)
reference=(out/'original.bin').read_bytes()
rows=[]
for r in range(15):
    src=out/f'r{r}.c'
    src.write_text(f'register void (*destination)(void) __asm__("r{r}");\n__attribute__((matching_register_veneer)) void veneer(void) {{ destination(); }}\n')
    asm=out/f'r{r}.s'
    command=[str(cc),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-fplugin='+str(out/'register_veneer.so'),str(src),'-o',str(asm)]
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
        assert r==13 and 'register veneer requires' in result.stderr
    rows.append(row)
assert sum(row.get('transfer_exact',False) for row in rows)==14
controls=[]
base='register void (*destination)(void) __asm__("r8");\n'
for name,body,extra in [
    ('argument','void veneer(int x) { destination(); }',[]),
    ('nonvoid','int veneer(void) { destination(); return 1; }',[]),
    ('store','volatile int value; void veneer(void) { value=1; destination(); }',[]),
    ('two_calls','void veneer(void) { destination(); destination(); }',[]),
    ('arm','void veneer(void) { destination(); }',['-marm']),
    ('debug','void veneer(void) { destination(); }',['-g']),
    ('unwind','void veneer(void) { destination(); }',['-funwind-tables']),
]:
    # Put the attribute immediately before the function, including the store control.
    body=body.replace('void veneer','__attribute__((matching_register_veneer)) void veneer').replace('int veneer','__attribute__((matching_register_veneer)) int veneer')
    src=out/('reject-'+name+'.c');src.write_text(base+body+'\n')
    args=command[:-3]+extra+[str(src),'-o',str(out/('reject-'+name+'.s'))]
    result=subprocess.run(args,text=True,capture_output=True)
    assert result.returncode and 'register veneer requires' in result.stderr,(name,result.stderr)
    controls.append(dict(name=name,rejected=True,diagnostics=result.stderr))
report=dict(negative_controls=controls,scope='Research only: transfer instruction comparison; SP backend support, padding, execution model and archive integration remain unverified.',reference_sha256=hashlib.sha256(reference).hexdigest(),plugin_source_sha256=hashlib.sha256((ROOT/'tools/arm-dispatch/tail_transfer.cc').read_bytes()).hexdigest(),results=rows)
(ROOT/'docs/runtime-register-veneer-probe.json').write_text(json.dumps(report,indent=2)+'\n')
print('14/15 register transfers exact; SP explicitly rejected; no production replacement')
