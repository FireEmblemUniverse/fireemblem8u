# Decompilation completion work

Starting revision: `ecc6798b68fc7d0d164b2b6dd96a9fee4306cadb`
from `https://github.com/FireEmblemUniverse/fireemblem8u`.
Working branch: `decomp-completion`.

The active goal is complete decompilation of Sacred Stones. The initial matching
target is the USA ROM with SHA-1
`c25b145e37456171ada4b0d440bf88a19f4d509f`, as specified by upstream.
This work targets the original GBA executable; the native-engine feasibility
blueprint in the parent folder describes a separate project.

## Completion evidence

- Build and compare the entire ROM against the canonical input.
- Inventory executable regions, including inline assembly, startup, ARM routines,
  BIOS wrappers, audio library code, and embedded executable payloads.
- Replace outstanding recoverable compiled routines with matching C. Document
  any original assembly or hardware interfaces explicitly; do not silently count
  them as C or remove them from the denominator.
- Account for ROM-backed data separately from code. Data extraction alone is
  not function decompilation, and source-directory placement is not proof of C.
- Preserve reproducible verification for each change and the completed build.

## Initial source inventory

Run `python3 scripts/audit_decomp.py` for a JSON inventory with source locations.
At the starting revision it finds:

| Source marker | Count |
| --- | ---: |
| Tracked C files | 358 |
| Assembly entry markers | 73 |
| Naked-function markers | 2 |
| NONMATCHING preprocessor conditionals | 45 |
| Active direct baserom includes | 1,293 |
| Commented-out baserom includes | 4 |

These are lexical markers, not unique function counts or verified coverage.
The assembly markers include 19 in `asm/`, 20 BIOS wrappers and 34 audio entry
markers in `src/`. Startup and other unmarked executable code need inspection.
Conditional branches include matching register constraints and inline assembly
workarounds; each needs classification rather than being called an unmatched
function automatically.

The legacy `scripts/calcfunc.sh` reports 8,509 / 8,528 functions (99.777%). It
subtracts only `asm/` entry markers from a fixed total and misses naked functions
and assembly in `src/`. Its reported 46 unmatched functions is a grep count,
which also includes non-directive text. Neither number establishes completion.

## First targets

1. Establish a full byte-matching build after the user supplies `baserom.gba`.
2. Match `sub_8091F10` in `src/unitlistscreen.c`: an existing C candidate is
   behind `#if NONMATCHING`, with a naked assembly fallback.
3. Classify `MultiBootWaitCycles` in `src/sio_multiboot.c`: its PC-dependent
   cycle-counting assembly requires preserving hardware timing semantics.
4. Classify all remaining assembly and conditional markers, then build a
   byte-level executable coverage denominator from the linked image.
5. Audit the 1,293 active binary includes for data versus executable payloads.

## Local setup and verification (2026-09-09)

Installed the GNU ARM toolchain, built and installed `pret/agbcc` under `.deps/`,
and built the repository helper tools. Python has NumPy and Pillow available.
Homebrew also upgraded existing dependents during dependency installation.

Fixed the Darwin Makefile shell setting to use `/bin/bash` directly. PATH is
already exported by the Makefile; placing its unquoted contents inside the SHELL
command broke on local PATH entries containing spaces.

The first full build exposed three asset scripts that used `/bin/python3`, which
does not exist on this Mac. Updated `tsa_generator.py`, `tmap2tsa.py` and
`mar_to_map.py` to use `/usr/bin/env python3`.

The user supplied a ZIP containing the canonical 16 MiB ROM. Extracted it locally
to the ignored `baserom.gba` after validating its SHA-1. Ran `make -j8` through
compilation, asset conversion, battle-animation compression and linking:

```text
shasum -c checksum.sha1
fireemblem8.gba: OK
```

An independent Python byte comparison also confirmed all 16,777,216 bytes equal
the input ROM. The baseline ELF and map are retained under `.deps/baseline.*`.
No gameplay implementation has been changed.

The inventory script now evaluates include offsets and length expressions,
reports unresolved expressions instead of silently skipping them, and reports
the hashes of local ROM files when present. Its previous 1,297-include marker
count included four comments describing replaced binary includes; the corrected
count is 1,293 active directives. Their ranges cover 1,121,668 unique ROM bytes,
with no overlapping ranges and no unresolved expressions. These bytes have not
all been classified as code versus data. Verified range arithmetic against the
embedded payload span, plus overlapping-range and invalid-expression/bounds
checks.

## Unit-list transition matching experiment

`sub_8091F10` occupies `0x08091F10..0x080920C4` (436 bytes). The existing C
candidate compiled to 428 bytes. Local experiments under `.deps/unitlist-match/`
now include a 436-byte candidate (`z2.c`) with 16 differing bytes relative to the
checked-in assembly. Differences are register choices at function-relative
offsets `0x72..0x96` and `0x132..0x134`. The candidate uses an empty compiler
barrier after computing the leftward destination tile offset. It is **not** a
matching replacement and has not been applied to `src/`.

The experiment preserves the original object, generated assembly and
preprocessed C. `try.py` compiles candidates with the installed agbcc and
assembles the function in isolation. Isolated byte comparison is an intermediate
check only: external relocations must also match, and the final gate remains the
complete ROM hash. `variants6.py` reproduces `z2.c` from the recorded candidate.

## Embedded executable that must remain in scope

`data/data_fe6sio.s` contains an ARM bootstrap at `0x08B1A0B8`, including
`sio_polling` and `_reset`. The bootstrap decompresses the stream at ROM offset
`0xB1A368` to RAM address `0x02010000` and branches there. The stream occupies
`0x53CC` stored bytes and expands to `0x888C` (34,956) bytes. The expansion starts
with ARM mode/stack setup instructions. It contains code and may also contain
data; its full executable boundaries and functions have not been recovered.

The source comments describe this as an apparently unused FE6/FE7-era link
program. That is not a reason to count it as an ordinary asset or omit it from
the whole-ROM completion audit. The locally decoded file is ignored under
`.deps/fe6-link-payload.bin`; its SHA-256 is
`d3011f8a257e8000bb32612717f84e2389f5eb1897b70f27535910be22cf81d5`.
