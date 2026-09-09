# Extract all `dump/` data into source form

## Context

`dump/` holds 205 raw byte-blobs (~920 KB) that earlier passes left behind because they couldn't be type-determined automatically. They're catalogued in `reports/detailed_dump_analysis.md`.

Extraction here means **moving each chunk into typed source form** — `const`-typed C arrays in `src/data/*.c`, or typed graphics (`.png`/`.pal`/`.tsa`) under `graphics/misc/`. Relocating raw `.bin` files from `dump/` to `graphics/misc/` without typing them is not extraction — it's cheating. Each conversion must round-trip byte-identical via `make compare`.

The hard constraint on the mechanics: `ldscript.txt` places each `data/<file>.o(.data)` section contiguously, so removing a single `.incbin` from a `.s` file shifts every subsequent label's ROM address. The only safe unit of migration is the **whole `.s` file** (or a contiguous tail of it ending at a section boundary): every label gets typed C source at once, the `.s` file empties, and the linker line moves from `data/X.o(.data)` to `src/data/X.o(.rodata)`.

## Approach

A per-file migration workflow, applied in waves from simplest to most complex.

### Per-file procedure

For each `data/<file>.s` that references `dump/`:

1. **Survey usages.** For every `.global <label>` in the file, `grep -rn '\b<label>\b' src/ include/ data/` to find:
   - C usages — usually `CpuFastCopy(label, ...)`, `Register{Obj,Bg}{Pal,Gfx}(label, ...)`, function-pointer tables, or struct-array initializers, each of which pins down the type.
   - `extern` declarations in `include/*.h` — explicit type, dimensions.
   - Cross-references from other `.s` files (e.g. AnimScr loaders) when there's no C usage.

   If none of the above pin down the type, fall back to the **FEBuilderGBA** codebase at `/home/laqieer/FEBuilderGBA/`. Search the editor in two ways, because it sometimes hard-codes the data's direct address but more often hard-codes the *address of the pointer to the data*:
   - **Direct address.** `grep -rn '0x<addr>' /home/laqieer/FEBuilderGBA/FEBuilderGBA.Core/`.
   - **Pointer address.** Use `baserom.gba` to find which 4-byte LE words equal `<addr> | 0x08000000` (i.e. addresses in ROM whose value points at `<addr>`), then grep FEBuilderGBA for those pointer addresses. `FEBuilderGBA/ROMFE8U.cs` is the canonical place where the editor keeps its FE8U pointer-table addresses.
   - Either form will point to `*Form*.cs` / `*Core*.cs` files containing the editor's field-by-field reader, which reveals the struct shape.
