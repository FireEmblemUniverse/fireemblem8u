#!/usr/bin/env python3
"""Convert an opaque .bin blob into an in-place inline `.2byte` halfword table.

Emits a GAS data block (little-endian u16 entries, 8 per line) bracketed by a
size-assertion so any length drift fails assembly at that blob. Intended to
replace `.incbin "X.bin"` lines for u16 color/data tables that have no
byte-exact typed asset form (see reports/blob_extraction_classification.md).

Usage:
    bin_to_asm_halfwords.py FILE.bin LABEL [--comment "RGB15 color table"]
prints the block (label NOT included; caller keeps the existing `.global`/label).
"""
import argparse
import struct
import sys


def emit(path, label, comment, width=2):
    data = open(path, "rb").read()
    if len(data) % width != 0:
        sys.exit(f"{path}: length {len(data)} not a multiple of {width}")
    fmt, directive, hexw = {2: ("H", ".2byte", 4), 4: ("I", ".4byte", 8)}[width]
    words = struct.unpack(f"<{len(data)//width}{fmt}", data)
    per = 8 if width == 2 else 4
    lines = []
    if comment:
        lines.append(f"\t@ {comment} ({len(words)} u{width*8} entries, {len(data)} bytes)")
    for i in range(0, len(words), per):
        chunk = ", ".join(f"0x{w:0{hexw}X}" for w in words[i:i + per])
        lines.append(f"\t{directive} {chunk}")
    end = f".L_end_{label}"
    lines.append(f"{end}:")
    lines.append(f"\t.if ({end} - {label}) != {len(data)}")
    lines.append(f"\t.error \"{label} size mismatch\"")
    lines.append("\t.endif")
    return "\n".join(lines) + "\n"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("bin")
    ap.add_argument("label")
    ap.add_argument("--comment", default="")
    ap.add_argument("--width", type=int, default=2, choices=(2, 4))
    a = ap.parse_args()
    sys.stdout.write(emit(a.bin, a.label, a.comment, a.width))


if __name__ == "__main__":
    main()
