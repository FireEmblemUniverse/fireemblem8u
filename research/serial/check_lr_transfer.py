#!/usr/bin/env python3
"""Check rejection boundaries for the experimental BIOS LR-transfer contract."""
from pathlib import Path
import hashlib,json,subprocess
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/serial-reset'
source=(ROOT/'research/serial/handoff.c').read_text()
base=['arm-none-eabi-gcc','-c','-O2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
plugin=['-fplugin='+str(OUT/'arm_lr_transfer.so')]
mutations=[('no_interwork',source,['-mno-thumb-interwork']),('armv5',source,['-mcpu=arm926ej-s']),('debug',source,['-g']),('thumb',source,['-mthumb']),('unwind',source,['-funwind-tables']),
 ('arguments',source.replace('handoff(void)','handoff(unsigned x)'),[]),
 ('stack',source.replace(' input=(const', ' volatile unsigned stack[4]; stack[0]=1;\n input=(const'),[]),
 ('svc',source.replace('svc #0x110000','svc #0x120000'),[]),
 ('missing_tie',source.replace(' asm volatile("" : "+r"(entry));',''),[]),
 ('wrong_register',source.replace('asm("lr")','asm("r3")'),[]),
 ('scratch_contract',source.replace('"r2", "r3", "ip",','"r2", "r3",'),[]),
 ('return',source.replace('__attribute__((noreturn))','').replace(' __builtin_unreachable();',''),[])]
rejected=[]
for name,text,flags in mutations:
 p=OUT/('invalid-transfer-'+name+'.c');p.write_text(text)
 result=subprocess.run(base+plugin+['-DSERIAL_LR_TRANSFER',*flags,str(p),'-o',str(p.with_suffix('.o'))],capture_output=True,text=True)
 assert result.returncode and 'ARM LR transfer' in result.stderr,(name,result.stderr)
 rejected.append(name)
controls=[]
for name,flags in [('plain',[]),('plugin',plugin)]:
 obj=OUT/('transfer-control-'+name+'.o');binary=obj.with_suffix('.bin')
 subprocess.run(base+flags+[str(ROOT/'research/serial/handoff.c'),'-o',str(obj)],check=True,capture_output=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
 controls.append(binary.read_bytes())
assert controls[0]==controls[1]
print(json.dumps(dict(rejected=rejected,unchanged_control_sha256=hashlib.sha256(controls[0]).hexdigest(),plugin_source_sha256=hashlib.sha256((ROOT/'tools/arm-dispatch/arm_lr_transfer.cc').read_bytes()).hexdigest()),indent=2))
