#!/usr/bin/env python3
"""Decode direct ARMv4T branches from mapped bytes; not indirect reachability."""
from bisect import bisect_right
from collections import Counter
import hashlib
import json
from pathlib import Path
import subprocess

from audit_linked_code import partition, read_contributions, read_mappings

ROOT = Path(__file__).resolve().parents[1]
CONDITIONS = ('eq', 'ne', 'cs', 'cc', 'mi', 'pl', 'vs', 'vc', 'hi', 'ls', 'ge', 'lt', 'gt', 'le', '')


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def signed(value, bits):
    return value - (1 << bits) if value & (1 << (bits - 1)) else value


def decode(data, offset, address, mode):
    """Return instruction width and optional (target, mnemonic) for ARM7TDMI."""
    if mode == 'arm':
        word = int.from_bytes(data[offset:offset + 4], 'little')
        condition = word >> 28
        if word & 0x0e000000 == 0x0a000000:
            assert condition != 15, ('ARMv5 BLX/reserved encoding in ARMv4T', hex(address))
            target = (address + 8 + (signed(word & 0xffffff, 24) << 2)) & 0xffffffff
            return 4, (target, ('bl' if word & (1 << 24) else 'b') + CONDITIONS[condition])
        return 4, None
    half = int.from_bytes(data[offset:offset + 2], 'little')
    if half & 0xf800 == 0xf000:
        assert offset + 4 <= len(data), ('truncated Thumb BL', hex(address))
        tail = int.from_bytes(data[offset + 2:offset + 4], 'little')
        assert tail & 0xf800 == 0xf800, ('unpaired Thumb BL prefix', hex(address))
        target = (address + 4 + (signed(half & 0x7ff, 11) << 12) + ((tail & 0x7ff) << 1)) & 0xffffffff
        return 4, (target, 'bl')
    assert half & 0xf800 != 0xf800, ('unpaired Thumb BL suffix', hex(address))
    if half & 0xf800 == 0xe000:
        return 2, ((address + 4 + (signed(half & 0x7ff, 11) << 1)) & 0xffffffff, 'b')
    if half & 0xf000 == 0xd000 and (half >> 8) & 15 < 14:
        return 2, ((address + 4 + (signed(half & 0xff, 8) << 1)) & 0xffffffff, 'b' + CONDITIONS[(half >> 8) & 15])
    return 2, None


def check_decoder(out):
    # The assembler independently chooses encodings; symbol addresses are the
    # expected targets. Exercise every legal condition, both directions and BL.
    lines = ['.syntax unified', '.text', '.arm', 'arm_backward:', 'mov r0,r0']
    cases = []
    for index, condition in enumerate(CONDITIONS):
        for link in (False, True):
            name = f'arm_case_{index}_{int(link)}'
            target = 'arm_backward' if index % 2 else 'arm_forward'
            mnemonic = ('bl' if link else 'b') + condition
            lines += [name + ':', f'{mnemonic} {target}']
            cases.append((name, target, 'arm'))
    lines += ['arm_forward:', 'bx lr', '.thumb', 'thumb_backward:', 'movs r0,0']
    for index, condition in enumerate(CONDITIONS[:-1]):
        name = f'thumb_case_{index}'
        target = 'thumb_backward' if index % 2 else 'thumb_forward'
        lines += [name + ':', f'b{condition} {target}']
        cases.append((name, target, 'thumb'))
    for index, (mnemonic, target) in enumerate([('b', 'thumb_forward'), ('b', 'thumb_backward'),
                                             ('bl', 'thumb_forward'), ('bl', 'thumb_backward')]):
        name = f'thumb_extra_{index}'
        lines += [name + ':', f'{mnemonic} {target}']
        cases.append((name, target, 'thumb'))
    lines += ['thumb_forward:', 'bx lr']
    source = out / 'decoder.s'
    source.write_text('\n'.join(lines) + '\n')
    obj, elf, binary = (out / ('decoder' + ext) for ext in ('.o', '.elf', '.bin'))
    subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(source), '-o', str(obj)], check=True)
    subprocess.run(['arm-none-eabi-ld', '-Ttext=0x08000000', '-e', '0x08000000', str(obj), '-o', str(elf)], check=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(elf), str(binary)], check=True)
    symbols = {line.split()[2]: int(line.split()[0], 16) for line in
               subprocess.check_output(['arm-none-eabi-nm', '--defined-only', str(elf)], text=True).splitlines() if len(line.split()) == 3}
    data = binary.read_bytes()
    for name, target, mode in cases:
        address = symbols[name] & ~1
        width, branch = decode(data, address - 0x08000000, address, mode)
        assert branch is not None and branch[0] == symbols[target] & ~1, (name, branch, target)
    for hexcode, mode in [('1eff2fe1', 'arm'), ('000000ef', 'arm'), ('7047', 'thumb'), ('00df', 'thumb'), ('00bd', 'thumb')]:
        assert decode(bytes.fromhex(hexcode), 0, 0x08000000, mode)[1] is None
    rejected = 0
    for hexcode, mode in [('00f0', 'thumb'), ('00f00000', 'thumb'), ('00f8', 'thumb'), ('000000fa', 'arm')]:
        try:
            decode(bytes.fromhex(hexcode), 0, 0x08000000, mode)
        except AssertionError:
            rejected += 1
        else:
            raise AssertionError(('invalid fixture accepted', hexcode))
    return dict(assembler_branch_cases=len(cases), nonbranch_cases=5, rejected_invalid_cases=rejected)


