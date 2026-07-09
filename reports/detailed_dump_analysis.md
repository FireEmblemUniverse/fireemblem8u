# Detailed Analysis of `dump/` Binary Files — RESOLVED

This document tracked the remaining `dump/*.bin` files after the source-form
extraction pass documented in `docs/dump_extraction_plan.md`. **`dump/` is now
empty** — the 3 previously-deferred files have been genuinely extracted (not
relocated). `ls dump/ | wc -l` → 0; `grep -rl '"dump/' data/ asm/ src/` → none.

## Resolution of the 3 previously-deferred files

| Symbol / Label | Size | Was deferred because… | Actually resolved by |
| --- | --- | --- | --- |
| `Img_DemonLightSprites_087A5BA4` | 760 | "gbagfx recompression only prefix-matches the 4-byte LZ header → genuine alternate compression." | **Disproven.** The original used LZ minimum match distance **3** (gbagfx defaults to 2). Added a `-mindist` option to `gbagfx`'s `lz` command; committed as `graphics/banim/dragonfx/Img_DemonLightSprites_087A5BA4.png`; Makefile builds the `.4bpp.lz` with `-mindist 3`. Byte-identical. |
| `Img_DemonLightSprites_087A5E9C` | 848 | Same as above. | Same — `…_087A5E9C.png`, `-mindist 3`. Byte-identical. |
| `gUnknown_08fe6sio_B1A368` | 21452 | "ARM Thumb code blob — needs full function decomp; out of scope." | **Mis-classified.** It is a single **LZ77 stream** (`svc 0x11` confirms the runtime decompress). Decompressed to `data/fe6sio_payload.bin` (34956 B, a complete FE6 multiboot program that runs at `0x02010000`); the build recompresses it with `-mindist 1`. Byte-identical. Full instruction-level disassembly of the payload remains a future decomp task, but the opaque compressed blob is gone. |

### Why the "HEADER ONLY" deferral was wrong

`docs/lz_suffix_diagnostic.md` previously concluded that a recompression matching
the original only at the 4-byte LZ header meant "genuine alternate compression,
defer." That is incomplete: gbagfx's greedy compressor is parameterised by a
**minimum match distance** (hard-coded to 2 for `LZ77UnCompVram` safety). Several
original FE8 assets were compressed with min-distance 1 or 3. Sweeping `-mindist`
∈ {1,2,3,4} recovers byte-identity for every previously-"incompatible" stream
seen so far. See the corrected "HEADER ONLY" section in that doc.

## Broader `.bin` audit (beyond `dump/`)

The goal "all `.bin` files really extracted, not just moved" prompted a sweep of
**all git-tracked `.bin`** for compressed blobs committed raw:

- **7 title-screen TSA files** (`graphics/titlescreen/title_*_tsa.bin`) were
  LZ-compressed TSA committed as raw `.bin` and incbinned directly — inconsistent
  with the project rule "TSA → `.tsa`, never `.tsa.lz`". Decompressed to
  `graphics/titlescreen/title_*.tsa` (build recompresses to `.tsa.lz`;
  `title_dragon_foreground` needs `-mindist 1`, the rest default to 2). Byte-identical.
- **No other** compressed blob, relocated-untyped chunk, or raw pixel image
  committed as `.bin` was found.

### What the remaining tracked `.bin` are (all legitimate source form)

- **Uncompressed structured data incbinned directly** (e.g. `graphics/bg/*.bin`,
  `graphics/cg/*.bin`, `graphics/map/*.bin`, `graphics/op_anim/**/*.bin`,
  `graphics/misc/Ap*.bin`): tilemaps/TSA, OAM, map-change records, animation-pointer
  config. Stored uncompressed in the ROM; the `.bin` *is* the source. Renaming these
  to `.tsa` would be a cosmetic move, not extraction.
- **Decompressed sources the build recompresses** (e.g. `graphics/btl_bg/*.bin`
  → `.bin.lz`): already the correct pattern.
- **Gitignored build artifacts** (`sound/**/*.bin` from `.aif`, `data/banim/*.bin`,
  `*.feimg*.bin`, `*.fetsa*.bin`): regenerated, never committed.

## Tooling change

`tools/gbagfx` gained a `-mindist N` option on the `lz` command (default 2,
preserving all prior behaviour). Per-file overrides live as target-specific
`LZ_FLAGS` in the `Makefile`.

## Audit (post-resolution)

- `ls dump/ | wc -l` → 0
- `grep -rl '"dump/' data/ asm/ src/` → none
- `make clean_fast && make -j$(nproc) compare` → `fireemblem8.gba: OK`
