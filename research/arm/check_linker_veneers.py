#!/usr/bin/env python3
"""Test whether ordinary linker interworking stubs reproduce the six legacy veneers."""
import hashlib
import json
from pathlib import Path
import subprocess
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/arm-veneers'
OUT.mkdir(parents=True, exist_ok=True)
names = ['ClearOam', 'TmApplyTsa', 'TmFillRect', 'ColorFadeTick', 'TmCopyRect', 'Checksum32']
def symbols(path):
    return {s.split()[-1]: int(s.split()[0], 16) for s in subprocess.check_output(['arm-none-eabi-nm', str(path)], text=True).splitlines() if len(s.split()) == 3}
original_symbols = symbols(ROOT / 'fireemblem8.elf')
source = ROOT / 'research/arm/veneer_probe.c'
subprocess.run(['arm-none-eabi-gcc', '-c', '-O2', '-mthumb', '-mcpu=arm7tdmi', '-mthumb-interwork', str(source), '-o', str(OUT / 'calls.o')], check=True)
script = 'SECTIONS { .text 0x080f0000 : { *(.text) } .glue 0x080d7498 : { *(.glue_7t) *(.glue_7) } }\n'
script += '\n'.join(f'{n} = 0x{original_symbols[n]:x};' for n in names)
(OUT / 'probe.ld').write_text(script)
subprocess.run(['arm-none-eabi-ld', '-T', str(OUT / 'probe.ld'), str(OUT / 'calls.o'), '-o', str(OUT / 'probe.elf')], check=True)
subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '-j', '.text', str(OUT / 'probe.elf'), str(OUT / 'probe.bin')], check=True)
syms = symbols(OUT / 'probe.elf')
code = (OUT / 'probe.bin').read_bytes()
rom = (ROOT / 'baserom.gba').read_bytes()
records = []
for index, name in enumerate(names):
    address = syms['__' + name + '_from_thumb']
    stub = code[address - 0x080f0000:address - 0x080f0000 + 8]
    old_address = 0x080d7498 + 8 * index
    old = rom[old_address - 0x08000000:old_address - 0x08000000 + 8]
    assert stub[:4] == bytes.fromhex('7847fde7')
    assert old[:4] == bytes.fromhex('7847c046')
    word = int.from_bytes(stub[4:], 'little')
    assert word >> 24 == 0xea
    displacement = word & 0xffffff
    if displacement & 0x800000: displacement -= 0x1000000
    assert address + 12 + displacement * 4 == original_symbols[name]
    records.append(dict(target=name, original_address=hex(old_address), generated_address=hex(address),
        original_bytes=old.hex(), generated_bytes=stub.hex(), branch_target_exact=True,
        padding_exact=False, placement_exact=address == old_address))
print(json.dumps(dict(source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
    linker_version=subprocess.check_output(['arm-none-eabi-ld', '--version'], text=True).splitlines()[0],
    veneers=records, production_integrated=False,
    scope='Six linker-generated BX-PC/ARM-B stubs target the correct ARM functions, but use a backward Thumb branch instead of original NOP padding and are allocated with caller text, in a different order. This ordinary linker recipe is not a byte-matching production replacement.'), indent=2))