def main():
    targets = [('main_rom', ROOT / 'fireemblem8', 0x08000000, '.gba')]
    targets += [(n, ROOT / 'mgfembp' / n, 0x02010000, '.bin')
                for n in ('mgfembp', 'mgfembp_20030206', 'mgfembp_20030219')]
    out = ROOT / '.deps/direct-branch-review'
    out.mkdir(parents=True, exist_ok=True)
    checks = check_decoder(out)
    images = {}
    for name, stem, base, extension in targets:
        elf, mapfile, binary = stem.with_suffix('.elf'), stem.with_suffix('.map'), stem.with_suffix(extension)
        hashes = {k: sha(p) for k, p in [('elf', elf), ('map', mapfile), ('binary', binary)]}
        data = binary.read_bytes()
        symbols = subprocess.check_output(['arm-none-eabi-readelf', '-sW', str(elf)], text=True)
        regions = partition(read_contributions(mapfile.read_text(), base, base + len(data)),
                            read_mappings(symbols, base, base + len(data)))
        starts = [r['start'] for r in regions]

        def region_at(address):
            i = bisect_right(starts, address) - 1
            return regions[i] if i >= 0 and address < regions[i]['end'] else None

        rows, covered = [], set()
        for source in regions:
            mode = source['kind']
            if mode not in ('arm', 'thumb'):
                continue
            address = source['start']
            assert address % (4 if mode == 'arm' else 2) == 0
            while address < source['end']:
                if address in covered:  # BL second half may cross an object boundary.
                    address += 2
                    continue
                width, branch = decode(data, address - base, address, mode)
                addresses = set(range(address, address + width))
                assert not covered.intersection(addresses)
                assert all(region_at(a) and region_at(a)['kind'] == mode for a in addresses)
                covered.update(addresses)
                if branch:
                    target, mnemonic = branch
                    dest = region_at(target)
                    kind = dest['kind'] if dest else 'outside_input'
                    assert kind == mode, (name, hex(address), hex(target), mode, kind)
                    assert target % (4 if kind == 'arm' else 2) == 0
                    rows.append(dict(address=hex(address), target=hex(target), mnemonic=mnemonic,
                                     instruction_bytes=width, source_owner=source['object'],
                                     target_mapping=kind, target_owner=dest['object']))
                address += width
        expected = {a for r in regions if r['kind'] in ('arm', 'thumb') for a in range(r['start'], r['end'])}
        assert covered == expected and rows
        assert hashes == {k: sha(p) for k, p in [('elf', elf), ('map', mapfile), ('binary', binary)]}, 'Build changed during audit'
        detail = out / (name + '-branches.json')
        detail.write_text(json.dumps(rows, indent=2) + '\n')
        images[name] = dict(hashes=hashes, decoded_mapped_instruction_bytes=len(covered), branch_sites=len(rows),
                            target_mappings=dict(Counter(r['target_mapping'] for r in rows)), unaccounted_targets=[],
                            detail_sha256=sha(detail), detail_path=str(detail.relative_to(ROOT)))
    report = dict(scope='Direct ARMv4T B/BL targets decoded from every mapped ARM/Thumb instruction byte in all four images, independent of symbol-driven disassembly. Every target has an instruction owner with matching mode and alignment. Excludes indirect branches, returns, computed PC writes, copied/decompressed execution and arbitrary corruption; not complete reachability.',
                  script_sha256=sha(Path(__file__)), decoder_checks=checks, images=images)
    (ROOT / 'docs/direct-branch-targets.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(images, indent=2))


if __name__ == '__main__':
    main()
