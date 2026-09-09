#!/usr/bin/env python3
"""Layer 0 of the shiftability harness: audit hardcoded GBA addresses in the
BUILD SYSTEM (Makefile, linker scripts, *.mk).

The data-pointer scan (scan_relocs.py) only sees the linked ROM image; it cannot
see addresses baked into the build files. Those constants also encode layout
assumptions, and -- worse -- some are DUPLICATED across files with no single
source of truth, so a future layout shift could desync them and silently corrupt
a subsystem.

This tool:
  1. lists every GBA-range literal in the build files, classified, and
  2. cross-checks COUPLED constants, exiting nonzero on any mismatch.

The canonical coupled pair: the banim sub-link base (`-b 0x8c02000` in the
Makefile) must equal the absolute address of the banim pin in ldscript.txt
(`. = 0xC02000; banim/data_banim.o(.data);`, i.e. ROM_BASE + 0xC02000).
"""

import argparse
import re
import sys

ROM_BASE = 0x08000000
ROM_END = 0x0A000000  # ROM + mirror
EWRAM_LO, EWRAM_HI = 0x02000000, 0x02040000
IWRAM_LO, IWRAM_HI = 0x03000000, 0x03008000

HEX_RE = re.compile(r"0x[0-9a-fA-F]{6,8}")


def classify(val):
    if val == 0x09000000:
        return "LAYOUT (ROM size / pad-to)"
    if ROM_BASE <= val < ROM_END:
        return "ROM"
    if EWRAM_LO <= val < EWRAM_HI:
        return "EWRAM"
    if IWRAM_LO <= val < IWRAM_HI:
        return "IWRAM"
    return None


def scan_file(path):
    """Yield (lineno, literal, value, is_comment, text) for GBA-range hex hits."""
    try:
        with open(path, encoding="utf-8", errors="replace") as fh:
            for lineno, line in enumerate(fh, 1):
                stripped = line.lstrip()
                is_comment = stripped.startswith(("#", "@", "//", "/*", "*"))
                for m in HEX_RE.finditer(line):
                    val = int(m.group(0), 16)
                    if classify(val) is not None:
                        yield lineno, m.group(0), val, is_comment, line.rstrip()
    except FileNotFoundError:
        return


def first_match(path, pattern):
    """Return (lineno, regex match) of the first line matching pattern, or None."""
    rx = re.compile(pattern)
    try:
        with open(path, encoding="utf-8", errors="replace") as fh:
            for lineno, line in enumerate(fh, 1):
                m = rx.search(line)
                if m:
                    return lineno, m, line.rstrip()
    except FileNotFoundError:
        pass
    return None


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--makefile", default="Makefile")
    ap.add_argument("--ldscript", default="ldscript.txt")
    ap.add_argument("--banim-ldscript", default="linker_script_banim.txt")
    ap.add_argument("--extra", nargs="*", default=[], help="additional *.mk files")
    args = ap.parse_args()

    files = [args.makefile, args.ldscript, args.banim_ldscript] + args.extra

    # ---- 1. Inventory -----------------------------------------------------
    print("=" * 72)
    print("Layer 0 - build-system hardcoded GBA addresses")
    print("=" * 72)
    total = 0
    for path in files:
        hits = list(scan_file(path))
        if not hits:
            continue
        print(f"\n{path}:")
        for lineno, lit, val, is_comment, text in hits:
            total += 1
            tag = classify(val)
            note = " (comment)" if is_comment else ""
            print(f"  L{lineno:<5} {lit:<12} {tag}{note}")
            print(f"         | {text.strip()[:90]}")
    print(f"\n{total} GBA-range literal(s) found across build files.")

    # ---- 2. Coupled-pair cross-checks ------------------------------------
    print("\n" + "-" * 72)
    print("Coupled-constant checks (must agree -- a mismatch corrupts a subsystem):")
    print("-" * 72)
    failures = []

    # banim base (Makefile `-b 0xXXXX`) vs ldscript banim pin.
    mk_base = first_match(args.makefile, r"-b\s+(0x[0-9a-fA-F]+)")
    ld_pin = first_match(
        args.ldscript, r"\.\s*=\s*(0x[0-9a-fA-F]+)\s*;\s*banim/data_banim\.o\(\.data\)"
    )
    if mk_base and ld_pin:
        base_val = int(mk_base[1].group(1), 16)
        pin_val = int(ld_pin[1].group(1), 16)
        expect = ROM_BASE + pin_val
        ok = base_val == expect
        status = "PASS" if ok else "FAIL"
        print(
            f"  [{status}] banim base  Makefile:{mk_base[0]} -b {base_val:#08x}"
            f"  ==  ROM_BASE + ldscript:{ld_pin[0]} pin {pin_val:#x} ({expect:#08x})"
        )
        if not ok:
            failures.append(
                f"banim base {base_val:#x} != {expect:#x} "
                f"(Makefile -b vs ldscript pin desynced)"
            )
    else:
        print(
            "  [WARN] could not locate both banim base (Makefile -b) and "
            "ldscript banim pin; coupling not checked"
        )

    # ROM size: objcopy --pad-to vs ROM_BASE + length implied by the top pin.
    mk_pad = first_match(args.makefile, r"--pad-to\s+(0x[0-9a-fA-F]+)")
    if mk_pad:
        pad_val = int(mk_pad[1].group(1), 16)
        ok = pad_val == 0x09000000  # 16 MB cart: 0x08000000 + 0x01000000
        status = "PASS" if ok else "FAIL"
        print(
            f"  [{status}] ROM pad-to  Makefile:{mk_pad[0]} --pad-to {pad_val:#x}"
            f"  ==  0x09000000 (16 MB cart)"
        )
        if not ok:
            failures.append(f"--pad-to {pad_val:#x} != 0x09000000")
    else:
        print("  [WARN] --pad-to not found; ROM-size constant not checked")

    # ---- 3. Pinned layout constants (informational) ----------------------
    print("\n" + "-" * 72)
    print("Layout pins in ldscript.txt (non-shiftable BY CONSTRUCTION):")
    print("-" * 72)
    pin_rx = re.compile(r"\.\s*=\s*(0x[0-9a-fA-F]+)\s*;\s*(\S+)")
    in_rom = False
    npins = 0
    with open(args.ldscript, encoding="utf-8", errors="replace") as fh:
        for lineno, line in enumerate(fh, 1):
            if "ROM __text_start" in line:
                in_rom = True
            if in_rom:
                m = pin_rx.search(line)
                if m and int(m.group(1), 16) >= 0xC00000:
                    npins += 1
                    print(f"  L{lineno:<5} . = {m.group(1):<10} {m.group(2)}")
    print(
        f"\n  {npins} pinned block(s). These keep data at a fixed ROM offset; making\n"
        f"  them shiftable (un-pinning + relocating internal pointers) is separate,\n"
        f"  larger work. The banim base above should derive from its pin (one source\n"
        f"  of truth) so a shift can never desync the pair."
    )

    # ---- verdict ----------------------------------------------------------
    print("\n" + "=" * 72)
    if failures:
        print("RESULT: FAIL")
        for f in failures:
            print(f"  - {f}")
        return 1
    print("RESULT: PASS (coupled build-system constants are consistent)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
