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
divrem=next(x for x in own['objects'] if x['object']=='src/bios_divrem.o')
assert divrem['category']=='c_with_assembly' and divrem['instruction_bytes']==6
start=symbols['DivRem'];assert start==0x080d1684
assert rom[start-0x08000000:start-0x08000000+6]==bytes.fromhex('06df081c7047')
assert 'src/bios_divrem.o(.text.DivRem);' in (ROOT/'ldscript.txt').read_text()
site=next(s for s in json.loads((ROOT/'docs/inline-assembly-regions.json').read_text())['sites'] if s['source']=='src/bios_divrem.c')
assert site['instruction_bytes']==2 and int(site['address'],16)==start
regions.append(dict(name='DivRem',start=hex(start),instruction_bytes=6,retained_swi_bytes=2))
u16obj=next(x for x in own['objects'] if x['object']=='src/bios_u16_return.o')
assert u16obj['category']=='c_with_assembly' and u16obj['instruction_bytes']==8
u16sites=[s for s in json.loads((ROOT/'docs/inline-assembly-regions.json').read_text())['sites'] if s['source']=='src/bios_u16_return.c']
assert len(u16sites)==2
for name,address,svc in [('ArcTan2',0x080d166c,10),('Sqrt',0x080d16d8,8)]:
 assert symbols[name]==address and rom[address-0x08000000:address-0x08000000+4]==bytes([svc,0xdf,0x70,0x47])
 assert f'src/bios_u16_return.o(.text.{name});' in (ROOT/'ldscript.txt').read_text()
 found=[r for r in linked['regions'] if r['start']<address+4 and r['end']>address]
 assert sum(min(address+4,r['end'])-max(address,r['start']) for r in found)==4
 assert all(r['kind']=='thumb' and r['object']=='src/bios_u16_return.o' for r in found)
 site=next(s for s in u16sites if s['function']==name)
 assert site['instruction_bytes']==2 and int(site['address'],16)==address
 regions.append(dict(name=name,start=hex(address),instruction_bytes=4,retained_swi_bytes=2))
soft=next(x for x in own['objects'] if x['object']=='src/bios_soft_reset.o')
assert soft['category']=='c_with_assembly' and soft['instruction_bytes']==14
assert not any(x['object']=='src/libagbsyscall.o' for x in own['objects'])
start=symbols['SoftReset'];assert start==0x080d16b0
assert rom[start-0x08000000:start-0x08000000+24]==bytes.fromhex('034b00221a7003498d4601df00df000008020004007f0003')
assert 'src/bios_soft_reset.o(.text);' in (ROOT/'ldscript.txt').read_text()
softsites=[s for s in json.loads((ROOT/'docs/inline-assembly-regions.json').read_text())['sites'] if s['source']=='src/bios_soft_reset.c']
assert len(softsites)==2 and sum(s['instruction_bytes'] for s in softsites)==4
assert sorted(int(s['address'],16) for s in softsites)==[start+10,start+12]
regions.append(dict(name='SoftReset',start=hex(start),instruction_bytes=14,retained_swi_bytes=4))
report=dict(wrappers=regions,total_instruction_bytes=100,c_generated_instruction_bytes=58,retained_swi_bytes=42,remaining_assembly_wrapper_bytes=0,full_rom_exact=True,source_sha256=hashlib.sha256(source.encode()).hexdigest(),divrem_source_sha256=hashlib.sha256((ROOT/'src/bios_divrem.c').read_bytes()).hexdigest(),soft_reset_source_sha256=hashlib.sha256((ROOT/'src/bios_soft_reset.c').read_bytes()).hexdigest(),u16_source_sha256=hashlib.sha256((ROOT/'src/bios_u16_return.c').read_bytes()).hexdigest(),elf_sha256=linked['elf_sha256'],scope='Exact integrated setup/return code around explicit SWI boundaries. BIOS service behavior is not implemented or proved; all twenty wrappers are integrated with explicit BIOS boundaries.')
(ROOT/'docs/bios-wrappers-code-regions.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
