#!/usr/bin/env python3
"""Check equality-only TST selection and preservation of signed comparisons."""
import argparse
from pathlib import Path
import re
import subprocess
import tempfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler', type=Path, default=Path(__file__).with_name('agbcc'))
    args = parser.parse_args()
    cases = {'eq': '==', 'ne': '!=', 'lt': '<', 'le': '<=', 'gt': '>', 'ge': '>='}
    source = 'extern void hit(void);\n'
    for name, operator in cases.items():
        source += 'void %s(int a, int b) { if ((a & b) %s 0) hit(); }\n' % (name, operator)
    for name, operator in cases.items():
        source += 'int live_%s(int a, int b) { int value = a & b; if (value %s 0) hit(); return value; }\n' % (name, operator)
    with tempfile.TemporaryDirectory(prefix='agbcc-tst-check-') as temporary:
        root = Path(temporary)
        (root / 'cases.c').write_text(source)
        subprocess.run([str(args.compiler.resolve()), '-mthumb-interwork', '-O2',
                        str(root / 'cases.c'), '-o', str(root / 'cases.s')], check=True)
        assembly = (root / 'cases.s').read_text()
        for name in cases:
            body = assembly.split('\n' + name + ':', 1)[1].split('.Lfe', 1)[0]
            has_tst = bool(re.search(r'\btst\s', body))
            if name in ('eq', 'ne'):
                assert has_tst, name + ': missing equality bit test'
                assert not re.search(r'\b(?:and|cmp)\s', body), name + ': redundant bit test'
            else:
                assert not has_tst, name + ': unsafe signed bit test'
                assert re.search(r'\band\s', body), name + ': missing AND'
                assert re.search(r'\bcmp\s', body), name + ': missing CMP'
        for name in cases:
            body = assembly.split('\nlive_' + name + ':', 1)[1].split('.Lfe', 1)[0]
            assert re.search(r'\band\s', body), name + ': missing live AND'
            assert bool(re.search(r'\bcmp\s', body)) == (name not in ('eq', 'ne')), name + ': unsafe live AND folding'
    print('EQ/NE use TST or live AND; LT/LE/GT/GE retain AND/CMP.')


if __name__ == '__main__':
    main()
