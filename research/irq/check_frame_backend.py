#!/usr/bin/env python3
"""Build and validate the isolated IRQ frame experiment; no production edits."""
from pathlib import Path
import hashlib,json,subprocess,sys
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/irq-frame-backend';OUT.mkdir(parents=True,exist_ok=True)
compiler=str(ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc')
subprocess.run([sys.executable,str(ROOT/'tools/arm-dispatch/build_irq_frame.py'),'--compiler',compiler],check=True,capture_output=True)
source=(ROOT/'research/irq/continuation.c').read_text()
flags=[compiler,'-c','-O2','-fno-schedule-insns2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
plugin=['-fplugin='+str(OUT/'irq_frame.so')]
def compile(name,text,extra):
 src=OUT/(name+'.c');src.write_text(text)
 return subprocess.run(flags+extra+[str(src),'-o',str(OUT/(name+'.o'))],capture_output=True,text=True)
r=compile('candidate',source,plugin+['-DRESEARCH_IRQ_FRAME']);assert r.returncode==0,r.stderr
(OUT/'candidate.ld').write_text('SECTIONS { .text 0x080f0000 : { *(.text) } gIRQHandlers = 0x030030f0; }')
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'candidate.ld'),str(OUT/'candidate.o'),'-o',str(OUT/'candidate.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
run=subprocess.run([sys.executable,str(ROOT/'research/irq/check_dispatch.py'),'--continuation',str(OUT/'candidate.bin')],capture_output=True,text=True,check=True)
report=json.loads(run.stdout)
mutants=[
 ('thumb',source,['-mthumb']),
 ('debug',source,['-g']),
 ('unwind',source,['-funwind-tables']),
 ('argument',source.replace('IrqContinuation(void)','IrqContinuation(unsigned unused)'),[]),
 ('stack_decrement',source.replace('irqStack--;','irqStack -= 2;'),[]),
 ('frame_advance',source.replace('irqStack += 4;','irqStack += 5;'),[]),
 ('restore_wrong_lr',source.replace('irqLink = irqStack[3];','irqLink = irqStack[2];'),['-fno-late-combine-instructions']),
 ('mode_stack_constraint',source.replace('"+k"(irqStack), "+r"(irqLink)','"+r"(irqStack), "+r"(irqLink)'),[]),
 ('extra_call',source.replace('irqStack--;','((void (*)(void))irqValue)();\n    irqStack--;'),[]),
]
rejected=[]
for name,text,extra in mutants:
 result=compile(name,text,plugin+['-DRESEARCH_IRQ_FRAME']+extra)
 assert result.returncode!=0 and 'IRQ frame' in result.stderr,(name,result.stderr)
 rejected.append(name)
# Plugin loading without opt-in must not alter the emitted instructions.
for name,extra in [('plain',[]),('unannotated',plugin)]:
 result=compile(name,source,extra);assert result.returncode==0,result.stderr
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/(name+'.o')),str(OUT/(name+'.bin'))],check=True)
assert (OUT/'plain.bin').read_bytes()==(OUT/'unannotated.bin').read_bytes()
report.update(rejected_cases=rejected,unannotated_control_unchanged=True,source_sha256=hashlib.sha256(source.encode()).hexdigest(),backend_sha256=hashlib.sha256((ROOT/'tools/arm-dispatch/irq_frame.cc').read_bytes()).hexdigest())
# Recreate the original shared-pool layout around the external C pointer word.
external_flags=plugin+['-DRESEARCH_IRQ_FRAME','-DRESEARCH_IRQ_EXTERNAL_POOL','-fplugin-arg-irq_frame-pool=IrqHandlersPointer']
result=compile('wrong_pool_symbol',source.replace('gIRQHandlers','gOtherHandlers'),external_flags)
assert result.returncode!=0 and 'IRQ frame requires sole handler symbol word' in result.stderr
report['wrong_pool_symbol_rejected']=True
result=compile('external',source,external_flags);assert result.returncode==0,result.stderr
rom=(ROOT/'baserom.gba').read_bytes()
prefix=[int.from_bytes(rom[n:n+4],'little') for n in (0x21c,0x220)]
layout=('SECTIONS { .text 0x080001cc : { *(.text) LONG(%d) LONG(%d) *(.rodata.irq_handlers) } '
        'gIRQHandlers = 0x030030f0; ASSERT(IrqHandlersPointer == IrqContinuation + 88, "IRQ handler pool displacement") }')%tuple(prefix)
(OUT/'external.ld').write_text(layout)
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'external.ld'),str(OUT/'external.o'),'-o',str(OUT/'external.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'external.elf'),str(OUT/'external.bin')],check=True)
external=(OUT/'external.bin').read_bytes()
assert external==rom[0x1cc:0x228],[(i,hex(a),hex(b)) for i,(a,b) in enumerate(zip(external,rom[0x1cc:0x228])) if a!=b]
run=subprocess.run([sys.executable,str(ROOT/'research/irq/check_dispatch.py'),'--continuation',str(OUT/'external.bin')],capture_output=True,text=True,check=True)
report['external_pool_model']=json.loads(run.stdout)
report['isolated_original_region_match']=dict(start='0x080001cc',end='0x08000228',bytes=len(external),instruction_bytes=80,retained_status_assembly_bytes=20,fixture_pool_prefix_bytes=8,c_pointer_bytes=4)
(OUT/'displaced.ld').write_text(layout.replace('LONG(%d)'%prefix[0],'LONG(0) LONG(%d)'%prefix[0],1))
negative=subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'displaced.ld'),str(OUT/'external.o'),'-o',str(OUT/'displaced.elf')],capture_output=True,text=True)
assert negative.returncode!=0 and 'IRQ handler pool displacement' in negative.stderr
report['displaced_pool_rejected']=True
report['compiler_extension_sha256']=hashlib.sha256((ROOT/'tools/arm-dispatch/matching.md').read_bytes()).hexdigest()
print(json.dumps(report,indent=2))
