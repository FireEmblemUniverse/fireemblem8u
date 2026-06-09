#!/usr/bin/env python3
"""Layer 2 helper: emit a SHIFTED copy of ldscript.txt.

Inserts `. += <S>;` immediately after `src/crt0.o(.text);` so every section laid
out after crt0 (all remaining .text, all .rodata, all natural .data) moves forward
by S, while the cartridge header + entry stay put and the absolute-pinned blocks
(`. = 0xC00000;` ...) stay put. A correctly-written (symbol-referenced) pointer is
relocated by the linker to track the move; a hardcoded address literal does not --
which is exactly what diff_shift.py detects.

NEVER overwrites ldscript.txt: writes to a separate --out path. Validates that S
keeps the shifted data below the first pin (else the link would overlap the banim
block / ld would refuse to move `.` backwards).
"""

import argparse
import re
import sys

ROM_BASE = 0x08000000
PIN = 0x08C00000
CRT0_LINE = "src/crt0.o(.text);"


def natural_data_end(map_path):
    rx = re.compile(r"^\s+\.(\w[\w.]*)\s+(0x[0-9a-fA-F]+)\s+(0x[0-9a-fA-F]+)\s+(\S+\.o)\b")
    end = ROM_BASE
    for ln in open(map_path, errors="replace"):
        m = rx.match(ln)
        if not m:
            continue
        a = int(m.group(2), 16)
        s = int(m.group(3), 16)
        if s and ROM_BASE <= a < PIN:
            end = max(end, a + s)
    return end


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--ldscript", default="ldscript.txt")
    ap.add_argument("--map", default="fireemblem8.map")
    ap.add_argument("--shift", required=True, help="shift amount, e.g. 0x40000")
    ap.add_argument("--out", required=True)
    ap.add_argument("--align", type=lambda x: int(x, 0), default=0x1000,
                    help="S must be a multiple of this so alignments are preserved")
    args = ap.parse_args()

    s = int(args.shift, 0)
    if s <= 0:
        sys.exit("shift must be positive")
    if s % args.align:
        sys.exit(f"shift {s:#x} must be a multiple of {args.align:#x} to keep "
                 f"section alignments identical (uniform shift)")

    end = natural_data_end(args.map)
    slack = PIN - end
    if s > slack:
        sys.exit(f"shift {s:#x} exceeds slack {slack:#x} (natural data ends at "
                 f"{end:#010x}, first pin at {PIN:#010x}); would overlap the pinned "
                 f"banim block")

    lines = open(args.ldscript, encoding="utf-8").read().splitlines(keepends=True)
    out = []
    injected = False
    for line in lines:
        out.append(line)
        if not injected and CRT0_LINE in line:
            indent = line[: len(line) - len(line.lstrip())]
            out.append(f"{indent}. += {s:#x}; /* shiftcheck: injected padding "
                       f"(NOT the matching build) */\n")
            injected = True
    if not injected:
        sys.exit(f"could not find injection anchor '{CRT0_LINE}' in {args.ldscript}")

    with open(args.out, "w", encoding="utf-8") as fh:
        fh.writelines(out)
    print(f"wrote {args.out}: shift {s:#x} after crt0 "
          f"(data {end:#010x}->{end + s:#010x}, slack {slack:#x})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
