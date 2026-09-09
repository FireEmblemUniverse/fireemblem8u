#!/usr/bin/env python3
"""Check the corrected USA audio helper boundaries in the linked ELF.

These extents describe distinct entry bodies, not complete execution paths:
ldrb_r3_r2 falls through into chk_adr_r2. Shared literal data is excluded.
This is a metadata regression check, not an executable-coverage percentage.
"""
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
EXPECTED = {
    'MPlayJumpTableCopy': (0x080CF959, 22, 'GLOBAL'),
    'ldrb_r3_r2': (0x080CF971, 2, 'LOCAL'),
    'chk_adr_r2': (0x080CF973, 22, 'LOCAL'),
    'ld_r3_tp_adr_i': (0x080CF98D, 10, 'GLOBAL'),
    'ld_r3_tp_adr_i_unchecked': (0x080D00A1, 10, 'LOCAL'),
}


def main():
    symbols = {}
    output = subprocess.check_output(
        ['arm-none-eabi-readelf', '-sW', str(ROOT / 'fireemblem8.elf')], text=True
    )
    for line in output.splitlines():
        fields = line.split()
        if len(fields) >= 8 and fields[3] == 'FUNC' and fields[-1] in EXPECTED:
            name = fields[-1]
            if name in symbols:
                raise SystemExit('duplicate function symbol: ' + name)
            symbols[name] = (int(fields[1], 16), int(fields[2]), fields[4])
    errors = [f'{name}: expected {expected}, found {symbols.get(name)}'
              for name, expected in EXPECTED.items() if symbols.get(name) != expected]
    if errors:
        raise SystemExit('\n'.join(errors))
    print('Five audio helper addresses, sizes and symbol bindings verified.')


if __name__ == '__main__':
    main()
