#!/usr/bin/env python3
"""Package all C register veneers with original in-symbol alignment padding."""
import hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/runtime-veneers/member';OUT.mkdir(parents=True,exist_ok=True)
cc=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
plugin=OUT.parent/'register_veneer.so'
source=ROOT/'research/runtime/register_veneer.c'
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
assert blob.read_bytes()==(OUT.parent/'original.bin').read_bytes()
symbols=subprocess.check_output(['arm-none-eabi-nm','-S','--defined-only',str(member)],text=True)
for reg,name in enumerate(names):
    assert any(line.split()==[f'{reg*4:08x}','00000004','T','_call_via_'+name] for line in symbols.splitlines()),symbols
report=dict(text_bytes=60,exact_symbols=15,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),member_sha256=hashlib.sha256(member.read_bytes()).hexdigest(),text_sha256=hashlib.sha256(blob.read_bytes()).hexdigest(),production_integrated=False)
(ROOT/'docs/runtime-veneer-member.json').write_text(json.dumps(report,indent=2)+'\n')
print('60 exact bytes and 15 exact four-byte symbols')
