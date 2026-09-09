# Decompilation completion work

Starting revision: `ecc6798b68fc7d0d164b2b6dd96a9fee4306cadb`
from `https://github.com/FireEmblemUniverse/fireemblem8u`.
Working branch: `decomp-completion`.

The active goal is complete decompilation of Sacred Stones. The initial matching
target is the USA ROM with SHA-1
`c25b145e37456171ada4b0d440bf88a19f4d509f`, as specified by upstream.
This immediate milestone targets the original GBA executable. The native-engine
feasibility blueprint in the parent folder describes the broader ROM-importing
LÖVE/Lua product direction; a matching GBA decompilation alone does not implement
that native engine or its mod platform.

## Current verified state

The combined checkout builds the exact 16,777,216-byte USA ROM. There are now
**zero direct baserom includes** in tracked source. Data recovery from the
`laqieer/fireemblem8u` fork has been integrated and verified, as detailed below.
This is not 100% C decompilation: `UnitList_PageChangeIn_Loop` (formerly
`sub_8091F10`) still uses its naked assembly fallback. ARM routines, BIOS/audio
interfaces, startup, timing assembly and the payload's assembly also remain in
the inventory. The whole-ROM executable classification is not yet complete.
`ClearOam` has now been replaced with matching ARM-mode C (92 bytes), with the
complete ROM comparison passing after integration.

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

### Source build recovered

