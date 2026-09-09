#!/usr/bin/env python3
"""Diff matching-vs-shifted memory dumps to find the real divergence.

Regions (capture.lua writes <tag>_<frame>_<region>.bin):
  ew (EWRAM 0x02), iw (IWRAM 0x03) -- game state. The shifted ROM's RAM here
    legitimately differs wherever a correctly-relocated pointer is stored
    (shifted = matching + SHIFT, value is a ROM pointer); those are benign and
    excluded. The rest are REAL divergences, each resolved to its EWRAM/IWRAM
    symbol so the diverged structure is named.
  pal (Palette 0x05), vram (VRAM 0x06), oam (OAM 0x07) -- the final composited
    output (what the screenshot shows). These hold NO pointers, so every differing
    word is a real rendered-output difference, decoded to color index / tile /
    sprite slot to localize a UI divergence.

Usage: ramdiff.py <frame> [--dir DIR] [--elf ELF] [--shift 0x40000]
"""

import argparse
import bisect
import struct
import subprocess
import sys

REGIONS = [  # (name, base, is_ram_with_pointers); whole map minus ROM/BIOS
    ("ew", 0x02000000, True), ("iw", 0x03000000, True), ("io", 0x04000000, False),
    ("pal", 0x05000000, False), ("vram", 0x06000000, False), ("oam", 0x07000000, False),
    ("sram", 0x0E000000, False),
]


def ram_syms(elf, nm):
    out = subprocess.run([nm, "-n", elf], capture_output=True, text=True).stdout
    syms = []
    for ln in out.splitlines():
        p = ln.split()
        if len(p) < 3:
            continue
        try:
            a = int(p[0], 16)
        except ValueError:
            continue
        if 0x02000000 <= a < 0x02040000 or 0x03000000 <= a < 0x03008000:
            syms.append((a, " ".join(p[2:])))
    syms.sort()
    return syms


def owner(syms, addrs, a):
    i = bisect.bisect_right(addrs, a) - 1
    return (syms[i][1], a - syms[i][0]) if i >= 0 else ("?", 0)


def decode(name, off):
    if name == "pal":
        return f"color #{off // 2} ({'OBJ' if off >= 0x200 else 'BG'} pal {(off % 0x200)//0x20})"
    if name == "oam":
        return f"sprite {off // 8} attr{(off % 8)}"
    if name == "vram":
        return f"+0x{off:X} (tile ~{off // 32})"
    return ""


def diff_region(name, base, is_ram, mpath, spath, shift, syms, addrs, out):
    try:
        m = open(mpath, "rb").read()
        s = open(spath, "rb").read()
    except FileNotFoundError:
        return False
    n = min(len(m), len(s))
    for i in range(0, n - 3, 4):
        mw = struct.unpack_from("<I", m, i)[0]
        sw = struct.unpack_from("<I", s, i)[0]
        if mw == sw:
            continue
        if is_ram and 0x08000100 <= mw < 0x08C00000 and sw == ((mw + shift) & 0xFFFFFFFF):
            continue  # benign relocated pointer
        if is_ram:
            sym, o = owner(syms, addrs, base + i)
            label = f"{sym}+0x{o:X}"
        else:
            label = decode(name, i)
        out.append((name, base + i, mw, sw, label))
    return True


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("frame")
    ap.add_argument("--dir", default="/mnt/c/gbahawk_test/out")
    ap.add_argument("--elf", default="fireemblem8.elf")
    ap.add_argument("--prefix", default="arm-none-eabi-")
    ap.add_argument("--shift", default="0x40000")
    ap.add_argument("--max", type=int, default=50)
    args = ap.parse_args()
    shift = int(args.shift, 0)
    syms = ram_syms(args.elf, args.prefix + "nm")
    addrs = [s[0] for s in syms]

    total = []
    present = []
    for name, base, is_ram in REGIONS:
        ok = diff_region(name, base, is_ram,
                         f"{args.dir}/matching_{args.frame}_{name}.bin",
                         f"{args.dir}/shifted_{args.frame}_{name}.bin",
                         shift, syms, addrs, total)
        if ok:
            present.append(name)

    print("=" * 74)
    print(f"Memory divergence @ frame {args.frame}  (regions: {','.join(present) or 'none'})")
    print("=" * 74)
    from collections import Counter
    byregion = Counter(t[0] for t in total)
    print("by region: " + ", ".join(f"{r}={byregion.get(r,0)}" for r, _, _ in REGIONS))
    bysym = Counter(t[4].split('+')[0] if t[0] in ("ew", "iw") else t[0] for t in total)
    print("\nby owning symbol / region:")
    for k, n in bysym.most_common(25):
        print(f"  {n:5d}  {k}")
    print("-" * 74)
    for name, addr, mw, sw, label in total[: args.max]:
        print(f"  [{name:4}] 0x{addr:08X} {label}: {mw:#010x} -> {sw:#010x}")
    if len(total) > args.max:
        print(f"  ... and {len(total) - args.max} more")
    return 0


if __name__ == "__main__":
    sys.exit(main())
