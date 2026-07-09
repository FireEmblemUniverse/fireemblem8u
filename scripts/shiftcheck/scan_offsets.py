#!/usr/bin/env python3
"""Layer 1b of the shiftability harness: cross-resource hardcoded-offset scan.

`scan_relocs.py` asks "which ROM-pointer words carry NO relocation?" (raw address
literals). This tool asks the complementary question: of the words that DO carry a
relocation, which point at a *different* resource than the symbol they relocate
against -- i.e. `&ResourceA + hardcoded_offset` that actually lands in ResourceB.

Why that matters: if such a word is written `Img_A + 0x280` (a literal offset that
happens to equal `&Img_B` in the current layout), the linker tracks Img_A, not
Img_B. Grow Img_A and Img_B slides down, but `Img_A + 0x280` stays put -> the word
now points into the middle of the enlarged Img_A. The shiftable form is a direct
`&Img_B` reference (addend 0), which the linker relocates to follow Img_B.

Detection: for every retained R_ARM_ABS32 against a NAMED symbol S (section symbols
like `ROM` are skipped -- binutils collapses local/asm-label targets onto them, so
the source symbol is lost; those must be caught at the source level, see
scan_raw_casts.sh), compute addend = word - S.value and the symbol T that owns the
word. T != S means the offset crosses out of S into T.

Buckets:
  HIGH   word == T.start, location in a DATA section, addend > 0 -- a stored pointer
         that reaches the START of a different resource. This is the actionable
         "A + offset = &B" bug shape (e.g. the gOpenLimitViewImgLut entry that was
         `Img_LimitViewSquares + 0x280` instead of `gUnkData_34`).
  REVIEW everything else: negative addends and mid-symbol landings are almost always
         compiler artifacts -- `&arr[-1]` 1-based-index bias bases and base-register
         reuse in .text literal pools, which the compiler regenerates correctly on
         every build (and which move with their object under a uniform shift).

NOTE: the binary view cannot see offsets the compiler applies as a runtime `ADD #imm`
(it reuses the base register, so the relocated word is the base with addend 0). Those
are real but only visible in source -- run the source scans too. Exit nonzero if HIGH
is non-empty.
"""

import argparse
import bisect
import re
import subprocess
import sys

import _classify as C

SECTION_SYMS = {"ROM", "__text_start", "Init"}


def sh(cmd):
    return subprocess.run(cmd, capture_output=True, text=True, check=True).stdout


def parse_relocs(elf, readelf):
    """Yield (offset, sym_value, sym_name) for ROM-located R_ARM_ABS32 relocs."""
    rx = re.compile(
        r"^([0-9a-fA-F]{8})\s+[0-9a-fA-F]{8}\s+R_ARM_ABS32\s+([0-9a-fA-F]{8})\s+(\S+)")
    for ln in sh([readelf, "-r", "-W", elf]).splitlines():
        m = rx.match(ln)
        if not m:
            continue
        off, sv, nm = int(m.group(1), 16), int(m.group(2), 16), m.group(3)
        if C.ROM_BASE <= off < C.ROM_HI:
            yield off, sv, nm


def parse_syms(elf, nm):
    syms, section_names = [], set()
    for ln in sh([nm, elf]).splitlines():
        p = ln.split()
        if len(p) < 3:
            continue
        try:
            a = int(p[0], 16)
        except ValueError:
            continue
        typ, name = p[1], " ".join(p[2:])
        if C.ROM_BASE <= a < C.ROM_HI:
            syms.append((a, name))
            if typ in ("a", "N") or name.startswith(".") or name in SECTION_SYMS:
                section_names.add(name)
    syms.sort()
    return syms, section_names


def parse_map_text_ranges(path):
    """Return sorted .text VMA ranges (to tell code literal pools from data tables)."""
    rx = re.compile(r"^\s+\.(\w[\w.]*)\s+(0x[0-9a-fA-F]+)\s+(0x[0-9a-fA-F]+)\s+(\S+\.o)\b")
    out = []
    for ln in open(path, errors="replace"):
        m = rx.match(ln)
        if not m:
            continue
        a, s, sect = int(m.group(2), 16), int(m.group(3), 16), m.group(1)
        if s and sect == "text" and C.ROM_BASE <= a < C.ROM_HI:
            out.append((a, a + s))
    out.sort()
    return out


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--elf", default="fireemblem8_relocs.elf")
    ap.add_argument("--gba", default="fireemblem8.gba")
    ap.add_argument("--map", default="fireemblem8.map")
    ap.add_argument("--ref-elf", default="fireemblem8.elf")
    ap.add_argument("--prefix", default="arm-none-eabi-")
    args = ap.parse_args()

    import numpy as np
    words = np.frombuffer(open(args.gba, "rb").read(), dtype="<u4")
    syms, section_names = parse_syms(args.ref_elf, args.prefix + "nm")
    starts = [s[0] for s in syms]
    text = parse_map_text_ranges(args.map)
    tstarts = [t[0] for t in text]

    def owner(v):
        i = bisect.bisect_right(starts, v) - 1
        return syms[i] if i >= 0 else (None, None)

    def in_text(o):
        i = bisect.bisect_right(tstarts, o) - 1
        return i >= 0 and text[i][0] <= o < text[i][1]

    high, review = {}, {}
    for off, sv, nm in parse_relocs(args.elf, args.prefix + "readelf"):
        if nm in section_names:
            continue
        w = int(words[(off - C.ROM_BASE) // 4])
        if w == sv or not (C.MIN_PTR <= w < C.ROM_HI):
            continue
        t_start, t_name = owner(w)
        b_start, _ = owner(sv)
        if t_start is None or b_start == t_start:
            continue  # offset stays within the base symbol -> safe (relative)
        rec = dict(off=off, sv=sv, w=w, addend=w - sv, base=nm, tgt=t_name,
                   tdelta=w - t_start)
        actionable = (w == t_start and not in_text(off) and (w - sv) > 0)
        (high if actionable else review).setdefault((nm, t_name), []).append(rec)

    def dump(d, title):
        n = sum(len(v) for v in d.values())
        print(f"\n{title}: {n} instance(s) in {len(d)} pair(s)")
        for (b, t), lst in sorted(d.items(), key=lambda kv: -len(kv[1])):
            r = lst[0]
            note = "" if r["tdelta"] == 0 else f" (mid-{t}+0x{r['tdelta']:X})"
            print(f"    {len(lst):4d}  {b} {'+' if r['addend']>=0 else '-'}0x"
                  f"{abs(r['addend']):X} -> {t}{note}   @0x{r['off']:08X}")
        return n

    print("=" * 78)
    print("Layer 1b - cross-resource hardcoded-offset scan (wrong-base relocations)")
    print("=" * 78)
    n_high = dump(high, "[A] HIGH (data pointer reaches a different resource's START)")
    dump(review, "[B] REVIEW (compiler bias-base / .text reuse / mid-symbol -- usually benign)")
    print("\n" + "=" * 78)
    if n_high:
        print(f"RESULT: {n_high} HIGH cross-resource offset(s) -> reference the target "
              f"symbol directly (byte-identical, shiftable).")
        return 1
    print("RESULT: no HIGH cross-resource hardcoded offsets (named-global bases).")
    print("        (Runtime-ADD offsets are invisible here -- see the source scans.)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
