#!/usr/bin/env python3
"""Fresh-build the payload continuation and verify its original shared pool."""
import argparse,hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/payload-irq-continuation';OUT.mkdir(exist_ok=True)
parser=argparse.ArgumentParser()
parser.add_argument('--source',type=Path,default=ROOT/'research/payload/irq_continuation.c')
parser.add_argument('--json',type=Path,default=ROOT/'docs/payload-irq-continuation-research.json')
args=parser.parse_args();source=args.source
subprocess.run(['python3',str(ROOT/'tools/arm-dispatch/build_irq_frame.py'),'--output-dir',str(OUT)],check=True)
compiler=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
flags=['-c','-O2','-fno-schedule-insns2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes','-fplugin='+str(OUT/'irq_frame.so'),'-fplugin-arg-irq_frame-pool=PayloadIrqHandlersPointer','-fplugin-arg-irq_frame-handler-symbol=gIrqFuncTable']
subprocess.run([str(compiler),*flags,str(source),'-o',str(OUT/'candidate.o')],check=True)
rejected=[]
for name,extra,text in [
 ('wrong_table',[],source.read_text().replace('gIrqFuncTable','OtherTable')),
 ('wrong_contract',['-fplugin-arg-irq_frame-handler-symbol=OtherTable'],source.read_text()),
 ('invalid_identifier',['-fplugin-arg-irq_frame-handler-symbol=bad-name'],source.read_text()),
 ('empty_identifier',['-fplugin-arg-irq_frame-handler-symbol='],source.read_text()),
]:
 test=OUT/(name+'.c');test.write_text(text)
 base=[f for f in flags if not f.startswith('-fplugin-arg-irq_frame-handler-symbol=')] if extra else flags
 result=subprocess.run([str(compiler),*base,*extra,str(test),'-o',str(OUT/(name+'.o'))],capture_output=True,text=True)
 assert result.returncode and ('IRQ frame' in result.stderr or 'plugin' in result.stderr),result.stderr
 rejected.append(name)
images=[]
for name in ('mgfembp','mgfembp_20030206','mgfembp_20030219'):
 rom=(ROOT/f'mgfembp/{name}.bin').read_bytes()
 symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/f'mgfembp/{name}.elf')],text=True).splitlines() if len(line.split())==3}
 layout=('SECTIONS { .text 0x02010100 : { *(.text) LONG(0x03007ffc) LONG(%d) *(.rodata.irq_handlers) } gIrqFuncTable = %d; ASSERT(PayloadIrqHandlersPointer == PayloadIrqSelected + 88, "IRQ handler pool displacement") }')%(symbols['Main']|1,symbols['gIrqFuncTable'])
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
report=dict(rejected_contracts=rejected,images=images,instruction_bytes=80,c_generated_instruction_bytes=60,retained_status_assembly_bytes=20,fixture_pool_prefix_bytes=8,c_pointer_bytes=4,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),production_integrated=source.resolve()==ROOT/'mgfembp/src/irq_continuation.c',scope='Exact continuation and shared-pool bytes in all three payloads. Explicit handler-symbol contract binds gIrqFuncTable. No independent callback/mode/return model yet.')
args.json.write_text(json.dumps(report,indent=2)+'\n')
print('80 continuation instruction bytes and 12 pool bytes match all three payloads; three displaced pools reject')
