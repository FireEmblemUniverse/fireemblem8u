#!/usr/bin/env python3
"""Fresh-build the payload continuation and verify its original shared pool."""
import hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/payload-irq-continuation';OUT.mkdir(exist_ok=True)
source=ROOT/'research/payload/irq_continuation.c'
subprocess.run(['python3',str(ROOT/'tools/arm-dispatch/build_irq_frame.py'),'--output-dir',str(OUT)],check=True)
compiler=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
flags=['-c','-O2','-fno-schedule-insns2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes','-fplugin='+str(OUT/'irq_frame.so'),'-fplugin-arg-irq_frame-pool=PayloadIrqHandlersPointer']
subprocess.run([str(compiler),*flags,str(source),'-o',str(OUT/'candidate.o')],check=True)
images=[]
for name in ('mgfembp','mgfembp_20030206','mgfembp_20030219'):
 rom=(ROOT/f'mgfembp/{name}.bin').read_bytes()
 symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/f'mgfembp/{name}.elf')],text=True).splitlines() if len(line.split())==3}
 layout=('SECTIONS { .text 0x02010100 : { *(.text) LONG(0x03007ffc) LONG(%d) *(.rodata.irq_handlers) } gIRQHandlers = %d; ASSERT(PayloadIrqHandlersPointer == PayloadIrqSelected + 88, "IRQ handler pool displacement") }')%(symbols['Main']|1,symbols['gIrqFuncTable'])
 script=OUT/(name+'.ld');script.write_text(layout)
 elf=OUT/(name+'.elf');binary=OUT/(name+'.bin')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(OUT/'candidate.o'),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();assert code==rom[0x100:0x15c]
 script.write_text(layout.replace('LONG(0x03007ffc)','LONG(0) LONG(0x03007ffc)'))
 bad=subprocess.run(['arm-none-eabi-ld','-T',str(script),str(OUT/'candidate.o'),'-o',str(OUT/'displaced.elf')],capture_output=True,text=True)
 assert bad.returncode and 'IRQ handler pool displacement' in bad.stderr
 script.write_text(layout)
 images.append(dict(image=name,bytes=len(code),sha256=hashlib.sha256(code).hexdigest(),displaced_pool_rejected=True))
report=dict(images=images,instruction_bytes=80,c_generated_instruction_bytes=60,retained_status_assembly_bytes=20,fixture_pool_prefix_bytes=8,c_pointer_bytes=4,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),production_integrated=False,scope='Exact continuation and shared-pool bytes in all three payloads. Research gIRQHandlers symbol is bound to each payload gIrqFuncTable address. No independent callback/mode/return model yet.')
(ROOT/'docs/payload-irq-continuation-research.json').write_text(json.dumps(report,indent=2)+'\n')
print('80 continuation instruction bytes and 12 pool bytes match all three payloads; three displaced pools reject')
