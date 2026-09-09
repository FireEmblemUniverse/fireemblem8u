#!/usr/bin/env python3
"""Compare the unit-list page-entry C candidate against its original 436 bytes.

Uses the same baseline verification and Thumb-aware linking as the event-unit
selection harness. --candidate-body and --output-dir are supported. Production
sources and objects are never changed by this command.
"""
import sys

import match_unit_definition as harness


def main():
    harness.FUNCTION = 'UnitList_PageChangeIn_Loop'
    harness.COMPILER = 'tools/agbcc/bin/agbcc'
    harness.START = 0x08091F10
    harness.SIZE = 436
    harness.SOURCE_FILE = 'src/unitlistscreen.c'
    harness.FUNCTION_DECL = 'void ' + harness.FUNCTION + '('
    harness.BRANCH_MARKER = '#if NONMATCHING\n\n/* https://decomp.me/scratch/3RUUz */'
    harness.BRANCH_END = '\n#else'
    harness.__doc__ = __doc__
    if not any(arg == '--output-dir' or arg.startswith('--output-dir=') for arg in sys.argv[1:]):
        sys.argv.extend(['--output-dir', str(harness.ROOT / '.deps/unit-list-match')])
    harness.main()


if __name__ == '__main__':
    main()
