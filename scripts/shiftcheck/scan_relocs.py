#!/usr/bin/env python3
"""Layer 1 of the shiftability harness: static relocation-coverage scan.

In the matching build every pointer holds the correct value because everything
sits at its original address. A pointer written as a SYMBOL reference (`&foo`)
compiles to a word the linker RELOCATES (R_ARM_ABS32); a pointer written as a raw
literal (`(u8*)0x08A39148`) compiles to a word with NO relocation. So a 4-byte
word that looks like a ROM pointer but carries no relocation is a hardcoded-pointer
suspect that would break if the layout shifted.

Perfect static precision is impossible (incbin'd audio/graphics/animation data
contains byte runs that coincidentally look like unrelocated ROM pointers), so the
shared classifier (_classify.py) ranks suspects: HIGH = a coherent pointer table in
a MIXED object (one that also has real relocated pointers); lower buckets for
scattered words, pure data blobs, and blob-internal self-references. The HIGH
bucket is the actionable worklist; the tool exits nonzero when it is non-empty.
Layers 2 (differential shift) and 3 (runtime) confirm the rest.

Needs the production ELF re-linked with `-q` (relocs retained), the .gba, the .map,
and `nm`. numpy for the bulk scan.
"""

import argparse
import re
import subprocess
import sys

import numpy as np

import _classify as C


def sh(cmd):
    return subprocess.run(cmd, capture_output=True, text=True, check=True).stdout


def abs32_offsets(elf, readelf):
    out = sh([readelf, "-r", elf])
    offs = []
    rx = re.compile(r"^([0-9a-fA-F]{8})\s+[0-9a-fA-F]{8}\s+R_ARM_ABS32")
    for ln in out.splitlines():
        m = rx.match(ln)
        if m:
            o = int(m.group(1), 16)
            if C.ROM_BASE <= o < C.ROM_HI:
                offs.append(o - C.ROM_BASE)
    return offs


def parse_map(path):
    rx = re.compile(r"^\s+\.(\w[\w.]*)\s+(0x[0-9a-fA-F]+)\s+(0x[0-9a-fA-F]+)\s+(\S+\.o)\b")
    ranges = []
    for ln in open(path, errors="replace"):
        m = rx.match(ln)
        if not m:
            continue
        a, s = int(m.group(2), 16), int(m.group(3), 16)
        if s and C.ROM_BASE <= a < C.ROM_HI:
            ranges.append((a, a + s, m.group(4), m.group(1)))
    ranges.sort()
    return ranges


def parse_nm(elf, nm):
    syms = []
    for ln in sh([nm, "-n", elf]).splitlines():
        p = ln.split()
        if len(p) < 3:
            continue
        try:
            a = int(p[0], 16)
        except ValueError:
            continue
        if C.ROM_BASE <= a < C.ROM_HI:
            syms.append((a, " ".join(p[2:])))
    syms.sort()
    return syms


def load_allowlist(path):
    out = []
    try:
        for ln in open(path, errors="replace"):
            ln = ln.split("#", 1)[0].strip()
            if not ln:
                continue
            p = ln.split()
            lo = int(p[0], 16)
            hi = int(p[1], 16) if len(p) > 1 else lo + 1
            out.append((lo, hi))
    except FileNotFoundError:
        pass
    return sorted(out)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--elf", default="fireemblem8_relocs.elf")
    ap.add_argument("--gba", default="fireemblem8.gba")
    ap.add_argument("--map", default="fireemblem8.map")
    ap.add_argument("--allowlist", default="scripts/shiftcheck/allowlist.txt")
    ap.add_argument("--prefix", default="arm-none-eabi-")
    ap.add_argument("--ref-elf", default="fireemblem8.elf")
    ap.add_argument("--include-text", action="store_true")
    ap.add_argument("--max-list", type=int, default=80)
    args = ap.parse_args()

    words = np.frombuffer(open(args.gba, "rb").read(), dtype="<u4").astype(np.int64)
    relocated = np.zeros(words.size, dtype=bool)
    idx = np.array(abs32_offsets(args.elf, args.prefix + "readelf"),
                   dtype=np.int64) // 4
    idx = idx[idx < words.size]
    relocated[idx] = True

    buckets = C.classify(
        words, relocated,
        parse_map(args.map), parse_nm(args.ref_elf, args.prefix + "nm"),
        allow=load_allowlist(args.allowlist), include_text=args.include_text)

    n_high = C.report(
        buckets,
        "Layer 1 - relocation-coverage scan (unrelocated ROM-pointer words)",
        max_list=args.max_list)

    print("\n" + "=" * 78)
    if n_high:
        print(f"RESULT: {n_high} HIGH-CONFIDENCE suspect(s) -> shiftable-region "
              f"hardcoded pointers to fix. Confirm with `make shiftcheck-diff`.")
        return 1
    print("RESULT: no high-confidence shiftable-region suspects.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
