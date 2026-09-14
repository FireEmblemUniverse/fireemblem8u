#!/usr/bin/env python3
"""Fresh-build the C header and verify its entry branch and field placement."""
from pathlib import Path
import hashlib,json,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],text=True));assert own['elf_sha256']==linked['elf_sha256']
obj=next(x for x in own['objects'] if x['object']=='src/rom_header.o');assert obj['category']=='c_owned' and obj['instruction_bytes']==4
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
assert symbols['Init']==0x08000000 and symbols['crt0']==0x080000c0 and symbols['RomHeaderNintendoLogo']==0x08000004
layout=(ROOT/'ldscript.txt').read_text()
for text in ('ASSERT(Init == ORIGIN(rom),','ASSERT(RomHeaderNintendoLogo == Init + 4,','ASSERT(crt0 == Init + 192,'):assert text in layout
rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
assert rom[:4]==bytes.fromhex('2e0000ea')
source=ROOT/'src/rom_header.c'
with tempfile.TemporaryDirectory(prefix='rom-header-audit-') as directory:
 out=Path(directory)
 subprocess.run(['arm-none-eabi-gcc','-c','-std=gnu89','-O2','-fno-toplevel-reorder','-marm','-mcpu=arm7tdmi','-mno-thumb-interwork','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables',str(source),'-o',str(out/'header.o')],check=True)
 (out/'header.ld').write_text('SECTIONS { .text 0x08000000 : { *(.text) *(SORT_BY_NAME(.rodata.rom_header.*)) } crt0 = 0x080000c0; ASSERT(SIZEOF(.text) == 192, "Header size changed") }')
 subprocess.run(['arm-none-eabi-ld','-T',str(out/'header.ld'),str(out/'header.o'),'-o',str(out/'header.elf')],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(out/'header.elf'),str(out/'header.bin')],check=True)
 assert (out/'header.bin').read_bytes()==rom[:192]
assert (sum(rom[0xa0:0xbd])+0x19+rom[0xbd])&255==0
report=dict(start='0x08000000',bytes=192,c_owned_instruction_bytes=4,c_header_data_bytes=188,full_rom_exact=True,fresh_compilation_exact=True,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),region_sha256=hashlib.sha256(rom[:192]).hexdigest(),elf_sha256=linked['elf_sha256'],scope='Ordinary ARM C tail branch and explicit header arrays; all 192 bytes and named entry/logo positions exact. No backend plugin or instruction-bearing source assembly.')
(ROOT/'docs/rom-header-code-region.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
