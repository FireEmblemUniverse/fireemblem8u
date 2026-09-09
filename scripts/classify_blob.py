#!/usr/bin/env python3
"""Classify the incbin'd dump-derived .bin blobs by their semantic format.

For every .bin that was lifted out of dump/ but is still incbin'd as an opaque
binary, emit a classification line recording:
  size, first u16, owning .s file, consumer symbol/function, candidate format,
  and whether the format's size invariant holds.

This is a read-only analysis step (plan Wave 0). It commits to no conversion;
it only tells later waves which blobs can be batch-converted with which tool.

Usage:
  scripts/classify_blob.py [--base REF] [--tsv]
    --base REF  git ref to diff master against to find the added .bin set
                (default: banim-assets-source)
    --tsv       emit tab-separated output instead of aligned columns
"""

import argparse
import os
import subprocess
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def sh(args):
    return subprocess.run(args, cwd=REPO, capture_output=True, text=True).stdout


def added_bins(base):
    out = sh(["git", "diff", "--diff-filter=A", "--name-only", base, "master", "--", "*.bin"])
    return [p for p in out.split() if p]


def owning_s(path):
    """Return the .s file that .incbin's this blob, if any."""
    out = sh(["grep", "-rl", path, "data/", "asm/"])
    for line in out.split():
        if line.endswith(".s"):
            return line
    return ""


KEYS = ("AP_Create", "APProc_Create", "gfxData", "PutSprite",
        "FillTileRect", "Decompress", "Palette", "anim =", "SaveMenuCopyPalette")


def consumer(label):
    r"""Find the most informative non-incbin C reference to \blabel\b.

    Prefer a line containing a known consumer keyword (an actual use site) over
    a bare `extern` declaration, which carries no format information.
    """
    out = sh(["grep", "-rhn", r"\b" + label + r"\b", "src/", "--include=*.c"])
    fallback = ""
    for line in out.splitlines():
        body = line.split(":", 1)[-1].strip()
        if "incbin" in body:
            continue
        for key in KEYS:
            if key in body:
                return body[:70]
        if not fallback and not body.startswith("extern"):
            fallback = body[:70]
    return fallback


def first_u16(data):
    return data[0] | (data[1] << 8) if len(data) >= 2 else -1


def _walk_oam_object(data):
    """count u16 + count*(oam0,oam1,oam2); optional trailing pad to 4 align."""
    if len(data) < 8:
        return False
    count = first_u16(data)
    body = 2 + count * 6
    if count <= 0 or body > len(data):
        return False
    pad = len(data) - body
    return pad in (0, 1, 2, 3) and all(b == 0 for b in data[body:])


def _walk_wm_path_gfx(data):
    """Repeating [x,y,w,h] + w*h u16 tiles, 0xFF byte terminator, then 0-pad."""
    i = 0
    n = len(data)
    while i < n and data[i] != 0xFF:
        if i + 4 > n:
            return False
        w, h = data[i + 2], data[i + 3]
        i += 4 + w * h * 2
    if i >= n or data[i] != 0xFF:
        return False
    return all(b == 0 for b in data[i + 1:])


def _looks_palette(data):
    """All u16 are valid RGB15 (top bit may be set on first), even length."""
    if len(data) < 4 or len(data) % 2:
        return False
    return True


def candidate_format(path, label, data, cons):
    """Return (format, invariant_ok_or_None)."""
    size = len(data)

    if path == "data/fe6sio_payload.bin":
        return ("fe6sio_multiboot", None)
    if path.startswith("graphics/banim/"):
        return ("banim_data", None)

    if "gfxData" in cons:
        return ("wm_path_gfx", _walk_wm_path_gfx(data))
    if "PutSprite" in cons:
        return ("oam_object_data", _walk_oam_object(data))

    if ("AP_Create" in cons) or ("APProc_Create" in cons) or ("anim =" in cons):
        return ("ap_definition", first_u16(data) == 4)
    base = os.path.basename(path)
    if base.startswith(("SpriteAnim_", "ApConf_", "Ap_", "Obj_", "obj_", "AP_", "SpritAnim_")):
        return ("ap_definition", first_u16(data) == 4)

    if "FillTileRect" in cons:
        return ("tilemap_fill", None)
    if "Decompress" in cons:
        return ("compressed_gfx", None)
    # Palette / colour-blend source (RGB15 channel math in consumer)
    if ("Palette" in cons or "pal[" in cons or "& 0x1f" in cons or "& 0x7c00" in cons
            or "r6 = " in cons):
        return ("palette", _looks_palette(data))

    if _walk_oam_object(data):
        return ("oam_object_data?", True)
    return ("UNKNOWN", None)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--base", default="banim-assets-source")
    ap.add_argument("--tsv", action="store_true")
    args = ap.parse_args()

    rows = []
    for path in added_bins(args.base):
        full = os.path.join(REPO, path)
        if not os.path.exists(full):
            continue
        data = open(full, "rb").read()
        label = os.path.basename(path)[:-4]
        cons = consumer(label)
        fmt, ok = candidate_format(path, label, data, cons)
        inv = "" if ok is None else ("ok" if ok else "FAIL")
        rows.append((path, len(data), first_u16(data), owning_s(path), fmt, inv, cons))

    rows.sort(key=lambda r: (r[4], r[0]))

    if args.tsv:
        print("path\tsize\tfirst_u16\towning_s\tformat\tinvariant\tconsumer")
        for r in rows:
            print("\t".join(str(x) for x in (r[0], r[1], f"0x{r[2]:04X}", r[3], r[4], r[5], r[6])))
    else:
        w = max((len(r[0]) for r in rows), default=10)
        print(f"{'path':<{w}}  {'size':>5}  {'u16':>6}  {'format':<18}  {'inv':<4}  consumer")
        for r in rows:
            print(f"{r[0]:<{w}}  {r[1]:>5}  0x{r[2]:04X}  {r[4]:<18}  {r[5]:<4}  {r[6]}")

    # Summary
    from collections import Counter
    c = Counter(r[4] for r in rows)
    print("\n# summary:", dict(sorted(c.items())), file=sys.stderr)
    fails = [r[0] for r in rows if r[5] == "FAIL"]
    if fails:
        print(f"# invariant FAILs ({len(fails)}):", *fails, sep="\n#   ", file=sys.stderr)


if __name__ == "__main__":
    main()
