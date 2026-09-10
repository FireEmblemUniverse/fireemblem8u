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

ColorFadeTick is now integrated as matching C, including its preceding literal
pool (220 bytes total); the source audit is down to 65 assembly entry markers.
MapFloodCoreStep is now matching C as well (224 bytes including its shared
pointer pool), and embedded ColorFadeTick is C in all three payload versions.
TmCopyRect is now matching C in the main and embedded builds too.
TmFillRect is also matching C in both builds.
DrawGlyph and its shift table are now matching C too.
DrawGlyphHalfStride is now matching C as well.
The current inventories are 60 main assembly entry markers and 17 embedded
assembly function declarations. The full ROM comparison passes. See the latest
sections for integration and toolchain verification.

The combined checkout builds the exact 16,777,216-byte USA ROM. There are now
**zero direct baserom includes** in tracked source. Data recovery from the
`laqieer/fireemblem8u` fork has been integrated and verified, as detailed below.
This is not 100% C decompilation: `UnitList_PageChangeIn_Loop` (formerly
`sub_8091F10`) still uses its naked assembly fallback.
`GetUnitDefinitionFormEventScr` now compiles to matching C across its complete
516-byte extent; its previously missed explicit naked fallback has been removed.
ARM routines, BIOS/audio
interfaces, startup, timing assembly and the payload's assembly also remain in
the inventory. The whole-ROM executable classification is not yet complete.
The linked mapping audit additionally identifies 200 bytes of ARM code in
the FE6 transfer wrapper's `.data` section, outside its compressed payload.
Those instructions have no entry macros and remain outstanding.
`ClearOam` has now been replaced with matching ARM-mode C (92 bytes), with the
complete ROM comparison passing after integration.
`Checksum32` is also matching ARM-mode C (72 bytes), with the same full-ROM gate
passing. These replacements retain the copied ARM block's original boundaries.
`TmApplyTsa` is now matching ARM-mode C as well (84 bytes), bringing these three
replacements to 248 bytes. The complete ROM still matches.
`MultiBootWaitCycles` now generates nine of its twelve Thumb instructions from
C; the PC read and two-instruction timing loop remain explicit assembly.
There is now one `NAKEDFUNC` macro and no explicit naked attributes. The
unit-list assembly body and residual timing assembly remain unfinished.
`RealClearChain` is now matching Thumb C (32 bytes), using empty register
constraints and no instruction-bearing assembly templates.
`ply_pend` is also matching Thumb C (20 bytes), restoring the command pointer
from the audio pattern stack.
`ply_fine` now compiles to matching C across its complete 46-byte extent,
using a pinned agbcc variant with a guarded equality-only bit-test pattern.
`clear_modM` is matching Thumb C (26 bytes), preserving the register contract
required by its assembly callers.

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

Lexical inventory at the data-integration checkpoint (not a completion percentage):

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

## Matching ARM C: Checksum32

`src/arm/checksum.c` replaces the 72 bytes at `0x08000360..0x080003A8`.
The function accumulates the sum and XOR of input halfwords, returning their
low 16-bit values in the low and high halves respectively. Its original
do/while behavior, including one read for sizes below two, is preserved.

This file uses GNU ARM GCC rather than legacy ARM agbcc. Inspection of agbcc's
`arm_expand_prologue` and `output_func_prologue` showed that it unconditionally
adds `lr` to a nonempty callee-save set. That prevents its normal prologue from
matching this routine's `push {r4, r5, r6, r7}`. GNU ARM GCC 16.2.0 produces the
matching leaf save/restore sequence. No compiler source or generated instructions
were patched.

The Makefile selects ARM7TDMI, APCS GNU calling conventions, GNU89 C, `-O1`, and
disables scheduling, automatic increment addressing and induction-variable
optimization for this file. The source's fixed registers and empty asm
constraints retain the original save set, operand order and mask construction.
Every instruction is emitted by the compiler; none of the asm templates contains
an instruction. Other GCC versions have not been verified, so the full ROM
comparison remains necessary when changing toolchains.

The linker places this C object after `ClearOam` and before the remaining
`.text.after_checksum32` assembly. Verification covered the full ROM, the
72-byte function, the unchanged `0x08000228..0x08000A20` copied block, and the
unchanged entry point of the following `TmFillRect` at `0x080003A8`.

The two C replacements now cover 164 bytes. The main project has 436 tracked C
files and 71 assembly entry macros. Inline-site counts include the new register
annotations and empty constraints; they are not counts of assembly instructions
or unmatched functions. The two naked routines, other ARM routines, startup,
BIOS/audio code and embedded assembly remain in scope.

## Matching ARM C: TmApplyTsa

`src/arm/tm_apply_tsa.c` replaces the 84 bytes at `0x0800043C..0x08000490`.
The first two TSA bytes contain width-minus-one and height-minus-one. The
routine reads the following halfwords sequentially, adds `tileref`, stores the
low halfword, and writes destination rows from bottom to top with a 32-tile row
stride. A zero header dimension still represents one tile or one row.

GNU ARM GCC 16.2.0 reproduces the routine with the same flags used for
`Checksum32`. Fixed registers and empty constraints prevent unwanted pointer
and loop transformations and preserve the original register lifetimes. Every
instruction is compiler-generated. The remaining assembly moves into
`.text.after_tm_apply_tsa`; the existing literal pool immediately after the C
routine still precedes `PutOamHi` at its original address.

Verification includes the entire ROM byte comparison, the function's address and
84-byte size, the adjacent entries, and the unchanged copied ARM block
`0x08000228..0x08000A20`. The main inventory now has 437 tracked C files, 70
assembly entry macros, and 100 inline sites (including register annotations and
empty constraints). The two naked functions and 45 NONMATCHING conditionals
remain. These counts are inventory markers, not a completion percentage.


## TmFillRect: isolated C candidate, still nonmatching

`research/arm/tm_fill_rect.c` recovers the inclusive rectangle-fill loop in C
and is deliberately excluded from the production build. GNU ARM GCC 16.2.0
with the modern ARM flags in the Makefile produces the correct 56-byte size
and 12 of the 14 original instruction words. The remaining differences are:

| ROM address | Original word and instruction | Candidate word and instruction |
| --- | --- | --- |
| `0x080003B0` | `e2426000`: `sub r6, r2, #0` | `e1a06002`: `mov r6, r2` |
| `0x080003B4` | `e2415000`: `sub r5, r1, #0` | `e1a05001`: `mov r5, r1` |

Neither instruction form sets flags, and both copy the same source register to
the same destination. Thus these differences concern instruction encoding;
the candidate is not a byte match and the original assembly remains active.
The comparison checked every four-byte word against ROM offsets
`0x3A8..0x3E0`; the production ROM also remains byte-identical to the baseline.

To reproduce the candidate without changing production objects:

```sh
arm-none-eabi-gcc -S -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu \
  -ffreestanding -fno-builtin -fomit-frame-pointer -fno-schedule-insns \
  -fno-schedule-insns2 -fno-auto-inc-dec -fno-ivopts \
  research/arm/tm_fill_rect.c -o .deps/arm-match/fill.s
arm-none-eabi-as -mcpu=arm7tdmi .deps/arm-match/fill.s -o .deps/arm-match/fill.o
arm-none-eabi-objcopy -O binary -j .text .deps/arm-match/fill.o .deps/arm-match/fill.bin
```

Further matching work must resolve compiler instruction selection for these
copies. Substituting hand-written instructions or rewriting emitted opcodes
would not establish that the routine is compiler-generated matching C.


## TmCopyRect: isolated C candidate, still nonmatching

`research/arm/tm_copy_rect.c` recovers the 92-byte rectangle-copy routine at
`0x080003E0..0x0800043C`. Both dimensions are signed counts: zero or negative
values return without touching tile data. Positive values copy halfwords
forward within each row, then advance both pointers to the next 64-byte row.
The stride calculation uses unsigned arithmetic to preserve ARM wrapping.

With GNU ARM GCC 16.2.0, the candidate matches 19 of 23 instruction words,
including every load, store, pointer update and loop instruction. The four
remaining differences are:

| ROM address | Original word | Candidate word | Difference |
| --- | --- | --- | --- |
| `0x080003E4` | `e1120002` | `e3520000` | `tst r2, r2` versus `cmp r2, #0` |
| `0x080003EC` | `4a000010` | `ba000010` | `bmi` versus `blt`, same target |
| `0x080003F0` | `e1130003` | `e3530000` | `tst r3, r3` versus `cmp r3, #0` |
| `0x080003F8` | `4a00000d` | `ba00000d` | `bmi` versus `blt`, same target |

The generated comparisons and branches make the same signed-dimension choices:
subtracting zero cannot overflow, so signed-less-than after CMP tests the same
sign bit as BMI after TST. This does not make the encodings match. The candidate
is excluded from the ROM build, and the production assembly remains unchanged.

Reproduce with the TmFillRect command above, substituting
`research/arm/tm_copy_rect.c` and `copy` output names, and adding
`-fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks` to GCC's flags.
The comparison covered all 23 words against ROM offsets `0x3E0..0x43C`.
Empty constraints retain separate dimension tests and the original register
lifetimes; they contain no instruction templates. The production ROM remained
byte-identical after this research checkpoint.


## MultiBootWaitCycles: matching partial C conversion

`src/sio_multiboot_wait.c` replaces the naked 24-byte implementation at
`0x0804E024..0x0804E03C` with a normal Thumb C function. Nine instructions
(18 bytes) are compiler-generated. The compiler selects the original decrement
according to the executing address's high byte: 12 in EWRAM (region 2), 13 in
ROM (region 8), and 4 elsewhere. Empty constraints preserve the constant loads.

Three instructions remain explicit assembly and are **not counted as C**:

- `mov r2, pc` reads the current execution region.
- `subs r0, r0, r1` and `bgt` form the calibrated countdown loop, preserving
  both timing and the original subtraction flags, including overflow behavior.

GNU ARM GCC 16.2.0 generates the normal leaf return without adding a stack frame.
The all-C countdown candidates tested with legacy agbcc, GNU ARM GCC, and Apple
Clang added a comparison or other instructions. Those candidates were not
integrated because the additional comparison changes the calibrated delay.
The production source uses only the original two loop instructions and declares
the condition-code clobber. This is partial decompilation, not a fully C match.

The original translation unit switches to `.text.after_multiboot_wait` where
the removed function stood. The linker inserts the new function before that
section, preserving `MultiBootWaitSendDone` at `0x0804E03C`. Its Thumb symbol is
`0x0804E03D`; `MultiBootWaitCycles` is `0x0804E025` with size 24. The isolated
candidate matched all 24 bytes, and the integrated build passed both the full
ROM checksum and a direct comparison of all 16,777,216 bytes.

The tracked inventory now contains 438 production C files, 70 assembly entry
macros, 106 inline sites, one naked function marker, 45 NONMATCHING conditionals,
and no direct baserom includes. Inline sites include register annotations,
empty constraints and section directives; they are not assembly instruction
counts. The remaining naked unit-list routine, other ARM functions, startup,
BIOS/audio code, this timing assembly and embedded assembly remain in scope.


## DisplayEventMapAnim: remove its last instruction template

The explicit `add r2, r0, #0` in `DisplayEventMapAnim` is now generated from a
C pointer copy constrained to register r2. An empty input constraint keeps the
copy alive. This removes one hand-written Thumb instruction (two bytes) from
the 336-byte function at `0x08085C7C..0x08085DCC`, without changing the generated
code. There is no instruction-bearing inline assembly left in that function.
The original agbcc build, complete ROM checksum and direct full-ROM byte
comparison all pass. No compiler flags or linker changes were required.

An independent trial replacing the constant-load template in `Event1B_TEXTSHOW`
with a C assignment and empty output constraint changed the switch branch
layout at `0x0800E422..0x0800E430`. Removing the constraint also changed code
size. Neither trial was retained; that instruction template remains outstanding.

## Audit correction: distinguish source annotations and naked attributes

The original `naked_function_markers` category only recognized the `NAKEDFUNC`
macro. `GetUnitDefinitionFormEventScr` in `src/eventscr.c` uses
`__attribute__((naked))` and was therefore absent from that category, though
its large inline template was included in the raw assembly-site inventory.
The new `naked_function_attributes` category finds it explicitly. Its linked
Thumb symbol is `0x0800F915`, size 516. Historical macro counts in this document
must not be interpreted as total counts of naked functions. The current source
contains two naked bodies: this event-unit selection routine and
`UnitList_PageChangeIn_Loop`.

