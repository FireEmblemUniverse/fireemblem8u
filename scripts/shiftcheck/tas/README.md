# Full-game TAS shiftability validation (GBAHawk)

The deepest shiftability check: replay a **full-game TAS to the ending** on both the
matching ROM and a shifted ROM, and confirm they render identically. This exercises
*every* screen the run visits — battles, the world map, chapter transitions, the
class-reel screen where `gOpinfo_1` is used, the ending — far beyond what the mGBA
boot/title/menu oracle (`../run_dynamic.py`) reaches.

A TAS is a fixed per-frame input log recorded against one ROM. Our build is
byte-identical to the original, so the TAS syncs on it. Feeding the **same inputs**
to a correctly-shifted ROM must produce the **same frames**; a hardcoded pointer
that didn't relocate shows up as a framebuffer divergence (render bug) or a
desync/crash (the run stops matching / never reaches the ending). RAM is *not* a
valid oracle — it holds relocated pointers (= shifted addresses); only the
**framebuffer** is.

## Pieces

| File | Role |
| --- | --- |
| `get_gbahawk.sh` | Download the portable GBAHawk (default `v2.1.1`, the movie's `emuVersion`) and place the GBA BIOS in its `Firmware/`. |
| `repack_movie.py` | Copy the `.gbmv` (a BK2 zip) and rewrite `Header.txt`'s `SHA1` to the shifted ROM's, so GBAHawk plays the same inputs on it with no hash-mismatch dialog. |
| `fingerprint.lua` | GBAHawk Lua: replay the loaded movie headless (`invisibleemulation`), screenshot the framebuffer at ~40 evenly-spaced checkpoints + the final frame, write a manifest, `client.exit()`. |
| `run_tas.sh` | Drive `GBAHawk.exe` from WSL2 for one (rom, movie, tag). |
| `compare.py` | Hash the matching vs shifted checkpoint PNGs; report identical / first divergent checkpoint and whether both reached the movie end. |

## How to run

```bash
# 1. emulator + BIOS. The movie requires the real GBA BIOS (sha1 300c20df...);
#    get_gbahawk.sh downloads it (and the portable emulator) and verifies the sha1.
#    Pass a local gba_bios.bin as the 3rd arg to use your own instead.
scripts/shiftcheck/tas/get_gbahawk.sh v2.1.1 /mnt/c/gbahawk_test [/path/to/gba_bios.bin]
# 2. movie + matching ROM into the C:\ working dir; build + stage the shifted ROM
#    (reuse diff_shift.build_shifted) and repack the movie for it:
python3 scripts/shiftcheck/tas/repack_movie.py <movie.gbmv> <shifted.gba> <shifted.gbmv>
# 3. replay both (parallel = two GBAHawk instances, ~53 min each at ~80 fps), then
python3 scripts/shiftcheck/tas/compare.py /mnt/c/gbahawk_test/out matching shifted
```

## Confirmed setup (this run)

- TAS: `vykan12-v2-fesacredstones.gbmv` (254,468 frames, ~71 min). Its `Header.txt`
  `SHA1 = C25B145E…` — **exactly our build**, so the matching ROM is recognized.
- Requires the real GBA BIOS (`GBA_Firmware_Bios 300C20DF…`); GBAHawk auto-resolves
  it from `Firmware/` (`Active Firmwares: GBA+Bios : 300C20DF…`).
- Use GBAHawk **v2.1.1** (the movie's `emuVersion`); the host's old v2.3.2 risked a
  core-version desync.
- Shift: `+0x40000` (reuses the Layer-2 shifted-ROM build).
- `invisibleemulation` keeps `client.screenshot()` byte-identical (verified) — frame
  3000 hashed the same with and without it.

## Result

_(populated after the run; "identical at all checkpoints incl. the ending" ⇒ the
game was beaten identically after a layout shift — shiftable across the whole run.)_

## Notes / gotchas

- `.gbmv` = BizHawk BK2 zip (`Header.txt` / `Input Log.txt` / `SyncSettings.json`).
- Files must live under a `C:\` working dir (`/mnt/c/...`); the Windows `GBAHawk.exe`
  can't conveniently read the WSL filesystem. Use Windows-style path args.
- GBAHawk's accurate core runs ~80 fps; `invisibleemulation` only saves ~10%, so the
  cost is the ~254k frames. Two parallel instances (separate extracted dirs to avoid
  `config.ini` clashes) halve wall-clock.
- This is intentionally *not* wired into `make`/CI: it needs the copyrighted BIOS,
  the Windows emulator, the external movie, and ~1 hour. It is a manual deep-proof on
  top of the static layers + the mGBA runtime layer.
