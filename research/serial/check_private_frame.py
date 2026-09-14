#!/usr/bin/env python3
"""Exercise the opt-in ARM private-frame contract and unchanged control."""
from pathlib import Path
import subprocess,json,hashlib
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/serial-reset'
source=(ROOT/'research/serial/reset_constrained.c').read_text()
base=['arm-none-eabi-gcc','-c','-O2','-fno-cse-follow-jumps','-std=gnu89','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
plugin=['-fplugin='+str(OUT/'arm_noreturn_frame.so'),'-fplugin-arg-arm_noreturn_frame-callee=sio_polling','-fplugin-arg-arm_noreturn_frame-callee=SerialDecompressAndJump']
mutations=[
 ('debug',source,['-g']),('thumb','extern void SerialDecompressAndJump(void) __attribute__((noreturn)); void __attribute__((noreturn,matching_arm_noreturn_frame)) bad(void) { SerialDecompressAndJump(); }',['-mthumb']),
 ('unwind',source,['-funwind-tables']),
 ('returning',source.replace('void SERIAL_FRAME __attribute__((noreturn)) SerialReset','void SERIAL_FRAME SerialReset').replace('    SerialDecompressAndJump();','    return;'),[]),
 ('arguments',source.replace('SerialReset(void)','SerialReset(unsigned arg)'),[]),
 ('stack',source.replace('    unsigned accepted;','    volatile unsigned frame[4];\n    frame[0]=1;\n    unsigned accepted;'),[]),
 ('instructions',source.replace('    unsigned accepted;','    asm volatile("nop");\n    unsigned accepted;'),[]),
 ('lr_data','register unsigned link asm("lr");\n'+source.replace('    unsigned accepted;','    asm volatile("" : "+r"(link));\n    unsigned accepted;'),[]),
 ('unknown_call',source.replace('sio_polling','unknown_poll'),[]),
 ('indirect_call',source.replace('extern void sio_polling(void);','extern void (*sio_polling)(void);'),[]),
]
rejected=[]
for name,text,flags in mutations:
 p=OUT/('invalid-'+name+'.c');p.write_text(text)
 result=subprocess.run(base+plugin+['-DSERIAL_PRIVATE_FRAME',*flags,str(p),'-o',str(p.with_suffix('.o'))],capture_output=True,text=True)
 assert result.returncode and 'ARM noreturn frame' in result.stderr,(name,result.stderr)
 rejected.append(name)
# Without the opt-in attribute, the plugin must leave compiler output alone.
control=[]
for name,flags in [('plain',[]),('plugin',plugin)]:
 obj=OUT/('control-'+name+'.o');binary=obj.with_suffix('.bin')
 subprocess.run(base+flags+[str(ROOT/'research/serial/reset_constrained.c'),'-o',str(obj)],check=True,capture_output=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
 control.append(binary.read_bytes())
assert control[0]==control[1]
print(json.dumps(dict(rejected=rejected,unchanged_unannotated_control_sha256=hashlib.sha256(control[0]).hexdigest(),plugin_source_sha256=hashlib.sha256((ROOT/'tools/arm-dispatch/arm_noreturn_frame.cc').read_bytes()).hexdigest()),indent=2))
