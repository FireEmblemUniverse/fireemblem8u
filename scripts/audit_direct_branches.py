#!/usr/bin/env python3
"""Check direct branch targets from mapped instructions; not indirect reachability."""
from bisect import bisect_right
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import subprocess

from audit_linked_code import partition, read_contributions, read_mappings

ROOT = Path(__file__).resolve().parents[1]
BRANCH = re.compile(r'b(?:l)?(?:eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al|hs|lo)?')


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def decode_line(line):
    fields = line.split('\t')
    if len(fields) < 4 or not re.fullmatch(r'\s*[0-9a-f]+:', fields[0]):
        return None
    mnemonic = fields[2].strip().removesuffix('.n').removesuffix('.w')
    if not BRANCH.fullmatch(mnemonic):
        return None
    target = fields[3].split()[0]
    if not re.fullmatch(r'[0-9a-f]+', target):
        raise ValueError('Unrecognized direct branch target: ' + line)
    words = fields[1].split()
    if not words or any(not re.fullmatch(r'[0-9a-f]{4}|[0-9a-f]{8}', w) for w in words):
        raise ValueError('Unrecognized instruction bytes: ' + line)
    code = b''.join(int(w, 16).to_bytes(len(w) // 2, 'little') for w in words)
    return int(fields[0].strip()[:-1], 16), int(target, 16), mnemonic, code


def main():
    # Protect the parser against the hex-like "b" mnemonic and Thumb suffixes.
    assert decode_line(' 8001000:\te7fe      \tb.n\t8001000 <loop>')[:3] == (0x8001000, 0x8001000, 'b')
    assert decode_line(' 8001000:\tf000 f800 \tbl\t8001004 <callee>')[3] == bytes.fromhex('00f000f8')
    assert decode_line(' 8001000:\t4770      \tbx\tlr') is None
    assert decode_line(' 8001000:\tbd00      \tpop\t{pc}') is None
    targets = [('main_rom', ROOT / 'fireemblem8', 0x08000000, '.gba', 'ROM')]
    targets += [(n, ROOT / 'mgfembp' / n, 0x02010000, '.bin', '.text')
                for n in ('mgfembp', 'mgfembp_20030206', 'mgfembp_20030219')]
    out = ROOT / '.deps/direct-branch-review'
    out.mkdir(parents=True, exist_ok=True)
    images = {}
    for name, stem, base, extension, section in targets:
        elf = stem.with_suffix('.elf')
        mapfile = stem.with_suffix('.map')
        binary = stem.with_suffix(extension)
        hashes = {k: sha(p) for k, p in [('elf', elf), ('map', mapfile), ('binary', binary)]}
        data = binary.read_bytes()
        symbols = subprocess.check_output(['arm-none-eabi-readelf', '-sW', str(elf)], text=True)
        regions = partition(read_contributions(mapfile.read_text(), base, base + len(data)),
                            read_mappings(symbols, base, base + len(data)))
        starts = [r['start'] for r in regions]

        def region_at(address):
            i = bisect_right(starts, address) - 1
            return regions[i] if i >= 0 and address < regions[i]['end'] else None

        # Keep the instruction-bearing section and symbols, excluding old debug
        # records and overlapping NOBITS overlays. Production ELF is untouched.
        snapshot = out / (name + '.elf')
        subprocess.run(['arm-none-eabi-objcopy', '--only-section=' + section, str(elf), str(snapshot)], check=True)
        dump = subprocess.check_output(['arm-none-eabi-objdump', '-d', str(snapshot)], text=True)
        rows = []
        excluded = 0
        for line in dump.splitlines():
            decoded = decode_line(line)
            if decoded is None:
                continue
            address, target, mnemonic, code = decoded
            source_region = region_at(address)
            if not source_region or source_region['kind'] not in ('arm', 'thumb'):
                excluded += 1  # For example the multiboot header decoded as ARM.
                continue
            assert address + len(code) <= source_region['end'], (name, line, source_region)
            assert data[address - base:address - base + len(code)] == code, (name, line)
            dest = region_at(target)
            kind = dest['kind'] if dest else 'outside_input'
            if kind in ('arm', 'thumb'):
                assert kind == source_region['kind'], (name, line, kind)
                assert target % (4 if kind == 'arm' else 2) == 0, (name, line)
            rows.append(dict(address=hex(address), target=hex(target), mnemonic=mnemonic,
                             instruction_bytes=len(code), source_owner=source_region['object'],
                             target_mapping=kind, target_owner=dest['object'] if dest else None))
        assert rows, name
        unresolved = [r for r in rows if r['target_mapping'] not in ('arm', 'thumb')]
        assert not unresolved, (name, unresolved)
        assert hashes == {k: sha(p) for k, p in [('elf', elf), ('map', mapfile), ('binary', binary)]}, 'Build changed during audit'
        detail = out / (name + '-branches.json')
        detail.write_text(json.dumps(rows, indent=2) + '\n')
        images[name] = dict(hashes=hashes, branch_sites=len(rows),
                            target_mappings=dict(Counter(r['target_mapping'] for r in rows)),
                            decoded_data_rows_excluded=excluded, unaccounted_targets=unresolved,
                            detail_sha256=sha(detail), detail_path=str(detail.relative_to(ROOT)))
    report = dict(scope='All parsed direct B/BL conditional and unconditional branches originating in mapped ARM/Thumb instructions of the current four images. Each decoded instruction matches image bytes and each target lies in an instruction mapping. Excludes indirect branches, returns, computed PC writes, copied/decompressed execution and arbitrary corruption; not a complete reachability proof.',
                  script_sha256=sha(Path(__file__)),
                  tool_version=subprocess.check_output(['arm-none-eabi-objdump', '--version'], text=True).splitlines()[0],
                  images=images)
    (ROOT / 'docs/direct-branch-targets.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({k: {n: v for n, v in x.items() if n != 'branches'} for k, x in images.items()}, indent=2))


if __name__ == '__main__':
    main()
