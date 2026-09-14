#!/usr/bin/env python3
"""Package all C register veneers with original in-symbol alignment padding."""
import argparse,hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--output-dir',type=Path,required=True);args=parser.parse_args()
OUT=args.output_dir.resolve();OUT.mkdir(parents=True,exist_ok=True)
cc=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
subprocess.run(['python3',str(ROOT/'tools/arm-dispatch/build_register_veneer.py'),'--compiler',str(cc),'--output-dir',str(OUT)],check=True)
plugin=OUT/'register_veneer.so'
source=ROOT/'runtime/register_veneer.c'
names=[f'r{r}' for r in range(10)]+['sl','fp','ip','sp','lr']
objects=[]
for reg,name in enumerate(names):
    symbol='_call_via_'+name
    asm=OUT/(name+'.s');obj=OUT/(name+'.o')
    subprocess.run([str(cc),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes','-fplugin='+str(plugin),f'-DVENEER_REGISTER="r{reg}"','-DVENEER_NAME='+symbol,str(source),'-o',str(asm)],check=True,capture_output=True)
    text=asm.read_text();size='\t.size\t'+symbol+', .-'+symbol
    assert text.count(size)==1
    # GAS Thumb code alignment supplies the unreachable NOP inside each symbol.
    asm.write_text(text.replace(size,'\t.balign 4\n'+size))
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],check=True)
    objects.append(str(obj))
member=OUT/'_call_via_rX.o'
subprocess.run(['arm-none-eabi-ld','-r',*objects,'-o',str(member)],check=True)
blob=OUT/'member.bin';subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(member),str(blob)],check=True)
assert blob.read_bytes()==(ROOT/'baserom.gba').read_bytes()[0xd18c0:0xd18fc]
symbols=subprocess.check_output(['arm-none-eabi-nm','-S','--defined-only',str(member)],text=True)
for reg,name in enumerate(names):
    assert any(line.split()==[f'{reg*4:08x}','00000004','T','_call_via_'+name] for line in symbols.splitlines()),symbols
report=dict(text_bytes=60,exact_symbols=15,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),member_sha256=hashlib.sha256(member.read_bytes()).hexdigest(),text_sha256=hashlib.sha256(blob.read_bytes()).hexdigest(),production_integrated=True)
(OUT/'veneer-build.json').write_text(json.dumps(report,indent=2)+'\n')
print('60 exact bytes and 15 exact four-byte symbols')
