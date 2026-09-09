#!/usr/bin/env python3
"""Layer 2 of the shiftability harness: differential two-shift build.

Builds the ROM shifted by two different amounts (N1, N2) and compares each against
the base, word by word, with position correction. For a ROM-pointer word whose
TARGET lies in the shifted region (so the target moved):

  * a correctly-relocated pointer holds value+N1 in build 1 and value+N2 in build 2
    -> it TRACKS the shift (good, relocatable);
  * a hardcoded literal holds the same value in both builds -> it is STUCK; since
    its target moved, it now points at the wrong place -> a shiftability bug.

Two distinct shifts eliminate coincidences: a stray data word that merely happens
to equal value+N1 in one build will not also equal value+N2 in the other.

This is an independent, emulator-free confirmation of Layer 1 (which uses the ELF's
relocation table). The STUCK set, intersected with owning objects, reproduces
Layer 1's opinfo finding from a completely different mechanism.

Needs: emit_relocs_link.sh + objcopy (to build the shifted ROMs), gen_shifted_
ldscript.py, the base .gba, the .map, and numpy.
"""

import argparse
import os
import re
import subprocess
import sys

import numpy as np

import _classify as C

ROM_BASE = C.ROM_BASE
ROM_HI = C.ROM_HI
MIN_PTR = C.MIN_PTR
PIN = C.PIN
HERE = os.path.dirname(os.path.abspath(__file__))


def sh(cmd, **kw):
    return subprocess.run(cmd, check=True, **kw)


def map_bounds(map_path):
    """Return (shift_start_vma, data_end_vma): crt0 .text end, and last natural data."""
    rx = re.compile(r"^\s+\.(\w[\w.]*)\s+(0x[0-9a-fA-F]+)\s+(0x[0-9a-fA-F]+)\s+(\S+\.o)\b")
    crt0_end = None
    data_end = ROM_BASE
    for ln in open(map_path, errors="replace"):
        m = rx.match(ln)
        if not m:
            continue
        a = int(m.group(2), 16)
        s = int(m.group(3), 16)
        obj = m.group(4)
        if obj.endswith("crt0.o") and m.group(1) == "text":
            crt0_end = a + s
        if s and ROM_BASE <= a < PIN:
            data_end = max(data_end, a + s)
    if crt0_end is None:
        sys.exit("could not find crt0.o(.text) in map")
    return crt0_end, data_end


def build_shifted(shift, ldscript, map_path, outdir, env):
    """Generate a shifted ldscript, link, objcopy to a flat .gba. Return path."""
    lds = os.path.join(outdir, f"ldscript_{shift:#x}.txt")
    sh([sys.executable, os.path.join(HERE, "gen_shifted_ldscript.py"),
        "--ldscript", ldscript, "--map", map_path,
        "--shift", hex(shift), "--out", lds])
    elf = os.path.join(outdir, f"shift_{shift:#x}.elf")
    gba = os.path.join(outdir, f"shift_{shift:#x}.gba")
    sh([os.path.join(HERE, "emit_relocs_link.sh"), elf, lds], env=env)
    objcopy = env.get("OBJCOPY", "arm-none-eabi-objcopy")
    sh([objcopy, "--strip-debug", "-O", "binary", "--pad-to", "0x9000000",
        "--gap-fill=0xff", elf, gba])
    return gba


