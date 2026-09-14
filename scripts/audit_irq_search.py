#!/usr/bin/env python3
"""Verify C IRQ search ownership, exact startup bytes and terminal adjacency."""
from pathlib import Path
import hashlib,json,subprocess
ROOT=Path(__file__).resolve().parents[1]
def main():
 own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
 linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],text=True));assert own['elf_sha256']==linked['elf_sha256']
 obj=next(x for x in own['objects'] if x['object']=='src/irq_search.o');assert obj['category']=='c_owned' and obj['instruction_bytes']==180
 start,end=0x08000118,0x080001cc
 regions=[r for r in linked['regions'] if r['start']<end and r['end']>start]
 assert len(regions)==1 and regions[0]['start']==start and regions[0]['end']==end and regions[0]['kind']=='arm' and regions[0]['object']==obj['object']
 symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
 assert symbols['IrqSearch']==start and symbols['IrqSelected']==end
 assert 'ASSERT(IrqSelected == IrqSearch + 180,' in (ROOT/'ldscript.txt').read_text()
 rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
 assert all(rom[p:p+4]==bytes.fromhex('feffff1a') for p in (0x120,0x1c8))
 report=dict(start=hex(start),end=hex(end),c_owned_instruction_bytes=180,adjacent_handoff='IrqSelected',full_rom_exact=True,source_sha256=hashlib.sha256((ROOT/'src/irq_search.c').read_bytes()).hexdigest(),region_sha256=hashlib.sha256(rom[0x118:0x1cc]).hexdigest(),startup_block_sha256=hashlib.sha256(rom[0xc0:0x228]).hexdigest(),elf_sha256=linked['elf_sha256'],scope='Exact 180-byte C search including two immutable conditional halt loops; linker and symbols verify continuation adjacency. Full ROM preserves the surrounding startup, literal pools and IRQ mode transitions. Emulator search coverage is separate; no hardware IRQ execution claim.')
 (ROOT/'docs/irq-search-code-region.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
