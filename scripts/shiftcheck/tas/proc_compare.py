#!/usr/bin/env python3
"""Compare the live Proc array (matching vs shifted ROM) from EWRAM dumps.

The engine is driven by Procs (src/proc.c, sProcArray[64] @ 0x02024e68, stride 0x6C).
Every active proc holds ROM pointers: proc_script@0, proc_scrCur@4, proc_endCb@8,
proc_idleCb@0xC, proc_name@0x10. In a correctly-shifted ROM every one of these must
be matching+SHIFT. A field that stays UNSHIFTED (== matching) came from a hardcoded
pointer -- the bug -- and its symbol names the culprit ProcCmd table / routine.

Usage: proc_compare.py <frame> [--dir DIR] [--elf ELF] [--shift 0x40000]
"""

import argparse
import bisect
import struct
import subprocess
import sys

ARRAY = 0x02024E68
EW_BASE = 0x02000000
STRIDE = 0x6C
COUNT = 64
FIELDS = [("proc_script", 0x00), ("proc_scrCur", 0x04), ("proc_endCb", 0x08),
          ("proc_idleCb", 0x0C), ("proc_name", 0x10)]
ROM_LO, ROM_HI = 0x08000000, 0x0A000000


def rom_syms(elf, nm):
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
        if ROM_LO <= a < ROM_HI:
            syms.append((a, " ".join(p[2:])))
    syms.sort()
    return syms


def sym_of(syms, addrs, a):
    if not (ROM_LO <= a < ROM_HI):
        return None
    i = bisect.bisect_right(addrs, a) - 1
    if i >= 0:
        return f"{syms[i][1]}+0x{a - syms[i][0]:X}" if a != syms[i][0] else syms[i][1]
    return "?"


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("frame")
    ap.add_argument("--dir", default="/mnt/c/gbahawk_test/out")
    ap.add_argument("--elf", default="fireemblem8.elf")
    ap.add_argument("--prefix", default="arm-none-eabi-")
    ap.add_argument("--shift", default="0x40000")
    args = ap.parse_args()
    shift = int(args.shift, 0)
    syms = rom_syms(args.elf, args.prefix + "nm")
    addrs = [s[0] for s in syms]

    m = open(f"{args.dir}/matching_{args.frame}_ew.bin", "rb").read()
    s = open(f"{args.dir}/shifted_{args.frame}_ew.bin", "rb").read()
    off0 = ARRAY - EW_BASE

    def fields(buf, i):
        base = off0 + i * STRIDE
        return {name: struct.unpack_from("<I", buf, base + o)[0] for name, o in FIELDS}

    print("=" * 78)
    print(f"Proc array compare @ frame {args.frame}  (shifted should be matching+{shift:#x})")
    print("=" * 78)
    bugs = []
    for i in range(COUNT):
        mf = fields(m, i)
        sf = fields(s, i)
        m_active = mf["proc_script"] != 0
        s_active = sf["proc_script"] != 0
        if not m_active and not s_active:
            continue
        name = sym_of(syms, addrs, mf["proc_script"]) or "<none>"
        # check each ROM-ptr field relocates
        bad = []
        for fn, _ in FIELDS:
            mv, sv = mf[fn], sf[fn]
            if mv == 0 and sv == 0:
                continue
            if ROM_LO <= mv < ROM_HI:
                if sv != ((mv + shift) & 0xFFFFFFFF):
                    # unshifted (==mv) is the hardcoded-pointer signature
                    tag = "UNSHIFTED" if sv == mv else "MISMATCH"
                    bad.append(f"{fn}={mv:#010x}->{sv:#010x} [{tag} {sym_of(syms,addrs,mv)}]")
        flag = "  <<< BUG" if any("UNSHIFTED" in b for b in bad) else ""
        if bad or (m_active != s_active):
            state = ("M" if m_active else "-") + ("S" if s_active else "-")
            print(f"\nslot {i:2d} [{state}] {name}{flag}")
            for b in bad:
                print(f"      {b}")
            if any("UNSHIFTED" in b for b in bad):
                bugs.append((i, name, bad))
    print("\n" + "=" * 78)
    if bugs:
        print(f"RESULT: {len(bugs)} proc(s) with an UNSHIFTED (hardcoded) ROM pointer:")
        for i, name, bad in bugs:
            print(f"  slot {i}: {name}")
    else:
        print("RESULT: all proc ROM pointers relocated correctly at this frame "
              "(divergence may be in proc DATA, not the script pointer).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