`inline_assembly_classification` now reports the literal templates behind the
raw assembly-site markers. After the DisplayEventMapAnim conversion, all 107
main-project sites are classified:

| Source-site kind | Count |
| --- | ---: |
| Register bindings | 62 |
| Empty templates / compiler constraints | 35 |
| Section directive only | 1 |
| Instruction-bearing templates | 9 |
| Unresolved templates | 0 |

The nine instruction-bearing sites consist of two event-info NOPs, the event
text constant load, the event-unit selection body, the sleep BIOS call, the
audio BIOS call, the two multiboot hardware/timing templates, and the unit-list
body. The embedded payload separately retains its BIOS instruction template.
The 70 main assembly entry macros and embedded standalone assembly remain
outside these inline-template counts. There are 44 NONMATCHING conditionals.

This remains a source inventory: it does not evaluate preprocessor branches,
expand macros, parse all C syntax, or claim executable byte coverage. A single
template can contain many instructions. Unsupported literal syntax is reported
as unresolved rather than treated as empty. Seven regression tests cover
register bindings, empty templates, multiline adjacent literals, continued
strings, directives, unresolved macro templates, and comments/line offsets:
`python3 scripts/test_audit_decomp.py`. All pass. The final audit also verifies
both naked marker forms and the classification of every currently found site.


## Event-unit selection: validated isolated comparison

`scripts/match_unit_definition.py` now compares the existing C implementation
of `GetUnitDefinitionFormEventScr` without changing production sources or
objects. It first recompiles and isolates the original assembly fallback, links
it at `0x0800F914`, and requires all 516 bytes to match the canonical ROM. Only
then does it compile the C branch and report differences. Both the canonical
ROM hash and the current production ROM match are prerequisites.

The baseline test passes. The existing C candidate is also 516 bytes, with
93 differing bytes. Its broad instruction structure is close, but register
allocation differs: the existing C index commonly occupies r7 while the
original uses r3. Five fixed-index-register trials, six declaration-order
permutations, four plain register annotations, seven initial clobber trials,
and six explicit mask-constant register trials did not improve on the base
candidate. None was integrated. The fixed-r3 index trial produces 536 bytes and
382 differing shared bytes plus 20 excess bytes, demonstrating that pinning this one register alone
does not reproduce the original allocation across calls and copy loops.

A critical harness detail is preservation of Thumb call-target types. Absolute
linker-script assignments alone lost the function type and caused the linker
to create three interworking veneers and shift the isolated function. The
harness uses typed `.thumb_set` aliases for the verified Thumb function symbols
and refuses unexpected ARM call targets. Rebuilding the original fallback
exactly guards against scoring those harness artifacts as C differences.

Run `python3 scripts/match_unit_definition.py`; the default ignored output
folder is `.deps/unit-definition-match`, containing both assemblies, objects,
linked binaries, disassemblies and `report.json`. Use `--candidate-body FILE`
with a complete replacement C definition and `--output-dir DIRECTORY` to test
another candidate. Both the default candidate and fixed-r3 override paths were
executed successfully. A future zero-difference result still requires actual
production integration and the full-ROM comparison; this tool does not claim
completion from an isolated result.


## Event-unit selection: reduce the C candidate to ten differing bytes

The live NONMATCHING C branch in `src/eventscr.c` now adapts the scoped RNG
spill/reload constraints from
`https://github.com/laqieer/fireemblem8j/blob/e0f8f8ff4f95be147535b9fdd9ad15423c3f2c87/src/sub_800FAD0.c`.
This reference was already present in the local Japanese checkout. Its broader
JP-specific ABI changes and compiler changes were not imported. The USA
signature and surrounding C logic remain as before.

The change passes `arraySize` through a constrained r0 variable, retains the
remaining selection count in a word-sized spill across `NextRN_N`, and reloads
the loop index through an empty tied constraint. The compiler generates all
instructions in this candidate. The original assembly fallback remains active.

The verified isolated comparison improved from 93 to **10 differing bytes**,
with the exact 516-byte size and identical instruction/register sequence.
Every remaining difference is a stack-slot offset:

| Stored value | Original SP offset | Candidate SP offset |
| --- | ---: | ---: |
| Build-deployed flag byte in a word | `0x40` | `0x44` |
| Disable-REDA flag byte in a word | `0x44` | `0x48` |
| Shifted build-deployed flag | `0x48` | `0x4C` |
| Shifted disable-REDA flag | `0x4C` | `0x50` |
| Remaining random-selection count | `0x50` | `0x40` |

The ten differing bytes are at `0x0800F934`, `0x0800F93A`, `0x0800F9A0`,
`0x0800F9A4`, `0x0800F9A6`, `0x0800F9AA`, `0x0800F9B4`, `0x0800F9C4`,
`0x0800FACE`, and `0x0800FAF8`. The remaining work is to reproduce the stack
allocation order without replacing emitted instructions or changing behavior.

Earlier lifetime, compiler and empty-barrier trials did not beat the JP-derived
candidate. A local two-worker permuter search on the older base was explicitly
stopped after 7,306 iterations with no saved improvement; no search process
remains running. The best manual barrier trial had 72 differing bytes before
the reference adaptation reached ten. Flag-home and spill-constraint variants
also failed to beat ten and were not retained.

Validation: `make -j8` passed the entire ROM checksum, and
`python3 scripts/match_unit_definition.py` reproduced the original fallback
exactly before measuring the updated C candidate. There are still two naked
assembly bodies. The source inventory has 111 inline sites: 63 register
bindings, 38 empty templates, one section directive and nine instruction
bearing templates, with none unresolved. These counts include the inactive
C branch and do not imply that the 516-byte function has graduated to C.


## Matching C: GetUnitDefinitionFormEventScr

The complete 516-byte function at `0x0800F914..0x0800FB18` is now generated
from C by the normal project agbcc compiler. Its NONMATCHING conditional and
naked instruction template have been removed. This supersedes the candidate
checkpoints above; there are zero differing bytes in the integrated function.

The final source keeps the random-selection bit constant live across RNG calls
with an empty constraint. An explicit initial `if (i)` and subsequent countdown
loop retain the original entry test, while the constrained RNG argument uses
r0. The compiler now manages the loop-index spill itself, rather than the
previous candidate's explicit word-sized memory variable. An empty r2 clobber
before the percentage division preserves the remaining register lifetimes.
These constraints contain no instruction templates.

The final four stack-offset differences were resolved by declaring both flag
arguments as ABI words (`int`) and narrowing them to `s8` at the beginning of
the function. This preserves the original byte interpretation while reproducing
the compiler's stack allocation order. The public declaration in `event.h` now
states this signature. The existing caller passes a Boolean comparison and a
one-bit flag; its code remains byte-identical, as does the rest of the ROM.
No replacement opcodes, assembly rewriting, compiler patch or new compiler
flags were used. The earlier JP reference informed the RNG lifetime work; the
final USA source and its linked result were verified independently.

The function continues to select distinct summonable-unit indices, copy
unselected entries followed by selected entries, set each copied `sumFlag`,
terminate the output list, and apply the optional REDA/deployed-list operations.
This conversion preserves the existing routine's input assumptions; it does
not add bounds changes or alter the selection algorithm.

Verification:

- `make -j8` passes the full ROM checksum, and direct comparison confirms all
  16,777,216 bytes equal the canonical ROM.
- The linked Thumb symbol is `0x0800F915`, size 516. `Event2C_LoadUnits` remains
  at Thumb symbol `0x0800FB85`, size 268.
- The isolated matching harness now supports the graduated C source as its
  baseline. Both its default path and `--candidate-body` override path report
  516 bytes with zero differences.
- All seven source-audit regression tests pass. The current inventory has
  110 inline sites: 63 register bindings, 38 empty templates, one section
  directive, eight instruction-bearing templates and zero unresolved sites.
  There are 43 NONMATCHING conditionals, one naked macro, zero explicit naked
  attributes, 70 assembly entry macros and no direct baserom includes.

The remaining unit-list fallback, ARM routines, startup, BIOS/audio interfaces,
multiboot timing instructions and embedded assembly remain within the full
completion goal. These inventory counts do not establish a completion percent.


## Unit-list page entry: retain and verify the best C candidate

The NONMATCHING branch for `UnitList_PageChangeIn_Loop` now retains the best
previous isolated candidate, updated to current symbol names. It uses an empty
r1 clobber around the masked destination row in the forward page transition,
and an explicit destination offset with the same clobber in the reverse case.
The GNU statement-expression scopes around column calculations are retained;
removing or flattening them changes compiler allocation and instruction layout.
There are no instruction templates in this C candidate.

The original live source candidate compiled to 428 bytes instead of 436,
with 286 differing shared bytes. The retained candidate has the exact
436-byte extent `0x08091F10..0x080920C4` and **11 differing bytes**. The original
naked fallback is still active. Fresh register-binding, clobber-combination
and source-address-expression trials did not improve on eleven. The local JP
reference also still contains this routine as naked assembly, unlike the
resolved event-unit selection routine.

`scripts/match_unit_list.py` shares the baseline verification and typed Thumb
symbol handling from `scripts/match_unit_definition.py`. The shared module now
configures the source filename, declaration and conditional markers separately
from compilation/linking. It first reproduces the original 436-byte body
exactly, then scores the C branch. Both its default source and replacement-body
paths were exercised; the default ignored output folder is
`.deps/unit-list-match`. The event-unit selection harness was rerun after this
change and still reports its complete 516-byte match.

The remaining differences occur at `0x08091F82`, `0x08091F88`, `0x08091F8C`,
`0x08091F8E`, `0x08091F9C`, `0x08091F9E`, `0x08091FA1`, `0x08091FA2`,
`0x08091FA4`, `0x08092042`, and `0x08092044`. They are register choices in the
BG0 source/destination address calculations. The next matching work remains
focused on those calculations; changing generated instruction bytes directly
would not establish matching C.

Validation: the full ROM checksum and direct byte comparison pass with the
fallback active, both matching harnesses reproduce their production baselines,
and all seven audit regression tests pass. The tracked source now has 112 inline
sites: 63 register bindings, 40 empty templates, one section directive and eight
instruction-bearing templates, with none unresolved. The one naked unit-list
fallback and all other remaining assembly remain within the completion goal.


## Additional BG0 and event-text instruction-selection trials

The eleven-byte unit-list candidate was rechecked with seven masked-row
expression/type variants, nine shared-row lifetime/binding variants, and eleven
barrier-before-mask variants. None improved the retained candidate. Explicit
r3 bindings changed the surrounding address calculations rather than simply
swapping the two desired registers. The candidates remained isolated under
`.deps/unitlist-match`; production source was not changed.

The event-text constant-load trial was also revisited with four empty tied
constraints, including `"=r"`/`"=l"` outputs, an immediate `0x10` tied input,
and with/without an explicit condition-code clobber. The isolated original
`Event1B_TEXTSHOW` at `0x0800E3C8` was first verified against all 340 ROM bytes.
Every variant retained that size but still differed in the same 14 bytes of
switch-dispatch branch layout seen in the earlier assignment trial. Thus a
tied immediate alone does not resolve the compiler's branch-length decision.
The instruction template remains in production. These trials do not change
completion counts or establish a new matching conversion.


## Event text: remove the last instruction template with a compiler correction

`Event1B_TEXTSHOW` now generates its `0x10` constant load from C. The former
`asm("movs ...")` and its NONMATCHING conditional have been replaced with a C
assignment and an empty read/write constraint. The complete 340-byte function
at `0x0800E3C8..0x0800E51C` matches, including the original short switch-dispatch
branch. This removes one hand-written Thumb instruction, not 340 previously
unrecovered bytes.

The prior 14-byte mismatch was traced to agbcc's branch-distance estimator:
`gcc/final.c:asm_insn_count` initializes its instruction count to one even when
the template is empty. Thumb's default length is two bytes. Replacing the load
with C plus an empty constraint therefore introduced two nonexistent estimated
bytes and pushed a conditional branch across the compiler's expansion threshold.
Four tied-constraint alternatives showed the same behavior with the original
compiler. With the generic empty-template correction, all four reproduced the
original 340-byte function exactly.

`tools/agbcc-empty-asm/empty-asm-length.patch` returns zero only for an exactly
empty template. It contains no game addresses, symbols, register preferences
or opcode substitutions; nonempty-template estimation is unchanged. The build
script pins `pret/agbcc` revision `da598c1d918402c42c0c0d7128ba14567f3175e9`,
clones committed sources, applies the patch, verifies the exact patched-source
SHA-256, and retains the build log and provenance hashes in an ignored build directory. The upstream GPL license is
included. Clean builds run serially because upstream's generated-header
prerequisites are not safe under parallel Make. The compiler binary is ignored.