The Japanese reference repository pointed to
[`StanHash/mgfembp`](https://github.com/StanHash/mgfembp), an existing
decompilation of this FE6 save-report multiboot program. The project is now a
submodule pinned to `c87e74dcd6c8878b809e013cd8ff0c52baa75332`. Its final-version
build reproduces all 34,956 decompressed bytes (SHA-1
`8a81a47d88f6b0a3f91c49784b9f7b317382abac`). Its own gbagfx with `-search 1`
reproduces all 21,452 stored bytes at `0xB1A368..0xB1F734`; the main project's
older gbagfx does not support the configurable search-distance option.

The main Makefile now builds and compresses that source instead of copying the
executable from baserom. The payload needs its own agbcc 010110-ThumbPatch variant
with `-fprologue-bugfix` and selected `-O0`/`-O1` translation units. Its pinned
installer fetches the `tpcs_frame` compiler branch; that compiler branch itself
is not pinned by the upstream installer. First-time setup needs network access.
The complete ROM checksum remains the final verification gate.

The linked payload separates `.text` (`0x02010000..0x02016FD8`), `.rodata`
(`0x02016FD8..0x02017CE8`) and `.data` (`0x02017CE8..0x0201888C`). It has 15 C
translation units plus startup, ARM routines, BIOS wrappers and interworking
veneers in assembly. These are now visible through `embedded_executables` in the
audit, including `.type ..., function` declarations that the original macro-only
scanner missed. This is a source-built executable, not a claim that its assembly
has become C or that the whole game is complete.

### Other verified progress

- Recovered `0x080DAF60` as `Tm_BanimMiniBlank`: 75 zero halfwords for a packed
  15-by-5 tilemap, followed by two alignment bytes. Its consumer passes those
  dimensions and a packed source stride to `EfxTmCpyExt`. Replaced the 152-byte
  baserom include with an explicit zero-fill and gave the declaration its size.
- These two changes reduce active direct includes to 1,291, covering 1,100,064
  unique ROM bytes. This is data/include accounting, not a C match percentage.
- Rebuilt the entire ROM successfully after both changes: `fireemblem8.gba: OK`.
  Also touched the payload's `src/report.c` without changing its contents and
  reran the top-level build: the child recompiled it, regenerated the compressed
  payload, and the full ROM still matched. This checks the recursive dependency
  path rather than only a build with pre-existing payload output.
- The unit-list experiment improved from 16 to 11 differing bytes (`l13` in
  `.deps/unitlist-match/`). The rightward destination's masked row is evaluated
  through an integer temporary and an empty `r1` clobber. It still does not match
  and has not replaced the assembly. The Japanese equivalent also remains naked
  assembly, so it did not supply a solved C implementation.

## Integration of recovered data sources

Merged [`laqieer/fireemblem8u` at
`7b47dec8da6ff7c2ff9aad2bfa9bf40cc8b07b90`](https://github.com/laqieer/fireemblem8u/tree/7b47dec8da6ff7c2ff9aad2bfa9bf40cc8b07b90).
Its branch shares ancestor `6ad3525d582564356d56b655ea7b77110d26745e` with our
starting checkout. The integration retains the subsequent upstream help-box,
map and class-reel work, plus our build fixes, source-built multiboot payload and
audit. Overlapping symbol renames were reconciled using the independently
matching ELF symbol addresses; the full ROM comparison verifies the result.

The imported work replaces raw ROM slices with C data definitions and standalone
graphics, palettes, maps, animation and audio inputs. It also brings their build
rules and tools, including configurable LZ match distance and the data
preprocessor. Battle-animation sources now live under `banim/`, so the audit
includes that directory. This adds 76 tracked C files, mostly data definitions;
it does not mean that 76 gameplay routines were newly decompiled.

Verification performed:

- Built the reference checkout from source with **no `baserom.gba` present**,
  using the existing macOS shell/shebang fixes and the ARM preprocessor for the
  multiboot sub-build. The resulting ROM passed the canonical SHA-1.
- Built the merged working tree, including newly generated animation assets,
  after resolving symbol/data-layout conflicts. The complete ROM passed.
- Temporarily moved our extracted input ROM aside, forced recompilation of
  `unitlistscreen.c`, `opinfo.c` and `const_data_DAEF0.c`, and rebuilt. The build
  succeeded without recreating `baserom.gba`, and `cmp` verified all output bytes
  against the saved input. The input ROM was then restored.
- Kept the blank miniature-battle tilemap as a sized 75-halfword C array; linker
  alignment supplies the final two padding bytes. Its name and consumer remain
  consistent with our earlier recovery.

Current lexical inventory (not a completion percentage):

| Main-project source marker | Count |
| --- | ---: |
| Tracked C files | 434 |
| Assembly entry macros | 73 |
| Inline assembly sites, including register annotations/empty constraints | 70 |
| Naked-function markers | 2 |
| NONMATCHING conditionals | 45 |
| Direct baserom includes | 0 |

The embedded project remains separately reported: 15 C files, 23 assembly
function declarations and one inline BIOS instruction site. Standalone binary
assets remain asset inputs; zero baserom includes does not prove that every
asset is editable or every executable instruction has a C representation.
The imported README's broad completion claims were replaced with this explicit
distinction. Legacy progress scripts still use directory-based proxies and are
not authoritative evidence for the active goal.

The new unit-list search ran 23,484 iterations from the 11-byte-difference
candidate without an improvement. That configuration has been stopped; the
matching replacement remains outstanding. The source is now named
`UnitList_PageChangeIn_Loop`, at the unchanged ROM address `0x08091F10`.

## Matching ARM C: ClearOam

`src/arm/clear_oam.c` now replaces the assembly at
`0x08000304..0x08000360`. The ARM agbcc compiler, an explicit `r2` register
variable, and disabled post-allocation instruction scheduling reproduce all
92 bytes. There is no instruction-bearing inline assembly in the new function.
The compiler's generic warning about debug information with an omitted frame
pointer is expected; this function does not change the stack pointer.

The linker places the C object between the first portion of `asm/arm.o` and its
new `.text.after_clear_oam` section. The copied block still starts at
`0x08000228` and ends at `0x08000A20`. `ClearOam` remains an ARM function at
`0x08000304`, size 92; the existing Thumb veneer still branches to it. The full
ROM checksum passed after this placement change.

The function writes the first word of each eight-byte OAM entry to 160, clearing
attributes 0 and 1 and placing the sprite below the visible screen. It preserves
attribute 2 and the affine-parameter halfword. The unrolled loop processes
16 entries per block and always executes once, including counts below 16.

The neighboring assembly comments also now describe the actual instructions:
`Checksum32` consumes halfwords rather than words, and `TmFillRect` uses
inclusive dimension counters (zero, zero writes one tile). These are behavioral
references only; those two assembly implementations have not been replaced.

With the new C file tracked, the main inventory has 435 C files, 72 assembly
entry macros and 71 inline-assembly sites. The extra inline site is the `r2`
register annotation. Both naked functions and all 45 NONMATCHING conditionals
remain. The unit-list compiler-variant experiment did not improve its existing
11-byte-difference candidate.
