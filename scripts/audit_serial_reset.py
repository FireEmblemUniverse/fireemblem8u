#!/usr/bin/env python3
"""Verify reset C generation separately from its retained BIOS instruction."""
import hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def main():
 own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
 linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],text=True));assert own['elf_sha256']==linked['elf_sha256']
 obj=next(x for x in own['objects'] if x['object']=='src/serial_reset.o');assert obj['category']=='c_with_assembly' and obj['instruction_bytes']==148
 start,end=0x08b1a1c4,0x08b1a268
 regions=[r for r in linked['regions'] if r['start']<end and r['end']>start]
 assert [(r['start'],r['end'],r['kind'],r['object']) for r in regions]==[(start,0x08b1a258,'arm','src/serial_reset.o'),(0x08b1a258,end,'data','src/serial_reset.o')],regions
 rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
 assert rom[0xb1a24c:0xb1a250]==bytes.fromhex('000011ef')
 source=(ROOT/'src/serial_reset.c').read_text();assert source.count('svc #0x110000')==1
 inline=json.loads((ROOT/'docs/inline-assembly-regions.json').read_text());sites=[s for s in inline['sites'] if s['source']=='src/serial_reset.c']
 assert len(sites)==1 and sites[0]['instruction_bytes']==4
 report=dict(start=hex(start),end=hex(end),instruction_bytes=148,c_generated_instruction_bytes=144,retained_svc_assembly_bytes=4,literal_bytes=16,full_rom_exact=True,source_sha256=hashlib.sha256(source.encode()).hexdigest(),region_sha256=hashlib.sha256(rom[start-0x08000000:end-0x08000000]).hexdigest(),elf_sha256=linked['elf_sha256'],scope='Complete reset region matches original bytes, preserving the private poll ABI, halt/retry branches and BIOS transfer. SVC remains assembly-owned and the object remains classified mixed C/assembly. No physical-link or actual BIOS execution claim.')
 (ROOT/'docs/serial-reset-code-region.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
