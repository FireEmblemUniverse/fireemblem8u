#!/usr/bin/env python3
"""Verify the C-owned low OAM entry and its shared-frame destination."""
from pathlib import Path
import hashlib,json,subprocess
ROOT=Path(__file__).resolve().parents[1]
own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],text=True));assert own['elf_sha256']==linked['elf_sha256']
obj=next(x for x in own['objects'] if x['object']=='src/arm/put_oam_lo.o');assert obj['category']=='c_owned' and obj['instruction_bytes']==12
regions=[r for r in linked['regions'] if r['start']<0x08000540 and r['end']>0x08000534]
assert len(regions)==1 and regions[0]['start']==0x08000534 and regions[0]['end']==0x08000540 and regions[0]['kind']=='arm' and regions[0]['object']==obj['object']
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
assert symbols['PutOamLo']==0x08000534 and symbols['PutOamLoCursorPointer']==0x08000530
assert symbols['PutOamSharedBody']==symbols['PutOamHi']+8==0x0800049c
layout=(ROOT/'ldscript.txt').read_text()
for text in ('ASSERT(PutOamLo == PutOamLoCursorPointer + 4,','ASSERT(PutOamSharedBody == PutOamHi + 8,'):assert text in layout
rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
assert int.from_bytes(rom[0x530:0x534],'little')==symbols['gOamLoPutIt']
source=(ROOT/'src/arm/put_oam_lo.c').read_bytes()
assert b'PutOamLo:' not in (ROOT/'asm/arm.s').read_bytes()
report=dict(start='0x08000530',bytes=16,c_owned_instruction_bytes=12,c_pointer_bytes=4,full_rom_exact=True,source_sha256=hashlib.sha256(source).hexdigest(),region_sha256=hashlib.sha256(rom[0x530:0x540]).hexdigest(),elf_sha256=linked['elf_sha256'],scope='Exact low-entry register frame, cursor load and shared-body branch; C pointer and linker assertions verified. Execution model is documented separately.')
(ROOT/'docs/oam-low-entry-code-region.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