2. **Decide type per label.** Most chunks decompose to `const u8[N]`, `const u16[N]`, `const u32[N]`, or a known struct (`AnimSprite`, `ProcCmd`, `Anim`, …). If the type can't be confidently inferred even after FEBuilderGBA lookup, `const u8 label[N]` is the conservative fallback — but record a one-line "why we can't type this better" rationale in `reports/detailed_dump_analysis.md`. A `u8[N]` extraction is not closure; it's a deferred typing task with a placeholder.

   **CRITICAL: identify pointer fields.** Pointer-or-integer disambiguation must be **schema-driven**, not blanket. A `u32`/`void *`/`struct *`/function-pointer field that's *known by the type definition* to be a pointer always gets resolved to a label reference. For `u32[]`/`u8[]` raw arrays where the type itself doesn't promise pointers, only resolve a 4-byte LE value to a label when (a) the position is 4-byte aligned within the chunk AND (b) the value is inside an active ROM range AND (c) it lands on a known symbol (or `Symbol + offset` where offset < that symbol's size) AND (d) the surrounding fields agree (consecutive u32 words all resolving cleanly to data labels is strong evidence; a single isolated hit is suspicious). When (d) is ambiguous, prefer leaving the value as a numeric literal and flag for review.

   When resolving:
     - Function pointers in Thumb code have the low bit set. Strip it for the lookup, emit as a bare function name (`FuncName`) in C — gcc handles Thumb interworking via the symbol type. Use `(void *)FuncName` if the field type is `void *`. In `.s`/`.S`, keep the `+ 1`: `.word FuncName + 1`.
     - Data pointers landing on a known symbol → emit `&Symbol` (or `Symbol` when the field type is already a pointer-to-array).
     - Pointers landing *inside* a symbol (`Symbol + N` with `N < sizeof(Symbol)`) → emit `&Symbol[N/sizeof(elem)]` or `(u8*)&Symbol + N`. Use nearest-preceding-symbol lookup against `fireemblem8.map`, bounded by the symbol's size from `nm --print-size`.
     - In-range but unmapped → flag for manual review; likely indicates a missing label or that the chunk straddles two real labels.
3. **Decode the dump bytes** with `scripts/dump_to_c.py` (input: bin path, label, type, size; output: a C declaration). The helper accepts a `--pointer-fields` flag (per-field mask) telling it which positions are pointers — *not* a blanket heuristic. For typed graphics/palette/TSA chunks, route through the existing safe-converters.

   **Source formats (committed) vs build artifacts (never committed):**

   | Asset | Commit as | Never commit | Reason |
   |---|---|---|---|
   | Palette | `.pal` (JASC text) | `.gbapal` | `.gbapal` is generated by `Makefile %.gbapal: %.pal` rule. |
   | Palette (when any color has bit 15 set) | `.agbpal` (binary) | `.gbapal` | `.pal` round-trip masks bit 15; `.agbpal` is incbinned raw. |
   | TSA | `.tsa` (uncompressed binary) | `.tsa.lz` | `Makefile %.lz: %` compresses at build time. Must decompress before commit. |
   | Image | `.png` (indexed) | `.4bpp`, `.4bpp.lz` | gbagfx + LZ generated at build. |
   | Generic compressed data | the decompressed form | `.lz` | Same rule — decompress first, let the build rule compress. |

   Verify that the existing build rule reconstitutes the compressed/generated output byte-identically by comparing the generated `.4bpp.lz` / `.gbapal` / `.tsa.lz` against the original chunk in `dump/` before deleting the dump file.
4. **Emit `src/data/<file>.c`** containing all the migrated decls, `#include`-ing the headers the types live in.
5. **Empty (or delete) `data/<file>.s`.** If a legitimate tail of data-section content remains (e.g. AnimScr decomp source), keep the file with just that content.
6. **Update `ldscript.txt`.** Default rewrite: `. = ALIGN(4); data/<file>.o(.data);` → `. = ALIGN(4); src/data/<file>.o(.rodata);`. But this is **conditional**: confirm by inspecting the original `.s` whether it was `.section .data` (so `.rodata` is wrong — the C file must use `CONST_DATA` / the `.data` attribute to preserve the linker bucket) or `.section .rodata`. Picking the wrong section silently changes which linker bucket the symbols land in, re-ordering the final ROM layout. If the file is split, keep both entries. For banim region (wave 4), update `linker_script_banim.txt` too.
7. **Preserve every non-global directive in the .s file.** Don't drop local labels, `.align`/`.balign`/`.p2align` directives, `.section` annotations, or inline comments. Unusual alignment may need `__attribute__((aligned(N)))` on the C side or a `.align` shim in a tiny remnant `.s`.
8. **Audit pointer literals.** `grep -E '0x0[89][0-9A-Fa-f]{6}|0x02[0-9A-Fa-f]{6}|0x03[0-9A-Fa-f]{6}' src/data/<file>.c` — any hit is a raw address that escaped pointer resolution.
9. **`make -j$(nproc) compare`.** Must end with `fireemblem8.gba: OK`. ROM-byte equality alone does NOT prove pointers were resolved correctly or that label addresses match — the audit + map check guard against silent failures.
10. **Compare label addresses in the linker map.** Save `fireemblem8.map` before the migration as `/tmp/pre.map`, rebuild, then verify every migrated label and the next symbol after the block have identical addresses pre/post. Compiler-inserted alignment padding shows up here, not in `make compare`.
11. If steps 9 or 10 fail, bisect by halving the migration scope and recheck.

### Wave ordering

| Wave | Target | Rationale |
|---|---|---|
| 1 | `data/data_B1FE7C.s` — 1 label, 42 KB unknown | Single-chunk file; validates the whole-file mechanic. |
| 2 | `data/const_data_DAEF0.s`, `const_data_1C0AFC.s`, `const_data_E162A.s`, `const_data_banimekrdk.s` | Few labels each, all `const_data_*`. |
| 3 | `data/data-ekrgauge.s` (12 labels), `data/data-banimmisc.s` | First multi-label whole-file migration. |
| 4 | `data/banim-efxlvupfx.s`, `data/banim-efxbattle.s`, `data/banim-ekrdragonfx.s`, `data/banim-ekrmainminifx.s` | Many typed labels (Pal/Img/Tsa) + AnimSprite structs; exercises both code paths. Updates `linker_script_banim.txt`. |
| 5 | `data/data_9A31F8.s` (24 incbins), `data/data_A195B0.s`, `data/data_A2EEF0.s`, `data/data_5AA96C.s`, `data/data_A21658.s`, `data/data_A01CC4.s`, `data/data_B12A60.s` | Large mixed files; do these once the mechanic is solid. |

After each wave, `bash scripts/calcrom.sh` should show "bytes of data in src" rising and "bytes of data in data" dropping by the migrated amount.

### Assembly fallback

When a chunk's structure resists clean C representation, disassemble to `.s`/`.S` and place it under `asm/` — **but pointer/label semantics still matter**. Replace every in-range `.word` with a label reference (`.word LabelName` / `.word FuncName + 1` for Thumb function pointers). The same audit step applies.

The choice between C-decl and assembly is per-chunk: prefer C when the type signature is clean; assembly when the data shape is irregular enough that C either misrepresents it or requires intrusive packing.

### Out of scope

- **`dump/data_fe6sio_B1A368.bin`** (~21.5 KB ARM Thumb code, mis-classified in the analysis report). Needs full function decomp into `src/fe6sio_*.c` — separate task. As a fallback, can be assembled-out to `asm/fe6sio.s` per the rule above.
- Any chunk whose type can't be confidently determined after reading callers *and* checking FEBuilderGBA — leave in `dump/` with a one-line rationale in the report.

## Critical files

- **`ldscript.txt`** — one-line-per-file edits per migrated `.s` (data .data section, line range ~937-980 for the bulk).
- **`linker_script_banim.txt`** — fine-grained banim placements; parallel edits for wave 4.
- **`include/efxbattle.h`** — declares many of the banim labels; types here are authoritative.
- **`reports/detailed_dump_analysis.md`** — checklist + deferral rationale.

### New tooling

- **`scripts/dump_to_c.py`** — input: `(bin path, label, type, size)`; output: a C declaration. Handle u8/u16/u32 arrays and a small library of known struct types.
- **`scripts/dump_to_s.py`** — parallel to `dump_to_c.py` for the assembly-fallback path. Output: `.byte`/`.short`/`.word` directives with pointer resolution. Shares the pointer-resolution helper with `dump_to_c.py`.

Shared pointer-resolution helper: scans `fireemblem8.map` once, builds an address→symbol map (ROM/EWRAM/IWRAM ranges), exposes one function `resolve(value: int, thumb_hint: bool) -> str | None` returning a label expression or `None`.

### Existing utilities to reuse

- `scripts/convert_gfx_safe.py` — Img_* → PNG.
- `scripts/convert_palettes_safe.py` — Pal_* → .pal (or .agbpal if bit 15 set). Never commit .gbapal.
- `scripts/extract_tsa9.py` — Tsa_* → .tsa (uncompressed). Never commit .tsa.lz.
- `tools/gbagfx/gbagfx` — format-conversion primitive.
- `scripts/calcrom.sh` — progress measurement.

### External reference

- `/home/laqieer/FEBuilderGBA/FEBuilderGBA.Core/` — for struct shapes; `*Form*.cs` / `*Core*.cs` have field-by-field readers.
- `/home/laqieer/FEBuilderGBA/FEBuilderGBA/ROMFE8U.cs` — central registry of pointer-table addresses; search both data's direct address and addresses of any pointer to it.

## Verification

Per wave:
- `make clean_fast && make -j$(nproc) compare` (from clean state) → `fireemblem8.gba: OK`.
- Pointer-literal audit grep → empty.
- Map-address diff: every migrated label and the next-block-boundary symbol have identical addresses pre/post.
- `bash scripts/calcrom.sh` → expected delta in src vs data byte counts.
- `git diff --stat` — only the targeted files changed.

Final state:
- `ls dump/ | wc -l` ≈ 18 (ARM code blob + truly-unknown chunks).
- `grep -c '"dump/' --include="*.s" -r .` matches that count.
- `reports/detailed_dump_analysis.md` lists each remaining file with a one-line rationale.

## Commit cadence

One commit per `.s` file migration. ~25 commits total. Each commit:
- Builds cleanly from `make clean_fast` (not just incremental).
- Names the file and labels migrated.
- Includes the new `src/data/<file>.c` (or `.s`), the matching linker-script edit, and any report update in the same commit so the tree is always consistent.
