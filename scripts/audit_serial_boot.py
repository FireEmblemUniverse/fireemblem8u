#!/usr/bin/env python3
"""Verify both bootstrap tail transfers and their C ownership."""
from pathlib import Path
import hashlib,json,subprocess
ROOT=Path(__file__).resolve().parents[1]
def main():
 own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
 linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],text=True));assert own['elf_sha256']==linked['elf_sha256']
 obj=next(x for x in own['objects'] if x['object']=='src/serial_boot.o');assert obj['category']=='c_owned' and obj['instruction_bytes']==8
 rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
 records=[]
 for address,target in [(0x08b1a0b8,0x08b1a178),(0x08b1a178,0x08b1a1c4)]:
  regions=[r for r in linked['regions'] if r['start']<=address<r['end']]
  assert len(regions)==1 and regions[0]['kind']=='arm' and regions[0]['object']==obj['object']
  opcode=int.from_bytes(rom[address-0x08000000:address-0x08000000+4],'little')
  assert opcode>>24==0xea
  offset=opcode&0xffffff
  if offset&0x800000:offset-=0x1000000
  assert address+8+offset*4==target
  records.append(dict(address=hex(address),target=hex(target),instruction_bytes=4))
 report=dict(c_owned_instruction_bytes=8,transfers=records,source_sha256=hashlib.sha256((ROOT/'src/serial_boot.c').read_bytes()).hexdigest(),elf_sha256=linked['elf_sha256'],full_rom_exact=True,scope='Exact ARM B instructions preserve LR, SP, flags and other registers while reaching the original bootstrap destinations. Header and padding remain data.')
 (ROOT/'docs/serial-boot-code-regions.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
