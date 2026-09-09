#!/usr/bin/env python3
"""Compile/link the isolated candidate and report raw ROM instruction differences."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/color-fade-match'
SOURCE = Path(__file__).with_name('color_fade_tick.c')
FLAGS = ['-std=gnu89', '-O1', '-marm', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
         '-ffreestanding', '-fno-builtin', '-fomit-frame-pointer', '-fno-schedule-insns',
         '-fno-schedule-insns2', '-fno-auto-inc-dec', '-fno-ivopts', '-fno-if-conversion',
         '-fno-if-conversion2', '-fno-reorder-blocks', '-fno-move-loop-invariants',
         '-fno-tree-loop-im']


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plugin', type=Path, help='optional experimental GCC plugin')
    args = parser.parse_args()
    flags = FLAGS + (['-fplugin=' + str(args.plugin.resolve())] if args.plugin else [])
    rom = (ROOT / 'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    OUT.mkdir(parents=True, exist_ok=True)
    version = subprocess.check_output(['arm-none-eabi-gcc', '-dumpfullversion'], text=True).strip()
    subprocess.run(['arm-none-eabi-gcc', '-S', str(SOURCE), *flags, '-o', str(OUT / 'candidate.s')], check=True)
    subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', '-o', str(OUT / 'candidate.o'), str(OUT / 'candidate.s')], check=True)
    names = ['gPaletteBuffer', 'gFadeComponents', 'gFadeComponentStep']
    values = struct.unpack_from('<III', rom, 0x228)
    script = 'SECTIONS { . = 0x08000234; .text : { *(.text) } /DISCARD/ : { *(.ARM.attributes) *(.comment) } }\n'
    script += ''.join(name + ' = ' + hex(value) + ';\n' for name, value in zip(names, values))
    (OUT / 'candidate.ld').write_text(script)
    subprocess.run(['arm-none-eabi-ld', '-T', str(OUT / 'candidate.ld'), '-o', str(OUT / 'candidate.elf'), str(OUT / 'candidate.o')], check=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT / 'candidate.elf'), str(OUT / 'candidate.bin')], check=True)
    candidate = (OUT / 'candidate.bin').read_bytes()
    original = rom[0x234:0x304]
    differences = []
    for offset in range(0, len(original), 4):
        wanted = original[offset:offset+4]
        found = candidate[offset:offset+4]
        if wanted != found:
            differences.append({'address': hex(0x08000234 + offset),
                                'original_bytes': wanted.hex(), 'candidate_bytes': found.hex()})
    report = {'compiler_version': version, 'flags': flags,
              'plugin_sha256': hashlib.sha256(args.plugin.read_bytes()).hexdigest() if args.plugin else None,
              'source_sha256': hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
              'candidate_sha256': hashlib.sha256(candidate).hexdigest(),
              'original_instruction_bytes': len(original), 'candidate_section_bytes': len(candidate),
              'scope': 'Raw first 208 bytes compared; trailing candidate literals also prevent integration.',
              'differing_words': differences}
    (OUT / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    print(str(OUT / 'report.json'))
    print(str(len(differences)) + ' differing original instruction words; ' + str(len(candidate)) + ' candidate section bytes.')


if __name__ == '__main__':
    main()