def load_words(path):
    return np.frombuffer(open(path, "rb").read(), dtype="<u4").astype(np.int64)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--base-gba", default="fireemblem8.gba")
    ap.add_argument("--ldscript", default="ldscript.txt")
    ap.add_argument("--map", default="fireemblem8.map")
    ap.add_argument("--shifts", default="0x40000,0x80000")
    ap.add_argument("--outdir", default="build/shiftcheck")
    ap.add_argument("--prefix", default="arm-none-eabi-")
    ap.add_argument("--ref-elf", default="fireemblem8.elf")
    ap.add_argument("--allowlist", default="scripts/shiftcheck/allowlist.txt")
    ap.add_argument("--max-list", type=int, default=40)
    args = ap.parse_args()

    shifts = [int(x, 0) for x in args.shifts.split(",")]
    if len(shifts) != 2:
        sys.exit("--shifts needs exactly two values, e.g. 0x40000,0x80000")
    os.makedirs(args.outdir, exist_ok=True)

    env = dict(os.environ)
    env.setdefault("LD", args.prefix + "ld")
    env.setdefault("OBJCOPY", args.prefix + "objcopy")
    env.setdefault("OBJECTS_LST", "objects.lst")
    env.setdefault("BANIM_OBJECT", "banim/data_banim.o")

    shift_start, data_end = map_bounds(args.map)
    print(f"shift_start (after crt0) = {shift_start:#010x} | "
          f"natural data end = {data_end:#010x} | pin = {PIN:#010x}")

    base = load_words(args.base_gba)
    builds = []
    for s in shifts:
        print(f"\n--- building shifted ROM (+{s:#x}) ---")
        gba = build_shifted(s, args.ldscript, args.map, args.outdir, env)
        builds.append((s, load_words(gba)))

    n = base.size
    base_off = np.arange(n, dtype=np.int64) * 4
    base_vma = base_off + ROM_BASE

    # A base word is in the shifted region if its LOCATION is in [shift_start, data_end).
    loc_shifted = (base_vma >= shift_start) & (base_vma < data_end)
    # A base word's TARGET moved if its VALUE points into [shift_start, data_end).
    is_ptr = (base >= MIN_PTR) & (base < ROM_HI)
    tgt_moved = is_ptr & (base >= shift_start) & (base < data_end)

    # For each shift, fetch the corresponding shifted word (position-corrected).
    tracked = np.ones(n, dtype=bool)   # tracks the shift in BOTH builds
    stuck = np.ones(n, dtype=bool)     # unchanged in BOTH builds
    for s, sw in builds:
        dw = s // 4
        # shifted index: +dw where the location moved, same index otherwise.
        idx = np.arange(n, dtype=np.int64) + np.where(loc_shifted, dw, 0)
        idx = np.clip(idx, 0, n - 1)
        corr = sw[idx]
        tracked &= (corr == base + s)
        stuck &= (corr == base)

    consider = tgt_moved & loc_shifted  # pointer to-shifted, located in shifted region
    n_consider = int(consider.sum())
    n_tracked = int((consider & tracked).sum())
    n_stuck_raw = int((consider & stuck).sum())
    print("\n" + "-" * 78)
    print("Differential oracle (target in shifted region, located in shifted region):")
    print(f"  considered: {n_consider} | TRACKED both shifts (relocatable): "
          f"{n_tracked} | STUCK both shifts: {n_stuck_raw}")
    print("  (STUCK raw mixes hardcoded pointers with coincidental data; the shared")
    print("   classifier below reduces it to high-confidence pointer tables.)")

    # Feed the differential's verdict into the SAME classifier Layer 1 uses, with
    # "tracks the shift" as the relocated oracle (independent of the ELF reloc
    # table) and "target moved" as the candidate restriction (the only pointers the
    # differential can assess). This yields the same HIGH bucket as Layer 1.
    syms = parse_nm(args.ref_elf, args.prefix + "nm")
    ranges = parse_map(args.map)
    allow = load_allowlist(args.allowlist)
    buckets = C.classify(base, tracked, ranges, syms, allow=allow,
                         candidate_mask=tgt_moved)
    n_high = C.report(
        buckets,
        "Layer 2 - differential two-shift scan (oracle: tracks-the-shift)",
        max_list=args.max_list, result_verb="stuck-ptr")

    print("\n" + "=" * 78)
    if n_high:
        print(f"RESULT: {n_high} HIGH-CONFIDENCE hardcoded pointer(s) confirmed by "
              f"the differential (independent of the reloc table; matches Layer 1).")
        return 1
    print("RESULT: no high-confidence hardcoded pointers (differential).")
    return 0


def parse_map(path):
    rx = re.compile(r"^\s+\.(\w[\w.]*)\s+(0x[0-9a-fA-F]+)\s+(0x[0-9a-fA-F]+)\s+(\S+\.o)\b")
    ranges = []
    for ln in open(path, errors="replace"):
        m = rx.match(ln)
        if not m:
            continue
        a, s = int(m.group(2), 16), int(m.group(3), 16)
        if s and ROM_BASE <= a < ROM_HI:
            ranges.append((a, a + s, m.group(4), m.group(1)))
    ranges.sort()
    return ranges


def parse_nm(elf, nm):
    syms = []
    for ln in subprocess.run([nm, "-n", elf], capture_output=True, text=True,
                             check=True).stdout.splitlines():
        p = ln.split()
        if len(p) < 3:
            continue
        try:
            a = int(p[0], 16)
        except ValueError:
            continue
        if ROM_BASE <= a < ROM_HI:
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


if __name__ == "__main__":
    sys.exit(main())
