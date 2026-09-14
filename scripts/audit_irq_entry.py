#!/usr/bin/env python3
"""Verify the C IRQ entry setup and its adjacent saved-frame continuation."""
from pathlib import Path
import hashlib,json,subprocess
ROOT=Path(__file__).resolve().parents[1]
def main():
 own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
 linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],text=True));assert own['elf_sha256']==linked['elf_sha256']
 obj=next(x for x in own['objects'] if x['object']=='src/irq_entry.o');assert obj['category']=='c_owned' and obj['instruction_bytes']==20
 start,end=0x080000fc,0x08000110
 regions=[r for r in linked['regions'] if r['start']<end and r['end']>start]
 assert len(regions)==1 and regions[0]['start']==start and regions[0]['end']==end and regions[0]['kind']=='arm' and regions[0]['object']==obj['object']
 symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
 assert symbols['IrqMain']==start and symbols['IrqSaveFrame']==end
 assert 'ASSERT(IrqSaveFrame == IrqMain + 20,' in (ROOT/'ldscript.txt').read_text()
 rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
 report=dict(start=hex(start),end=hex(end),c_owned_instruction_bytes=20,adjacent_handoff='IrqSaveFrame',full_rom_exact=True,source_sha256=hashlib.sha256((ROOT/'src/irq_entry.c').read_bytes()).hexdigest(),region_sha256=hashlib.sha256(rom[0xfc:0x110]).hexdigest(),elf_sha256=linked['elf_sha256'],scope='Exact register setup and full-ROM equality; linker assertion and symbols verify adjacent SPSR/frame-save assembly. Startup ADR still addresses IrqMain. No hardware execution claim.')
 (ROOT/'docs/irq-entry-code-region.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