Only `src/eventscr.c` uses this compiler variant. Its source object depends on
the generated compiler, so a normal `make` builds it when required. The default
Make goal is explicitly `compare`, preserving the full-ROM gate despite the
new earlier compiler prerequisite rule. Both matching harnesses now select
the appropriate compiler for their translation unit. The original installed
agbcc and all other translation units retain their existing toolchains.

Validation includes an isolated trial, a clean pinned-source compiler build,
and a second build through the normal Make dependency path. The complete ROM
checksum and direct comparison of all 16,777,216 bytes pass. The linked event
text symbol is `0x0800E3C9`, size 340. The 516-byte event-unit selection C match
is preserved, and the unit-list candidate remains 436 bytes with eleven
mismatches. All seven audit regression tests pass.

The current source inventory has 112 inline sites: 63 register bindings,
41 empty templates, one section directive, seven instruction-bearing templates
and zero unresolved sites. There are 42 NONMATCHING conditionals, one naked
macro, zero explicit naked attributes, 70 assembly entry macros and no direct
baserom includes. The remaining unit-list body, ARM routines, startup,
BIOS/audio interfaces, timing loop and embedded assembly remain outstanding.


## Correct audio helper symbol extents

A linked-symbol review found that `src/m4a_1.s` used the checked helper's name
in the start/end markers around `ld_r3_tp_adr_i_unchecked`. The later end marker
therefore overwrote the earlier checked helper's size with 1,822 bytes. A second
`MPlayJumpTableCopy` end marker incorrectly included two neighboring helpers
and their literal pool. These were metadata errors, not additional recovered C.

The unchecked helper now has correctly named markers while retaining its local
binding. The two previously zero-sized local readers have explicit ends, and
the second jump-table-copy end marker is removed. Thirty-two consecutive duplicate
end markers were also removed; those duplicates were otherwise harmless.

| Symbol | Old size | Correct body size | Thumb address / binding |
| --- | ---: | ---: | --- |
| `MPlayJumpTableCopy` | 52 | 22 | `0x080CF959`, global |
| `ldrb_r3_r2` | 0 | 2 | `0x080CF971`, local |
| `chk_adr_r2` | 0 | 22 | `0x080CF973`, local |
| `ld_r3_tp_adr_i` | 1822 | 10 | `0x080CF98D`, global |
| `ld_r3_tp_adr_i_unchecked` | 0 | 10 | `0x080D00A1`, local |

The two-byte reader falls through into the address-check helper; its extent
covers its own body, not all code executed through that entry. The shared
literal pool remains separate. The source marker inventory still contains 70
assembly entries, but the two checked/unchecked entries now name distinct
functions. These remain assembly within the completion goal.

Verification assembled the previous source separately and compared its FUNC
symbol table with the new object. The symbol-name set, every address and every
binding were identical; only the five sizes above changed. `make -j8` passed
the complete ROM checksum and a direct full-ROM byte comparison also passed.
`python3 scripts/check_audio_symbols.py` now checks the five linked extents;
all seven existing audit regression tests also pass.

The corrected empty-template compiler was independently tested on the current
unit-list candidate during this review. Its assembly baseline still matches,
but the C candidate retains exactly eleven differing bytes. The unit-list
translation unit therefore continues using the original compiler.

## RealClearChain matching C

