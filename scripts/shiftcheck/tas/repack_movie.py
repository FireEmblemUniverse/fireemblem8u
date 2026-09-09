#!/usr/bin/env python3
"""Repackage a GBAHawk .gbmv (BK2 zip) to target a different ROM.

A GBMV's Header.txt records the ROM's SHA1; GBAHawk warns (a blocking dialog) when
the loaded ROM's hash doesn't match. To replay the SAME inputs on the shifted ROM
without a dialog, copy the movie verbatim but rewrite Header.txt's `SHA1` (and
`GameName`) to the shifted ROM's. Everything else -- Input Log, SyncSettings, the
required BIOS hash -- is unchanged, so the inputs and timing are identical.

Usage: repack_movie.py <in.gbmv> <new_rom.gba> <out.gbmv> [--name "<GameName>"]
"""

import argparse
import hashlib
import sys
import zipfile


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("in_movie")
    ap.add_argument("rom")
    ap.add_argument("out_movie")
    ap.add_argument("--name", default=None, help="override GameName")
    args = ap.parse_args()

    sha1 = hashlib.sha1(open(args.rom, "rb").read()).hexdigest().upper()

    zin = zipfile.ZipFile(args.in_movie, "r")
    items = {}
    for n in zin.namelist():
        items[n] = zin.read(n)
    zin.close()

    hdr_name = next((n for n in items if n.lower() == "header.txt"), None)
    if not hdr_name:
        sys.exit("no Header.txt in movie")
    out_lines = []
    for line in items[hdr_name].decode("utf-8").splitlines():
        if line.startswith("SHA1 "):
            out_lines.append("SHA1 " + sha1)
        elif args.name and line.startswith("GameName "):
            out_lines.append("GameName " + args.name)
        else:
            out_lines.append(line)
    items[hdr_name] = ("\n".join(out_lines) + "\n").encode("utf-8")

    with zipfile.ZipFile(args.out_movie, "w", zipfile.ZIP_DEFLATED) as zout:
        for n, data in items.items():
            zout.writestr(n, data)
    print(f"wrote {args.out_movie}: SHA1 -> {sha1}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
