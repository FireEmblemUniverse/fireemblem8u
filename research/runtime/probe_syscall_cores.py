#!/usr/bin/env python3
"""Isolate C register moves around retained SWI; compare contiguous reference cores."""
import hashlib,json,re,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];out=ROOT/'.deps/runtime-syscalls/cores';out.mkdir(parents=True,exist_ok=True)
cc=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
subprocess.run(['python3',str(ROOT/'tools/arm-dispatch/build_copy_add_zero.py'),'--compiler',str(cc),'--output-dir',str(out)],check=True)
rows=[]
for i,site in enumerate(json.loads((ROOT/'docs/runtime-syscall-inline.json').read_text())['sites']):
    a,b,c=re.fullmatch(r'mov r0, (\w+); mov r1, (\w+); swi 171; mov (\w+), r0',site['assembly']).groups()
    regs=sorted(set(['r0','r1',a,b,c]))
    src='\n'.join(f'register unsigned v_{r} asm("{r}");' for r in regs)+'\n__attribute__((matching_thumb_copy_add_zero)) void core(void) { v_r0=v_'+a+'; v_r1=v_'+b+'; asm volatile("swi 171" : "+r"(v_r0), "+r"(v_r1)); v_'+c+'=v_r0; }\n'
    source=out/f'{i}.c';asm=out/f'{i}.s';obj=out/f'{i}.o';blob=out/f'{i}.bin';source.write_text(src)
    command=[str(cc),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-fplugin='+str(out/'copy_add_zero.so'),'-fplugin-arg-copy_add_zero-preserve-thumb-high-copies','-fplugin-arg-copy_add_zero-preserve-thumb-sp-copies',str(source),'-o',str(asm)]
    p=subprocess.run(command,capture_output=True,text=True);assert not p.returncode,p.stderr
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(blob)],check=True)
    code=blob.read_bytes();expected=bytes.fromhex(site['hex']);offset=code.find(expected)
    rows.append(dict(site=i,function=site['function'],source_sha256=hashlib.sha256(src.encode()).hexdigest(),text_hex=code.hex(),reference_core_hex=expected.hex(),exact_contiguous_core=offset>=0,core_offset=offset))
assert sum(x['exact_contiguous_core'] for x in rows)==11
controls=[]
for name,extra,remove in [('sp_without_opt_in',[],True),('arm_mode',['-marm'],False)]:
    args=command[:-3]
    if remove:args=[x for x in args if x!='-fplugin-arg-copy_add_zero-preserve-thumb-sp-copies']
    p=subprocess.run(args+extra+[str(out/'0.c'),'-o',str(out/(name+'.s'))],capture_output=True,text=True)
    assert p.returncode and 'copy add zero requires' in p.stderr,(name,p.stderr)
    controls.append(name)
report=dict(rejected_controls=controls,exact_cores=11,total_cores=13,sites=rows,scope='Research-only isolated snippets; ordinary high-register frames prevent two contiguous cores. The SWI remains inline. Caller context, monitor clobbers, behavior and full-member integration are not verified.')
(ROOT/'docs/runtime-syscall-core-probe.json').write_text(json.dumps(report,indent=2)+'\n')
print('11/13 exact contiguous eight-byte C-move/SWI cores')
