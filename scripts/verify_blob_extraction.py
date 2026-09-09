#!/usr/bin/env python3
"""Per-blob extraction verification harness (plan Wave 0).

Given a generated assembly fragment that is meant to replace an opaque
`.incbin "X.bin"`, prove it assembles to the *exact* original bytes BEFORE it is
integrated into a real `data/*.s` file and a full ROM rebuild is attempted.

This localises errors (which blob, how many bytes off) that a global
`make compare` would only report as a single ROM mismatch, and it catches
1-2 byte length errors that a later `.align` could zero-fill and mask.

Two entry points:

  verify_blob_extraction.py wrap   LABEL EXPECTED_SIZE < fragment.s > guarded.s
      Wrap a fragment with a `.Lend/.if size != EXPECTED/.error` assertion so the
      size guard travels with the data into the real .s file.

  verify_blob_extraction.py check  fragment.s original.bin [--section .data]
      Assemble the fragment standalone, objcopy to raw binary, and cmp against
      the original blob. Exit 0 on byte-identical, non-zero (with a diff report)
      otherwise.
"""

import argparse
import os
import subprocess
import sys
import tempfile

PREFIX = os.environ.get("PREFIX", "arm-none-eabi-")
AS = PREFIX + "as"
OBJCOPY = PREFIX + "objcopy"
ASFLAGS = ["-mcpu=arm7tdmi", "-mthumb-interwork", "-I", "include"]


def wrap(label, size, body):
    end = f".L_end_{label}"
    return (
        f"{label}:\n"
        f"{body.rstrip()}\n"
        f"{end}:\n"
        f"    .if ({end} - {label}) != {size}\n"
        f"    .error \"{label}: expected {size} bytes\"\n"
        f"    .endif\n"
    )


def check(fragment_path, original_path, section):
    body = open(fragment_path).read()
    repo = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    with tempfile.TemporaryDirectory() as td:
        src = os.path.join(td, "frag.s")
        obj = os.path.join(td, "frag.o")
        binout = os.path.join(td, "frag.bin")
        # Place fragment in the requested section so objcopy can pull it out.
        with open(src, "w") as f:
            f.write(f"\t.section {section}\n")
            f.write(body)
            if not body.endswith("\n"):
                f.write("\n")
        r = subprocess.run([AS, *ASFLAGS, src, "-o", obj], cwd=repo,
                           capture_output=True, text=True)
        if r.returncode != 0:
            print("ASSEMBLE FAILED:\n" + r.stderr, file=sys.stderr)
            return 2
        subprocess.run([OBJCOPY, "-O", "binary", "-j", section, obj, binout],
                       cwd=repo, check=True)
        got = open(binout, "rb").read()
        want = open(original_path, "rb").read()

    if got == want:
        print(f"OK  {os.path.basename(original_path)}  ({len(want)} bytes byte-identical)")
        return 0

    print(f"MISMATCH  {os.path.basename(original_path)}", file=sys.stderr)
    print(f"  generated {len(got)} bytes, original {len(want)} bytes", file=sys.stderr)
    n = min(len(got), len(want))
    first = next((i for i in range(n) if got[i] != want[i]), n)
    print(f"  first differing offset: {first}", file=sys.stderr)
    lo = max(0, first - 4)
    print(f"  orig[{lo}:{first+8}] = {want[lo:first+8].hex()}", file=sys.stderr)
    print(f"  gen [{lo}:{first+8}] = {got[lo:first+8].hex()}", file=sys.stderr)
    return 1


def main():
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="cmd", required=True)

    w = sub.add_parser("wrap")
    w.add_argument("label")
    w.add_argument("size", type=int)

    c = sub.add_parser("check")
    c.add_argument("fragment")
    c.add_argument("original")
    c.add_argument("--section", default=".data")

    args = ap.parse_args()
    if args.cmd == "wrap":
        sys.stdout.write(wrap(args.label, args.size, sys.stdin.read()))
        return 0
    return check(args.fragment, args.original, args.section)


if __name__ == "__main__":
    sys.exit(main())
