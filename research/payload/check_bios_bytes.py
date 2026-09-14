#!/usr/bin/env python3
"""Compare C-generated payload BIOS wrapper regions at all original layouts."""
import hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];out=ROOT/'.deps/payload-bios';out.mkdir(exist_ok=True)
names=['SwiCpuFastSet','SwiCpuSet','SwiHuffUnCompReadNormal','SwiLZ77UnCompReadNormalWrite16bit','SwiLZ77UnCompReadNormalWrite8bit','SwiRLUnCompReadNormalWrite16bit','SwiRLUnCompReadNormalWrite8bit','SwiSoftReset','SwiSoundBiasReset','SwiSoundBiasSet','SwiVBlankIntrWait']
for name in ('bios_wrappers','bios_soft_reset'):
 command=['arm-none-eabi-gcc','-c','-O2','-falign-functions=2','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-ffunction-sections']
 if name=='bios_soft_reset':command+=['-fno-schedule-insns','-fno-schedule-insns2']
 subprocess.run(command+[str(ROOT/f'research/payload/{name}.c'),'-o',str(out/(name+'.o'))],check=True)
rows=[]
for image in ('mgfembp','mgfembp_20030206','mgfembp_20030219'):
 symbols={p[-1]:int(p[0],16) for line in subprocess.check_output(['arm-none-eabi-nm','-g',str(ROOT/f'mgfembp/{image}.elf')],text=True).splitlines() if len(p:=line.split())==3}
 start=symbols[names[0]];end=symbols[names[-1]]+8
 layout='SECTIONS { .text '+str(start)+' : { '+''.join('. = ALIGN(4); *(.text.'+name+'); ' for name in names)+'. = ALIGN(4); } /DISCARD/ : { *(*) } }'
 script=out/(image+'.ld');script.write_text(layout)
 elf=out/(image+'.elf');binary=out/(image+'.bin')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(out/'bios_wrappers.o'),str(out/'bios_soft_reset.o'),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary',str(elf),str(binary)],check=True)
 code=binary.read_bytes();reference=(ROOT/f'mgfembp/{image}.bin').read_bytes()[start-0x02010000:end-0x02010000]
 candidate={p[-1]:int(p[0],16) for line in subprocess.check_output(['arm-none-eabi-nm','-g',str(elf)],text=True).splitlines() if len(p:=line.split())==3}
 assert all(candidate[name]==symbols[name] for name in names)
 assert code==reference,(image,code.hex(),reference.hex())
 rows.append(dict(image=image,start=hex(start),exact_bytes=len(code),exact_entry_addresses=len(names),sha256=hashlib.sha256(code).hexdigest()))
report=dict(images=rows,source_sha256={name:hashlib.sha256((ROOT/f'research/payload/{name}.c').read_bytes()).hexdigest() for name in ('bios_wrappers','bios_soft_reset')},scope='Research byte/layout comparison only; BIOS execution and reset control flow require separate boundary models. SWIs remain inline; production unchanged.')
(ROOT/'docs/payload-bios-byte-research.json').write_text(json.dumps(report,indent=2)+'\n');print('All 11 entries and complete 76-byte regions match in three images')
