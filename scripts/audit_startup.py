#!/usr/bin/env python3
"""Verify integrated startup code, explicit status sites and C literal tables."""
from pathlib import Path
import hashlib,json,subprocess
ROOT=Path(__file__).resolve().parents[1]
own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],text=True))
assert own['elf_sha256']==linked['elf_sha256']
obj=next(x for x in own['objects'] if x['object']=='src/crt0.o')
assert obj['category']=='c_with_assembly' and obj['instruction_bytes']==52
regions=[r for r in linked['regions'] if r['start']<0x080000f4 and r['end']>0x080000c0]
assert len(regions)==1 and regions[0]['start']==0x080000c0 and regions[0]['end']==0x080000f4 and regions[0]['kind']=='arm' and regions[0]['object']==obj['object']
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
assert symbols['crt0']==0x080000c0 and symbols['IrqMain']==0x080000fc
assert symbols['StartupStackPointers']==0x080000f4 and symbols['StartupFarPointers']==0x0800021c
layout=(ROOT/'ldscript.txt').read_text()
for assertion in ['ASSERT(IrqMain == crt0 + 60,','ASSERT(StartupStackPointers == crt0 + 52,','ASSERT(StartupFarPointers == crt0 + 348,']:assert assertion in layout
rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
for address in (0xc4,0xd0):assert rom[address:address+4]==bytes.fromhex('00f029e1')
assert rom[0xdc:0xe0]==bytes.fromhex('18008fe2')
main=next(line.split() for line in subprocess.check_output(['arm-none-eabi-readelf','-s',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if line.split() and line.split()[-1]=='AgbMain')
assert main[3]=='FUNC'
expected=[symbols['__sp_usr'],symbols['__sp_irq'],0x03007ffc,int(main[1],16)]
assert [int.from_bytes(rom[a:a+4],'little') for a in (0xf4,0xf8,0x21c,0x220)]==expected
source=(ROOT/'src/crt0.c').read_text();assert source.count('asm volatile("msr cpsr_fc, %2"')==2
assert 'src/crt0.s' not in next(line for line in (ROOT/'Makefile').read_text().splitlines() if line.startswith('SRC_S_FILES'))
report=dict(instruction_bytes=52,c_generated_instruction_bytes=44,retained_status_assembly_bytes=8,c_literal_bytes=16,regions=[dict(start='0x080000c0',bytes=60),dict(start='0x0800021c',bytes=8)],full_rom_exact=True,source_sha256=hashlib.sha256(source.encode()).hexdigest(),region_sha256=hashlib.sha256(rom[0xc0:0xfc]+rom[0x21c:0x224]).hexdigest(),elf_sha256=linked['elf_sha256'],scope='Exact integrated startup, typed main-function pointer, C stack/vector tables and asserted ADR/pool placement. Two mode writes remain assembly-owned. Hardware reset/BIOS entry and real main execution are not proved by this audit.')
(ROOT/'docs/startup-code-regions.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
