#!/usr/bin/env python3
"""Verify the integrated BIOS boundary wrappers and instruction ownership."""
from pathlib import Path
import hashlib,json,subprocess
ROOT=Path(__file__).resolve().parents[1]
own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],text=True));assert own['elf_sha256']==linked['elf_sha256']
obj=next(x for x in own['objects'] if x['object']=='src/bios_wrappers.o');assert obj['category']=='c_with_assembly' and obj['instruction_bytes']==72
original=json.loads((ROOT/'docs/bios-wrapper-research.json').read_text())['wrappers'];expected=[row for row in original if row['instruction_bytes_exact']];assert len(expected)==16
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
source=(ROOT/'src/bios_wrappers.c').read_text();assert source.count('asm volatile(')==16
sites=json.loads((ROOT/'docs/inline-assembly-regions.json').read_text())['sites'];sites=[s for s in sites if s['source']=='src/bios_wrappers.c'];assert len(sites)==16 and sum(s['instruction_bytes'] for s in sites)==32
regions=[]
for row in expected:
 name=row['name'];start=symbols[name];end=start+row['original_instruction_bytes'];found=[r for r in linked['regions'] if r['start']<end and r['end']>start]
 assert sum(min(end,r['end'])-max(start,r['start']) for r in found)==row['original_instruction_bytes']
 assert all(r['kind']=='thumb' and r['object']=='src/bios_wrappers.o' for r in found)
 assert f'src/bios_wrappers.o(.text.{name});' in (ROOT/'ldscript.txt').read_text()
 site=next(s for s in sites if s['function']==name);offset=int(site['address'],16)-0x08000000
 assert rom[offset:offset+2]==bytes([row['svc'],0xdf])
 regions.append(dict(name=name,start=hex(start),instruction_bytes=row['original_instruction_bytes'],retained_swi_bytes=2))
remaining=next(x for x in own['objects'] if x['object']=='src/libagbsyscall.o');assert remaining['instruction_bytes']==28
report=dict(wrappers=regions,total_instruction_bytes=72,c_generated_instruction_bytes=40,retained_swi_bytes=32,remaining_assembly_wrapper_bytes=28,full_rom_exact=True,source_sha256=hashlib.sha256(source.encode()).hexdigest(),elf_sha256=linked['elf_sha256'],scope='Exact integrated setup/return code around explicit SWI boundaries. BIOS service behavior is not implemented or proved; remaining wrappers stay assembly.')
(ROOT/'docs/bios-wrappers-code-regions.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
