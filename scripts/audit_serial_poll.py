#!/usr/bin/env python3
"""Verify exact C ownership of the bootstrap's private polling routine."""
import hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def main():
 own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom'];linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],text=True));assert own['elf_sha256']==linked['elf_sha256']
 obj=next(x for x in own['objects'] if x['object']=='src/serial_poll.o');assert obj['category']=='c_owned' and obj['instruction_bytes']==44
 start,end=0x08b1a198,0x08b1a1c4
 regions=[r for r in linked['regions'] if r['start']<end and r['end']>start]
 assert len(regions)==1 and regions[0]['start']==start and regions[0]['end']==end and regions[0]['kind']=='arm' and regions[0]['object']==obj['object']
 rom=(ROOT/'fireemblem8.gba').read_bytes();base=(ROOT/'baserom.gba').read_bytes();assert rom==base;code=rom[start-0x08000000:end-0x08000000]
 report=dict(start=hex(start),end=hex(end),c_owned_instruction_bytes=44,full_rom_exact=True,region_sha256=hashlib.sha256(code).hexdigest(),source_sha256=hashlib.sha256((ROOT/'src/serial_poll.c').read_bytes()).hexdigest(),elf_sha256=linked['elf_sha256'],scope='Exact original private ARM polling ABI: r0 serial base preserved, r1 data/status, Z from the final bit-6 TST, other registers and stack preserved. Full instruction equality proves unchanged polling and flag behavior; no physical serial-link timing test or full bootstrap conversion is claimed.')
 (ROOT/'docs/serial-poll-code-region.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
