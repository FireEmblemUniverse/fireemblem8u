# LZ Suffix Diagnostic for Hidden Assets

> Diagnostic technique for identifying missed-extraction "hidden" assets concatenated inside what looks like a single LZ-compressed chunk.

## The signal

When a `dump/X.bin` chunk decompresses cleanly via `gbagfx` but the recompressed bytes don't byte-match the original, the naive interpretation is "the original used a different/incompatible compressor". This is usually wrong. The real signal:

> If `gbagfx`'s recompressed file equals the original's **first M bytes**, then the legitimate LZ-compressed asset is exactly **M bytes long**, and the remaining `orig_size - M` bytes are **separate concatenated assets** that the original data mining missed.

## Procedure

For each suspect dump chunk:

```bash
# 1. Decompress
cp dump/X.bin /tmp/x.lz
tools/gbagfx/gbagfx /tmp/x.lz /tmp/x.raw

# 2. Recompress
tools/gbagfx/gbagfx /tmp/x.raw /tmp/x.re.lz

# 3. Check whether re.lz equals the original's prefix
python3 -c '
orig = open("dump/X.bin", "rb").read()
re   = open("/tmp/x.re.lz", "rb").read()
n = 0
for i in range(min(len(orig), len(re))):
    if orig[i] != re[i]:
        break
    n += 1
print(f"orig={len(orig)}, re={len(re)}, common prefix={n}")
print("PREFIX MATCH" if n == len(re) else "INCOMPATIBLE COMPRESSION")
'
```

If the result is **PREFIX MATCH**, slice the chunk at offset `M = len(re.lz)` and apply the procedure recursively to the suffix.

## Recursive dissection rules

For each remaining offset within the chunk:

1. **LZ77 header check** — if `byte[0] == 0x10`, try `gbagfx` decompression with the inferred uncompressed size (`byte[1] | byte[2]<<8 | byte[3]<<16`). If it decompresses and round-trips byte-identical via the prefix-match test above, mark as `LZ` sub-chunk of length M and skip past it.
2. **Palette check** — if the next 32 bytes interpreted as 16 little-endian `u16` colors all have each 5-bit channel ≤ 31 (i.e., `c & 0x1F`, `(c>>5) & 0x1F`, `(c>>10) & 0x1F` all fit in 5 bits), mark as a 32-byte `PAL` sub-chunk and skip past it.
3. Otherwise, mark as `UNK` and stop (or continue probing at 4-byte alignments).

Each sub-chunk becomes its own labeled asset:

- LZ images → `graphics/<dir>/<label>.png` (decompressed to `.4bpp`, then converted to grayscale indexed PNG that re-encodes to the same `.4bpp.lz` via the build chain). The committed source is `.png`; the build rule produces `.4bpp` → `.4bpp.lz`.
- Palettes → `.pal` (JASC text) when no color has bit 15 set, `.agbpal` (binary) when any color has bit 15.
- Unknown remainders → raw `.bin` with the build rule producing `.bin.lz` when the chunk was originally compressed.

Use `gUnknown_<ROM_ADDRESS>` as the label name when no consumer is known.

## Worked example

`dump/const_data_banimekrdk_0DFA2C.bin` was 5944 bytes incbinned anonymously at `0x080DFA2C`. The diagnostic:

- `gbagfx` decompresses 5944 → 6144 raw, then recompresses to **2544** bytes that match the original's first 2544 bytes → PREFIX MATCH.
- The legitimate LZ asset is 2544 bytes (decompressing to 6144 / 192 4bpp tiles). The remaining 3400 bytes are missing data.

Recursively dissecting the 3400-byte suffix at `0x080E041C`:

| Offset (ROM) | Size | Type | Decompressed |
|---|---|---|---|
| 0x080DFA2C | 2544 | LZ | 6144 |
| 0x080E041C |   32 | Palette (no bit-15) | n/a |
| 0x080E043C |  444 | LZ | 2048 |
| 0x080E05F8 | 2924 | LZ | 4096 |

End offset `0x080DFA2C + 5944 = 0x080E1164` lands exactly on the adjacent `Pal_080E1164` block. Each sub-chunk round-trips byte-identical once isolated. See commit `ca414705`.

The same diagnostic applied to `banim-efxlvupfx_5BF114` (1524 bytes, commit `3cc436d2`) revealed an LZ image + 8-palette table + LZ irregular chunk; applied to `banim-efxlvupfx_5BB2FC` (3724 bytes, commit `ca4732a0`) revealed 116 contiguous palette frames + 12 trailing bytes (kept together as a single multi-palette `.agbpal`).

## When the diagnostic *doesn't* apply

If the recompressed output and the original disagree throughout the body (common prefix is only ~4 bytes — just the LZ header), gbagfx is producing a different valid LZ encoding of the same content. Distinguish:

- **PREFIX MATCH** → recursive dissection (this doc).
- **HEADER ONLY** → *first* sweep the minimum match distance; only if that fails is it genuine alternate compression.

### HEADER ONLY → sweep `-mindist` before deferring

gbagfx's greedy compressor takes a **minimum match distance**, hard-coded historically to 2 for `LZ77UnCompVram` safety and now exposed as `gbagfx … X.lz -mindist N` (default 2). Different original FE8 tools used min-distance 1, 2, or 3. The telltale sign of a min-distance mismatch is at the very first run of repeated bytes: the original emits `(minDist-1)` literals before its first back-reference (e.g. `lit,lit,lit,match(dist=3,…)` ⇒ min-distance 3; `lit,match(dist=1,…)` ⇒ min-distance 1).

```bash
tools/gbagfx/gbagfx X.bin /tmp/x.raw            # decompress
for md in 1 2 3 4; do
  tools/gbagfx/gbagfx /tmp/x.raw /tmp/x.re.lz -mindist $md
  cmp -s /tmp/x.re.lz X.bin && echo "EXACT at -mindist $md" && break
done
```

If a sweep value reproduces the original byte-for-byte, **it was never alternate compression** — extract to the proper source form (PNG / `.tsa` / decompressed `.bin`) and add a target-specific `LZ_FLAGS := -mindist N` in the `Makefile` for that output. This recovered `Img_DemonLightSprites_087A5BA4`/`_087A5E9C` (mindist 3), the FE6 SIO multiboot payload (mindist 1), and the 7 title-screen TSA blobs (mindist 1–2) — all previously deferred as "incompatible compression." Only if all sweep values fail is it **genuine alternate compression**; defer with a `reports/detailed_dump_analysis.md` note.

## Related rules

- Never C-hex-dump compressed assets or palettes (see `docs/dump_extraction_plan.md` "Source formats" table).
- LZ assets are decompressed before commit; `.lz`/`.4bpp`/`.gbapal` are build artifacts, never tracked sources.
- Palettes commit as `.pal` (JASC text) by default, `.agbpal` (binary) only when any color has bit 15 set.
