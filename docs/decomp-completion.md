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
