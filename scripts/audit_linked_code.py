#!/usr/bin/env python3
"""Inventory linked ROM instruction mappings, without claiming C coverage.

ARM ELF $a/$t/$d symbols describe assembler-classified regions. They cannot
prove that data contains no hidden/compressed code or that code came from C.
Input-section boundaries prevent a mapping from leaking into the next object.
"""
import argparse
from bisect import bisect_right
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]
ROM_START = 0x08000000
ROM_END = 0x09000000


def read_contributions(text, image_start=ROM_START, image_end=ROM_END):
    result = []
    pending = None
    for line in text.splitlines():
        match = re.match(r'^ ([^\s]+)(?:\s+(0x[0-9a-f]+)\s+(0x[0-9a-f]+)\s+(.+))?\s*$', line)
        if match:
            section, address, size, owner = match.groups()
            pending = section if address is None else None
        elif pending:
            match = re.match(r'^\s+(0x[0-9a-f]+)\s+(0x[0-9a-f]+)\s+(.+)$', line)
            if not match:
                pending = None
                continue
            section = pending
            address, size, owner = match.groups()
            pending = None
        else:
            continue
        if address is None:
            continue
        start, length = int(address, 16), int(size, 16)
        if length and image_start <= start < image_end and ('.o' in owner or '.a(' in owner):
            if start + length > image_end:
                raise ValueError('input contribution exceeds image: ' + owner)
            result.append(dict(start=start, end=start + length, section=section, object=owner))
    result.sort(key=lambda item: item['start'])
    for left, right in zip(result, result[1:]):
        if left['end'] > right['start']:
            raise ValueError('overlapping input contributions')
    return result


def read_mappings(text, image_start=ROM_START, image_end=ROM_END):
    mappings = {}
    for line in text.splitlines():
        fields = line.split()
        if len(fields) < 8 or not re.fullmatch(r'\$[atd](?:\..*)?', fields[-1]):
            continue
        address = int(fields[1], 16)
        if fields[6] == 'ABS' or not image_start <= address < image_end:
            continue
        kind = {'a': 'arm', 't': 'thumb', 'd': 'data'}[fields[-1][1]]
        if address in mappings and mappings[address] != kind:
            raise ValueError('conflicting mappings at ' + hex(address))
        mappings[address] = kind
    return mappings


def partition(contributions, mappings):
    regions = []
    for contribution in contributions:
        start, end = contribution['start'], contribution['end']
        boundaries = sorted({start, end} | {address for address in mappings if start <= address < end})
        kind = 'unmapped'
        for left, right in zip(boundaries, boundaries[1:]):
            kind = mappings.get(left, kind)
            regions.append(dict(contribution, start=left, end=right, size=right-left, kind=kind))
    return regions


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--elf', type=Path, default=ROOT / 'fireemblem8.elf')
    parser.add_argument('--map', type=Path, default=ROOT / 'fireemblem8.map')
    parser.add_argument("--start", type=lambda value: int(value, 0), default=ROM_START)
    parser.add_argument("--size", type=lambda value: int(value, 0), default=ROM_END-ROM_START)
    args = parser.parse_args()
    if args.start < 0 or args.size <= 0 or args.start + args.size > 0x100000000:
        parser.error("invalid 32-bit image extent")
    image_end = args.start + args.size
    symbols = subprocess.check_output(['arm-none-eabi-readelf', '-sW', str(args.elf)], text=True)
    contributions = read_contributions(args.map.read_text(), args.start, image_end)
    mappings = read_mappings(symbols, args.start, image_end)
    regions = partition(contributions, mappings)
    if not regions or not mappings:
        raise SystemExit('no image input sections or mapping symbols found')
    counts = Counter()
    objects = {}
    for region in regions:
        counts[region['kind']] += region['size']
        counts_for_object = objects.setdefault(region['object'], Counter())
        counts_for_object[region['kind']] += region['size']
    accounted = sum(counts.values())
    starts = [item['start'] for item in contributions]
    orphan_mappings = []
    for address, kind in sorted(mappings.items()):
        index = bisect_right(starts, address) - 1
        if index < 0 or address >= contributions[index]['end']:
            orphan_mappings.append(dict(address=address, kind=kind))
    report = {
        'scope': 'Assembler instruction/data mappings within linked input sections; not C coverage or proof that data contains no code.',
        'elf_sha256': hashlib.sha256(args.elf.read_bytes()).hexdigest(),
        'map_sha256': hashlib.sha256(args.map.read_bytes()).hexdigest(),
        'image_start': args.start,
        'image_size': args.size,
        'input_section_bytes': accounted,
        'bytes_outside_input_sections': args.size - accounted,
        'mapped_bytes': dict(counts),
        'mappings_outside_input_sections': orphan_mappings,
        'objects': objects,
        'regions': regions,
        'limitations': [
            'Unmapped bytes and bytes outside input sections are unclassified, including linker fill.',
            'Object attribution does not distinguish generated C instructions from inline assembly.',
            'Literal pools and code alignment follow assembler mappings, which need independent review.',
            'Compressed embedded executables require their own expanded-binary inventory.',
        ],
    }
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
