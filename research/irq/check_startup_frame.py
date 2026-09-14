#!/usr/bin/env python3
"""Verify the startup entry-save suppression and its rejection boundary."""
from pathlib import Path
import hashlib,json,subprocess,sys
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/startup-frame-backend'
subprocess.run([sys.executable,str(ROOT/'research/irq/build_startup_frame.py')],check=True,capture_output=True)
compiler=str(ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc')
plugin=OUT/'startup_frame.so';source=(ROOT/'research/irq/startup.c').read_text()
r=subprocess.run([sys.executable,str(ROOT/'research/irq/check_startup.py'),'--plugin',str(plugin),'--compiler',compiler],check=True,capture_output=True,text=True)
report=json.loads(r.stdout)
flags=[compiler,'-c','-O2','-fno-schedule-insns2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
def compile(name,text,extra):
 p=OUT/(name+'.c');p.write_text(text)
 return subprocess.run(flags+extra+[str(p),'-o',str(OUT/(name+'.o'))],capture_output=True,text=True)
mutants=[('wrong_mode',source.replace('startupValue = 0x12','startupValue = 0x13'),[]),('missing_value_tie',source.replace('        asm volatile("" : "+r"(startupValue));\n',''),[]),('extra_stack_store',source.replace('startupValue = 0x12;','*startupStack = startupValue;\n        startupValue = 0x12;'),[]),('argument',source.replace('Startup(void)','Startup(unsigned unused)'),[]),('debug',source,['-g']),('unwind',source,['-funwind-tables']),('thumb',source,['-mthumb'])]
for name,text,extra in mutants:
 r=compile(name,text,['-DRESEARCH_STARTUP_FRAME','-fplugin='+str(plugin)]+extra)
 assert r.returncode!=0 and 'Startup frame' in r.stderr,(name,r.stderr)
for name,extra in [('plain',[]),('unannotated',['-fplugin='+str(plugin)])]:
 r=compile(name,source,extra);assert r.returncode==0,r.stderr
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/(name+'.o')),str(OUT/(name+'.bin'))],check=True)
assert (OUT/'plain.bin').read_bytes()==(OUT/'unannotated.bin').read_bytes()
report.update(rejected=[m[0] for m in mutants],unannotated_control_unchanged=True,backend_sha256=hashlib.sha256((ROOT/'research/irq/startup_frame.cc').read_bytes()).hexdigest())
# Exercise the exact layout with synthetic ARM and Thumb main targets.
r=subprocess.run([sys.executable,str(ROOT/'research/irq/check_startup.py'),'--plugin',str(plugin),'--compiler',compiler,'--layout'],check=True,capture_output=True,text=True)
report['layout_model']=json.loads(r.stdout)
extra=['-DRESEARCH_STARTUP_FRAME','-DRESEARCH_STARTUP_LAYOUT','-fplugin='+str(plugin),'-fplugin-arg-startup_frame-layout']
r=compile('layout',source,extra);assert r.returncode==0,r.stderr
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
# readelf preserves the Thumb function-address bit that nm clears.
main_symbol=next(line.split() for line in subprocess.check_output(['arm-none-eabi-readelf','-s',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if line.split() and line.split()[-1]=='AgbMain')
assert main_symbol[3]=='FUNC'
symbols['AgbMain']=int(main_symbol[1],16)
layout=('SECTIONS { .text 0x080000c0 : { *(.text) } .stack 0x080000f4 : { *(.rodata.startup_stack) } '
        '.far 0x0800021c : { *(.rodata.startup_far) } IrqMain = 0x080000fc; AgbMain = %d; __sp_irq = %d; __sp_usr = %d; '
        'ASSERT(SIZEOF(.text) == 52, "Startup code size changed") '
        'ASSERT(IrqMain == Startup + 60, "Startup ADR target changed") '
        'ASSERT(StartupStackPointers == Startup + 52, "Startup stack pool moved") '
        'ASSERT(StartupFarPointers == Startup + 348, "Startup far pool moved") }')%(symbols['AgbMain'],symbols['__sp_irq'],symbols['__sp_usr'])
(OUT/'layout.ld').write_text(layout)
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'layout.ld'),str(OUT/'layout.o'),'-o',str(OUT/'layout.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text','-j','.stack','-j','.far',str(OUT/'layout.elf'),str(OUT/'layout.bin')],check=True)
code=(OUT/'layout.bin').read_bytes();rom=(ROOT/'baserom.gba').read_bytes()
assert code[:60]==rom[0xc0:0xfc]
assert code[348:356]==rom[0x21c:0x224]
report['exact_regions']=[dict(start='0x080000c0',bytes=60,instruction_bytes=52),dict(start='0x0800021c',bytes=8,instruction_bytes=0)]
report['retained_status_assembly_bytes']=8
report['exact_region_sha256']=hashlib.sha256(code[:60]+code[348:356]).hexdigest()
for name,old,new in [('adr','IrqMain = 0x080000fc','IrqMain = 0x08000100'),('stack','.stack 0x080000f4','.stack 0x080000f8'),('far','.far 0x0800021c','.far 0x08000220')]:
 (OUT/(name+'.ld')).write_text(layout.replace(old,new))
 result=subprocess.run(['arm-none-eabi-ld','-T',str(OUT/(name+'.ld')),str(OUT/'layout.o'),'-o',str(OUT/(name+'.elf'))],capture_output=True,text=True)
 assert result.returncode!=0 and 'Startup' in result.stderr,(name,result.stderr)
report['displaced_layouts_rejected']=['adr','stack','far']
r=compile('wrong_pool',source.replace('IrqMain','OtherIrq'),extra)
assert r.returncode!=0 and 'Startup frame source pool value rejected' in r.stderr,r.stderr
report['wrong_pool_symbol_rejected']=True
report['compiler_extension_sha256']=hashlib.sha256((ROOT/'tools/arm-dispatch/matching.md').read_bytes()).hexdigest()
print(json.dumps(report,indent=2))
