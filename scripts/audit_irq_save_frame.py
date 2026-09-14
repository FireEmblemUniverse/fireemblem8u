#!/usr/bin/env python3
"""Verify the integrated private IRQ frame and adjacent priority search."""
from pathlib import Path
import hashlib,json,subprocess
ROOT=Path(__file__).resolve().parents[1]
own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],text=True))
assert own['elf_sha256']==linked['elf_sha256']
obj=next(x for x in own['objects'] if x['object']=='src/irq_save_frame.o')
assert obj['category']=='c_with_assembly' and obj['instruction_bytes']==8
start,end=0x08000110,0x08000118
regions=[r for r in linked['regions'] if r['start']<end and r['end']>start]
assert len(regions)==1 and regions[0]['start']==start and regions[0]['end']==end and regions[0]['kind']=='arm' and regions[0]['object']==obj['object']
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
assert symbols['IrqSaveFrame']==start and symbols['IrqSearch']==end
assert 'ASSERT(IrqSearch == IrqSaveFrame + 8,' in (ROOT/'ldscript.txt').read_text()
rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
assert rom[0x110:0x118]==bytes.fromhex('00004fe10b402de9')
source=(ROOT/'src/irq_save_frame.c').read_text()
assert source.count('asm volatile("mrs %0, spsr"')==1
assert 'src/crt0.s' not in next(line for line in (ROOT/'Makefile').read_text().splitlines() if line.startswith('SRC_S_FILES'))
report=dict(start=hex(start),end=hex(end),instruction_bytes=8,c_generated_instruction_bytes=4,retained_status_assembly_bytes=4,full_rom_exact=True,source_sha256=hashlib.sha256(source.encode()).hexdigest(),region_sha256=hashlib.sha256(rom[0x110:0x118]).hexdigest(),elf_sha256=linked['elf_sha256'],scope='Exact integrated SPSR capture and four-register frame; MRS remains assembly-owned. Adjacent handoff verified through symbols and linker assertion; no hardware interrupt-entry claim.')
(ROOT/'docs/irq-save-frame-code-region.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
