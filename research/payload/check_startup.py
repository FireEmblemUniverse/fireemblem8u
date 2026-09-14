#!/usr/bin/env python3
"""Verify payload startup C bytes with explicit original layout fixtures."""
import hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/payload-startup';OUT.mkdir(exist_ok=True)
source=ROOT/'research/payload/startup.c'
subprocess.run(['python3',str(ROOT/'tools/arm-dispatch/build_startup_frame.py'),'--output-dir',str(OUT)],check=True)
compiler=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
flags=['-c','-O2','-fno-schedule-insns2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes','-fplugin='+str(OUT/'startup_frame.so'),'-fplugin-arg-startup_frame-layout']
subprocess.run([str(compiler),*flags,str(source),'-o',str(OUT/'startup.o')],check=True)
images=[]
for name in ('mgfembp','mgfembp_20030206','mgfembp_20030219'):
 main=next(line.split() for line in subprocess.check_output(['arm-none-eabi-readelf','-s',str(ROOT/f'mgfembp/{name}.elf')],text=True).splitlines() if line.split() and line.split()[-1]=='Main')
 assert main[3]=='FUNC'
 layout=('SECTIONS { .text 0x02010000 : { *(.text) } .stack 0x02010034 : { *(.rodata.startup_stack) } .far 0x02010150 : { *(.rodata.startup_far) } IrqMain = 0x0201003c; AgbMain = %d; __sp_irq = 0x03007fa0; __sp_usr = 0x03007e00; ASSERT(SIZEOF(.text)==52,"Startup code size changed") ASSERT(IrqMain == PayloadStartup + 60,"Startup ADR moved") ASSERT(StartupStackPointers == PayloadStartup + 52,"Startup stack pool moved") ASSERT(StartupFarPointers == PayloadStartup + 336,"Startup far pool moved") }')%int(main[1],16)
 script=OUT/(name+'.ld');script.write_text(layout)
 elf=OUT/(name+'.elf');binary=OUT/(name+'.bin')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(OUT/'startup.o'),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text','-j','.stack','-j','.far',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/f'mgfembp/{name}.bin').read_bytes()
 assert code[:60]==rom[:60] and code[336:344]==rom[336:344]
 rejected=[]
 for kind,old,new in [('adr','IrqMain = 0x0201003c','IrqMain = 0x02010040'),('stack','.stack 0x02010034','.stack 0x02010038'),('far','.far 0x02010150','.far 0x02010154')]:
  badscript=OUT/(name+'-'+kind+'.ld');badscript.write_text(layout.replace(old,new))
  bad=subprocess.run(['arm-none-eabi-ld','-T',str(badscript),str(OUT/'startup.o'),'-o',str(OUT/'bad.elf')],capture_output=True,text=True)
  assert bad.returncode and 'Startup' in bad.stderr
  rejected.append(kind)
 images.append(dict(image=name,exact_region_sha256=hashlib.sha256(code[:60]+code[336:344]).hexdigest(),rejected_layouts=rejected))
report=dict(images=images,instruction_bytes=52,c_generated_instruction_bytes=44,retained_mode_write_bytes=8,c_data_bytes=16,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),production_integrated=False,scope='Exact startup instructions and stack/far pointer data, with linker fixtures binding main-ROM symbol names to payload addresses. No independent startup execution model yet.')
(ROOT/'docs/payload-startup-research.json').write_text(json.dumps(report,indent=2)+'\n')
print('52 instruction bytes and 16 C data bytes match all three payloads; nine layout mutations reject')
