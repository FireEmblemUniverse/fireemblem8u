#!/usr/bin/env python3
"""Render a TSA (tilemap) + 4bpp tileset + palette to a preview PNG.

A TSA/tilemap is a GBA BG map: u16 entries `tile(10b) | hflip | vflip | pal(4b)`.
`.tsa.bin` has a 2-byte `[width-1, height-1]` header (sometimes +1 trailing null
tile of padding); `.map.bin` is headerless and needs width supplied. The tileset
is 4bpp (32 bytes/tile, 2px/byte low-nibble-first); the palette is GBA BGR555.

This is a PREVIEW-ONLY tool (not part of the ROM build).
"""
import struct, sys, argparse

def decode_lz(d):
    # GBA BIOS LZ77 (0x10). Return decompressed bytes; if not LZ, return as-is.
    if len(d) < 4 or d[0] != 0x10:
        return d
    n = d[1] | (d[2] << 8) | (d[3] << 16)
    out = bytearray(); i = 4
    while len(out) < n and i < len(d):
        flags = d[i]; i += 1
        for b in range(8):
            if len(out) >= n: break
            if flags & (0x80 >> b):
                if i + 1 >= len(d): break
                hi = d[i]; lo = d[i+1]; i += 2
                count = (hi >> 4) + 3
                disp = ((hi & 0xF) << 8 | lo) + 1
                for _ in range(count):
                    out.append(out[-disp])
            else:
                if i >= len(d): break
                out.append(d[i]); i += 1
    return bytes(out)

def load_tiles(path):
    # path may be a '+'-joined list of tileset files to concatenate (e.g. CG part_0..9)
    if '+' in path:
        tiles = []
        for p in path.split('+'):
            tiles.extend(load_tiles(p.strip()))
        return tiles
    d = open(path, 'rb').read()
    if path.endswith('.lz'):
        d = decode_lz(d)
    # list of tiles, each a list of 64 nibble values
    tiles = []
    for t in range(len(d) // 32):
        px = []
        for byte in d[t*32:t*32+32]:
            px.append(byte & 0xF); px.append(byte >> 4)
        tiles.append(px)
    return tiles

def load_palette(path):
    d = open(path, 'rb').read()
    if path.endswith('.lz'):
        d = decode_lz(d)
    if path.endswith('.pal'):
        # JASC-PAL text
        lines = open(path).read().splitlines()
        cols = []
        for ln in lines[3:]:
            p = ln.split()
            if len(p) >= 3: cols.append((int(p[0]), int(p[1]), int(p[2])))
        return cols
    cols = []
    for i in range(0, len(d) - 1, 2):
        v = d[i] | (d[i+1] << 8)
        r = (v & 0x1F) << 3; g = ((v >> 5) & 0x1F) << 3; b = ((v >> 10) & 0x1F) << 3
        cols.append((r | r >> 5, g | g >> 5, b | b >> 5))
    return cols

def parse_tsa(path, width=None, with_header=None):
    d = open(path, 'rb').read()
    if path.endswith('.lz'):
        d = decode_lz(d)
    if with_header is None:
        with_header = '.tsa.bin' in path  # headered, incl. compressed '.tsa.bin.lz'
    off = 0; w = width; h = None
    if with_header:
        w = d[0] + 1; h = d[1] + 1; off = 2
    entries = list(struct.unpack('<%dH' % ((len(d) - off) // 2), d[off:off + (len(d)-off)//2*2]))
    if w is None:
        raise SystemExit("need --width for headerless .map.bin")
    if h is None:
        h = (len(entries) + w - 1) // w
    return w, h, entries

def render(tsa_path, tiles_path, pal_path, out_path, width=None, offset=0, flip_rows=False, oob=(255, 0, 255)):
    # oob = colour for tile ids outside the tileset (default magenta = "missing"; use black
    # for overlay tilemaps whose out-of-range ids are intentionally external map/system tiles).
    from PIL import Image
    tiles = load_tiles(tiles_path)
    pal = load_palette(pal_path)
    w, h, entries = parse_tsa(tsa_path, width)
    img = Image.new('RGB', (w*8, h*8), oob)
    px = img.load()
    blank = None  # out-of-range -> oob colour
    for idx in range(min(len(entries), w*h)):
        v = entries[idx]
        tid = (v & 0x3FF); hf = (v >> 10) & 1; vf = (v >> 11) & 1; pidx = (v >> 12) & 0xF
        if tid == 0x3FF:  # conventional blank sentinel tile
            tid = -1
        else:
            tid -= offset
        tile = tiles[tid] if 0 <= tid < len(tiles) else blank
        row = (h - 1 - idx // w) if flip_rows else (idx // w)  # CG maps store rows bottom-up
        tx = (idx % w) * 8; ty = row * 8
        if tile is None:  # out-of-range tile id: leave the oob background
            continue
        for yy in range(8):
            sy = 7 - yy if vf else yy
            for xx in range(8):
                sx = 7 - xx if hf else xx
                c = tile[sy*8 + sx]
                col = pal[pidx*16 + c] if pidx*16 + c < len(pal) else oob
                px[tx+xx, ty+yy] = col
    img.save(out_path)
    return w, h

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('tsa'); ap.add_argument('tiles'); ap.add_argument('palette'); ap.add_argument('out')
    ap.add_argument('--width', type=int, default=None)
    ap.add_argument('--offset', type=int, default=0)
    ap.add_argument('--flip-rows', action='store_true')
    ap.add_argument('--oob-black', action='store_true', help='render out-of-range tile ids as black (overlay tilemaps)')
    a = ap.parse_args()
    w, h = render(a.tsa, a.tiles, a.palette, a.out, a.width, a.offset, a.flip_rows, (0,0,0) if a.oob_black else (255,0,255))
    print("rendered %s  %dx%d tiles -> %s" % (a.tsa, w, h, a.out))
