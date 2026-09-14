#!/usr/bin/env python3
"""Check the six split Thumb entry / C ARM tail-call veneers."""
import json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def main():
 linked=json.loads(subprocess.check_output(['python3','scripts/audit_linked_code.py'],cwd=ROOT,text=True))
 own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom'];assert own['elf_sha256']==linked['elf_sha256']
 obj=next(x for x in own['objects'] if x['object']=='src/arm/call_wrappers.o');assert obj['category']=='c_owned' and obj['instruction_bytes']==24
 symbols={}
 for line in subprocess.check_output(['arm-none-eabi-readelf','-sW',str(ROOT/'fireemblem8.elf')],text=True).splitlines():
  f=line.split()
  if len(f)>=8 and f[0].rstrip(':').isdigit():symbols[f[7]]=int(f[1],16)
 names=[('ClearOAMBuffer','ArmCall_Clear','ClearOam'),('CallARM_FillTileRect','ArmCall_Tsa','TmApplyTsa'),('TileMap_FillRect','ArmCall_Fill','TmFillRect'),('CALLARM_ColorFadeTick','ArmCall_Fade','ColorFadeTick'),('TileMap_CopyRect','ArmCall_Copy','TmCopyRect'),('ComputeChecksum32','ArmCall_Checksum','Checksum32')]
 rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes();records=[]
 for index,(entry,body,target) in enumerate(names):
  address=0x080d7498+index*8;assert symbols[entry]==address|1;assert symbols[body]==address+4;assert symbols[target]&3==0
  code=rom[address-0x08000000:address-0x08000000+8];assert code[:4]==bytes.fromhex('7847c046')
  word=int.from_bytes(code[4:],'little');assert word>>24==0xea
  displacement=word&0xffffff
  if displacement&0x800000:displacement-=0x1000000
  assert address+12+displacement*4==symbols[target]
  for off,kind,owner in [(0,'thumb','asm/arm_call.o'),(4,'arm','src/arm/call_wrappers.o')]:
   matches=[r for r in linked['regions'] if r['start']<=address+off and r['end']>=address+off+4]
   assert len(matches)==1 and matches[0]['kind']==kind and matches[0]['object']==owner
  records.append(dict(entry=entry,address=hex(address),body=body,target=target,bytes=code.hex()))
 report=dict(c_owned_instruction_bytes=24,assembly_entry_instruction_bytes=24,elf_sha256=linked['elf_sha256'],full_rom_exact=True,veneers=records,scope='Six C ARM tail branches are exact; six Thumb BX-PC/NOP entries remain assembly. Branches preserve all incoming registers, flags and LR before executing their targets. Not whole-game completion.')
 (ROOT/'docs/arm-call-code-regions.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
if __name__=='__main__':main()
