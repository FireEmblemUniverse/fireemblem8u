#!/usr/bin/env python3
"""Build the recovered Thumb-only division-zero hook with original archive padding."""
import argparse,hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
p=argparse.ArgumentParser();p.add_argument('--output-dir',type=Path,required=True);a=p.parse_args();out=a.output_dir.resolve();out.mkdir(parents=True,exist_ok=True)
cc=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc';source=ROOT/'research/runtime/div0.c'
subprocess.run(['python3',str(ROOT/'tools/arm-dispatch/build_empty_thumb_return.py'),'--compiler',str(cc),'--output-dir',str(out)],check=True)
asm=out/'_dvmd_tls.s';obj=out/'_dvmd_tls.o'
subprocess.run([str(cc),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-DMATCHING_DIV0','-Werror=attributes','-fplugin='+str(out/'empty_thumb_return.so'),str(source),'-o',str(asm)],check=True)
asm.write_text('.text\n.balign 4,0\n'+asm.read_text()+'\n.text\n.balign 4,0\n')
subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],check=True)
subprocess.run(['arm-none-eabi-objcopy','--redefine-sym','runtime_div0=__div0',str(obj)],check=True)
symbols=subprocess.check_output(['arm-none-eabi-nm','-S',str(obj)],text=True)
assert any(x.split()==['00000000','00000002','T','__div0'] for x in symbols.splitlines()),symbols
blob=out/'_dvmd_tls.bin';subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(blob)],check=True)
assert blob.read_bytes()==(ROOT/'baserom.gba').read_bytes()[0xd1990:0xd1994]
report=dict(member=str(obj),member_sha256=hashlib.sha256(obj.read_bytes()).hexdigest(),source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),plugin_sha256=hashlib.sha256((out/'empty_thumb_return.so').read_bytes()).hexdigest(),instruction_bytes=2,text_bytes=4)
(out/'div0-build.json').write_text(json.dumps(report,indent=2)+'\n');print(obj)
