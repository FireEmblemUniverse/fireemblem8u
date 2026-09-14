#!/usr/bin/env python3
"""Verify integrated IRQ continuation, retained status instructions and pool."""
from pathlib import Path
import hashlib,json,subprocess
ROOT=Path(__file__).resolve().parents[1]
own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],text=True))
assert own['elf_sha256']==linked['elf_sha256']
obj=next(x for x in own['objects'] if x['object']=='src/irq_continuation.o')
assert obj['category']=='c_with_assembly' and obj['instruction_bytes']==80
start,end=0x080001cc,0x0800021c
regions=[r for r in linked['regions'] if r['start']<end and r['end']>start]
assert len(regions)==1 and regions[0]['start']==start and regions[0]['end']==end and regions[0]['kind']=='arm' and regions[0]['object']==obj['object']
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
assert symbols['IrqSelected']==start and symbols['IrqHandlersPointer']==end+8
assert symbols['IrqSelected']==symbols['IrqSearch']+180
script=(ROOT/'ldscript.txt').read_text()
assert 'ASSERT(IrqHandlersPointer == IrqSelected + 88,' in script
assert 'ASSERT(IrqSelected == IrqSearch + 180,' in script
rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
status={0x1d0:0xe10f3000,0x1dc:0xe129f003,0x1fc:0xe10f3000,0x208:0xe129f003,0x214:0xe169f000}
for address,word in status.items():assert int.from_bytes(rom[address:address+4],'little')==word
assert int.from_bytes(rom[0x224:0x228],'little')==symbols['gIRQHandlers']
source=(ROOT/'src/irq_continuation.c').read_text()
assert source.count('asm volatile("mrs %0, cpsr"')==2
assert source.count('asm volatile("msr cpsr_fc, %2"')==2
assert source.count('asm volatile("msr spsr_fc, %0"')==1
assert 'src/crt0.s' not in next(line for line in (ROOT/'Makefile').read_text().splitlines() if line.startswith('SRC_S_FILES'))
report=dict(start=hex(start),end=hex(end),instruction_bytes=80,c_generated_instruction_bytes=60,retained_status_assembly_bytes=20,c_pointer_bytes=4,full_rom_exact=True,source_sha256=hashlib.sha256(source.encode()).hexdigest(),region_sha256=hashlib.sha256(rom[0x1cc:0x228]).hexdigest(),elf_sha256=linked['elf_sha256'],scope='Exact integrated continuation and shared literal placement; five status instructions remain assembly-owned. Whole-object ownership remains mixed. Dispatcher execution is documented separately; no hardware execution claim.')
(ROOT/'docs/irq-continuation-code-region.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
