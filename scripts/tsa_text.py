#!/usr/bin/env python3
# Converts between a TSA binary (tile screen arrangement) and an editable text
# grid, so tile maps can live in the repo as text instead of binary blobs.
#
# Binary layout: one byte width-1, one byte height-1, then width*height
# little-endian 16-bit entries, row by row from the top-left.
#
# Text layout: a "width height" line, then one line per row of hex entries.
#
# Usage:
#   tsa_text.py <in.tsa.txt> <out.bin>   (text -> binary)
#   tsa_text.py <in.bin> <out.tsa.txt>   (binary -> text)

import struct
import sys


def bin_to_text(data):
    width, height = data[0] + 1, data[1] + 1
    count = width * height
    if len(data) != 2 + count * 2:
        raise ValueError(f"expected {2 + count * 2} bytes, got {len(data)}")
    entries = struct.unpack(f"<{count}H", data[2:])
    lines = [f"{width} {height}"]
    for y in range(height):
        row = entries[y * width:(y + 1) * width]
        lines.append(" ".join(f"0x{v:04x}" for v in row))
    return "\n".join(lines) + "\n"


def text_to_bin(text):
    lines = [line for line in text.splitlines() if line.strip() and not line.startswith("#")]
    width, height = map(int, lines[0].split())
    entries = []
    for line in lines[1:]:
        entries.extend(int(tok, 16) for tok in line.split())
    if len(entries) != width * height:
        raise ValueError(f"expected {width * height} entries, got {len(entries)}")
    if not (1 <= width <= 256 and 1 <= height <= 256):
        raise ValueError("width and height must be between 1 and 256")
    return bytes([width - 1, height - 1]) + struct.pack(f"<{len(entries)}H", *entries)


def main(argv):
    if len(argv) != 3:
        sys.exit(f"usage: {argv[0]} <input> <output>")
    src, dst = argv[1], argv[2]
    if src.endswith(".txt"):
        with open(src, "r") as f:
            out = text_to_bin(f.read())
        with open(dst, "wb") as f:
            f.write(out)
    else:
        with open(src, "rb") as f:
            out = bin_to_text(f.read())
        with open(dst, "w") as f:
            f.write(out)


if __name__ == "__main__":
    main(sys.argv)
