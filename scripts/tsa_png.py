#!/usr/bin/env python3
# Background tile maps (TSA) as PNGs.
#
# Some backgrounds keep their tile sheet separate from the screen image: the
# map refers to tiles by the numbers they have in the sheet, and
# tsa_generator.py would renumber them. This script builds the map from a
# 240x160 indexed PNG of the screen, using the existing tile sheet as the
# reference for tile numbers.
#
#   build:  <screen.png> <tiles.png> <out.bin> [--overrides FILE] [--expect FILE]
#   render: <map.bin> <tiles.png> <palette.pal> <out.png>
#
# Screen PNG: indexed colour, a multiple of 8 pixels in each direction. A
# pixel's palette index is (palette bank * 16 + colour in the bank).
# Tile sheet PNG: 8 pixels wide, tiles stacked from the top. Pixels are gray
# levels 0, 17, ..., 255 (colour 0..15), or an indexed image with colour 0..15.
#
# Map binary layout: one byte width-1, one byte height-1, then width*height
# little-endian 16-bit entries (tile | hflip << 10 | vflip << 11 | bank << 12).
#
# A flipped symmetric tile looks the same as an unflipped one, so the picture
# cannot say which one the map used. By default the lowest tile number with the
# fewest flips is chosen. A few cells need an explicit entry, given in an
# overrides file: lines of "<column> <row> <entry in hex>", "#" starts a
# comment. An override has to produce the same picture as the cell it replaces.
import argparse
import struct
import sys

import numpy as np
from PIL import Image


def fail(message):
    sys.exit(f"error: {message}")


def read_tile_sheet(path):
    im = Image.open(path)
    a = np.array(im)
    if a.ndim != 2 or a.shape[1] != 8 or a.shape[0] % 8:
        fail(f"{path}: tile sheet must be 8 pixels wide with a height that is a multiple of 8")
    if im.mode == "L":
        if (a % 17).any():
            fail(f"{path}: gray levels must be multiples of 17")
        a = a // 17
    elif im.mode == "P":
        a = a & 15
    else:
        fail(f"{path}: unsupported tile sheet mode {im.mode}")
    return [a[i * 8:(i + 1) * 8, :].astype(np.uint8) for i in range(a.shape[0] // 8)]


def flipped(tile):
    return {
        (0, 0): tile,
        (1, 0): tile[:, ::-1],
        (0, 1): tile[::-1, :],
        (1, 1): tile[::-1, ::-1],
    }


def decode_entry(entry):
    return entry & 0x3FF, (entry >> 10) & 1, (entry >> 11) & 1, (entry >> 12) & 15


def read_overrides(path):
    overrides = {}
    if path is None:
        return overrides
    for number, line in enumerate(open(path, encoding="utf-8"), 1):
        line = line.split("#", 1)[0].strip()
        if not line:
            continue
        parts = line.split()
        if len(parts) != 3:
            fail(f"{path}:{number}: expected '<column> <row> <entry>'")
        overrides[(int(parts[0]), int(parts[1]))] = int(parts[2], 16)
    return overrides


def build(screen_path, sheet_path, overrides_path):
    im = Image.open(screen_path)
    if im.mode != "P":
        fail(f"{screen_path}: screen image must be indexed colour (mode P), not {im.mode}")
    screen = np.array(im)
    height, width = screen.shape
    if width % 8 or height % 8 or not (1 <= width // 8 <= 256 and 1 <= height // 8 <= 256):
        fail(f"{screen_path}: size {width}x{height} is not a multiple of 8")
    cols, rows = width // 8, height // 8

    tiles = read_tile_sheet(sheet_path)
    lookup = {}
    for number, tile in enumerate(tiles):
        for flips, pixels in flipped(tile).items():
            lookup.setdefault(pixels.tobytes(), []).append((number, flips))
    overrides = read_overrides(overrides_path)

    entries = []
    for row in range(rows):
        for col in range(cols):
            cell = screen[row * 8:(row + 1) * 8, col * 8:(col + 1) * 8]
            banks = np.unique(cell >> 4)
            if len(banks) != 1:
                fail(f"cell ({col}, {row}) uses more than one palette bank")
            bank = int(banks[0])
            pixels = (cell & 15).astype(np.uint8)
            matches = lookup.get(pixels.tobytes())
            if not matches:
                fail(f"cell ({col}, {row}) does not match any tile in {sheet_path}")
            if (col, row) in overrides:
                entry = overrides[(col, row)]
                tile, hflip, vflip, entry_bank = decode_entry(entry)
                if (tile, (hflip, vflip)) not in matches or entry_bank != bank:
                    fail(f"override for cell ({col}, {row}) does not match the picture")
            else:
                tile, flips = min(matches, key=lambda m: (m[0], m[1][0] + m[1][1]))
                entry = tile | (flips[0] << 10) | (flips[1] << 11) | (bank << 12)
            entries.append(entry)
    return bytes([cols - 1, rows - 1]) + struct.pack(f"<{len(entries)}H", *entries)


def render(map_path, sheet_path, pal_path, out_path):
    data = open(map_path, "rb").read()
    cols, rows = data[0] + 1, data[1] + 1
    if len(data) != 2 + cols * rows * 2:
        fail(f"{map_path}: size does not match its header")
    entries = struct.unpack(f"<{cols * rows}H", data[2:])
    tiles = read_tile_sheet(sheet_path)
    screen = np.zeros((rows * 8, cols * 8), np.uint8)
    for i, entry in enumerate(entries):
        tile, hflip, vflip, bank = decode_entry(entry)
        if tile >= len(tiles):
            fail(f"{map_path}: entry {i} uses tile {tile}, but the sheet has {len(tiles)}")
        screen[(i // cols) * 8:(i // cols + 1) * 8, (i % cols) * 8:(i % cols + 1) * 8] = (
            bank * 16 + flipped(tiles[tile])[(hflip, vflip)])
    lines = open(pal_path, encoding="utf-8").read().splitlines()
    if lines[0] != "JASC-PAL":
        fail(f"{pal_path}: not a JASC palette")
    colours = [tuple(map(int, line.split())) for line in lines[3:3 + int(lines[2])]]
    image = Image.frombytes("P", (cols * 8, rows * 8), screen.tobytes())
    image.putpalette([c for rgb in colours for c in rgb])
    image.save(out_path)


def suggest_overrides(built, expected):
    width, height = expected[0] + 1, expected[1] + 1
    a = struct.unpack(f"<{width * height}H", built[2:])
    b = struct.unpack(f"<{width * height}H", expected[2:])
    return [f"{i % width} {i // width} 0x{b[i]:04x}" for i in range(width * height) if a[i] != b[i]]


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="command", required=True)
    p = sub.add_parser("build", help="build a map from a screen PNG and a tile sheet")
    p.add_argument("screen")
    p.add_argument("tiles")
    p.add_argument("out")
    p.add_argument("--overrides")
    p.add_argument("--expect", help="a map to compare against; prints suggested overrides on a mismatch")
    p = sub.add_parser("render", help="render a map into a screen PNG")
    p.add_argument("map")
    p.add_argument("tiles")
    p.add_argument("palette")
    p.add_argument("out")
    args = parser.parse_args()

    if args.command == "render":
        render(args.map, args.tiles, args.palette, args.out)
        return
    built = build(args.screen, args.tiles, args.overrides)
    if args.expect:
        expected = open(args.expect, "rb").read()
        if built != expected:
            for line in suggest_overrides(built, expected):
                print(line)
            fail("the map does not match the expected one; add the lines above to an overrides file")
    open(args.out, "wb").write(built)


if __name__ == "__main__":
    main()
