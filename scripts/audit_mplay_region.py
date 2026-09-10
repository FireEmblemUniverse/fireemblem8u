#!/usr/bin/env python3
"""Verify C ownership of all mapped MPlayMain instructions, retaining its assembly data pool."""
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]


def main():
    linked = json.loads(subprocess.check_output(
        ['python3', str(ROOT/'scripts/audit_linked_code.py')], cwd=ROOT, text=True))
    own = json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
    assert linked['elf_sha256'] == own['elf_sha256'], 'Refresh ownership first'
    owners = {v['object'] for v in own['objects'] if v['category'] == 'c_owned'}
    start, pool, end = 0x080cfb68, 0x080cfdc2, 0x080cfdd0
    cursor, instructions, regions = start, 0, []
    for region in linked['regions']:
        if region['end'] <= start or region['start'] >= end:
            continue
        assert region['start'] == cursor and region['end'] <= end, region
        if cursor < pool:
            assert region['end'] <= pool and region['kind'] == 'thumb', region
            assert region['object'] in owners, region
            instructions += region['end'] - cursor
        else:
            assert region['kind'] == 'data' and region['object'] == 'src/m4a_1.o', region
        regions.append(region)
        cursor = region['end']
    assert cursor == end and instructions == 602
    report = dict(start=hex(start), end=hex(end), c_owned_instruction_bytes=instructions,
                  assembly_data_bytes=end-pool, elf_sha256=linked['elf_sha256'],
                  scope='All mapped MPlayMain instructions, including shared call_r3 return, '
                        'belong to C-owned objects. Fourteen padding/literal bytes remain in '
                        'an assembly data section. This does not prove whole-game completion '
                        'or executable classification outside this region.', regions=regions)
    (ROOT/'docs/mplay-code-region.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps({k: v for k, v in report.items() if k != 'regions'}, indent=2))


if __name__ == '__main__':
    main()
