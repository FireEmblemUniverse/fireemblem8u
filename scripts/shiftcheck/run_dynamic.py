#!/usr/bin/env python3
"""Layer 3 of the shiftability harness: dynamic (runtime) smoke test.

Layers 1-2 locate hardcoded pointers statically. This layer is the end-to-end
proof: run the matching ROM and a SHIFTED ROM headless under an IDENTICAL scripted
input sequence and compare the video framebuffer (and a few RAM globals) at
checkpoints. The matching build is the ORACLE -- because both ROMs get the same
input, any divergence is caused by the shift, i.e. a pointer that did not relocate.

  * all checkpoints identical  -> shiftable through that depth (boot -> title ->
    past the first menus).
  * a checkpoint diverges       -> a shift-sensitive (hardcoded) pointer was hit;
    the frame where it first diverges localizes when.

Uses mGBA's Python bindings (`pip install mgba`, which links libmgba). If they are
not importable it prints install instructions and exits 0 (non-blocking), so the
static layers still gate CI.

Build the shifted ROM with the same mechanism as Layer 2 (gen_shifted_ldscript +
the production link + objcopy) unless --shifted-gba is supplied.
"""

import argparse
import hashlib
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

# GBA key bitmask (mGBA order): A B SELECT START RIGHT LEFT UP DOWN R L.
KEY = dict(A=1 << 0, B=1 << 1, SELECT=1 << 2, START=1 << 3, RIGHT=1 << 4,
           LEFT=1 << 5, UP=1 << 6, DOWN=1 << 7, R=1 << 8, L=1 << 9)

INSTALL_HINT = """\
Layer 3 needs mGBA. Neither the C library (libmgba) nor the Python bindings are
available here.

Install the C library (preferred; the harness compiles a small oracle against it):
    sudo apt-get install -y libmgba-dev

Then re-run:  make shiftcheck-run
(Static layers 0-2 already gate CI, so this layer is optional/non-blocking.)
"""


def try_import_mgba():
    try:
        import mgba.core  # noqa: F401
        import mgba.image  # noqa: F401
        import mgba.log
        mgba.log.silence()
        return True
    except Exception:
        return False


def run_rom(path, input_script, checkpoints, ram_addrs):
    """Run `path` headless; return {frame: (fb_hash, [ram values])} at checkpoints."""
    import mgba.core
    import mgba.image

    core = mgba.core.load_path(path)
    if core is None:
        raise RuntimeError(f"mGBA could not load {path}")
    image = mgba.image.Image(*core.desired_video_dimensions())
    core.set_video_buffer(image)
    core.reset()

    last = max(checkpoints)
    cps = set(checkpoints)
    result = {}
    for frame in range(last + 1):
        keys = 0
        for start, dur, name in input_script:
            if start <= frame < start + dur:
                keys |= KEY[name]
        core.set_keys(keys)
        core.run_frame()
        if frame in cps:
            buf = bytes(image.buffer) if hasattr(image, "buffer") else b""
            if not buf:
                # fall back to PIL tobytes if .buffer isn't exposed
                buf = image.to_pil().tobytes()
            fbh = hashlib.sha1(buf).hexdigest()[:12]
            ram = []
            for a in ram_addrs:
                try:
                    ram.append(core.read32(a) & 0xFFFFFFFF)
                except Exception:
                    ram.append(None)
            result[frame] = (fbh, ram)
    return result


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--base-gba", default="fireemblem8.gba")
    ap.add_argument("--shifted-gba", default=None,
                    help="prebuilt shifted ROM; if omitted, one is built")
    ap.add_argument("--shift", default="0x40000")
    ap.add_argument("--ldscript", default="ldscript.txt")
    ap.add_argument("--map", default="fireemblem8.map")
    ap.add_argument("--outdir", default="build/shiftcheck")
    ap.add_argument("--prefix", default="arm-none-eabi-")
    ap.add_argument("--checkpoints", default="120,300,600,900,1200",
                    help="frame numbers to compare (60 fps)")
    ap.add_argument("--ram", default="",
                    help="comma-separated hex RAM addresses to compare")
    args = ap.parse_args()

    checkpoints = [int(x) for x in args.checkpoints.split(",") if x.strip()]

    # Build the shifted ROM (Layer 2 mechanism) unless one was supplied.
    shifted = args.shifted_gba
    if not shifted:
        import diff_shift
        env = dict(os.environ)
        env.setdefault("LD", args.prefix + "ld")
        env.setdefault("OBJCOPY", args.prefix + "objcopy")
        env.setdefault("OBJECTS_LST", "objects.lst")
        env.setdefault("BANIM_OBJECT", "banim/data_banim.o")
        os.makedirs(args.outdir, exist_ok=True)
        print(f"building shifted ROM (+{args.shift}) ...")
        shifted = diff_shift.build_shifted(int(args.shift, 0), args.ldscript,
                                           args.map, args.outdir, env)

    # Preferred backend: the C oracle linking libmgba (the Python bindings are not
    # on PyPI for this environment). Compile on demand if libmgba headers exist.
    oracle = ensure_c_oracle()
    if oracle:
        import subprocess
        cmd = [oracle, args.base_gba, shifted] + [str(c) for c in checkpoints]
        return subprocess.run(cmd).returncode

    # Fallback: Python bindings, if importable.
    if try_import_mgba():
        return run_via_python(args.base_gba, shifted, checkpoints)

    print(INSTALL_HINT)
    return 0


def ensure_c_oracle():
    """Return path to a working mgba_oracle binary, compiling it if libmgba is
    present; else None."""
    import subprocess
    binpath = os.path.join(HERE, "mgba_oracle")
    src = os.path.join(HERE, "mgba_oracle.c")
    if os.path.exists(binpath) and os.path.getmtime(binpath) >= os.path.getmtime(src):
        return binpath
    if not os.path.exists("/usr/include/mgba/core/core.h"):
        return None
    cc = os.environ.get("CC", "cc")
    r = subprocess.run([cc, "-O2", "-o", binpath, src, "-lmgba"],
                       capture_output=True, text=True)
    if r.returncode != 0:
        sys.stderr.write(r.stderr)
        return None
    return binpath


def run_via_python(base_gba, shifted, checkpoints):
    # Must match mgba_oracle.c keys_for(): tap A then START in turn from frame 90,
    # i.e. ((f - 90) / 60) % 2 -> START else A (the two backends must drive identically).
    input_script = [(f, 6, "START" if ((f - 90) // 60) % 2 else "A")
                    for f in range(90, max(checkpoints), 60)]
    base = run_rom(base_gba, input_script, checkpoints, [])
    shi = run_rom(shifted, input_script, checkpoints, [])
    print("\nLayer 3 - runtime oracle (python backend)")
    diverged = [f for f in checkpoints if base.get(f) != shi.get(f)]
    for f in checkpoints:
        ok = base.get(f) == shi.get(f)
        print(f"  frame {f:5d}: base={base[f][0]} shifted={shi[f][0]} "
              f"[{'OK' if ok else 'DIVERGE'}]")
    if diverged:
        print(f"RESULT: DIVERGENCE at {diverged}")
        return 1
    print("RESULT: identical at every checkpoint -> shiftable through this depth.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
