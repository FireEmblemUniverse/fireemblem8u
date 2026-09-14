#!/usr/bin/env python3
"""Verify the startup entry-save suppression and its rejection boundary."""
from pathlib import Path
import hashlib,json,subprocess,sys
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/startup-frame-backend'
subprocess.run([sys.executable,str(ROOT/'research/irq/build_startup_frame.py')],check=True,capture_output=True)
plugin=OUT/'startup_frame.so';source=(ROOT/'research/irq/startup.c').read_text()
r=subprocess.run([sys.executable,str(ROOT/'research/irq/check_startup.py'),'--plugin',str(plugin)],check=True,capture_output=True,text=True)
report=json.loads(r.stdout)
flags=['arm-none-eabi-gcc','-c','-O2','-fno-schedule-insns2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
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
print(json.dumps(report,indent=2))
