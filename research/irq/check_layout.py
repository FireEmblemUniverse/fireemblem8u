#!/usr/bin/env python3
"""Reject IRQ layout changes outside immutable-halt and adjacent-call contracts."""
from pathlib import Path
import subprocess,json,hashlib
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/irq-search'
source=(ROOT/'research/irq/search_constrained.c').read_text()
base=['arm-none-eabi-gcc','-c','-O2','-fno-cse-follow-jumps','-fno-shrink-wrap','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
plugin=['-fplugin='+str(OUT/'arm_noreturn_frame.so'),'-fplugin-arg-arm_noreturn_frame-callee=IrqSelected','-fplugin-arg-arm_noreturn_frame-fold-halts=2','-fplugin-arg-arm_noreturn_frame-adjacent=IrqSelected']
mutations=[
 ('wrong_halt_count',source,['-fplugin-arg-arm_noreturn_frame-fold-halts=1']),
 ('removed_loop',source.replace('while (irqBit) {}','',1),[]),
 ('mutable_loop',source.replace('while (irqBit) {}','while (irqBit) { irqBit--; }',1),[]),
 ('memory_loop',source.replace('while (irqBit) {}','while (irqBit) { *(volatile unsigned *)0x04000000=irqBit; }',1),[]),
 ('inverse_loop',source.replace('while (irqBit) {}','while (!irqBit) {}',1),[]),
 ('wrong_adjacent',source,['-fplugin-arg-arm_noreturn_frame-callee=Other','-fplugin-arg-arm_noreturn_frame-adjacent=Other']),
 ('extra_call', 'extern void Extra(void);\n'+source.replace('    irqPending =','    Extra();\n    irqPending =',1),['-fplugin-arg-arm_noreturn_frame-callee=Extra'])]
rejected=[]
for name,text,flags in mutations:
 p=OUT/('invalid-'+name+'.c');p.write_text(text)
 result=subprocess.run(base+plugin+['-DIRQ_PRIVATE_FRAME',*flags,str(p),'-o',str(p.with_suffix('.o'))],capture_output=True,text=True)
 assert result.returncode and 'ARM noreturn frame' in result.stderr,(name,result.stderr)
 rejected.append(name)
controls=[]
for name,flags in [('plain',[]),('plugin',plugin)]:
 obj=OUT/('control-'+name+'.o');binary=obj.with_suffix('.bin')
 subprocess.run(base+flags+[str(ROOT/'research/irq/search_constrained.c'),'-o',str(obj)],check=True,capture_output=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
 controls.append(binary.read_bytes())
assert controls[0]==controls[1]
# A relocated adjacent target must fail the same geometry assertion used in production.
obj=OUT/'layout-positive.o'
subprocess.run(base+plugin+['-DIRQ_PRIVATE_FRAME',str(ROOT/'research/irq/search_constrained.c'),'-o',str(obj)],check=True,capture_output=True)
for gap in (0,4):
 ld=OUT/('layout-'+str(gap)+'.ld')
 ld.write_text('SECTIONS { .text 0x08000118 : { *(.text) } IrqSelected = ADDR(.text) + SIZEOF(.text) + '+str(gap)+'; ASSERT(IrqSelected == IrqSearch + 180, "IRQ search adjacency changed") }')
 result=subprocess.run(['arm-none-eabi-ld','-T',str(ld),str(obj),'-o',str(OUT/('layout-'+str(gap)+'.elf'))],capture_output=True,text=True)
 if gap:assert result.returncode and 'IRQ search adjacency changed' in result.stderr
 else:assert not result.returncode,result.stderr
print(json.dumps(dict(displaced_link_rejected=True,rejected=rejected,unchanged_unannotated_control_sha256=hashlib.sha256(controls[0]).hexdigest(),plugin_source_sha256=hashlib.sha256((ROOT/'tools/arm-dispatch/arm_noreturn_frame.cc').read_bytes()).hexdigest()),indent=2))
