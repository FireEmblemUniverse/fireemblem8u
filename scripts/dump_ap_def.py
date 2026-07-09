#!/usr/bin/env python3
"""Produce a byte-exact, in-place GAS body for one AP (Animation Player) blob.

AP definitions decode to labeled assembly (motion / frame_list / anim_list /
frame_N / anim_N), the project's canonical form (see
src/data/unit_icon/const_data_unit_icon_move.s). scripts/apdump.py emits that form but its
table/sheet-index heuristics do not reproduce every blob exactly. This wrapper
guarantees byte-identical output by self-verifying and degrading gracefully:

  1. apdump output assembles to the exact original bytes -> use it (fully decoded).
  2. apdump output is a strict prefix of the original -> use it plus the exact
     remaining original bytes as commented `.byte`s (decoded body + raw tail).
  3. otherwise -> emit the whole blob as a flat `.2byte` table (guaranteed exact)
     with the decoded header offsets in a comment so it is still labeled.

Every result is bracketed by a `.if size != EXPECTED/.error` guard and is
re-checked by assembling standalone and comparing against the original blob; the
script exits non-zero if the final body is not byte-identical.

Usage: dump_ap_def.py FILE.bin LABEL  ->  prints the body (caller keeps the
existing `.global LABEL` / `LABEL:` line in place of the old `.incbin`).
"""
import os
import struct
import subprocess
import sys
import tempfile

PREFIX = os.environ.get("PREFIX", "arm-none-eabi-")
AS, OBJCOPY = PREFIX + "as", PREFIX + "objcopy"
ASFLAGS = ["-mcpu=arm7tdmi", "-mthumb-interwork", "-I", "include"]
REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def assemble(body, label):
    """Assemble `LABEL:\\n<body>` and return the raw .data bytes (or None)."""
    with tempfile.TemporaryDirectory() as td:
        src = os.path.join(td, "f.s")
        obj = os.path.join(td, "f.o")
        out = os.path.join(td, "f.bin")
        with open(src, "w") as f:
            f.write(f"\t.section .data\n{label}:\n{body}")
        r = subprocess.run([AS, *ASFLAGS, src, "-o", obj],
                           cwd=REPO, capture_output=True, text=True)
        if r.returncode != 0:
            return None, r.stderr
        subprocess.run([OBJCOPY, "-O", "binary", "-j", ".data", obj, out],
                       cwd=REPO, check=True)
        return open(out, "rb").read(), None


def apdump(path, label):
    r = subprocess.run([sys.executable, os.path.join(REPO, "scripts/apdump.py"),
                        path, label + "_"], cwd=REPO, capture_output=True, text=True)
    return r.stdout if r.returncode == 0 else None


def guard(label, size):
    end = f".L_end_{label}"
    return (f"{end}:\n\t.if ({end} - {label}) != {size}\n"
            f"\t.error \"{label} size mismatch\"\n\t.endif\n")


def flat(data, label, header_note):
    words = struct.unpack(f"<{len(data)//2}H", data)
    lines = [f"\t@ AP animation definition ({header_note}); "
             f"flat halfword table, {len(data)} bytes"]
    for i in range(0, len(words), 8):
        lines.append("\t.2byte " + ", ".join(f"0x{w:04X}" for w in words[i:i+8]))
    return "\n".join(lines) + "\n"


def tail_bytes(data, start):
    chunk = ", ".join(f"0x{b:02X}" for b in data[start:])
    return f"\t.byte {chunk}  @ trailing anim data not decoded by apdump\n"


def build(path, label):
    data = open(path, "rb").read()
    if len(data) % 2:
        sys.exit(f"{label}: odd length")
    fto, ato = struct.unpack("<HH", data[:4])
    header_note = f"frame_list +0x{fto:X}, anim_list +0x{ato:X}"

    body = apdump(path, label)
    if body is not None:
        got, err = assemble(body, label)
        if got == data:
            chosen = body
        elif got is not None and got == data[:len(got)] and len(got) < len(data):
            chosen = body + tail_bytes(data, len(got))
        else:
            chosen = flat(data, label, header_note)
    else:
        chosen = flat(data, label, header_note)

    chosen = chosen + guard(label, len(data))
    got, err = assemble(chosen, label)
    if got != data:
        sys.exit(f"{label}: FINAL body not byte-identical "
                 f"({None if got is None else len(got)} vs {len(data)}); {err or ''}")
    return chosen


def main():
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    sys.stdout.write(build(sys.argv[1], sys.argv[2]))


if __name__ == "__main__":
    main()
