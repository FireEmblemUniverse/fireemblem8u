#!/usr/bin/env python3
"""Compare two GBAHawk TAS-replay runs (matching ROM vs shifted ROM).

fingerprint.lua saves a PNG per checkpoint frame as <tag>_<frame7>.png and lists
the frames in <tag>_manifest.txt, plus a <tag>_done.txt with the frame it reached.
This hashes the corresponding PNGs and reports, per checkpoint, whether the shifted
run rendered identically to the matching run -- and whether both reached the movie
end. The framebuffer is the valid oracle (RAM legitimately differs because relocated
pointers in RAM hold shifted addresses).

Usage: compare.py <out_dir> <tagA=matching> <tagB=shifted>
"""

import argparse
import hashlib
import os
import sys


def sha(path):
    return hashlib.sha1(open(path, "rb").read()).hexdigest()[:16] if os.path.exists(path) else None


def read_manifest(d, tag):
    p = os.path.join(d, f"{tag}_manifest.txt")
    if not os.path.exists(p):
        return []
    return [int(x) for x in open(p).read().split()]


def read_done(d, tag):
    p = os.path.join(d, f"{tag}_done.txt")
    return open(p).read().strip() if os.path.exists(p) else "(no done marker)"


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("out_dir")
    ap.add_argument("tagA", nargs="?", default="matching")
    ap.add_argument("tagB", nargs="?", default="shifted")
    args = ap.parse_args()
    d = args.out_dir

    fa, fb = read_manifest(d, args.tagA), read_manifest(d, args.tagB)
    frames = sorted(set(fa) & set(fb))
    print("=" * 70)
    print(f"GBAHawk TAS replay comparison: {args.tagA} vs {args.tagB}")
    print("=" * 70)
    print(f"{args.tagA}: {read_done(d, args.tagA)}")
    print(f"{args.tagB}: {read_done(d, args.tagB)}")
    if fa != fb:
        print(f"NOTE: manifests differ ({len(fa)} vs {len(fb)} checkpoints); "
              f"comparing the {len(frames)} common frames.")
    print("-" * 70)

    diverged = []
    for fr in frames:
        name = f"_{fr:07d}.png"
        ha = sha(os.path.join(d, args.tagA + name))
        hb = sha(os.path.join(d, args.tagB + name))
        ok = ha is not None and ha == hb
        if not ok:
            diverged.append(fr)
        mark = "OK" if ok else "DIVERGE"
        print(f"  frame {fr:7d}: {args.tagA}={ha} {args.tagB}={hb}  [{mark}]")

    print("=" * 70)
    if not frames:
        print("RESULT: no comparable checkpoints (a run did not produce screenshots).")
        return 2
    if diverged:
        print(f"RESULT: DIVERGENCE at {len(diverged)} checkpoint(s); first at frame "
              f"{diverged[0]} -> a shift-sensitive pointer renders differently there.")
        return 1
    print(f"RESULT: identical at all {len(frames)} checkpoints. If both reached the "
          f"movie end, the shifted ROM played the entire TAS to the ending "
          f"identically -> shiftable across the whole run.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
