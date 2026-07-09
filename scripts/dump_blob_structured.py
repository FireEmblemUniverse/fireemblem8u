#!/usr/bin/env python3
"""Emit structured in-place GAS for the two Wave-3 blob shapes.

Both shapes have no standard asset-file form, so they are represented as
structured `.2byte`/`.byte` data in their owning data/*.s (in-place; no ldscript
change), with a `.if size != EXPECTED/.error` guard and structure comments.

  oam   : u16 count, then count*(oam0,oam1,oam2), then optional 0-pad.
          Consumer: PutSpriteExt (sprite object list).
  wmpath: repeating [x,y,w,h] u8 header + w*h u16 tiles, then a 0xFF terminator,
          then 0-pad. Consumer: sub_80BBBF4 (worldmap path gfx, GMapPathData).

Usage: dump_blob_structured.py {oam|wmpath} FILE.bin LABEL
Prints the data block (without the leading `.global`/label, which the caller
keeps in place of the old `.incbin`).
"""
import struct
import sys


def u16le(b, off):
    return b[off] | (b[off + 1] << 8)


def guard(label, size, lines):
    end = f".L_end_{label}"
    lines.append(f"{end}:")
    lines.append(f"\t.if ({end} - {label}) != {size}")
    lines.append(f"\t.error \"{label} size mismatch\"")
    lines.append("\t.endif")
    return "\n".join(lines) + "\n"


def dump_oam(data, label):
    count = u16le(data, 0)
    body = 2 + count * 6
    if body > len(data):
        sys.exit(f"{label}: count {count} exceeds blob size {len(data)}")
    out = [f"\t@ {count} OAM objects (PutSpriteExt object list)",
           f"\t.2byte {count}"]
    for i in range(count):
        o = 2 + i * 6
        a0, a1, a2 = u16le(data, o), u16le(data, o + 2), u16le(data, o + 4)
        out.append(f"\t.2byte 0x{a0:04X}, 0x{a1:04X}, 0x{a2:04X}  @ obj {i}")
    pad = data[body:]
    if pad:
        if any(pad):
            sys.exit(f"{label}: non-zero trailing bytes {pad.hex()}")
        out.append("\t.2byte " + ", ".join(["0x0000"] * (len(pad) // 2))
                   + "  @ pad")
    return guard(label, len(data), out)


def dump_wmpath(data, label):
    out = []
    p = 0
    rect = 0
    while p < len(data) and data[p] != 0xFF:
        x, y, w, h = data[p], data[p + 1], data[p + 2], data[p + 3]
        out.append(f"\t.byte {x}, {y}, {w}, {h}  @ rect {rect}: x={x} y={y} w={w} h={h}")
        p += 4
        ntiles = w * h
        if p + ntiles * 2 > len(data):
            sys.exit(f"{label}: insufficient tile data for rect {rect} at offset {p}")
        tiles = [f"0x{u16le(data, p + 2*k):04X}" for k in range(ntiles)]
        for k in range(0, ntiles, 8):
            out.append("\t.2byte " + ", ".join(tiles[k:k + 8]))
        p += ntiles * 2
        rect += 1
    if p >= len(data):
        sys.exit(f"{label}: no 0xFF terminator found")
    out.append("\t.byte 0xFF  @ terminator")
    p += 1
    pad = data[p:]
    if pad:
        if any(pad):
            sys.exit(f"{label}: non-zero padding {pad.hex()}")
        out.append("\t.byte " + ", ".join(["0x00"] * len(pad)) + "  @ align pad")
    return guard(label, len(data), out)


def main():
    if len(sys.argv) != 4:
        sys.exit(__doc__)
    mode, path, label = sys.argv[1], sys.argv[2], sys.argv[3]
    data = open(path, "rb").read()
    if mode == "oam":
        sys.stdout.write(dump_oam(data, label))
    elif mode == "wmpath":
        sys.stdout.write(dump_wmpath(data, label))
    else:
        sys.exit("mode must be oam|wmpath")


if __name__ == "__main__":
    main()