`src/m4a_clear_chain.c` replaces the complete 32-byte audio channel unlink
routine at `0x080CF908..0x080CF928`. It returns when the channel has no track,
otherwise reconnects its previous and next channels (or the track's head), then
clears its track pointer. PCM and CGB channels share the linkage offsets
`0x2C`, `0x30` and `0x34`; this translation unit disables strict aliasing to
support both layouts through the existing `void *` interface.

GNU ARM GCC 16.2.0 generates every instruction, including the original leaf
return. Three fixed register bindings and three empty constraints preserve
register allocation. The linker inserts this object between two audio assembly
sections. An explicit zero-filled alignment preserves the two original bytes
after `SoundMainBTM`; the linker default fill alone would differ there.

`make compare -j8` passes the canonical checksum, and direct comparison confirms
all 16,777,216 ROM bytes match. The five audio helper symbol checks and seven
audit regression tests pass. The tracked source inventory now contains 439 C
files, 69 assembly entry markers, and 118 inline sites: 66 register bindings,
44 empty templates, one directive and seven instruction-bearing templates.
The remaining naked unit-list body, ARM/audio routines, BIOS/startup interfaces,
timing assembly and embedded executable assembly remain within the active goal.

## ply_pend matching C

`src/m4a_pend.c` replaces all 20 bytes at `0x080CF9D4..0x080CF9E8`.
For a nonzero pattern level it decrements the level and restores the saved
command pointer; a zero level leaves the track unchanged. The routine uses
the same GNU ARM GCC flags as `RealClearChain`. Three register bindings and
four empty constraints preserve the original instructions without embedding
any instruction templates. Its linked Thumb symbol remains `0x080CF9D5`,
size 20; neighboring `ply_patt` and `ply_rept` retain their original positions.

The standalone generated function matches every original byte. After integration,
`make compare -j8`, direct comparison of the entire ROM, and the five audio
helper symbol checks pass. The source inventory now has 440 tracked C files,
68 assembly entry markers and 125 inline sites: 69 register bindings, 48 empty
templates, one directive and seven instruction-bearing templates. These are
source-marker counts, not a completion percentage; remaining assembly is still
outstanding.

## ply_fine candidate: two encoding mismatches

`research/audio/ply_fine.c` reconstructs the 46-byte channel-release handler.
An isolated link at its original address verifies every byte except the high
bytes of two register-copy instructions: original ADD-zero copies at
`0x080CF92A` and `0x080CF940` are MOVS copies in modern GCC output. The call
relocation to `RealClearChain` matches. Compilation and comparison details are
in `research/audio/README.md`. This is unfinished research, excluded from the
ROM build; `ply_fine` remains assembly and the completion inventory is unchanged.

## ply_fine matching C with guarded bit-test lowering

The earlier two-mismatch research candidate has graduated to `src/m4a_fine.c`.
All 46 bytes at `0x080CF928..0x080CF956` now match: it walks each channel,
marks active channels for release, calls `RealClearChain`, follows the retained
next pointer and clears the track flags. Its C source contains four register
bindings and five empty constraints, with no instruction-bearing template.

`tools/agbcc-tst/` reproducibly builds a separate pinned agbcc variant for this
translation unit. Its general Thumb AND condition-code pattern uses the existing
`next_insn_tests_no_inequality` guard. Equality comparisons can emit TST;
signed comparisons retain AND/CMP because their overflow-flag requirements
are different. The unsafe unrestricted experiment was not integrated. The
variant also includes the existing empty-template length fix. Source hashes
are verified after applying both patches, and six comparison checks run before
the built compiler is installed. Other translation units retain their compilers.

A fresh build from pinned committed compiler sources passed the six comparison
checks. `make compare -j8` and direct full-ROM comparison both pass, as do the
five audio symbol checks and seven audit tests. The inventory now has 441 C
files, 67 assembly entry markers and 134 inline sites: 73 register bindings,
53 empty templates, one directive and seven instruction-bearing templates.
The 42 NONMATCHING markers, one naked macro and remaining executable assembly
are still outstanding; this is not a completion-percentage claim.

## clear_modM matching C

`src/m4a_clear_mod.c` replaces all 26 bytes at `0x080D0084..0x080D009E`.
The helper clears the modulation amount and LFO counter, then marks pitch
(flags `0x0C`) or volume (flags `0x03`) for recalculation according to modulation
type. Its assembly callers keep the player pointer in r0, track pointer in r1
and return address in r12; the generated leaf changes only r2/r3 and flags,
exactly as the original body does. The two pointer parameters describe that
entry convention even though the player argument is unused.

The existing modern Thumb compiler configuration produces every instruction.
Two register bindings and six empty templates preserve instruction selection
and allocation. An empty r2 clobber in the zero-type branch prevents GCC from
using ADD instead of the original MOV for loading `0x0C`; it emits no code.
No instruction-bearing templates were added.

The isolated 26-byte function and complete integrated ROM compare exactly.
`make compare -j8`, direct comparison of all 16,777,216 bytes, and the five
audio helper symbol checks pass. The tracked inventory now has 442 C files,
66 assembly entry markers and 142 inline sites: 75 register bindings, 59 empty
templates, one directive and seven instruction-bearing templates. The remaining
assembly, naked unit-list routine and embedded executable are still in scope.

## Linked instruction mapping inventory

`python3 scripts/audit_linked_code.py` supplements the lexical source audit.
It reads ARM ELF `$a`, `$t` and `$d` mapping symbols, partitions each input
section using the linker map, and attributes the resulting regions to objects.
A mapping never propagates beyond its owning input section. ELF/map SHA-256
hashes identify the audited artifacts; the JSON includes every region and
per-object totals. Conflicting mappings and overlapping input contributions
fail rather than silently choosing an interpretation.

At the matching build following `46acd1d6`, it accounts for 14,202,427 bytes
in 1,215 contributing objects and 24,493 regions:

| Assembler classification | Bytes |
| --- | ---: |
| ARM instructions | 3,096 |
| Thumb instructions | 774,534 |
| Data mapping | 10,252,672 |
| Input-section bytes with no mapping | 3,172,125 |
| Bytes outside input sections, including linker fill | 2,574,789 |

No ROM mapping symbols lie outside the parsed input sections. These are not
C-completion percentages. Mapping symbols do not distinguish C from inline
assembly, identify executable content hidden in data, or expand compressed
payloads. The unmapped bytes and padding also remain unclassified. The embedded
`mgfembp` executable still requires its own expanded instruction inventory.

This audit identifies ARM instructions in `asm/fe6sio.o(.data)` that function
entry macro counts do not include: four bytes at `0x08B1A0B8..0x08B1A0BC`,
four at `0x08B1A178..0x08B1A17C`, and 192 at
`0x08B1A198..0x08B1A258`. Source inspection confirms the entry branches,
serial polling and reset/transfer logic. These 200 bytes are separate from
both the compressed payload and its recovered C sources. They remain part
of the complete decompilation objective regardless of the source comment
suggesting this wrapper may be unused.

Five regression checks cover wrapped map entries, section-boundary mapping
resets, ARM code inside `.data`, mapping-name suffixes and duplicates, and
conflicting/overlapping evidence. They pass. Direct comparison confirms the
production ROM remains byte-identical; this audit introduces no build changes.

## Expanded embedded executable instruction inventory

The linked audit now accepts an explicit image extent and recognizes custom
section names without a leading dot. Run the embedded audit as:

```sh
python3 scripts/audit_linked_code.py --elf mgfembp/mgfembp.elf --map mgfembp/mgfembp.map --start 0x02010000 --size 34956
```

The expanded binary remains 34,956 bytes, SHA-1
`8a81a47d88f6b0a3f91c49784b9f7b317382abac`. Its ELF mappings identify 1,108
ARM instruction bytes, 24,608 Thumb instruction bytes and 9,239 data bytes.
There are no unmapped input-section bytes and no orphan mapping symbols.
The one byte outside input sections is the linker-map fill at `0x02016FFB`.
This closes the expanded payload's mapping inventory, not its C decompilation.

The four handwritten assembly objects contain 1,178 instruction bytes:

| Embedded object | ARM bytes | Thumb bytes |
| --- | ---: | ---: |
| `src/crt0.o` | 328 | 0 |
| `src/armfunc.o` | 772 | 0 |
| `src/gbasvc.o` | 0 | 62 |
| `src/fake_glue.o` | 8 | 8 |

The runtime library contributions add 726 Thumb instruction bytes from libgcc
and 94 from libc's memcpy. These are explicitly attributed rather than silently
included in a C-completion percentage. Inline instructions inside C objects
still require the source audit and review. The `fake_glue` section initially
exposed a parser omission; custom-section support now accounts for both veneers.
A sixth regression check covers a RAM-loaded image with a non-dot section.

All six linked-audit checks pass. Re-running the main ROM audit preserves its
previous totals exactly, and direct comparison confirms the production ROM
is still byte-identical. No embedded submodule sources or pin were changed.

## Embedded ClearOam matching C

The payload submodule is now pinned to local commit
`bde751de0a5fed16c05bae2bfe6eaa2a3bea1331`. Its `src/clear_oam.c` replaces
all 92 bytes of the embedded ARM ClearOam routine, using the same recovered
loop as the main game with the payload's existing `void *, int` interface.
Casting count to unsigned before shifting preserves the original logical shift.
The routine retains the original at-least-one-block behavior and writes only
attributes 0/1 in each eight-byte OAM entry.

The payload uses its installed `agbcc_arm` with the verified matching ARM flags.
The linker places the new C object between split sections of `armfunc.o`.
All three payload versions (`mgfembp`, `mgfembp_20030206`, `mgfembp_20030219`)
pass their existing reference checksums. The full 16,777,216-byte Sacred Stones
ROM also passes checksum and direct comparison, preserving the compressed data.

The embedded source inventory is now 16 C files and 22 assembly function
declarations. Linked instruction attribution moves exactly 92 ARM bytes from
`armfunc.o` to `clear_oam.o`, leaving 680 ARM bytes in `armfunc.o`. No remaining
startup, BIOS, veneer, runtime-library or inline instructions are excluded.

The local submodule commit is not published upstream. A 1.4 KiB source-only
incremental Git bundle in `tools/mgfembp-source/` preserves the exact commit
and its objects against the previous upstream base. `restore.py` initializes
upstream sources, fetches the bundle when needed, and restores the parent's
indexed pin without overwriting local modifications. The build invokes it when
the payload Makefile is missing; README setup commands also use it. A fresh
upstream-only test clone was verified not to contain the new commit, then
successfully restored its exact hash and C source through this helper.

## Embedded TmApplyTsa matching C

The payload is now pinned to local commit
`f2af4b9471b86061597b235dc701991f18c5f018`. Its `src/tm_apply_tsa.c` replaces
all 84 bytes at `0x02010370..0x020103C4` with the main game's recovered tilemap
application loop. It reads width/height minus one, consumes tile halfwords in
order, and writes rows from bottom to top with the original 32-tile stride.
The adjacent literal used by PutOamHi remains in assembly after the C object.

The public payload interface still takes a 16-bit tile base. A word-sized r2
local with an empty read/write constraint preserves the original ADD operand
order; the first trial swapped its operands and failed the checksum despite
equivalent arithmetic. The final C emits every original instruction using the
same modern ARM GCC configuration already verified for the main game's routine.

All three payload reference checksums pass. The full Sacred Stones checksum
and direct 16,777,216-byte comparison also pass. The embedded inventory now has
17 C files and 21 assembly function declarations; the two recovered payload
helpers total 176 bytes. Remaining embedded assembly stays in scope.

The incremental source bundle was regenerated against the original upstream
base, including both local commits. An upstream-only clone verified to lack
the new commit successfully fetched the bundle and restored its exact source.
No upstream publication is required to reproduce this parent submodule pin.

## Embedded Checksum32 matching C

The payload is now pinned to local commit
`699d8f9289fc6ea8effedec1f154ed05250190e4`. Its `src/checksum.c` replaces
all 72 bytes at `0x02010294..0x020102DC`. The halfword sum forms the low half
of the return value and the halfword XOR forms the high half. The existing
`void const *, int` public interface is retained; an unsigned local preserves
word-sized subtraction and the original signed loop-exit test. As before,
the loop reads at least one halfword even when size is less than two.

The main game's recovered C generates the original payload instructions with
the same modern ARM GCC settings. Empty register constraints preserve the save
set, mask construction and result transfers; no instruction templates were
added. The linked symbol now correctly reports a 72-byte extent, replacing
an assembly definition which lacked its own size directive.

All three payload reference checksums pass, and full-ROM checksum plus direct
byte comparison pass. The source inventory has 18 C files and 20 assembly
function declarations. Three recovered embedded helpers now total 248 bytes;
the remaining payload assembly and library routines are still outstanding.
The source bundle includes the full local commit chain and was successfully
restored in another upstream-only clone that initially lacked this commit.

## ColorFadeTick C reconstruction and arithmetic checks

`research/arm/color_fade_tick.c` now reconstructs the complete palette update
algorithm in C, but is excluded from the ROM build. It visits all 32 palettes
and 16 colors per palette in descending order, skips zero-step palettes, stores
each updated component modulo 256, and packs the independently clamped RGB5
components. Crucially, the displayed channel is clamped from `old + step - 32`
before the stored byte wraps; clamping a reloaded byte would be incorrect.

`python3 research/arm/check_color_fade.py` strips only empty register constraints
and executes the same candidate C natively. A separate scalar reference checks
all 65,536 pairs of unsigned component byte and signed step, with distinct
channel values and a sentinel for unchanged palettes. The checks cover stored
component bytes and every packed palette entry, including zero-step preservation.
This verifies the reconstructed arithmetic against the reviewed algorithm;
it does not emulate the original ARM instructions or establish a binary match.

The initial GNU ARM GCC 16.2.0 candidate contains 204 instruction bytes followed
by a 12-byte literal pool (216-byte symbol extent), whereas the original routine
has 208 instruction bytes and its three literals precede the function. GCC also
hoists pointers/constants into extra registers, uses predicated clamps and
changes address calculations. These differences are unresolved and explicitly
remain outside the matching build.

Reproduce the initial compiler output from the repository root:

```sh
arm-none-eabi-gcc -S research/arm/color_fade_tick.c -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-auto-inc-dec -fno-ivopts -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -o .deps/color-fade-tick.s
```

The main game and embedded payload retain their original ColorFadeTick assembly.
Direct comparison confirms the production ROM still matches all original bytes.

## ColorFadeTick candidate: 42 of 52 instruction words match

The palette candidate now reproduces the original 208-byte instruction count,
register save set, loop structure, component accesses and color packing. Add
`-fno-move-loop-invariants -fno-tree-loop-im` to the preceding compile command.
Empty constraints retain pointer-calculation order and component values across
clamps; empty memory barriers keep the original explicit clamp branches instead
of ARM conditional MOVs. The same C arithmetic checker still passes all 65,536
component/step pairs and every palette entry.

An isolated link at `0x08000234`, resolving the three data symbols from the
current matching ELF, verifies 42 of the original 52 instruction words exactly.
The remaining ten instruction words are:

- Literal loads at `0x0800023C`, `0x08000250`, `0x080002E0`: GCC places its
  12-byte pool after the function rather than before it.
- Step test at `0x08000248`: CMP-zero instead of TST-self.
- Upper clamps at `0x08000284/288`, `0x080002A8/2AC`, `0x080002CC/2D0`:
  CMP-31/BLS instead of CMP-32/BLO.

The output section is therefore 220 bytes including its trailing literals.
Neither the extra pool nor the ten instruction mismatches are patched into
place: they remain unsolved compilation/layout work. The candidate is excluded
from the production ROM, whose direct full-byte comparison still passes.

## Palette fade original-instruction oracle

The palette checks now execute the canonical original ARM instructions as well
as native candidate C and the scalar reference. `color_fade_oracle.py` reads
the original three pool addresses directly from the SHA-1-verified USA ROM,
maps the relevant ROM/RAM and stack in Unicorn 2.1.4, and runs the original
208-byte function to a return sentinel with a bounded instruction count.
It varies all sixteen incoming NZCV flag combinations across the cases.

All 65,536 component-byte/signed-step pairs agree on component storage and
packed palette outputs. The oracle additionally verifies that writes stay
within the two output buffers and the 16-byte stack frame, that the input
step array is unchanged, and that r4-r12 and SP retain their entry values.
The compiled ARM candidate passes the same checks against original ROM outputs.
This is emulated instruction evidence for the exercised inputs, not a claim
that the candidate has become byte-matching or a hardware timing test.

`build_color_fade.py` now regenerates the isolated candidate and records its
compiler version/flags, source and binary hashes, size and differing instruction
words in `.deps/color-fade-match/report.json`. It resolves data addresses from
the canonical ROM's existing pool; it does not rewrite generated instructions
or relocate the candidate's pool into a matching position. The freshly built
candidate still has ten differing words and a 220-byte section.

Reproduce the complete check from the repository root:

```sh
python3 -m venv .deps/arm-oracle-venv
.deps/arm-oracle-venv/bin/python -m pip install -r research/arm/oracle-requirements.txt
python3 research/arm/build_color_fade.py
.deps/arm-oracle-venv/bin/python research/arm/check_color_fade.py --rom baserom.gba --arm-candidate .deps/color-fade-match/candidate.bin
```

Without `--rom`, the checker remains available without Unicorn for the native
C/scalar-reference checks. No production game source or ROM bytes changed.

## Palette zero-test and alternate compiler experiments

Two additional source-constraint trials did not improve the current ten-word
mismatch. Giving two output variables the same r5 binding was rejected by GNU
ARM GCC as invalid hard-register usage. A legal empty output/input constraint
using the same register was accepted, but the compiler simplified the self-AND
back to CMP-zero. Neither experiment is retained in the candidate.

The installed legacy `agbcc_arm` was also tested on preprocessed current source
with `-O2 -mthumb-interwork -fomit-frame-pointer -fno-schedule-insns2`.
It emits a 228-byte symbol, saves/restores LR in addition to r4-r7, moves the
palette decrement into r3, and splits the exit path around the literal pool.
It still emits CMP-zero and the CMP-31/BLS upper clamps. This alternate compiler
therefore does not resolve the missing encodings or backward literal references.

The modern candidate was restored and rebuilt through `build_color_fade.py`;
it remains 220 section bytes and ten differing original instruction words.
These results narrow the next work to compiler lowering/pool layout rather
than repeating either rejected overlapping-register constraints or this legacy
compiler configuration. The production source and matching ROM are unchanged.

## MapFloodCoreStep reconstruction and original-instruction checks

`research/arm/map_flood_step.c` reconstructs the complete helper in C but is
excluded from the matching build. Reviewing the instructions corrected two
errors in the old assembly-file pseudocode: an equal-cost path is rejected
(the comparison is `>=`, not `>`), and unit blocking compares the destination
unit ID against `state.unitId`, not against the `hasUnit` enable flag. Source
coordinates are unsigned byte loads despite the public node structure's s8
fields. The routine checks neither coordinate bounds nor queue capacity.

The helper computes terrain cost plus the source's existing cost without
truncating that sum, rejects paths that do not improve the destination, checks
unit bit 7 when enabled, and accepts costs equal to the movement budget. On
success it appends a four-byte node, advances the destination pointer and updates
the working map. The `maxMovementValue` byte is not consulted by this helper.

Using the existing Unicorn environment, run:

```sh
.deps/arm-oracle-venv/bin/python research/arm/check_map_flood_step.py
```

The script rebuilds and links the isolated C candidate using the canonical
ROM's five data-pointer literals, then executes both original and candidate
ARM code. Eighty cases cover all four direction offsets, source coordinates
16 and 129, equal costs, budget boundaries, opposite/same bit-7 unit groups,
disabled unit checks, empty destinations, zero cost and sums exceeding 255.
A connection value above 255 checks the original byte truncation. Each run
checks exact queue/state/map effects, allowed write ranges, preserved r4-r11
and SP, and a bounded return. All cases pass for both implementations.

The C candidate remains nonmatching: it has 244 instruction bytes plus a
20-byte pool. The original helper body is 204 bytes (`0x08000784..0x08000850`).
Its old 240-byte ELF size incorrectly included eight literal bytes, six ARM
dispatch branches and a four-byte dispatch pointer. The size marker now ends
at the actual return. Those following 36 bytes remain in place and accounted
for by the linked mapping audit; they were not deleted or excluded from scope.
The corrected pseudocode points to the maintained research C source.

`make compare -j8` and direct full-ROM comparison pass after the metadata-only
assembly edit. The linked helper symbol retains address `0x08000784` and now
reports size 204. Neither the candidate nor its expanded code is used in ROM.

## MapFloodCoreStep candidate: 43 of 51 instruction words match

The maintained C candidate now follows the original r0-r10 register allocation,
pointer loads, byte accesses, cost comparison, unit check and queue stores.
Explicit empty constraints preserve the intended lifetimes and reloads.
`-ffixed-r14` prevents allocating LR as a temporary, allowing GCC to retain
exactly the original seven-register save set. Moving the unit-mask constraint
before its branch removes an extra branch while preserving the original ANDS.

The candidate now contains 204 instruction bytes plus a trailing 20-byte pool,
224 section bytes total. The isolated linker/oracle script records compiler
flags/version, source/binary hashes and raw instruction differences in
`.deps/map-flood-match/report.json`. Forty-three of the original 51 instruction
words match exactly. Differences are the six forward-pool loads at
`0x08000788`, `0x080007A0`, `0x080007B0`, `0x080007B8`, `0x080007E8`,
`0x08000838`, and CMP-zero rather than TST-self at `0x080007E0/7F8`.

All 80 queue/state/map cases still pass against original ARM execution. The
write check is now tightened to the original 28-byte stack frame, and r12
preservation is checked in addition to r4-r11 and SP. Comparing return flags
exposes an additional material difference: eight unit-blocked cases differ in
carry only (NZCV XOR `0x20000000`) because CMP-zero changes carry where TST
preserves it. The script reports these differences rather than treating output
buffer agreement as complete CPU equivalence. They remain unresolved along
with literal placement and instruction matching.

The candidate stays outside the production build; the complete ROM still
compares byte-for-byte with the canonical input.

## Guarded modern ARM zero-test lowering

An optional research plugin now resolves the shared CMP-zero/TST-self issue
through GCC's RTL instruction recognizer. `research/arm/compiler/` contains
its source, local build/provenance helper and execution checks. It is not used
by the production Makefile. The pass accepts only immediate EQ/NE flag consumers
with a dead condition-code value, validates comparison/branch changes together,
and submits the ARM backend's self-AND CC_NZ pattern with its required scratch
clobber. It contains no game addresses, symbols or machine-byte templates.

The first recognition attempt omitted that clobber and was rejected by GCC;
inspection of an independently compiled bit-test probe established the proper
backend form. The successful pass emits TST through ordinary instruction
selection and updates branch condition-code metadata. Version checks prevent
loading it into a mismatched compiler, and TARGET_ARM excludes Thumb.

The plugin passes 2,016 baseline/plugin ARM execution probes: EQ/NE, four signed
comparisons and mixed flag use, nine signed-boundary values, and all sixteen
incoming NZCV combinations. Signed comparisons retain CMP, and Thumb assembly
is unchanged. The matching reports record compiler flags and plugin hashes.

With the plugin, MapFloodCoreStep matches 45 of 51 instruction words; only its
six literal loads differ. All 80 queue/map cases pass, with zero return-NZCV
differences, resolving the previously observed eight carry discrepancies.
ColorFadeTick matches 43 of 52 words; its three literal loads and six upper-clamp
comparison/branch words remain different. All 65,536 component/step pairs pass
against original ARM execution and the scalar reference. Literal pools still
follow the generated functions rather than occupying their original positions,
so neither candidate has been integrated. The production ROM remains exact.

## Palette upper-clamp instruction matching

The optional research plugin now includes a guarded unsigned-boundary rewrite:
LEU/GTU comparisons with a power-of-two-minus-one constant become LTU/GEU at
the next value. This preserves the predicate for every unsigned word value.
It requires the same immediate, dead flag consumer as the zero-test rule,
rejects signed/non-power-of-two/overflow boundaries, and validates both RTL
changes through GCC before applying them. No emitted instruction bytes are
patched, and no game symbol or address appears in the pass.

The plugin's probe suite now covers 27 functions, 21 boundary values, all 16
incoming NZCV combinations, and baseline/plugin builds: 18,144 ARM executions.
It checks zero tests, mixed flag use, boundaries from zero through unsigned
maximum, and signed/non-power-of-two exclusions. Eligible CMP-31 comparisons
become CMP-32, while excluded comparisons and Thumb output remain unchanged.
All checks pass.

ColorFadeTick now matches 49 of its original 52 instruction words. Only the
three literal loads differ; its save set, all six clamp instructions and every
other instruction match. All 65,536 component/step checks still pass against
original ARM execution. MapFloodCoreStep retains its 45-of-51 match (six literal
loads only), with all 80 effect checks and zero return-NZCV differences.

Both routines still have trailing candidate pools instead of the original
preceding/shared literal storage. They remain outside the production build
until that layout is exact. The main ROM remains byte-identical.

## Exact isolated palette pool and function

The optional modern ARM plugin now supports an explicit ordered manifest for a
single pointer-only prefix pool. It rewrites recognized pool-load RTL addresses,
validates the changes, emits named pointer data before the function, and removes
the original trailing pool. Duplicate/missing manifest entries, unsupported pool
sizes and leftover references fail compilation. The implementation contains no
game identifiers or opcodes; no instruction bytes are patched.

`build_color_fade.py --plugin .deps/arm-matching-plugin/zero_test.so --prefix-pool`
now reproduces all 220 bytes at `0x08000228..0x08000304`: all three pointers and
all 52 instruction words match. The isolated function passes all 65,536 palette
component/step cases against the ROM oracle. Ten independent relocated pool
executions in both symbol orders pass; four invalid manifests are rejected.
The existing 18,144 comparison-plugin probes still pass. `make compare -j8`
continues to verify the production ROM; the candidate is not integrated yet.

The user-facing standing tracker is now `PROGRESS.md`; its maintenance rule is
recorded in `AGENTS.md`. It separates full-ROM matching from C coverage and
records candidate progress without inventing an overall decompilation percentage.

The latest comparison invocation also exposed an existing bootstrap defect:
`mgfembp/tools/install_agbcc.sh` does not stop when its compiler build fails.
The compiler target ran because its Makefile prerequisite was newer; the host
compiler rejected part of that rebuild, but an existing executable satisfied
`test -x` and the existing ROM passed the checksum. This run is evidence of
current artifact matching, not successful fresh compiler reproduction. Repair
and independently verify this bootstrap before production plugin integration.

## Palette C integration and reproducible embedded bootstrap

ColorFadeTick is now production C in `src/arm/color_fade_tick.c`. The compiler
plugin and its checks moved to `tools/arm-matching/`; the Makefile builds it
from source and loads it only for this translation unit. GCC 16.2.0 is required.
The linker defines ARMCodeToCopy_Start before the generated prefix pool.
The removed assembly contributes 208 instruction bytes and 12 pointer bytes.
ColorFadeTick remains at `0x08000234` with size 208, and copied ARM block bounds
remain `0x08000228..0x08000A20`. The whole 16,777,216-byte ROM compares exactly.

The source inventory now contains 443 C files and 65 assembly entry markers.
Its 178 inline sites classify as 84 register bindings, 86 empty constraints,
one directive and seven instruction templates. The new palette file contains
no instruction-bearing assembly. Linked mappings attribute 208 ARM bytes and
12 data bytes to its C object. Total mapped ARM/Thumb bytes are unchanged;
12 formerly unclassified pool bytes now map explicitly as data.

The embedded compiler failure was caused by inheriting parallel make settings
with incomplete legacy generated-header dependencies. Its installer now pins
StanHash/agbcc `63b22f3eb8a8051af30bd80c4795b355e439e7ef`, forces serial builds,
uses strict shell error handling and cleanup, and stages a complete installation
before updating the destination. The main Makefile tracks the installer script
as the compiler prerequisite, using the restored payload Makefile only for
ordering. A fresh installation succeeded with inherited MAKEFLAGS=-j8, and fresh
object builds of all three payload variants passed their checksums. A failed
clone propagated its exact failure code without changing the installed compiler.
The payload change is committed as `2706396a56a77207d9adfb8e80e16e5e54038f73` and
included in the updated source bundle, verified in a base-only repository.

Compiler comparison probes (18,144) and relocated prefix-pool checks still pass.
The 65,536-pair palette oracle validation from the exact candidate is retained;
full-ROM equality verifies that the integrated body is those exact instructions.
The map flood helper and embedded palette implementation remain outstanding.

## Embedded palette and main map flood helper integrated

The embedded ColorFadeTick now comes from `mgfembp/src/color_fade_tick.c`, with
all 208 instructions bytes and 12 pointer bytes generated by the same compiler
plugin source as the main game. The submodule includes its own identical
compiler/build/check sources so it remains independently buildable. Its palette
symbol remains `0x02010168`, size 208; the copied block remains
`0x0201015C..0x02010474`. All three payload versions retain their reference
checksums. The change is bundled at child revision
`98a2b35ba35c89ce8618544f5e35d7579f538e12`.

The ordered prefix-pool option also makes the main MapFloodCoreStep section
exact: 20 data bytes followed by 204 instruction bytes at `0x08000770..850`.
All 80 execution cases pass with zero return-NZCV differences. Production C uses
the public movement-state structs, explicitly reading the signed coordinate and
enable fields as unsigned bytes to match ARM loads. It preserves strict cost
improvement, unit checks, the inclusive movement budget, queue advancement and
map updates. Empty constraints preserve its original register contract; there
are no instruction-bearing templates in the new C implementation.

The remaining MapFloodCore assembly needs one load from the moved shared pool.
A standard R_ARM_LDR_PC_G0 relocation to `MapFloodCoreStepPool + 4`, with ARM's
PC bias accounted for, reproduces that instruction exactly. The linker defines
the pool symbol before the C object's section. The preceding DecodeString symbol
now correctly ends at its return, size 140; its formerly included 20 pool bytes
belong to the new C object. No bytes were removed from the ROM.

The source audit reports 444 main C files, 64 assembly entry markers, and 233
inline sites: 106 register bindings, 119 empty constraints, one directive and
seven instruction templates. The embedded audit reports 19 C files and 19
assembly function declarations; its 69 inline sites are 22 bindings, 46 empty
constraints and one original BIOS instruction. Both linked mapping audits have
zero orphan mappings and unchanged total ARM/Thumb instruction byte counts.
The whole-ROM checksum passes after both integrations.

## Main and embedded TmCopyRect integrated

TmCopyRect is now matching C at `0x080003E0`, size 92. Its zero and negative
dimension checks required a guarded compiler transformation of CMP-zero with
EQ and LT consumers to TST with CC_NZ consumers. Both branches must target the
same label, the final CC use must be dead, and only input-only empty constraints
may intervene. All changes go through GCC recognition together. Register-number
lookup is used for the death note because equivalent CC RTL objects need not
share pointer identity. The final note is updated explicitly to the new mode.

The isolated checker reproduces all 23 original instruction words and passes
2,560 cases against original ARM and a sequential memory reference. Cases cover
INT_MIN/negative/zero dimensions, widths 1 through 33 at boundary values,
heights through four, disjoint and overlapping buffers in both directions,
every incoming NZCV, r0-r12 results, the original 16-byte stack save, and allowed
write ranges. The generic compiler suite now passes 18,816 baseline/plugin
executions; excluded signed/boundary cases and Thumb output remain unchanged.
Prefix-pool checks also pass after the extension.

The same C body and identical compiler sources are included in the payload.
All three payload checksums and the entire 16,777,216-byte ROM match after
integration. The copied ARM block boundaries are unchanged. Payload revision
`7def95f6a36c1fb0f5bc979633aa6e380ea86038` is included in the verified source
bundle. The source audit now reports 445 main C files, 63 assembly markers,
and 252 inline sites (112 bindings, 132 empty constraints, one directive,
seven instruction templates). The embedded audit reports 20 C files, 18
assembly declarations, and 88 inline sites (28 bindings, 59 empty constraints,
one original BIOS instruction). Linked mapping attributes 92 ARM bytes to the
new main C object with no orphan mappings. TmFillRect remains nonmatching at
two scalar-copy encodings and is the next tilemap target.

## Main and embedded TmFillRect integrated

TmFillRect now comes from C in both executables. Its 56-byte body remains at
`0x080003A8` in the main ROM and `0x020102DC` in the final embedded payload.
The copied ARM block boundaries remain unchanged, and all three payload
checksums plus the full 16,777,216-byte ROM compare exactly.

The last two differences were MOV scalar copies versus SUB-immediate-zero.
An explicit compiler option now changes eligible SI-mode register copies to
SUB-zero using GCC RTL recognition. Pointer-tagged registers, frame-related
instructions, and special registers are excluded. The resulting instruction
does not change flags. The option is enabled only for the fill translation
unit, and explicit Thumb requests are rejected. The compiler source contains
no game identifiers, addresses, or instruction-byte templates.

The generic encoding checks pass 384 scalar/pointer cases across all incoming
NZCV, including preserved r1-r12 and SP and unchanged pointer instructions.
The fill oracle passes 2,016 original/candidate cases with inclusive zero
counters, selected negative counter bit patterns, tile values with high bits,
row-stride boundary widths, all flags, all r0-r12 results and allowed writes.
These bounded cases exclude the impractically large 0x80000000 counter. The
complete 56-byte match independently proves original instruction encoding.
The 18,816 existing comparison-plugin probes and prefix-pool checks still pass.

The updated child source/plugin bundle points to
`8312955da4cc52db3f03283274b17509e0f32d1c`. The source audit reports 446 main C
files, 62 assembly entry markers, and 263 inline sites: 116 register bindings,
139 empty constraints, one directive and seven instruction templates. The
embedded audit reports 21 C files, 17 assembly declarations and 99 inline sites:
32 bindings, 66 empty constraints and one original BIOS instruction. The linked
mapping audit attributes 56 ARM bytes to the new C object with no orphan mappings.

## DrawGlyph and shift table integrated

DrawGlyph now comes from `src/arm/draw_glyph.c`. It reconstructs the 64-bit
multiply of each two-bit source row by the selected horizontal shift, three
pairs of conversion-table lookups, and OR writes into three destination tile
columns. All 188 instruction bytes at `0x08000564..0x08000620` match. The C
object also supplies the original eight-word shift table at `0x08000540` and
its pointer at `0x08000560`, accounting for another 36 data bytes.

At O1 the compiler retained an unnecessary r11 save/restore after wide multiply
temporaries were eliminated. A bounded compiler-flag experiment found that O2
removes that save and produces the complete original instruction sequence.
The existing prefix-pool option suffices; no new plugin transformation or
opcode patch was introduced. Section anchors are disabled for the production
translation unit to keep the pointer manifest bound to bitTable itself.

`check_draw_glyph.py` verifies the complete 192-byte pointer/function section
and passes 2,048 original/candidate execution cases. These cover all eight
horizontal shifts, zero/ones/alternating/random glyphs, arbitrary lookup and
background values, both halfword LUT alignments, source/destination overlap,
all incoming NZCV, all r0-r12 results, preserved registers/SP, the original
28-byte stack save, and allowed writes. Its independent pixel reference reads
halfwords: the original ARM word loads use a two-byte stride but discard their
upper halves. The C implementation deliberately reproduces those target-specific
loads with strict aliasing disabled; no portability claim is made for them.

The remaining DrawGlyphHalfStride assembly uses R_ARM_LDR_PC_G0 to read the
shared pool through DrawGlyphPointerPool, retaining its exact load encoding.
That variant draws eight rows and reads columns at +0x40/+0x80 while writing
at +0x20/+0x40; this asymmetry is now explicitly recorded for its reconstruction.
The main ROM still compares byte-for-byte and copied ARM block bounds remain
unchanged. The source audit reports 447 C files, 61 assembly entry markers,
and 312 inline sites: 128 register bindings, 176 empty constraints, one
directive and seven instruction templates. Linked mapping attributes 188 ARM
and 36 data bytes to the new C object with no orphan mappings. The embedded
payload is unchanged in this milestone.

## DrawGlyphHalfStride and shared compiler pool integrated

DrawGlyphHalfStride now compiles alongside DrawGlyph in `src/arm/draw_glyph.c`.
It retains all 188 instruction bytes at `0x08000620..0x080006DC`, with the
original eight-row count and asymmetric source/background column reads at
+0x40/+0x80 versus writes at +0x20/+0x40. The isolated checker reproduces the
entire 380-byte shared pointer/two-function region at `0x08000560..0x080006DC`.
Its 2,048 half-stride cases pass against original ARM and an independent pixel
reference, including overlap, arbitrary initial data, both LUT halfword
alignments, all shifts and flags, preserved registers/SP and allowed writes.

The optional compiler pool-sharing mode emits the first function's manifest
once and references its labels from later functions in the same output section.
It validates each function's pool and rejects section changes or an absent
manifest. It caches only label numbers across function compilation, avoiding
stale RTL pointers under GCC garbage collection. Thirty independent relocated
pool executions cover both symbol orders and two functions, with forced GCC
collection and explicit invalid-request checks. The existing 18,816 comparison
probes and 384 scalar-copy probes still pass. No instructions are patched.

The production translation unit preserves source order explicitly. The manual
half-stride pool relocation has been removed along with its assembly body.
Its old 196-byte symbol included the following eight Huffman pointer bytes;
the C symbol now correctly has size 188 and those pointers remain in the
assembly prefix for DecodeString. The complete ROM and all three payload
checksums pass. The embedded runtime is unchanged; synchronized compiler
support is bundled at child revision
`2b20a2d3ce3767ef1501db893ecf4c8dddb02358`.

The source audit still has 447 main C files and now 60 assembly entry markers.
The glyph C object accounts for both functions plus 36 data bytes. Remaining
instruction-bearing inline assembly and the embedded assembly inventory are
unchanged. String decoding is the next ARM target.

## DecodeString C reconstruction and execution oracle

`research/arm/decode_string.c` reconstructs the ARM Huffman decoder with its
original r0-r7 roles, least-significant-bit-first input consumption, internal
node halfword indices, signed leaf marker, one- or two-byte output, and the
single-byte zero terminator. A zero low byte in a two-byte leaf is emitted
without terminating. The routine assumes a valid internal root, bitstream,
and sufficient output capacity, as does the original.

The matching script compiles a 148-byte pointer/function section at
`0x080006DC..0x08000770`. Its two pointers and 31 of 35 instruction words match.
Remaining differences are MOV-zero versus SUB-self at `0x080006E8`, CMP/BGE
versus TST/BPL at `0x08000730/734`, and ANDS versus TST at `0x08000758`.
The candidate remains outside production. No plugin changes have been made
for these encodings yet.

`check_decode_string.py` generates four valid tree shapes, including skewed
paths, single-byte leaves, two-byte leaves and pairs with an embedded zero.
Ten message lengths per tree exercise empty output and byte-boundary crossings;
all sixteen incoming NZCV states give 640 cases. Original ARM, compiled C and
the independently encoded leaf sequence agree on full output plus untouched
sentinels, consumed input bytes, output cursor, r0-r12 results, preserved SP,
the original 16-byte save area and allowed writes. Return-NZCV differences are
zero in these cases, despite the differing internal tests. Source, compiler,
plugin and candidate provenance is recorded with the instruction differences
in ignored `.deps/decode-match/report.json`.

The production source inventory is unchanged: 60 main assembly entry markers
and 17 embedded assembly function declarations. Full-ROM matching remains
verified; decoder instruction matching is the next step.

## DecodeString reduced to one differing instruction

Two opt-in compiler encodings resolve three of the decoder's four differences.
Integer zero initialization can use a non-flag-setting SUB-self, and an immediate
LT/GE zero comparison with dead CC can use TST plus CC_NZ-mode MI/PL consumption.
Both go through GCC RTL recognition; neither contains game-specific symbols or
opcode templates. Pointer/frame/special-register cases are excluded from the
zero initializer, and both options reject Thumb requests. Defaults are unchanged.

The branch probes pass 18,816 executions with these options and another 18,816
with defaults. The expanded scalar/pointer/zero probes pass 864 cases across
all incoming NZCV, with preserved registers and unchanged pointer encodings.
The decoder still passes all 640 valid-tree cases with zero return-NZCV
differences. Its complete 148-byte section now differs only at `0x08000758`:
GCC emits ANDS r6,r6,#255 while the original uses TST r6,#255. Thus 34 of 35
instruction words match; the candidate remains excluded from production.
The next step is to resolve this dead mask result without changing observable
register behavior. Main and payload checksums continue to pass with the
synchronized compiler's default settings.


## DecodeString integrated as matching C

An empty read/write constraint on the leaf value before its final byte-mask
comparison makes GCC emit the original TST rather than destructive ANDS.
The source contains register bindings and empty constraints, with no
instruction-bearing inline assembly. No compiler rule changed for this step.
`src/arm/decode_string.c` now replaces the assembly decoder and its preceding
two-pointer pool, using the existing opt-in zero/sign encodings and prefix pool.
The research fixture carries the same constraint.

All 640 execution-oracle cases pass with zero return-NZCV differences. All
148 bytes match: eight pointer bytes followed by 35 ARM instruction words.
`make compare -j8` passes; DecodeString remains at `0x080006E4` with size 140,
and the copied ARM block remains `0x08000228..0x08000A20`. The linked audit
attributes 140 ARM and eight data bytes to `src/arm/decode_string.o`, with no
orphan mapping symbols.

The tracked source audit now reports 448 main C files, 59 assembly entry
markers and 388 inline sites: 149 register bindings, 231 empty templates, one
directive and seven instruction-bearing templates. Embedded inventory remains
17 assembly function declarations. These counts do not establish overall C
coverage. Remaining ARM work includes the shared PutOamHi/PutOamLo body and
MapFloodCore dispatcher; startup, audio, hardware interfaces, the unit-list
fallback and transfer code also remain in scope.


## PutOamHi initial matching C candidate

`research/arm/put_oam.c` reconstructs the high-entry object-list writer. It
preserves eight-byte output entries, six-byte input triples, the untouched
fourth output halfword, masked X/Y additions, attribute flag OR operations,
and unsigned 16-bit counts. The original count load zero-extends, so counts
with bit 15 set are not negative. Input readability and output capacity remain
caller obligations, including source/destination overlap effects.

`python3 research/arm/build_put_oam.py --plugin .deps/arm-matching-plugin/zero_test.so --prefix-pool`
compiles and links the candidate against the verified ROM pointer. The 160-byte
section has an exact four-byte pool and 37 of 39 matching instruction words.
Only `0x080004A4` (SUBS ip,r4,#0 versus TST r4,r4) and `0x080004AC` (BLT versus
BMI) differ. Empty constraints after intermediate sums preserve the original
r7 destinations throughout the loop. Compiler/source/plugin/output hashes and
raw differences are recorded in `.deps/put-oam-match/report.json`.

This is encoding evidence, not completed execution validation. The SUBS also
clobbers ip, so agreement with the original register contract is not yet proven.
PutOamLo's three instructions select its cursor and enter the high routine's
body after its prologue; preserving that shared layout remains necessary.
Both entries remain in production assembly. No production source changed.


## PutOamHi execution contract measured

`research/arm/check_put_oam.py --plugin .deps/arm-matching-plugin/zero_test.so`
(run with the ARM-oracle Python environment) rebuilds the candidate and runs
1,280 original/candidate cases: counts 0/1/2/7/32, four relative input/output
placements (-8/0/+2/+2048), four coordinate/attribute tuples, and all incoming
NZCV states. An independent sequential halfword reference checks complete
memory including sentinels and untouched fourth OAM halfwords. Cursor advances,
stack balance, r4-r11 preservation and write boundaries also pass. Overlapping
writes are reflected in subsequent source reads rather than snapshotting input.

The remaining SUBS instruction clobbers r12 in all 1,280 cases. Return flags
differ in 192 cases. These discrepancies are explicitly reported, not treated
as successful equivalence. The checker rejects differences in other registers;
its report records all mismatches alongside build provenance. Large counts,
the low entry and unusual aliasing with the global cursor are not yet covered.

Bounded source and optimization trials did not improve the 37/39 word match.
A memory clobber between the two entry branches forces CMP instead of SUBS,
but the existing conservative branch-pair rule deliberately excludes that
clobber; it therefore does not yet yield the required TST/BMI sequence. No
production or compiler source was changed in this checkpoint.


## PutOamHi high entry matches completely

The empty memory barrier between zero and sign branches prevents GCC's r12
copy. The compiler's paired-branch rule now recognizes this barrier only when
it is an input-only empty ASM_OPERANDS plus a sole MEM clobber. It does not
cross output operands, register/CC clobbers, nonempty templates, labels or calls.
The existing grouped RTL validation still applies to the test and both branches.

All 160 bytes of the isolated high entry now match the canonical ROM, including
the four-byte pointer pool and 39 instructions. All 1,280 execution cases pass
with zero register or return-flag mismatches. The expanded compiler suite runs
20,832 cases with defaults and another 20,832 with optional zero encodings;
new probes cover memory, register and flag barriers. Thumb output is unchanged.
The compiler source and probe updates are synchronized into the embedded source
bundle. Production object-list entries remain assembly pending preservation of
PutOamLo's shared-body entry; this milestone is an exact candidate, not yet an
integrated replacement.

The checker now requires full section, register and flag agreement. Main ROM
and all three embedded payload checksum gates pass with the updated compiler.


## PutOamHi shared body integrated

`src/arm/put_oam.c` replaces the main high-entry pointer pool and 156-byte
function. The legacy global cursor declaration is cast to the halfword view
used by this routine, under the existing no-strict-aliasing compiler setting.
The original PutOamLo assembly shim remains explicit unfinished work. Its branch
now targets linker symbol `PutOamSharedBody = PutOamHi + 8`, preserving the
entry after the high routine's push and cursor selection. No machine instruction
is emitted by the C constraints. Full-ROM comparison verifies the interior
entry address as well as the entire copied block.

The execution checker adds `--low`, executing the original low-entry shim into
the reconstructed body. Both high and low entries pass 1,280 cases each, with
full memory, cursor, register and return-NZCV agreement. `make compare -j8`
passes. The linked audit attributes 156 ARM bytes and four pointer bytes to
`src/arm/put_oam.o`, with no mappings outside input sections. The source audit
reports 449 main C files, 58 assembly entry markers and 421 inline sites;
there are still seven instruction-bearing inline templates. Embedded object-list
assembly is unchanged, and no overall C-coverage percentage is inferred.


## Embedded PutOamHi integrated across all payload variants

The embedded copy has the same 156-byte shared drawing body and preceding
four-byte pointer pool. `mgfembp/src/put_oam.c` now generates both using the
matching compiler settings. Its linker retains the interior entry at
`PutOamHi + 8`; the original PutOamLo assembly shim remains in the inventory.
The source change is committed at embedded revision `b602f3b` and preserved in
the parent source bundle, with the indexed gitlink selecting that revision.

All three payload checksum gates pass, and `make compare -j8` verifies the
complete main ROM after recompression. The final payload remains 34,956 bytes
with SHA-1 `8a81a47d88f6b0a3f91c49784b9f7b317382abac`. Its linked audit attributes
156 ARM bytes and four data bytes to `src/put_oam.o`, with no mappings outside
input sections. The embedded source inventory is now 22 C files, 16 assembly
function declarations and 132 inline sites: 40 register bindings, 91 empty
constraints and one original instruction-bearing BIOS template. Main inventory
remains 58 assembly entry markers. Low-entry shims in both scopes and the main
map flood dispatcher still require recovery.


## MapFloodCore dispatcher reconstruction

`research/arm/map_flood_core.c` recovers queue alternation and the original
ordered neighbor expansions for connection values 0, 1, 2, 3 and 5. Connection
4 terminates a frontier; an empty source frontier terminates the entire search.
Invalid connection bytes remain outside the caller contract, as the original
uses unchecked instruction dispatch. The candidate is excluded from production.

`research/arm/check_map_flood_core.py`, run with the ARM-oracle Python, compiles
and links the candidate independently and checks 128 original/candidate cases:
eight initial queues times all incoming NZCV combinations. A controlled helper
records source-node addresses and ordered (connection, dx, dy) calls and returns
without enqueuing. Empty queues and mixed connection sequences pass, along with
final queue pointers, the destination sentinel and r4-r11/SP preservation.
This does not verify the full helper, multiple expanding frontiers, arbitrary
memory writes or return-flag equivalence. The report records that limited scope.

The generated section is 438 bytes including its constants and dispatch table.
It uses a relative byte jump table, different argument setup and a separate
phase comparison. This is not a byte-matching replacement. Source and binary
hashes and compiler flags are in `.deps/map-flood-core-match/report.json`.
No production source or embedded revision changed in this research checkpoint.


## Dispatcher checked across expanding frontiers

The dispatcher oracle now models helpers that append finite amounts of work.
Five enqueue budgets (0/1/4/12/24) combine with eight initial queues and all
incoming NZCV states for 640 original/candidate cases. The model skips every
third attempted insertion and eventually exhausts its budget, creating repeated
queue alternation followed by an empty frontier. A separate sequential reference
computes call order and expected queue memory. The machine hook consumes actual
argument registers and actual source/destination pointers when appending nodes.

All cases pass: ordered helper calls, full IWRAM outside the original 16-byte
stack save area, write bounds, r4-r11/SP preservation and final NZCV. The helper
model deliberately changes r0-r3 and flags at every call, so the candidate cannot
rely on accidentally preserved argument values. Return-flag differences are zero
and now fail the checker if introduced. This remains dispatcher validation under
controlled helper behavior, not execution of the terrain/movement helper itself.
The 438-byte candidate and production ROM source are unchanged; instruction
selection and original jump-table layout remain the next matching work.


## Dispatcher argument setup recovered exactly

An always-inlined C helper binds connection/dx/dy to r0/r1/r2 and applies empty
read/write constraints in the original order. All sixteen calls now have the
original three argument instructions, including MOV-immediate instead of a
register copy when arguments happen to be equal. The checker locates BL targets
in both raw binaries and requires exact equality of all 48 preceding instruction
words, independent of their relocated addresses. Queue selection uses r0 and
node loads/updates use r6, matching the original register choices.

All 640 finite-enqueue execution cases continue to pass. The candidate remains
438 bytes including its different jump table and literals. Removing the phase
constraint was tested but produced an additional copy and a comparison of the
old phase, so the original candidate constraint is retained. Phase-test fusion,
unchecked instruction dispatch and shared/prefix literals remain unresolved;
this is still research and no production assembly has been removed.


## Dispatcher validated with the actual movement helper

`research/arm/check_map_flood_full.py` first rebuilds and checks the dispatcher,
then executes it with the original 204-byte ARM movement helper from the verified
ROM. Four bounded 9x9 terrain/unit layouts, five movement budgets, three
allegiance/check combinations and four incoming NZCV patterns give 240 cases.
An independent frontier reference computes expected movement costs, including
strict cost improvement and the original bit-7 allegiance blocking rule.

All final movement maps agree with the reference. Original and candidate also
agree on complete EWRAM, queue/state memory and return flags, with r4-r11/SP
preserved. This exercises actual helper calls and repeated expanding frontiers;
it does not establish behavior on all possible maps or replace byte matching.
The candidate remains 438 bytes and is excluded from production.

Thirteen bounded phase-test source/flag configurations were inspected. Removing
or making the phase constraint input-only gives a copy of the old phase followed
by EOR and CMP-one; ten individual optimization/target flag trials retained that
form. The existing read/write constraint gives EOR plus CMP-zero. None recovers
the required EORS directly, so no trial was promoted. Original instruction
dispatch and literal layout also remain unresolved. Production sources and the
last verified main/payload binaries are unchanged in this checkpoint.


## Unchecked computed-goto dispatcher alternative

`research/arm/map_flood_core_computed.c` expresses the six valid connections
with GNU C label addresses. `check_map_flood_core.py --computed` builds it into
its own `.deps/map-flood-core-computed-match` directory, preserving the primary
switch candidate and its reports. All 640 controlled-helper cases pass, including
queue memory, registers and return flags; all 48 argument-setup words still
match. Its section is 448 bytes including six address-table entries.

This removes the switch's extra range check, consistent with the original valid
connection-byte contract. It emits LDR-pc from an address table, however, while
the original computes an instruction-table address and uses BX. It therefore
remains an alternative compiler-input fixture, not an integrated replacement or
an improvement claimed as overall word coverage. Full terrain-helper checks
remain specific to the primary switch candidate.

Six additional compiler configurations were inspected: word relocations,
no shrink wrapping, Os, O2, AAPCS and disabled jump tables. The table-bearing
variants retain byte-offset tables; the optimized levels also merge original
case bodies. An explicit unreachable out-of-range source assertion likewise
retains the switch guard. The next compiler work must address instruction-table
lowering rather than assuming one of these flags selects it.


## Dispatcher phase test recovered with experimental RTL fusion

`research/arm/compiler/xor_flags.cc` recognizes an ARM word XOR, an exact empty
identity register constraint, and an EQ/NE zero-test branch with dead condition
flags. It validates a combined flag-setting XOR and the changed CC_NZ branch
through GCC's instruction recognizer, then removes the redundant comparison.
It rejects non-identity constraints, nonempty templates, other branch conditions,
special registers and frame instructions. The pass is experimental and is not
part of any production compiler invocation or embedded bundle.

Build with `python3 research/arm/compiler/build_xor_flags.py`, then run
`.deps/arm-oracle-venv/bin/python research/arm/check_map_flood_full.py --plugin .deps/flood-core-rtl/xor_flags.so`.
The builder records compiler/source/binary provenance. The dispatcher checker
also records the plugin hash. The candidate emits the original EORS r4,r4,#1
and no separate compare; its section shrinks from 438 to 434 bytes. All 48
argument-setup words still match. All 640 controlled-helper and 240 actual-helper
cases pass, including the existing register and return-flag checks.

Broader standalone compiler regression probes are still required before this
rule is eligible for production. The original jump-instruction table and shared
literal layout remain unresolved. The RTL inspection also confirms that the
computed-goto alternative currently reaches a memory-indirect jump pattern,
not the backend's branch-table form. Production sources remain unchanged.


## Standalone XOR-fusion regression probes

`research/arm/compiler/check_xor_flags.py --plugin .deps/flood-core-rtl/xor_flags.so`
(run in the ARM-oracle environment) compiles separate baseline/plugin probes and
runs 10,080 executions: 15 functions, 21 boundary input values, all 16 incoming
NZCV combinations and both builds. It verifies independent XOR results, EQ/NE
and signed branch decisions, return values, r4-r11 preservation and stack balance.
The supported EQ/NE masks 1 and 255 must emit EORS. Signed comparisons, barriers
with memory/CC clobbers and a nonempty identity assembly template must remain
assembly-identical to baseline. Thumb output must also remain byte-identical.
All checks pass.

GCC lowers XOR with 0x80000000 to ADD; those probes are explicitly excluded
from fusion and remain unchanged. Initial probe forms also revealed that GCC
can combine the zero comparison with a register copy. Such PARALLEL comparisons
are outside this pass's accepted plain-SET pattern; no rule was expanded to
consume them. The test's post-branch identity constraint and argument-free call
isolate the supported pattern while still checking the full XOR return value.
The experimental pass and game candidate are unchanged; production still does
not load this pass. Jump-table and literal matching remain outstanding.


## Experimental instruction-table lowering

Installed GCC headers and RTL dumps identify the switch as an ARM casesi
PARALLEL followed by an ADDR_DIFF_VEC. `research/arm/compiler/branch_tables.cc`
now recognizes that form and emits six ordinary ARM branch instructions through
GCC RTL, replacing the relative-offset data vector. The allocated table-base
register must be distinct from the index and marked dead at the original jump.
The original unsigned range check is retained; this prototype makes no unchecked
index assumption. Each emitted instruction must pass the ARM recognizer, or
compilation fails. No game addresses or opcode bytes are embedded in the pass.

Build with `python3 research/arm/compiler/build_branch_tables.py`; validate with
`.deps/arm-oracle-venv/bin/python research/arm/check_map_flood_full.py --plugin .deps/flood-core-rtl/branch_tables.so`.
All 640 controlled-helper and 240 actual-helper cases pass, and the 48 argument
setup words remain exact. The prototype section is 452 bytes. It still loads a
table pointer, keeps the range check, selects r3 and uses MOV-pc instead of the
original r0/PC-relative sequence and BX. It is not composed with XOR fusion yet,
and is not enabled in production. Broader compiler table/invalid-index probes
are still needed before considering promotion.

Attempting a plain SET from PC (both pc_rtx and hard register 15 forms) failed
ARM recognition; the pass instead retains the recognized literal load. Shifted
addition requires the canonical shifted operand first in RTL. These observations
narrow the remaining backend work without bypassing instruction recognition or
patching generated object bytes. The original table-layout problem is reduced
to address formation, scratch selection, guard policy and exact entry layout.


## Branch-table regression probes and composed passes

`research/arm/compiler/check_branch_tables.py --plugin .deps/flood-core-rtl/branch_tables.so`
passes 4,608 baseline/plugin executions: six switch functions, 24 indices and
all 16 incoming NZCV combinations in both builds. Tables have five, six or nine
slots, zero or seven as the lower bound, and a missing case. Inputs cover every
slot, holes, values outside both ends, and high unsigned values. Call selections,
r4-r11/SP preservation, emitted instruction-table form and unchanged Thumb
output are checked. The retained bounds check correctly routes invalid indices
to the default case.

Both dispatcher checkers now accept repeated `--plugin` options and record each
plugin's hash. Running the full-helper checker with XOR fusion and branch-table
lowering together passes all 640 controlled-helper and 240 actual-helper cases.
The composed candidate is 448 bytes, with EORS and an instruction table together;
all 48 argument-setup words remain exact. This still is not ROM integration.

Using GCC's `gen_indirect_jump` generator and separately testing ARM interworking
still emits MOV-pc for this target, not the desired BX. The generator is retained
as the backend interface; the unhelpful interworking flag is not retained. The
remaining work includes PC-relative address formation, scratch register choice,
removing the extra guard under an explicit valid-index contract, exact table
entry placement and shared literals. Production source and compiler settings
remain unchanged.


## Isolated GCC backend build for missing ARM operations

The pinned [GCC 16.2.0 ARM machine description](https://raw.githubusercontent.com/gcc-mirror/gcc/releases/gcc-16.2.0/gcc/config/arm/arm.md)
explicitly emits MOV-pc for the ordinary ARM indirect-jump pattern. This explains
why the interworking flag and generic jump generator did not select BX. Plain
PC reads also failed the installed instruction recognizer in the earlier probe.

`research/arm/compiler/matching.md` adds two explicit late RTL operations:
a volatile instruction-position-dependent ARM PC read and an ARMv4T BX jump.
Normal C expansion does not select these patterns. The extension contains no
game symbols or addresses and leaves existing target patterns unchanged.
`build_backend.py` appends its include to the pinned backend and builds an
isolated C-only cross compiler under `.deps/gcc16-matching`, using four build
jobs, no multilib and no debug information. The system compiler is not replaced.

The GNU source archive SHA-256 is
`e6738e29597f733270731aa90600f37ffdc045079dfc27ec7e8192cc81085c3e`, verified against
the installed Homebrew formula. The unmodified ARM machine description is also
hash-checked before extension. Source URL, extension hash, configure arguments
and resulting cc1 hash will be recorded on successful completion. The initial
build has started; compilation and instruction/probe validation are not yet
complete. No claim of working matching-backend output is made at this checkpoint.


## Matching backend built and PC-relative dispatcher validated

The isolated GCC build and local installation completed successfully. Both
experimental plugins were rebuilt against its installed plugin headers into
`.deps/flood-core-new-backend`; plugins from the system compiler are not reused.
Plugin builders and checkers now accept an explicit compiler path, and the table
pass exposes an opt-in `pc-relative` mode requiring the new backend patterns.
The stock-backend build rejects that option; the new mode also rejects Thumb.

The generated sequence is MOV r3,pc; ADD r3,r3,#8; ADD r3,r3,r6,LSL#2; BX r3.
It computes the address of the following branch-instruction table without a
literal load. Every instruction passes the backend recognizer. The old literal
entry remains unused and will need layout work. The original uses r0, lacks the
extra range check and has different table/fallthrough placement, so this is not
a matching ROM replacement yet. The complete candidate section is 452 bytes.

The two-pass PC-relative candidate passes all 640 controlled-helper and 240
actual-helper dispatcher cases. On the new compiler, 4,608 standalone table
executions and 10,080 XOR executions pass. Table probes additionally require
PC reads and BX instructions in each generated function. Thumb remains unchanged
when the mode is not requested and explicitly fails when it is requested.

Reproduction uses the installed compiler at
`.deps/gcc16-matching/install/bin/arm-none-eabi-gcc`. Pass that path with
`--compiler` to both plugin builders, using `--output-dir .deps/flood-core-new-backend`.
Then run the full-helper checker with that compiler, both rebuilt `--plugin`
paths and `--pc-relative`. Build provenance is recorded in the isolated backend's
`build-info.json` and the plugin output directory's build reports. Production
compiler settings, main assembly and embedded sources remain unchanged.


## Dispatcher r0 selection, unchecked contract and final table fallthrough

Reserving r1/r2/r3 from general allocation makes the dispatcher table address
use r0. The existing explicit C argument bindings still supply r1/r2 to each
helper call; all 48 argument-setup words and all 880 dispatcher cases pass.

The table pass registers a function-only `matching_unchecked_switch` attribute.
The primary fixture requests it only under `MATCH_UNCHECKED_DISPATCH`, documenting
its valid 0..5 queue-connection contract. The checker enables this with
`--unchecked` and treats missing/ignored attributes as errors. Only attributed
functions omit the unsigned bounds check; unannotated switches retain it.
The standalone table checker adds 1,280 valid-index baseline/plugin cases for
this contract, including holes and shifted ranges. Existing 4,608 checked cases
continue to pass. Out-of-range execution is deliberately not claimed for the
unchecked contract. Matching table options reject Thumb compilation.

When the last vector target is the label immediately following the table, the
pass omits the redundant final branch. The sixth dispatcher entry therefore
falls directly into initial expansion after five explicit branch instructions.
An empty phase constraint preserves the frontier-loop trampoline, but GCC places
it before the common queue update and adds a branch around it. The candidate
section is currently 448 bytes; moving this trampoline and recovering the shared
and preceding literals remain. All 640 controlled-helper and 240 actual-helper
cases pass with r0, the explicit contract and table fallthrough together.
Production source remains unchanged.


## Dispatcher loop trampoline matched: five literal loads remain

The optional `sink-trampolines` compiler rule recognizes a jump around a
jump-only block, followed by a common block with an unconditional terminator.
It moves the jump-only block after that terminator and removes the jump around
it. It retains label identities and only crosses the recognized structure;
nonempty code in the trampoline or intermediate labels/calls in the following
block prevent this transformation. The empty phase constraint keeps the original
loop trampoline represented in C. No original machine bytes are patched.

With `--sink-trampolines` added to the existing new-compiler/PC-relative/unchecked
checker command, all 640 controlled-helper and 240 actual-helper cases pass.
The section shrinks to 444 bytes: 428 instruction bytes and 16 trailing literals.
Relinking the same compiler object at `0x08000874` gives 102/107 matching
instruction words. The only differences are literal loads at `0x0800087C`,
`0x08000888`, `0x08000890`, `0x0800089C` and `0x080008A4`. All branch offsets,
helper calls, loop instructions and return instructions now match at that address.

The dispatcher checker now records this raw comparison separately from execution
at its isolated address, including the extra candidate section bytes. The five
loads still reference a trailing pool instead of the original preceding/shared
pool, so the candidate remains outside production. Dedicated broader trampoline
layout probes remain desirable before promoting the experimental compiler rule.


## Shared-state literal load matched

The isolated backend now includes `match_arm_literal`, a memory-load pattern
using an explicit ARM PC-relative linker relocation. A plain external literal
label failed assembler fixup, so the pattern emits the relocation directly
without modifying object bytes. The table pass's `shared-literal` manifest
specifies a source pointer symbol, an external pool symbol and an aligned byte
offset. It requires one simple word pool and at least one recognized load,
rejects malformed manifests, and validates replacement RTL as a group. Stock
backends without this pattern reject the option; matching options reject Thumb.

The checker option `--shared-literal` selects
`gMovMapFillState,MapFloodCoreStepPool,4`. Isolated execution supplies the same
state pointer in a nearby shadow pool; original-address linking resolves the
symbol to the original helper pool at `0x08000770`. The load at `0x0800087C`
now matches exactly. The dispatcher therefore matches 103/107 instruction words;
only four loads of the two queue-pool pointers differ. All 640 controlled-helper
and 240 actual-helper cases pass. The candidate still carries its obsolete
trailing pool and is not integrated.

`research/arm/compiler/check_shared_literal.py`, using the isolated compiler
and rebuilt branch-table plugin, passes 384 baseline/shared comparisons across
forward/backward pools, three word offsets, four array indices and all incoming
NZCV states. Return values and r0-r12/flag results agree. Six deliberately
out-of-range links are rejected by the ARM relocation check. The rebuilt backend
and plugins have refreshed provenance reports; production remains unchanged.


### Complete dispatcher candidate section — September 9, 2026

Against baseline `a76c7ece`, repeated shared-literal manifests resolve both queue
pointers and the state pointer to their original pools. The branch-table pass
now emits a prefix containing the requested pointer symbols, branches to the
compiler's own switch targets, and the table address. It rejects surviving
references before deleting the obsolete trailing pool. No ROM instructions or
object bytes are copied into the candidate.

The checker options `--shared-queue-literals --prefix-table`, together with the
existing custom compiler, XOR/table plugins, PC-relative switch, unchecked
contract, trampoline sinking and shared-state mapping, produce an exact
464-byte section at `0x08000850..0x08000A20`: 36 prefix bytes plus 428 function
bytes. The report records `complete_section_match: true`, zero differing
instruction words, and all 48 argument-setup words exact. All 640 controlled
helper and 240 actual-helper cases pass. This is an isolated candidate; the
production compiler/build is unchanged. Broader prefix-emitter regression checks
and production integration remain next.


The dedicated `check_prefix_tables.py` suite now passes 2,560 executions: three
functions with five, six and nine cases, both pointer orders, two load addresses,
all incoming NZCV patterns, and ordinary versus redirected prefix-table entry.
The redirected runs preserve each function's prologue and redirect its computed
jump through the duplicated prefix table, checking every branch target, result,
stack and preserved register. All functions compile together under forced GCC
garbage collection, exercising repeated prefix emission and shared manifests.
Six invalid configurations are rejected, including an unconverted trailing
literal and Thumb mode. Prefix-only Thumb options now explicitly reject rather
than silently skipping the transformation. The dispatcher was rebuilt with this
plugin: all 464 bytes remain exact and all 880 execution cases pass.


### Production map-flood dispatcher integration — September 9, 2026

`src/arm/map_flood_core.c` now uses the public `MovMapFillState` and
`MovMapFillStateExt` structures. The linker places its compiler-generated
prefix and function at `0x08000850..0x08000A20`; the former assembly dispatcher
and duplicate prefix were removed. `ARMCodeToCopy_End` is now defined by the
linker after the C object, preserving the copied ARM block's original endpoint.

The pinned backend extension and XOR/branch-table passes moved to
`tools/arm-dispatch/`. Make builds the isolated compiler and its compatible
plugins as dependencies of this single object. It supplies the verified options
and shared pointer symbols explicitly. Source checksum validation, isolated
installation and build provenance are retained; other compiler paths are unchanged.
The standalone research source remains an oracle fixture.

`make compare -j8` passes: all 16,777,216 ROM bytes match SHA-1
`c25b145e37456171ada4b0d440bf88a19f4d509f`. The linked audit classifies the new
object as 452 ARM instruction bytes (428 body + 24 prefix branch bytes) and
12 pointer bytes. The source audit reports 450 main C files, 57 assembly entry
markers, one naked-function marker and seven instruction-bearing inline
assembly templates. The embedded payload remains at 16 assembly declarations.
Overall C coverage is still unproven; startup/BIOS interfaces, ARM shims, audio,
unit-list fallback and the 200-byte transfer wrapper remain in scope.


### Internal audio byte reader integration — September 9, 2026

`src/m4a_read_command.c` replaces `ld_r3_tp_adr_i_unchecked` with all ten
Thumb bytes exact at `0x080D00A0..0x080D00AA`. It preserves the audio engine's
private convention: r0/r1 and r4-r12 are unchanged, r2 holds the old command
pointer, and r3 returns the unsigned byte. The stream pointer is incremented
and stored before the byte is read, including when the stream aliases the
pointer field itself. Empty register constraints preserve this allocation;
the source contains no instruction templates. The linker retains the original
four-byte entry alignment. Existing assembly callers resolve the C symbol.

`research/audio/check_read_command.py` passes 32,768 original/production
execution cases across byte values, all NZCV inputs, four stream alignments
and four command-pointer-field aliases, checking complete test memory and
register/flag agreement. `make compare -j8` passes the full ROM SHA-1.
The linked audit assigns ten Thumb instruction bytes to the new object, with
no orphan mapping symbols. The main inventory is 451 C files and 56 assembly
entry markers; the naked fallback and seven inline instruction templates remain.


### TrackStop candidate — September 9, 2026

`research/audio/track_stop.c` reconstructs active-track channel detachment.
Inactive tracks remain unchanged. Active tracks walk the channel list, invoke
the CGB shutdown callback for live channels whose low three type bits are
nonzero, clear live status, detach every channel from its track, and finally
clear the track's head. The existing `call_r3` bridge remains an assembly
interface; the candidate supplies its callback through r3 with empty constraints.

`check_track_stop.py` builds with the existing equality-bit-test agbcc backend
and checks 768 original/C executions: six track-flag values, eight channel-list
layouts and all incoming NZCV patterns. The callback records type/channel/status/
owner before detachment and clobbers r0-r3 and flags. An independent model checks
complete test memory and callback order; callee-saved registers, stack and final
flags agree. The isolated linker uses a typed Thumb alias for the original
bridge to avoid an erroneous ARM interworking veneer.

The candidate is 68 bytes including its pointer pool, matching the original
section length. It still emits an extra CMP after AND, with compensating pool
alignment; 19 halfwords differ. It is not integrated and the production build
and inventory remain at commit `b25c75b9`. Next work is matching flag-producing
AND/branch code without altering callback argument or register behavior.
