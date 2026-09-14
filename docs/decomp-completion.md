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

## Buffer candidate literal loads and flags — September 10, 2026

Research baseline `d790aa3b`. The opt-in `matching_thumb_literal_constants`
pass runs after register allocation and before the second split pass. It matches
explicitly declared SI constant assignments to low registers and replaces their
sources with GCC constant-pool memory. GCC's existing pool layout then emits
literal LDR instructions, preserving NZCV rather than synthesizing MOVS/LSLS.
The pass rejects missing constants, unsupported destinations/mode and invalid
options. It does not attempt to reconstruct constants already lowered before
this stage; a simple return-256 fixture verifies that rejection. No backend
modification is required.

`check_soundmain_buffer_entry.py --literals` selects pool loads for 848 and
1584. All 98,304 cases now match every register, flags, stack, memory and ordered
accesses; the prior 41,376 flag mismatches are gone. The candidate has 34
instruction bytes before its return versus original 32 before the RAM transfer.
Its standalone section grows from 44 to 48 bytes because it includes two new
literal words; eventual integration must reuse the original shared pool. The
extra counter comparison, commuted ADD encoding and BX LR instead of BX r3
still require matching work. No production integration is claimed.

The isolated literal test executes seven constant values in ROM and RAM under
all 16 initial flag states: 224 executions preserve NZCV, SP/LR and unaffected
registers. Nine invalid contracts reject, including a constant already lowered
to arithmetic; unannotated output is byte-identical. Production source, ROM,
ownership and existing verification receipts are unchanged.

## Outer SoundMain buffer-state recovery — September 10, 2026

Research baseline `2221e725`. `research/audio/soundmain_buffer_entry.c`
recovers the post-callback phase at 080CF510..080CF530, immediately before BX r3
into copied mixer RAM. It reloads the retained SoundInfo pointer, samples per
VBlank, DMA counter and optional period, performs modulo-32-bit buffer arithmetic,
stores the selected buffer into the frame, and prepares width and RAM target.
This improves on the existing semantic setup model by retaining every private
register and the ordered accesses, including frame/field overlap.

The first formulation caused register spills and a compiler epilogue failure.
Empty register ties eliminate the hidden retained values and produce a zero-local-
frame candidate. It has 38 instruction bytes before its ordinary return, versus
32 before the original transfer, and a 44-byte section with its own literal.
GCC synthesizes constants using MOVS/LSLS and adds an extra counter comparison.
The final width synthesis clears N/Z/C instead of preserving the original flags.

`check_soundmain_buffer_entry.py` checks 98,304 cases: every counter byte, three
periods, four full-width sample values, two frame/info layouts and all initial
NZCV states. All r0-r12, SP/LR, full data and ordered reads/writes agree. Original
flags agree with an independent arithmetic model; candidate flags equal that
result's V bit because the final constant sequence clears N/Z/C. There are
41,376 final-flag mismatch cases. This is an explicitly unresolved gap, not an
accepted relaxation. The candidate also returns through LR instead of BX r3.
Literal selection, flags, branch encoding and the final transfer remain next;
production code and coverage are unchanged.

## Copied mixer completion — September 10, 2026

Baseline `7a763d31` plus this change. `src/m4a_mixer_entry.c` now generates the
original twelve-byte SoundMainRAM entry at 080CF54C. The byte load, zero test,
direct Thumb clear-path branch, ADR and BX r1 match, including zero padding.
A local preprocessing alias avoids conflicting with the raw-byte declaration
used by existing copy callers; their header interface and emitted bytes remain
unchanged.

The new split-handoff pass runs after validated direct/indirect tail conversion.
It accepts only the exact byte-load/zero-test/target-load/empty-tie/indirect-tail/
direct-stub/single-symbol-pool shape. The zero-test target must have one use and
identify that terminal stub. Target symbols must match both declarations. The
pass folds CMP/BEQ to the direct Thumb symbol, selects the existing PC-relative
address operation, removes the empty tie, stub and pointer word, and emits zero
alignment. The resulting ADR is at byte six. Link assertions pin its aligned-PC
formula, adjacent ARM target, twelve-byte extent and the forward conditional
branch range. Twelve malformed source/configuration shapes and eight invalid
ROM/RAM placements reject; four valid placements including the range boundary
pass. Unannotated output is unchanged.

`check_soundmain_mixer_entry.py --production` passes 12,288 complete transfers
covering every reverb byte, every initial NZCV state and three info addresses,
with original/C code in ROM and copied RAM. Registers, flags, stack, destination
mode/PC, memory and ordered reads agree. All 3,528 complete audio regressions,
the full ROM checksum and fresh runtime rebuilds of all four images pass.
Cycle timing is not modeled.

The reproducible `scripts/audit_mixer_region.py` verifies continuous coverage of
080CF54C..080CF8F0 against current ELF ownership and symbols. Its receipt is
`docs/mixer-code-region.json`: all 932 section bytes belong to C-only objects,
comprising 346 Thumb instruction bytes, 572 ARM instruction bytes and 14 data/
alignment bytes. This completes the copied mixer, not the entire audio engine
or game. Outer SoundMain, other audio handlers, startup/interfaces, unit-list
fallback, transfer code and runtime assembly still need work. Main C ownership
is 720,050 mapped instruction bytes; reviewed non-library main assembly is
2,328 bytes. There are 500 tracked C files and 31 assembly entry markers.

## Mixer entry terminal transfers — September 10, 2026

Research baseline `3489c6b5`. `soundmain_mixer_entry_transfers.c` expresses both
paths explicitly: a direct terminal call to NoReverb on zero and a register-r1
indirect call to the ARM Reverb entry otherwise. An empty register tie keeps
the indirect call visible to the compiler. The emitted candidate is 16 bytes:
LDRB, CMP, BEQ to a local exit stub, pointer load, BX r1, B NoReverb, and a target
literal. It is not integrated. Folding the local exit stub and replacing the
literal with ADR remain necessary to match the original twelve-byte section.

The tail-transfer compiler now accepts an explicitly declared low indirect
register under its private-frame contract. It requires that register to be a
global binding and still proves every path ends in a validated terminal call,
with no post-call work or stack arguments. The indirect call becomes the
existing private BX instruction; the direct path keeps its original handling.
Indirect mode cannot combine with any adjacency option, preventing symbol-only
adjacency logic from receiving a register target. Existing direct-only behavior
is unchanged unless this option is supplied.

`check_soundmain_mixer_entry.py --transfers` passes all 12,288 cases through the
selected exits in original/C ROM/RAM machines, including return mode, PC,
registers, NZCV, unchanged SP/LR, full data and the ordered byte read. The pointer
literal is still linked separately for ROM and RAM, so unchanged-copy relocation
is not claimed. `check_tail_indirect.py` rejects 12 unsupported contracts and
preserves unannotated output. The prior 14 direct-tail and 17 private-frame/pool
rejections also pass. The full ROM comparison passes, and existing ELF/map
fingerprints are unchanged; no production coverage increase is claimed.

## Mixer entry state candidate — September 10, 2026

Research baseline `13e52a3e`. `research/audio/soundmain_mixer_entry.c` recovers
the state selection at 080CF54C..080CF558. It reads the reverb byte into r3,
preserves r1 when it is zero, and otherwise prepares the ARM reverb target in
r1. The four-byte LDRB/CMP prefix is exact. The candidate section is 16 bytes
versus original 12 because it still uses a target literal and an ordinary return.
The original branches directly to Thumb no-reverb clearing on zero; otherwise
it materializes the ARM target from PC and executes BX r1. Those transfers are
not yet generated by this candidate.

`check_soundmain_mixer_entry.py` passes 12,288 cases across original/candidate
ROM/RAM machines: all 256 reverb bytes, all 16 initial NZCV states and three
info addresses (including an unaligned address and a frame alias). Registers,
flags, SP/LR, complete data and the single ordered byte read match at each
selection boundary. There are 48 zero-reverb cases. The candidate is separately
linked for each placement and is not position-independent when copied unchanged;
normal return does not implement either original transfer. Cycle timing is not
modeled. Production source, bytes and coverage remain unchanged.

## Sample handoff integration — September 10, 2026

Baseline `4eccafb3` plus this change. `src/m4a_sample_handoff.c` replaces the
complete section at 080CF6D8..080CF6E4: ten instruction bytes and two zero padding
bytes. The three state loads, Thumb ADR and BX r0 all match. The same compiled
bytes compute the correct ARM destination when copied into mixer RAM.

The opt-in `matching_thumb_pc_handoff` pass validates private zero-frame Thumb
code with global r0/SP bindings, read-only aligned frame accesses, no calls,
branches, assembly or LR accesses, a final r0 load from the sole symbol pool,
and the recognized leaf return. Its declared six-byte instruction site must
match the actual prefix length. It selects a flag-preserving Thumb PC-relative
address operation and BX r0, removes the pointer literal and retains explicit
zero alignment. Offset values must be multiples of four within 0..1020. The
linker independently asserts the aligned-PC formula, target ARM alignment,
entry placement and twelve-byte section extent. Incorrect target placements
cannot silently pass the production contract.

The isolated compiler rebuild succeeds. Thirteen unsupported source/configuration
cases reject; unannotated output is unchanged. Eight wrong ROM/RAM target
placements reject and two correct placements link. Another 512 generated ADR
executions verify eight offset boundaries, both instruction alignments, ROM/RAM
and every NZCV state. `check_soundmain_sample_handoff.py --production` passes
24,576 full transfers across original/C ROM/copied-RAM machines with exact
section bytes, registers, flags, SP/LR, ARM destination, full data and ordered
reads. Word inputs are sampled and cycle timing is not modeled.

The full ROM checksum, all 3,528 complete audio calls and fresh runtime source
rebuilds of all four images pass. Main C-owned mapped instructions rise by ten
bytes to 720,040; reviewed non-library assembly falls to 2,338 main-ROM bytes.
There are 499 tracked C files. Initial mixer/SoundMain setup and other remaining
assembly still prevent completion of the full goal.

## Sample handoff state candidate — September 10, 2026

Research baseline `5ef0305e`. `research/audio/soundmain_sample_handoff.c`
recovers the three loads and ARM destination at 080CF6D8..080CF6E4. The frame
buffer goes to r5, the channel count to r2, and its current source to r3. Their
six instruction bytes already match. C currently materializes SampleEntry with
a word literal and finishes with ordinary BX LR; the section is 16 bytes versus
the original 12 (ten instruction bytes and two zero padding bytes).

`check_soundmain_sample_handoff.py` passes 24,576 pre-transfer cases across four
original/candidate ROM/RAM machines. It checks all registers, SP/LR, NZCV,
complete data and the ordered three reads across separate storage and two
frame/channel aliases. Each candidate is separately linked for its placement,
so this verifies the destination value but does not prove position-independent
copying. The original computes the target from PC, whereas this candidate's
literal would retain its original address when copied unchanged. PC-relative
Thumb address selection and the final BX r0 remain the next compiler work.
Inputs are sampled and cycle timing is not modeled. No production changes or
coverage increase are claimed for this candidate.

## Mixer exit restore integration — September 10, 2026

Baseline `282321b3` plus this change. `src/m4a_exit_restore.c` now generates
all 24 original section bytes at 080CF8D8..080CF8F0: 20 instruction bytes and
the four-byte ID_NUMBER literal. Lock release, saved-register restoration,
original intermediate SP updates and BX r3 match. The linker pins the entry,
word alignment, section extent and SoundMainRAM end address.

The grouped frame-return option proves eight contiguous SP+28..56 word reads
into r0-r7, followed by exactly r8-r11 copies from r0-r3 and the already verified
SP+60 target load/SP+=64 tail. It emits ADD SP,28; POP r0-r7; the unchanged high
copies; POP r3; and the private return. The new backend POP pattern describes
all eight word reads and SP writeback. The compiler rebuild succeeds. Four
additional malformed groups reject (wrong offset, wrong high copy, intervening
update and reordered reads), bringing grouped rejection coverage to 14. The
original ten return guards and unannotated-output checks continue to pass.

Two SoundMain callbacks enter the final BX directly. Their assembly calls use
`SoundMainRAM_ExitRestore + 18`, retaining the parent's Thumb function type and
avoiding an unwanted linker interworking veneer. The linked address alias
`SoundMainRAM_IndirectReturn` identifies the same byte position for auditing;
it is not used as an untyped call target. The full ROM checksum proves both
callback encodings and all subsequent code retain their original bytes.

`check_soundmain_exit_restore.py --production` passes 40,960 full return cases
across original/C ROM and copied RAM, with exact bytes, all registers, flags,
return mode/PC, memory and ordered accesses. A code hook checks SP at every
instruction against the original 0,28,60,64 progression. Another 2,048 cases
enter BX directly and verify ARM/Thumb destinations with unchanged registers,
SP/LR and no data accesses. Saved words are sampled; cycle timing/asynchronous
observation are not modeled. All 3,528 complete audio regression calls and fresh
runtime source rebuilds of all four images pass. There are now 498 tracked C
files, 720,030 main-ROM C-owned mapped instruction bytes and 2,348 reviewed
non-library main assembly bytes. Overall completion remains unproven.

## Mixer exit interworking return — September 10, 2026

Research baseline `27271aa0`. The new opt-in `matching_thumb_frame_return`
compiler contract converts the ordinary leaf return into BX r3 only after
validating the private 64-byte saved-frame convention. It requires Thumb-1,
void/no-argument/zero-local-frame code, global r3/SP bindings, the recognized
leaf epilogue, a final r3 word load from SP+60 followed by SP+=64, and no calls,
branches, executable assembly or LR accesses in the body. Other SP accesses
must be aligned word reads within the frame. Only a single constant-word pool
may follow the epilogue. Debug/unwind/profiling configurations reject.

The pass uses the existing backend private-return instruction; no backend rebuild
is needed. `check_thumb_frame_return.py` accepts the candidate and rejects ten
unsupported contracts: wrong/unaligned target slot, wrong stack advance, missing
target/frame bindings, clobbered target, inline instructions, ARM mode, debug
and unwind. Unannotated output remains byte-identical.

`check_soundmain_exit_restore.py --return` passes 40,960 cases in four original/C
ROM/copied-RAM machines through the final branch. The saved return targets cover
ARM and Thumb code in ROM and RAM. The lock-pointer/return-slot alias overwrites
the target with ID_NUMBER and is tested as well. All registers, final SP/LR,
NZCV, return PC/mode, complete data and ordered accesses agree. This extends the
previous pre-branch proof. The section remains 40 bytes versus original 24;
intermediate SP values still differ and grouped POP selection remains next.
Saved words are sampled; cycle timing and asynchronous observation are not
modeled. This remains research-only, with production coverage unchanged.

## Mixer exit restore candidate — September 10, 2026

Research baseline `22ea617a`. `research/audio/soundmain_exit_restore.c`
recovers the lock release and register restoration at 080CF8D8..080CF8EA,
immediately before the original BX r3. It writes ID_NUMBER through incoming r0,
then reads the nine saved words in address order. The first four become r8-r11,
the following four become r4-r7, and the final word becomes the return target in
r3. Original scratch r0-r2 retain the restored high-register values. r12 and LR
remain unchanged, and final SP advances by 64. The write precedes the reads,
including when the lock pointer aliases a saved word or the return address.

The first pointer-increment formulation made GCC use r12 as scratch and change
flags. Reading from fixed offsets of the original frame and advancing SP at the
end eliminates those differences. The emitted section is 40 bytes versus the
original 24 (including literal data/alignment). It uses individual word loads
and an ordinary BX LR. The next compiler work must select ADD SP/POP r0-r7,
high-register copies, POP r3, and BX r3, preserving the original intermediate
stack progression and final transfer. The candidate is not integrated.

`check_soundmain_exit_restore.py` passes 40,960 cases across four original/C
ROM/copied-RAM machines. It checks all r0-r12, final SP/LR, NZCV, complete mapped
data and the ordered lock write followed by nine frame reads. Inputs comprise
256 random saved-frame sets, a separate sound-info pointer plus each of the
nine saved-word aliases, and all 16 initial flag states. Execution stops before
the final branch in both implementations; final interworking behavior is not
claimed. Intermediate SP values differ, and cycle timing/asynchronous observation
are not modeled. Production bytes, ownership and prior verification are unchanged.

## Channel advancement integration — September 10, 2026

Baseline `0e1e53c6` plus this change. `src/m4a_channel_advance.c` now produces
all ten original bytes at 080CF8CC..080CF8D6. `src/m4a_exit_info.c` produces the
shared exit's following two-byte frame read. Moving that read also keeps the
remaining assembly restore sequence and its literal pool word-aligned without
padding changes. Link assertions pin both entries, extents and adjacency.

The new opt-in `matching_thumb_fork_decrement` pass proves a signed <=1 branch
whose two successors begin with the same low-register decrement. The taken
label must have one use, no preservation requirement, be forward and within
200 bytes, and follow a closed block. Labels, barriers or other operations before
either decrement prevent folding. It replaces the branch and both decrements
with an explicit RTL parallel: branch on the original signed value <=1 and
update that register modulo 2^32. The backend emits SUBS/BLE, whose N/V/Z flags
implement that original-value comparison even at 0x80000000. This removes the
extra CMP and duplicated SUBS without assuming a bounded channel count.

The isolated GCC backend rebuild succeeds. Six unsupported source shapes reject
(wrong bound, unsigned comparison, unequal/missing decrement, missing private
contract and an intervening store); unannotated output is byte-identical.
`check_soundmain_channel_advance.py --production` verifies exact bytes and both
production symbol extents, then passes 33,600 original/C ROM/copied-RAM cases
with no register, flags, memory, access-order or exit differences. All 3,528
complete audio regression calls pass, as do the full ROM checksum and fresh
runtime source rebuilds of all four images. Full-width values are sampled and
cycle timing is not modeled. The source inventory is 497 C files. Main C-owned
mapped instructions rise by 12 bytes to 720,010; reviewed non-library assembly
falls to 2,368 main-ROM bytes. This is not overall completion.

## Channel advancement candidate — September 10, 2026

Research baseline `ed63d207`. `research/audio/soundmain_channel_advance.c`
expresses the original ten-byte path at 080CF8CC..080CF8D6 using a signed
comparison of the original count and unsigned subtraction. This preserves the
original SUBS/BLE behavior at 0x80000000 without undefined signed C overflow.
The count decrements on both paths. Positive counts greater than one advance
the channel address by 64 with unsigned wraparound and branch to ChanLoop;
other counts continue to DeadlineExit. The private 64-byte frame is unchanged.

The first candidate was 16 bytes. Reordering the two paths and declaring the
validated terminal-adjacent DeadlineExit continuation reduces it to 14 bytes:
LDR, CMP, BLE, SUBS, ADDS, B, SUBS. It is not integrated. The next instruction
selection step must merge the identical decrements ahead of the branch and
reuse their comparison flags, preserving the signed-before-subtraction test.

`check_soundmain_channel_advance.py` compiles and links the candidate and checks
33,600 cases in four original/candidate ROM/copied-RAM machines. All r0-r12,
SP/LR, final flags, branch destinations, complete mapped data and the single
ordered frame read match an independent arithmetic model. The inputs cover 13
count boundaries plus 512 full-width random counts, four channel addresses
including carry/signed-overflow boundaries, and all 16 initial NZCV settings.
There are 16,576 exits and 17,024 channel advances. Full-width values are sampled,
and cycle timing is not modeled. Production ROM and coverage remain unchanged.

## Channel volume and loop metadata integration — September 10, 2026

`src/m4a_volume.c` replaces all 52 Thumb instruction bytes at
080CF6A4..080CF6D8. It updates envelope/stereo volumes with unsigned 32-bit
multiplication wraparound, then computes optional loop start and length in the
shared mixer frame. Volatile reads preserve behavior when channel, sound-info,
wave and frame memory overlap. The linker enforces the 52-byte extent and exact
adjacency to the remaining sample handoff.

The compiler's explicit `matching_thumb_copy_add_zero` contract selects the
existing Thumb ADDS-zero pattern for distinct low-register copies. Its flag
behavior is intentional; the existing ARM contract continues to preserve flags.
Eight unsupported mode/copy combinations reject, both modes compile positively,
and unannotated ARM output remains unchanged. The volume block's actual copy
passes 16,544 full-width boundary/random executions across all NZCV and ROM/RAM.

`check_soundmain_volume.py` verifies exact production ROM bytes and entry size,
then checks 131,072 cases in four original/candidate ROM/copied-RAM machines.
An independent mutable-memory model verifies all registers, final flags,
fallthrough, full data memory and ordered accesses, including four alias layouts
and 64,272 actual initial-product wrap cases. Byte envelope/master pairs are
exhaustive; independent parameter combinations are sampled and cycle timing is
not modeled. All 3,528 complete audio regression calls pass. Fresh pinned runtime
sources reproduce all four images. Main mapped C ownership rises by 52 bytes to
719,998/777,630 (92.59%); reviewed non-library assembly falls to 2,380 main bytes.
These are coverage measures including inherited work, not overall completion.

## Current verified state

After mixer-entry integration (baseline `7a763d31` plus this change),
`make compare -j8` verifies all 16,777,216 bytes against the USA ROM checksum.
The current source inventory has 500 main C files, 31 assembly entry markers,
three manual assembly function declarations, one naked-function marker, seven
instruction-bearing inline templates and zero direct baserom includes.
Mapped main-ROM instruction bytes include 720,050 in C-only objects, 33,870 in
mixed C/assembly objects, 1,918 in assembly sources and 21,792 in runtime archives.
The embedded payload still has 16 assembly function declarations. The latest
integration sections below and `PROGRESS.md` contain the corresponding evidence.

This is not 100% C decompilation. Remaining work includes audio handlers and
mixing code, startup and BIOS interfaces, the naked unit-list fallback, timing
assembly, embedded code and 200 ARM bytes in the FE6 transfer wrapper's data
section. Whole-ROM executable classification is still incomplete, so no
reliable overall C-completion percentage is claimed.

The starting FEUniverse checkout and laqieer's later data-source import are
community contributions. The initial and imported inventories below distinguish
those inputs from this task's matching replacements, build fixes and verification.
A larger current file count does not mean every file was newly decompiled here.

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


### Exact TrackStop candidate — September 9, 2026

The legacy Thumb backend resets its condition-code knowledge after ordinary
AND, retaining a redundant zero compare. `research/audio/live-and-zero.patch`
adds a peephole for a same-destination register AND immediately followed by a
zero comparison, guarded by the existing equality-only condition consumer
predicate. It emits the AND while preserving its live result. The original
production compiler remains unchanged.

An isolated compiler with this patch now produces all 68 TrackStop section
bytes exactly at the original address, with zero differing halfwords. All 768
original/C execution cases still pass. `check_track_stop.py --compiler` allows
selecting this isolated compiler. The patch needs standalone positive and
negative condition-code regression checks and a reproducible fresh build before
production promotion. TrackStop remains a candidate, not an integrated replacement.


### TrackStop production integration — September 9, 2026

The equality-only live AND/zero patch is now maintained under `tools/agbcc-tst/`.
The pinned builder applies it after the existing patches, verifies the resulting
backend hash and runs twelve static comparison checks. A fresh committed-source
build passes those checks and 14,336 baseline/folded execution probes covering
live AND results, all incoming NZCV states, callback clobbers, signed/high-bit
operands and excluded asm barriers. The existing signed comparison bodies and
barrier fixture remain byte-for-byte identical at assembly-source level.

`src/m4a_track_stop.c` is integrated at `0x080CFDD0..0x080CFE14`. Its 68-byte
section contains 62 Thumb instruction bytes, two alignment bytes and a four-byte
sound-info pointer. All bytes match the original ROM; all 768 TrackStop cases
pass with the freshly built compiler. The existing audio `call_r3` bridge is
exported and marked as Thumb for the new C object's relocation; its instructions
remain assembly. The former TrackStop assembly body is removed.

`make compare -j8` passes the complete ROM checksum. The source audit now reports
452 main C files and 55 assembly entry markers. The linked audit attributes all
68 bytes to the C object, with no orphan mapping symbols. Other audio handlers,
startup and BIOS interfaces, ARM shims, the naked unit-list fallback and transfer
code remain unfinished; no overall completion percentage is inferred.


### Tied-note release candidate — September 9, 2026

`research/audio/end_tie.c` reconstructs `ply_endtie`. Bytes below 128 update
the track key and advance the command pointer; other bytes retain the saved key
and pointer. The handler scans channels and marks only the first channel whose
status has any 0x83 bit, lacks the 0x40 release bit, and has the requested note.

`check_end_tie.py` compiles the candidate using GNU ARM GCC and passes 768
original/C cases: six command bytes across the optional-key boundary, eight
list layouts including duplicate matches, empty lists and excluded statuses,
and all incoming NZCV patterns. An independent model checks complete test RAM;
callee-saved registers, stack and final flags agree. Caller-clobbered register
values are not asserted by this candidate-stage test.

The candidate is 66 bytes against the original 64 at `0x080D0044..0x080D0084`.
Five halfwords in the overlapping region differ. GCC's Thumb frame code
explicitly saves LR whenever low callee-saved registers are pushed; the original
leaf preserves only r4/r5. Threshold/branch and one TST operand choice also
remain different. Production remains unchanged at `d3354ff9`; no integration or
overall completion is claimed.


### Thumb leaf-frame experiment — September 9, 2026

`research/audio/thumb-leaf-frame.patch` changes the isolated GCC frame-mask
calculation only for the explicit `matching_leaf_frame` function attribute.
It suppresses the default save of LR for a simple leaf with low saved registers;
non-leaves, required LR saves, frame pointers and high-register save masks are
rejected. The original `arm.cc` SHA-256 is
`4266ee54c3ba2a8f89630486a304624a80ec3c2daa8550c143d5b24eee3c1e0c`.
The small `research/audio/leaf_frame.cc` plugin registers the experimental
attribute. The isolated GCC build-tree compiler was rebuilt, without installing
it over the production compiler. Its source tree currently contains this
experimental patch; do not promote that tree without validation and updating
the reproducible builder's source checks.

With `MATCH_LEAF_FRAME`, the tied-note candidate is now the original 64 bytes
and still passes all 768 original/C cases. Only halfwords at offsets 6, 8 and
36 differ: the threshold/branch pair and one TST operand order. Prologue and
epilogue now match. This remains research; standalone frame-contract regression
cases, mode/unsupported-use checks, reproducible bootstrap support and final
integration remain required. The production compiler and ROM are unchanged.


### Exact tied-note candidate and frame probes — September 9, 2026

The `leaf_frame` experimental pass now handles GCC's combined Thumb-1
comparison/branch RTL. It rewrites unsigned power-of-two boundary tests from
`> boundary-1` to `>= boundary` (and the complementary <=/< form), restricted
to low registers and encodable boundaries. Register-only EQ/NE TST operands
are ordered by register number; their bitwise result and flag effects are
commutative. Only functions bearing the explicit leaf contract are transformed.
The pass rejects that contract outside Thumb-1.

All 64 bytes of the tied-note candidate now match, and its 768 original/C
execution cases pass. `check_leaf_frame.py` adds 5,760 baseline/matching
executions across boundary and signed tests, register TSTs, high-bit operands,
all incoming flags and saved-register preservation. Loading the plugin without
the contract leaves assembly unchanged. Non-leaf calls, high saved registers,
frame-pointer functions, ARM mode and a variable carrying the function attribute
are rejected. These are bounded regression probes, not a general compiler proof.

Reproducible backend/plugin promotion, stronger source/ABI evidence for the
production object and full-ROM integration remain next. The production compiler
is still the installed version; the experimental build-tree compiler and plugin
are selected explicitly with `check_end_tie.py --compiler ... --plugin ...`.


### Tied-note release production integration — September 9, 2026

`src/m4a_end_tie.c` now replaces all 64 Thumb instruction bytes of `ply_endtie`
at `0x080D0044..0x080D0084`. The former assembly body is removed, and the linker
places the C object before `clear_modM`. The explicit leaf contract preserves
the original r4/r5-only save frame and BX LR return.

The leaf plugin and backend patch are now maintained in `tools/arm-dispatch/`.
The compiler builder accepts only the known original or patched `arm.cc` hashes
and records the patch/source hashes in build provenance. Applying the patch to
the untouched `arm.cc` extracted from the verified GNU source archive reproduces
the built source exactly. The Makefile rebuilds and installs the isolated
compiler, builds compatible plugins, and applies this plugin only to the new
Thumb translation unit. Existing ARM dispatcher support remains compatible.

`make compare -j8` passes the complete ROM checksum. The installed compiler
passes 5,760 standalone frame/rewrite executions and rejects five invalid
contracts. The 768 tied-note executions now also compare every r0-r12 value
between the original and production ROM code, alongside memory, stack and
flags. The checker confirms the compiled candidate and production bytes agree.
The linked audit assigns 64 Thumb bytes to the new object with no orphan
mappings. Inventory is now 453 main C files and 54 assembly entry markers;
embedded code and other remaining executable scopes still require completion.


### Stereo channel-volume integration — September 9, 2026

`src/m4a_channel_volume.c` replaces all 48 Thumb bytes of `ChnVolSetAsm` at
`0x080CFE14..0x080CFE44`. Fixed-register global declarations express its private
inputs (channel in r4, track in r5); local empty constraints preserve the original
register allocation. No instruction templates or additional compiler patches
are used. Signed channel pan ranges from -128 to 127; right/left factors are
128+pan and 127-pan. Each factor is multiplied by velocity and track volume,
shifted by 14 and clamped to 255 before storing. These bounded products fit
in signed 32-bit arithmetic.

`research/audio/check_channel_volume.py` passes 4,032 original/production cases
covering pan extremes, velocity/volume boundaries, saturation and all incoming
NZCV states. Complete test memory, r0-r12, preserved stack and final flags agree
with the original and an independent arithmetic reference. `make compare -j8`
passes the complete ROM checksum. The linked audit assigns all 48 Thumb bytes
to the C object with no orphan mappings. Main inventory is now 454 C files and
53 assembly entry markers. All previously identified remaining scopes remain
part of the full decompilation goal.


### Audio VSync/DMA candidate — September 9, 2026

`research/audio/sound_vsync.c` reconstructs `m4aSoundVSync`. It accepts the
unlocked and active sound identifiers, decrements the byte counter with the
original signed decision, and reloads it when the prior counter is zero or one.
For each DMA channel whose repeat bit is set, it writes the original immediate
restart control value, then disables and re-enables both channels in FIFO mode
with the original halfword write order. Hardware accesses use volatile C fields.

`check_sound_vsync.py` passes 2,304 original/C cases spanning six identifier
values, six counters, four reload periods, four repeat-bit combinations and
four incoming NZCV patterns. An independent model checks sound-state memory,
MMIO memory, and ordered access addresses, widths and write values, including
the counter decrement and reload before DMA accesses. Write traces mask values
to their bus width. Preserved registers and stack agree, and no return-flag
differences occur. This models CPU accesses, not DMA execution or timing.

The candidate remains 92 bytes against the original 76-byte region at
`0x080CFB1C..0x080CFB68`. Shared forward literal references, redundant compares,
bit-test lowering and halfword-store narrowing still differ. It is not
integrated; production remains at `70290e0c` with the full ROM matching.


### VSync narrowing instructions removed — September 9, 2026

Empty read/write register constraints between each pair of halfword stores
prevent GCC from sharing a separately narrowed temporary. Both stores now use
the original register directly, eliminating two redundant shift pairs. The
CPU instruction and MMIO sequence is otherwise unchanged by the constraints.
The candidate shrinks from 92 to 84 bytes; it is still unintegrated against the
76-byte original section. Shared forward literals, the counter comparison and
DMA bit-test instructions remain different.

All 2,304 original/C execution cases continue to pass the independent state
and ordered-access reference. The checker now also compares all r0-r12 values
at return: zero register differences and zero flag differences occur. DMA
hardware execution/timing remains outside this CPU-level model. Production
source and its assembly inventory remain unchanged.


### Thumb shared-literal relocation probe — September 9, 2026

`check_thumb_shared_literal.py` establishes a viable external Thumb literal
encoding for the VSync shared pool. Ordinary external LDR syntax is rejected
by GAS. An explicit `R_ARM_THM_PC8` relocation requires the instruction's scaled
implicit addend to encode -4 (`ldr r0,[pc,#1020]` before relocation), accounting
for the architectural PC bias. A relocation expression `Shared-4` alone did not
encode that addend and loaded four bytes past the target. This is an assembler
relocation experiment, not copied ROM opcodes or production code.

The probe verifies final addresses for minimum through maximum forward offsets
and executes 192 valid loads across two origins, both word/halfword instruction
alignments and all NZCV inputs. All values and flags match. GNU ld silently
wraps twelve backward/out-of-range cases; explicit decoded-address checks catch
all twelve, and matching linker ASSERT bounds reject each. Any production
shared-literal support must enforce the forward 0..1020-byte aligned PC range
explicitly, rather than relying on relocation failure.

The VSync C candidate remains 84 bytes, with its previously verified 2,304
cases unchanged. This probe resolves the relocation mechanism and required
validation for the next compiler change; production remains unchanged.


### VSync shared Thumb literals emitted by compiler — September 9, 2026

The experimental `thumb_shared_literal.md` pattern and corresponding C++ pass
now generate the two forward shared loads from constant-to-symbol manifests.
Selected constants are removed from the local pool and retained pool references
are adjusted. Unsupported references fail compilation. The load is represented
as an explicit volatile late operation; Thumb's generic immediate predicate
rejects external symbols, so this pattern accepts only SYMBOL_REF operands
explicitly. It emits a normal LDR and an R_ARM_THM_PC8 relocation, with no
post-compilation byte edits.

`research/audio/build_thumb_shared.py` reconstructs the experimental extension
from the maintained backend, rebuilds the build-tree compiler, stages compatible
generated plugin headers, builds the plugin and records hashes. It leaves the
installed production compiler untouched. The ignored source/build tree currently
contains this extension; the production bootstrap will restore its canonical
matching.md until this work is promoted.

The checker links shared pools at their original `0x080CFDC8` and `0x080CFDCC`
addresses and asserts conservative forward-range bounds. Both emitted loads
now match exactly. The candidate is down from 84 to the original 76 bytes.
All 2,304 cases pass with zero r0-r12 or return-flag differences, preserving
ordered counter/MMIO accesses. The extra counter compare and shift/carry branch
selection remain different; production integration is not yet possible.


### VSync shift/carry branches matched — September 9, 2026

The experimental Thumb extension now includes an explicit single-bit branch
operation selected by `--carry-tests`. The pass converts register-bit extraction
branches while preserving their condition, label and scratch register. Bits
1..31 use a left shift by 32-bit-index; bit zero uses a right shift by one,
avoiding an unencodable Thumb LSL #32. EQ/NE become carry-clear/carry-set
branches. Short, long and far assembly forms retain the existing branch-distance
strategy; the long/far forms still need dedicated regression coverage.

`check_thumb_carry.py` passes 3,072 baseline/carry executions across six bit
positions (including 0 and 31), both senses, boundary/alternating inputs and all
incoming NZCV states, checking branch results and preserved registers/stack.
The VSync candidate uses the original LSL #7/BCC sequences and still passes all
2,304 state, ordered-access and register/flag comparisons. Its section remains
76 bytes, but the redundant signed counter compare shifts later instructions.
Removing the C constraint after decrement does not eliminate that comparison:
GCC conservatively tracks arithmetic flags as NZ-only. Next work must prove
the byte counter's subtraction cannot overflow before reusing those flags for
a signed branch. Production remains unchanged.

### September 9: Thumb carry branch distance regression

Extended `research/audio/check_thumb_carry.py` beyond short branches with
160-store and 1,200-store volatile C bodies in both branch senses. The probe
asserts that the plugin emits the conditional skip plus B and BL forms,
respectively. All 4,096 baseline/plugin executions pass across incoming NZCV
values, checking the selected output, return PC, stack and callee-saved registers.
Range fixtures call a noinline barrier so the incoming return address is saved.

An initial oversized inline-assembly leaf fixture and then an ordinary volatile
C leaf fixture both triggered `Unexpected thumb1 far jump` in the baseline
compiler as well as the extension configuration. Consequently these passing
non-leaf tests do not establish support for large leaf functions. Resolve that
compiler limitation or explicitly reject unsupported extension contracts before
production promotion. No production source or ROM bytes changed in this step.

Verified with `.deps/arm-oracle-venv/bin/python research/audio/check_thumb_carry.py
--compiler .deps/sound-vsync-match/gcc
--plugin .deps/sound-vsync-match/thumb_shared_literal.so`.

### September 9: complete 76-byte VSync candidate match

Starting from research revision `e60c244d`, the VSync candidate now matches the
entire original section at `080CFB1C..080CFB68`, including both shared Thumb
literal loads, all instructions, the two zero alignment bytes and the two
local DMA constants. Candidate SHA-256:
`dc1f26a42cabf2ec4cddeffe54d52fe85e61473478f237d16d3b4f2774defd91`.

The counter's empty constraint is now input-only. It still binds the byte load
to r1, while retaining the unsigned-byte range proof. The experimental plugin
combines adjacent decrement, byte store and GT/LE branch into a single RTL
bundle only after finding the zero-extending byte load. The decrement result
is in [-1,254], so signed overflow cannot occur and its flags implement the
branch correctly. The bundle explicitly writes the decremented register and
truncated memory value and branches on the bounded decrement result. It does
not reuse arbitrary arithmetic flags or assume that an output asm preserves
a range. The memory address must use an independent low register and byte
offset 0..31; branch targets are limited to a conservative forward 200-byte
span. Other forms retain normal GCC code.

The remaining difference after this bundle was `46C0` code NOP padding where
the ROM contains `0000`. The opt-in zero-pool-padding rule uses an explicit
`.balign 4, 0` backend pattern immediately before the selected pool, and requires
a preceding control-flow barrier. It does not write game opcodes.

Validation with the rebuilt experimental compiler:

- VSync: all 2,304 original/C cases pass, with exact bytes and zero r0-r12 or
  return-flag differences; memory and ordered counter/MMIO accesses also match.
  `--require-match` now makes all of these results mandatory. DMA execution
  and hardware timing are still outside the CPU oracle's scope.
- `check_thumb_byte_counter.py`: 65,664 baseline/plugin executions cover every
  byte and incoming NZCV value, both branch senses, full-width overflow edges,
  output memory, return PC, stack and callee-saved registers. Six unsupported
  forms remain unchanged: output asm, flags clobber, signed byte, full-width
  input, decrement by two and a target outside the accepted short span. Only
  compiler-generated unique long-branch label numbers are normalized when
  comparing assembly text.
- Carry regression: all 4,096 baseline/plugin executions still pass, including
  long and far branches in non-leaf functions. The previously recorded large
  leaf-function GCC limitation remains.

Reproduction: `python3 research/audio/build_thumb_shared.py`, then
`.deps/arm-oracle-venv/bin/python research/audio/check_sound_vsync.py
--compiler .deps/sound-vsync-match/gcc
--plugin .deps/sound-vsync-match/thumb_shared_literal.so
--carry-tests --byte-counter --zero-pool-padding --require-match`.
Experimental cc1 SHA-256:
`a32be83edcf35f5e0bf0843e800d76d12a9060ed343e32c705a265e798e393be`.

Production remains at the verified stereo-volume integration `70290e0c`.
The VSync assembly has not yet been removed. Next is reproducible compiler
promotion, linker integration and a full ROM comparison, followed by source
and linked-code inventory updates.

### September 9: VSync production integration

The exact candidate from `0261b2cf` is now `src/m4a_sound_vsync.c`; its assembly
body was removed from `src/m4a_1.s`. The linker inserts the C object before
`.text.after_sound_vsync` and keeps the original MPlayMain pool addresses.
The two shared pool labels are exported; explicit conservative forward-range
assertions protect the Thumb relocations from linker wraparound.

Compiler patterns are promoted into `tools/arm-dispatch/matching.md`, with
`thumb_shared_literal.cc` and `build_thumb_shared.py` alongside the other
pinned compiler tools. The normal Makefile builds the isolated compiler,
rebuilds plugins against its installed generated headers and selects the
Thumb options only for VSync. Superseded research compiler/source copies were
removed. The research checker compiles the production source and supports
`--production` to require equality with the actual linked ROM section.

`make compare -j8` passes: all 16,777,216 bytes match SHA-1
`c25b145e37456171ada4b0d440bf88a19f4d509f`. The installed compiler/plugin passes
2,304 production/original VSync execution cases, 65,664 bounded-counter cases
and 4,096 carry-branch cases. An additional literal-plugin regression verifies
224 executions when every local pool word moves to a shared pool, with both
padding modes; eight invalid configurations are rejected without compiler
internal errors. The earlier Thumb range/alignment probe still documents why
explicit linker guards are necessary. No hardware DMA timing is claimed.

The source audit now reports 455 main C files, 52 assembly entry markers, one
naked-function marker, 42 NONMATCHING conditionals, and no baserom includes.
Of 539 literal inline-assembly sites, 199 are register bindings, 332 are empty
constraints, one is directive-only and seven contain instructions. The linked
audit attributes 66 Thumb bytes and ten data/padding bytes to the VSync C
object, with no mapping symbols outside input sections. Embedded payload and
transfer-wrapper work remains in scope; this is not 100% C decompilation.

Evidence: `.deps/vsync-integration-compare.log`, `.deps/vsync-source-audit.json`,
`.deps/vsync-linked-audit.json` and `.deps/sound-vsync-match/report.json`.
Next work targets the remaining small audio command handlers.

### September 9: command setter private ABI isolated

Research begins from production `7eae15fd` with `command_setters.c` and
`check_command_setters.py`. Priority (`080CFA18`, field offset 29) and LFO delay
(`080CFACC`, field offset 27) each have an original ten-byte body:
save LR in r12, call the checked byte reader, store r3, return through r12.
The C candidates bind the private reader result to r3 and the track to r1.
GCC correctly emits the call and byte store, but emits PUSH LR / POP r0 / BX r0
for the frame and return. Each candidate is twelve bytes and is not matching.

The new oracle links each candidate at its original entry address and executes
the original ROM's `ld_r3_tp_adr_i` and address filter, rather than substituting
a helper model. Each handler passes 2,064 memory/return-flag cases: every byte
from a normal RAM stream and a rejected low-memory stream, four incoming NZCV
patterns, and all four aliases into the command-pointer field. Aliased reads
observe the already-incremented pointer, as required by the helper's ordering.
All callee-saved registers and SP agree. The only r0-r12 differences are r0 and
r12, in every case, caused by the return convention. The global register
declarations produce GCC's expected call-clobbered-register warnings; this
private helper convention cannot be assumed for arbitrary callees.

Next work needs a constrained compiler return-frame contract that reserves r12
and verifies that every call preserves it, avoiding arbitrary call sites or
stack layouts. The existing matching leaf-frame attribute is insufficient
because these functions call the reader. Production remains byte-identical
and unchanged, with 52 assembly entry markers. Evidence is recorded in
`.deps/audio-command-setters/report.json`; reproduce with
`.deps/arm-oracle-venv/bin/python research/audio/check_command_setters.py`.

### September 9: exact command setters with restricted r12 return

Starting from `1c32326f`, both setter candidates now match all ten original
bytes. Each passes 2,064 original/C cases against the actual checked ROM reader,
with no memory, r0-r12 or return-flag differences. The source remains C with
fixed-register bindings and an opt-in `matching_ip_return` function attribute.

The experimental `ip_return` pass validates an LR-only entry push, a single
epilogue, no local frame and a straight-line void body. Each ordinary direct
call must have an explicit `preserves-ip` manifest entry. The declaration is a
private ABI contract, not inferred proof of an arbitrary callee: the actual
audio reader is independently exercised by the setter oracle and preserves
r12. Any interworking veneer must also preserve the contract; production
integration must retain direct Thumb calls and exact linked bytes.

After validation, the pass replaces the LR push with a normal RTL register
move from LR to r12, and uses an explicit Thumb return pattern that emits BX
r12. It clears obsolete frame notes and refuses unwind, exception and debug
configurations, so it does not publish inaccurate stack-unwind information.
The installed production compiler is unchanged; `build_ip_return.py` builds
the extension and compatible plugin in the experimental compiler tree.

`check_ip_return.py` passes 128 executions spanning two calls, every incoming
NZCV pattern, four initial r12 values and ARM/Thumb return modes. Fourteen
unsupported forms are rejected without internal compiler errors: absent or
unknown callee contracts, indirect calls, stack locals, r12 clobbers, control
flow, frame pointers, debug/unwind configurations, nonvoid returns, ARM mode,
global r12 variables, variable attributes and exposed return addresses.
Loading the plugin leaves an unannotated function's assembly unchanged.

Reproduce with `python3 research/audio/build_ip_return.py`, then run
`check_command_setters.py --compiler .deps/audio-command-setters/gcc
--plugin .deps/audio-command-setters/ip_return.so --require-match` and
`check_ip_return.py` with the same compiler/plugin, using the Unicorn venv.
Experimental cc1 SHA-256: `5b5b162ff0d13992d9f9881b05671af29bc48f6d52a043447c6d430f06ba85ca`.

Production remains at `7eae15fd`, with 52 assembly entry markers. The two
candidates still require compiler promotion, section placement, full-ROM
comparison and updated linked/source audits before integration is claimed.

### September 9: priority and LFO-delay setters integrated

The exact candidates from `4b3053e7` are now `src/m4a_command_setters.c`, with
separate function sections linked at `080CFA18` and `080CFACC`. Their original
assembly bodies were removed. Explicit zero alignment remains at the preceding
assembly boundaries: without it, the assembler padded the shortened sections
with NOPs instead of the original zeros. Both following routine addresses are
unchanged (`ply_tempo` at `080CFA24`, `ply_modt` at `080CFAD8`).

Private-return patterns and plugin support were promoted into
`tools/arm-dispatch/`, with a builder using the installed compiler's generated
headers. The normal Makefile builds all dependencies and provides the explicit
checked-reader r12 contract. The research compiler copies were removed.

`make compare -j8` passes the full 16,777,216-byte ROM checksum. Both ten-byte
setter bodies pass 4,128 production/original memory, register and flag cases
using the actual ROM helper, with no differences. The installed plugin passes
128 two-call return-mode cases and rejects fourteen unsupported contracts;
unannotated assembly is unchanged. The exact BL instructions still target the
original Thumb reader directly, with no introduced veneer.

The source audit reports 456 main C files and 50 assembly entry markers. Of
541 inline sites, 201 are register bindings, 332 are empty constraints, one is
directive-only and seven contain instructions. One naked-function marker and
42 NONMATCHING conditionals remain, with no baserom includes. The linked audit
attributes twenty Thumb bytes and two padding bytes to the new C object, with
no mapping symbols outside input sections. Remaining embedded and transfer
code remains in scope.

Evidence: `.deps/audio-command-setters/compare.log`, `report.json`,
`source-audit.json` and `linked-audit.json`. The progress panel is updated.
The root README's inherited “Used by” section was also clarified in response
to the user's question: those downstream tools can consume symbols and data
while C recovery is incomplete; they are not a completion or maintenance claim.

### September 9: flag setters integrated and provenance clarified

`src/m4a_flag_setters.c` replaces the key-shift, volume and bend-range assembly
handlers at `080CFA38`, `080CFA7C` and `080CFAB8`. Each eighteen-byte body matches
exactly. They use the existing validated private-return plugin; no new backend
transformation was needed. Volatile fixed-register mask/result bindings retain
the required global register writes and their ordering under the pinned GCC.
The ordinary bindings initially duplicated the immediate into r0; making only
the mask volatile removed the duplicate but still reordered the mask and flag
load. Both volatile bindings with scheduling disabled yield the original code.
The statements are C operations, without instruction-bearing inline assembly.

`check_command_setters.py --flag-setters --require-match --production` compiles
the production source and verifies equality with the linked ROM before execution.
All 49,536 cases pass using the actual checked byte reader: every command byte,
eight track-flag patterns, four NZCV patterns, rejected low-memory reads and
four command-pointer aliases. RAM, r0-r12, return flags, stack and preserved
registers agree. The previous two setters also pass their 4,128 production cases
through the generalized checker. Output directories separate their artifacts.

`make compare -j8` verifies the full ROM. The source audit reports 457 main C
files and 47 assembly entry markers. Its 544 inline sites comprise 204 register
bindings, 332 empty constraints, one directive-only template and seven instruction
templates. One naked-function marker, 42 NONMATCHING conditionals and zero
baserom includes remain. The linked audit attributes 54 Thumb bytes and two
padding bytes to the new object, with no orphan mapping symbols. Evidence lives
in `.deps/audio-command-setters/flag-setters/` (`compare.log`, `report.json`,
`source-audit.json`, `linked-audit.json`).

The README and standing panel now explicitly credit the recorded FEUniverse
starting revision `ecc6798b` and the later laqieer data import `7b47dec8`. The
latter supplied 76 C files, mostly data definitions, as recorded at integration.
Repository totals and upstream badges must not be mistaken for work newly
completed during this task. The audit's stale opening inventory was replaced
with the current counts; historical milestone entries remain below it.

### September 9: pan, bend and tuning handlers integrated

The flag-setter C object now also implements `ply_pan` at `080CFA90`,
`ply_bend` at `080CFAA4` and `ply_tune` at `080CFAF0`. Each original twenty-byte
body matches exactly, including the subtraction of 64 before storing the
signed-byte parameter and the corresponding flag mask. The existing private
return convention and volatile fixed-register bindings suffice; no compiler
change or new inline assembly was needed. Their original assembly bodies were
removed, with zero alignment retained at each section boundary.

The oracle now describes a per-handler byte bias and checks the wrapped stored
result after both accepted and rejected reads. Each new handler passes 16,512
production/original cases: every stream byte, eight track-flag patterns, four
NZCV patterns and command-pointer aliases. The complete six-handler flag suite
passes 99,072 cases with exact bytes and zero RAM/register/flag differences.
`--production` verifies the compiler output equals the actual ROM section.
`make compare -j8` passes the full ROM checksum.

The main inventory remains 457 C files and is down to 44 assembly entry markers.
The other source counts are unchanged: 544 inline sites (seven instruction
templates), one naked marker, 42 NONMATCHING conditionals, no baserom includes.
The linked audit attributes all 114 Thumb bytes of the six handlers to the C
object, with no orphan mapping symbols. Evidence is in
`.deps/audio-command-setters/flag-setters/compare-biased.log`, `report.json`,
`source-audit.json` and `linked-audit.json`. Remaining tempo, modulation, port,
voice and engine handlers still require work.


### September 9: tempo handler integrated

`src/m4a_tempo.c` replaces all 20 bytes of `ply_tempo` at
`080CFA24..080CFA38`. It calls the original checked command reader, doubles
its byte into tempoD, multiplies by tempoU, shifts by eight and stores tempoI.
The C uses the private reader register convention and one empty r2 read/write
constraint; it contains no instruction-bearing assembly.

The private-return pass now accepts only a single empty low-register SI `+r`
constraint with its tied input and no additional operands or clobbers. Executable
assembly, memory operands, high registers and clobbers remain rejected. The
installed plugin passes 128 two-call executions and 19 rejection fixtures;
unannotated assembly remains unchanged.

`research/audio/check_tempo.py --compiler COMPILER --plugin PLUGIN --production`
checks all 20 bytes and 24,768 original/production executions using the actual
ROM reader. Cases cover all command bytes, twelve scale values, low rejected
addresses, four command-pointer aliases and four incoming flag patterns. Checks
include player/track RAM, r0-r12, stack, return PC and flags, including halfword
truncation of the effective tempo. The six existing flag setters also pass
99,072 production regression cases with the updated plugin.

`make compare -j8` passes for all 16,777,216 ROM bytes. The linked audit assigns
20 Thumb bytes to `src/m4a_tempo.o` with no orphan mappings. The source audit
reports 458 main C files, 43 assembly entry markers, 549 inline sites (208
register bindings, 333 empty constraints, one directive-only template and seven
instruction templates), one naked marker and 42 NONMATCHING conditionals.
Embedded and transfer-wrapper remaining scope is unchanged. Local evidence is
in `.deps/tempo-match/`: production, contract and regression logs, source and
linked audits, and the full-ROM comparison log. Overall completion remains
unproven while executable classification and assembly replacements remain.


### September 9: port command behavior verified in research

`research/audio/port.c` expresses the two-byte port command in C. The first
byte selects an offset from `0x04000060`; the private reader entry
`_081DD64A` at `080CF98E` consumes the second byte and advances the track pointer
past both bytes. The byte value is written to the computed hardware address.

`research/audio/check_port.py --compiler COMPILER` compiles the ordinary return
candidate and exercises all 65,536 offset/value pairs against the original ROM.
The ordered byte write, all track RAM, flags, stack, return PC and r4-r11 agree.
The incoming flag patterns vary across all sixteen combinations with offset.
This models CPU accesses only, not sound hardware timing. The current oracle
covers normal command RAM; rejected and aliased reads remain to be added before
production integration.

The candidate is not a byte match: its 28-byte section differs from the original
24-byte section and its ordinary return changes r0/r12. Compiling with
`-DPORT_PRIVATE_RETURN` and the current `ip_return` plugin rejects the trailing
literal pool after the epilogue, as expected from its straight-line restriction.
The address addition also encodes its two source operands in the reverse order.
Next is guarded literal-pool support and matching operand selection, followed by
expanded private-ABI validation and full-ROM integration. Production remains
`2ae198bb`, at 43 assembly entry markers. Research output and the execution
report are in `.deps/port-match/`; no production implementation changed.


### September 9: port command integrated

The port candidate is now `src/m4a_port.c`, replacing the original 24-byte
section at `080CFB04..080CFB1C`. All 20 instruction bytes and the four-byte
sound-register-base literal match. An empty r0 read/write constraint preserves
the original addition operand order; no executable inline assembly is used.
The existing private reader entry `_081DD64A` is exported for the C caller.

The private-return pass now permits compiler-generated integer word-pool data,
word alignment and pool-end markers after the epilogue, only behind a terminal
control-flow barrier. It continues to reject executable post-return patterns,
control flow, unsupported constraints and stack/return-register uses. The
installed plugin passes 128 two-call cases and rejects all 19 existing negative
fixtures; loading it leaves unannotated assembly unchanged.

`research/audio/check_port.py --compiler COMPILER --plugin PLUGIN --require-match
--production` verifies exact production bytes and 132,352 executions. Coverage
includes every offset/value pair in normal and rejected low RAM, plus five
command-pointer aliases. It checks the ordered byte MMIO write, full track RAM,
r0-r12, flags, stack, return PC and preserved registers. Writes follow the actual
ROM helper's pointer-store-before-read behavior. This is CPU access verification,
not a sound-hardware timing simulation. Tempo passes 24,768 production regression
cases with the updated installed plugin.

`make compare -j8` verifies the complete ROM. The linked audit attributes
20 Thumb bytes and four data bytes to `src/m4a_port.o`, with no orphan mappings.
The source inventory is 459 main C files and 42 assembly entry markers. Its 554
inline sites comprise 212 register bindings, 334 empty constraints, one
directive-only template and seven instruction templates. The naked fallback,
42 NONMATCHING conditionals, embedded declarations and transfer-wrapper scope
remain unfinished. Local logs and audit reports are in `.deps/port-match/`.


### September 9: modulation type integrated

`src/m4a_mod_type.c` replaces `ply_modt` at `080CFAD8..080CFAF0`.
The checked command byte is compared with the current modulation type. Only
when they differ does the handler store the new type and set the low four track
flags. All 24 Thumb bytes match, with no instruction-bearing inline assembly.

The private-return plugin has an explicit `forward-exits` option. It accepts
only a low-register EQ/NE branch whose forward label leads directly to the
terminal epilogue (apart from a compiler SP-use marker), after an entry save
and a contracted call. Backward branches, ordered comparisons and targets
before another call are regression rejection cases. The default remains
straight-line. The installed contract suite passes 128 two-call cases and
rejects 22 unsupported forms; unannotated assembly is unchanged.

`research/audio/check_command_setters.py --compiler COMPILER --plugin PLUGIN
--mod-type --require-match --production` passes 66,048 executions against the
actual ROM reader. Each command byte is checked against equal, differing, zero
and 255 initial modulation types, with eight initial flag patterns and four
incoming NZCV patterns. Rejected reads and four pointer aliases are included.
Full track RAM, r0-r12, flags, stack, return PC and preserved registers agree.

The full ROM passes `make compare -j8`. The linked audit assigns 24 Thumb bytes
to `src/m4a_mod_type.o`, with no orphan mappings. Source inventory is 460 main
C files and 41 assembly entry markers. The 558 inline sites comprise 216
register bindings, 334 empty constraints, one directive-only template and seven
instruction templates. The remaining naked fallback, embedded declarations,
transfer wrapper and executable-classification work remain in scope. Evidence
is recorded under `.deps/mod-type-match/`.


### September 9: voice selection integrated

`src/m4a_voice.c` replaces `ply_voice` at `080CFA4C..080CFA7C`.
Its 46 instruction bytes and two zero padding bytes match. The handler reads
the voice index before advancing the command pointer, computes a twelve-byte
instrument offset and copies three words with the existing address filter.
The filter `chk_adr_r2` is exported for the C caller. It validates the instrument
base address on every call; the C retains that exact private convention and the
original word-by-word ordering. No new compiler changes were required.

`research/audio/check_voice.py --compiler COMPILER --plugin PLUGIN --production`
passes 24,960 original/production executions. Cases cover all 256 indices, a
rejected low source, four sources overlapping the destination instrument,
four command-pointer aliases, four data patterns and four initial flag patterns.
The model applies each word store before reading the next source word, retaining
observable overlap effects. All 16 KiB test RAM, r0-r12, flags, stack, return PC
and preserved registers agree.

`make compare -j8` verifies all ROM bytes. The linked audit assigns 46 Thumb
bytes and two padding/data bytes to `src/m4a_voice.o`, with no orphan mappings.
The source audit reports 461 main C files and 40 assembly entry markers. Of
562 inline sites, 220 are register bindings, 334 empty constraints, one is
directive-only and seven contain instructions. The naked fallback, embedded
code, transfer wrapper and unfinished executable classification remain in
scope. Evidence is retained under `.deps/voice-match/`.


### September 9: sequence jump integrated

`src/m4a_sequence_goto.c` replaces `ply_goto` at `080CF998..080CF9B8`.
All 32 Thumb bytes match using the pinned compiler's ordinary LR push/pop;
no private-return plugin is needed. The destination is assembled from its
highest byte downward. Only the lowest byte passes through the existing
`ldrb_r3_r2` address filter, now exported for C linkage.

The repeat handler branches into `ply_goto_1` with a return address already
saved on the stack. The linker retains this internal entry at `080CF99A`, two
bytes after `ply_goto`, preserving the original instruction stream and stack
contract. Pattern and repeat remain assembly and are still counted as such.

`research/audio/check_sequence_goto.py --compiler COMPILER --production`
passes 32,832 original/production executions. It sweeps every value in each
of the four pointer bytes, normal and rejected command locations, and four
command-pointer aliases. Both public and shared-stack entries are checked
with ARM and Thumb return modes and four incoming NZCV patterns. Track RAM,
r0-r12, flags, SP, return PC and preserved registers agree. The internal-entry
cases use a deliberately different incoming LR to verify the stacked return.

The full ROM passes `make compare -j8`. The linked audit assigns 32 Thumb bytes
to `src/m4a_sequence_goto.o`, with no orphan mappings. Source inventory is
462 main C files and 39 assembly entry markers. The 566 inline sites comprise
224 register bindings, 334 empty constraints, one directive-only template and
seven instruction templates. Remaining embedded, transfer-wrapper, naked
fallback and executable-classification scope is unchanged. Local evidence is
in `.deps/sequence-goto-match/`.


### September 9: pattern nesting research verified

`research/audio/pattern.c` models the pattern handler's three-level return
stack. Levels zero through two save the address after the four-byte target,
increment the nesting level and enter the sequence jump. Levels three through
255 enter the fine handler. The C deliberately preserves sequential stores and
reads, including command data overlapping the return-stack slot.

`research/audio/check_pattern.py --compiler COMPILER` passes 16,384 executions
against the original `ply_patt` at `080CF9B8`. It covers all nesting levels,
four track-flag patterns, normal/rejected command locations, command-pointer
and return-stack aliases, and four initial NZCV patterns. Both original and
candidate run the actual ROM jump/fine callees. Track RAM, r0-r12, flags, SP,
return PC and preserved registers agree. The fine path currently uses an empty
channel list; nonempty channel-chain coverage remains necessary for integration.

This is behavior research, not production integration. The compiler emits a
40-byte section rather than the original 28 bytes: it uses an LR save, ordinary
calls and a common return instead of the original terminal branches. Its
unsigned nesting comparison is `> 2` rather than the original `>= 3`. Next is
restricted compiler support for those tail transfers and matching comparison
selection, with validation of the private register and return contracts.
The production ROM remains the verified `3f99b484` implementation with 39
assembly entry markers. Evidence is retained in `.deps/pattern-match/`.


### September 9: pattern channel and transfer contracts audited

The pattern oracle now covers zero, one and two linked channels, with status
bytes swept across all 256 values by the nesting-level dimension. Expected
shutdown behavior includes conditional stop bits, removal from the track list,
cleared channel ownership and repaired previous links. All 49,152 cases agree
on track/channel memory, r0-r12, flags, final SP and return PC. Both actual ROM
callees execute; this closes the earlier empty-channel-only coverage gap.

New entry tracing at `ply_goto` and `ply_fine` exposes a material remaining
contract difference: all 49,152 candidate cases enter the selected callee with
a different SP and LR. Final-state agreement alone did not establish the
original tail-transfer behavior. `--require-match` now also rejects either
callee-entry mismatch. The candidate remains 40 bytes versus 28 original.

Inspection of the pinned GCC 16.2.0 `gcc/config/arm/arm.cc`, function
`arm_function_ok_for_sibcall`, confirms that it returns false unconditionally
for `TARGET_THUMB1`. Ordinary sibling-call optimization flags cannot recover
these terminal branches. Next is restricted support for direct Thumb terminal
transfers with explicit destination contracts, no live frame or post-call work,
and link-range verification. Production remains unchanged at `3f99b484`;
39 assembly entry markers remain. Updated evidence is in
`.deps/pattern-match/channel-oracle.log` and `report.json`.


### September 9: exact pattern tail-transfer candidate

The pinned backend now provides `match_thumb_tail_transfer`, a direct two-byte
Thumb symbol branch. A first build exposed a missing predicate name; an explicit
symbol-only predicate fixed that definition. The rebuilt/installed compiler
passes the full production-ROM checksum through `make compare -j8`.

`research/audio/tail_transfer.cc` is an opt-in research pass with the
`matching_tail_transfer` attribute and explicit `destination=SYMBOL` contracts.
It requires an LR-only frame, direct zero-stack-argument calls, no stack/return
register accesses in the body, forward control flow and a terminal call on every
path. Each call must lead to the sole epilogue through only zero-code markers
and forward jumps. It removes the now-unneeded frame and replaces terminal
calls with branches. Debug/unwind configurations, indirect calls, backward
loops, bare return paths, post-call work and executable asm are rejected.
The optional `raise-unsigned-bound` rewrite changes GTU n to GEU n+1 for bounded
immediate values; its private flag effects are checked by the actual-callee
oracle. `-fno-reorder-blocks` retains the supported forward return layout.

`research/audio/check_pattern.py --compiler COMPILER --plugin PLUGIN
--require-match` now verifies all 28 original bytes and 49,152 executions, with
zero final-register, flag, callee-stack or callee-return differences. It includes
active channel-chain shutdown and pointer aliases. `check_tail_contracts.py`
rejects eleven unsupported forms, accepts a direct terminal transfer and leaves
unannotated assembly unchanged. `check_tail_range.py` verifies four in-range
branch encodings and rejection of both out-of-range boundary cases. GNU as
accepts the backend's `b #symbol` spelling with the expected Thumb relocation.

Production still uses the original pattern assembly, with 39 assembly entry
markers. Next is promotion of the research pass/builder and pattern integration;
exact research bytes alone do not complete that step. Evidence is retained in
`.deps/pattern-match/`: backend build/compare logs, tail oracle/contract logs,
plugin provenance and the execution report.


### September 9: pattern handler integrated

`src/m4a_pattern.c` now replaces the original `ply_patt` section at
`080CF9B8..080CF9D4`. The complete 28-byte section is exact: 26 Thumb instruction
bytes and two zero padding bytes. The pattern stack updates and transfers to
`ply_goto`/`ply_fine` are generated from C without executable inline assembly.

The verified tail-transfer pass and builder were promoted from research to
`tools/arm-dispatch/`. The Makefile builds the plugin against the pinned compiler
and enables its destination/comparison contracts only for the pattern object.
The installed plugin passes eleven rejection fixtures, a direct-transfer
acceptance check and unchanged-unannotated-assembly verification. Four valid
branch encodings match and two out-of-range boundary cases are rejected.

`research/audio/check_pattern.py --compiler COMPILER --plugin PLUGIN
--require-match --production` passes all 49,152 executions. It verifies the
actual ROM callees, active channel-chain shutdown, pointer aliases, final
memory/register/flag state and unchanged SP/LR at either destination entry.
`make compare -j8` passes for the complete ROM. The linked audit assigns
26 Thumb bytes and two padding bytes to `src/m4a_pattern.o`, with no orphan
mappings. Inventory is 463 main C files, 38 assembly entry markers and 570
inline sites (228 bindings, 334 empty constraints, one directive-only template
and seven instruction templates). Repeat handling and all previously recorded
remaining scopes are unfinished. Evidence is in `.deps/pattern-match/` under
the production comparison, oracle, contract, range and audit reports.


### September 9: repeat semantics and shared entry verified in research

`research/audio/repeat.c` models `ply_rept` at `080CF9E8`. A zero limit jumps
unconditionally after advancing the command pointer. A nonzero limit increments
the byte repeat counter but retains the full increment in r12 for comparison;
in particular, old counter 255 stores zero while comparing 256. The checked
reader advances the command pointer before reading the limit. Completion clears
the counter and skips the five-byte repeat command; continuation jumps through
the four-byte destination.

`research/audio/check_repeat.py --compiler COMPILER` passes 264,704 final-state
cases. Coverage sweeps every limit/counter pair in normal and rejected RAM,
plus counter and command-pointer aliases, with two initial NZCV patterns. The
model applies stores before subsequent aliased reads. Actual ROM reader and
jump implementations run in both machines. All track RAM, r0-r12, flags,
final SP, return PC and preserved registers agree. There are 66,950 jump cases
and 197,754 local-completion cases.

The candidate is not integrated: it is 56 bytes versus the original 48. It calls
the public jump function rather than branching past that function's LR push
with its own saved LR. Tracing the shared entry at `080CF99A` finds SP/LR
differences in all 66,950 jump cases. The matching gate explicitly rejects
those entry differences, even though final states agree. Next is restricted
shared-frame transfer support that retains the repeat handler's frame and local
return, plus its ordinary checked-reader call. The existing all-terminal-call
pass cannot be applied unchanged.

Production remains `aea5146b`, with 38 assembly entry markers. Research evidence
is in `.deps/repeat-match/oracle.log`, `entry-oracle.log` and `report.json`.


### September 9: exact shared-frame repeat candidate

`research/audio/shared_frame.cc` and its builder provide a separate opt-in
`matching_shared_frame` contract. It retains the original entry LR push and
local epilogue, permits explicitly listed ordinary returning calls and converts
only terminal calls to a declared shared entry. The selected terminal paths
must lead directly to the common return through forward jumps and zero-code
markers. It does not remove shared return instructions or SP markers needed
by local-completion paths. Executable asm, stack access outside the frame,
indirect calls, backward control flow and work after a transfer are rejected.
Explicit assembler names are normalized when looking up destination contracts;
GCC represents the C alias for `ply_goto` as `*ply_goto` internally.

With `destination=ply_goto`, `entry=ply_goto_1` and
`returning-call=ld_r3_tp_adr_i`, the repeat candidate now matches all 48 original
bytes. `research/audio/check_repeat.py --compiler COMPILER --plugin PLUGIN
--require-match` passes 264,704 executions. All 66,950 jumping cases have
identical SP/LR at the shared entry; all 197,754 local completions also match.
There are no track-RAM, r0-r12, flag or final return differences. The untruncated
counter comparison and aliases remain covered. `check_shared_contracts.py`
rejects ten unsupported forms, accepts a retained-frame transfer and leaves
unannotated assembly unchanged.

The new support is still research-only and uses the already installed backend
terminal-branch operation; no compiler rebuild or production source change was
needed. Next is promotion and full-ROM integration. The production baseline
remains `aea5146b` with 38 assembly entry markers. Local evidence is in
`.deps/repeat-match/shared-oracle.log`, `shared-contract.log`, plugin build
provenance and the execution report.


### September 9: repeat handler integrated

`src/m4a_repeat.c` now replaces `ply_rept` at `080CF9E8..080CFA18`.
The complete section matches: 46 Thumb instruction bytes and two padding bytes.
The source calls the regular typed `ply_goto` declaration using a bound r0 player
pointer; it no longer needs a separate assembler-name alias. The matching pass
redirects the terminal calls to the original shared-stack entry while retaining
the repeat handler's LR push and local return.

The shared-frame pass and builder were promoted to `tools/arm-dispatch/` and
added to the production Makefile for this object. The production plugin passes
ten rejection fixtures and the acceptance/unchanged-unannotated checks.
`research/audio/check_repeat.py --compiler COMPILER --plugin PLUGIN
--require-match --production` passes 264,704 cases: 66,950 jumping cases and
197,754 local completions. There are no shared-entry SP/LR, track-RAM, r0-r12,
flag or final return differences. Counter wraparound and aliased command reads
remain explicitly covered.

`make compare -j8` passes for all ROM bytes. The linked audit attributes
46 Thumb bytes and two padding bytes to `src/m4a_repeat.o`, with no orphan
mappings. Source inventory is 464 main C files and 37 assembly entry markers.
The 575 inline sites comprise 233 register bindings, 334 empty constraints,
one directive-only template and seven instruction templates. Audio engine,
LFO/modulation commands, embedded, transfer-wrapper, naked fallback and complete
executable-classification work remain unfinished. Production logs and audits
are retained under `.deps/repeat-match/`.


### September 9: LFO and modulation reset commands integrated

`src/m4a_reset_setters.c` replaces `ply_lfos` at `080D00AC` and `ply_mod` at
`080D00C0`. Both 18-byte bodies match. Each command stores the unchecked reader's
byte and calls `clear_modM` only when it is zero. The helper clears modulation
and LFO counters and updates the appropriate track flags. Both actual helpers
preserve the private r12 return convention.

The opt-in private-return forward-exit checker now accepts a zero immediate
as well as a second low register in EQ/NE comparisons. A nonzero-immediate
fixture remains rejected. The installed contract suite passes 128 executions,
rejects 23 unsupported forms and leaves unannotated assembly unchanged.

`research/audio/check_command_setters.py --compiler COMPILER --plugin PLUGIN
--reset-setters --require-match --production` passes 49,536 cases per function,
99,072 total. The tests include every command byte, three modulation types,
eight initial track flags, four incoming NZCV patterns and pointer aliases.
Low-address reads intentionally remain unchecked; the expected model does not
apply the checked reader's zero filter. Full track RAM, r0-r12, return flags,
SP, return PC and preserved registers agree, including the actual reset helper.

`make compare -j8` verifies all ROM bytes and original zero padding. The linked
audit assigns 36 Thumb bytes and two padding bytes to the C object, with the
remaining inter-function alignment supplied by the linker and no orphan mappings.
Inventory is 465 main C files and 35 assembly entry markers. The 578 inline sites
comprise 236 register bindings, 334 empty constraints, one directive-only template
and seven instruction templates. Audio engine, assembly interfaces, embedded
code, transfer wrapper, naked fallback and executable-classification work remain
unfinished. Evidence is retained in `.deps/reset-setters/`.


### September 9: audio jump-table copy research

`research/audio/jump_table.c` expresses `MPlayJumpTableCopy` at `080CF958`:
36 words are loaded from `gMPlayJumpTableTemplate`, passed through the actual
address filter and stored sequentially. A nonvolatile destination register
binding lets GCC emit the original STM-with-increment operation; the volatile
pointer variant instead needed a temporary saved register and separate store.
The current candidate still emits an ordinary return frame, a redundant compare
and a local literal, rather than the original private r12 return/shared literal.

`research/audio/check_jump_table.py --compiler COMPILER` passes 3,072 copy cases:
original and fifteen synthetic 36-word templates, six EWRAM/IWRAM destinations,
sixteen incoming flag combinations and ARM/Thumb returns. Copied words, adjacent
canaries, preserved registers, final SP, return mode/PC and flags agree. The
candidate differs in r0/r12 and is 32 bytes versus the original 24-byte section.
Synthetic data is written only in the emulated template region for this test.

The original-address candidate would overwrite the neighboring filter while
executing. The harness therefore retains its original-address linked bytes for
matching comparison and separately relinks its execution image at `080E1000`.
The original filter remains intact and executes in both machines. This is a
research isolation measure, not a production relocation or matching claim.
Next is guarded loop support for the private return, matching decrement/branch
selection and use of the existing shared literal at `080CF988`. Production
remains `3bcc2a7c`, with 35 assembly entry markers. Evidence is retained in
`.deps/jump-table-match/`.


### September 9: jump-table private return corrected

The opt-in `ip_return` `body-branches` mode permits direct conditional and
unconditional branches only to labels after the entry LR save and before the
terminal epilogue. Branch operands may not use SP, LR or r12. Existing frame,
call-manifest, executable-asm and return restrictions still apply. Symbol-address
words are now accepted in compiler-generated trailing pools, alongside integer
words, only after a terminal barrier. Default production control-flow contracts
are unchanged.

With this support, `research/audio/check_jump_table.py --compiler COMPILER
--plugin PLUGIN` passes 3,072 cases with no r0-r12 or final-flag differences.
The candidate shrank from 32 to 28 bytes; the original section remains 24 bytes.
It still emits an extra comparison and uses a local pool instead of the shared
literal at `080CF988`. The routine remains assembly in production.

The installed compiler plugin passes 128 two-call contract cases and rejects
26 unsupported forms, including loop-mode executable asm, an indirect transfer
and a stack clobber. Unannotated assembly is unchanged. `make compare -j8`
verifies the existing complete ROM after rebuilding the production plugin.
The loop-mode execution and contract checks were repeated against that installed
plugin. Evidence is in `.deps/jump-table-match/installed-oracle.log`,
`installed-contract.log`, `private-oracle.log` and `compare.log`. The remaining
production inventory is still 35 assembly entry markers.


### September 9: jump-table shared literal recovered

The shared-literal plugin now accepts
`symbol-literal=gMPlayJumpTableTemplate,lt_MPlayJumpTableTemplate`. It identifies
the local symbol-address word, redirects its uses to the existing shared word
and removes the duplicate pool entry. Numeric and symbolic manifests remain
distinct. Explicit assembler-name aliases are normalized; duplicate source
symbols, missing sources and malformed identifiers are rejected.

The jump-table candidate is now 24 bytes and executes at its original address
without covering the adjacent helpers. All 3,072 cases agree on copied data,
canaries, r0-r12, flags and ARM/Thumb return behavior using the real filter and
shared literal. It is still not a byte match: the redundant loop comparison
occupies instruction space where the original has a shorter countdown branch
and final padding. Probing O1, O2, Os and Og, with and without the volatile
counter binding, retained the comparison in every case.

The expanded shared-pool suite passes 672 executions across integer constants,
symbol addresses and explicit assembler aliases in both padding modes; thirteen
invalid configurations are rejected. The jump-table and shared-pool checks pass
against the installed rebuilt plugin. `make compare -j8` verifies the unchanged
production ROM. The routine remains assembly, with 35 production assembly entry
markers. Evidence is retained under `.deps/jump-table-match/`, including
`shared-oracle.log`, `installed-shared-oracle.log`, `installed-symbol-contract.log`
and `shared-compare.log`. The next step is a guarded countdown rewrite.


### September 9: exact jump-table countdown candidate

The pinned backend now contains `match_thumb_countdown`, selected only by the
research `matching_countdown` pass. It bundles subtraction by one with the
short backward signed-positive branch, avoiding the redundant comparison.
The proof requires one positive constant initializer (1..255), a single loop
branch, an adjacent decrement, no other counter writes and a conservative loop
span below the short-branch limit. Calls require an explicit counter-preservation
manifest; inline assembly and additional control flow are rejected. This range
ensures subtraction cannot overflow, so its flags support the original branch.

The jump-table helper is explicitly declared to preserve the counter. Its
private contract overrides generic call-clobber analysis, while all other writes
remain checked. The private-return checker now recognizes the bundled low-register
decrement/branch and compiler-generated zero pool alignment; its stack and
return-register exclusions remain in force. This supports composition with the
shared-literal and countdown passes.

`research/audio/check_countdown.py` passes 320 original/folded executions for
counts 1, 2, 36, 127 and 255 across all NZCV combinations and ARM/Thumb returns.
It rejects eight unsupported loop forms and leaves unannotated code unchanged.
The private-return suite passes 128 cases and rejects 26 unsupported forms.
The rebuilt installed compiler passes `make compare -j8` for the existing ROM.

`research/audio/check_jump_table.py --compiler COMPILER --plugin IP_PLUGIN
--shared-plugin SHARED_PLUGIN --countdown-plugin COUNTDOWN_PLUGIN --require-match`
now matches all 24 original bytes and passes 3,072 original-address executions
with no memory, register or flag differences. The countdown operation and shared
zero padding reproduce the original instruction stream and alignment. The
candidate is still research-only; next is promotion of its pass/builder and
production integration. There remain 35 production assembly entry markers.
Evidence is retained in `.deps/jump-table-match/`, including the countdown build,
contract, private-contract, oracle and final full-ROM comparison logs.


### September 9: jump-table copy integrated

`src/m4a_jump_table.c` replaces `MPlayJumpTableCopy` at `080CF958..080CF970`.
The complete 24-byte section matches: 22 Thumb instruction bytes and two zero
padding bytes. The existing shared literal `lt_MPlayJumpTableTemplate` is exported
for the C object's relocation. The linker bounds it explicitly to prevent silent
Thumb PC-relative offset wrapping. The actual address filter remains in place.

The countdown pass and builder were promoted to `tools/arm-dispatch/`. The
Makefile builds the countdown, private-return and shared-literal plugins against
the pinned compiler and applies the combined contracts to this object only.
The installed countdown passes 320 original/folded executions and rejects eight
unsupported loops; unannotated assembly is unchanged.

`research/audio/check_jump_table.py --compiler COMPILER --plugin IP_PLUGIN
--shared-plugin SHARED_PLUGIN --countdown-plugin COUNTDOWN_PLUGIN --require-match
--production` passes 3,072 executions against the original bytes, with no memory,
r0-r12, flag or return-mode differences. `make compare -j8` passes for all
16,777,216 ROM bytes. The linked audit assigns 22 Thumb bytes and two padding
bytes to `src/m4a_jump_table.o`, with no orphan mappings.

Inventory is 466 main C files and 34 assembly entry markers. The 582 inline
sites comprise 240 register bindings, 334 empty constraints, one directive-only
template and seven instruction templates. Remaining audio engine, assembly
interfaces, embedded code, transfer wrapper, naked fallback and whole-ROM
executable-classification work remain unfinished. Production verification logs
and audit reports are retained under `.deps/jump-table-match/`.


### September 9: audio block-clear research verified

`research/audio/clear_block.c` models `SoundMainBTM` at `080CF8F0`:
clear sixteen words, advance r0 by 64 and preserve the caller's r4. The original
saves r4 in r12, initializes r1-r4 to zero and executes four STM operations before
restoring r4. The C candidate uses empty register constraints to retain the four
zero operands and pointer updates, but GCC emits sixteen individual stores and
an ordinary stack frame. Scalar and aggregate source variants at O1/Os did not
produce the grouped stores.

`research/audio/check_clear_block.py --compiler COMPILER` passes 3,072 memory
and preserved-register cases: six EWRAM/IWRAM destinations, sixteen initial
memory/register patterns, all NZCV combinations and ARM/Thumb returns. Exactly
64 destination bytes are cleared and neighboring canaries remain intact.
Final SP, return PC/mode and r4-r11 agree. Final r0/r12 differ, and flags differ
in all cases because the candidate's explicit pointer additions change flags
where the original STM writeback does not. The matching gate reports and rejects
those differences.

This remains research-only: the candidate is 56 bytes versus the original
24-byte section. Next is guarded grouped-store generation and the original
r4-in-r12 save convention. No production source changed; the verified baseline
remains `01763457` with 34 assembly entry markers. Evidence is retained under
`.deps/audio-clear-match/`.

### September 9: block-clear private register state recovered in C

The research candidate now expresses the incoming r4 save in a global r12
register binding and restores r4 explicitly. GCC emits MOV IP,r4 and MOV r4,IP
with a direct BX LR return, eliminating the stack frame. All 3,072 oracle
cases now agree on r0-r12 as well as memory, canaries, SP and return mode.
The candidate remains 56 bytes; all cases still differ in return flags because
the four explicit ADD instructions replace flag-preserving STM writeback.

O2, Os and O3 probes also retain sixteen scalar stores. GCC already has a
Thumb four-register STM-with-writeback instruction pattern in ldmstm.md; next
work is to establish a guarded lowering of the four stores and pointer update
into that existing pattern. No new instruction template or production change
is needed for the register-save improvement. The matching gate remains unsatisfied.

### September 9: exact audio block-clear C candidate

The grouped-store research plugin recognizes four consecutive nonvolatile,
word-aligned SI stores from strictly ascending distinct low registers to offsets
0, 4, 8 and 12 of one low-register base, followed immediately by base += 16.
The base must not occur among the source registers. Labels, calls, executable
operations and asm barriers interrupt the sequence. The replacement is GCC's
existing five-SET Thumb STM-with-writeback RTL pattern, validated by the backend;
there is no new instruction template. Only matching_group_stores functions opt in.
GCC's ordinary store peephole requires the base to die, which this routine's
explicit subsequent update prevents. Combining that update preserves the live base.

The candidate now matches all 24 original bytes at 080CF8F0. The oracle's 3,072
cases have no r0-r12 or flag differences and pass memory/canary, SP and ARM/Thumb
return checks. `check_group_stores.py` rejects six fixtures (volatile stores,
wrong increment, reversed registers, duplicate register, noncontiguous offsets,
memory barrier), verifies unchanged unannotated assembly, and confirms four STMs
for the accepted candidate. Compiler inputs and provenance are retained under
`.deps/audio-clear-match/`; reproducible sources and checks are in research/audio.

This milestone is research-only. Production remains at the verified jump-table
integration; next is canonical plugin/build integration, assembly replacement,
production execution checks and the full-ROM comparison. Remaining scope is unchanged.

### September 9: audio block clear integrated and full ROM verified

`src/m4a_clear_block.c` replaces SoundMainBTM at 080CF8F0 through 080CF908.
The linked object contains 22 Thumb bytes and two zero padding bytes. Its C
expresses the sixteen word stores, pointer advance and private r4/r12 save.
The guarded grouped-store plugin and reproducible builder now live in
`tools/arm-dispatch`; the Makefile loads the installed plugin for this object.
The original assembly body is removed and the linker places its replacement
immediately before RealClearChain.

`make compare -j8` passes the complete 16,777,216-byte ROM checksum. The
production oracle verifies the linked bytes equal the standalone candidate
and original and passes all 3,072 memory/register/flag/return cases. The installed
plugin passes its six rejection fixtures and unannotated-output check. The
linked audit reports no mappings outside input sections.

The tracked source inventory is now 467 main C files and 33 assembly entry
markers. Its 590 inline sites comprise 246 register bindings, 336 empty
constraints, one directive-only template and seven instruction templates.
The naked fallback, remaining audio engine and interfaces, embedded executable,
transfer assembly and complete executable classification are still unfinished.
Logs and audit evidence are retained under `.deps/audio-clear-match/`.

### September 9: checked audio byte reader integrated

`src/m4a_checked_reader.c` replaces ld_r3_tp_adr_i at 080CF98C. It loads
track->cmdPtr into r2, stores the incremented pointer before reading through
r2 (including aliases into the pointer field), and tail-transfers to the existing
chk_adr_r2 filter. The existing guarded tail-transfer compiler plugin produces
all ten original Thumb instruction bytes; two zero padding bytes also match.
The linker exports the alternate entry _081DD64A at function + 2, 080CF98E.
That entry consumes the incoming r2 instead of loading the track pointer.

The standalone and production oracle each pass 180,224 cases: both entries,
all 256 byte values, all sixteen NZCV states, ARM/Thumb returns, normal aligned
and unaligned EWRAM sources, IWRAM, four pointer-field aliases, and two rejected
low-address regions. Tests verify track memory, r0-r12, final flags, SP and
return state while executing the actual shared filter. Candidate, production
and original section bytes are identical. `make compare -j8` passes the entire
ROM checksum, and nm confirms both entry addresses. Linked mappings contain
10 Thumb bytes and two data/padding bytes with no orphan mappings.

Inventory: 468 main C files, 32 assembly entry markers, 593 inline sites
(249 register bindings, 336 empty constraints, one directive-only template,
seven instruction templates). The shared filter itself remains assembly;
the remaining engine, naked fallback, embedded and transfer code, and complete
executable classification remain in scope. Evidence is retained under
`.deps/checked-reader-match/`.

### September 9: shared audio address-filter C research

`research/audio/address_filter.c` models chk_adr_r2 at 080CF972. It preserves
incoming r0, accepts addresses whose upper seven bits are nonzero, and otherwise
accepts only addresses at least the template address and below 0x4000. Rejection
zeros r3. The supplied ROM's template is 08207190, so that BIOS exception cannot
actually succeed; the C retains it for exact control flow and flags. Volatile
register bindings and an explicit volatile saved word retain the private state
without executable inline assembly.

The candidate compiles to 34 bytes including its literal versus 26 original
bytes. GCC emits SUB SP/STR and LDR/ADD SP instead of PUSH/POP r0, and compares
r0 against r2 with BHI rather than r2 against r0 with BLO. These branches select
the same paths but leave different flags on some rejection paths. The shared
literal will also need to retain its existing exported pool location.

`check_address_filter.py` passes 206,592 value/register/return checks. It covers
address boundaries, reproducibly seeded full-width and low addresses, six pool
values (including synthetic ones exercising the dormant BIOS exception), four
incoming words, every NZCV state and ARM/Thumb returns. All r0-r12 and final SP
agree. Flags differ in 36,480 cases; the exact-match gate rejects this candidate.
No production code changed. Evidence is retained in `.deps/address-filter-match/`.
Next work is guarded stack save/restore folding and comparison operand ordering.

### September 9: audio filter comparison flags matched

The research-only matching_compare_order contract reverses ascending distinct
low SI register operands for unsigned comparison branches and reverses the
relation (LTU/GTU or LEU/GEU) to preserve branch decisions. It runs on Thumb-1
RTL before shortening and validates the replacement against the existing
backend. Signed comparisons, equality/inequality and contracts without eligible
register comparisons are rejected. Unannotated functions remain unchanged.
The explicit private-ABI contract is necessary because comparison operand
order affects machine flags even when C branch behavior is identical.

The filter now emits CMP r2,r0 / BLO as in the original. Its complete 206,592-case
oracle has zero return-flag differences and still passes all value/register,
SP and return-mode checks. Four unsigned-relation fixtures compile with the
requested operand order; four unsupported contracts are rejected and the
unannotated fixture's assembly is byte-for-byte unchanged. Candidate size is
still 34 versus 26 bytes; stack save/restore folding and literal layout remain.
The plugin, builder and checks live under research/audio and are not loaded by
production. Verification is retained in `.deps/address-filter-match/`.

### September 9: audio filter entry PUSH matched

The research matching_stack_word pass folds exactly an entry SP -= 4 followed
by an SI low-register store at SP into GCC's existing Thumb multi-register PUSH
pattern. It checks both operations, preserves the store's volatility and validates
the generated RTL. Unwind/exception metadata is rejected because the pass does
not rewrite frame metadata. It only applies to explicitly annotated functions.
The filter retains its explicit saved C local and now emits the original PUSH r0.

The candidate shrinks from 34 to 30 bytes including padding and its literal.
All 206,592 oracle cases still pass registers, return modes, SP and flags. The
stack guard checker accepts PUSH and rejects absent frames, larger frames and
unwind metadata, and proves unchanged output for an unannotated fixture.
The remaining restore uses LDR r0,[SP] / ADD SP,#4 rather than POP r0, and the
literal layout still differs. This remains research-only; production is unchanged.

### September 9: audio filter POP matched; entry alignment isolated

The pinned backend now has a semantic single-low-register Thumb POP pattern,
expressing a word load from SP and simultaneous SP += 4. The research stack-word
pass recognizes the paired restore, crossing only notes and GCC's zero-code
VUNSPEC_BLOCKAGE epilogue marker. It retains the load's memory attributes and
requires exactly one restore paired with the saved register. No executable
inline assembly is introduced in the C source.

The rebuilt compiler passes the unchanged production full-ROM checksum. The
research guard checker accepts PUSH/POP, rejects absent/larger frames, missing
restores and unwind metadata, and leaves unannotated output unchanged. The
filter oracle additionally checks the saved word and neighboring stack canaries.
It now resolves the candidate entry from nm rather than assuming its address.

Although PUSH and POP match, the candidate still occupies 30 bytes versus 26:
its local literal forces four-byte section alignment, moving chk_adr_r2 from
080CF972 to 080CF974 and adding internal padding. This layout difference remains
unresolved. The shared byte-load prefix at 080CF970 and existing exported pool
at 080CF988 provide the next integration boundary to investigate. Production
remains unchanged; the filter remains research-only. Rebuild and verification
logs are retained in `.deps/address-filter-match/`.

### September 9: exact audio filter entry and shared literal recovered

The shared-literal plugin now supports explicit omit-pool-alignment. It removes
the old local word alignment only when every local literal has been replaced
by a shared reference, and rejects combining this option with zero-pool-padding.
It checks the expected alignment operation and rejects remaining local words.
Existing default behavior is unchanged.

The filter uses the existing gMPlayJumpTableTemplate word at lt_MPlayJumpTableTemplate
(080CF988). Removing its empty local pool alignment restores chk_adr_r2 to
080CF972 and reduces the candidate to exactly the original 22 instruction bytes.
All 206,592 oracle cases pass, including synthetic pool values, all return flags,
registers, actual linked entry, saved stack word and surrounding canaries. The
oracle checks the shared pool's alignment and forward Thumb literal range.
Production integration must retain an explicit linker range assertion.

The extended shared-literal checker passes 1,008 executions with default,
zero-padding and omitted-alignment modes. The omitted mode is exercised at a
two-byte-aligned entry. Sixteen invalid configurations are rejected, including
an attempt to omit alignment while retaining a local literal. The filter remains
research-only; next is production integration and verification of shared callers.
Evidence is retained under `.deps/address-filter-match/`.

The canonical shared-literal plugin rebuild also passes `make compare -j8`;
the existing production ROM remains byte-identical after this opt-in extension.

### September 9: shared audio address filter integrated

`src/m4a_address_filter.c` now replaces chk_adr_r2. The compare-order and
stack-word plugins/builders move to tools/arm-dispatch and are loaded only for
this object, alongside the shared-literal pass. The object ends on a two-byte
boundary; its preceding two-byte ldrb entry also retains two-byte section
alignment. The linker keeps the filter at 080CF972 and the shared literal at
080CF988 with an explicit forward-range assertion. The byte-load entry at
080CF970 and checked reader at 080CF98C remain at their original addresses.

`make compare -j8` passes the complete ROM checksum. The production filter
oracle passes 206,592 cases. The checked-reader and jump-table oracles now load
the production ROM for their candidate machine so calls execute the integrated
filter: 180,224 reader cases and 3,072 jump-table cases pass. Installed stack-word
and comparison-order guard tests pass. The linked filter contains 22 Thumb
bytes, with no mappings outside input sections.

Inventory is 469 main C files, 596 inline sites (252 register bindings, 336
empty constraints, one directive-only template, seven instruction templates).
Assembly entry markers remain 32 because this filter used a global label rather
than the counted entry macro. The remaining byte-load entry, audio engine,
naked fallback, embedded/transfer code and full executable classification remain
unfinished. Evidence is under `.deps/address-filter-match/`.

### September 9: multiply-high ARM C candidate verified

`research/audio/multiply_high.c` expresses the ARM half of umul3232H32 as a
64-bit unsigned product in r2/r3 and returns its high word in r0. The original
Thumb entry at 080CF4B8 uses ADR/BX to enter ARM code at 080CF4BC. That entry is
retained in the research execution fixture; it has not been decompiled here.
The generated 12-byte ARM body matches UMULL r2,r3,r0,r1 and BX LR, but emits
MOV r0,r3 instead of the original non-flag-setting ADD r0,r3,#0.

The oracle passes 41,984 cases: a Cartesian product of twelve boundary/bit-pattern
values plus 512 seeded full-width operand pairs, all sixteen NZCV states,
both direct ARM and original Thumb entries, and ARM/Thumb return modes. It
checks high/low product halves, r0-r12, SP, return PC/mode and preserved flags.
Two of three instruction words match; the exact-byte gate remains unsatisfied.
This is research-only and production remains at `4333424a`. Reproducible source,
oracle and results are under research/audio and `.deps/audio-multiply-match/`.
Next is the register-copy encoding, followed by integration that preserves the
interworking entry, and ultimately replacing that remaining assembly entry.

### September 9: matching multiply-high ARM body integrated

`src/m4a_multiply_high.c` now supplies the 12-byte ARM body at 080CF4BC.
The opt-in matching_copy_add_zero pass selects the existing ARM ADD pattern
with a zero immediate for distinct general-register SI copies. It validates
the replacement RTL and leaves flags unchanged. The installed guard checker
accepts the copy, rejects Thumb mode, absent copies and immediate-only returns,
and verifies unchanged unannotated output.

The original Thumb ADR/BX entry remains at 080CF4B8. Its ADR targets the end
of that assembly section, immediately followed by the C body; a linker ASSERT
ensures the ARM function starts four bytes after the public Thumb entry. The
following SoundMain assembly is split into its own section without relocation.
All three original ARM words match: UMULL, ADD #0, BX LR. The complete ROM
checksum passes and the production oracle passes 41,984 cases through both
entries and return modes, checking registers, SP and flags.

Inventory is 470 main C files, 598 inline sites (253 register bindings, 337
empty constraints, one directive-only template and seven instruction templates).
The linked C object contains twelve ARM bytes and the linked audit has no
orphan mappings. The assembly-marker count remains 32 because the public
Thumb entry remains assembly. Audio engine code, entry shims, naked fallback,
embedded/transfer code and complete executable classification remain unfinished.
Evidence is retained under `.deps/audio-multiply-match/`.

### September 9: audio byte-load entry integrated as C

`src/m4a_byte_load.c` replaces the final two-byte ldrb_r3_r2 entry at 080CF970.
Its C loads r3 through r2 and calls chk_adr_r2. The explicit adjacent-destination
option extends the existing guarded terminal-transfer pass: it requires one
specified destination, straight-line code and no retained trailing operations.
After existing terminal-path checks, it omits the transfer instruction. The
linker asserts the object is exactly two bytes and ends at chk_adr_r2, preventing
padding or reordering from breaking the continuation. The object uses two-byte
end alignment. Source and plugins contain no new instruction template for this.

The production oracle passes 49,152 cases over all bytes and NZCV states,
low-address rejection, EWRAM/IWRAM and both return modes. It checks raw byte,
SP, LR and flags on filter entry, then r0-r12, final flags, SP and return state.
The sequence-jump caller oracle now loads the production ROM for its candidate
machine and passes 32,832 cases. Fourteen unsupported tail contracts are rejected,
including conditional adjacent bodies, wrong destinations and incompatible
options. The default terminal transfer and unannotated output checks still pass.
`make compare -j8` passes the entire ROM checksum.

The source inventory is 471 C files and 600 inline sites (255 register bindings,
337 empty constraints, one directive-only template, seven instruction templates).
The linked object contains two Thumb bytes; no orphan mappings exist. Counted
assembly entry markers stay at 32 because the removed label did not use the
counted macro. Remaining audio engine, interworking shim, naked fallback,
embedded/transfer code and executable classification remain unfinished. Evidence
is retained under `.deps/audio-byte-load-match/`.

### September 9: multiplication interworking entry characterized

`research/audio/multiply_entry.c` uses an ordinary typed Thumb C call to the
integrated ARM multiply body. GCC emits a saved-LR call frame and the linker
adds a mode-switching veneer. The research wrapper occupies 24 bytes including
the veneer versus the original four-byte ADR/BX entry; its POP return clobbers
r1. It is relocated to 080E1000 for execution so its larger footprint cannot
overwrite the original ARM body.

The oracle passes 20,992 cases over boundary and seeded operand pairs, all NZCV
states and both return modes. Results, preserved registers, SP and return mode
agree; r1 differs and flags do not. No production code changed. Matching the
entry requires a frame-free interworking transfer with the original destination
address materialization. Evidence is in `.deps/audio-interwork-match/`.

The user asked how close the full goal is. A full ROM checksum and an entry-marker
count cannot establish overall C completion: remaining functions vary greatly
in size and some executable regions are not marked as functions. Prioritize a
size-weighted remaining-executable inventory to make progress reporting useful
without inventing a percentage or treating inherited work as new contributions.

### September 10: reproducible size-weighted ownership inventory

`scripts/audit_code_ownership.py` regenerates docs/code-ownership.json and .md
from fresh source and linked-code audits of the main ELF and expanded mgfembp
ELF. It partitions mapped ARM/Thumb bytes by source ownership, checks the totals
against the complete mapped-instruction denominator and rejects orphan mappings.
Runtime archives and C objects containing detected instruction templates/naked
markers are explicitly separate categories. All known owners resolve.

Main-ROM mapped instruction bytes total 777,630: 719,132 in C-owned objects
without detected instruction templates (92.48%), 33,870 in mixed C objects,
2,836 in assembly sources, and 21,792 in runtime archives. The main assembly
inventory is dominated by m4a_1.o (2,132), startup (340), transfer bootstrap
(200), BIOS wrappers (100), arm_call.o (48), arm.o (12) and header entry (4).
The 200 transfer bytes already have ARM mappings despite residing in .data;
they must not be added again as unmarked code.

The expanded payload contains 25,716 mapped instruction bytes: 18,148 C-owned,
6,330 mixed C (hardware.o), 418 assembly and 820 runtime archive bytes. Its stored
compressed bytes are not added to the instruction denominator. Main mixed C
objects are unitlistscreen, eventinfo, m4a, hardware and sio_multiboot_wait.
Their whole-object sizes deliberately overinclude C and are not an estimate of
remaining assembly. Follow-up classification must isolate their instruction
sites and runtime-library provenance, and address mapping blind spots before
claiming a full decompilation percentage. These totals include inherited work.

Validation: the main-ROM checksum and all three embedded payload comparison
targets pass. Inventory was regenerated after those checks. Production source
is unchanged by this measurement milestone.

### September 10: inline assembly narrowed to verified instruction regions

`scripts/audit_inline_regions.py` verifies all seven main-ROM and one payload
instruction-template sites against source markers, function symbols, expected
opcodes and mapped-region ownership. Its source inventory cross-check rejects
new or removed inline sites; symbol bounds, overlapping regions, unknown mapping
kinds and changed expected opcode bytes also fail. ELF/map fingerprints identify
the measured build. The naked fallback is measured by its full symbol extent
but only ARM/Thumb mapped bytes enter the instruction count.

Main inline assembly contributes 410 instruction bytes: 396 in the 436-byte
UnitList_PageChangeIn_Loop body (40 bytes are literals/alignment), four NOP bytes
in StartAvailableTileEvent, two SWI bytes each in EnterSleepMode and
MusicPlayerJumpTableCopy, and six bytes for the PC read and calibrated loop in
MultiBootWaitCycles. The expanded payload contributes one two-byte SWI in
func_02011F4C. These are verified sites, not whole containing-object estimates.

Combined with mapped assembly-source instructions, known non-library assembly
is 3,246 bytes in the main image and 420 bytes in the payload. Runtime archive
classification (21,792 main and 820 payload bytes), hidden-code/mapping gaps and
other completion requirements remain open. The ownership audit now regenerates
and checks these refined totals. No production source changed in this milestone.

### September 10: runtime archive provenance and assembly reproduction

`scripts/audit_runtime_sources.py` checks the local agbcc source pin
`da598c1d918402c42c0c0d7128ba14567f3175e9`, fingerprints installed archives,
locates every linked member's candidate source and verifies each selected file
against that pinned git content. The ownership ELF fingerprints must match the
current images before their mapped-byte counts are used.

The six lib1thumb.asm members (_udivsi3, _divsi3, _umodsi3, _modsi3, _dvmd_tls,
_call_via_rX) are preprocessed with the recorded member selector and assembled
in an isolated output directory. Every .text section matches the corresponding
installed archive member byte-for-byte. Their linked instruction contribution
is 726 bytes in each image; complete text sizes include additional padding.

All other linked archive members have located C sources: 21,066 main-ROM bytes
and 94 payload bytes. This is source attribution, not an exact C rebuild claim.
Allocator members map to macro-selected mallocr.c variants; floating-point
members map to fp-bit-base.c variants; other libgcc helpers map to libgcc2.c.
The 1,014-byte main syscalls.o comes from C containing inline assembly and
requires further instruction-level classification. Header/macro dependencies and
matching builds remain to be verified before runtime C completion is credited.

The readable report and machine-readable fingerprints are in
`docs/runtime-source-inventory.md` and `.json`. No production code or installed
archive was changed; isolated rebuild artifacts are in `.deps/runtime-audit/`.

### September 10: SoundMain setup arithmetic characterized in C

`research/audio/soundmain_setup.c` models the scanline deadline and DMA-buffer
selection used before SoundMain enters SoundMainRAM_Buffer. It keeps unsigned
32-bit wraparound explicit for counter-1, period-counter and sample multiplication;
integer address arithmetic avoids pretending wrapped addresses remain within a
C buffer object. The deadline is zero for maxLines=0, otherwise it adds VCOUNT
with 228 added when VCOUNT is below 160.

The oracle runs the original SoundMain until RAM mixer entry and compares those
values with the compiled C model. Its 21,504 cases cover all byte counters and
VCOUNT values, selected zero/boundary periods and sample counts, all-zero/all-set
entry flags and optional/no optional callback. Callbacks are stable test stubs.
It verifies optional callback context, subsequent CgbSound ordering, ident's
lock increment, original r0/r4, r5/r6/r7/r8 setup, the deadline stack slot and
64-byte mixer frame. C modeling does not modify SoundInfo. Production is unchanged.

This does not claim a full matching SoundMain replacement or mixer verification.
The real deadline is computed before callbacks while buffer selection occurs
after them; mutations across callbacks must be preserved in subsequent work.
The full custom frame, transfer and original instruction encoding also remain.
Reproducible source and oracle are under research/audio; evidence is retained
under `.deps/soundmain-setup/`.

### September 10: SoundMain callback mutation and rejection semantics verified

The C research model now separates deadline computation from buffer selection
and adds SoundMainEntryModel. It validates the ID, sets the lock, computes the
deadline, calls the optional context callback, loads/calls the current CgbSound
callback with the private SoundInfo argument, then selects the buffer. It retains
the original SoundInfo pointer rather than reloading the mutable global pointer.
The output array records mixer inputs, not the original private frame or flags.

The new oracle passes 600 valid-entry cases with stable/optional/Cgb/both callback
mutations and 1,800 locked/invalid-ID cases. Callback mutations exercise DMA
counter, period, sample count, maxLines and ident changes, replacement of the
Cgb callback, and replacement of the global SoundInfo pointer. It compares full
sound memory, callback addresses/arguments/lock observations, global pointer,
and mixer inputs. Rejected entries call no callbacks and leave memory/output
unchanged. Deadline uses the pre-callback maxLines while buffer geometry uses
post-callback fields. Both versions execute stub callback code with controlled
shared-memory mutations supplied by the harness.

The previous 21,504 arithmetic cases still pass after factoring the phases;
that oracle now resolves its C entry symbol instead of assuming function order.
This is not a full machine-state match: custom stack/register transfer and flags
remain to be reproduced, and mixing remains unverified. No production code
changed. Evidence is under `.deps/soundmain-setup/`.

### September 10: SoundMain private frame verified through mixer return

`research/audio/soundmain_frame.h` records the 64-byte mixer-entry frame:
six scratch/deadline words, saved SoundInfo, saved r8-r11, saved r4-r7, and LR.
The sound pointer is at +24 and the return address at +60; target compilation
checks those offsets and total size. The header is included by the C setup model.
No claim is made that GCC yet emits this frame for a complete C replacement.

`check_soundmain_frame.py` copies the original 0x400-byte RAM mixer exactly as
SoundInit does, then runs the original full SoundMain entry through its return.
All 6,912 cases pass across six sample sizes (including all four-byte remainders
within a sixteen-byte block), four DMA counters, three channel counts, three
deadline settings, four VCOUNT positions, four incoming register/flag patterns
and both ARM/Thumb return modes. Reverb is disabled and all channels inactive.
The hook checks all sixteen frame words, including untouched scratch slots.
The final checks verify exact stereo clearing, unchanged surrounding sound
memory, lock release, SP and stack canaries, r4-r11 restoration, and the original
r0-r3 return values (saved r8-r10 and return address).

The mixer discards 28 frame bytes, pops saved high/low registers together,
restores r8-r11 from r0-r3, and pops the return address into r3 before BX.
This establishes the frame/transfer target for matching code generation. Active
channel mixing, reverb, timing-exit paths and a full C replacement remain open.
Evidence is in `.deps/soundmain-setup/frame-report.json` and frame-oracle.log.
Production remains unchanged.


### September 10: reverb arithmetic and ordered buffer access recovered in C

`research/audio/soundmain_reverb.c` models the ARM reverb block at 080CF558,
ending before 080CF5DA. Counter 2 selects the base PCM buffer as source;
other counters select output plus sample count. Each iteration reads four
signed bytes, multiplies their sum by strength, shifts arithmetically by nine,
then increments if result bit 7 is set. This includes positive results >=128;
it must not be reduced to a negative-value rounding rule. Right and left byte
stores follow the four reads. Volatile accesses preserve overlap behavior.

`check_soundmain_reverb.py` compiles the model with the installed GCC and runs
6,792 comparisons against the SHA-1-verified original ROM block. It covers all
256 strengths with constant signed-byte boundaries, a byte ramp and seeded
random data. Nine selected strengths additionally exercise eight layouts,
including source/output overlap, offsets 1 and 1583, sample counts up to 528,
and counters 0, 1, 2, 3 and 255. All final buffer memory and ordered byte reads
and writes match. Write-hook values are masked to access width because Unicorn
reports the whole source register even for STRB; upper discarded bits are not
claimed to match. The C function also preserves its ABI callee-saved registers
and stack pointer.

The model is 112 ARM bytes and is not a matching private-block replacement.
GCC uses different registers, a pointer-end loop instead of the original signed
countdown, and tests the corresponding pre-shift bit. Its normal LR save/return
also differs from the original intra-mixer transfer. Zero/negative counts,
private register outputs, flags and full channel mixing are outside this check.
The next work is matching code generation and integration, not additional C
coverage credit for this semantic model. Production remains unchanged.
Evidence: `.deps/soundmain-reverb/report.json`, candidate ELF/binary and
`.deps/soundmain-reverb-run.log`.


### September 10: reverb private register state reproduced by C

`research/audio/soundmain_reverb_private.c` expresses the calculation using
its original r0/r1 scratch values, strength r3, count r4, output r5, width r6,
source r7 and sample count r8. Empty register constraints prevent invariant
copies into otherwise preserved registers; they emit no instructions. Reversing
the commutative C multiply operands produces the original MUL operand encoding.
The compiler emits no stack frame for this candidate.

The reverb oracle's `--private` mode passes 6,792 cases comparing both versions
before their terminal transfers: original 080CF5A4 and candidate's terminal
BX LR. In addition to full buffer memory and all ordered accesses, it compares
r0-r12, LR, NZCV, processor mode and SP, and checks 256 stack bytes below SP plus
a sixteen-byte upper canary remain untouched. Positive sample counts are the
supported domain; the unsigned C decrement followed by signed comparison is
not asserted equivalent to the original SUBS/BGT for arbitrary signed-overflow
inputs. The ordinary semantic-model mode still passes its 6,792 cases.

The candidate occupies 88 bytes including BX LR, versus the original 76-byte
calculation plus eight-byte ARM-to-Thumb transfer. The remaining calculation
differences are separate LDRSB/ADD instead of post-index LDRSB, separate SUB/CMP
instead of SUBS, and the resulting backward-branch displacement. Matching the
original transfer remains necessary. No production code or C coverage changed.
Evidence: `.deps/soundmain-reverb/private-report.json`, private.o/elf/bin and
private-oracle.log. No compiler plugin or generated assembly substitution was
introduced for this candidate.


### September 10: original reverb post-index load generated from C

The opt-in `matching_byte_postincrement` rule in
`tools/arm-dispatch/byte_postincrement.cc` combines an adjacent signed/unsigned
byte load and base-pointer increment into GCC's existing ARM post-index load
pattern. It requires distinct general destination/base registers, a QI memory
operand and an exact +1 update. It copies the memory attributes including
volatility, adds the register-increment note, and never crosses another
instruction, memory operation, label or transfer. It rejects non-ARM use and
annotated functions without an eligible pair. Unannotated functions are untouched.
The installer builds against the pinned installed GCC 16.2.0 plugin headers.

`check_byte_postincrement.py` passes 8,192 executions spanning every signed
and unsigned byte and all sixteen incoming NZCV combinations. It verifies the
exact eight-byte fixture (post-index load plus BX LR), r0-r12, LR, flags, SP,
return PC and unchanged memory. Seven unsupported cases reject: Thumb, word
load, increment two, decrement, missing update, asm barrier and intervening
volatile store. Unannotated object bytes match with and without the plugin.

The private reverb candidate opts in only under `REVERB_POSTINCREMENT`;
`check_soundmain_reverb.py --private --postincrement-plugin ...` passes all
6,792 original comparisons with memory, access order, registers, flags and
stack checks. Its first 68 bytes match the original calculation exactly.
The candidate is now 84 bytes including placeholder BX LR. The original is
76 calculation bytes plus an eight-byte ARM-to-Thumb transfer. SUB/CMP still
needs to become the original SUBS, which also changes the backward branch
encoding; the original Thumb transfer remains to be generated. Production is
unchanged and this candidate receives no integrated coverage credit.
Evidence: `.deps/soundmain-reverb/private-postincrement-report.json`, matching
candidate ELF/binary, private-postincrement-oracle.log and postincrement-guards/.


### September 10: all 76 reverb calculation bytes generated exactly

The private model's opt-in countdown condition is `(s32)reverbCount-- > 1`.
This compares the old signed count with one, which reproduces SUBS/BGT even
at signed overflow. Comparing the wrapped new count with zero does not do so.
The unannotated research variant retains the previously verified positive-count
form; no production behavior is changed.

`matching_subtract_compare` in `tools/arm-dispatch/subtract_compare.cc` folds
three adjacent RTL operations: copy the old register to a dead temporary,
subtract a constant, then compare that temporary with the same constant. It
uses GCC's existing `subsi3_compare` pattern, computing exactly the same NZCV
for every 32-bit input. The rule requires ARM mode, distinct general registers,
a non-global temporary whose REG_DEAD note is present at the comparison,
CCmode, and a subtraction/compare constant in 1..255. It never crosses other
instructions or labels. A function must opt in and contain an eligible sequence.

`check_subtract_compare.py` passes 33,152 single-subtraction/branch executions
for constants 1, 2, 127 and 255, all sixteen incoming NZCV patterns, all byte
values, signed-overflow boundaries and seeded 32-bit values. It checks exact
SUBS/BGT/BX bytes, updated count, other registers, flags, SP/LR and branch choice.
Thumb, mismatched comparison, asm barrier, live old value and missing subtraction
are rejected; unannotated object bytes are unchanged with the plugin loaded.

The reverb oracle with both plugins verifies all 76 calculation bytes against
the original ROM and passes its 6,792 full memory/access/register/flag cases.
The candidate is now 80 bytes: the exact calculation followed by a placeholder
BX LR. The original adds an eight-byte ARM-to-Thumb transfer instead. Generating
that transfer and integrating the block remain required; production C coverage
is unchanged. Evidence: `.deps/soundmain-reverb/private-subtract-report.json`,
private-subtract-oracle.log, candidate ELF/binary, subtract-guards.log and the
standalone subtract-guards directory.


### September 10: full reverb block integrated, including copied-RAM transfer

`src/m4a_reverb.c` now replaces all 84 bytes at 080CF558..080CF5AC with compiled
C: the 76-byte calculation and original ADD r0,PC,#47 / BX r0 transfer. The C
source materializes the continuation function address in its private r0 and
makes an indirect sibling call. The opt-in `pc_address` plugin lowers its sole
symbol-pool load to an explicit PC-relative backend operation; the ordinary
compiler generates BX. No instruction template or ROM byte array was added.
The pinned compiler was rebuilt and dependent production plugins regenerated.

The linker asserts the C block follows the dispatch boundary, has exactly 84
bytes, and the Thumb continuation address equals block start +76+8+47. It also
checks the copied mixer remains 932 bytes. The split assembly preserves the
original two-byte zero padding before the ARM block. A local boundary label is
used for Thumb ADR; its no-reverb branch skips the link-checked 84-byte C block.
The assembly SoundMainRAM symbol now describes its twelve-byte dispatch prefix;
SoundMainRAM_End records the complete mixed-source span. Hardware behavior and
all ROM bytes are unchanged.

`make compare -j8` passes for the complete 16 MiB ROM. The reverb oracle's
`--production` and `--production --copied-ram` modes each pass 6,792 cases,
including the ARM-to-Thumb transfer. Both compare actual production code against
the original ROM, with exact full buffer memory, ordered byte accesses, r0-r12,
LR, NZCV/mode, SP and untouched stack canaries. The copied mode copies the same
0x400-byte mixer span as SoundInit before entering its reverb block. These checks
cover positive counts, signed byte boundaries, overlapping buffers and all
strengths; downstream active-channel processing remains outside their scope.

The PC-address rule passes 96 executions at six offsets with every incoming
NZCV, six invalid compiler configurations, twelve deliberately displaced target
link failures, and unchanged unannotated output. The new compiler also passes
the byte-load rule's 8,192 cases and subtraction rule's 33,152 cases. Production
and guard evidence is under `.deps/soundmain-reverb/`.

The refreshed ownership audit has the same 777,630 mapped main instruction bytes:
719,216 C-owned (92.49%), 33,870 in C objects with assembly, 2,752 assembly-source,
and 21,792 runtime-archive bytes. The reverb integration moves 84 bytes from
assembly to C. Reviewed non-library assembly is now 3,162 main instruction bytes
plus 420 payload bytes. Source inventory: 472 main C files, 32 assembly entry
markers, 609 inline sites (263 register bindings, 338 empty templates, one
directive-only and seven instruction templates). The overall goal remains
unfinished; setup/frame generation and remaining channel mixing are next.


### September 10: channel deadline, envelope and loop preparation recovered in C

`research/audio/soundmain_channel.c` models the original channel loop from
080CF5E4 through its three boundaries: skip/stop at 080CF8CC, whole-mixer deadline
exit at 080CF8D6, or ARM sample-mixing entry at 080CF6E4. It records the remaining
channel count before checking the deadline, performs status transitions and
attack/decay/sustain/release/echo processing, computes stereo envelope volumes,
and prepares the loop pointer and length in the private frame.

The inactive mask is 0xC7. A new channel starts in attack with its wave pointer,
sample count and fractional position reset; wave status bits 0xC000 enable
looping. A simultaneous start/stop flag stops immediately. Echo length zero
wraps to 255 but still stops, just like length one; only old values >1 continue.
Attack reaching exactly 255 saturates and advances phase. Release and decay use
unsigned products shifted by eight, preserving equality behavior at echo and
sustain thresholds. Master volume uses byte offset seven of SoundInfo, and
stereo outputs retain the original byte truncation even for oversized volume
settings. Loop length subtraction and loop pointer addition retain 32-bit wrap.

`check_soundmain_channel.py` compiles the model and compares it with the SHA-1-
verified original code. All 31,232 cases pass: 9,819 skip/stop, 13,739 mix and
7,674 deadline exits. The grid covers every status byte, seven envelope boundary
values, eight envelope/volume vectors, every VCOUNT byte and eleven deadline
values. Wave cases include loop bits, zero sizes and wrapping loop descriptors.
The harness compares full SoundInfo/channel/wave memory and all 64 private frame
bytes, as well as the selected outcome; it checks the model's callee-saved
registers, SP and upper stack canary. Wave storage and channel storage are
separate in these fixtures.

This is a semantic model only. It does not reproduce private register outputs,
flags, exact memory-access order or instruction bytes, and does not execute
sample mixing or mixer return. Production and its verified coverage remain
unchanged. Evidence: `.deps/soundmain-channel/report.json`, candidate ELF/binary,
and `.deps/soundmain-channel-run.log`.


### September 10: fixed-rate packed sample mixing recovered in C

`research/audio/soundmain_fixed.c` models the type-bit-8 sample path beginning
at 080CF6E4 through the shared Thumb channel-loop continuation at 080CF8CC.
The model processes four output lanes per packed word, rotates the existing
word right by eight, and adds the signed sample times the sixteen-bit-shifted
stereo volume after masking bits 16..23. Arithmetic wraps as unsigned 32-bit;
this is not equivalent to an independently clamped byte mixer.

When source count reaches zero, a positive loop length reloads the loop source
and count, including at word and buffer boundaries. Without a loop, the model
clears channel status, rotates the partially accumulated word by the remaining
lane count, stores both stereo words, and leaves stored cp/ct unchanged. Only
a continuing channel saves its new source pointer and count. This matches the
original optimized group loop and its short-source path without copying their
instruction-level pointer/carry control structure.

`check_soundmain_fixed.py` passes 10,080 comparisons against the hash-verified
original ROM: 944 stopped and 9,136 continuing channels. It covers six output
sizes (4..528), fifteen source counts including 1..5 and buffer boundaries,
seven loop lengths including zero and repeated one-byte loops, all combinations
of four stereo-volume boundary values, constant signed-byte boundary patterns,
a byte ramp and seeded data. All sound/channel/output memory and private frame
bytes with surrounding canaries match. The C model preserves its ABI registers
and stack pointer; the original restores r8 and transfers back to Thumb.

Scope requires positive output counts divisible by four, aligned output words,
positive initial source counts and positive active loop lengths. Source/output
aliasing, private register/flag equivalence, access ordering, the resampling path
and full mixer return are not claimed. This is research only; production C
coverage remains unchanged. Evidence: `.deps/soundmain-fixed/report.json`,
candidate ELF/binary and `.deps/soundmain-fixed-run.log`.


### September 10: fractional resampling and loop overshoot recovered in C

`research/audio/soundmain_resample.c` models the non-fixed-rate path from ARM
sample entry through its Thumb continuation. It forms the step from the low
32 bits of divFreq*frequency, interpolates between signed source bytes using
the original wrapped product and arithmetic shift by 23, and uses the same
packed stereo accumulation as the fixed-rate model.

After each output sample, the updated fraction determines the integer advance.
The original mask clears only bits 23..29, retaining the top two bits; the model
preserves this even for extreme fractional inputs. A single-source advance reuses
the already-read next byte. Larger advances skip source bytes. When an advance
crosses the end, repeated loop-length additions determine the positive remaining
count and loop overshoot index. With no loop, the current packed word is finished
and channel status cleared without saving cp/ct/fw. Continuing channels save all
three fields, with cp pointing to the current byte rather than the lookahead.

`check_soundmain_resample.py` passes 6,912 original/C comparisons: 1,066 stopped
and 5,846 continuing. The grid includes four output sizes, six source counts,
four loop lengths, eight initial fractions and nine steps from zero through
0xFFFFFFFF. Four odd divFreq values and modular-inverse frequency values produce
the requested wrapped steps. Stereo volumes and constant/ramp/seeded source and
output patterns exercise signed interpolation and packed overflow. Output and
all channel/sound/frame memory match. The original's saved r4/r12 words below the
frame are checked separately, with surrounding canaries; the C model preserves
its ABI registers and SP. Both return to their expected boundaries.

The supported geometry has aligned output words, positive output counts divisible
by four, positive source counts and positive active loop lengths. The fixtures
use distinct source/output storage. This does not establish private register,
flag, memory-access-order or instruction equivalence, nor execute the full mixer
return. Production coverage is unchanged. Both sample paths now have semantic
models; matching their code generation and composing them with channel/setup
logic remain unfinished. Evidence: `.deps/soundmain-resample/report.json`,
candidate ELF/binary and `.deps/soundmain-resample-run.log`.


### September 10: recovered SoundMain pieces verified as complete calls

`research/audio/soundmain_complete.c` composes the entry, reverb, channel,
fixed-rate and resampling models into a complete semantic SoundMain call. It
retains the initial SoundInfo pointer across callbacks, handles buffer clearing
or reverb, caches divFreq for channel processing, checks the deadline before
each channel, and releases the original SoundInfo lock after mixing or a
deadline exit. A zero maxChans value still visits one channel, as the original
do/while structure does. The no-reverb clearing model is scoped to sample
counts >=16 divisible by four.

`check_soundmain_complete.py` compiles all six C components together and compares
full calls with the original entry and its copied 0x400-byte RAM mixer. All 3,528
cases pass: 3,456 valid entries and 72 invalid/locked entries. An execution hook
confirms 1,728 of the valid calls take the original deadline-exit branch.
Synthetic VCOUNT schedules deliberately produce exits before the first channel
and after two channels; they are read-driven test schedules, not cycle timing.

The grid covers four sample sizes, maxChans 0/1/4/12, three DMA counters, three
reverb strengths, optional callbacks and four callback-mutation policies.
Channels mix fixed and resampled types with attack, decay, sustain, release,
echo, start/stop and inactive states. Callbacks can change sample geometry,
master volume, maxLines, a channel status, the Cgb callback, lock value and the
global SoundInfo pointer. The model and original agree on complete 64 KiB sound/
wave/output test memory, global pointer, callback addresses/arguments/observed
locks, and VCOUNT read sequences. Both preserve r4-r11 and SP, leave the upper
stack canary untouched, and return correctly in ARM and Thumb modes.

This proves composition within the fixtures' valid mapped-wave and buffer
geometry. It does not establish matching private stack layout, scratch registers,
flags, audio access order or execution timing, nor multi-frame lifecycle behavior.
No production code changed. Matching code generation for SoundMain and the
remaining mixer is still required. Evidence: `.deps/soundmain-complete/report.json`,
candidate ELF/binary and `.deps/soundmain-complete-run.log`.


### September 10: packed fixed-rate inner loop generated as matching C

`research/audio/soundmain_packed_private.c` expresses the original loop at
080CF738 using its shared registers. It loads signed source bytes, forms the
masked stereo products, rotates and accumulates packed words, and uses
`__builtin_add_overflow` for the output pointer's +0x40000000 advance. The high
two bits encode the lane; carry exits after the remaining one to four samples.
Empty register constraints preserve the original allocation without emitting
instructions. No executable inline assembly was added.

GCC initially selected subtraction of a negative immediate for the carry update.
The opt-in `matching_add_carry` rule in `tools/arm-dispatch/add_carry.cc` selects
its existing addition/carry pattern for a matching negative-compare/add pair.
It requires ARM mode, general registers, a positive addend below 0x80000000,
and an adjacent LTU/GEU branch with dead condition flags. The branch predicate
is inverted when moving from CC to CC_C representation, preserving the machine's
BCC/BCS decision. Other instructions and barriers are not crossed. Some already-
matching additions use this same internal form and are accepted without changing
machine bytes. Unannotated functions remain untouched.

All 36 inner-loop bytes now match. `check_soundmain_packed.py` passes 18,432
original/C cases spanning every source byte, four initial lanes, six stereo
volume pairs and three packed-word pairs. It compares r0-r12 and full CPSR,
checks consumed source bytes and the final pointer, and verifies unchanged
source memory, SP/LR and stack canaries. Execution stops before the original
word stores and the C candidate's placeholder BX LR; candidate size is 40 bytes.

`check_add_carry.py` passes 116,032 scalar addition/branch checks for seven
immediates, both carry branch senses, all initial NZCV values, byte values,
signed-overflow boundaries and seeded 32-bit values. Exact ADDS/branch/BX bytes,
registers, flags, SP/LR and branch destinations agree with independent arithmetic.
Thumb, intervening asm, signed-overflow use and missing arithmetic reject;
unannotated object bytes are unchanged. Evidence is under
`.deps/soundmain-packed/` (report.json, oracle.log, add-carry-guards.log and fixtures).
Production remains unchanged; the continuation and integration are next.


### September 10: packed sample loop integrated into production mixer

`src/m4a_packed.c` replaces the 36-byte fixed-rate inner loop at 080CF738..080CF75C.
It consumes source bytes and exits on the output-pointer carry, then falls
through to the existing ARM word stores. No placeholder return remains.
The linker checks the C loop begins immediately after the word loads, contains
exactly 36 bytes, and ends at its ARM continuation. The whole copied mixer span
remains 932 bytes. `make compare -j8` passes for the complete ROM.

The opt-in `arm_adjacent` compiler rule validates and removes the otherwise
unnecessary LR-only save, terminal direct call, immediate LR restore and return.
It accepts local branches only when their targets remain before the terminal
call; it rejects extra calls, early-return bypasses, local stack use, executable
asm, non-void functions, debug/unwind and mismatched destinations. Empty register
constraints emit no instructions and remain allowed. This is an explicit private
continuation contract with mandatory linker adjacency, not a general external-
call optimization. Preserving incoming LR matters because the mixer uses it as
a remaining-sample counter in this path.

The production packed-loop oracle passes 18,432 cases from ROM and another
18,432 after copying the mixer to RAM, with all 36 bytes exact and matching
r0-r12, flags, source consumption, final pointer and unchanged source/stack.
The 3,528 complete SoundMain cases also pass against the production engine,
including active fixed/resampled channels, reverb, mutating callbacks, 1,728
forced deadline exits and ARM/Thumb returns. The continuation rule passes 160
standalone executions, eleven compiler rejection cases, two displaced-target
link failures and unchanged unannotated object output.

The refreshed ownership inventory moves 36 instruction bytes from assembly to C:
719,252 main instruction bytes are C-owned, 33,870 belong to C objects with
assembly, 2,716 to assembly sources and 21,792 to runtime archives. The total
remains 777,630 and rounded C-owned share remains 92.49%. Reviewed non-library
assembly is now 3,126 main bytes plus 420 payload bytes. There are 473 main C
files and 619 inline sites (271 register bindings, 340 empty templates, one
directive-only and seven instruction templates); the 32 assembly entry markers
remain. Both ownership totals and source totals include inherited community work.
Evidence: `.deps/soundmain-packed/production*.json`, production-build.log,
adjacent-guards.log, and `.deps/soundmain-complete/production-report.json`.
The outer fixed-rate loop, resampled mixer, channel preparation and original
SoundMain private frame still need matching C integration.


### September 10: packed C block expanded to include stereo loads and stores

`src/m4a_packed.c` now covers 52 bytes at 080CF730..080CF764, adding the two
stereo word loads and two stores around the already matching 36-byte inner loop.
An empty post-loop constraint keeps the computed words in r6/r7 for their stores.
The right-side address advances by four through the original post-index store.
The C block falls through to `SoundMainRAM_PackedAdvance`, where the existing
assembly updates the remaining count and selects the next group. The linker
asserts the new 52-byte size, entry boundary and continuation adjacency.
No compiler rule or instruction template was added for this extension.

`make compare -j8` passes. `check_soundmain_packed_word.py` verifies both linked
symbol extent and all 52 original bytes, then passes 18,432 production/original
executions in ROM and another 18,432 after copying the mixer to RAM. It covers
every source byte, stereo-volume and initial-word boundaries, and source data
separate from output or overlapping the right word, its unaligned +1 position,
or the left word. Each case compares the eight ordered memory accesses, all
source/output memory, r0-r12, CPSR, final pointers, incoming LR and stack canaries.
The production mixer again passes all 3,528 complete SoundMain calls, including
1,728 forced deadline exits.

The extension moves another 16 instruction bytes from assembly to C. The audit
now reports 719,268 main C-owned instruction bytes, 33,870 in C objects with
assembly, 2,700 assembly-source bytes and 21,792 runtime bytes, with the same
777,630 total and rounded 92.49% C-owned share. Reviewed non-library assembly is
3,110 main bytes plus 420 payload bytes. The source count remains 473 C files;
inline sites are 620 (271 register bindings, 341 empty constraints, one directive
and seven instruction templates). Remaining outer-loop and channel/frame work
is not credited as complete. Evidence: `.deps/soundmain-packed/word-production*.json`,
word-production-build.log, word-ownership.log, and the refreshed complete-call
production report under `.deps/soundmain-complete/`.


## September 10, 2026 — packed outer countdown integrated (60 bytes)

Baseline: `e42c080c`. `src/m4a_packed.c` now owns the original 60-byte span
at 0x080CF730 through 0x080CF76C, adding the SUBS r8,4 / BGT word-load pair.
The C outer loop saves the old remaining count, subtracts four with unsigned
wrap, and repeats when the old count interpreted as signed exceeds four.
Comparing the wrapped result against zero would differ at signed overflow.
The existing opt-in subtract/compare compiler rule generates the original
flag-setting subtraction. No new instruction templates or compiler rules were
introduced. The linker checks the 60-byte extent and adjacent ARM continuation
`SoundMainRAM_PackedFinish`; the remaining count-plus-LR and finish branch stay
in assembly. The complete original 932-byte mixer span is preserved.

`make compare -j8` passes for the full ROM. The extended packed-word checker
with `--outer` passes 18,432 production/original cases from ROM and 18,432 after
copying the mixer to RAM. Counts rotate through 0, 1, 2, 3, 4, 5, 7, 8, 9, 12,
20, 528, 0x80000000, 0x80000001 and 0xffffffff; these exercise one through 132
word iterations, partial-count rounding, underflow and signed-overflow exits.
Each case checks source/output pointers, final count, ordered reads and writes,
full test memory, r0-r12, CPSR, untouched SP/LR and stack canaries. Source-byte,
volume and initial-word combinations include overlapping right/left output
and an unaligned source. Counts are distributed across those combinations,
not an exhaustive Cartesian product. The production SoundMain composition
regression again passes 3,528 calls, including 1,728 forced deadline exits.

Regenerated ownership reports show 719,276 C-owned main instruction bytes,
33,870 in C objects with assembly, 2,692 assembly-source bytes and 21,792 runtime
bytes out of 777,630 total. The rounded C-owned share remains 92.49%; this is
not overall completion. Reviewed non-library assembly is 3,102 main bytes and
420 expanded-payload bytes. Source counts remain 473 C files, 32 entry markers
and two manual assembly declarations; inline sites total 621 (272 register
bindings, 341 empty constraints, one directive and seven instruction templates).
The broader audio frame/channel integration and runtime rebuild work remain
unfinished. Evidence: `.deps/soundmain-packed/outer-build.log`,
`outer-production.json`, `outer-production-ram.json`, `outer-source-audit.json`,
and `.deps/soundmain-complete/production-report.json`.


## September 10, 2026 — short-sample arithmetic integrated (36 bytes)

Baseline: `c40beefc`. `src/m4a_short.c` replaces the nine ARM instructions
at 0x080CF774 through 0x080CF798: stereo word loads followed by the signed
sample load, two volume multiplies, masks and packed rotated additions. The
existing adjacent-continuation rule removes the compiler's private call frame
and falls through to `SoundMainRAM_ShortCount`. No new compiler rule or
instruction template was needed. The linker checks the entry, 36-byte extent
and continuation adjacency. The shared `SoundMainRAM_ShortMix` symbol is fixed
at entry + 8, after the two loads; the assembly carry branch targets that symbol.
Its offset is verified against original instruction bytes and executed directly
by the new checker, including every packed address lane. These boundary/offset
contracts must be retained when changing the C block.

`make compare -j8` passes. `research/audio/check_soundmain_short.py` passes
92,160 production/original cases from ROM and 92,160 after copying the mixer
to RAM. Each mode covers 18,432 word-load entries and 73,728 shared entries.
The Cartesian combinations cover all signed source bytes, four source positions
(separate, right output, unaligned right+1 and left output), six volume pairs,
three initial word pairs, and all four lanes at the shared entry. The checks
compare ordered memory reads and r0-r12, and require unchanged flags, all test
memory, output pointer, SP/LR and stack canaries. The source pointer advances
exactly one byte. Full production SoundMain still passes 3,528 composed-model
checks, including 1,728 deadline exits. These tests do not establish cycle timing.

The audit moves 36 bytes from assembly to C: 719,312 main C-owned instruction
bytes (92.50% rounded), 33,870 in mixed C objects, 2,656 assembly-source bytes
and 21,792 runtime bytes, total 777,630. Main m4a_1.o has 1,952 instruction
bytes remaining. Reviewed non-library assembly is 3,066 main bytes plus 420
payload bytes. There are 474 C files, 32 assembly entry markers, three manual
assembly function declarations and 631 inline sites (280 register bindings,
343 empty constraints, one directive, seven instruction templates). The extra
assembly declaration and ARM directive name a split continuation; they do not
represent newly introduced instructions. Short-sample countdown/loop selection,
partial-word completion, resampling and the broader private frame/channel work
remain incomplete. Evidence: `.deps/soundmain-packed/short-build.log`,
`short-production.json`, `short-production-ram.json`, `short-source-audit.json`,
`short-ownership.log`, and `.deps/soundmain-complete/production-report.json`.


## September 10, 2026 — partial-word completion integrated (36 bytes)

Baseline: `ba987283`. `src/m4a_partial.c` replaces the nine ARM instructions
at 0x080CF7FC through 0x080CF820. It stores the channel status byte, extracts
and clears the packed output-address lane, computes the remaining rotation,
rotates both stereo words, writes left then right and advances the output.
The fixed-rate and resampled stop paths share this entry. The existing adjacent
continuation rule leaves the branch to mixer restoration in assembly. Linker
assertions require the original boundary, 36-byte extent and adjacency.

Each volatile packed register is captured once before expressing the rotate;
otherwise GCC treats its two reads as separate values and emits shifts/ORs.
The complementary shift is masked to keep the zero-rotation case defined in C.
GCC produces the original ROR instructions. A new opt-in
`matching_word_postincrement` pass combines only an adjacent SI register store
and base += 4 into GCC's existing POST_INC store pattern. Both registers must
be distinct r0-r12; MEM volatility and alias attributes are retained, flags
are unchanged and no intervening operations or labels are crossed. There is
no new backend instruction template. The Makefile builds the pinned plugin
and applies it only to this production object.

`check_word_postincrement.py` passes 37,056 baseline/folded execution comparisons:
386 boundary/byte-pattern/seeded words, three aligned memory locations (including
the last mapped word), sixteen NZCV states and both return modes. Registers,
full memory and the one ordered write agree. Nine invalid forms are rejected
(Thumb, byte store, step eight, decrement, missing update, memory barrier,
same base/value register, offset store and load); unannotated output is unchanged.

`make compare -j8` passes for the full ROM. `check_soundmain_partial.py` passes
30,720 cases from ROM and another 30,720 after copying the mixer to RAM. It
covers all four packed lanes, all status bytes with varied upper bits, five
channel positions including overlap with each output word, and six boundary/
seeded packed-word pairs. Besides original/production comparison, an independent
expected-state calculation checks the three ordered writes, rotated words,
output increment, complete memory, r0-r12, unchanged flags and SP/LR/canaries.
The production SoundMain composed-model regression passes all 3,528 calls,
including 1,728 deadline exits. Cycle timing is not established by these checks.

The refreshed audit reports 719,348 C-owned main instruction bytes (92.51%
rounded), 33,870 in mixed C objects, 2,620 assembly-source bytes and 21,792
runtime bytes, total 777,630. Reviewed non-library assembly is 3,030 main bytes
plus 420 payload bytes. Source inventory: 475 C files, 32 assembly entry markers,
four manual assembly declarations and 637 inline sites (286 register bindings,
343 empty constraints, one directive and seven instruction templates). The
extra continuation declaration/ARM directive introduce no assembly instructions.
Audio loop control, resampling, the full private frame/channel integration and
runtime rebuild verification remain incomplete. Evidence is under
`.deps/soundmain-packed/`: partial-build.log, partial-production.json,
partial-production-ram.json, partial-source-audit.json, partial-ownership.log,
word-store-guards.log; complete-call report under `.deps/soundmain-complete/`.


## September 10, 2026 — resampling arithmetic integrated (40 bytes)

Baseline: `72db596e`. `src/m4a_resample.c` replaces the ten ARM instructions
at 0x080CF840 through 0x080CF868: two stereo word loads, fractional interpolation
and both packed volume/mask/rotate additions. `SoundMainRAM_ResampleMix` is the
shared entry at +8, after the loads; the existing carry branch targets it.
The linker checks the entry, 40-byte extent and adjacent ARM continuation
`SoundMainRAM_ResampleAdvance`. The checker verifies the shared-entry offset
against original bytes and exercises all four packed lanes directly. The full
932-byte copied mixer span remains unchanged.

Here LR is the fractional position, not a return address. The adjacent compiler
rule now has an explicit optional `lr-input=read-only` contract. It requires a
global LR register binding and permits LR only in side-effect-free sources of
r0-r12 SETs; LR writes, stack use, implicit writeback and control uses remain
rejected. The default still rejects all LR body use. The original sole-LR frame,
terminal direct call, immediate restore and return checks remain mandatory.
The production arithmetic reads LR once for multiplication and leaves it intact.
Two empty constraints keep the interpolated value in its private r9 register;
there are no new executable instruction templates.

`check_arm_adjacent_lr.py` passes 13,056 executions across 136 LR values,
six factors and sixteen NZCV states, checking the product, unchanged LR/SP,
other registers and memory at the continuation. Nine invalid contracts are
rejected: missing opt-in, LR write/update, missing global binding, local stack,
extra call, conditional continuation, executable assembly and invalid option.
The original adjacent suite also passes 160 executions, eleven compiler
rejections, two link-contract rejections and unchanged unannotated output.

`make compare -j8` passes. `check_soundmain_resample_block.py` passes 71,680
production/original cases from ROM and another 71,680 after copying to RAM.
Each mode includes 14,336 word-load entries and 57,344 shared interpolation
entries. It crosses every signed current-sample byte with seven signed
difference boundaries, eight fraction values (including 32-bit wrap boundaries)
and the word-load/four-lane entry cases. Six volume pairs and three packed-word
pairs are distributed across those combinations. Independent arithmetic checks
wrap the product before arithmetic shift by 23, then verify both packed outputs
and final r9/r12. Full memory, ordered reads, all r0-r12, flags and private SP/LR
agree; no memory writes occur in the block. The production SoundMain composition
suite passes all 3,528 calls, including 1,728 deadline exits. These are functional
checks and do not establish cycle timing.

The audit now records 719,388 main C-owned instruction bytes (92.51% rounded),
33,870 mixed-object bytes, 2,580 assembly-source bytes and 21,792 runtime bytes,
total 777,630. Reviewed non-library assembly is 2,990 main bytes plus 420 payload
bytes. Source inventory is 476 C files, 32 assembly entry markers, five manual
assembly declarations and 649 inline sites (296 register bindings, 345 empty
constraints, one directive and seven instruction templates). The extra ARM
continuation declaration adds no executable assembly. Fraction updates, source
advancement, loop control and the complete frame/channel integration remain
unfinished, as does runtime rebuild verification. Evidence under
`.deps/soundmain-packed/`: resample-build.log, resample-production.json,
resample-production-ram.json, resample-source-audit.json, resample-ownership.log,
adjacent-lr.log and adjacent-regression.log; complete-call report under
`.deps/soundmain-complete/`.


## September 10, 2026 — fractional advance integrated (44-byte block)

Baseline: `abe2a434`. The production resampling block now includes the original
ADD LR,LR,r4 at 0x080CF868, extending its matched span to 44 bytes ending at
0x080CF86C. `sampleStep` binds to the private r4 input, and unsigned addition
advances the fraction with 32-bit wrap. The adjacent continuation now starts
with the flag-setting shift that determines source advancement. Its branch and
loop transitions remain assembly. Linker extent/adjacency and the shared +8
interpolation entry stay checked; the whole copied mixer remains 932 bytes.

The explicit `lr-input=accumulator` compiler contract permits the prior read-only
LR forms plus a non-flag-setting SET LR = LR + a register r0-r12. It requires
the same global LR binding and complete validated frame/call/restore sequence.
Removing that terminal restore forwards the updated private LR value instead
of reinstating the incoming fraction. Arbitrary assignments, other LR updates,
stack references and control uses remain rejected. No instruction pattern was
added; GCC already emits the exact ADD. The ordinary/read-only modes retain
their previous restrictions.

`check_arm_adjacent_lr.py --accumulator` passes 13,056 execution cases checking
the old-fraction product and wrapped new LR, preserved flags/registers/memory
and untouched stack. Nine invalid forms are rejected. The read-only mode also
passes its 13,056 cases and nine rejections; the original adjacent suite passes
160 cases, eleven compiler rejections, two link rejections and unchanged
unannotated output. The test directories are shared, so the two LR modes run
sequentially; their separate logs preserve both outcomes.

`make compare -j8` passes. The extended production block checker again passes
71,680 cases in ROM and 71,680 in copied RAM, now requiring LR = fraction + step
modulo 2^32. Nine step choices are distributed across the existing sample,
difference, fraction and entry combinations: zero, one, fractional/sign
boundaries, 0xffffffff, a mixed-bit value and the negative incoming fraction
for exact wrap to zero. Original/production execution and independent expected
arithmetic agree on the interpolated sample, packed outputs, all registers,
ordered reads, flags, memory and SP. The production complete-call regression
passes 3,528 calls, including 1,728 deadline exits. These checks do not measure
hardware cycle timing.

The audit moves four more bytes to C: 719,392 C-owned main instruction bytes,
33,870 mixed-object bytes, 2,576 assembly-source bytes and 21,792 runtime bytes,
total 777,630 (92.51% rounded C ownership). Reviewed non-library assembly is
2,986 main bytes plus 420 payload bytes. Source inventory remains 476 C files,
32 assembly entry markers and five manual assembly declarations; inline sites
are 650 (297 register bindings, 345 empty constraints, one directive and seven
instruction templates). Full frame/channel, remaining audio control and runtime
rebuild verification remain unfinished. Evidence under `.deps/soundmain-packed/`:
resample-advance-build.log, resample-production.json, resample-production-ram.json,
resample-advance-source-audit.json, resample-advance-ownership.log,
adjacent-lr-accumulator.log, adjacent-lr.log and adjacent-regression.log; the
complete-call report is under `.deps/soundmain-complete/`.


## September 10, 2026 — resampling conditional continuation integrated (52 bytes)

Baseline: `3ce4355f`. `src/m4a_resample.c` now includes the MOVS r9,LR,LSR#23
and BEQ pair at 0x080CF86C/0x080CF870. The matching block is 52 bytes, ending at
0x080CF874. Its C condition calls `SoundMainRAM_ResampleNoAdvance` when the shifted
fraction is zero; otherwise it continues at `SoundMainRAM_ResampleAdvance`.
The former is the existing ARM path at 0x080CF894; the latter is adjacent.
The linker checks extent, adjacency, destination word alignment, branch range
and membership in the copied mixer. The shared interpolation entry remains +8.

The adjacent compiler rule now accepts optional `conditional=NAME`, restricted
to the exact terminal EQ/NE two-call diamond emitted here at -O1. It verifies
both call targets, the two label destinations, common restore/return and lack
of prefix jumps into those destinations. It reverses the equality condition,
replaces the call/return scaffold with one explicit conditional-tail operation,
and applies the existing private frame/continuation checks. Flag-setting
result/CC SET pairs may read the globally bound LR without modifying it.
The backend represents the external transfer with an UNSPEC carrying the
condition register and symbol. Ordinary conditional-jump RTL was rejected by
GCC's local-label verification/final ARM predication assumptions; the explicit
operation avoids that incorrect classification while emitting the original
four-byte BEQ. Final tests and production builds use normal compiler checking.

The pinned backend was rebuilt and installed successfully; Make rebuilt its
dependent plugins and production objects. `check_arm_conditional.py` passes
13,632 original-location/copied-code executions, including 2,720 taken branches.
It checks the updated LR, shifted value, N/Z/C/V (including shift carry and
preserved V), all registers, stack, memory and selected continuation. Eleven
compiler rejections cover missing/wrong/shared targets, missing contract,
post-call/post-join work, non-equality branching, stack use, early-return bypass,
LR assignment and debug code. Three link rejections cover adjacency, target
placement/alignment and range. The older adjacent suite passes 160 cases,
eleven compiler and two link rejections, and unchanged unannotated output;
both LR modes pass 13,056 executions and nine rejection cases each.

`make compare -j8` passes for the full ROM. The resampling block checker passes
71,680 cases in ROM and 71,680 in copied RAM: per mode, 50,770 advance exits and
20,910 no-advance exits. Each checks the exact exit PC, full shift flags,
wrapped LR, all r0-r12, independently calculated packed outputs and ordered
reads, unchanged memory and SP. It exercises both the word-load and shared
interpolation entries across all four packed lanes. The production complete
SoundMain regression passes 3,528 calls, including 1,728 deadline exits.
These functional comparisons do not establish hardware cycle timing.

The audit records 719,400 main C-owned instruction bytes (92.51% rounded),
33,870 mixed-object bytes, 2,568 assembly-source bytes and 21,792 runtime bytes,
total 777,630. Reviewed non-library assembly is 2,978 main bytes plus 420 payload
bytes. Source counts: 476 C files, 32 assembly entry markers, six manual assembly
declarations, 650 inline sites (297 register bindings, 345 empty constraints,
one directive, seven instruction templates). Naming the existing no-advance
entry adds a declaration without adding instructions. Actual source advancement,
sample-loop transitions, broader frame/channel integration and runtime rebuild
verification remain unfinished. Evidence under `.deps/soundmain-packed/`:
conditional-backend-build.log, conditional-guards.log, resample-branch-build.log,
resample-production.json, resample-production-ram.json, resample-branch-source-audit.json,
resample-branch-ownership.log and adjacent regression/LR logs; complete-call
report under `.deps/soundmain-complete/`.


## September 10, 2026 — short and packed countdown branches integrated

Baseline: `9e8ae8c4`. The existing conditional-continuation contract now handles
two more fixed-rate mixer decisions without a compiler/backend change.
`src/m4a_short.c` grows from 36 to 44 bytes (0x080CF774 through 0x080CF7A0),
including SUBS r2,1 and BEQ to `SoundMainRAM_ShortEnd` at 0x080CF7EC. The shared
sample entry remains +8. `src/m4a_packed.c` grows from 60 to 68 bytes (0x080CF730
through 0x080CF774), adding ADDS r8,r8,LR and BEQ to `SoundMainRAM_SaveChannel`
at 0x080CF8B8; the other path falls directly into the short-sample C function.
The packed block declares LR as a read-only remainder input. The old assembly
PackedFinish boundary is removed. Linker assertions check sizes, adjacent
continuations, conditional target alignment/range and copied-mixer membership.

`make compare -j8` passes. The short checker passes 92,160 cases in ROM and
92,160 in copied RAM, with all four packed lanes at the shared entry and ten
selected source counts including zero, one and signed/wrapped boundaries.
Each mode has 82,940 continuing exits and 9,220 end-of-sample exits. It checks
the decremented count, full subtraction flags, exact exit PC, signed-sample
arithmetic, ordered reads, all registers, unchanged memory and SP/LR/canaries.

The packed checker with `--finish` passes 18,432 cases in ROM and 18,432 in
copied RAM, now executing through the final remainder addition/branch. All
135 combinations of fifteen selected counters and nine remainder inputs occur
across the byte/volume/packed-word/source-alias cases (not a full Cartesian
product with those other dimensions). Each mode has 16,788 short-path exits
and 1,644 channel-save exits. The checker independently calculates wrapped
remaining count and complete addition N/Z/C/V, and verifies destination PC,
all registers, full RAM, ordered sample accesses/stores, and preserved SP/LR.
The complete production SoundMain suite again passes 3,528 calls, including
1,728 deadline exits. The test scope remains functional, not cycle timing.

The audit moves sixteen bytes to C: 719,416 C-owned main instruction bytes,
33,870 mixed-object bytes, 2,552 assembly-source bytes and 21,792 runtime bytes,
total 777,630 (92.51% rounded C ownership). Reviewed non-library assembly is
2,962 main bytes plus 420 payload bytes. Inventory remains 476 C files and
32 assembly entry markers; there are seven manual assembly declarations and
652 inline sites (299 register bindings, 345 empty constraints, one directive,
seven instruction templates). Newly named existing destinations add metadata
only. Loop metadata handling, source advancement, broader frame/channel code
and runtime rebuild verification remain unfinished. Evidence under
`.deps/soundmain-packed/`: countdown-branches-build.log, short-production.json,
short-production-ram.json, finish-production.json, finish-production-ram.json,
countdown-branches-source-audit.json and countdown-branches-ownership.log;
complete-call report under `.deps/soundmain-complete/`.


## September 10, 2026 — fixed-rate loop metadata integrated (16 bytes)

Baseline: `85af428e`. `src/m4a_loop.c` now defines the existing
`SoundMainRAM_ShortEnd` entry at 0x080CF7EC. Its four ARM instructions read the
loop length at SP+16, compare it with zero, conditionally load the loop source
at SP+12, and branch backward to `SoundMainRAM_ShortCount` at 0x080CF7A0 when
looping. The zero path falls through to `SoundMainRAM_Partial` at 0x080CF7FC.
Linker contracts check the 16-byte extent, entry/adjacent boundary, backward
branch range, alignment and location inside the copied mixer. The resampling
loop helper is a separate path and remains assembly.

The adjacent compiler pass has a new explicit `sp-input=frame64` contract.
It requires a global SP binding, zero local frame and the existing validated
sole-LR save/call/restore/return shape. Only aligned SI word reads from SP+0..60
are accepted, including a single predicated read. No frame writes, SP updates,
other access widths or out-of-bounds offsets are allowed. Removing the LR-save
scaffold leaves accesses relative to the declared incoming mixer SP. This is
a private frame contract, not a conventional C-call ABI.

The pass also removes an exactly repeated CMP(reg,0) across one conditional
frame-word load when the load cannot change the compared register. It crosses
no other operation or label, preserves every comparison flag and removes a
stale CC death note if present. The C count uses one empty register constraint
to stay in r2. No new instruction template/backend operation was added.
The verified 64-byte frame layout moved to `include/gba/m4a_mixer_frame.h`;
the research header includes it. Compile-time size/offset checks now explicitly
cover loop-source offset 12 and loop-length offset 16, alongside prior checks.

`check_arm_frame.py` passes 55,296 original-location/copied-code executions
covering normal metadata loads, the last allowed frame word, and a conditional
load that overwrites the comparison input. That last case must retain both
CMP instructions and is checked for correct branch flags/outcome. Tests verify
ordered frame reads, all registers, complete memory/frame, SP/LR and backward
branch destinations. Eight invalid contracts are rejected: missing opt-in,
outside/negative offsets, byte reads, stores, SP increments, missing global SP
binding and local stack use. Unannotated objects remain byte-identical. The
conditional regression passes 13,632 executions, eleven compiler and three
link rejections; the original adjacent suite passes 160 executions, eleven
compiler and two link rejections.

`make compare -j8` passes. `check_soundmain_loop.py` passes 33,792 cases from ROM
and 33,792 from copied RAM, crossing 264 count values, eight pointer values
and sixteen initial NZCV states. Each mode has 33,664 loop exits and 128 stop
exits. Besides original/production comparison, it checks expected r0-r12/CPSR,
exact destination PC, the skipped pointer read when count is zero, ordered
reads when nonzero, preserved SP/LR, all frame bytes and surrounding canaries.
The complete production SoundMain suite passes 3,528 calls, including 1,728
deadline exits, using the promoted common frame layout. Cycle timing remains
outside these functional checks.

The audit records 719,432 C-owned main instruction bytes (92.52% rounded),
33,870 mixed-object bytes, 2,536 assembly-source bytes and 21,792 runtime bytes,
total 777,630. Reviewed non-library assembly is 2,946 main bytes plus 420 payload
bytes. Source inventory: 477 C files, 32 assembly entry markers, six manual
assembly declarations, 656 inline sites (302 register bindings, 346 empty
constraints, one directive, seven instruction templates). Remaining private
frame/channel integration, source advancement, loop control and runtime rebuild
verification are incomplete. Evidence under `.deps/soundmain-packed/`:
loop-build.log, frame-guards.log, loop-production.json, loop-production-ram.json,
loop-source-audit.json, loop-ownership.log and conditional/adjacent regression
logs; complete-call report under `.deps/soundmain-complete/`.


## September 10, 2026 — channel save and frame restore integrated (20 bytes)

Baseline: `6d46849f`. `src/m4a_save_channel.c` replaces five ARM instructions
at 0x080CF8B8 through 0x080CF8CC: channel ct/cp stores, sample-count reload from
SP, PC-relative continuation materialization and BX into Thumb channel control.
The shared restore-only entry `SoundMainRAM_RestoreFrame` is at +8 and skips
the stores. The partial-word path's branch now names that linker symbol.
`SoundMainRAM_ChanAdvance` names the original Thumb entry at 0x080CF8CC (raw ELF
function value 0x080CF8CD). The linker checks the entry boundary, 20-byte extent
and PC+8+1 continuation relation. The existing PC-address compiler rule and
ordinary indirect sibling call emit ADD/BX; no compiler changes were required.

`make compare -j8` passes. `check_soundmain_save.py` passes 65,536 cases in ROM
and 65,536 after copying the mixer to RAM. Each mode has 32,768 save entries and
32,768 restore-only entries. It crosses eight count, source and sample-count
values with four channel positions, both entries and sixteen NZCV states.
Channel positions include a separate buffer, ct overlapping the frame's sample
word, cp overlapping that word, and stores into other frame slots. Independent
expected memory checks require ct before cp before the frame read, so aliasing
can change the restored r8 value exactly as in the original. Full data/frame
and surrounding bytes, all r0-r12, preserved SP/LR/NZCV and exact Thumb PC/mode
agree. The checker uses raw readelf values for the Thumb symbol bit because
nm displays its normalized even address. The production SoundMain regression
also passes 3,528 complete calls, including 1,728 deadline exits. Hardware cycle
timing is outside these functional checks.

A larger 24-byte candidate including the preceding fractional-position store
is preserved as `research/audio/soundmain_save_resampled_private.c`. With a
global LR binding, GCC emits an extra LR push and restore, yielding 32 bytes;
its SP-relative load consequently reads the wrong private-frame location, and
the provisional PC-relative offset would also require revalidation. It is
not integrated or a verified semantic model. A guarded indirect-tail frame
conversion is the next requirement before that candidate can replace code.
The probe is reproducible with the installed pinned compiler, `-O1
-foptimize-sibling-calls -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding`, the
existing pc_address plugin with symbol SoundMainRAM_ChanAdvance and offset 1,
and the standard project include paths. The current 20-byte production block
has no such frame and matches all original bytes.

The refreshed audit records 719,452 C-owned main instruction bytes (92.52%
rounded), 33,870 mixed-object bytes, 2,516 assembly-source bytes and 21,792 runtime
bytes, total 777,630. Reviewed non-library assembly is 2,926 main bytes plus
420 payload bytes. There are 478 C files, 32 assembly entry markers, six manual
assembly declarations and 662 inline sites (308 register bindings, 346 empty
constraints, one directive, seven instruction templates). Remaining mixer frame
construction, fractional save, source/loop control and runtime rebuild work
are incomplete. Evidence under `.deps/soundmain-packed/`: save-channel-build.log,
save-production.json, save-production-ram.json, save-source-audit.json,
save-ownership.log and the save-resampled.s candidate; complete-call report
under `.deps/soundmain-complete/`.


## September 10, 2026 — fractional channel save integrated (24 bytes)

Baseline: `12ed0ca6`. The channel-save C block now starts at 0x080CF8B4 and
includes the incoming LR fractional-position store to channel fw. Its six ARM
instructions occupy exactly 24 bytes. SaveChannel is a linker entry at +4,
RestoreFrame at +12, and the existing Thumb continuation remains at 0x080CF8CC.
The earlier research candidate has been promoted into production and removed.

The opt-in arm_indirect_frame compiler pass validates and removes the sole LR
push/restore around the terminal indirect sibling transfer through r0. Global
r0/SP/LR bindings and a void zero-frame ARM function are mandatory. Frame reads
are aligned words within 64 bytes; incoming LR may only be stored to a word
address independent of SP/LR. Other calls, body branches, stack writes, LR
writes, executable assembly and debug/unwind forms are rejected. The pass runs
after PC-address materialization, tolerates its empty pool shell, and removes
stale LR death notes. The retained sibling call emits the original BX r0.
The standalone checker passes 27,648 executions across arbitrary LR values,
frame aliasing, all NZCV states and both destination modes, rejects 14 invalid
forms, and confirms unchanged unannotated output.

`make compare -j8` passes. Production save checks pass 122,880 cases in ROM and
122,880 after copying the mixer to RAM, with 40,960 cases per entry per mode.
Five channel positions include separate memory and ct/cp/fw aliases with the
frame sample word. Independent expected ordered stores and frame read, complete
memory/canaries, r0-r12, SP/LR, NZCV and Thumb destination/mode match. Fraction
values cover distributed zero, boundary and arbitrary patterns. The composed
SoundMain regression passes all 3,528 production calls, including 1,728 deadline
exits; this does not prove cycle timing or full private-frame semantics.

Refreshed instruction ownership: 719,456 main C-owned bytes, 33,870 mixed-object
bytes, 2,512 assembly-source bytes and 21,792 runtime bytes (777,630 total).
Reviewed non-library assembly is 2,922 main bytes and 420 payload bytes. Source
inventory is 478 C files, 32 assembly entry markers, six manual declarations,
663 inline sites (309 register bindings, 346 empty constraints, one directive,
seven instruction templates). Remaining mixer frame construction, channel
control, resampling source/loop control and runtime rebuild work are incomplete.
Evidence: `.deps/soundmain-packed/save-resampled-build.log`, save-production.json,
save-production-ram.json, indirect-frame-guards.log, save-resampled-source-audit.json,
save-resampled-ownership.log; `.deps/soundmain-complete/production-report.json`.


## September 10, 2026 — source-advance semantics and matching candidate

Baseline: `34df7638`, unchanged production. Added
`research/audio/soundmain_advance_private.c` for the 32-byte resampling advance
block at 0x080CF874..0x080CF894. The incoming LR mask clears bits 23..29 while
preserving the top two bits. SUBS r2,r2,r9 followed by BLE compares the signed
incoming count and advance, not just the sign of the wrapped result. This
matters at 0x80000000 and adjacent values. For a continuing source, subtracting
one from the advance either reuses current+difference or reads the displaced
signed byte; the next signed byte establishes the new difference.

`check_soundmain_advance.py` passes 35,200 cases across three machines (original
ROM, copied RAM and compiled C candidate). Counts include zero, small/length
boundaries, signed extrema and all-ones; skips include zero and 1..511 boundary
values. Five signed current samples, five difference values and all 16 NZCV
states are crossed; incoming LR uses deterministic random values. There are
20,400 loop exits and 14,800 source-continuation exits. Independent expectations
validate live r0/r1/r2/r3/r9/LR and ordered byte reads, with unchanged source
memory. Original-code checks also validate all registers, full frame/SP and
subtraction NZCV. Candidate execution stops before the terminal BL; its frame,
scratch registers, flags and call/return ABI are deliberately not claimed to
match. These private-exit semantics do not validate the separate loop helper.

The compiled candidate is 84 bytes, versus 32 original bytes. Volatile private
register declarations avoid an additional r4 save and unnecessary temporaries,
but register-subtraction flag reuse, preincrement signed-byte loads and the
conditional private transfer remain matching work. No production bytes or
coverage metrics changed. Reproduce with the checker and `--compiler
.deps/gcc16-matching/install/bin/arm-none-eabi-gcc`; evidence is
`.deps/soundmain-packed/advance-candidate-report.json` and
`advance-candidate-check.log`. Object/ELF/binary files are generated in that
same ignored directory.


## September 10, 2026 — register subtraction flag reuse

Baseline: `4d97f078`. Extended the opt-in subtract_compare pass to accept an
SI register RHS distinct from the updated base and dead saved-value temporary.
Only the adjacent copy/subtract/compare pattern is accepted. The comparison
must use the original base copy and identical amount. It emits existing ARM
SUBS RTL, whose NZCV exactly equals the old-value comparison for every 32-bit
operand. Existing immediate behavior remains unchanged.

The source-advance candidate uses an empty LR constraint to keep its fraction
mask before the saved count, allowing the adjacent fold without moving across
another operation. It now emits 76 bytes instead of 84. Its 35,200 three-machine
semantic cases still pass. It remains research only: 32 original bytes and
private frame/flags/register/control requirements are not yet matched.

`check_subtract_compare.py --register` passes 91,168 executions: eleven RHS
boundary values, 518 count values (including 256 deterministic random values)
and all sixteen input NZCV states. It checks all registers, SP/LR, exact flags
and the following signed branch. Six invalid forms are rejected, including an
operand change between subtraction and comparison; unannotated output is
unchanged. The immediate regression passes 33,152 executions and five rejects.
Full-ROM `make compare -j8` passes with the rebuilt plugin. Production C coverage
is unchanged. Logs: `.deps/soundmain-packed/subtract-register-guards.log`,
subtract-immediate-regression.log, subtract-register-build.log and
advance-candidate-check.log.


## September 10, 2026 — signed-byte preincrement folding

Baseline: `2f78cd35`. Added the opt-in byte_preincrement compiler pass and its
builder. It recognizes a strict adjacent copy/update/signed-byte-load sequence
whose copied address temporary is overwritten by the load. It folds to existing
ARM PRE_MODIFY RTL, retaining memory volatility/alias attributes and recording
base writeback. The offset must be immediate one or a distinct general register;
all three instructions must have the same predicate or be unconditional.
Intervening operations, labels and operand aliasing are excluded.

The advance candidate now emits 60 bytes rather than 76 (initially 84), with
LDRSBNE r0,[r3,ip]! and LDRSB r1,[r3,1]! replacing two three-instruction address
sequences. Its 35,200 ROM/copied-RAM/C semantic comparisons still pass. The
original block is 32 bytes. Scratch-register decrement/update and private
frame/continuation conversion remain unfinished; there is no production
integration or coverage increase at this checkpoint.

The standalone preincrement checker passes 102,400 baseline/folded cases:
immediate, register and conditional forms; all 256 byte values and sixteen
input NZCV states; eight register offsets including negative displacements;
and both conditional outcomes. It compares full registers/flags, SP/LR/return,
ordered reads and immutable memory, with independent source/value expectations.
Eight unsupported forms reject (Thumb, unsigned/word loads, immediate two,
decrement, missing update, a barrier and an intervening store); unannotated
object bytes are unchanged. Tests use the pinned installed GCC 16.2.0.
Evidence: `.deps/soundmain-packed/preincrement-guards.log`,
advance-candidate-check.log and advance-candidate-report.json. Production
sources/tool selection are unchanged from the previously passing ROM build.


## September 10, 2026 — private source-advance register preservation

Baseline: `6b2e3ddc`. An empty tied r9 constraint after the decrement keeps the
updated skip in its original register. The candidate no longer writes r12 and
its conditional preincrement load now addresses through r9, as the original
does. It remains 60 bytes because the compiler emits SUB r9,r9,1 followed by
CMP r9,0 instead of SUBS. Nine ordinary optimization switches and alternate
source forms did not remove the temporary while retaining the desired form;
those probes remain ignored research output.

The 35,200-case checker now requires every r0-r12 value and live LR to match
at both exits, not just the formerly selected live subset. It independently
checks candidate SP/frame and flags too: an extra four-byte LR save remains,
and the continuing path has CMP-result-with-zero flags rather than original
SUBS flags. The loop path has the original subtraction flags. All checks pass.
These differences are asserted explicitly; candidate calls are still stopped
before BL and no production or coverage claim is made. Next matching work is
guarded SUB/CMP flag folding and the private early-exit/adjacent continuation.
Evidence remains `.deps/soundmain-packed/advance-candidate-check.log` and
advance-candidate-report.json; the exact candidate object confirms both r9
instructions and absence of r12 writes.


## September 10, 2026 — tied decrement zero-test folding

Baseline: `0f86d72d`. Added the subtract_zero opt-in compiler pass and builder.
It recognizes an adjacent decrement-by-one, exact empty +r identity constraint
and zero comparison. The result is existing ARM SUBS RTL in the original base
register. Since CMP(result,0) and SUBS have different carry/overflow behavior,
the pass verifies the complete remaining flag lifetime: only EQ/NE predicates
are permitted until an unconditional overwrite, flag-independent call or
return. Labels, other jumps, embedded asm and other flag consumers reject.
The tied register operation has no clobbers or labels and exactly one matching
input/output. Stale notes on the replacement are cleared.

The standalone checker passes 16,576 baseline/folded executions over 518 count
values, sixteen initial NZCV states and ARM/Thumb returns. All registers and
SP/LR agree; expected flags are checked separately for baseline CMP and folded
SUBS, including signed overflow. Eight invalid forms reject, and unannotated
object bytes are unchanged. Evidence: `.deps/soundmain-packed/subtract-zero-guards.log`.

The source-advance candidate is now 56 bytes (initially 84; original 32).
Its 35,200 comparisons against original ROM and copied RAM pass with all
r0-r12, live LR and flags matching at both exits. Its extra four-byte LR save
and associated frame bytes are still asserted separately, and execution stops
before terminal BL. This remains research code; the remaining frame and early
conditional/adjacent transfers must be converted before integration. Evidence:
advance-candidate-check.log and advance-candidate-report.json in the same
ignored directory. Production build selection and coverage are unchanged.


## September 10, 2026 — resampling source advance integrated (32 bytes)

Baseline: `0162f304`. Promoted the source-advance candidate to `src/m4a_advance.c`
and removed the research copy. The full eight-instruction block at
0x080CF874..0x080CF894 now comes from C. The shared source reload remains at
0x080CF888 (+20), reached by the separate assembly loop helper. Link assertions
require 32 bytes, adjacent NoAdvance control, backward aligned ResampleLoop
inside the copied mixer and valid ARM branch range. Full ROM checksum passes.

Extended arm_adjacent with `early=NAME` for a single prefix conditional branch
around a straight-line body, plus the exact common restore/return and alternate
call/back-edge tail. It retains EQ/NE or signed relational conditions, validates
both destination names and exactly two internal labels, removes the alternate
tail, then applies the existing frame/adjacency validation. Extra prefix jumps
and post-call work reject. In this mode only, the pass runs after shorten;
arithmetic passes must finish before frame removal. The emitted ARM instructions
are fixed-width and the assembler/linker resolve the checked external branch.
`lr-input=masked` permits exactly LR &= 0xC07FFFFF and an empty identity LR tie,
in addition to the existing read-only forms. It requires a global LR binding.

Production checks pass 35,200 cases across four machines: original and production,
each in ROM and copied RAM. The 20,400 loop exits and 14,800 continuing exits
per machine agree on every r0-r12, LR, SP, complete frame/canaries, exact NZCV,
ordered source reads and unchanged source memory. The standalone compiled block
and linked production bytes both equal the original 32 bytes; symbols and shared
reload offset are checked. The checker covers the full advance entry; the shared
reload's independent-entry edge cases are not separately enumerated. The complete
SoundMain regression passes 3,528 production calls, including 1,728 deadline exits.
Hardware cycle timing remains outside functional checks.

Twelve invalid early/masked contracts reject. Existing regression suites pass:
160 adjacent cases (11 compiler/two link rejects), 13,632 conditional cases
(11 compiler/three link rejects), 55,296 frame cases (eight rejects), and both
LR modes (13,056 each, nine rejects each). The updated ownership audit records
719,488 main C-owned instruction bytes, 33,870 mixed-object bytes, 2,480 assembly
source bytes and 21,792 runtime bytes, totaling 777,630. Reviewed non-library
assembly is 2,890 main bytes and 420 payload bytes. Source inventory: 479 C files,
32 assembly entry markers, six manual declarations and 671 inline sites (315
register bindings, 348 empty constraints, one directive, seven instruction
templates). Remaining mixer frame construction, channel/loop control and runtime
rebuild work are incomplete.

Evidence under `.deps/soundmain-packed/`: advance-production-build.log,
advance-production-check.log, advance-production-report.json, early-guards.log,
early-check_arm_*.log, early-lr-*.log, advance-source-audit.json and
advance-ownership.log. Complete-call report remains under `.deps/soundmain-complete/`.


## September 10, 2026 — resampling loop metadata integrated (20 bytes)

Baseline: `81411c78`. `src/m4a_resample_loop.c` replaces the five instructions
at 0x080CF7BC..0x080CF7D0: load loop length, compare zero, branch to stop if zero,
load loop source and negate the remaining count into r9. Existing arm_adjacent
`early` and `frame64` contracts produce exact code without compiler changes.
The linker checks the 20-byte extent, adjacent ResampleWrap at 0x080CF7D0,
forward aligned ResampleStop at 0x080CF7E0, copied-mixer scope and branch range.
The wrapping arithmetic and frame-restoring stop body remain assembly.

The shared mixer header now defines SoundMainResampleFrame: saved channel and
product words followed by the existing 64-byte frame. Compile-time checks
require 72 bytes, loop source at offset 20 and loop length at offset 24. The
compiler frame64 contract only permits aligned loads through offset 60; these
reads fall within that window and retain the original SP coordinate system.

`make compare -j8` passes. `check_soundmain_resample_loop.py` passes 270,336 cases
per mode, 540,672 total across ROM and copied RAM. It crosses 264 loop lengths,
eight pointers, eight remaining counts and sixteen initial NZCV states. Each
mode includes 269,312 looping exits and 1,024 stop exits. Independent expected
state requires the loop-length read before any source read, no source read for
zero length, exact r9 negation only on the looping path, every r0-r12, NZCV,
SP/LR, exit PC, full 72-byte frame and surrounding canaries. The complete audio
regression also passes all 3,528 production calls, including 1,728 deadline exits.
These functional checks do not measure hardware cycle timing.

Refreshed main instruction ownership: 719,508 C-owned bytes (92.53% rounded),
33,870 mixed-object bytes, 2,460 assembly-source bytes and 21,792 runtime bytes,
total 777,630. Reviewed non-library assembly is 2,870 main bytes and 420 payload
bytes. Source inventory: 480 C files, 32 assembly entry markers, seven manual
assembly declarations, 676 inline sites (320 register bindings, 348 empty
constraints, one directive, seven instruction templates). The additional manual
symbol identifies an existing private continuation; marker totals do not measure
unfinished independent functions.

Evidence under `.deps/soundmain-packed/`: resample-loop-production-build.log,
resample-loop-production.json, resample-loop-production-ram.json,
resample-loop-check.log, resample-loop-check-ram.log,
resample-loop-source-audit.json and resample-loop-ownership.log. The complete
production call report is under `.deps/soundmain-complete/`.


## September 10, 2026 — wrap iteration semantics verified

Baseline: `79b64ec2`, production unchanged. Added
`research/audio/soundmain_wrap_private.c` and `check_soundmain_wrap.py` for one
iteration of the 16-byte wrapping loop at 0x080CF7D0..0x080CF7E0. ADDS followed
by BGT tests whether the mathematical sum of two signed 32-bit operands is
positive, including when the stored result wraps. For example 0x7FFFFFFF+1
branches to reload despite a negative stored result; 0x80000000+0xFFFFFFFF
repeats despite a positive stored result. A signed 64-bit C sum represents this
without undefined signed overflow, then casts to u32 for the stored count.
On the repeating path the skip is reduced by the unsigned loop length.

The checker passes 40,800 cases across original ROM, copied RAM and compiled
candidate: 13x13 boundary operand pairs plus 256 deterministic random pairs,
six skip values and sixteen input NZCV states. There are 22,368 reload outcomes,
18,432 repeat outcomes and 9,888 signed-overflow cases. Independent expectations
check the mathematical branch and wrapped count/skip, LR and frame; original
checks cover every register and exact ADDS NZCV. The candidate's compiler LR
save is asserted separately, while scratch registers/flags remain unmatched.
Execution stops before its terminal calls. Original execution stops at the
first reload or return to the loop entry, so zero and other potentially infinite
inputs can be checked without falsely claiming the whole loop terminates.

The candidate emits 52 bytes: sign extension, low-word ADDS, high-word ADC,
64-bit positive comparison, branch, skip update and compiler frame/calls. The
next matching work is a guarded reduction of the widened addition/comparison
to original ADDS/BGT, then private transfer handling. Neither production bytes
nor coverage changed. Evidence under `.deps/soundmain-packed/`:
wrap-candidate-check.log, wrap-candidate-report.json and wrap-candidate.s;
reproduce with the checker and the pinned compiler path.


## September 10, 2026 — widened signed-sum positive-test reduction

Baseline: `b9cd6e62`. Added signed_sum and its builder, plus the explicit
match_arm_signed_sum_flags backend operation. The pass validates exactly six
adjacent operations: sign extraction of the count, low-word carry addition,
high-word ADC, low-word comparison with one, high-word borrow comparison and
GE branch. The high temporary must be a distinct nonglobal register with dead
and unused notes; comparison flags must die at the branch. Matching uses hard
register numbers for those notes because GCC may retain different RTL register
objects for the high temporary's successive values.

The replacement preserves the original low add operand order and emits ADDS
plus BGT to the existing local target. Its flags are represented by an explicit
opaque operation, restricted to the immediately following positive-sum branch.
This avoids incorrectly equating all flags with a 64-bit comparison: notably
INT_MIN + INT_MIN has a zero low word but a negative mathematical sum, so EQ
would be invalid. The guarded GT predicate is correct for the entire input range.
The pinned compiler backend rebuilt successfully; all production plugins rebuilt
and `make compare -j8` still passes.

The wrap candidate shrinks from 52 to 36 bytes (original 16). All 40,800 cases
pass, including 9,888 signed overflows, 22,368 reloads and 18,432 repeats. The
checker now requires every r0-r12 and exact NZCV to match, in addition to live
LR, wrapped state and exit. Candidate stack-save behavior remains separately
asserted and calls are stopped before execution; it is not production-integrated.
Eight invalid patterns reject: Thumb, nonnegative/negative predicates, unsigned
addition, subtraction, comparison of the wrapped result, an intervening barrier
and a live high word. Unannotated object bytes are unchanged.

Evidence under `.deps/soundmain-packed/`: signed-sum-backend-build.log,
signed-sum-production-build.log, signed-sum-guards.log, wrap-candidate-check.log
and wrap-candidate-report.json. Remaining work is the private frame and repeated
conditional transfer; production C coverage is unchanged at this checkpoint.


## September 10, 2026 — resampling wrap loop integrated (16 bytes)

Baseline: `666b0945`. Promoted the wrap candidate to `src/m4a_wrap.c`, removing
the research copy. The four instructions at 0x080CF7D0..0x080CF7E0 are generated
from C: ADDS, forward BGT to the shared source reload, skip subtraction and
backward B to the wrap entry. The C source retains its signed 64-bit expression;
the guarded signed_sum pass emits the correct positive-sum flags and branch.

The arm_adjacent `transfer=branch` mode validates the existing private frame
and direct-call contract, then changes the terminal call to GCC's direct
sibling-call pattern. The compiler emits B and preserves LR; the sole LR push,
restore and return are removed. Default adjacent fallthrough is unchanged.
The existing early-exit handling preserves the reload branch. Linker assertions
require the exact 16-byte extent, self-branch entry, aligned forward reload in
the copied mixer and valid branch range. Full ROM checksum passes.

Production wrap checks pass 40,800 cases across four machines (original and
production, each in ROM and copied RAM): 22,368 reloads and 18,432 repeats per
machine, including 9,888 signed overflows. Every r0-r12, LR/SP, NZCV and full
frame/canaries agrees with independent expected state; both branch targets and
the linked bytes are checked. Each case stops after one iteration, retaining
coverage of potentially nonterminating input combinations. The full SoundMain
regression also passes 3,528 calls, including 1,728 deadline exits. Hardware
cycle timing is not measured by these functional checks.

Eight invalid repeated-branch contracts reject. Existing adjacent, conditional,
frame, both LR-mode, early-exit and signed-sum guard suites pass with the updated
plugin. The refreshed ownership inventory has 719,524 C-owned main instruction
bytes (92.53%), 33,870 mixed-object bytes, 2,444 assembly-source bytes and 21,792
runtime bytes, total 777,630. Reviewed non-library assembly is 2,854 main bytes
and 420 payload bytes. Source inventory: 481 C files, 32 assembly entry markers,
six manual declarations, 679 inline sites (323 register bindings, 348 empty
constraints, one directive, seven instruction templates). Resampling stop-frame
restoration, broader frame/channel control and runtime rebuild work remain.

Evidence under `.deps/soundmain-packed/`: wrap-production-build.log,
wrap-production-check.log, wrap-production-report.json, repeat-guards.log,
repeat-check_arm_*.log, repeat-lr-*.log, repeat-early.log,
repeat-signed-sum-guards.log, wrap-source-audit.json and wrap-ownership.log.
The full-call report remains under `.deps/soundmain-complete/`.


## September 10, 2026 — resampling stop and frame restore integrated (12 bytes)

Baseline: `4855847f`. `src/m4a_stop.c` replaces the three instructions at
0x080CF7E0..0x080CF7EC: POP r4/r12, MOV r2,0 and B to partial-word completion
at 0x080CF7FC. The linker enforces the original entry, 12-byte extent, forward
aligned destination inside the copied mixer and branch range. The full ROM
checksum passes.

Extended arm_adjacent with `sp-input=pop2`. It requires a global SP binding,
the sole compiler LR save, then exactly two ascending-register SI loads from
SP and SP+4 followed by SP+=8. The three body operations become existing ARM
load-multiple RTL with both original MEM attributes preserved. All other
explicit SP operations reject; labels/intervening operations and descending
or aliased register pairs reject. The existing private-frame validation removes
the compiler LR save/restore and return. `transfer=branch` emits the final B.
This is separate from the unchanged read-only frame64 mode.

Production tests pass 100,608 cases in ROM and 100,608 in copied RAM. They cross
262 saved-channel values, eight saved-product values, three stack placements
and sixteen input NZCV states, with varied incoming r2/LR. Expected accesses are
exactly one word read at old SP followed by one at old SP+4, with no writes.
Every r0-r12, LR, NZCV, SP+8, exit PC, full frame and surrounding canaries agrees.
The complete audio regression passes 3,528 calls including 1,728 deadline exits.
Hardware cycle timing remains outside the functional checks.

Ten invalid pop-pair contracts reject. Existing adjacent, conditional, frame,
both LR modes, early-exit and repeat-contract suites pass. Refreshed main
ownership: 719,536 C-owned instruction bytes (92.53%), 33,870 mixed-object bytes,
2,432 assembly-source bytes and 21,792 runtime bytes, total 777,630. Reviewed
non-library assembly is 2,842 main bytes and 420 payload bytes. Source inventory:
482 C files, 32 assembly entry markers, five manual declarations, 683 inline
sites (327 register bindings, 348 empty constraints, one directive, seven
instruction templates). Remaining word-completion, frame/channel control and
runtime rebuild work are incomplete.

Evidence under `.deps/soundmain-packed/`: stop-production-build.log,
stop-production.json, stop-production-ram.json, stop-check.log,
stop-check-ram.log, pop-pair-guards.log, pop-check_arm_*.log, pop-lr-*.log,
stop-source-audit.json and stop-ownership.log. The full-call report remains
under `.deps/soundmain-complete/`.


## September 10, 2026 — resampling stereo-word completion integrated (16 bytes)

Baseline: `e7bf8f37`. `src/m4a_word_finish.c` replaces four instructions at
0x080CF89C..0x080CF8AC: left-word store, right-word store with output writeback,
SUBS sample count by four and BGT back to the resampling word entry. It uses the
existing word_postincrement, subtract_compare and early arm_adjacent contracts;
no compiler changes were needed. The C comparison uses the incoming signed
count rather than the wrapped subtraction result. Link assertions require the
16-byte extent, adjacent finish continuation at 0x080CF8AC, backward aligned
resampling entry at 0x080CF840 within the copied mixer and branch range.
The preceding lane-advance pair and following source/frame update remain assembly.

`make compare -j8` passes. `check_soundmain_word_finish.py` passes 101,760 cases
per mode, 203,520 total in ROM and copied RAM. It crosses 265 counter values,
four output placements, six stereo-word pairs and sixteen initial NZCV states.
Each mode has 50,304 repeat exits and 51,456 finish exits. Counter boundaries
include signed overflow; output placements include ordinary EWRAM and left/right
stores overlapping the private frame. Independent expected state checks left
before right, no reads or extra writes, output+4, wrapped count, exact SUBS NZCV,
every register, preserved SP/LR, exit PC and full data/frame/canary memory.
The complete audio regression passes 3,528 calls, including 1,728 deadline exits.
Hardware cycle timing is outside these functional checks.

Refreshed main instruction ownership: 719,552 C-owned bytes (92.53%), 33,870
mixed-object bytes, 2,416 assembly-source bytes and 21,792 runtime bytes, total
777,630. Reviewed non-library assembly is 2,826 main bytes and 420 payload bytes.
Source inventory: 483 C files, 32 assembly entry markers, six manual declarations,
687 inline sites (331 register bindings, 348 empty constraints, one directive,
seven instruction templates). The new manual symbol names an existing finish
continuation; it is not additional unfinished code.

Evidence under `.deps/soundmain-packed/`: word-finish-production-build.log,
word-finish-production.json, word-finish-production-ram.json,
word-finish-check.log, word-finish-check-ram.log,
word-finish-source-audit.json and word-finish-ownership.log. The complete-call
report remains under `.deps/soundmain-complete/`.


## September 10, 2026 — fixed-rate stereo-word completion integrated (20 bytes)

Baseline: `8ca7c1eb`. `src/m4a_fixed_word_finish.c` replaces the five instructions
at 0x080CF7A8..0x080CF7BC: left/right stereo stores, right-store output writeback,
SUBS count by four, BGT backward to fixed-rate setup and B forward to channel
saving. Existing word_postincrement, subtract_compare and arm_adjacent early/
branch contracts produce the exact sequence without compiler changes. The
comparison uses the incoming signed count, preserving overflow behavior.

The linker enforces the original 20-byte extent, backward aligned setup at
0x080CF704, forward aligned save at 0x080CF8B8, copied-mixer scope and both ARM
branch ranges. `SoundMainRAM_FixedSetup` names the pre-existing local setup
entry; no new executable code is introduced there. Full ROM checksum passes.

`check_soundmain_fixed_word_finish.py` passes 101,760 cases per mode, 203,520
total across ROM and copied RAM. The cases cross 265 counts, four output
placements, six stereo-word pairs and sixteen initial NZCV states. Each mode
has 50,304 repeat and 51,456 save exits. Independent expected state checks
left-before-right stores, no reads/extra writes, output+4, wrapped count, exact
SUBS NZCV, every register, preserved SP/LR, both PCs and complete data/frame
memory with canaries. Output placements include left/right frame aliases.
The complete SoundMain regression passes 3,528 calls, including 1,728 deadline
exits; hardware cycle timing is outside these functional checks.

Refreshed main ownership: 719,572 C-owned instruction bytes (92.53%), 33,870
mixed-object bytes, 2,396 assembly-source bytes and 21,792 runtime bytes, total
777,630. Reviewed non-library assembly is 2,806 main bytes and 420 payload bytes.
Source inventory: 484 C files, 32 assembly entry markers, seven manual declarations,
691 inline sites (335 register bindings, 348 empty constraints, one directive,
seven instruction templates). The additional manual declaration is the existing
setup entry's exported name. Packed-lane control and broader frame/channel and
runtime rebuilding work remain incomplete.

Evidence under `.deps/soundmain-packed/`: fixed-word-finish-production-build.log,
fixed-word-finish-production.json, fixed-word-finish-production-ram.json,
fixed-word-finish-check.log, fixed-word-finish-check-ram.log,
fixed-word-finish-source-audit.json and fixed-word-finish-ownership.log. The
complete-call report remains under `.deps/soundmain-complete/`.


## September 10, 2026 — both packed-lane advances integrated (16 bytes)

Baseline: `10902bdd`. `src/m4a_fixed_lane.c` replaces the ADDS/BCC pair at
0x080CF7A0 and `src/m4a_resample_lane.c` replaces the pair at 0x080CF894. Both
use unsigned addition overflow to add 0x40000000 to packed output r5, branch
to the respective mixing entry when carry is clear, and fall through to word
completion on carry. The linker enforces each eight-byte extent, adjacent
completion and backward aligned mixing target/range inside the copied mixer.

The opt-in arm_adjacent early-exit condition whitelist additionally accepts
LTU/GEU. It preserves the condition and CC mode supplied by add_carry, including
CC_C's reversed carry representation; default EQ/NE diamonds are unchanged.
No backend MD changes or instruction-bearing C assembly templates were added.

`check_soundmain_lane.py` passes 24,928 cases per mode, 49,856 across production/
original ROM and copied RAM. Each mode crosses 779 output values, two entries
and sixteen incoming NZCV states: 18,464 mix exits and 6,464 word exits. The
independent expected state checks wrapped r5, exact ADDS NZCV, every register,
SP/LR, exit PC and frame canaries. Boundary values include all four packed lanes,
carry/overflow transitions and deterministic random values. The complete
SoundMain regression passes 3,528 calls, including 1,728 deadline exits.
The full 16 MiB ROM passes its original SHA-1 check.

`check_arm_carry_early.py` passes 4,672 synthetic carry-set/clear executions in
ROM and relocated code. Four invalid forms reject; the extra-return case is
rejected by add_carry before arm_adjacent runs. The initial test incorrectly
required an arm_adjacent diagnostic for that case; its expected diagnostic is
now specific to the earlier pass. Production code did not change for that fix.
Existing regressions pass: adjacent 160 executions/11 compiler/2 link rejects;
conditional 13,632/11/3; frame 55,296/8; LR read-only and accumulator 13,056 each
with nine rejects each; early, repeat and pop-pair guards 12, eight and ten.

Refreshed main ownership: 719,588 C-owned instruction bytes (92.54%), 33,870
mixed-object bytes, 2,380 assembly-source bytes and 21,792 runtime bytes, total
777,630. Reviewed non-library assembly is 2,790 main bytes and 420 payload bytes.
Source inventory: 486 C files, 32 assembly entry markers, five manual declarations,
693 inline sites (337 register bindings, 348 empty constraints, one directive,
seven instruction templates). Remaining audio setup/frame/channel paths and
runtime C rebuild verification remain open. This is not overall 100% completion.

Evidence under `.deps/soundmain-packed/`: lane-production-build.log,
lane-production.json, lane-production-ram.json, lane-check.log,
lane-check-ram.log, lane-regression-*.log, lane-source-audit.json and
lane-ownership.log. Complete-call evidence is in
`.deps/soundmain-complete/production-report.json`. Ownership, inline and runtime
reports were regenerated from the current build.


## September 10, 2026 — runtime C source rebuild verified in all four images

Baseline: `9a1fa839`. `scripts/verify_runtime_rebuild.py` extracts libc, libgcc,
and ginclude directly from agbcc pin da598c1d918402c42c0c0d7128ba14567f3175e9 into
a fresh isolated directory. It builds both complete libraries with the pinned
Makefiles and fingerprinted installed old_agbcc. Generated floating-point and
allocator variants use that snapshot's headers/macros; no earlier library
objects or preprocessed files are reused. Installed production archives remain
untouched. Compiler bootstrapping is outside this verifier.

Relinking with only the fresh archive search paths reproduces every byte of the
16 MiB main ROM (SHA-1 c25b145e37456171ada4b0d440bf88a19f4d509f) and all three
payload variants: mgfembp, mgfembp_20030206 and mgfembp_20030219. The verifier
checks that both new archives appear in each link map, and compares exported
symbol addresses and sizes against each production ELF, including RAM symbols.
Non-runtime project objects come from the current production builds. Payload
input-object order is recovered from each current map's LOAD records.

This verifies C-source rebuilds for 21,066 main-ROM and 94 expanded-payload
runtime instruction bytes. It does not increase the C-only ownership figure:
six assembly helpers still contribute 726 instruction bytes per image, and the
main syscalls.o object contains inline assembly. Its whole 1,014 instruction
bytes must not be reported as an inline assembly count. Remaining work includes
that instruction-level review and recovery, as well as broader assembly removal.

The runtime inventory now consumes the rebuild receipt, checks current source
pin, installed compiler/archives, all four ELF/map/image hashes and symbol-match
results, and distinguishes verified rebuilds from source location alone.
Three negative checks reject a changed compiler fingerprint, stale main ELF
fingerprint and missing payload result. Evidence is in docs/runtime-rebuild.json
and docs/runtime-source-inventory.{json,md}; detailed build/link logs are in the
fresh build directory recorded by the receipt. The initial verifier used the
main linker-script name for payloads; after correcting it to mgfembp.lds, a
fresh full run passed for all four images.

Reproduce with:

```
python3 scripts/verify_runtime_rebuild.py --json docs/runtime-rebuild.json
python3 scripts/audit_runtime_sources.py --markdown docs/runtime-source-inventory.md > docs/runtime-source-inventory.json
```

The main-ROM instruction ownership remains 92.54%; reviewed non-library
assembly remains 2,790 main bytes and 420 payload bytes. Runtime rebuilding
closes a verification gap rather than claiming new assembly-to-C conversion.


## September 10, 2026 — complete resampling setup integrated (28 bytes)

Baseline: `e6d5650b`. `src/m4a_resample_setup.c` replaces all seven instructions
at 0x080CF824..0x080CF840: PUSH r4/r12, fractional LR load, frequency r1 load,
MUL r4,r12,r1, current signed sample load, next signed sample preincrement load,
and difference subtraction. Original entry and adjacent mixing continuation
are enforced by linker assertions. The C product operand order preserves the
original multiplier encoding; global r2 is reserved to retain the sample count.

The arm_adjacent contract adds opt-in `sp-input=push2` and `lr-input=load-word`.
Push lowering accepts only SP-=8 followed immediately by ascending r0-r12 word
stores to SP/SP+4 after the sole compiler LR push. It uses GCC's existing
UNSPEC_PUSH_MULT pattern: the ordinary store-multiple predicate rejects negative
writeback. The combined memory has conservative alias information and retains
volatility. LR loading allows exactly one unconditional SI load from a general
base with optional aligned offset 0..60. Existing whole-body validation rejects
other explicit SP/LR effects and removes only the verified compiler frame/tail.
Default contracts and backend MD are unchanged.

`check_soundmain_resample_setup.py` compiles and byte-checks a standalone object,
checks the production symbol/28-byte extent, and runs 66,560 cases on four
machines: original/production ROM and copied RAM. The 65,536 sample pairs cover
every possible pair of signed bytes; 1,024 additional cases cross eight product
boundaries, sixteen NZCV states and stack/channel/source aliases. Independent
expected state verifies all r0-r12, LR/fraction, SP-8, unchanged NZCV, final PC,
ordered two stack stores/two channel reads/two sample reads, and complete tested
RAM/data regions with canaries. Alias expectations apply stack writes before
channel/sample reads. The complete production SoundMain passes 3,528 calls.
The full ROM checksum passes.

`check_arm_push_pair.py` rejects 13 invalid contracts: wrong stack step/offset,
reversed registers, barrier, extra stack access, extra LR load, LR arithmetic,
missing LR load, wrong LR/frame mode, debug, unwind and Thumb. Existing adjacent,
conditional, frame, read-only/accumulator LR, carry-early, early, repeat and
pop-pair suites all pass. Fresh runtime libraries reproduce all four updated
production images and exported symbols; runtime receipt/inventory were refreshed.

Ownership is now 719,616 C-owned instruction bytes (92.54%), 33,870 mixed,
2,352 assembly-source and 21,792 runtime, total 777,630. Reviewed non-library
assembly is 2,762 main bytes and 420 payload bytes. Source inventory: 487 C files,
32 assembly entry markers, five manual declarations, 701 inline sites (345
register bindings, 348 empty constraints, one directive, seven instruction
templates). Remaining fixed-rate setup, channel/frame control, other audio
handlers and broader assembly recovery are unfinished.

Evidence: `.deps/soundmain-packed/resample-setup/report.json`,
resample-setup-production-build.log, resample-setup-production-check.log,
push-pair-guards.log, push-regression-*.log, setup-source-audit.json and
setup-ownership.log. Full-call evidence is under `.deps/soundmain-complete/`;
current runtime rebuild evidence is in docs/runtime-rebuild.json.


## September 10, 2026 — fixed-rate setup arithmetic and paths verified

Baseline: `9c84aa8f`. `research/audio/soundmain_fixed_setup.c` recovers the
44-byte setup at 0x080CF704. Its first signed comparison selects the short path
for count<=4. Otherwise subtraction updates r2 and compares the original signed
count with signed requested r8: the remaining-data path clears LR, while the
final-data path restores the count, adjusts r8/LR, masks the count to two bits,
and replaces zero with four. Existing matching_subtract_compare produces the
original SUBS and final ANDS/MOVEQ sequence, preserving overflow and carry.

`check_soundmain_fixed_setup.py` compiles the candidate and passes 100,864 cases
across 394 counts, sixteen requested counts and sixteen initial NZCV states.
Each case checks four machines: original/candidate ROM and copied RAM. Outcomes:
19,712 short, 58,704 packed-with-data-remaining, 22,448 final packed segment;
10,192 cases have subtraction overflow. Independent expected state verifies
r0-r12, LR, SP, NZCV, selected exit and frame canaries. Counts include all byte
values, deterministic random full-width values, audio-buffer sizes, signed
extremes and wrap boundaries. LR inputs include zero, one and full-width values.

This is deliberately a semantic-body check: the candidate's initial compiler
LR push is skipped, and code hooks stop before each BL can overwrite LR. The
emitted function is 76 bytes, with a common LR restore/return and three call
sites. It is not yet the original 44-byte private entry and is not in production.
The next compiler work must validate both early exits, predicate the early LR
zero assignment and remove the common frame/tail without altering other paths.
No compiler or production source changed in this milestone. The standing
ownership/remaining-assembly counts are unchanged.

Evidence: `.deps/soundmain-packed/fixed-setup/report.json`, candidate.o/.elf/.bin
in the same directory, fixed-setup.s, fixed-setup-build.log and fixed-setup-check.log.
The original ROM SHA-1 is verified before every execution run.


## September 10, 2026 — fixed-rate setup integrated as exact 44-byte C

Baseline: `a0311d84`. The previously verified candidate is promoted to
`src/m4a_fixed_setup.c` and replaces 0x080CF704..0x080CF730. All eleven original
instructions match, including BLE to the short path, SUBS/MOVGT/BGT to packed
mixing, LR/count restoration and ANDS/MOVEQ final remainder. Link assertions
check the original entry/44-byte extent, adjacent aligned packed continuation
and forward aligned short continuation within the copied mixer/branch range.

The opt-in `early-pair` continuation contract validates exactly two prefix
conditional branches and three labels: one early direct call, one early LR=0
assignment plus call, and the main call, all sharing the same LR restore/return.
The second early assignment must be exactly LR=0 under the explicit remainder
LR contract. It moves before its branch under that branch's unchanged condition;
both branches become external transfers. Main and second early calls must name
the same adjacent destination. Extra alternate-block work, target changes and
unsupported frame/LR operations reject. Remaining body/frame validation uses
the existing private continuation checks.

The first prototype emitted a new predicated instruction after shortening and
triggered GCC's final-pass address-table assertion. The final implementation
reuses and moves the original assignment instruction UID, maintaining the
fixed-width representation without changing the GCC backend MD. `lr-input=remainder`
accepts only a general-register copy into LR, LR minus a general register, or a
CC-predicated zero assignment. No instruction-bearing C assembly was added.

`check_soundmain_fixed_setup.py` now compiles the exact standalone 44-byte
object, verifies the production symbol/extent/bytes, and tests full real entries
without skipping any frame instructions or intercepting calls. All 100,864
cases pass on original/production ROM and copied RAM: 19,712 short, 58,704
packed-with-data-remaining, 22,448 final packed, including 10,192 subtraction
overflows. Independent full r0-r12/LR/SP/NZCV, path and canary expectations agree.
The complete production SoundMain passes 3,528 calls and the full ROM checksum
passes. Twelve invalid two-exit configurations reject. Adjacent, conditional,
frame, LR read-only/accumulator, carry-early, early, repeat, pop-pair and push-pair
regression suites all pass. Fresh runtime libraries reproduce all four updated
images and exported symbols; the runtime receipt and inventory were regenerated.

Main ownership is now 719,660 C-owned instruction bytes (92.55%), 33,870 mixed,
2,308 assembly-source and 21,792 runtime, total 777,630. Reviewed non-library
assembly is 2,718 main bytes and 420 payload bytes. Source inventory: 488 C files,
32 assembly entry markers, four manual declarations, 704 inline sites (348
register bindings, 348 empty constraints, one directive, seven instruction
templates). Remaining channel/frame control, sample-path entry/exit assembly,
other audio handlers and broader assembly recovery remain unfinished.

Evidence under `.deps/soundmain-packed/`: fixed-setup/report.json,
fixed-setup-production-build.log, fixed-setup-production-check.log,
early-pair-regression-*.log, fixed-setup-source-audit.json and
fixed-setup-ownership.log. Full-call evidence is under `.deps/soundmain-complete/`;
fresh library evidence is recorded by docs/runtime-rebuild.json.


## September 10, 2026 — shared sample-path entry integrated (32 bytes)

Baseline: `3376f630`. `src/m4a_sample_entry.c` replaces all eight instructions at
0x080CF6E4..0x080CF704: save r8 to incoming SP, read right/left envelope volumes,
shift both by sixteen, read the channel type, TST bit three and BEQ resampling
setup. The fixed path falls through to its adjacent C setup. Link assertions
check the original entry and size, adjacent aligned fixed setup, and forward
aligned resampling setup inside the copied mixer and branch range. The existing
Thumb ADR/BX still enters the original address via the retained boundary label.

The opt-in arm_adjacent `sp-input=store0` contract accepts exactly a general
r0-r12 SI store at SP as the first instruction after the sole compiler LR save.
It leaves that store and its memory attributes unchanged; the complete body
validator rejects every other SP access/update. Standard private frame/tail
removal then eliminates the compiler's LR save/restore. No GCC backend MD or
instruction-bearing C assembly was added. Other stack modes are unchanged.

`check_soundmain_sample_entry.py` compiles the exact standalone 32-byte object,
verifies production symbol/extent/bytes and passes 75,776 cases on four machines:
original/production ROM and copied RAM. The 65,536 volume pairs also cover all
channel type bytes and incoming NZCV states. Another 10,240 cases cross five
channel placements relative to SP, eight sample-count boundaries, sixteen type
values and sixteen NZCV states. Expected memory applies the count store before
reading potentially overlapping volume/type fields. All r0-r12, SP, LR, PC,
TST NZCV, ordered store/three reads and complete tested data/frame memory agree.
The complete SoundMain suite passes 3,528 calls; full ROM checksum passes.

`check_arm_store_zero.py` rejects twelve invalid forms: wrong offset, byte or
halfword store, extra stack store/read, delayed prefix store, barrier, missing
SP binding, wrong frame mode, debug, unwind and Thumb. Existing adjacent,
conditional, frame, LR, carry, early, early-pair, repeat, pop-pair and push-pair
regressions pass. Fresh runtime archives reproduce all four current images and
exported symbols; runtime evidence and all ownership/inline reports are refreshed.

Main ownership: 719,692 C-owned instruction bytes (92.55%), 33,870 mixed,
2,276 assembly-source and 21,792 runtime, total 777,630. Reviewed non-library
assembly is 2,686 main bytes and 420 payload bytes. Source inventory: 489 C files,
32 assembly entry markers, four manual declarations, 710 inline sites (354
register bindings, 348 empty constraints, one directive, seven instruction
templates). Channel/frame control, resampling exit and other audio/hardware
assembly remain unfinished.

Evidence under `.deps/soundmain-packed/`: sample-entry/report.json,
sample-entry-production-build.log, sample-entry-production-check.log,
store0-regression-*.log, sample-entry-source-audit.json and
sample-entry-ownership.log. Complete-call evidence is under
`.deps/soundmain-complete/`; fresh-library receipts remain in docs/runtime-rebuild.json.


## September 10, 2026 — final ARM mixer exits integrated; 488-byte region complete

Baseline: `50f5de71`. `src/m4a_resample_finish.c` replaces the eight-byte
SUB r3,1 / POP r4,r12 sequence at 0x080CF8AC and falls through to adjacent
resampled-channel saving at 0x080CF8B4. The private pop-pair contract gains
`pop2-decrement`: exactly one nonflag general-register decrement by one before
the existing ascending two-word restores and SP+=8. The decremented register
must differ from both restored registers. Only the existing restore operations
are folded; the prefix is retained. Ordinary pop2 is unchanged.

`src/m4a_partial.c` now owns the terminal B to frame restoration at 0x080CF8C0,
using the existing transfer=branch contract. Its exact size grows from 36 to
40 bytes; the old assembly-only PartialDone entry is removed. Link assertions
check both original extents/entries, adjacent resampled saving and the aligned
forward frame-restore branch within the copied mixer/range.

The resampling-exit suite passes 100,608 cases per placement, 201,216 total
across original/production ROM and copied RAM. It covers 262 saved-channel
values, eight saved-product boundaries, three stack placements, sixteen flag
states, selected full-width source values including zero/one, and arbitrary LR.
Expected state checks source minus one with wrap, ordered two-word reads,
restored r4/r12, SP+8, unchanged NZCV/LR, all other registers, exact exit PC and
untouched frame/canaries. Partial completion passes 61,440 cases through the
actual final branch, preserving its previous alias, rotation, status and ordered
write coverage. Ten invalid decrement/pop contracts reject. All existing
adjacent/conditional/frame/LR/carry/early/early-pair/store/pop/push regression
suites pass. Complete production SoundMain passes 3,528 calls; full ROM checksum
and fresh runtime-library relinks of all four images/symbols pass.

A linked-region audit verifies contiguous coverage of 0x080CF6E4..0x080CF8CC:
all 488 bytes are ARM instructions owned by C-only objects in the current
ownership inventory, with no gaps or overlaps. The audit checks the common ELF
fingerprint and records each contributing region in docs/mixer-arm-region.json.
This completes the ARM sample-mixing region, not the full SoundMain routine:
surrounding Thumb setup/channel/frame control and no-reverb clearing remain.

Main ownership is now 719,704 C-owned instruction bytes (92.55%), 33,870 mixed,
2,264 assembly-source and 21,792 runtime, total 777,630. Reviewed non-library
assembly is 2,674 main bytes and 420 payload bytes. Source inventory: 490 C files,
32 assembly entry markers, two manual declarations, 714 inline sites (358
register bindings, 348 empty constraints, one directive, seven instruction
templates). Runtime/inline/hardware work and full coverage accounting remain open.

Evidence under `.deps/soundmain-packed/`: mixer-exits-production-build.log,
resample-finish-production*.json, partial-production*.json, exits-regression-*.log,
mixer-exits-source-audit.json, mixer-exits-ownership.log and mixer-exits-linked.json.
Current complete-call and runtime receipts are maintained in their usual locations.


## September 10, 2026 — no-reverb Thumb clearing semantics recovered

Baseline: `45b2789f`. `research/audio/soundmain_no_reverb.c` models the 46-byte
Thumb path at 0x080CF5AC..0x080CF5DA. It clears one stereo word pair when count
bit two is set, two pairs for bit three, then always enters a four-pair loop.
The number of cleared words per side is `(bit2 ? 1 : 0) + (bit3 ? 2 : 0) +
4 * max(count >> 4, 1)`. Thus counts below sixteen still clear at least sixteen
bytes per side; simplifying the code to a conventional count-bounded clear
would change original behavior. Counts below four are also included in research.

`check_soundmain_no_reverb.py` compiles the C candidate and passes 14,640 cases
on four machines: original/candidate ROM and copied RAM. It crosses 183 counts
(all 0..63, multiples of four through 528, 1023 and 1024), offsets -12/0/4/8/1584,
and sixteen initial NZCV states. Each implementation performs 1,554,080 checked
ordered writes across these cases. An independent model checks every stereo
store, pointer/counter/zero-register results, full tested output memory and
stack canaries, including overlapping buffers. Original registers and final
flags are checked independently; candidate deviations are counted explicitly.

The generated Thumb candidate is 70 bytes, compared with the original 46.
Scratch r2/r3 differ in all 14,640 cases, and the final carry flag differs in
1,280 cases with counts below sixteen. Normal-count output flags agree. The
candidate is stopped before its BX LR, while the original reaches channel setup
by fallthrough. Neither these state differences nor that control-flow difference
are treated as an acceptable matching replacement. Production source, compiler
passes, ownership and completion counts are unchanged.

Next work must recover the original shift/carry selection, interleaved STM
writeback, countdown flags and private fallthrough. The current countdown rule
requires a positive initializer and a single loop branch; the word-postincrement
rule is ARM-only. They cannot be applied unchanged to this zero-inclusive Thumb
path. The complete no-reverb path remains unintegrated.

Evidence: `.deps/soundmain-packed/no-reverb/report.json`, candidate.o/.elf/.bin
in that directory, no-reverb.s, no-reverb-build.log and no-reverb-check.log.
The original ROM hash is verified for every test run. Larger counts than 1024
are not execution-tested by this suite.


## September 10, 2026 — Thumb word writeback reduces no-reverb matching gaps

Baseline: `8279bf8b`. The no-reverb candidate now explicitly ties its private
counter after copying r8, and ties each pointer after its word increment. The
empty compiler constraints prevent address coalescing across interleaved stores.
They contain no executable assembly. The opt-in new attribute
matching_thumb_word_postincrement folds only an adjacent SI store plus same-base
increment by four into Thumb's POST_INC/STMIA instruction. Base and value must
be distinct low RTL registers. The original ARM attribute remains ARM-only;
dual attributes and invalid patterns reject. MEM attributes and volatility are
retained, and the update's REG_INC note is recorded.

The generated no-reverb function drops from 70 to 62 bytes (original 46), and
r2 is now preserved. All 14,640 original/candidate ROM/copied-RAM cases still
match ordered stores, required output registers and full tested memory, including
1,554,080 stores per implementation. Remaining mismatches are r3 in all cases,
carry flags in the 1,280 counts-below-sixteen cases, and the terminal return/code
layout. This remains research code and is not production coverage.

`check_thumb_word_postincrement.py` passes 147,456 execution cases across four
low-register base/value pairs, 384 values, three output addresses, sixteen NZCV
states and both ARM/Thumb returns. It checks exact STM/BX bytes, all registers,
SP/LR, preserved flags, exact single write and memory value, including writing
at SP. Six invalid cases reject; an unannotated object is unchanged. A high C
value-register case is explicitly accepted when GCC inserts MOV r3,r8 before
the legal low-register STM. The initial test incorrectly expected that source
form to reject; no compiler change was needed to correct that expectation.
The existing ARM writeback suite passes 37,056 comparisons and nine rejections.
Full production ROM comparison passes and its ELF SHA-256 remains identical to
the recorded ownership inventory. No production source or coverage counts changed.

Evidence: `.deps/soundmain-packed/no-reverb/report.json`,
no-reverb-writeback-check.log, thumb-writeback-check.log,
thumb-writeback-arm-regression.log, thumb-writeback-production-build.log and
thumb-writeback-build.log. The unresolved shift/carry and zero-inclusive countdown
rules remain the next matching work.


## September 10, 2026 — retained Thumb shift/carry removes the final scratch clobber

Baseline: `b11db938`. `matching_shift_carry` and its explicit Thumb backend
pattern fold an exact copied-counter/right-shift/empty-tie/bit-branch sequence.
The temporary must be a distinct nonglobal low register, dead and clobbered at
the branch; the tested bit must equal shift amount minus one. The shift amount
is limited to 1..31. The replacement emits LSRS counter,counter,n and BCC/BCS,
while its RTL explicitly retains the counter result and describes the branch
on the discarded bit. It does not merely clobber a value needed by later code.
Only a short forward single-block target with <=240 bytes of intervening code
is accepted; other control flow and executable assembly reject.

The no-reverb C candidate explicitly captures the discarded bit through an
unsigned left shift and uses a branch-likelihood hint to keep its stores inline.
Both decisions now use the original right-shift/carry structure. Its generated
size drops from 62 to 50 bytes and the r3 clobber disappears. All 14,640 cases
continue matching ordered memory effects and now have no register differences
across original/candidate ROM/copied RAM. The remaining differences are the
extra countdown CMP (carry differs in 1,280 below-sixteen cases) and BX LR where
the original falls through. The original 46-byte block remains in production.

The pinned GCC backend was rebuilt from the verified source using the normal
builder, followed by the new plugin and production build. Full ROM checksum
passes and the production ELF is unchanged from the ownership inventory.
The complete production SoundMain suite passes 3,528 calls. No production
coverage increase is claimed for this compiler/research milestone.

`check_shift_carry.py` passes 140,864 executions: 31 shifts, two polarities,
71 boundary/random values per shift, sixteen incoming NZCV states and ROM/RAM
placements. It checks the exact LSRS/carry opcodes, all registers, unchanged
SP/LR, branch exit and full shift NZCV including preserved V. Nine invalid forms
reject: wrong bit/shift pairing, missing tie, intervening work, live temporary,
high counter, shift 32, ARM mode and an executable-assembly long target. An
unannotated object remains identical. The initial plugin build encountered a
C++ name collision with opt_pass::next; renaming its iterator helper resolved
that build issue without changing the matching contract.

Evidence under `.deps/soundmain-packed/`: shift-carry-backend-build.log,
shift-carry-plugin-build.log, shift-carry-check.log,
no-reverb-shift-carry-check.log, no-reverb/report.json and
shift-carry-production-build.log. Source inventory/remaining assembly figures
are unchanged. Next work is the zero-inclusive Thumb countdown and private
fallthrough contract.

## No-reverb clearing integrated as exact Thumb C — September 10, 2026

Baseline `f8051e82` plus this change replaces the 46-byte block at
`0x080CF5AC..0x080CF5DA` with `src/m4a_no_reverb.c`. The earlier 50-byte
candidate is now exact: the countdown uses the original SUBS/BGT flags and
falls through to the neighboring Thumb channel setup. No instruction-bearing
inline assembly was added; the new source has five register bindings and five
empty constraint sites (724 inline sites total, 363 bindings and 353 empty ties).

The opt-in `matching_shift_loop_fallthrough` compiler contract requires the
existing shift/carry contract, a zero-frame private void entry, and no arguments,
debug, exceptions or unwind instrumentation. It validates a terminal decrement
by one and signed-positive loop, a straight loop body that cannot rewrite the
counter, and only forward prefix branches that each assign the same counter an
unsigned-right-shifted value. Thus the counter starts in 0..INT_MAX; subtraction
never overflows, including zero becoming -1. It rejects private SP/LR accesses,
calls, executable assembly, unbounded initialization and oversized loop bodies.
Only the verified leaf return is removed. This is an explicit private fallthrough
ABI, with entry, extent and adjacent destination enforced by the linker.

Splitting the following Thumb section requires halfword alignment. Its retained
PC-relative VCOUNT load and ARM-entry ADR account for the section's two-byte
word offset; literal padding remains explicit, and objcopy lowers only this
section's alignment to two. Linker checks enforce the section offset and aligned
ARM destination. All bytes, including the neighboring code and padding, match
the original ROM. This section remains assembly and is still counted as such.

Validation:

- `make compare -j8`: all 16 MiB match the supplied USA ROM.
- `check_soundmain_no_reverb.py`: exact 46-byte object and production symbol;
  14,640 cases in original/candidate ROM and copied RAM, with production ROM
  equality also required. All registers, NZCV, SP/LR, frame, memory, ordered
  writes and terminal fallthrough agree. Counts include 0..63, multiples of
  four through 528, and 1023/1024; larger complete loops are not execution-tested.
- `check_shift_loop.py`: 16,448 single-countdown boundary executions across
  zero, positive values up to INT_MAX, all flags and ROM/RAM; 12 unsafe forms
  reject. Testing the final iteration avoids impractically long INT_MAX loops.
- `check_shift_carry.py`: 140,864 existing executions and nine rejection cases
  still pass; unannotated object output is unchanged.
- `check_soundmain_complete.py --production`: 3,528 complete calls pass, with
  the existing semantic-composition/cycle-timing limitations unchanged.
- Fresh pinned libc/libgcc rebuilds reproduce all four images and exported
  symbol sets; runtime, inline and ownership evidence is refreshed.

C-only main-ROM instruction ownership rises by 46 bytes to 719,750 of 777,630
(92.56%, including inherited work). Reviewed non-library assembly falls to 2,628
main-ROM bytes; the expanded-payload total remains 420. The contiguous 488-byte
ARM region is unchanged and its evidence is tied to the new production ELF.
Remaining Thumb channel/setup/control code and final executable classification
remain in scope; this milestone does not establish overall completion.

## Channel setup integrated as exact Thumb C — September 10, 2026

Baseline `6c5c3b53` plus this change replaces the ten bytes at
`0x080CF5DA..0x080CF5E4` with `src/m4a_channel_setup.c`. C loads the sound-info
pointer from private frame offset 24, transfers divFreq to r12, loads maxChans
into r0, advances r4 to the first channel, and falls through to the channel loop.
All five original instructions and resulting ADDS flags are preserved.

The new explicit `matching_thumb_fallthrough` compiler attribute requires
Thumb-1, a zero-local-frame void function without arguments or debug/unwind
instrumentation, and one straight body with no calls, branches, assembly or LR
access. Each SP reference must be an aligned SI load from offset 0..60 into a
general register. It removes only the validated leaf SP-use/LR-use/return tail.
The linker verifies the ten-byte extent, original entry and adjacent channel
loop. The C source contributes four register bindings and no instruction-bearing
inline assembly; total source sites are 728 (367 bindings, 353 empty constraints,
one directive and seven instruction templates).

The retained channel-loop assembly now starts word-aligned at `0x080CF5E4`.
Its literal load and ADR no longer need the two-byte section-offset correction,
and the Makefile's special objcopy alignment adjustment is removed. Explicit
original zero padding is retained. The full ROM comparison confirms unchanged
neighboring instructions, branch relocations, data and padding.

`check_channel_setup.py` requires exact ten-byte candidate/original equality,
full production-ROM equality and the production symbol's address and size.
Its 12,288 cases run in both ROM and copied RAM, checking every register, NZCV,
SP/LR, exact fallthrough, all mapped data bytes and the three ordered reads.
They cover all 256 maxChans values, random divFreq/register contents, all 16
initial flags and three valid EWRAM sound-info/frame alias placements. Other
address regions are not execution-tested. Twelve unsupported compiler forms
reject (ARM, debug, unwind, arguments, calls, frame writes, out-of-frame and byte
reads, assembly, LR accesses, local frames and branches). An unannotated object
is identical with and without the plugin.

`make compare -j8`, the 3,528-case complete production audio regression and fresh
pinned runtime rebuilds for all four images/exported symbol sets pass. Ownership,
inline, runtime and unchanged 488-byte ARM-region evidence is refreshed. C-only
main instruction ownership is 719,760/777,630 (92.56%, including inherited work);
reviewed non-library assembly is 2,618 main-ROM and 420 expanded-payload bytes.
Channel-loop/control, entry/frame code, playback routines and complete executable
coverage accounting remain unfinished.

## Channel deadline semantics and matching gap — September 10, 2026

Research baseline `89342d36`: `research/audio/soundmain_deadline.c` preserves
channel-count storage, wave-pointer loading and the optional VCOUNT deadline
check at `0x080CF5E4..0x080CF604`. The original section contains 26 instruction
bytes, two alignment bytes and a four-byte VCOUNT pointer. Zero deadline skips
the hardware read. Otherwise the low VCOUNT byte is normalized by adding 228
below scanline 160 and compared to the deadline as an unsigned value. Equality
exits the mixer at `0x080CF8D6`; a smaller normalized scanline continues at
`0x080CF604`.

An initial return-value candidate caused GCC to introduce a saved-register frame,
which invalidated the private SP offsets. The current void candidate uses a
research decision register r2 and an empty r0 tie before the final comparison.
It emits no frame adjustment and keeps the original read/write order. It is not
integrated: the 36-byte section returns through BX LR rather than the original
conditional/direct transfers, changes r2 and changes continue-path flags.

`check_soundmain_deadline.py` passes 98,304 cases, each on four machines (original
and candidate in ROM and copied RAM). It tests all 256 VCOUNT bytes, deadlines
0, 1, normalized scanline minus/equal/plus one, INT_MAX, 0x80000000 and UINT_MAX;
all 16 initial NZCV states; and three channel/frame layouts, including wave
pointer aliasing with the count store or deadline. It independently checks the
branch decision, original subtraction flags, SP/LR, all registers, entire mapped
data memory and ordered frame/channel/MMIO accesses. The original paths comprise
12,288 no-deadline cases, 49,152 deadline-continue cases and 36,864 exits. Candidate
r2 differs in all 98,304 cases, and flags differ in the 49,152 continue cases;
all other registers agree. The candidate return is intercepted before BX LR.
PC-relative code/literal reads and cycle timing are not checked by this oracle.

The report is reproducible at `.deps/soundmain-packed/deadline/report.json`.
The production ELF hash still equals the current ownership receipt; no production
C, linker or compiler changes were made. The next step is matching the two Thumb
control destinations while preserving final compare flags and the original
section layout. Overall decompilation remains incomplete.

## Channel-deadline control integrated as exact C — September 10, 2026

Baseline `5aae98aa` plus this change integrates `src/m4a_deadline.c` at
`0x080CF5E4..0x080CF604`, including the original 26 instruction bytes, two zero
padding bytes and four-byte VCOUNT pointer. The C source uses direct terminal
calls to the channel continuation and mixer exit; the opt-in compiler turns
these into the original control transfers. The earlier research decision
register and return have been eliminated, with all scratch registers and flags
now matching. The original decision-register model remains available separately.

The existing tail-transfer pass gains two explicit options. `private-frame64`
permits only aligned SI word loads/stores between SP offsets 0..60 and general
registers, plus exact empty low-register ties. Taking the frame address, changing
SP/LR, local frames, arguments and executable assembly remain rejected. The
existing validated LR-only compiler frame is removed so the C source accesses
the mixer's incoming frame. `pool-adjacent-destination` requires exactly two
terminal calls, the declared continuation last, its leading label preceded by
the other terminal path, and precisely one aligned four-byte trailing pool.
Every original path must reach a terminal call. The continuation call is removed,
its label moves past the non-executable pool, and only the validated pool
alignment changes to zero padding. The other call becomes a direct Thumb branch.
Existing unsigned-bound normalization gives CMP 160/BCS instead of CMP 159/BHI;
all outgoing flags are independently checked for this block.

The linker verifies the original entry, word alignment, 32-byte section extent,
immediately adjacent continuation after the pool, and the forward Thumb exit's
short-branch range. The two exported continuation/exit labels remain assembly,
which accounts for the rise from one to three manual assembly declarations.
This is additional symbol visibility, not additional recovered code.

Validation:

- `make compare -j8`: all 16 MiB match, including all existing users of the
  rebuilt tail-transfer plugin.
- `check_soundmain_deadline.py --direct`: the entire candidate section matches
  the original bytes, the complete production ROM matches, and the production
  function address/size are exact. All 98,304 cases pass on four machines with
  original/candidate code in ROM and copied RAM. Both outgoing destinations,
  all registers, NZCV, SP/LR, mapped data and ordered frame/channel/MMIO accesses
  agree. No decision-register or flag differences remain. PC-relative literal
  access traces and cycle timing remain outside the oracle's scope.
- `check_tail_private_frame.py`: 17 unsupported configurations reject, including
  missing/wrong contracts, out-of-frame reads/writes, byte reads, frame-address
  escape, SP writes, executable/untied assembly, post-call work, absent pool,
  arguments, local frames, unsupported block order, ARM, debug and unwind.
- `check_tail_contracts.py`: 14 existing rejection cases still pass, direct
  transfer is accepted, and unannotated assembly remains unchanged.
- The complete production audio regression passes 3,528 calls; fresh pinned
  runtime libraries reproduce all four images and exported symbol sets.

Ownership, inline and runtime reports are refreshed, as is the ELF fingerprint
for the unchanged contiguous 488-byte C-only ARM mixer region. C-only mapped main
instruction ownership increases by 26 to 719,786 of 777,630 bytes (92.56%, including
inherited work). Reviewed non-library assembly falls to 2,592 main-ROM bytes;
the expanded payload remains 420 bytes. There are 735 inline sites: 372 register
bindings, 355 empty constraints, one directive and seven instruction templates.
Channel status/envelope code, entry/frame handling, playback routines and full
executable coverage accounting remain in scope.

## Channel status/envelope candidate and acyclic control — September 10, 2026

Research baseline `91725054`: `research/audio/soundmain_envelope.c` models the
complete 160-byte region at `0x080CF604..0x080CF6A4`, through the outgoing volume
or skip decision. The source preserves explicit register state, byte-sized wave
flag reads, channel initialization, echo lifetime, release/decay/sustain and
attack saturation. Original assembly label names contain obsolete address-like
numbers; the block boundary was verified from the object symbol `_081DD006` at
offset 0xA0, not inferred from its spelling.

The first compiler output introduced a saved-register frame and scratch copies.
Empty register ties remove that frame and retain status, level and phase in the
original registers. The final candidate is 174 bytes (initially 176), with no
register differences in the tested cases. It is not integrated: instruction
ordering, extra branches/comparisons and zero-length echo flags remain different.
The flags differ because C currently emits a comparison after the byte-range
decrement/store; original zero-to-minus-one subtraction leaves carry clear,
whereas the subsequent comparison sets carry. The next matching work must
preserve the original subtract flags and branch sequence.

The existing tail-transfer pass adds an explicit `acyclic-branches` option,
which requires `private-frame64` and cannot combine with either adjacency mode.
It permits backward branches only while retaining the complete control-flow
proof that every path reaches a validated terminal call. The path traversal
rejects revisiting an instruction, so actual loops are still rejected. Default
contracts continue rejecting backward branches as before. No production source
uses the new option.

`check_soundmain_envelope.py` passes 196,608 cases on four machines each: original
and candidate in ROM/copied RAM, all 256 status values, envelope levels
0/1/127/255, parameter settings 0/1/128/255, all 16 NZCV values, and three
wave/channel aliases. These settings are representative rather than an exhaustive
cross-product of independent parameters. An independent mutable-memory model
checks decisions, every ordered byte/word access and complete tested RAM, including
alias-sensitive initialization reads. Store traces are normalized to their actual
byte/word width; full memory also verifies truncation. The block takes 87,552
skip paths and 109,056 volume paths. All registers and SP/LR agree between original
and candidate; 12,288 zero-length echo cases still have different flags. Timing is
not modeled. Results are reproducible in `.deps/soundmain-packed/envelope/report.json`.

Five invalid acyclic configurations reject: absent private-frame permission,
unopted backward flow, a genuine loop, post-call work and a bare-return path.
All 17 existing private-frame/pool checks and 14 older tail-contract rejection
cases pass, with unannotated assembly unchanged. `make compare -j8` still matches
the complete ROM, and the production ELF SHA-256 equals the current ownership
receipt. Production coverage is unchanged; this milestone does not claim the
remaining envelope region as decompiled.

## Original echo decrement flags recovered — September 10, 2026

Research baseline `b69fc6dc`: the envelope candidate decreases from 174 to 172
bytes and now agrees on all registers and NZCV in all 196,608 four-machine cases.
The former 12,288 zero-length echo flag differences are eliminated. Decisions,
ordered accesses and complete tested data memory continue to match. The original
region is still 160 bytes; extra branches, a redundant comparison and instruction
operand/layout differences remain, so this code is not integrated.

The installed pinned GCC backend's existing byte-decrement bundle now also
accepts explicit unsigned HI/LS branch senses. The new opt-in
`thumb_shared_literal` option `byte-counter-carry` uses them only after the
existing proof: an immediately preceding zero-extended byte load, decrement by
one, byte store through a distinct low base register at offset 0..31, and a
short forward signed-positive/nonpositive branch. Opaque output constraints,
signed-byte or word loads, other decrements and unsupported spans remain
unmodified. The range is 0..255, so SUBS sets C=0 for zero, Z=1 for one, and
C=1/Z=0 for 2..255; HI therefore implements the original signed-positive decision
while preserving the subtract flags. LS is its complement. The intervening STRB
preserves flags. The echo-length output tie was removed to expose the actual
byte-load range to this proof; no unsafe range assumption was added.

Validation:

- The isolated GCC backend rebuild succeeds from pinned source with the updated
  matching pattern; no new instruction-bearing C assembly is introduced.
- `check_byte_counter_carry_flags.py`: 49,152 exact SUBS/STRB/BHI-or-BLS
  executions cover both branch polarities, all byte inputs, all initial NZCV,
  three byte-store addresses and ROM/copied RAM. Full registers, SP/LR, final
  flags, branch destination, memory and the single truncated byte write agree.
- `check_thumb_byte_counter.py --carry`: 65,664 baseline/bundled executions
  pass; six unsupported forms retain identical assembly. The original signed
  mode also passes all 65,664 executions with the same unchanged negative forms.
- `check_soundmain_envelope.py`: all 196,608 cases pass with no register or flag
  differences; five invalid acyclic configurations still reject. The oracle's
  representative envelope parameters and lack of cycle modeling remain limits.
- `make compare -j8`: the entire ROM still matches. The production ELF SHA-256
  equals the ownership receipt, so production coverage and runtime evidence are
  unchanged.

A small compiler-option probe (branch-probability, jump-threading, dominator,
temporary-expression, if-conversion and partition controls) did not reduce the
remaining control-flow layout; no such option changes were retained. The next
step is to recover the original branch layout and eliminate remaining redundant
instructions without sacrificing the newly verified full-state behavior.

## Envelope sustain comparison and volume fallthrough — September 10, 2026

Research baseline `e944f591`: the envelope candidate decreases from 172 to 168
bytes while retaining zero register or flag differences across 196,608 original/
candidate ROM/copied-RAM cases. Ordered accesses, decisions and complete tested
data memory continue to agree. The original region is still 160 bytes, so this
is not production integration.

The C source now transfers directly to the skip destination at both stop sites,
matching the original control intent without a shared trailing skip stub. Removing
the empty tie after the sustain-to-level assignment lets the compiler combine
the move and zero test, removing a redundant comparison. The final volume call
uses an explicit checked fallthrough instead of an extra branch.

`terminal-adjacent-destination` is a new opt-in tail-transfer contract requiring
both private-frame and acyclic-control validation. It cannot combine with either
other adjacency mode. The declared destination must be the final terminal call,
and every subsequent executable RTL operation must already belong to the proven
common return cleanup. Trailing code or literal pools reject. Existing whole-path
validation still proves that every path reaches a declared terminal call and that
post-call work cannot be discarded. Only that final call is removed; its existing
incoming labels become the function-end continuation. Eventual production
integration must enforce the corresponding adjacent destination in the linker.

The envelope test linker places the volume destination exactly at the candidate
section end and the skip destination at a separate fixed Thumb target. Its oracle
now checks actual fallthrough at `start + candidate_size`, not a replaced jump.
All 196,608 cases pass with unchanged representative-parameter/timing limitations.
Nine invalid configurations reject, adding wrong final destination, trailing pool,
post-volume-call work and duplicate adjacency options to the five existing
acyclic guards. `--contracts-only` runs these compiler checks without repeating
or overwriting the execution report. All 17 private-frame/pool checks and 14
older tail-contract checks still pass, with unannotated assembly unchanged.

`make compare -j8` passes, and the production ELF SHA-256 equals the current
ownership receipt. Production coverage and runtime evidence remain unchanged.
Remaining work includes four surplus local branches from block ordering and
instruction-encoding differences; all newly recovered state behavior must remain
intact when matching those final bytes.

## Channel status/envelope integrated as exact C — September 10, 2026

Baseline `86e15a92` plus this change integrates `src/m4a_envelope.c` at
`0x080CF604..0x080CF6A4`. All 160 original instruction bytes match. The C block
handles status selection, initialization, echo lifetime, release, decay, sustain
and attack before falling through to volume calculation or branching to channel
advance. The last research source is moved into production, not counted twice.

The opt-in `matching_thumb_block_layout` pass requires validated tail-transfer
code, no arguments/local frame/debug/unwind/exceptions/profiling, resolved calls,
no data pools and only exact empty ties. It selects the retained 0x80 mask and
NE register-test branches followed by local branch stubs. A moved region must
start at its target label, have an unconditional predecessor at its old location,
and end at an unconditional transfer plus barrier. All internal labels and exits
move together. Conditional moves invert only EQ/NE and target a new label at the
old fallthrough; jump label references and use counts are updated. Closed forward
jump targets may similarly replace their caller jump, and jumps to the immediately
following label are removed. These checks preserve every logical edge while
eliminating the four extra branches. Regions without the required closed
boundaries are left in place; a function with no improvement rejects.

The same explicit private layout contract normalizes low-register TST operand
order and equivalent strict unsigned bounds. Low-register copies and subtract-zero
copies use a new explicit ADD-zero backend pattern that records its N/Z-setting
behavior, avoiding a redundant comparison. Both source/destination registers must
be distinct low SI registers. Ordinary ADD RTL also admits non-flag-setting forms,
which is why a dedicated matching pattern was needed. The compiler was rebuilt
from pinned source. No instruction-bearing inline assembly was introduced.

The linker requires the original entry, aligned 160-byte extent, adjacent Thumb
volume destination and in-range forward Thumb skip destination. The volume stage
remains assembly; the exported continuation name now belongs to the C function.

Validation:

- `make compare -j8`: all 16 MiB exactly match the supplied ROM.
- `check_soundmain_envelope.py`: candidate/original byte equality, complete
  production-ROM equality, and production entry address/size are required.
  All 196,608 cases pass on four machines (original/candidate ROM/copied RAM),
  with exact registers, NZCV, SP/LR, decisions, ordered accesses and tested data
  memory. Register/flag differences now fail the checker. Representative parameter
  settings and lack of cycle timing remain its documented execution limits.
- Eleven invalid layout/transfer configurations reject, including applying layout
  without a tail contract or without a region to improve. The unannotated object
  is identical with and without the layout plugin. The 17 existing private-frame/
  pool cases and 14 older tail-contract cases continue to pass.
- `check_thumb_add_zero_flags.py`: 33,088 executions of the actual two generated
  ADD-zero instructions pass over full-width boundary/random values, every initial
  NZCV and ROM/RAM. All registers, SP/LR, result, destination and flags agree.
- The complete production audio regression passes 3,528 calls. Fresh pinned runtime
  libraries reproduce all four images and exported symbol sets.

Ownership, inline and runtime receipts are refreshed, and the unchanged contiguous
488-byte ARM mixer proof uses the new ELF fingerprint. C-only mapped main-ROM
instructions rise by 160 to 719,946/777,630 (92.58%, including inherited work).
Reviewed non-library assembly is now 2,432 main-ROM and 420 expanded-payload bytes.
There are 764 inline sites: 378 register bindings, 378 empty constraints, one
directive and seven instruction templates. Volume/loop setup, entry/frame handling,
playback routines and final executable coverage accounting remain unfinished.


### Buffer entry private transfer (September 10, 2026; baseline d7169a14)

The research buffer checker now supports `--literals --transfer`. It appends a
C indirect terminal call through the bound r3 after an empty constraint and uses
the existing private-frame tail-transfer contract. The generated final instruction
is the original BX r3. The original ROM and candidate both execute to 0x03002c60
in Thumb mode; 98,304 cases verify all r0-r12, SP/LR, NZCV, complete test RAM and
ordered frame/info accesses. This is transfer-entry verification, not execution
of the subsequent mixer body.

The tail-transfer guard now accepts exact empty self-ties for registers r0-r12,
including the existing r8 sample-count constraint. It still rejects SP/LR ties,
instruction-bearing assembly and arbitrary untied assembly. Regression checks
accept r8/r12 empty ties, reject their instruction-bearing variants and all 12
existing indirect-transfer invalid contracts, and preserve unannotated output.
All 17 existing private-frame/adjacency rejection cases also pass.

The candidate remains research: 48 section bytes, 34 instruction bytes before
BX versus the original 32. An extra comparison, commuted ADD operands and private
literal placement still prevent byte matching. No C ownership increase is claimed.
`make compare -j8` passes and the production ELF hash remains identical to the
current ownership receipt. Evidence: `.deps/soundmain-packed/buffer-entry/report.json`
and `buffer-entry-transfer.log`; reproducible via
`research/audio/check_soundmain_buffer_entry.py --compiler
.deps/gcc16-matching/install/bin/arm-none-eabi-gcc --literals --transfer`.


### Buffer subtraction/branch matching (September 10, 2026; baseline e319cb1d)

The opt-in `matching_thumb_subtract_branch` compiler pass selects a new explicit
SUBS/BLS backend pattern for a distinct low-register subtraction by one, an exact
empty self-tie, and an immediately following unsigned <= 1 branch. It proves
short forward reach and rejects unsupported annotated functions. This preserves
the original subtraction flags without emitting a redundant comparison. The
machine pattern expresses both the result and the unsigned branch; it does not
substitute hardcoded routine bytes.

The rebuilt compiler passes 20,176 standalone executions over all byte values,
full-width boundaries, 1,000 deterministic random words and all 16 initial NZCV
states. Both destination entries, all r0-r12, flags and SP/LR are checked.
Twelve unsupported contracts reject, including distant targets, signed tests,
wrong subtraction/bounds, instruction-bearing ties and high result registers.
Unannotated compilation is byte-identical with and without the pass loaded.

`check_soundmain_buffer_entry.py --compiler
.deps/gcc16-matching/install/bin/arm-none-eabi-gcc --literals --transfer
--subtract-branch` passes all 98,304 cases. Its instruction prefix is 32 bytes
before the original BX r3, matching the original length. Direct comparison now
finds exactly three unequal instruction words out of 17: literal loads at
relative offsets 6 and 28, and the commuted ADD at offset 8. Shared pool placement
and alignment still prevent integration; the research section remains 48 bytes.
The first byte-difference assertion expected all three literal loads to differ;
inspection showed the RAM-pointer load already has the original relative offset,
so the assertion was corrected to the actual three differing words above.

`make compare -j8` passes after rebuilding the backend and dependent production
plugins. The production ELF hash remains identical to its ownership receipt.
This milestone changes research matching and compiler support, not production
C ownership. Logs: `.deps/soundmain-packed/buffer-subtract-branch.log`,
`subtract-backend-build.log` and `subtract-branch-compare.log`.


### Integrated SoundMain buffer setup (September 10, 2026; baseline cb4ce887)

`src/m4a_buffer_entry.c` now owns 0x080CF510..0x080CF534: 34 Thumb instruction
bytes followed by two zero padding bytes, all matching the original ROM.
The C code reloads post-callback sound info, preserves sample count in r8,
computes the DMA buffer address, stores the private frame pointer, sets the
buffer width and transfers through r3 to the copied mixer in Thumb mode.

The new opt-in ADD-order pass commutes a low-register addition to print the
destination as its first source. All 17,296 standalone arithmetic/NZCV cases
pass, seven unsupported contracts reject, and unannotated output is unchanged.
No new backend instruction is needed for this commutative rewrite. The existing
shared-literal pass maps both integer constants and the Thumb entry alias to
the original pool; zero padding preserves the full original section extent.

The remaining outer SoundMain assembly is split at the post-callback fallthrough.
Its three pool loads now use explicit R_ARM_THM_PC8 relocations, because the
assembler cannot directly encode the cross-section local load with a negative
implicit addend. Link assertions preserve the entry boundary, absolute address,
36-byte extent and six shared literal locations. Absolute-address checking uses
ABSOLUTE on the section-relative linker symbol. Four deliberately shifted
production layouts reject; the unmodified production link passes.

`check_soundmain_buffer_entry.py --compiler
.deps/gcc16-matching/install/bin/arm-none-eabi-gcc --literals --transfer
--subtract-branch --add-order --shared --production` verifies all 36 bytes and
passes 98,304 production/original cases with identical r0-r12, NZCV, SP/LR,
complete test RAM, ordered frame/info accesses and final Thumb mixer entry.
The complete production audio oracle also passes 3,528 cases. These are bounded
execution checks; no new cycle-timing claim is made.

`make compare -j8` verifies the entire 16 MiB ROM. Fresh runtime source rebuilds
reproduce all four images and exported symbols. Linked/source/inline/runtime
inventories and both copied-mixer receipts are refreshed for ELF SHA-256
`ebaeca75de36abc0048d750f7f26458477bb037f9986d14ee0b9ca0b609963f7`.
Main-ROM mapped instructions remain 777,630: 720,084 C-owned (92.60%), 33,870
mixed C/assembly, 1,884 assembly-source and 21,792 runtime, with zero unknown
ownership. Reviewed non-library assembly is 2,294 main-ROM instruction bytes
and 420 payload bytes. The source inventory has 501 C files and 31 assembly
entry markers. These totals include inherited work and are not overall completion.

Evidence logs: `.deps/soundmain-packed/buffer-production.log`,
`buffer-integrated-compare.log`, `buffer-layout/report.json`,
`.deps/soundmain-complete/production-run.log` and
`.deps/runtime-rebuild/verification.log`. The outer entry/locking, deadline and
callback prefix remains 72 bytes of assembly, with its 24-byte shared pool.
Other audio routines, runtime helpers, unit-list and transfer code and final
executable classification remain unfinished.


### Integrated outer SoundMain deadline setup (September 10, 2026; baseline 8cc774db)

`src/m4a_deadline_setup.c` now owns the exact 20 bytes at
0x080CF4E8..0x080CF4FC. It reads maxLines, conditionally reads the VCOUNT byte,
adds 228 before scanline 160, adds the deadline allowance, stores frame word 20
and falls through into the existing callback code. When maxLines is zero,
VCOUNT and r2 remain untouched. The existing shared pool supplies REG_VCOUNT.

The tail-transfer pass gains `after-shared-literals`, restricted to a single
terminal call under the private-frame/acyclic/terminal-adjacency contracts.
It executes after branch shortening, once shared-pool removal has run; it only
removes instructions or rewrites a branch comparison without changing its
length. The sole accepted trailing pool marker is a zero-valued, zero-code
VUNSPEC_POOL_END, which is discarded. Remaining alignment, data or instructions
still reject. Seven new rejection cases pass, along with the existing 14 direct,
17 private-frame/pool and 14 indirect contract cases. Existing users retain their
prior scheduling and behavior.

The exhaustive candidate/original oracle passes 2,097,152 cases: every maxLines
and VCOUNT byte pair, all 16 NZCV inputs and two info layouts, including aliasing
the final frame destination. It compares all r0-r12, SP/LR, flags, complete test
RAM, exact ordered info/MMIO reads and stack writes, and the final callback-entry
PC. Its original report says production_integrated=false because that execution
run started before integration. A separate `--guards-only --production` run
verifies that the integrated 20 bytes are identical to the exhaustively tested
candidate and that the complete production ROM has the original checksum.
No second exhaustive execution run is implied by that byte-verification receipt.
The complete audio production oracle passes 3,528 cases.

The assembly entry is split around the C fragment. Link assertions prove its
position, size, word alignment, callback adjacency and shared literal location;
four deliberately shifted production layouts reject. `make compare -j8` passes.
Fresh runtime rebuilds reproduce all four images and exported symbols. All linked,
source, inline and runtime inventories and the two unchanged copied-mixer region
receipts are refreshed for ELF SHA-256
`eeade9a07e8315bf5967eaa070b391dea618598519247dd9dd9d04225105f84a`.

Main-ROM mapped instructions remain 777,630: 720,104 C-owned (92.60%), 33,870 mixed
C/assembly, 1,864 assembly-source, and 21,792 runtime; unresolved ownership is zero.
Reviewed non-library assembly is 2,274 main-ROM instruction bytes and 420 payload
bytes. There are 502 tracked C files and 32 assembly entry markers. The additional
marker names the existing callback fragment after splitting SoundMain; it does
not represent added executable code or a new unfinished routine. The remaining
outer assembly is the 32-byte entry/lock/frame prefix and 20-byte callback fragment,
plus their 24-byte pool. Other audio, runtime, unit-list and transfer code and final
executable classification remain unfinished.

Evidence: `.deps/soundmain-packed/deadline-setup/report.json`,
`deadline-setup/guards.json`, `deadline-setup-integrated-compare.log`,
`deadline-layout/report.json`, `.deps/soundmain-complete/production-run.log` and
`.deps/runtime-rebuild/verification.log`.


### Integrated SoundMain callback fragment (September 10, 2026; baseline 2e442ceb)

`src/m4a_callbacks.c` owns the exact 20 bytes at 0x080CF4FC..0x080CF510.
The optional callback receives the intp field in r0; after it returns, the saved
SoundInfo pointer is reloaded from frame word 24. The mandatory callback pointer
is then read from that current info structure and invoked, followed by the
existing fallthrough into matching buffer setup. This preserves mutations made
by the optional callback to either the saved info pointer or mandatory callback.

The new restricted callback-chain compiler pass validates the complete allocated
load/branch/call/frame layout, removes the extra compiler LR frame and return,
and selects two BL instructions through the existing shared BX r3 entry. The
backend RTL expresses an indirect call through r3, with the trampoline symbol
and offset carried as operands. It does not embed recovered instruction bytes.
The target is the typed C function SoundMainRAM_ExitRestore plus 18, preserving
Thumb call relocation without an alias veneer. Both source and production are
compiled through assembly, as in the normal Makefile, to avoid mixing EABI0
research objects with EABI5 production assembly objects in the isolated link.

`check_soundmain_callback_chain.py --compiler
.deps/gcc16-matching/install/bin/arm-none-eabi-gcc --production` passes 27,648
cases and compares all 20 production bytes with the original and candidate.
Cases include absent/Thumb/ARM optional callbacks, Thumb/ARM mandatory callbacks,
three mutation policies, saved-info redirection, aliasing intp/frame words,
random callback register clobbers and every initial/first-callback NZCV pair.
Final callback flags range over all 16 values. Each call's target, r0-r12, SP,
LR and ARM/Thumb mode are checked, together with exact ordered source reads,
complete RAM and final registers/flags/return PC. The callbacks execute actual
BX LR return instructions, so interworking and link registers are exercised.
Twelve unsupported compiler contracts reject and unannotated output is unchanged.

The full ROM passes `make compare -j8`; the complete audio oracle passes 3,528
production cases. Fresh runtime source rebuilds reproduce all four images and
exported symbols. Link assertions preserve the callback entry, 20-byte extent,
final fallthrough and shared trampoline reach; three deliberately shifted layouts
reject. All source, linked, inline and runtime inventories and both unchanged
copied-mixer receipts are refreshed for ELF SHA-256
`a61649dae33649390b8be286b1c6da9ca490a93b860a3c24b1cfb506fe721837`.

Main-ROM mapped instructions remain 777,630: 720,124 C-owned (92.60%), 33,870 mixed
C/assembly, 1,844 assembly-source and 21,792 runtime, with zero unresolved ownership.
Reviewed non-library assembly is 2,254 main-ROM bytes and 420 payload bytes.
There are 503 tracked C files and 31 assembly entry markers. SoundMain's remaining
assembly instructions are its 32-byte entry/lock/frame prefix; its 24-byte shared
pool also remains in the assembly object. Other audio routines, runtime helpers,
unit-list and transfer code and final executable classification remain unfinished.

Evidence: `.deps/soundmain-packed/callbacks/report.json`, `production-check.log`,
`production-compare.log`, `layout/report.json`,
`.deps/soundmain-complete/production-run.log` and
`.deps/runtime-rebuild/verification.log`. No cycle-timing claim is made.


### Complete matching SoundMain (September 10, 2026; baseline 341919ce)

SoundMain's final 32-byte entry/lock/frame prefix is now in
`src/m4a_entry_frame.c`, and its shared six-word pool is defined in
`src/m4a_entry_literals.c`. Together with the previously integrated deadline,
callbacks, buffer setup and copied mixer, the complete contiguous region
0x080CF4C8..0x080CF8F0 is generated from C: 1,064 total bytes, comprising 452 Thumb
and 572 ARM instruction bytes (1,024 total), plus 40 data/alignment bytes.
Every byte remains identical to the original ROM.

The entry C expresses the pointer/lock reads, rejection, lock increment, two
ordered register-save banks and 24-byte scratch allocation. A volatile scalar
SP binding avoids the compiler retaining hidden pointer temporaries. The new
entry-frame contract validates the entire allocated sequence, including all
register bindings, pool values, empty ties, frame stores/copies, branch and
compiler entry/return. It selects PUSH {r4-r7,lr} and PUSH {r0-r4}, preserves the
original success branch and early BX LR, and removes the extra compiler frame.
Its backend patterns describe the ordered memory stores and SP changes; no
instruction bytes are embedded in C. The literal options must match the compiled
constant values before a shared load is selected.

The production entry oracle passes 77,824 cases, including 1,792 valid frame
entries. It covers lock boundary/bit changes, eight info layouts including saved
frame and pointer-slot aliases, random register values, every NZCV state and
ARM/Thumb early returns. All r0-r12, SP/LR, flags, complete RAM, ordered pointer
reads and lock/frame writes, and SP at each executed instruction agree with the
original. Sixteen unsupported compiler contracts reject; unannotated compilation
is unchanged. Four altered production entry/extent/fallthrough/pool layouts reject.
The complete production audio oracle passes 3,528 cases. Its research semantic
reference remains separate from the integrated matching C fragments; the older
C_integration=false field describes that reference, not remaining SoundMain
assembly.

`make compare -j8` verifies the complete ROM. Fresh runtime source rebuilds
reproduce all four images and exported symbols. Source, linked, inline and runtime
inventories and both unchanged copied-mixer receipts are refreshed for ELF SHA-256
`00c1699b1bd9f102132d3bd29c1989932553f8de4a42cad6ee89f821371c6f7a`.
The new `scripts/audit_soundmain_region.py` verifies contiguous coverage by
C-owned instruction objects and the exact 24-byte data-only C literal object;
its receipt records the latter's source/object hashes separately because the
instruction-ownership inventory excludes objects containing no instructions.
It proves the complete region's 1,024 instruction bytes and 40 data bytes.

Main-ROM mapped instruction bytes remain 777,630: 720,156 C-owned (92.61%),
33,870 mixed C/assembly, 1,812 assembly-source and 21,792 runtime, with zero
unresolved ownership. Reviewed non-library assembly is 2,222 main-ROM instruction
bytes and 420 payload bytes. The source inventory has 505 C files and 30 assembly
entry markers. This includes inherited community work and is not an overall
completion percentage. MPlayMain, ply_note and other audio code, runtime helpers,
unit-list and transfer code and final executable classification remain unfinished.

Evidence: `docs/soundmain-code-region.json`,
`.deps/soundmain-packed/entry-frame/report.json`, `production-check.log`,
`production-compare.log`, `layout/report.json`,
`.deps/soundmain-complete/production-run.log` and
`.deps/runtime-rebuild/verification.log`. No cycle-timing claim is made.


### Integrated MPlayMain tempo arithmetic (September 10, 2026; baseline dabed094)

Three MPlayMain fragments are now matching C: the eight-byte accumulator at
0x080CFBB0, six-byte tick finish at 0x080CFCFA and eight-byte store/loop gate at
0x080CFD00. The accumulator reads tempoC and tempoI as halfwords but retains their
full sum in r0. Tick finish writes the track-status mask, reloads tempoC and
subtracts 150 modulo 2^32. The common gate stores only r0's low 16 bits while
comparing the full register against 150. For example, 65,535 + 150 stores 149
but must continue the tick loop using the live value 65,685.

The new opt-in unsigned-LE bound selection rewrites <=149 as <150 to reproduce
CMP r0,150 / BCC, including the original NZCV. Signed and large-bound probes and
unannotated compilation remain unchanged; three invalid configurations reject.
All existing 14 direct-tail, 17 private-frame/pool and 14 indirect contract checks
also pass. No backend instruction or new C inline instruction template is needed.
The gate accesses no private-frame words; the private tail mode removes its
compiler-generated LR frame without assuming additional caller storage.

The production oracle passes 533,888 cases: 393,216 accumulation cases (every
halfword tempo with increments 0,150,65535 in normal/frame-alias layouts), 131,072
cases covering every halfword tick subtraction, and 9,600 full-width gate cases
with all initial NZCV states. It verifies all r0-r12, SP/LR, flags, loop destination,
complete RAM and ordered word/halfword reads and writes. There are 140,534 tested
wide-register cases, 532,904 tick-loop exits and 984 post-tick exits. The initial
write-trace expectation was corrected for Unicorn exposing the source register's
full value on STRH hooks; actual memory truncation is independently checked.
The complete MPlayMain track loop, callback dispatch and final return are outside
these fragment tests and remain unfinished.

The assembly body is split around the C fragments. Its cross-section pool loads
use explicit R_ARM_THM_PC8 relocations, and the linker preserves fragment extents,
fallthroughs, loop branch reach and shared literal positions. Four altered layouts
reject. `make compare -j8` verifies the complete ROM. Fresh runtime rebuilds
reproduce all four images and exported symbols. All linked/source/inline/runtime
inventories and unchanged SoundMain/mixer receipts are refreshed for ELF SHA-256
`2a46cf9e1aca153eea101bfb26da0fd257fcaf7369ee3a08903683d476748454`.

Main-ROM mapped instruction bytes remain 777,630: 720,178 C-owned (92.61%),
33,870 mixed C/assembly, 1,790 assembly-source and 21,792 runtime, with zero
unresolved ownership. Reviewed non-library assembly is 2,200 main-ROM instruction
bytes and 420 payload bytes. There are 508 tracked C files and 30 assembly entry
markers. Totals include inherited work and do not represent overall completion.

Evidence: `.deps/soundmain-packed/mplay-tempo/report.json`, `production-check.log`,
`production-compare.log`, `layout/report.json`, the linked ownership receipts and
`.deps/runtime-rebuild/verification.log`. No cycle-timing claim is made.


## MPlayMain channel gate-time behavioral recovery — September 10, 2026

Baseline `5b4197e4`. `research/audio/mplay_channel_gate.c` recovers the
private block at 080CFBD6..080CFBF2 as C: status mask 0xC7 selects live channels,
nonzero gate time decrements, and reaching zero sets release bit 0x40. Inactive
channels transfer to ClearChain; live channels transfer to next-channel handling.
The existing tail-transfer contract preserves the caller’s frame. Empty compiler
constraints preserve private register state and prevent a known-zero optimization
from changing MOVS to ADDS and consequently changing carry on release.

`check_mplay_channel_gate.py` passes 1,048,576 original/candidate cases: every
status byte, gate-time byte and initial NZCV state. It checks r0-r12, SP/LR, full
CPSR, complete 16 KiB RAM and ordered accesses, including channel fields overlapping
the stack. Outcomes: 32,768 clear-chain transfers, 3,968 disabled counters,
1,007,872 continuing counters and 3,968 releases. Candidate code executes at a
separate address, with only entry/exit PCs translated; data addresses are identical.
The checker independently asserts expected registers, memory and access sequence,
and compares final flags against execution of the verified original ROM.

This is a behavioral candidate, not production integration. It emits 32 bytes
versus the original 28. Remaining encoding differences include reversed TST
operands, a local inverse branch plus tail jump in place of the original direct
conditional transfer, a separate post-decrement zero comparison, and local branch
targets that go through the common next-channel tail. Next work is to obtain those
original encodings under checked compiler contracts and prove their linker ranges.
ClearChain itself, channel traversal and full MPlayMain execution are outside this
checker. No cycle equivalence is claimed. Main-ROM C coverage remains 92.61%.

Evidence: `.deps/soundmain-packed/mplay-channel-gate/report.json`,
`candidate.disassembly`, and `.deps/soundmain-packed/mplay-channel-gate-check.log`.
The standing progress panel’s obsolete SoundMain buffer milestone was replaced
with the current MPlayMain work; SoundMain is already fully integrated.


## Channel gate decrement/store instruction fold — September 10, 2026

Baseline `8f8e66fd`. The new opt-in `matching_thumb_store_decrement_zero`
compiler rule combines an allocated decrement-by-one, byte store and EQ/NE-zero
branch into SUBS/STRB/BEQ-or-BNE. It preserves the full-width branch decision and
truncates only the store. Validation requires low registers, a separate low base
with byte offset 0..31, a short forward label, and the private tail contract.
Unsupported source shapes fail rather than silently changing code. Empty exact
self-ties are accepted; arbitrary intervening work is not. This private rule
intentionally selects SUBS carry/overflow instead of a separate CMP's flags.

The new backend pattern accepts only EQ/NE and does not change the existing
ordered byte-counter pattern. The isolated compiler was rebuilt successfully.
`check_thumb_store_decrement_zero.py` passes 16,544 executions across both branch
senses, all initial flags, byte values, full-width boundary values including signed
overflow, and random words. It checks all general registers, SP/LR, RAM and final
flags. Eight invalid forms are rejected and an unannotated object is identical.
The test fixture disables if-conversion to exercise actual branches; the production
research candidate retains its existing compilation options.

With `--decrement-store`, `check_mplay_channel_gate.py` verifies the improved
30-byte candidate against the original 28-byte block in 1,048,576 cases, with
unchanged outcomes and full-state/access checks. The redundant zero comparison is
gone. Remaining work is TST operand order and branch layout, including external
next-channel targets; this is still research, not a production C replacement.
`make compare -j8` passes after rebuilding dependent compiler plugins. Production
ELF SHA-256 remains `2a46cf9e1aca153eea101bfb26da0fd257fcaf7369ee3a08903683d476748454`,
so existing code ownership receipts remain current and C ownership stays 92.61%.

Evidence: `.deps/soundmain-packed/mplay-channel-gate-folded/report.json`,
`mplay-channel-gate-folded-check.log`, `store-decrement-zero-guards/report.json`,
`mplay-channel-backend.log` and `mplay-channel-backend-compare.log` under the same
soundmain-packed directory. Plugin build instructions and limitations are in
`tools/arm-dispatch/README.md`.


## Matching MPlayMain channel gate integrated — September 10, 2026

Baseline `790739cc`. `src/m4a_mplay_channel_gate.c` replaces the original 28
instruction bytes at 080CFBD6..080CFBF2. The C source loads channel status,
checks active bits 0xC7, decrements nonzero gate time, and sets release bit 0x40
on expiry. Inactive channels transfer to the existing ClearChain path; live
channels transfer to the existing next-channel load. Those continuations remain
assembly and are outside this fragment's claimed C coverage.

The new opt-in direct-tail compiler rule eliminates local terminal stubs for a
masked-zero branch, a plain zero branch and the validated decrement/store equality
bundle. It orders the commutative TST operands as required, declares every external
destination and requires exactly three safe rewrites. A removed inverse-branch
stub must be adjacent and unlabelled; its obsolete barrier is removed as well.
The pass runs after shortening so the decrement/store rule has already run, and
only retains or reduces instruction sizes. Twelve unsupported configurations or
source forms reject; unannotated object output is unchanged. The Makefile builds
both new plugins automatically and applies them only to the selected C object.

The linker keeps the fragment halfword-aligned and exactly 28 bytes long, with
ClearChain's continuation at its end and next-channel handling six bytes later.
It checks conditional-branch reach and even targets for all three external
branches. One valid full link passes; five altered layouts reject, covering size,
continuation, forward/backward range and odd targets. The original loop-back
branch now targets the typed C entry at its unchanged address.

`check_mplay_channel_gate.py --production` passes 1,048,576 cases against the
original ROM. It first proves all 28 candidate bytes equal the original and the
production slice, and verifies the complete production ROM checksum. Execution
covers every status byte, gate-time byte and initial NZCV state, with normal and
stack-overlapping channel data. Every register, SP/LR, final CPSR, full 16 KiB RAM,
exit destination and ordered memory access agrees. Outcomes are 32,768 clear-chain
transfers, 3,968 disabled counters, 1,007,872 continuing counters and 3,968 releases.
ClearChain execution, channel traversal and full MPlayMain execution remain outside
these checks. No broader audio-engine or timing claim is inferred.

`make compare -j8` verifies the full 16 MiB ROM. Fresh runtime source rebuilds
reproduce all four images and exported symbols. Source, linked ownership, inline
assembly and runtime inventories are refreshed; the unchanged complete SoundMain,
copied mixer and ARM mixer regions are revalidated against their new ELF receipt.
ELF SHA-256 is `98ae15da475ad1fe4e754db37a71bf6cc8e3a76fb64d6dcd5d2c973cf5ff6038`.

Main-ROM mapped instruction bytes remain 777,630: 720,206 C-owned (92.62%),
33,870 mixed C/assembly, 1,762 assembly-source and 21,792 runtime, with zero
unresolved ownership. Reviewed non-library assembly is 2,172 main-ROM instruction
bytes and 420 payload bytes. There are 509 tracked C files and 30 assembly entry
markers. Totals include inherited work and are not an overall completion percentage.

Evidence: `.deps/soundmain-packed/mplay-channel-gate-direct/report.json`,
`guards/report.json`, `layout/report.json`, source/linked/ownership audit output in
that directory, `mplay-channel-gate-direct-production-check.log`,
`mplay-channel-gate-direct-production-compare.log`, and the runtime rebuild receipt.
Next work continues MPlayMain channel traversal and track processing.


## Matching MPlayMain next-channel transfer integrated — September 10, 2026

Baseline `4abf43c2`. `src/m4a_mplay_channel_next.c` replaces six instruction
bytes at 080CFBF8..080CFBFE: load the channel's `np` word into r4, compare with
zero, and branch to the matching channel gate if nonzero. The zero path falls
through to the existing track initialization entry. This is six bytes / three
instructions; track initialization and the ClearChain call path remain assembly.

The opt-in direct-tail rule now recognizes a plain-zero skip over an adjacent,
unlabelled declared continuation stub and emits the equivalent direct nonzero
branch. It preserves CMP flags and inherits the existing destination/count
contracts and barrier/label safeguards. The pinned backend was rebuilt, and the
Makefile selects the rule only for annotated code. Four new invalid source forms
reject; unannotated output is unchanged. The existing twelve direct-tail contract
checks still pass.

`check_mplay_channel_next.py --production` verifies all six bytes against the
original and the full matching production ROM, then passes 68,288 execution
cases. Tests cover full-width pointer boundaries, every pointer bit and 1,024
random words, all initial NZCV states, and four channel addresses including fields
at SP, SP-4 and the last mapped RAM word. There are 68,224 loop transfers and 64
track-entry transfers. All r0-r12, SP/LR, final CPSR, the complete 16 KiB RAM image
and the single ordered word read agree. An initial last-word test address was
corrected from just past the mapping to its final valid word. Execution stops at
the channel gate or track entry; full channel lists and full MPlayMain execution
are not claimed by this fragment checker.

The production linker enforces the six-byte extent, track-entry fallthrough and
backward conditional-branch reach. The preceding gate's assertions now account
for the next-channel entry being a typed Thumb C symbol. Eight altered full-link
layouts reject, including the previous five gate checks and three new size,
continuation and range cases. `make compare -j8` passes for the entire ROM; fresh
runtime builds reproduce all four images and exported symbols. Source/linked,
inline-assembly and runtime inventories are refreshed, as are the unchanged
SoundMain and mixer ownership receipts.

Main-ROM mapped instruction bytes remain 777,630: 720,212 C-owned (92.62%),
33,870 mixed C/assembly, 1,756 assembly-source and 21,792 runtime, with zero
unresolved ownership. Reviewed non-library assembly is 2,166 main-ROM bytes and
420 payload bytes. There are 510 tracked main C files and 30 assembly entry
markers. These totals include inherited work and are not overall completion.

ELF SHA-256: `d36bb69d3969094bf109709820ad6b0a1a082035d78d5cbdd8ef3961ae0dcd64`.
Evidence: `.deps/soundmain-packed/mplay-channel-next/report.json`, source/linked
and ownership output in that directory, `mplay-channel-next-production-check.log`,
`mplay-channel-next-production-compare.log`, the combined channel layout receipt
and the refreshed runtime receipt. Next work is track initialization/processing.


## Matching MPlayMain track-start guard and defaults — September 10, 2026

Baseline `7d34fd53`. Two C fragments replace 32 original instruction bytes:
`src/m4a_mplay_track_init_guard.c` covers 080CFBFE..080CFC06, and
`src/m4a_mplay_track_init_defaults.c` covers 080CFC0C..080CFC24. The six bytes
between them still call Clear64byte from assembly. The guard tests start bit
0x40 and either enters that clear call or transfers to the wait/command loop.
The defaults write flags=128, bendRange=2, volX=64, lfoSpeed=22 and tone.type=1,
retaining track+6 in r1 as the original code requires.

Existing checked compiler rules produce the exact instruction streams; no new
backend rule or plugin change was needed. Both fragments preserve the private
register/frame convention. Empty compiler constraints retain intermediate values;
the tone-type byte address is derived from the structure layout. The linker
preserves the eight-byte guard, six-byte call gap, 24-byte defaults, following
dispatch entry and short-branch range. The prior next-channel assertion now masks
the typed Thumb C track-init symbol. Thirteen combined altered full-link layouts
reject, including five new guard/default/dispatch/wait-target cases.

`check_mplay_track_init.py --production` proves exact fragment bytes against the
original and the matching production ROM. Its 32,768 execution cases include
16,384 guard cases and 16,384 default cases, every flags/memory-pattern byte and
initial NZCV, and four track addresses including SP, a field at SP, and a final
write at the last mapped RAM byte. It checks all r0-r12, SP/LR, full CPSR, complete
16 KiB RAM and ordered accesses. Guard cases produce 8,192 clear entries and
8,192 wait entries; defaults produce 16,384 wait entries. The guard preserves
initial C/V through MOVS/TST, and defaults finish with the flags from track+6.
The two fragments are tested independently: the intervening clear call and full
MPlayMain execution are explicitly outside this checker.

`make compare -j8` passes for the complete 16 MiB ROM. Fresh runtime source builds
reproduce all four images and exported symbols. Source, linked ownership, inline
assembly and runtime inventories are updated; unchanged SoundMain/mixer regions
are revalidated and their ELF receipts refreshed.

Main-ROM mapped instruction bytes remain 777,630: 720,244 C-owned (92.62%),
33,870 mixed C/assembly, 1,724 assembly-source and 21,792 runtime, with zero
unresolved ownership. Reviewed non-library assembly is 2,134 main-ROM instruction
bytes and 420 payload bytes. There are 512 tracked main C files and 30 assembly
entry markers. These totals include inherited work and are not overall completion.

ELF SHA-256: `c08e67bad2b26e3de714f60a03f4299ff20303bd844e848dbe2859f5b9cd3532`.
Evidence: `.deps/soundmain-packed/mplay-track-init/report.json`, source/linked
and ownership output in that directory, `mplay-track-init-production-check.log`,
`mplay-track-init-production-compare.log`, the combined channel layout receipt,
and refreshed runtime/SoundMain/mixer receipts. Next work continues track command
processing and remaining clear-call paths.


## Matching MPlayMain command reader integrated — September 10, 2026

Baseline `b9f81f07`. `src/m4a_mplay_command_read.c` replaces all 22 instruction
bytes at 080CFC24..080CFC3A. It reads the current command pointer and byte. Bytes
below 128 select the track's running status without advancing the pointer; new
commands advance the pointer, and bytes at least 189 also replace running status.
The original entry retains its public `MPlayMainTrackDispatch` name; command
decoding and callback dispatch after this reader remain assembly.

The existing private tail rules and both unsigned-bound options produce CMP
128/BCS and CMP 189/BCC with the original final flags. The final decode entry is
adjacent, and the linker preserves the 22-byte extent and exact continuation.
The preceding defaults assertion accounts for the now-typed Thumb C entry.
Fifteen combined altered full-link layouts reject, including new command-reader
size and decode-continuation cases. No new compiler rule was required.

`check_mplay_command_read.py --production` proves exact original/production bytes
and passes 328,640 execution cases. It covers every constructed command/status
byte pair across five fixtures with cycling initial flags, plus all initial NZCV
states at command thresholds. Separate-storage fixtures cover independent bytes;
stream/status and stream/pointer-field aliases deliberately make their effective
values dependent. The expected initial pointer and bytes are derived after memory
construction. Other fixtures place the pointer field at SP or the stream at the
last mapped RAM byte, where advancing reaches the end of the mapping without a
further read. All r0-r12, SP/LR, final CPSR, complete 16 KiB RAM and ordered word/
byte accesses agree. Outcomes: 164,704 running-status selections, 78,092 transient
new commands, and 85,844 new running-status commands. Command decoding, callbacks
and full MPlayMain execution are outside this checker.

`make compare -j8` verifies the full 16 MiB ROM. Fresh runtime source builds
reproduce all four images and exported symbols. Source/linked, inline-assembly
and runtime inventories are refreshed, with unchanged SoundMain/mixer regions
revalidated against updated ELF receipts.

Main-ROM mapped instruction bytes remain 777,630: 720,266 C-owned (92.62%),
33,870 mixed C/assembly, 1,702 assembly-source and 21,792 runtime, with zero
unresolved ownership. Reviewed non-library assembly is 2,112 main-ROM instruction
bytes and 420 payload bytes. There are 513 tracked main C files and 30 assembly
entry markers. Totals include inherited work and are not overall completion.

ELF SHA-256: `04625c5393f1a9b6fe1fb45880d2ef241fba343b4d7b7a26b6ce7b6e8a83e036`.
Evidence: `.deps/soundmain-packed/mplay-command-read/report.json`, source/linked
and ownership output in that directory, `mplay-command-read-production-check.log`,
`mplay-command-read-production-compare.log`, the combined layout receipt and the
refreshed runtime/SoundMain/mixer receipts. Next work continues command decoding,
callbacks and remaining clear-call paths.


## Matching MPlayMain note setup integrated — September 10, 2026

Baseline `5669de2c`. `src/m4a_mplay_note_setup.c` replaces all 12 instruction
bytes at 080CFC3E..080CFC4A. It copies the sound-info address from r8, loads its
plynote callback, computes command-207 and places the player/track arguments in
r1/r2. The preceding note-command comparison and following callback invocation
remain assembly and are not counted as converted by this milestone.

The copy rule's new opt-in `preserve-thumb-high-copies` flag leaves ordinary
high-register MOV instructions intact and selects ADDS #0 only for distinct low
register copies. It still requires at least one low copy; SP/LR/PC, duplicate or
value-bearing flags and ARM-contract use reject. The original default remains
strict. Thirteen guard checks pass (eight original and five new unsupported
forms), a mixed high/low fixture emits the intended instructions, and unannotated
output is unchanged. The production Makefile enables this option only for the
new setup fragment; the entire ROM still matches after dependent plugin rebuilds.

`check_mplay_note_setup.py --production` proves exact original/production bytes
and passes 74,880 execution cases. These cover every command byte plus full-width
boundaries/random values, all NZCV, three info addresses including a callback
field at SP or the final RAM word, and zero/high/full-width player/track argument
words. It verifies r0-r12, SP/LR, final CPSR, complete 16 KiB RAM and the single
ordered callback-pointer read at info+56. Execution stops before BL/callback
execution. Final N/Z come from the track argument and C/V are cleared by ADDS #0;
full-width subtraction is retained in r0.

The linker enforces the four-byte guard gap, exact 12-byte fragment and adjacent
callback entry. Seventeen combined altered layouts reject, including two new
setup-size/callback-continuation cases. `make compare -j8` verifies all 16 MiB.
Fresh runtime source builds reproduce all four images and exports. Source/linked,
inline-assembly and runtime inventories are refreshed, and unchanged SoundMain/
mixer ranges are revalidated against updated ELF receipts.

Main-ROM mapped instruction bytes remain 777,630: 720,278 C-owned (92.62%),
33,870 mixed C/assembly, 1,690 assembly-source and 21,792 runtime, with zero
unresolved ownership. Reviewed non-library assembly is 2,100 main-ROM instruction
bytes and 420 payload bytes. There are 514 tracked main C files and 30 assembly
entry markers. Totals include inherited work and are not overall completion.

ELF SHA-256: `04e3463f3275b538a25e283453b3e4460cf9de0bc208efc1b8fb598a10716038`.
Evidence: `.deps/soundmain-packed/mplay-note-setup/report.json`, source/linked
and ownership output there, `mplay-note-setup-production-check.log`,
`mplay-note-setup-production-compare.log`, copy-rule guards, the combined layout
receipt and refreshed runtime/SoundMain/mixer receipts. Next work continues
callback invocation, command decoding and remaining clear-call paths.


## Matching MPlayMain note callback invocation — September 10, 2026

Baseline `da5bb8c7`. `src/m4a_mplay_note_invoke.c` replaces six original
instruction bytes at 080CFC4A..080CFC50: call the callback in r3 through the shared
call_r3 trampoline and then branch to track wait. The preceding note setup is
already C. The note-command guard and real ply_note body remain unfinished.

The new opt-in callback-tail rule validates exactly an LR-only compiler frame,
a no-argument r3 callback, a declared no-argument continuation and the standard
private return epilogue. It requires global r0-r3 bindings and rejects local
frames, entry arguments, live labels, post-callback work, altered callback or
continuation shapes, and debug/unwind instrumentation. The extra compiler frame
is removed; the callback remains a call and the final continuation becomes a
branch. Eleven invalid source/configuration forms reject and unannotated output
is identical. No new backend instruction pattern was needed.

The initial linker Thumb-tag assertion rejected the build. An emitted-value
probe confirmed that linker expressions expose call_r3 as 080CFDC0 with bit zero
clear, while ELF metadata records a FUNC at 080CFDC1. The tag check therefore
belongs in the ELF verifier; the linker keeps its address/range checks. After
that correction, the full build and all dependent audits were rerun successfully.
The production verifier requires the typed Thumb symbol and the original BX r3
bytes, avoiding a veneer or an incorrectly typed shared entry.

`check_mplay_note_invoke.py --production` proves exact original/production bytes
and passes 49,152 cases. Synthetic ARM and Thumb callbacks execute an actual word
store and BX LR, with every incoming/returned NZCV combination, four stack
positions, three write aliases and randomized register clobbers. The checker
verifies all callback-entry registers, mode, SP and LR; all returned r0-r12, SP,
LR and flags; the complete 16 KiB RAM image; the single ordered callback write;
and the final wait-loop destination. There is no compiler-generated stack write.
These tests validate dispatch/return mechanics, not actual ply_note behavior or
full MPlayMain execution.

The linker enforces the six-byte extent, following non-note entry, original
trampoline address and continuation reach. Twenty-one combined altered layouts
reject, including four new invocation-size/following-entry/trampoline/range cases.
`make compare -j8` verifies the full 16 MiB ROM. Fresh runtime source builds
reproduce all four images and exports. Source/linked, inline-assembly and runtime
inventories are refreshed, with unchanged SoundMain/mixer ranges revalidated
against the updated ELF receipts.

Main-ROM mapped instruction bytes remain 777,630: 720,284 C-owned (92.63%),
33,870 mixed C/assembly, 1,684 assembly-source and 21,792 runtime, with zero
unresolved ownership. Reviewed non-library assembly is 2,094 main-ROM instruction
bytes and 420 payload bytes. There are 515 tracked main C files and 30 assembly
entry markers. Totals include inherited work and are not overall completion.

ELF SHA-256: `268079673e72b9edab9cd67ad23953217ce07c385427c15e498f8d3886fa9f67`.
Evidence: `.deps/soundmain-packed/mplay-note-invoke/report.json`, source/linked
and ownership output there, `mplay-note-invoke-production-check.log`,
`mplay-note-invoke-production-compare.log`, `tag-probe.bin`, the combined layout
receipt and refreshed runtime/SoundMain/mixer receipts. Next work continues
command decoding, other callbacks and clear-call paths.


## Matching MPlayMain non-note command setup — September 10, 2026

Baseline `39900155`. `src/m4a_mplay_command_setup.c` replaces 18 instruction
bytes at 080CFC54..080CFC66. It computes command-177, stores the low command byte,
loads the MPlay jump table from sound-info, shifts the full-width index by two,
reads the callback and places player/track arguments in r0/r1. Register r2 remains
unchanged. The command guard, callback invocation and return handling remain
assembly and are not included in this replacement.

The existing copy and private-tail contracts already produce the exact sequence,
including MOV from r8 and the required low-register ADDS copies. No compiler change
was needed. The command field is written through a byte pointer using its derived
structure offset, allowing the alias probes without a struct-alignment assumption
for the byte-only player access. Arithmetic remains full width; only the store
truncates. The original write-before-read order is preserved.

`check_mplay_command_setup.py --production` proves exact original/production bytes
and passes 279,552 cases. Every command byte appears with all four top-two-bit
patterns, plus additional full-width boundaries, every initial NZCV and four track
argument words. Normal storage, table field at SP, command field at SP and command
store overlapping the selected entry each contribute 65,792 cases. Another 16,384
cases overlap the command store with the table pointer; these retain aligned word
loads. Expected table pointers/entries are derived after the byte write. All
r0-r12, SP/LR, final CPSR, complete 16 KiB RAM and the ordered byte write followed
by two word reads agree. The write hook's full source register is checked separately
from the actual truncated byte in RAM. Execution stops before the callback.

The linker preserves the four-byte command guard gap, 18-byte setup extent and
adjacent callback entry. Twenty-three combined altered layouts reject, including
two new setup-size/callback-entry cases. `make compare -j8` passes for all 16 MiB.
Fresh runtime source builds reproduce all four images and exports. Source/linked,
inline-assembly and runtime inventories are refreshed, with unchanged SoundMain/
mixer regions revalidated against updated ELF receipts.

Main-ROM mapped instruction bytes remain 777,630: 720,302 C-owned (92.63%),
33,870 mixed C/assembly, 1,666 assembly-source and 21,792 runtime, with zero
unresolved ownership. Reviewed non-library assembly is 2,076 main-ROM instruction
bytes and 420 payload bytes. There are 516 tracked main C files and 30 assembly
entry markers. Totals include inherited work and are not overall completion.

ELF SHA-256: `121888f46d3960518332f85166ece8ab5cc162eed1182a6d49f388a4ea44501c`.
Evidence: `.deps/soundmain-packed/mplay-command-setup/report.json`, source/linked
and ownership output there, `mplay-command-setup-production-check.log`,
`mplay-command-setup-production-compare.log`, combined layout checks and refreshed
runtime/SoundMain/mixer receipts. Next work continues command callback/return
handling, command guards and remaining clear-call paths.


## MPlayMain command invocation — September 10, 2026 (baseline `189d71e3`)

Integrated `src/m4a_mplay_command_invoke.c` at 080CFC66..080CFC6A.
The four-byte shared-trampoline callback is generated from C. Its return falls
through directly into the existing assembly status check at 080CFC6A, preserving
callback-produced registers and flags. The shared `call_r3` body is still assembly;
this milestone covers its caller only.

The strict `thumb_callback_tail` compiler contract now accepts a valueless
`fallthrough` option. It still validates the original five-operation frame/call/
continuation/return shape, the no-argument r3 callback, the declared direct
continuation and global r0-r3 bindings before removing the private frame. This
option omits the continuation branch; the production linker therefore enforces
exact four-byte extent and adjacency to `MPlayMainCommandStatus`. Duplicate and
value-bearing fallthrough options reject. The default note path retains its
branch. No backend pattern changes were necessary.

`check_mplay_note_invoke.py --command --production` passes 49,152 cases and the
existing note mode passes another 49,152. Both reject 13 malformed contracts and
leave unannotated source unchanged. Synthetic ARM and Thumb callbacks execute a
store and BX LR, with every initial/returned NZCV combination, four stack positions
and three callback-write aliases. Callback-entry state, all returned registers,
SP/LR, flags/mode, complete RAM and ordered writes agree with original execution.
The candidate and production callback bytes match the original; typed Thumb
trampoline metadata is checked in both ELF files. This does not claim coverage of
actual callback logic or complete MPlayMain execution.

The production layout passes; all 25 altered layouts reject, including new extent
and return-continuation perturbations. `make compare -j8` reproduces the complete
16 MiB ROM. Fresh runtime source builds reproduce all four images and exported
symbols. Source, linked ownership, inline and runtime inventories are refreshed;
the complete SoundMain/mixer and contiguous ARM receipts retain exact regions.

Mapped main instruction bytes remain 777,630: 720,306 C-owned (92.63%), 33,870
mixed C/assembly, 1,662 assembly-source and 21,792 runtime, with zero unresolved
ownership. Reviewed non-library assembly is 2,072 main bytes and 420 payload
bytes. There are 517 tracked main C files and 30 assembly entry markers. These
figures include inherited work and are not overall completion.

ELF SHA-256: `e6b35701f78e5a5f4e367e89c9e18f8f2c95f649a3a7e4db88f00a7bd7650b3d`.
Evidence: `.deps/soundmain-packed/mplay-command-invoke/report.json`, source/linked
reports in that directory, `mplay-command-invoke-production.log`,
`mplay-note-invoke-regression.log`, `mplay-command-invoke-layout.log`,
`mplay-command-invoke-build.log` and refreshed runtime/region receipts.
Next work is the callback return-status check, command guards and clear-call paths.


## MPlayMain command return status — September 10, 2026 (baseline `4389f043`)

Integrated `src/m4a_mplay_command_status.c` at 080CFC6A..080CFC72. It loads
track flags into r0 and selects track completion for zero or the existing wait
handler for nonzero. All eight original instruction bytes are generated from C.
The following wait-command table lookup and track-finish bodies remain assembly.

The existing private direct-tail compiler rule now handles an inverse nonzero
low-register test that skips one adjacent, unlabelled declared tail. It replaces
that pair with the existing CMP/BEQ direct-tail pattern and removes the obsolete
unconditional branch/barrier. The same exact adjacency, forward-empty-path,
private-tail and expected-transfer checks apply as to the existing inverse-zero
form. No backend pattern was added. The generic guard suite passes nine invalid
configurations and three invalid source forms; unannotated behavior is unchanged.

`check_mplay_command_status.py --production` passes 16,384 original/production
cases: every status byte, all 16 initial NZCV states and four storage positions,
including SP, SP-1 and the final mapped RAM byte. The 64 zero cases reach track
completion and 16,320 nonzero cases reach track wait. All r0-r12, SP/LR, CPSR,
complete RAM and the sole ordered byte read match; the final comparison sets
N=0, Z according to the loaded byte, C=1 and V=0. Four malformed source forms
reject and source without the direct-tail attribute is unaffected by loading the
plugin. Actual callbacks and complete MPlayMain execution are outside this test.

The production linker constrains the eight-byte extent, following wait-command
entry, conditional finish-target range/alignment and unconditional wait-target
range/alignment. `make compare -j8` reproduces all 16 MiB. Fresh runtime source
builds reproduce all four images and exports. Source, linked, inline and runtime
inventories are refreshed, and unchanged SoundMain/mixer regions are revalidated.

Main-ROM mapped instruction bytes remain 777,630: 720,314 C-owned (92.63%),
33,870 mixed C/assembly, 1,654 assembly-source and 21,792 runtime, with zero
unresolved ownership. Reviewed non-library assembly is 2,064 main bytes and 420
payload bytes. There are 518 tracked main C files and 30 assembly entry markers.
These figures include inherited work and do not establish overall completion.

ELF SHA-256: `086e1ff9c067d82eb27504bb2965d5f0257043affaa1e773c7dc02fb22323410`.
Evidence: `.deps/soundmain-packed/mplay-command-status/report.json`, source/linked
reports in that directory, `mplay-command-status-production.log`,
`mplay-command-status-plugin.log`, `mplay-command-status-build.log` and refreshed
runtime/region receipts. Next work continues command guards, wait/modulation
handling and clear-call paths.

The full production layout passes and all 30 combined altered layouts reject.
Five new cases cover the status extent, following entry and far/backward/odd
finish targets. See `mplay-command-status-layout.log`.


## MPlayMain wait-command lookup — September 10, 2026 (baseline `1ffdc8d1`)

Integrated `src/m4a_mplay_wait_command.c` at 080CFC72..080CFC7C. It loads the
shared clock-table pointer, subtracts 128 from the full-width command, adds the
table base, reads one delay byte and stores it to track.wait before falling through
to the existing track-wait handler. All ten original instruction bytes are generated
from C. Existing shared-literal and late private-tail rules suffice; no compiler
plugin or backend changes were required. The shared pointer pool remains assembly.

`check_mplay_wait_command.py --production` passes 78,016 cases. There are 3,136
checks using the original table for every valid wait command (128..176), all NZCV
states and four output positions including the final RAM byte. Another 74,880
checks patch the shared pointer so all command bytes, full-width boundary values
and 128 random words address mapped memory. Every possible result byte appears.
Synthetic lookups cover ordinary, stack, unaligned and final-byte sources, with
output overlapping the source or stack. Exact r0-r12, SP/LR, full CPSR, complete
RAM and the ordered literal read, byte read and byte store agree. Final flags are
those of the full-width address ADD, including unsigned carry and signed overflow.
The synthetic pointer patch is test-only; production keeps the original pool.
This checker stops before track-wait execution and does not cover command guards
or full MPlayMain.

The linker constrains the ten-byte extent and adjacent track-wait entry, and the
shared literal's word alignment and actual aligned-PC-relative range. These
constraints handle the intentionally halfword-aligned entry. All 35 combined
altered layouts reject, including five new extent, continuation and far/backward/
unaligned pool cases. `make compare -j8` reproduces all 16 MiB. Source, linked and
inline inventories are refreshed; unchanged SoundMain/mixer regions are revalidated.

The first fresh runtime rebuild failed with an explicit no-space-left error while
assembling libc. Removed only older generated top-level ELF/ROM/binary/map files
from isolated runtime verification directories, preserving source trees, build logs,
verification receipts and the three newest directories. This reclaimed 1,845,492,549
bytes. A new fresh runtime verification was started after the failed process exited.

Mapped main instruction bytes remain 777,630: 720,324 C-owned (92.63%), 33,870
mixed C/assembly, 1,644 assembly-source and 21,792 runtime, with zero unresolved
ownership. Reviewed non-library assembly is 2,054 main bytes and 420 payload bytes.
There are 519 tracked main C files and 30 assembly entry markers. These figures
include inherited work and are not overall completion.

ELF SHA-256: `0d30a9a8089fe597f0b24c0a6b81d339a2078d6dae127f132394f26a01bab100`.
Evidence: `.deps/soundmain-packed/mplay-wait-command/report.json`, source/linked
reports there, `mplay-wait-command-production.log`, `mplay-wait-command-layout.log`,
`mplay-wait-command-build.log` and region receipts. Next work continues command
guards, track-wait/modulation handling and clear-call paths.

The replacement fresh runtime verification passes: all four images and exports
match, and the runtime-source inventory and receipt are refreshed.


## MPlayMain track wait — September 10, 2026 (baseline `ed0c737f`)

Integrated `src/m4a_mplay_track_wait.c` at 080CFC7C..080CFC86. It loads
track.wait into r0, branches to the matching C command reader if zero, or subtracts
one and writes the new delay before falling through to modulation processing.
All ten original instruction bytes are generated from C. Modulation remains
assembly. Existing private-tail/direct-tail compiler rules suffice without changes.

`check_mplay_track_wait.py --production` passes 16,384 cases: every wait byte,
all initial NZCV states and four storage positions including SP, SP-1 and the
final RAM byte. There are 64 command-dispatch cases without a store and 16,320
modulation cases with one decrement/store. All r0-r12, SP/LR, full CPSR, complete
RAM and the ordered byte read/conditional store agree with original execution.
The zero path retains CMP flags; the nonzero path retains SUBS flags, including
Z on the one-to-zero transition. Four malformed source forms reject and loading
the direct-tail plugin leaves source without its attribute unchanged. Execution
stops at the next handler; this does not establish full MPlayMain behavior.

The linker enforces the ten-byte extent, adjacent modulation entry and the signed
short-branch range back to command dispatch. Existing wait-target contracts now
explicitly mask the Thumb function tag when comparing instruction addresses.
`make compare -j8` reproduces all 16 MiB. Fresh runtime source builds reproduce all
four images and exports. Source, linked, inline and runtime inventories are refreshed;
unchanged SoundMain/mixer regions are revalidated against the new ELF receipt.

Main-ROM mapped instruction bytes remain 777,630: 720,334 C-owned (92.63%),
33,870 mixed C/assembly, 1,634 assembly-source and 21,792 runtime, with zero
unresolved ownership. Reviewed non-library assembly is 2,044 main bytes and 420
payload bytes. There are 520 tracked main C files and 30 assembly entry markers.
These figures include inherited work and are not overall completion.

ELF SHA-256: `6f9bed34ad9c303e678a4c07d169aeea3650c3bc2b04cb257379c0a6b00143d5`.
Evidence: `.deps/soundmain-packed/mplay-track-wait/report.json`, source/linked
reports there, `mplay-track-wait-production.log`, `mplay-track-wait-build.log` and
refreshed runtime/region receipts. Next work continues command guards, modulation
handling and clear-call paths.

The valid production layout passes and all 39 combined altered layouts reject.
Four new cases cover the track-wait extent, modulation continuation and command
dispatch targets beyond either short-branch bound. See `mplay-track-wait-layout.log`.


## MPlayMain modulation guards and delay — September 10, 2026 (baseline `98d1d064`)

Integrated `src/m4a_mplay_modulation_guard.c` at 080CFC86..080CFC9E. It reads
LFO speed into r1, exits when speed or modulation depth is zero, and reads the
LFO delay into r0 otherwise. A zero delay selects modulation update; nonzero delay
is decremented and stored before track completion. All 24 original instruction
bytes are generated from C. Modulation arithmetic remains assembly. Existing
private-tail and direct-tail compiler rules suffice without changes.

The candidate suite passes 409,600 cases. All 65,536 speed/depth byte pairs run
at four track positions with cycling delay/initial flags. Every delay byte also
runs against all nine combinations of disabled/minimum/maximum speed and depth,
all initial NZCV and the four track positions. Storage covers ordinary RAM, speed
at SP, delay at SP and delay at the final RAM byte. There are 50,176 speed-disabled,
33,788 depth-disabled, 1,276 update and 324,360 delay-decrement cases. All r0-r12,
SP/LR, full CPSR, complete RAM and conditional ordered reads/store agree. Early
exits preserve the corresponding zero comparison's flags; decrement paths retain
SUBS flags, including the one-to-zero transition. Four malformed source forms
reject; loading the plugin does not change source without its direct-tail attribute.
The checker stops at track completion or modulation update, not full MPlayMain.

The linker enforces 24-byte extent, following modulation-update entry and the
range/alignment of all outgoing transfers. `make compare -j8` reproduces the full
16 MiB ROM. Fresh runtime source builds reproduce all four images and exports.
Source, linked, inline and runtime inventories are refreshed; unchanged SoundMain/
mixer regions are revalidated against the updated ELF receipt.

Mapped main instruction bytes remain 777,630: 720,358 C-owned (92.64%), 33,870
mixed C/assembly, 1,610 assembly-source and 21,792 runtime, with zero unresolved
ownership. Reviewed non-library assembly is 2,020 main bytes and 420 payload bytes.
There are 521 tracked main C files and 30 assembly entry markers. These figures
include inherited work and are not overall completion.

ELF SHA-256: `1f6e46440c91e316bc5aed2e8caea291f2995d34fa60dbd3ee677ae918ff1a63`.
Evidence: `.deps/soundmain-packed/mplay-modulation-guard/report.json`, source/linked
reports there, `mplay-modulation-guard-check.log`, `mplay-modulation-guard-build.log`
and refreshed runtime/region receipts. Production execution verification also passes
all 409,600 cases; see `mplay-modulation-guard-production.log`. The valid production
layout passes and all 44 combined altered layouts reject, including five new extent,
continuation and far/backward/odd completion-target cases. See
`mplay-modulation-guard-layout.log`. Next work continues modulation arithmetic,
command guards and clear-call paths.


## MPlayMain modulation arithmetic — September 10, 2026 (baseline `999ef1f8`)

Integrated `src/m4a_mplay_modulation_update.c` at 080CFC9E..080CFCD8. It advances
and stores the phase, derives the signed triangular waveform, multiplies by depth,
arithmetically shifts the wrapped product and compares the low result byte with
previous modulation. Changed values are stored and the appropriate pitch/volume
update bits are ORed into track flags. All 58 original instruction bytes are
produced from C. Track-loop completion remains assembly.

No compiler plugin changes were needed. Removing unnecessary empty self-ties
between shifts and their conditions allows the original LSLS/BPL and LSLS/BEQ
pairs. Disabling if-conversion preserves the original type-selection branches.
An empty self-tie in the zero-type arm prevents replacement of MOVS #12 by an
ADD from known zero, which would change carry. Existing private-tail and copy-
as-ADD-zero contracts preserve the other original register/flag behavior.

The independent arithmetic suite passes 700,416 original/candidate executions:
524,288 phase/speed byte-pair cases at four depths and changed/unchanged results,
65,536 phase/depth byte pairs and 110,592 full-width speed boundary cases with
all initial NZCV, type variants and four stack/boundary track locations. The
model independently computes wrapped additions/multiplication, signed eight-bit
waveform values, arithmetic right shifts and final flags. All r0-r12, SP/LR,
full CPSR, complete RAM and ordered byte accesses agree. Stores are checked both
as complete source-register hook values and truncated memory bytes. There are
317,661 unchanged, 149,759 pitch-update and 232,996 volume-update cases. Unchanged
exits retain shift carry and the earlier arithmetic overflow; changed exits retain
C=1/V=0 from the type comparison. Full MPlayMain and audible output are outside
this fragment's validation.

Production integration was verified by exact identity rather than a duplicate
execution run. The production C source equals the tested source with only the
function name changed; its complete linked 58-byte Thumb region belongs to the
C-owned object and equals the tested candidate and original ROM. A separate
`production-verification.json` records the source, checker, candidate, ELF and ROM
hashes, linked region and execution count. The candidate report's
`production_integrated: false` describes the earlier execution invocation; the
separate identity receipt proves the subsequent integration. Running the checker
with `--production` remains available to reproduce both checks in one invocation.

`make compare -j8` reproduces all 16 MiB. The valid production layout passes and
all 46 combined altered layouts reject, including the new extent and track-finish
continuation perturbations. Fresh runtime source builds reproduce all four images
and exports. Source, linked, inline and runtime inventories are refreshed and
unchanged SoundMain/mixer regions are revalidated.

Mapped main instruction bytes remain 777,630: 720,416 C-owned (92.64%), 33,870
mixed C/assembly, 1,552 assembly-source and 21,792 runtime, with zero unresolved
ownership. Reviewed non-library assembly is 1,962 main bytes and 420 payload bytes.
There are 522 tracked main C files and 30 assembly entry markers. These figures
include inherited work and are not overall completion.

ELF SHA-256: `9fe639520a5b01e1ad8d9a4abe6119294ceed22e10b45d5dca8db304a5acc94f`.
Evidence: `.deps/soundmain-packed/mplay-modulation-update/report.json`,
`production-verification.json`, source/linked reports there,
`mplay-modulation-update-check.log`, `mplay-modulation-update-layout.log`,
`mplay-modulation-update-build.log` and refreshed runtime/region receipts.
Next work continues command guards, track-loop completion and clear-call paths.


## MPlayMain saved state and track advance — September 10, 2026 (baseline `1db7efed`)

Integrated `src/m4a_mplay_track_finish.c` at 080CFCD8..080CFCDC and
`src/m4a_mplay_track_advance.c` at 080CFCDC..080CFCE8. The first restores r3/r4
from saved r10/r11 without changing flags. The second retains the shared entry
used when restoration is skipped, decrements the full-width track count and
selects clock update or the next track. Continuing tracks advance by 80 bytes and
shift the track mask. All 16 original instruction bytes are generated from C.

Existing private-tail and signed-fork-decrement contracts suffice without compiler
changes. The C comparison uses the original signed count greater than one and
performs a wrapped unsigned decrement on both paths. This preserves the original
SUBS/BLE decision for signed-overflow inputs, including 0x80000000; simply testing
the wrapped decremented count as signed would be incorrect for that input.

The execution suite covers all count bytes, seven full-width boundaries and 64
random words, four pointer-overflow positions, four mask values, all initial NZCV
and three entry modes: restore only, restore plus advance, and shared advance.
The production run strengthens the initial probe by keeping destination r3 random
and distinct from the saved-mask fixture on restore paths. Expected r3/r4 restore
values are derived from r10/r11. The model also checks count subtraction flags,
ADD overflow and shift carry. All r0-r12, SP/LR, full CPSR, complete RAM and absence
of data-memory accesses are checked. It stops at next-track or clock-update entry,
not the complete MPlayMain iteration.

The linker enforces the four-byte restore and twelve-byte advance extents, both
shared continuation boundaries and backward loop-branch range/alignment. Existing
finish-target contracts now explicitly compare masked Thumb instruction addresses.
`make compare -j8` reproduces all 16 MiB. Fresh runtime source builds reproduce
all four images and exports. Source, linked, inline and runtime inventories are
refreshed, and unchanged SoundMain/mixer regions are revalidated.

Mapped main instruction bytes remain 777,630: 720,432 C-owned (92.64%), 33,870
mixed C/assembly, 1,536 assembly-source and 21,792 runtime, with zero unresolved
ownership. Reviewed non-library assembly is 1,946 main bytes and 420 payload bytes.
There are 524 tracked main C files and 30 assembly entry markers. These figures
include inherited work and are not overall completion.

ELF SHA-256: `f41039cee7d77fbfded6f0aa9d6b3c656702684c293dee5d4b78c24e96f5975d`.
Evidence: `.deps/soundmain-packed/mplay-track-advance/report.json`, source/linked
reports there, `mplay-track-advance-build.log` and refreshed runtime/region receipts.
Production execution passes all 251,136 cases: 83,712 restore-only, 151,552 next-track
and 15,872 clock-update cases. The valid layout passes and all 53 combined altered
layouts reject, including seven new extent/continuation and far/backward/odd loop
target cases. See `mplay-track-advance-production.log` and
`mplay-track-advance-layout.log`. Next work continues tick-clock/status completion,
command guards and clear-call paths.


## MPlayMain tick clock/status — September 10, 2026 (baseline `51f38b74`)

Integrated `src/m4a_mplay_clock_update.c` at 080CFCE8..080CFCFA. It increments
and stores the wrapped 32-bit tick clock. Active tracks continue into the existing
matching C tempo-finish block; no active tracks set status to 0x80000000 and branch
to the shared exit. All 18 original instruction bytes are generated from C. The
shared exit remains assembly. Existing private-tail contracts suffice without
compiler changes; an empty self-tie preserves the original MOVS/LSLS constant pair.

`check_mplay_clock_update.py --production` passes 99,840 cases: all clock bytes,
six full-width boundaries and 128 random clocks, four zero/low/high active-track
words, all initial NZCV and four player positions. Fixtures put the clock at SP,
status at SP or the clock at the final RAM word. There are 74,880 active and 24,960
inactive cases. All r0-r12, SP/LR, full CPSR, complete RAM and the ordered clock
read/increment store/conditional status store agree. Active paths retain the track
comparison flags and incremented r0; inactive paths retain the constant shift's
N=1/Z=0/C=0/V=0 and r0=0x80000000. Execution stops at tempo finish or shared exit;
complete MPlayMain is outside this fragment.

The linker enforces the 18-byte extent, adjacent tempo-finish entry and shared-exit
branch range/alignment. `make compare -j8` reproduces all 16 MiB. Fresh runtime
source builds reproduce all four images and exports. Source, linked, inline and
runtime inventories are refreshed; unchanged SoundMain/mixer regions are revalidated.

Mapped main instruction bytes remain 777,630: 720,450 C-owned (92.65%), 33,870
mixed C/assembly, 1,518 assembly-source and 21,792 runtime, with zero unresolved
ownership. Reviewed non-library assembly is 1,928 main bytes and 420 payload bytes.
There are 525 tracked main C files and 30 assembly entry markers. These figures
include inherited work and are not overall completion.

ELF SHA-256: `c1f6419d9fd8347869556964678e9fb26935557c471ceddefa4e861e8fcaea28`.
Evidence: `.deps/soundmain-packed/mplay-clock-update/report.json`, source/linked
reports there, `mplay-clock-update-production.log`, `mplay-clock-update-build.log`
and refreshed runtime/region receipts. The valid production layout passes and all
58 combined altered layouts reject, including five new extent, continuation and
far/backward/odd exit-target cases. See `mplay-clock-update-layout.log`.
Next work continues command guards, post-tick processing and clear-call paths.


## MPlayMain post-tick track guard — September 10, 2026 (baseline `d583e0d0`)

Integrated `src/m4a_mplay_post_track_guard.c` at 080CFD0C..080CFD1A. It loads
track flags, tests the active bit and then pending-change bits, skipping tracks
that fail either test. All 14 original instruction bytes are generated from C.
Post-tick setup and channel updates remain assembly.

The direct-tail compiler contract adds the valueless `descending-mask-operands`
option to select the original TST r1,r0 encoding. Default ascending order remains
unchanged. Duplicate/value-bearing options and applying the option to a function
without a rewritten masked tail reject. Existing adjacency/declared-destination
checks remain enforced. No backend changes were needed. The original guard suite
still rejects nine invalid configurations and three invalid source forms; the new
fragment rejects four source forms and two configurations. Unannotated source is
unchanged by loading the plugin.

`check_mplay_post_track_guard.py --production` passes 16,384 cases: all flag bytes,
all initial NZCV and four track locations including SP, SP-1 and final RAM byte.
There are 8,192 inactive skips, 512 unchanged skips and 7,680 setup transfers.
All r0-r12, SP/LR, full CPSR, complete RAM and the single ordered byte read agree.
Both TST paths preserve incoming C/V and produce the original N/Z. The initial
probe's instruction limit was too small for the longer path; it was corrected
before the successful production run. Full MPlayMain is outside this fragment.

Splitting the assembly at the halfword-aligned setup entry initially introduced
word-alignment padding from its later literal pool. The shared pool and original
two-byte zero padding now occupy `.text.mplay_main_literals`, retaining original
addresses and bytes while the preceding section remains halfword-aligned. Linker
assertions verify the pool locations, 14-byte guard extent, setup adjacency and
skip-target range/alignment. `make compare -j8` reproduces the full 16 MiB ROM.
Fresh runtime builds reproduce all four images and exports. Source, linked, inline
and runtime inventories are refreshed; unchanged SoundMain/mixer regions are
revalidated.

Mapped main instruction bytes remain 777,630: 720,464 C-owned (92.65%), 33,870
mixed C/assembly, 1,504 assembly-source and 21,792 runtime, with zero unresolved
ownership. Reviewed non-library assembly is 1,914 main bytes and 420 payload bytes.
There are 526 tracked main C files and 30 assembly entry markers. These figures
include inherited work and are not overall completion.

ELF SHA-256: `7fb1e1324d0835e64c5572537d7a013d2de22cfade390cc6c839733fb59a774f`.
Evidence: `.deps/soundmain-packed/mplay-post-track-guard/report.json`, source/linked
reports there, `mplay-post-track-guard-production.log`,
`mplay-post-track-guard-plugin.log`, `mplay-post-track-guard-build.log` and refreshed
runtime/region receipts. The valid layout passes and all 64 altered layouts reject,
including six new extent, continuation, target-range/alignment and shared-pool
placement cases. See `mplay-post-track-guard-layout.log`. Next work continues
post-tick setup/channel processing, command guards and clear-call paths.


## MPlayMain post-tick entry/setup — September 10, 2026 (baseline `9cdcfcc8`)

Integrated `src/m4a_mplay_post_entry.c` at 080CFD08..080CFD0C and
`src/m4a_mplay_post_setup.c` at 080CFD1A..080CFD20. The first loads track count
and track-list pointer in the original order without changing flags. The second
saves the full r2 count in r9 and prepares r0/r1 from player/track pointers using
the original flag-setting copies. All ten instruction bytes are matching C.
The following TrkVolPitSet call remains assembly. Existing private-tail and
high-copy-preserving copy-as-ADD-zero contracts suffice without compiler changes.

`check_mplay_post_setup.py --production` passes 132,608 cases: 65,536 entry and
67,072 setup cases. Entry covers every count byte, four pointer words, all NZCV
and four player placements including count/pointer fields at SP and the pointer
at the final RAM word. Setup adds six full-width count values and crosses four
player/track argument words with every initial NZCV. All r0-r12, SP/LR, full CPSR,
complete RAM and exact accesses agree. Entry performs one byte read then one word
read; setup performs no memory accesses. Setup's final NZ comes from the track
word and C/V are zero. The checker stops before the track guard or volume/pitch
invocation, not full post-tick processing.

The linker enforces both extents and adjacent continuations, retaining the shared
guard and invocation addresses. `make compare -j8` reproduces all 16 MiB. Fresh
runtime builds reproduce all four images and exports. Source, linked, inline and
runtime inventories are refreshed; unchanged SoundMain/mixer regions are revalidated.

Mapped main instruction bytes remain 777,630: 720,474 C-owned (92.65%), 33,870
mixed C/assembly, 1,494 assembly-source and 21,792 runtime, with zero unresolved
ownership. Reviewed non-library assembly is 1,904 main bytes and 420 payload bytes.
There are 528 tracked main C files and 30 assembly entry markers. These figures
include inherited work and are not overall completion.

ELF SHA-256: `9d0e30f46e5164dafdf28b6c13dc4ac087f23ac87e5b671839ac233a532ce66a`.
Evidence: `.deps/soundmain-packed/mplay-post-setup/report.json`, source/linked
reports there, `mplay-post-setup-production.log`, `mplay-post-setup-build.log` and
refreshed runtime/region receipts. The valid production layout passes and all 68
altered layouts reject, including the four new extent/continuation cases. See
`mplay-post-setup-layout.log`. Next work continues the volume/pitch invocation, post-tick channel processing,
command guards and clear-call paths.


## MPlayMain post-tick volume/pitch invocation — September 10, 2026 (baseline `9a827ca2`)

Integrated `src/m4a_mplay_post_invoke.c` at 080CFD20..080CFD24. The four-byte
BL TrkVolPitSet is generated from C and returns directly into channel loading.
The preceding matching C fragment supplies private register arguments. This source
uses a no-argument private declaration with explicit r0-r3 bindings; it is not a
public C calling interface. TrkVolPitSet itself was already C.

The strict callback-tail contract now accepts `direct-callee` as a mutually
exclusive alternative to `trampoline`. It validates the declared direct symbol
and retains its ordinary call instruction while removing the private wrapper frame
and applying the declared continuation. All prior zero-frame, global-register,
void/no-argument, exact call/epilogue shape, label and debug/unwind checks remain.
Mixed modes, duplicate/direct-target errors and incorrect calls reject. No backend
changes were needed. Existing note and command callback regressions each pass
49,152 cases and thirteen invalid contracts with unchanged unannotated behavior.

`check_mplay_post_invoke.py --production` passes 24,576 cases and fifteen invalid
contracts; unannotated source is unchanged. A synthetic Thumb store/BX-LR body at
the real callee address tests all incoming/returned NZCV combinations, four stack
positions, three write aliases and random register clobbers. Exact callee-entry
registers/SP/LR/mode/flags, all returned registers/flags, full RAM and the one
ordered write agree. Typed Thumb callee metadata is checked in candidate and
production ELF files. No hidden wrapper frame appears. This validates invocation
mechanics, not actual TrkVolPitSet logic or complete MPlayMain execution.

The linker enforces the four-byte extent, adjacent channel-load continuation and
direct-call range. `make compare -j8` reproduces all 16 MiB. Fresh runtime builds
reproduce all four images and exports. Source, linked, inline and runtime
inventories are refreshed; unchanged SoundMain/mixer regions are revalidated.

Mapped main instruction bytes remain 777,630: 720,478 C-owned (92.65%), 33,870
mixed C/assembly, 1,490 assembly-source and 21,792 runtime, with zero unresolved
ownership. Reviewed non-library assembly is 1,900 main bytes and 420 payload bytes.
There are 529 tracked main C files and 30 assembly entry markers. These figures
include inherited work and are not overall completion.

ELF SHA-256: `1dcd9d53cb3bd423cbaeac8189ea110819b75124d961bb261c65f69261648238`.
Evidence: `.deps/soundmain-packed/mplay-post-invoke/report.json`, source/linked
reports there, `mplay-post-invoke-production.log`, note/command regression logs,
`mplay-post-invoke-build.log` and refreshed runtime/region receipts. The valid
production layout passes and all 72 altered layouts reject, including four new
extent/continuation and far/backward direct-target cases. See
`mplay-post-invoke-layout.log`. Next work continues post-tick channel processing,
command guards and clear-call paths.


## MPlayMain post-tick traversal/cleanup — September 10, 2026 (baseline `f86bd130`)

Integrated `src/m4a_mplay_post_channel_load.c` at 080CFD24..080CFD2A,
`src/m4a_mplay_post_channel_next.c` at 080CFD96..080CFD9C and
`src/m4a_mplay_post_track_finish.c` at 080CFD9C..080CFDA6. The first loads the
track's channel pointer and selects channel processing or cleanup. The second
loads the next channel and loops or falls into cleanup. Cleanup retains the high
flag nibble, stores it and restores the saved loop count from r9 into r2.
All 22 original instruction bytes are matching C. Existing private-tail/direct-tail
rules suffice without compiler changes; channel processing itself remains assembly.

`check_mplay_post_traversal.py --production` passes 86,784 cases: 10,624 each for
channel load/next and 65,536 cleanup cases. Pointer tests include zero, low/high
boundaries, every single-bit word and 128 random words, all NZCV and four base
positions including pointer fields at SP and the last RAM word. Cleanup crosses
every flag byte, four full-width saved counts, all NZCV and four track positions
including SP, SP-1 and final RAM byte. All registers, SP/LR, full CPSR, complete
RAM and ordered accesses agree. Pointer paths retain CMP flags; cleanup retains
incoming C/V and the masked result's NZ, with the high-register copy preserving
those flags. The tests stop at handler boundaries, not complete list traversal or
channel updates.

The linker constrains each extent and continuation and the channel conditional
transfer ranges. `make compare -j8` reproduces all 16 MiB. Fresh runtime builds
reproduce all four images and exports. Source, linked, inline and runtime inventories
are refreshed; unchanged SoundMain/mixer regions are revalidated.

Mapped main instruction bytes remain 777,630: 720,500 C-owned (92.65%), 33,870
mixed C/assembly, 1,468 assembly-source and 21,792 runtime, with zero unresolved
ownership. Reviewed non-library assembly is 1,878 main bytes and 420 payload bytes.
There are 532 tracked main C files and 30 assembly entry markers. These figures
include inherited work and are not overall completion.

ELF SHA-256: `6e1ddd9e94be8d44a639e29ed9d40ba8e0ed190d5ec78896528169ed5157c6c8`.
Evidence: `.deps/soundmain-packed/mplay-post-traversal/report.json`, source/linked
reports there, `mplay-post-traversal-production.log`, `mplay-post-traversal-build.log`
and refreshed runtime/region receipts. The valid layout passes and all 81 altered
layouts reject, including six new extent/continuation cases and three far/backward/odd
channel-gate targets. See `mplay-post-traversal-layout.log`. Next work continues
channel volume/pitch/stopped-channel handling, command guards
and clear-call paths.


## Post-tick stopped-channel candidates — September 10, 2026

On production baseline `0a98812b`, three isolated C candidates reproduce the
original 16 instruction bytes at 080CFD2A..080CFD3A: channel status guard (8),
ClearChain argument setup (2), and direct invocation/next-channel branch (6).
The compiler now recognizes an inverse EQ masked test around an adjacent
declared tail and emits TST/BNE through a dedicated machine pattern. Existing
adjacency, register, destination and transfer-count restrictions remain enforced.
The isolated GCC rebuild and all four affected plugin rebuilds completed.

The guard passes all 16,384 status/NZCV/alias cases, including 512 cleanup exits
and 15,872 processing exits; three invalid source forms reject and an
unannotated source remains unchanged. The argument copy passes 26,880
full-register/flags/no-memory-access cases. Direct call/return passes 24,576
cases and rejects 15 invalid contracts; unannotated compilation is unchanged.
The call checker substitutes a synthetic STR/BX LR callee at the real ClearChain
address and therefore verifies call mechanics, not ClearChain's implementation.
All checks stop at fragment boundaries; this is not full MPlayMain execution.
Generic direct-tail regression rejects nine configurations and three source forms.
The existing descending masked-zero track guard also passes its 16,384 cases,
four invalid source forms and two invalid configurations with the rebuilt plugin.

Sources and checkers are in `research/audio/mplay_post_channel_gate.c`,
`mplay_post_clear_setup.c`, `mplay_post_clear_invoke.c` and their corresponding
`check_*.py` files. Reports are under `.deps/soundmain-packed/` in the matching
`mplay-post-*` directories. These are isolated candidates, not integrated
production replacements. Production C ownership remains 720,500/777,630
(92.65%). Next: integrate with exact section/branch assertions, validate altered
layouts, reproduce the ROM, and refresh source/runtime/ownership evidence.


## Integrated post-tick stopped-channel handling — September 10, 2026

On baseline `21d596b2`, the verified 8-byte status gate, 2-byte argument copy,
and 6-byte ClearChain invocation/next-channel branch are now production C at
080CFD2A..080CFD3A. Each production source equals its candidate except for the
function name; the linked audit assigns the exact Thumb ranges to the three
C-only objects. The corresponding assembly instructions have been removed.

All 67,840 production/original cases pass: 16,384 status decisions, 26,880
argument setups and 24,576 synthetic-callee call/return cases. The earlier
candidate milestone documents model coverage and limitations; ClearChain logic
and whole MPlayMain execution are not claimed by these fragment tests.

`make compare -j8` reproduces all 16 MiB. The valid production link passes, and
all 94 altered layouts reject, including six new fragment extent/continuation
perturbations, three conditional channel-body targets and four out-of-range
callee/next-channel transfers. Fresh runtime builds reproduce all four images
and exported symbols. Source, inline, ownership, linked and runtime inventories
are refreshed. SoundMain (1,064 bytes) and mixer (932 bytes) remain entirely C
with unchanged extents and original bytes.

Main mapped instruction bytes: 777,630 total, 720,516 C-owned (92.65%),
33,870 mixed C/assembly, 1,452 assembly-source and 21,792 runtime archives.
Reviewed non-library assembly: 1,862 main bytes and 420 payload bytes. There are
535 tracked main C files and 30 assembly entry markers. These totals include
inherited work and are not a measured overall completion percentage.

ELF SHA-256: `f983969ea6a87215dd0ff5f7071a3f79a278d39fe1fe678ae7e922efe5d9679c`.
Evidence: `.deps/soundmain-packed/mplay-post-clear-build.log`,
`mplay-post-clear-*-production.log`, `mplay-post-clear-layout.log`,
`mplay-post-clear-production-identity.json`, source/linked audit reports, the
three candidate report directories and refreshed tracked ownership/runtime/region
receipts. Next: channel volume/pitch handling, command guards, earlier clear
calls and the remaining MPlayMain frame exit.


## Channel volume path candidates — September 10, 2026

On production baseline `2941b969`, three isolated C fragments reproduce the
30 bytes at 080CFD3A..080CFD58: type/volume guard (14), ChnVolSetAsm direct
invocation (4), and conditional CgbChannel.mo update (12). No new compiler
pattern is required. The guard uses the existing ascending masked-zero external
tail; the invocation uses the existing direct-callee/fallthrough contract; the
update uses an ordinary local branch and adjacent terminal transfer.

The guard passes 264,064 cases: every type/flag byte pair at four aliases with
cycling NZCV, plus 30 boundary pairs at all aliases and all 16 NZCV states.
Aliases cover separate storage, channel at SP, flags at SP, and type/flags sharing
one byte. The model reads the final stored byte for that shared alias. It checks
all registers, SP/LR, complete CPSR/RAM, ordered type-then-flags reads and exact
exit choice (66,176 pitch, 197,888 volume). Three invalid source forms reject;
unannotated compilation is unchanged.

The invocation passes 24,576 cases and rejects 15 invalid contracts; unannotated
compilation is unchanged. A synthetic STR/BX LR at the real ChnVolSetAsm address
080CFE14 validates the direct-call/return mechanics and arbitrary returned
registers/flags; the callee implementation is not exercised by this checker.
The flag-update model checks zero/nonzero channel type, retained registers,
CMP/OR flags and conditional mo read/write. All 720,896 cases pass: every mode
byte, types 0..7 plus four full-width boundaries and 32 single-bit values, four
aliases (normal, update byte at SP, channel at SP, last RAM byte), and all NZCV.
There are 16,384 skipped updates and 704,512 read/write updates. Combined with
the decision and invocation, all 1,009,536 fragment cases pass.

Sources/checkers are `research/audio/mplay_post_volume_{guard,invoke,finish}.c`
and corresponding `check_*.py` files; reports are under
`.deps/soundmain-packed/mplay-post-volume-{guard,invoke,finish}/`. These are
isolated candidates and stop at fragment boundaries, not complete MPlayMain
execution. Production ownership is unchanged. Next: integrate all 30 bytes with exact
extents/ranges and full build/audit gates.


## Channel volume path production integration — September 10, 2026

On baseline `1b261ebc`, the 30-byte volume path at 080CFD3A..080CFD58 is
integrated as three C-only objects. The production sources equal the verified
candidates except for function names; linked ownership confirms the exact Thumb
ranges. The old assembly instructions are removed. The branch after the final
volume update falls through to the new MPlayMainPostPitchGuard boundary.

`make compare -j8` reproduces all 16 MiB. Fresh runtime builds reproduce all four
images and exported symbols. Source, linked, inline and runtime inventories are
refreshed. SoundMain (1,064 bytes) and mixer (932 bytes) retain their fully C-owned
regions and original bytes. All 1,009,536 production/original fragment cases
pass: 264,064 guard, 24,576 synthetic-callee invocation, and 720,896 mode update.
The preceding candidate section describes coverage and limits; these tests do
not execute a full MPlayMain call or the real ChnVolSetAsm body.

The valid production layout passes and all 105 altered layouts reject, including
six new extent/continuation perturbations, three invalid pitch-guard targets and
two out-of-range volume-callee targets. See `mplay-post-volume-layout.log`.

Main mapped instruction bytes: 777,630 total, 720,546 C-owned (92.66%),
33,870 mixed C/assembly, 1,422 assembly-source and 21,792 runtime archives.
Reviewed non-library assembly: 1,832 main bytes and 420 payload bytes. There are
538 tracked main C files and 30 assembly entry markers. These figures include
inherited work and do not measure overall completion.

ELF SHA-256: `8d0f58e2ee2e275c417178203232ade8b8882e588576daf9190cd58043ceb172`.
Evidence: `.deps/soundmain-packed/mplay-post-volume-build.log`,
`mplay-post-volume-production-identity.json`, source/linked audit reports,
production execution logs and refreshed tracked ownership/runtime/region receipts.
Next: pitch guard, signed key adjustment, CGB/PCM frequency calls and stores,
then remaining command guards, earlier clear calls and MPlayMain's frame exit.
The pitch setup must read keyM as signed despite its existing u8 struct field;
the original uses LDRSB at track offset 8.


## Pitch guard and key-adjustment research — September 10, 2026

On baseline `705d7659`, the 8-byte pitch-update guard at 080CFD58..080CFD60
matches as an isolated C candidate. All 16,384 track-flags/NZCV/storage-alias
cases pass (4,096 next-channel exits, 12,288 key-adjustment exits). Three invalid
source forms reject and unannotated compilation is unchanged. Full register,
CPSR, SP/LR and RAM state plus the single ordered flags-byte read are checked.
No complete pitch conversion or MPlayMain execution is claimed.

The following key adjustment at 080CFD60..080CFD6C loads an unsigned channel
key and signed track shift, adds them and clamps a negative wrapped result to
zero. The source explicitly uses a signed byte read at offset eight because the
existing keyM field is unsigned. Ordinary GCC produces either a branchless
sequence clobbering r3 or, with if-conversion disabled, an extra CMP/BGE. Neither
preserves the original ADD/BPL bytes and addition flags.

A new constrained `matching_thumb_add_sign_branch` pass and machine pattern
are implemented and built. They recognize exactly one adjacent low-register addition and GE
zero forward branch in a private Thumb tail function, with no intervening label,
call, barrier or assembly and a maximum 200-byte forward span. The emitted
ADDS/BPL tests the sign of the wrapped sum, including overflow, and preserves
addition NZCV. The isolated backend and dependent plugin rebuilds completed.
The resulting 12 bytes match exactly. All 267,264 key-adjustment cases pass:
262,144 key/shift/alias load-entry cases and 5,120 arithmetic-entry cases,
including full-width signed overflow and random operands at all NZCV states.
27,197 cases clamp to zero. All registers, full CPSR, SP/LR, RAM and ordered
reads (or no reads for the arithmetic entry) match an independent arithmetic
model. Four invalid source forms reject: missing private-tail contract,
subtraction, equality test and an intervening register tie. Loading the new
plugin does not change an unannotated function.

The pitch guard again passes all 16,384 cases under the rebuilt compiler.
Generic direct-tail regressions reject nine invalid configurations and three
source forms; unannotated compilation is unchanged. Combined pitch/key coverage
is 283,648 cases. Production ownership remains unchanged.

Sources/checkers: `research/audio/mplay_post_pitch_guard.c`,
`mplay_post_key_adjust.c` and corresponding `check_*.py` files. Compiler sources:
`tools/arm-dispatch/thumb_add_sign_branch.cc`, its build helper and `matching.md`.
Evidence: `.deps/soundmain-packed/mplay-post-pitch-guard/report.json` and
`post-key-adjust-backend.log`, `mplay-post-key-adjust/report.json` and the
matching check logs. Next: integrate both fragments with exact extents/ranges
and full build/audit gates. This does not establish frequency conversion or
whole-MPlayMain correctness.


## Pitch guard/key adjustment production integration — September 10, 2026

On baseline `2be9fb98`, the 20 bytes at 080CFD58..080CFD6C are integrated as
two C-only objects. The production sources equal their candidates except for
function names; the linked audit confirms the exact Thumb instruction ranges.
The assembly instructions are removed, and FrequencySelect names the following
hardware/software frequency dispatch boundary. The new compiler plugin is a
Make dependency of the key-adjustment object.

All 283,648 production/original cases pass: 16,384 pitch-guard decisions and
267,264 key-adjustment cases, including 5,120 arithmetic-entry cases covering
full-width overflow and random operands. The candidate section documents the
four rejected key-adjustment forms and the execution limits. These fragments
do not execute frequency conversion or an entire MPlayMain call.

`make compare -j8` reproduces all 16 MiB. Fresh runtime builds reproduce all four
images and exported symbols. Source, linked, inline and runtime inventories are
refreshed. SoundMain (1,064 bytes) and mixer (932 bytes) retain their fully
C-owned extents and original bytes. The valid layout passes and all 111 altered
layouts reject, including four new extent/continuation perturbations and two
out-of-range next-channel targets. See `mplay-post-key-layout.log`.

Main mapped instruction bytes: 777,630 total, 720,566 C-owned (92.66%),
33,870 mixed C/assembly, 1,402 assembly-source and 21,792 runtime archives.
Reviewed non-library assembly: 1,812 main bytes and 420 payload bytes. There are
540 tracked main C files and 30 assembly entry markers. These totals include
inherited work and do not measure overall completion.

ELF SHA-256: `da1f16f3836c9566ea4cf36866d2d9efc7b21bce200a34597fa814c9c6eedf92`.
Evidence: `.deps/soundmain-packed/mplay-post-key-build.log`,
`mplay-post-{pitch-guard,key-adjust}-production.log`,
`mplay-post-key-production-identity.json`, source/linked audits and refreshed
tracked ownership/runtime/region receipts. Next: frequency selection, CGB/PCM
frequency call setup/invocation/stores, then remaining command guards, earlier
clear calls and MPlayMain's frame exit.


## Frequency selection and setup candidates — September 10, 2026

On production baseline `9cfa4b5a`, three isolated C candidates reproduce 20
instruction bytes: frequency selection at 080CFD6C..080CFD70 (4), CGB setup at
080CFD70..080CFD7A (10), and PCM setup at 080CFD8A..080CFD90 (6). Existing
private-tail, direct-zero-tail and copy-add-zero rules suffice. The CGB source
explicitly casts the function pointer to its register word representation.

All 182,880 original/candidate execution cases pass. Selection covers 422 type
values (all byte values, boundaries, single bits and random words) at all 16
NZCV states: 6,752 cases. Each setup passes 88,064 cases: every pitch byte with
14 type values, six key boundaries, four aliases and cycling NZCV, plus 2,048
random cases spanning all NZCV. Aliases include separate storage, the word at
SP, pitch at SP, and pitch sharing the pointer's first byte. The model uses the
final stored pointer word after the overlapping byte write.

Checks compare all registers r0-r12, SP/LR, full CPSR, complete RAM and ordered
accesses. CGB reads the function word before the pitch byte; PCM reads the pitch
byte before the waveform word. Final CGB flags reflect the channel-type ADDS #0;
PCM flags reflect the key ADDS #0 despite the later loads. Selection preserves
registers with CMP flags and chooses the correct setup. Calls themselves are
outside this checker; neither frequency-function behavior nor full MPlayMain
execution is claimed.

The final sources pass after the explicit pointer cast. The copy-add-zero
regression accepts ARM/Thumb copies, rejects eight original contracts and five
high-copy option forms, and leaves unannotated output unchanged. No production
integration or ownership increase is claimed yet.

Sources: `research/audio/mplay_post_frequency_select.c`,
`mplay_post_cgb_setup.c`, `mplay_post_pcm_setup.c`; checker:
`research/audio/check_mplay_post_frequency_setup.py`. Evidence:
`.deps/soundmain-packed/mplay-post-frequency-setup/report.json` and
`mplay-post-frequency-setup-check.log`. Next: integrate selection/setup with exact
extents and transfer checks, then finish frequency invocation/result stores.


## Frequency selection/setup production integration — September 10, 2026

On baseline `56f0c441`, frequency selection (080CFD6C..080CFD70), CGB setup
(080CFD70..080CFD7A) and PCM setup (080CFD8A..080CFD90) are integrated as
three C-only objects, replacing 20 assembly instruction bytes. Production source
identity with the candidates and exact linked Thumb extents are verified.
The shared CGB/PCM invocation boundaries retain the original assembly calls.

All 182,880 production/original cases pass: 6,752 selection cases and 88,064
cases per setup. The candidate section documents coverage of full-width values,
ordered pointer/byte reads and overlapping storage, plus the test limitations.
This does not execute the conversion functions or complete MPlayMain.

`make compare -j8` reproduces the full 16 MiB ROM. Fresh runtime builds reproduce
all four images and exported symbols. Source, linked, inline and runtime
inventories are refreshed. SoundMain (1,064 bytes) and mixer (932 bytes) retain
their fully C-owned extents and original bytes. The valid layout passes and all
119 altered layouts reject, including six new extent/continuation perturbations
and two out-of-range PCM-setup targets. See `mplay-post-frequency-layout.log`.

Main mapped instruction bytes: 777,630 total, 720,586 C-owned (92.66%),
33,870 mixed C/assembly, 1,382 assembly-source and 21,792 runtime archives.
Reviewed non-library assembly: 1,792 main bytes and 420 payload bytes. There are
543 tracked main C files and 30 assembly entry markers. These figures include
inherited work and are not an overall completion percentage.

ELF SHA-256: `bcb582b7acc43ad19de678c39e073590d8e50e12e4306395c76e9306dc7c5795`.
Evidence: `.deps/soundmain-packed/mplay-post-frequency-build.log`,
`mplay-post-frequency-production.log`, `mplay-post-frequency-production-identity.json`,
source/linked reports and refreshed tracked ownership/runtime/region receipts.
Next: CGB/PCM frequency invocation and result stores, then remaining command
guards, earlier clear calls and MPlayMain's frame exit.


## Frequency invocation/result-store candidates — September 10, 2026

On production baseline `cc4b5b2c`, four isolated C candidates reproduce 22
instruction bytes: CGB invocation 080CFD7A..080CFD7E (4), CGB result/update
080CFD7E..080CFD8A (12), PCM invocation 080CFD90..080CFD94 (4), and PCM
result 080CFD94..080CFD96 (2). Existing callback/private-tail rules suffice.
These candidates have not replaced the production assembly yet.

All 201,088 original/candidate execution cases pass. CGB invocation passes
49,152 cases using the real shared call_r3 trampoline and synthetic ARM/Thumb
STR/BX LR callback bodies. PCM invocation passes 24,576 cases with a synthetic
Thumb body at MidiKeyToFreq's real address, 080D00D4. Both check callback-entry
state, arbitrary returned registers/NZCV, SP/LR, full RAM and ordered writes
across four stack positions and three write aliases. They reject 13 and 15
invalid contracts respectively; unannotated compilation is unchanged. These
checks establish call/return mechanics, not the conversion functions' logic.

CGB result storage passes 100,352 cases: all mode bytes, six frequency-word
boundaries, random frequencies, four channel placements and every NZCV. PCM
storage passes 27,008 cases covering byte values, boundaries, single bits and
random frequency words over the same channel placements/NZCV. Exact registers,
CPSR, SP/LR, RAM and accesses agree. The CGB sequence stores frequency first,
reads mode, sets bit 1 (mask 2), writes mode, and branches to channel advance;
it preserves incoming C/V and clears N/Z. PCM stores frequency and preserves
all flags. Placement cases include frequency at SP, mode at SP (an unaligned
frequency-word address), and the last mapped RAM word. These are emulator-based
original/candidate comparisons; physical GBA bus alignment/timing is not tested.

Sources: `research/audio/mplay_post_{cgb,pcm}_{invoke,store}.c`. Checkers:
`check_mplay_post_cgb_invoke.py`, `check_mplay_post_pcm_invoke.py` and
`check_mplay_post_frequency_store.py`. Reports and logs are under
`.deps/soundmain-packed/mplay-post-{cgb-invoke,pcm-invoke,frequency-store}`.
Production ownership remains unchanged. Next: integrate all four fragments with
exact extents, call/branch ranges, full ROM comparison and refreshed audits.


## Frequency invocation/store production integration — September 10, 2026

On baseline `40e45661`, four C-only objects replace 22 instruction bytes:
CGB invocation at 080CFD7A..080CFD7E, CGB frequency/mode stores and branch at
080CFD7E..080CFD8A, PCM invocation at 080CFD90..080CFD94, and PCM frequency
store at 080CFD94..080CFD96. Production sources equal the candidate sources
except for function names, and linked ownership confirms the exact Thumb ranges.
The production assembly no longer contains these calls or result stores.

All 201,088 production/original cases pass: 49,152 CGB call/return cases,
24,576 PCM call/return cases, 100,352 CGB result-store cases and 27,008 PCM
result-store cases. The preceding candidate section specifies synthetic-callee
and emulator coverage limits; conversion-function logic, complete MPlayMain and
physical hardware timing are not established by these fragment checks.

`make compare -j8` reproduces all 16 MiB. Fresh runtime builds reproduce all four
images and exported symbols. Source, inline, linked and runtime inventories are
refreshed. SoundMain (1,064 bytes) and mixer (932 bytes) retain their fully
C-owned extents and original bytes. The valid layout passes and all 133 altered
layouts reject, including eight new extent/continuation perturbations and six
out-of-range call/result-branch targets. See `mplay-post-frequency-result-layout.log`.

Main mapped instruction bytes: 777,630 total, 720,608 C-owned (92.67%),
33,870 mixed C/assembly, 1,360 assembly-source and 21,792 runtime archives.
Reviewed non-library assembly: 1,770 main bytes and 420 payload bytes. There are
547 tracked main C files and 30 assembly entry markers. These totals include
inherited work and are not an overall completion percentage.

ELF SHA-256: `9d4de02f74e835e847c2ad280698f84c0993560315e70e5e82fac1049e9a29a5`.
Evidence: `.deps/soundmain-packed/mplay-post-frequency-result-build.log`,
`mplay-post-{cgb-invoke,pcm-invoke,frequency-store}-production.log`,
`mplay-post-frequency-result-production-identity.json`, source/linked reports and
refreshed tracked ownership/runtime/region receipts. Next: post-track advancement
and MPlayMain's frame exit, plus earlier command guards and clear-call paths.


## Exit identifier restoration candidate — September 10, 2026

On production baseline `d254436e`, an isolated C candidate reproduces the four
bytes at 080CFDB0..080CFDB4: read the shared identifier literal at 080CFDCC and
store it to MusicPlayerInfo.ident (offset 52). The existing shared-literal and
adjacent private-tail rules suffice. The candidate stops at ExitRestore.

All 29,216 original/candidate cases pass: 166 literal values (the real identifier,
full-width boundaries, single bits and random words), eleven player placements,
and every NZCV. Placements include separate storage, the identifier destination
at each of the nine saved-frame words (including the eventual return address),
and the final RAM word. Synthetic cases replace the literal in both emulator
images. All registers, full CPSR, SP/LR and RAM agree; the trace is exactly one
literal read followed by the identifier write. These checks do not execute the
subsequent stack restoration or establish a complete return.

Sources/checker: `research/audio/mplay_exit_unlock.c` and
`research/audio/check_mplay_exit_unlock.py`. Evidence:
`.deps/soundmain-packed/mplay-exit-unlock/report.json` and
`mplay-exit-unlock-check.log`. The assembler's generic alignment warning is
resolved for this candidate by linking at its original word-aligned address and
checking the exact relocated bytes; production will need explicit address/range
constraints before integration. Production ownership is unchanged.

The remaining exit pops r0-r7 from offsets 0..28, copies r0-r3 into r8-r11,
pops the return target into r3 from offset 32, then uses the shared call_r3 BX.
The existing grouped `thumb_frame_return` contract instead consumes 64 bytes
with low-register loads at offsets 28..56 and the target at 60. It cannot be
reused unchanged. Next: support and verify the exact 36-byte frame while
preserving the shared trampoline entry, then integrate the complete exit path.


## MPlayMain 36-byte return candidate — September 10, 2026

On baseline `99cd30b7`, the existing grouped frame-return plugin gains an
explicit `frame36` option, requiring `grouped`. The default remains the 64-byte
mixer frame. The new mode requires exactly the ordered restoration body, loads
r0-r7 at offsets 0..28, copies r0-r3 into r8-r11, loads the final target from
32 and consumes 36 bytes. The transformation emits POP low-eight, the four
high-register MOVs, POP r3 and BX r3. Unlike the mixer mode, it adds no initial
SP adjustment. Existing zero-frame, no-arguments, no-debug/unwind, no-branch/call/
assembly, aligned read-only frame and saved-target checks remain enforced.

The 14 candidate bytes at 080CFDB4..080CFDC2 match the original exactly.
All 32,768 original/candidate cases pass: 16,384 full-frame restorations and
16,384 direct entries at the shared BX instruction. Coverage spans ARM/Thumb
return targets, all NZCV, four stack placements including the final mapped
36-byte frame, and random saved/initial registers. All registers, full CPSR,
SP/LR, RAM, nine ordered word reads and SP at every instruction agree with the
independent frame model. Shared entry performs no frame reads or SP movement.
The preceding identifier store and complete MPlayMain body are outside this
checker; they are not claimed by the return result.

Fourteen invalid 36-byte source forms reject and unannotated compilation is
unchanged. The original grouped mixer contract still rejects its 14 invalid
forms, with unannotated output unchanged. Its execution regression passes
40,960 cases across four ROM/copied-RAM machines plus 2,048 shared entries,
retaining the exact 24-byte mixer-return section and final ARM/Thumb transfer.

Sources/checkers: `research/audio/mplay_exit_restore.c`,
`check_mplay_exit_restore.py`, `check_mplay_exit_restore_contract.py`; compiler:
`tools/arm-dispatch/thumb_frame_return.cc`. Evidence:
`.deps/soundmain-packed/mplay-exit-restore/report.json`,
`mplay-exit-restore-check.log`, `mplay-exit-mixer-regression.log` and the plugin
build receipt. Production ownership is unchanged. Next: integrate the identifier
store and return while preserving call_r3 as a typed shared Thumb entry, verify
full ROM and altered layouts, and refresh ownership/runtime evidence.


## MPlayMain exit production integration — September 10, 2026

On baseline `2126c8ba`, the 18-byte exit at 080CFDB0..080CFDC2 is generated
by two C-only objects: identifier restoration (4) and saved-frame restoration/
shared BX (14). Production sources equal their candidates except for function
names, and linked ownership confirms the exact Thumb ranges.

The frame-return plugin's optional `return-entry` emits only a global Thumb
symbol alias at the final BX after compiling the return function. It requires
the grouped 36-byte mode and a valid identifier. The branch itself remains the
existing return machine pattern. Defining the alias solely through the linker
lost Thumb metadata and introduced a veneer; compiler-emitted `.thumb_set`
metadata preserves `call_r3` as FUNC at 080CFDC1 without added instruction bytes.
The production check verifies that symbol type/address, and the full ROM match
proves the original calls and layout are retained.

All 61,984 exit fragment cases pass (29,216 identifier store and 32,768
full-return/shared-entry cases). The CGB caller regression passes another
49,152 ARM/Thumb callback cases with the production shared entry. The new return
contract rejects 18 invalid forms, including four invalid shared-entry options,
and unannotated compilation is unchanged. Coverage remains that of the separate
fragment models documented above, not complete MPlayMain execution.

`make compare -j8` reproduces all 16 MiB. Fresh runtime builds reproduce all four
images and exports. Source, linked, inline and runtime inventories are refreshed.
SoundMain (1,064 bytes) and mixer (932 bytes) retain their fully C-owned extents
and original bytes. The valid layout passes and all 140 altered layouts reject,
including new exit extent/continuation/pool-placement changes and three invalid
identifier literal positions. See `mplay-exit-layout.log`.

Main mapped instruction bytes: 777,630 total, 720,626 C-owned (92.67%),
33,870 mixed C/assembly, 1,342 assembly-source and 21,792 runtime archives.
Reviewed non-library assembly: 1,752 main bytes and 420 payload bytes. There are
549 tracked main C files and 30 assembly entry markers. These figures include
inherited work and are not an overall completion percentage.

ELF SHA-256: `0a7e6502cfb8e7d43220963472c55acc9ef7c1e3f49666519808fbc09f1c313c`.
Evidence: `.deps/soundmain-packed/mplay-exit-build.log`,
`mplay-exit-{unlock,restore}-production.log`, `mplay-exit-callback-regression.log`,
`mplay-exit-production-identity.json`, source/linked reports and refreshed tracked
ownership/runtime/region receipts. Next: post-track advancement, earlier command
guards and clear-call paths, and remaining MPlayMain entry/loop assembly.


## Post-track advancement model and compiler probe — September 10, 2026

On production baseline `0947008d`, the remaining 10-byte block at
080CFDA6..080CFDB0 decrements r2, exits on the decrement's BLE condition,
otherwise sets r0 to 80, advances r5 and loops on the addition's BGT condition.
The first decision equals signed original count <= 1, including INT_MIN
subtraction overflow. The second equals signed original track + 80 > 0 before
overflow, or signed original track > -80. Testing the wrapped result alone would
be incorrect when a positive pointer sum crosses INT_MAX.

An independent original-only model passes 51,840 cases: every byte count,
four full-width boundaries and 64 random counts, ten pointer values around
signed wrap/zero thresholds, and all NZCV. Outcomes are 5,920 count exits,
13,776 pointer exits and 32,144 loop entries. All registers, full CPSR, SP/LR,
RAM and absence of data accesses match. This establishes the model, not a
matching C replacement or complete MPlayMain traversal.

The direct constant comparison compiles to a fused ADD/BLT form unsupported by
the private-tail control-flow validator. Expressing the negative bound via the
known 80-byte size and a register tie produces supported scalar control flow.
That tail-only probe emits 24 bytes and clobbers r3: CMP/count branches, NEG/CMP
for the pointer bound, duplicated pointer additions and duplicated decrements.
The existing fork-decrement rule rejects the nested graph. No guard has been
relaxed to accept this nonmatching output. The next matching rule must combine
the count fork and pointer fork while retaining the original subtraction and
addition flags and avoiding an r3 temporary.

Source: `research/audio/mplay_post_track_next.c`. Original model checker:
`research/audio/check_mplay_post_track_next_model.py`. Evidence:
`.deps/soundmain-packed/mplay-post-track-next/original-model.json`,
`tail-only.c`, `tail-only.o`, and the ordinary assembly probe at
`.deps/soundmain-packed/mplay-post-track-next-plain.s`. Production is unchanged;
all preceding matching milestones remain the verified baseline.


## Matching post-track advancement candidate — September 10, 2026

On production baseline `8fd078e5`, the post-track candidate now reproduces all
10 bytes at 080CFDA6..080CFDB0. The fork-decrement rule permits exact empty
single-register self ties while still rejecting instruction-bearing or clobbering
assembly. This produces the original SUBS/BLE pair across the nested pointer
fork. Eight invalid shapes reject, the tied/untied positive output agrees, and
unannotated compilation is unchanged.

A new `thumb_positive_advance` pass and machine pattern fold the pointer fork
into ADDS/BGT to its declared external destination. The pass requires a proven
positive size constant 1..255 followed by its exact tie, a dead nonglobal NEG
temporary, the expected signed comparison, identical additions on both arms,
and a closed tail/join layout. It retains empty join labels used by the count
exit. The machine pattern models a widened signed sum and modulo-32-bit result,
so overflow preserves the original BGT meaning. The isolated compiler and
required plugins rebuilt successfully.

All 51,840 matching-candidate cases pass against the previously original-verified
independent model: 5,920 count exits, 13,776 pointer exits and 32,144 loops.
Full registers including preserved r3, CPSR, SP/LR and no-memory-access state
agree across byte/full-width counts, pointer wrap thresholds and all NZCV.
Six invalid source forms reject (zero/oversized step, unequal arithmetic,
missing private-tail contract, nonempty assembly, reversed comparison), and
unannotated output is unchanged. The earlier saved-state/track-advance regression
also passes all 251,136 cases under the rebuilt compiler. This does not execute
complete traversal or full MPlayMain; production ownership is unchanged.

Sources/checkers: `research/audio/mplay_post_track_next.c`,
`check_mplay_post_track_next.py`, `check_thumb_fork_decrement.py`; compiler sources
are `tools/arm-dispatch/thumb_positive_advance.cc`, its build helper, the extended
fork-decrement pass and `matching.md`. Evidence:
`.deps/soundmain-packed/mplay-post-track-next/candidate-model.json`,
`mplay-post-track-next-check.log`, `post-track-next-advance-regression.log`,
`post-track-next-backend.log` and plugin build receipts. Next: production
integration with exact extent and both conditional transfer constraints, full
ROM verification and refreshed audits.


## September 10, 2026 — Post-track advancement integrated

On baseline `53c1da9f`, the 10 instruction bytes at 080CFDA6..080CFDB0
are now generated by `src/m4a_mplay_post_track_next.c`. Its source is identical
to the verified candidate except for the function name. The production linker
owns exactly that Thumb extent in the C object. The count-exit continuation and
backward conditional loop transfer are constrained by linker assertions.

`make compare -j8` passes for the entire 16 MiB ROM. All 51,840 independent-model
execution cases pass, including signed count overflow, pointer wrap thresholds,
all NZCV values, preserved registers, stack and no-memory-access checks. Six
unsupported source shapes reject and unannotated output remains unchanged.
The valid full production layout links; all 144 altered layouts reject, including
four new extent, continuation and forward/backward loop-range violations.
The checker verifies candidate bytes against the original ROM and full production
ROM identity; the separate source/linked ownership receipt ties those bytes to
the production C fragment. These tests do not execute complete MPlayMain.

Fresh pinned runtime builds reproduce all four images and exported symbols.
Updated ownership is 720,636 C-owned, 33,870 mixed C/assembly, 1,332 assembly-source,
and 21,792 runtime archive instruction bytes in the main ROM (777,630 total).
Reviewed non-library assembly is 1,742 bytes in the main ROM and 420 in the
expanded payload; there are 550 tracked main C files and 30 assembly entry
markers. SoundMain's 1,064-byte section and the 932-byte copied mixer remain
entirely attributed to C. These inherited-inclusive inventories are not an
overall decompilation percentage.

Evidence: `.deps/soundmain-packed/post-track-next-production.log`,
`mplay-post-track-next/candidate-model.json`,
`mplay-post-track-next/production-identity.json`, `post-track-next-layout.log`,
`post-track-next-source.json`, `post-track-next-linked.json`, and the refreshed
tracked ownership, runtime and audio-region receipts. Production ELF SHA-256:
`dd4bf5b76991bbaf2400207e9fbc3ede21ebd5737de1e3e5c0e3d7ec04533286`.
Next: MPlayMain's earlier clear-call paths, command guards and entry/loop code.


## September 10, 2026 — Earlier MPlayMain clear-call integration

On baseline `8e335df2`, the earlier channel clear at 080CFBF2..080CFBF8 and
track clear at 080CFC06..080CFC0C now come from four matching C fragments:
a two-byte ADDS argument setup and a four-byte BL invocation per path.
The existing copy and private callback compiler contracts generate these
instructions without new backend changes. ClearChain and Clear64byte remain
Thumb functions at their original addresses; each call falls through to its
original continuation with the original LR. Production source is identical to
the matching candidates except for function names, and linked ownership verifies
all four exact Thumb extents in C-only objects.

The setup checkers pass 26,880 cases per path, including every NZCV, four stack
positions, byte values and full-width boundary/bit/random register values.
The invocation checkers pass 24,576 cases per path across all incoming/returned
NZCV pairs, four stacks and three callee-write aliases. Each rejects 15 invalid
contracts and confirms unannotated compilation is unchanged. Total execution
cases: 102,912. The invocation tests use a synthetic STR/BX callee at the real
address to isolate call/return mechanics; they do not execute actual cleanup
logic or complete MPlayMain.

The full 16 MiB ROM matches. Fresh pinned runtime builds reproduce all four
images and exported symbols. Main-ROM ownership is 720,648 C-owned, 33,870 mixed
C/assembly, 1,320 assembly-source and 21,792 runtime archive instruction bytes
(777,630 total). Reviewed non-library assembly is 1,730 main-ROM bytes and
420 expanded-payload bytes. The source audit counts 554 main C files and
30 assembly entry markers. SoundMain and mixer C ownership remain intact.

New linker assertions constrain all four extents/continuations and both BL
ranges. Their backward limits use ABSOLUTE(start): subtracting the range from a
section-relative offset caused unsigned underflow during the initial link,
which correctly failed its assertions; the corrected full link and ROM compare
pass. The valid full layout links and all 156 altered layouts reject, including
12 new extent/continuation and forward/backward call-range violations.
The suite report is in `early-clear-layout.log`.

Evidence: `research/audio/check_mplay_early_clear_setup.py` and
`check_mplay_early_clear_invoke.py` (each supports channel/track),
`.deps/soundmain-packed/early-clear-build.log`, `early-*-clear-*.log`,
`early-clear-production-identity.json`, `early-clear-source.json`,
`early-clear-linked.json`, and refreshed tracked ownership/runtime/audio receipts.
Production ELF SHA-256:
`b8e0ce48f31141b2f39a47b6d5506e605cf009d01f7ee03d3e69bab2c6794bbe`.
Next: MPlayMain command guards and entry/loop code.


## September 10, 2026 — Exact note/wait command-guard candidates

On production baseline `f4c0c237`, the note guard at 080CFC3A..080CFC3E
and wait guard at 080CFC50..080CFC54 now have matching C candidates.
The initial ordinary C note guard emitted CMP 206/BHI and an extra unconditional
branch. Although its branch decisions were equivalent, its flags differed from
the original CMP 207/BCC. The new opt-in `unsigned-immediate` mode in the existing
Thumb direct-tail pass folds a validated inverse GTU branch and its adjacent
single declared tail. `lt` uses the equivalent strict bound k+1; `le` retains k.
Both require low-register comparison, immediate range, a closed skip region and
exactly one rewrite. The machine pattern emits CMP/BCC or CMP/BLS with explicit
flags clobber. The installed isolated compiler and plugins rebuilt successfully.

Both candidates reproduce all four original bytes. Each passes 26,880 cases
against the original plus an independent comparison/CMP-NZCV model: all command
bytes, full-width boundaries/bit patterns/random words, every initial NZCV and
four stack positions. Registers r0-r12, CPSR, SP/LR and no-memory-access state
match. Note outcomes are 13,760 taken / 13,120 fallthrough; wait outcomes are
11,840 / 15,040. Each rejects ten source/option violations and preserves
unannotated output. A high-register source binding is not claimed as invalid:
GCC can legally copy it to a low temporary before the supported comparison.
The committed negative tests instead reject genuinely unsupported comparison,
barrier, private-contract and option shapes.

Existing direct-tail regression passes nine invalid configurations, three
invalid source forms and unchanged unannotated output. All 1,048,576 existing
production channel-guard execution cases pass under the rebuilt compiler.
No production instructions changed in this milestone; ownership totals are
unchanged. Complete continuation bodies and full MPlayMain are not tested by
the new checker. Next: integrate both guards, constrain extents and conditional
targets, and run full ROM/layout/runtime/ownership gates.

Sources: `research/audio/mplay_note_guard.c`, `mplay_wait_guard.c`,
`check_mplay_command_guards.py`, `tools/arm-dispatch/thumb_direct_tails.cc` and
`matching.md`. Evidence: `.deps/soundmain-packed/command-guard/report.json`,
`check.log`, `regression.log`, `channel-regression.log`, `backend-build.log` and
plugin build logs. The rebuilt compiler corrected an initial duplicate immediate
prefix in the machine pattern; the final assembled candidates and executions
above use the corrected output.


## September 10, 2026 — Command guards integrated

On baseline `971a7942`, the note guard at 080CFC3A..080CFC3E and wait guard
at 080CFC50..080CFC54 are integrated as matching C. Both production sources are
identical to their verified candidates except for function names. Linked
ownership attributes each exact four-byte Thumb extent to its C-only object.
The new linker assertions constrain both extents, fallthrough continuations and
forward short conditional targets.

The full 16 MiB ROM passes `make compare -j8`. All 53,760 execution cases pass
with production ROM identity verified, covering both unsigned comparison
outcomes and exact CMP flags, registers, stack, memory and no memory accesses.
Each guard rejects ten unsupported configurations and preserves unannotated
compilation. The earlier candidate milestone also verified all 1,048,576
channel-guard regression cases under the rebuilt compiler. These fragment
checks do not establish complete MPlayMain execution.

Fresh pinned runtime builds reproduce all four images and exported symbols.
Main-ROM mapped instruction ownership is 720,656 C-owned, 33,870 mixed C/assembly,
1,312 assembly-source and 21,792 runtime archive bytes (777,630 total).
Reviewed non-library assembly is 1,722 main-ROM bytes and 420 expanded-payload
bytes; there are 556 tracked main C files and 30 assembly entry markers.
SoundMain's 1,064-byte section and the 932-byte copied mixer remain entirely
attributed to C. These are inherited-inclusive inventories, not an overall
completion percentage. The valid full layout links and all 164 altered layouts reject,
including eight new extent/continuation and forward/backward target violations.

Evidence: `.deps/soundmain-packed/command-guard/production-build.log`,
`production-check.log`, `production-identity.json`, `source.json`, `linked.json`,
`layout.log`, and refreshed tracked ownership/runtime/audio receipts.
Production ELF SHA-256:
`aa27103f1501ebc87fa3f395f840602a6be108d4650de86f7bc3131db8fee040`.
Next: MPlayMain entry and track-loop setup/dispatch code.


## September 10, 2026 — Tick setup and track-dispatch candidates

On production baseline `28bd496a`, matching C candidates now cover tick setup
at 080CFBB8..080CFBC0 (eight bytes) and track dispatch at 080CFBC0..080CFBD6
(22 bytes). The setup performs ordered track-count and track-pointer loads,
then initializes the mask/status registers. It uses the existing private-tail
contract without compiler changes and passes 131,072 original/candidate cases
against independent register/flag/read expectations. Coverage includes every
byte count and initial NZCV, four aligned player locations (stack aliases and
RAM boundary), eight track words, all registers/SP/LR and complete RAM.

The initial dispatch C probe differed in TST operand order and had a redundant
branch for the zero-channel continuation. The existing direct-tail pass now
has an optional descending-local-mask mode: exactly one local equality test of
two distinct low-register AND operands is reordered while keeping that branch
local. Its AND result and flags are invariant under swapping the operands.
The separate zero-channel test uses the existing direct conditional-tail rule.
No new machine pattern or backend rebuild was needed for this extension.

All 262,144 dispatch cases pass for original and matching candidate against an
independent state/read/flag model: 131,072 inactive, 32,768 track-init and 98,304
channel paths. Tests span every status byte/NZCV, channel/mask boundaries, four
track locations including stack aliases and RAM boundary, high-register state,
conditional ordered reads and complete unchanged RAM. Nine invalid source/option
configurations reject; unannotated output remains unchanged. The final plugin
keeps the reordered branch local rather than allowing a later direct-tail fold.
Both candidates were verified before production integration; continuation bodies
and complete MPlayMain remain outside these checks.

After the final plugin change, all 53,760 production command-guard regression
cases pass, as do nine existing invalid direct-tail configurations and three
invalid source forms. Total new candidate cases are 393,216. Production
ownership is unchanged. Next: integrate the contiguous 30-byte region with
extent/continuation/branch-range assertions, then full ROM/layout/runtime/audits.

Sources: `research/audio/mplay_tick_setup.c`, `mplay_track_dispatch.c`,
`check_mplay_tick_setup.py`, `check_mplay_track_dispatch.py` and
`tools/arm-dispatch/thumb_direct_tails.cc`. Evidence:
`.deps/soundmain-packed/tick-setup/report.json`, `check.log`, `dispatch-check.log`,
`dispatch-plugin-build.log`, `direct-regression.log`, `command-regression.log`,
and `.deps/soundmain-packed/track-dispatch/report.json`.


## September 10, 2026 — Tick setup and track dispatch integrated

On baseline `df03fbe2`, the contiguous 30-byte region at 080CFBB8..080CFBD6
is now generated by the tick-setup and track-dispatch C objects. Both sources
are identical to their verified candidates except for function names; linked
ownership verifies their exact eight- and 22-byte Thumb extents. MPlayMain's
only remaining assembly instructions in 080CFB68..080CFDD0 are the 72-byte
entry/callback/frame/status fragment at 080CFB68..080CFBB0.

The full 16 MiB ROM passes `make compare -j8`. Production verification passes
131,072 setup and 262,144 dispatch cases (393,216 total), including exact flags,
all registers and preserved high registers, ordered conditional reads, stack
aliases and complete RAM. Dispatch rejects nine unsupported contracts and
preserves unannotated compilation. Source/ownership identity ties the matching
candidate bytes to the production C fragments. These checks stop before their
continuation bodies and do not establish complete MPlayMain execution.

The valid full layout links and all 172 altered layouts reject. Eight new
cases cover fragment extents, continuations, the inactive-track branch and
the zero-channel conditional target. Fresh pinned runtime builds reproduce all
four images and exported symbols. Main-ROM ownership is 720,686 C-owned,
33,870 mixed C/assembly, 1,282 assembly-source and 21,792 runtime archive
instruction bytes (777,630 total). Reviewed non-library assembly is 1,692
main-ROM bytes and 420 expanded-payload bytes; source inventory is 558 main C
files and 30 assembly entry markers. SoundMain and copied mixer remain entirely
attributed to C. The 92.68% C-owned mapped-byte figure includes inherited work
and is not an overall completion percentage.

Evidence: `.deps/soundmain-packed/tick-setup/production-build.log`,
`production-check.log`, `dispatch-production-check.log`, `production-identity.json`,
`source.json`, `linked.json`, `layout.log`, and refreshed tracked ownership,
runtime and audio receipts. Production ELF SHA-256:
`84dd527d173b834b34c095064bd1f1fc22d804f0b1c86bec7a6a458245e1d660`.
Next: MPlayMain's remaining entry/callback/frame/status setup.


## September 10, 2026 — Entry status/sound-info/fade candidates

On production baseline `147f2265`, four matching C candidates cover the final
30 bytes of MPlayMain's remaining 72-byte entry region, 080CFB92..080CFBB0.
They reuse existing private-tail, low-copy, high-copy preservation, shared-literal
and direct-callback contracts. No compiler implementation changed.

The first ten-byte fragment copies the player to r7 and performs the signed
status gate; the second status gate at 080CFBA8 is eight bytes. Each passes
41,152 original/candidate executions against independent CMP flags, signed
branch, register and ordered-read expectations. Tests cover both sign halves of
byte patterns, full-width boundaries/random statuses, all incoming NZCV and
four aligned player locations including frame aliases and the RAM boundary.
Both preserve all unrelated registers, stack and memory.

The eight-byte sound-info setup at 080CFB9C uses the fixed shared literal at
080CFDC8 to read 03007FF0, copies the pointer to r8, and prepares r0 from r7
using the original ADDS instruction. All 26,880 original/candidate cases pass
for ordered literal/IWRAM reads, full register/flag state and unchanged IWRAM.
The halfword-aligned object deliberately omits automatic pool alignment;
production integration must assert its actual word-aligned entry, literal
alignment and PC-relative range, as for the existing shared-literal fragments.

The four-byte BL FadeOutBody at 080CFBA4 matches and passes 24,576 call/return
cases. Its synthetic callee at the real Thumb address checks incoming and
returned registers/NZCV, SP/LR and three write aliases near four stack positions.
Fifteen unsupported contracts reject; unannotated output is unchanged. This
checker isolates call mechanics and does not execute FadeOutBody's actual logic.

Total new candidate executions: 133,760. The checkers stop at continuation/exit
entries and do not execute frame restore or complete MPlayMain. Production
ownership remains unchanged; after integration these fragments would leave
42 bytes at 080CFB68..080CFB92 for the lock/callback/frame path. Next: integrate
all four fragments, assert extents/continuations/literal and branch ranges, then
run the full ROM/layout/runtime/ownership gates.

Sources: `research/audio/mplay_entry_status.c`, `mplay_fade_status.c`,
`mplay_sound_info_setup.c`, `mplay_fade_invoke.c`, and the new checkers
`check_mplay_entry_status.py`, `check_mplay_sound_info_setup.py`,
`check_mplay_fade_invoke.py`. Evidence:
`.deps/soundmain-packed/mplay-entry/status-report.json`, `status-check.log`,
`info/report.json`, `info-check.log`, `fade-check.log`, and
`.deps/soundmain-packed/mplay-fade-invoke/report.json`.


## September 10, 2026 — Entry status/sound-info/fade integration

On baseline `1daa6c91`, four matching C fragments now own 080CFB92..080CFBB0:
entry status (ten bytes), sound-info setup (eight), fade invocation (four), and
post-fade status (eight). Each production source is identical to its verified
candidate except for the function name, and linked ownership verifies all four
exact Thumb extents in C-only objects.

The initial link caught two bytes of automatic trailing alignment in the
shortened assembly input section. Its final PUSH is now in a separate two-byte
assembly section, preserving the original address and instruction exactly.
The MPlayMain symbol's assembly extent ends before that section; the linked
inventory still counts both assembly pieces (40+2 bytes). A linker assertion
checks the final push's offset/extent and the next C entry. This is a layout
change, not a claim that the retained push has been decompiled.

The full ROM passes `make compare -j8`. All 133,760 production cases pass:
82,304 across the two status gates, 26,880 sound-info setup cases, and 24,576
fade-call cases. The call checker rejects 15 unsupported contracts and preserves
unannotated output. Shared literal/IWRAM reads, CMP/ADDS flags, registers and
stack aliases agree. The fade test uses a synthetic callee at the real address;
these fragment tests do not execute actual FadeOutBody logic or full MPlayMain.

Fresh pinned runtime builds reproduce all four images and exported symbols.
Ownership is 720,716 C-owned, 33,870 mixed C/assembly, 1,252 assembly-source and
21,792 runtime archive instruction bytes in the main ROM (777,630 total).
Reviewed non-library assembly is 1,662 main-ROM bytes and 420 expanded-payload
bytes; source inventory is 562 main C files and 30 assembly entry markers.
SoundMain and the copied mixer remain entirely attributed to C. The valid full layout
links and all 189 altered layouts reject, including 17 new fragment/retained-push
extent and continuation, status-exit, literal-range/alignment and callee-range
violations.

Evidence: `.deps/soundmain-packed/mplay-entry/production-build.log`,
`production-entry_status.log`, `production-sound_info_setup.log`,
`production-fade_invoke.log`, `production-identity.json`, `source.json`,
`linked.json`, `layout.log`, and refreshed tracked ownership/runtime/audio
receipts. Production ELF SHA-256:
`d988d65e9fa72b83caeef8b61e6c8094d8a7d354ff5cdfad98961e3c6b205170`.
Next: MPlayMain's 42-byte lock/callback/frame path at 080CFB68..080CFB92.


## September 10, 2026 — Lock/callback/frame model and callback candidates

On baseline `7245a2bd`, an independent model now verifies the remaining original
42-byte entry path at 080CFB68..080CFB92. All 86,016 original executions pass:
64,512 lock rejections, 7,168 no-callback entries, 7,168 Thumb-callback entries,
and 7,168 ARM-callback entries. The model checks identifier reads/stores,
callback selection and argument reads, saved input/return words, all eight
low/high-register frame writes, exact SP at each executed entry instruction,
complete registers/CPSR/LR/RAM and ordered memory accesses.

Seven player locations exercise frame overlap; four callback-write locations
include the saved player/return words, identifier and final high-register bank.
Both ARM/Thumb rejection returns, two stacks, every incoming NZCV and four
returned flag patterns are covered. The synthetic callback changes r0-r12 and
executes a real STR/BX sequence. Player placements deliberately avoid callback
pointer fields overwritten by the initial two-word push; arbitrary self-modified
callback targets are not claimed as covered. Tests stop at entry-status setup.

The eight-byte callback setup at 080CFB78..080CFB80 and four-byte invocation at
080CFB80..080CFB84 now have exact matching C candidates using existing direct-tail
and shared-callback compiler contracts. No compiler implementation changed.
With those twelve candidate bytes installed, the full entry/frame model again
passes all 86,016 cases (the 64,512 lock rejections do not enter the new fragments).
The invocation separately passes 49,152 ARM/Thumb call-return cases across all
incoming/returned NZCV pairs, four stacks and three callback-write aliases;
13 unsupported contracts reject and unannotated compilation is unchanged.

The whole-path candidate check compiles setup and requires the invocation
checker artifact to correspond to the current source. Reproduce in order:

```sh
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_entry_callback_invoke.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_lock_callback_frame_model.py --candidate --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
```

Production ownership is unchanged. Integration would leave 30 assembly bytes
across the lock/initial-push and remaining frame setup. Actual user callback
logic and complete MPlayMain execution are outside these synthetic-callback
checks. Next: integrate both fragments with extent/continuation/branch/trampoline
constraints, then full ROM/layout/runtime/ownership gates.

Sources: `research/audio/mplay_entry_callback_setup.c`,
`mplay_entry_callback_invoke.c`, `check_mplay_entry_callback_invoke.py`,
`check_mplay_lock_callback_frame_model.py`. Evidence:
`.deps/soundmain-packed/mplay-entry/lock-callback-frame-model.json`,
`lock-callback-frame-candidate.json`, corresponding logs,
`callback-invoke-check.log`, and
`.deps/soundmain-packed/mplay-entry-callback-invoke/report.json`.


## September 10, 2026 — Entry callback setup/invocation integrated

On baseline `0ee7b16c`, the eight-byte callback setup and four-byte invocation
at 080CFB78..080CFB84 are integrated as matching C. Their source text equals
the verified candidates except for function names, and linked ownership verifies
the exact Thumb extents in C-only objects. The remaining assembly is 16 bytes
of lock/initial push plus 14 bytes of frame setup (30 total). The MPlayMain
assembly symbol ends before the inserted callback C; frame setup retains its
own continuation label and existing two-byte final-push section.

`make compare -j8` passes for the full ROM. The entry/frame model passes all
86,016 cases with candidate bytes and production identity verified: 64,512 lock
rejections (which do not enter the new fragments) and 21,504 accepted entries.
It covers ARM/Thumb callbacks and rejection returns, seven player locations,
four callback-write aliases, two stacks, all incoming NZCV and four returned
flag patterns, exact SP during the entry path and complete ordered RAM/register
state. The invocation separately passes 49,152 cases across all incoming/returned
NZCV pairs; 13 invalid contracts reject and unannotated output is unchanged.
Synthetic callbacks isolate dispatch/frame behavior; these checks do not execute
actual user callback logic or complete MPlayMain.

Fresh pinned runtime builds reproduce all four images and exported symbols.
Main-ROM ownership is 720,728 C-owned, 33,870 mixed C/assembly, 1,240
assembly-source and 21,792 runtime archive instruction bytes (777,630 total).
Reviewed non-library assembly is 1,650 main-ROM bytes and 420 expanded-payload
bytes; source inventory is 564 main C files and 30 assembly entry markers.
SoundMain and the mixer remain entirely attributed to C. The valid full layout
links and all 197 altered layouts reject, including eight new callback extent,
continuation, skip-range and trampoline-range violations.

Evidence: `.deps/soundmain-packed/mplay-entry/callback-production-build.log`,
`callback-invoke-production.log`, `callback-frame-production.log`,
`callback-production-identity.json`, `callback-source.json`, `callback-linked.json`,
`callback-layout.log`, and refreshed tracked ownership/runtime/audio receipts.
Production ELF SHA-256:
`f4780c654800200fc57544601917cebaa56408bc31a0751a3315775e612dfce7`.
Next: remaining MPlayMain lock/initial-push and frame setup.


## September 10, 2026 — Matching saved-entry frame candidate

On production baseline `45feb2fc`, the 14-byte frame setup at
080CFB84..080CFB92 now has a matching C candidate. The source explicitly reads
the saved player, updates SP, stores the low bank, copies r8-r11 to r4-r7, and
stores the high bank. Ordinary compilation introduced an ABI return frame and
scalar stores; a pointer-typed SP probe also generated temporary registers.
The final source uses an integer-bound SP, with no inline assembly templates,
and the new private frame pass proves its exact ordered operations before
selecting POP/PUSH banks and adjacent continuation.

The new four-register PUSH machine pattern models ascending-address stores and
16-byte allocation. The existing POP-word pattern supplies the initial load and
four-byte writeback. The pass strictly validates the 19-operation shape, global
bindings, frameless/no-argument Thumb entry, no debug/unwind, exact bank order,
stack deltas and one declared continuation. The isolated pinned compiler and
new plugin rebuilt successfully.

All 26,880 original/candidate frame executions pass against independent memory,
register and flag expectations: saved-player byte/boundary/bit/random words,
all NZCV and four stack positions including both RAM boundaries. POP reads the
old word before the first PUSH overwrites it; every intermediate SP, ordered
read/write, unchanged flags and remaining registers are checked. Fifteen invalid
source/option contracts reject; unannotated output is unchanged.

The full entry-path model with candidate frame also passes all 86,016 cases:
64,512 lock rejections do not execute the candidate, and 21,504 accepted entries
do. Callback writes may change saved player/return words or overlap future frame
stores. ARM/Thumb callbacks/returns, all incoming flags, four returned flag
patterns, full registers/memory and per-instruction SP agree. Existing exit-frame
regression passes 32,768 cases under the rebuilt compiler (16,384 full returns
and 16,384 shared BX entries). Synthetic callbacks and bounded frame models do
not prove complete MPlayMain execution or physical timing.

Production ownership remains unchanged. Integration would leave the original
16-byte lock/initial-push fragment. Next: integrate the 14-byte frame with exact
extent and continuation constraints, refresh all verification receipts, then
recover the final lock/initial-push entry.

Sources: `research/audio/mplay_entry_frame.c`, `check_mplay_entry_frame.py`,
updated `check_mplay_lock_callback_frame_model.py`,
`tools/arm-dispatch/thumb_saved_entry_frame.cc`, its build helper and `matching.md`.
Evidence: `.deps/soundmain-packed/entry-frame/report.json`, `check.log`,
`chain-check.log`, `return-regression.log`, `backend-build.log`, `plugin-build.log`,
and `.deps/soundmain-packed/mplay-entry/saved-frame-candidate-model.json`.


## September 10, 2026 — Saved-entry frame integrated

On baseline `556fa2cc`, MPlayMain's 14-byte frame setup at
080CFB84..080CFB92 is generated by `src/m4a_mplay_entry_frame.c`. Its source
matches the verified candidate except for the function name; linked ownership
verifies the exact Thumb extent in the C-only object. The former 12-byte frame
assembly and separate two-byte final push are removed, replaced by one C
fragment with exact entry/extent/continuation assertions. The only assembly
instructions left within MPlayMain are the 16-byte lock/initial-push fragment
at 080CFB68..080CFB78.

The full ROM passes `make compare -j8`. All 26,880 direct frame cases pass with
production identity verified, including ordered reads/writes, the saved-player
word overwritten only after POP, exact SP at every instruction and unchanged
flags. Fifteen invalid contracts reject and unannotated output is unchanged.
The entry-path model also passes 86,016 cases with the candidate frame and
production ROM identity verified: 64,512 lock rejections bypass the frame and
21,504 accepted entries exercise it. Synthetic ARM/Thumb callback writes and
frame aliases, full register/memory state and stack transitions agree. Complete
MPlayMain execution and actual callback bodies are not established by these tests.

Fresh pinned runtime builds reproduce all four images and exported symbols.
Ownership is 720,742 C-owned, 33,870 mixed C/assembly, 1,226 assembly-source and
21,792 runtime archive main-ROM instruction bytes (777,630 total). Reviewed
non-library assembly is 1,636 main-ROM bytes and 420 expanded-payload bytes;
source inventory is 565 main C files and 30 assembly entry markers. SoundMain
and the copied mixer remain entirely attributed to C. The valid full layout
links and all 197 altered layouts reject. The former final-push extent and
continuation cases now validate the complete C frame instead.

Evidence: `.deps/soundmain-packed/entry-frame/production-build.log`,
`production-check.log`, `production-chain.log`, `production-identity.json`,
`source.json`, `linked.json`, `layout.log`, and refreshed tracked ownership,
runtime and audio receipts. Production ELF SHA-256:
`52b5ffa68b2a0802b9ba4c4fb482f35cf6fd9b88806701b5aa9a03fb7fe3c319`.
Next: recover the final MPlayMain lock/initial-push entry.

## September 10, 2026 — Final lock fragment model and spill-free probe

On baseline `980e4f1d`, `research/audio/check_mplay_lock_model.py` independently
models the original 16 instruction bytes at 080CFB68..080CFB78. All 32,256 cases
pass: 2,688 accepted identifiers and 29,568 rejections, covering 12 identifier
values, 21 aligned player/stack placements, all 16 incoming NZCV patterns, four
stack positions and both ARM/Thumb rejection return modes. Checks cover r0-r12,
LR, CPSR, SP before every instruction and at exit, all mapped RAM and ordered
memory accesses. The model stops before callback setup, allowing stack writes
over callback fields that the earlier whole-entry model intentionally excludes.
Accepted cases include 128 lock stores overlapping the saved-player slot, 128
overlapping the saved-return slot and 256 cases overwriting callback fields.

Three deliberately wrong 16-byte binaries fail execution/model comparisons:
swapping the final STR and PUSH, replacing PUSH {r0,lr} with PUSH {r1,lr}, and
replacing ADDS r3,#1 with ADDS r3,#2. Candidate-binary mode does not itself prove
C-source or compiler provenance. These are original-ROM behavioral results,
not a newly integrated C match.

`research/audio/mplay_lock.c` records a C research probe. Re-establishing r3 as
ID+1 after storing LR removes the compiler's local spill: ordinary GCC 16.2.0
now emits a zero-local-frame body with a temporary LR copy and redundant literal
reload. The accepted comparison establishes that value, and the original PUSH
preserves it without the copy. Ordinary output still includes an ABI prologue,
epilogue and continuation call, so it cannot replace the original fragment.
Next: validate the exact RTL contract, select the two-word PUSH and early BX LR,
retain the shared literal address, and verify the resulting candidate before
production integration. Production ownership and the last verified ROM build
remain unchanged.

Evidence: `.deps/soundmain-packed/mplay-lock/original-model.json`,
`model-negative-controls.json`, individual negative-control logs and `probe.s`.
Original 16-byte SHA-256:
`93cc001f2c9a8b24736affdb5867f15b5a556c0e158f9c09a099b65fef325d6b`.


## September 10, 2026 — Final MPlayMain lock candidate matches

On baseline `5791e568`, `research/audio/mplay_lock.c` now generates exactly the
original sixteen bytes at 080CFB68..080CFB78. The new `thumb_lock_frame` plugin
validates the complete eighteen-operation/two-tie RTL shape, identifier comparison,
ordered volatile accesses, increment, saved player/LR words and restored lock
value, declared continuation, and compiler prologue/epilogue. A new backend
PUSH {r0,lr} pattern replaces the explicit stack allocation/stores while preserving
r3. The accepted comparison proves the redundant constant reload's value.
The shared identifier load retains its relocation to 080CFDCC. Rejection becomes
BX LR and successful entry falls through after the push. This private convention
requires explicit linker adjacency, extent and literal constraints on integration.

The candidate passes all 32,256 independent lock cases, including saved-word
aliases and callback fields overwritten by the push. All 22 unsupported source
or option contracts reject, and unannotated output is unchanged. The whole-entry
model passes 86,016 cases with the lock candidate substituted: 64,512 rejections
and 7,168 each of no callback, Thumb callback and ARM callback. Complete MPlayMain
and real callback implementations remain outside these tests. The saved-entry
frame plugin was rebuilt against the new backend headers; its 26,880 cases and
15 invalid contracts pass as a regression check.

The first backend rebuild failed with Clang frontend errors while the filesystem
was nearly full. Removing 341,917,588 bytes of older generated runtime images/maps
preserved sources, logs, the newest three runs and the current runtime receipt's
run. The retry completed successfully. Other production plugins must rebuild
against the newly installed compiler headers before the next production build.
No production source or ownership totals changed in this milestone.

Sources: `tools/arm-dispatch/thumb_lock_frame.cc`, its build helper,
`matching.md`, `research/audio/check_mplay_lock.py`, the annotated C candidate
and the extended lock/callback/frame model. Evidence:
`.deps/soundmain-packed/mplay-lock/report.json`, `check.log`, `chain-check.log`,
`frame-regression.log`, `backend-retry.log`, and
`.deps/soundmain-packed/mplay-entry/lock-candidate-entry-model.json`.
Next: integrate the final lock candidate with strict linker assertions, run the
full ROM/runtime and ownership gates, and verify altered layouts reject.


## September 10, 2026 — Final lock integrated; all MPlayMain instructions C-owned

On baseline `c9b50c09`, `src/m4a_mplay_lock.c` replaces MPlayMain's final sixteen
assembly instruction bytes at 080CFB68..080CFB78. Source identity is verified
against the candidate except for the function name. The linker enforces the
entry boundary, sixteen-byte extent, immediate callback-setup continuation and
original identifier literal at entry+612. All production plugins rebuild against
the updated compiler headers through their compiler prerequisites.

`make compare -j8` passes for the full ROM, and fresh pinned runtime builds
reproduce all four images and exported symbols. The lock's 32,256 direct cases
pass with production ROM/source identity verified, 22 unsupported contracts
reject, and unannotated output is unchanged. The 86,016-case entry model also
passes with production identity verified and the candidate lock substituted.
The valid full link passes and all 203 altered layouts reject, including six new
lock extent/continuation/literal cases.

The new `scripts/audit_mplay_region.py` checks continuous coverage and C ownership
of all 602 mapped Thumb instruction bytes from 080CFB68 through 080CFDC2,
including shared call_r3. The fourteen following bytes through 080CFDD0 remain
padding/literals in an assembly data section. The tracked receipt is
`docs/mplay-code-region.json`. This is complete instruction ownership within
this bounded region, not complete executable classification of the game or proof
of every real callback's behavior. SoundMain/mixer ownership remains verified.

Main-ROM mapped ownership is now 720,758 C-owned (92.69%), 33,870 mixed C/assembly,
1,210 assembly-source and 21,792 runtime archive instruction bytes, totaling
777,630. Reviewed non-library assembly is 1,620 main-ROM bytes and 420 expanded
payload bytes. Source inventory is 566 tracked main C files and 29 assembly entry
markers. Totals include inherited community work. Next: `ply_note`, whose 502
mapped instruction bytes remain assembly; runtime helpers, unit-list/startup/
transfer code and final executable classification also remain unfinished.

Evidence: `.deps/soundmain-packed/mplay-lock/production-build.log`,
`production-check.log`, `production-chain.log`, `production-identity.json`,
`source.json`, `linked.json`, `layout.log`, refreshed tracked ownership/runtime/
audio receipts and `docs/mplay-code-region.json`. Production ELF SHA-256:
`fa75006d424318e3af8ec33a88de4b9a56c6e613201c9b52b4d40e2ef4d7326b`.


## September 10, 2026 — ply_note command decoding model and C probe

On baseline `2065262f`, work advances into `ply_note`'s remaining 502 assembly
instruction bytes. Its optional-argument decoder occupies 38 bytes at
080CFE64..080CFE8A. It reads up to three bytes below 0x80, updating key, velocity
and gate time in that order. The command pointer is stored only after consuming
at least one byte; command bytes at or above 0x80 remain for the next handler.
Reads and writes can alias, so later reads must observe earlier track writes.

`research/audio/check_ply_note_command_model.py` passes 338,688 original-ROM
cases: every byte value in each argument position, boundary triples, four gate
seeds, all sixteen incoming NZCV patterns and six stream placements. Placements
include the track's gate/key/velocity and command-pointer fields. Initialization
uses the resulting memory when seeds overlap. Cases consume zero/one/two/three
bytes 56,320/39,936/75,840/166,592 times respectively. Full r0-r12, SP, LR, CPSR,
all mapped RAM and ordered byte/word accesses are checked. Byte-write traces
mask the Unicorn hook value to the actual access width. The model stops before
tone selection and uses mapped EWRAM pointers, not pointer wrap or invalid memory.

`research/audio/ply_note_command.c` produces the original 38-byte layout with
the existing private tail-transfer convention after adding empty pointer ties
at ordered reads. It is not matching yet: GCC emits CMP #127/BHI for all three
unsigned tests, while the original uses CMP #128/BCS. Branch decisions agree,
but CPU flags differ. The candidate model rejects at stream (0,0,128), gate=0,
NZCV=0, disjoint stream 02000800, after consuming two bytes. This is a concrete
flag counterexample, not a byte-only mismatch. Next: validate a compiler
normalization for these local unsigned bounds, rerun the model, then integrate
with exact extent and continuation constraints. Production is unchanged.

Probe compilation uses GCC 16.2.0, -O1, -fno-reorder-blocks, Thumb ARM7TDMI,
apcs-gnu, freestanding and tail_transfer with destination/terminal-adjacent-
destination PlyNoteToneSetup, private-frame64 and acyclic-branches. The candidate
links at 080CFE64 with continuation 080CFE8A. Evidence:
`.deps/soundmain-packed/ply-note/command-original-model.json`, `command-model.log`,
`command-probe-model.log`, `command.s`, `command.elf` and `command.bin`.


## September 10, 2026 — ply_note argument decoder candidate matches

On baseline `113e02c9`, the C candidate for 080CFE64..080CFE8A now matches all
38 original instruction bytes. The new `thumb_unsigned_bounds` compiler plugin
validates the explicit `matching_thumb_unsigned_bounds` contract together with
`matching_tail_transfer`. After shortening, every local conditional must compare
a low register unsigned-greater-than bound-1 to a label; all shapes and the
expected branch count must agree. It selects unsigned-greater-or-equal bound
without changing the edge or instruction length. The private convention selects
CMP bound's flags. For this decoder, bound=128 and expected=3 reproduce the
original CMP #128/BCS sequences; the previous equality-flag counterexample passes.

`research/audio/check_ply_note_command.py` passes all 338,688 independent cases
with exact instruction identity, full registers/CPSR/SP/LR/RAM and ordered memory
accesses. Eleven altered source/option contracts reject, including signed tests,
changed threshold, missing private annotation, wrong/missing count or bound,
duplicates, out-of-range bounds and unknown options. Unannotated output is
unchanged. The existing backend patterns support this comparison, so only the
new plugin was compiled; no backend rebuild was necessary.

This remains a candidate milestone: production still contains the original
502-byte ply_note instruction region and mapped C ownership remains 92.69%.
Next: integrate the 38-byte decoder with exact entry/extent/continuation checks,
run production ROM/runtime and ownership gates, then continue tone selection
and channel allocation. The execution model stops at tone selection and does
not prove complete ply_note behavior.

Sources: `research/audio/ply_note_command.c`, `check_ply_note_command.py`,
`tools/arm-dispatch/thumb_unsigned_bounds.cc` and its build helper. Evidence:
`.deps/soundmain-packed/ply-note/command-report.json`, `command-check.log`,
`command-candidate-model.json`, individual rejection logs and the linked
`command-candidate.elf`/`command-candidate.bin` artifacts.


## September 10, 2026 — ply_note argument decoder integrated

On baseline `a6bd7b4c`, `src/m4a_ply_note_command.c` replaces the 38 assembly
instruction bytes at 080CFE64..080CFE8A. Source identity is verified against the
candidate except for the function name; the linked region is C-owned. Exact
entry+32, extent and continuation constraints preserve the original layout.
The entry's two pool loads now use explicit relocations to the original literals
at 080D003C and 080D0040. Splitting the assembly initially exposed a two-byte
section-alignment shift, which the new continuation assertion rejected. Explicit
original halfword padding before the literal pool fixes the halfword-starting
continuation section without adding input-section alignment.

`make compare -j8` passes. All 338,688 decoder cases pass with production ROM and
source identity verified; eleven invalid source/options reject, and unannotated
output is unchanged. Fresh pinned runtime builds reproduce all four images and
exported symbols. SoundMain/mixer and all 602 MPlayMain instruction bytes retain
verified C ownership. The decoder model stops at tone selection and does not
prove full ply_note behavior.

Mapped main-ROM ownership is 720,796 C-owned (92.69%), 33,870 mixed C/assembly,
1,172 assembly-source and 21,792 runtime archive instruction bytes (777,630 total).
Reviewed non-library assembly is 1,582 main-ROM bytes and 420 expanded-payload
bytes. Inventory is 567 tracked main C files and 29 assembly entry markers.
ply_note now retains 464 assembly instruction bytes: 32 bytes before the decoder
and 432 after it. Totals include inherited community contributions. Next: tone
selection, channel allocation and the remaining setup/frame paths, alongside the
broader outstanding runtime/unit-list/transfer and executable-classification work.

Evidence: `.deps/soundmain-packed/ply-note/command-production-build.log`,
`command-production-check.log`, `command-production-identity.json`, `source.json`,
`linked.json`, `command-layout.log` and refreshed tracked ownership/runtime/audio
receipts. Production ELF SHA-256:
`9d8f8cd0d82ce1c30c11cb6fae9b33676e9dea0fbec728bb23f4d27d9e30e771`.

The valid full layout links and all 207 altered layouts reject, including four
new decoder extent/continuation and entry literal-placement cases.


## September 10, 2026 — ply_note tone model and behavior-verified C probe

On baseline `d35e34fc`, `research/audio/check_ply_note_tone_model.py` models the
86-byte tone-selection path at 080CFE8A..080CFEE0. It covers the initial stack pan
clear, plain/split/rhythm selection, split-table lookup and twelve-byte tone
indexing, invalid nested-tone exit, and rhythm key/pan overrides. Every relevant
arithmetic/logic flag effect is modeled; checks compare final r0-r12/CPSR/SP/LR,
all mapped RAM, SP at every instruction and ordered byte/word accesses.

Both original-ROM code and `research/audio/ply_note_tone.c`'s compiled probe pass
92,160 cases. Inputs span ten parent types, six child types, six pan values, four
keys, all sixteen incoming NZCV and four stack placements. Aliases allow the
initial stack write to overwrite the track key, parent type or selected tone
before its subsequent read. Outcomes are 43,776 plain, 7,680 split, 19,200 rhythm
and 21,504 invalid-child exits, with 5,120 rhythm pan writes. Test data use mapped
synthetic EWRAM tables; checks stop at priority selection or the shared exit
entry, not at a complete ply_note return. The model accepts a linked candidate
binary but does not alone establish source/compiler provenance.

The probe is built using GCC 16.2.0 -O1 -fno-reorder-blocks, Thumb ARM7TDMI,
apcs-gnu, freestanding, and tail_transfer with PlyNotePriority/PlyNoteExit,
private-frame64, acyclic-branches and terminal-adjacent-destination=PlyNotePriority.
It links at 080CFE8A with priority 080CFEE0 and exit 080D002A. Explicit empty
register ties preserve the ordered global-register operations without inserting
instruction templates in the C source. The probe is 86 bytes but is not byte
matching: GCC places the plain and unsplit paths earlier, uses MOVS instead of
ADDS #0 for low-register copies, and reverses low-register TST operand order.
The full-state model passes despite those encoding/layout differences.

Next: validate the required closed-region reordering and canonical encodings,
then require exact original bytes before integration. Production and its 464
remaining ply_note assembly instruction bytes are unchanged. Evidence:
`.deps/soundmain-packed/ply-note/tone-original-model.json`, `tone-model.log`,
`tone-candidate-model.json`, `tone-probe-model.log`, `tone-probe.s`,
`tone-probe.elf` and `tone-probe.bin`.


## September 10, 2026 — ply_note tone candidate matches

On baseline `93ef4b2a`, the 86-byte tone-selection candidate at
080CFE8A..080CFEE0 now matches every original instruction byte. The optional
`thumb_block_layout` tone-selection mode validates the 0xc0/0x40 masked selectors,
permits empty r0-r11 self-ties and requires exactly two branch-arm swaps without
removed jumps. Each swap validates a straight first arm ending at a shared
forward join and a following arm falling into that join. It inverts the selector,
moves the following arm ahead of the first, and moves the existing join jump to
the moved arm's end. Labels and branch destinations remain intact. Existing
low-register ADD #0 and TST operand canonicalization supplies the exact encodings.

The original closed-region transformation moved two regions but required a jump
removal and placed short arms too late. The new explicitly selected diamond swap
preserves all edges and instruction lengths while reproducing the original order.
The default layout mode retains its existing transformation and validation.

`research/audio/check_ply_note_tone.py` requires exact bytes and passes all
92,160 independent cases, including stack/track/selected-tone aliases, full final
registers/CPSR/SP/LR/RAM and ordered memory accesses. Eleven unsupported contracts
reject: altered selector masks, missing private annotation or mode, duplicate or
value-bearing mode, unknown options, debug/unwind, arguments and instruction asm.
Unannotated output is unchanged. The complete existing SoundMain envelope checker
also passes with the rebuilt plugin, including eleven invalid-contract rejections
and unchanged unannotated output. No backend rebuild was required.

This is a candidate milestone. Production still has 464 ply_note assembly
instruction bytes, and main-ROM C ownership remains 92.69%. Next: integrate the
86-byte tone path with exact extent/priority-continuation/exit constraints, run
full ROM/runtime and ownership checks, then continue priority/channel allocation.
The tone model stops before priority selection or at the shared exit entry;
it does not establish full ply_note execution.

Evidence: `.deps/soundmain-packed/ply-note/tone-report.json`, `tone-check.log`,
`tone-candidate-model.json`, `tone-layout-regression.log`, `tone-layout-build.log`
and the linked `tone-candidate.elf`/`tone-candidate.bin` artifacts. Sources:
`research/audio/ply_note_tone.c`, `check_ply_note_tone.py` and the extended
`tools/arm-dispatch/thumb_block_layout.cc`.


## September 10, 2026 — ply_note tone selection integrated

On baseline `c1a351f5`, `src/m4a_ply_note_tone.c` replaces all 86 assembly
instruction bytes at 080CFE8A..080CFEE0. Its source matches the verified candidate
except for the production name PlyNoteToneSetup. Linker assertions enforce the
entry boundary and entry+70 position, exact extent, priority continuation and
original aligned/range-safe early exit at 080D002A. The assembly continuation now
begins at priority selection. Existing command-decoder continuation checks mask
the new Thumb function symbol consistently.

`make compare -j8` passes. All 92,160 tone cases pass with production ROM/source
identity verified; eleven invalid contracts reject and unannotated output is
unchanged. Full r0-r12/CPSR/SP/LR/RAM and ordered accesses agree, including initial
pan-slot writes overlapping track or selected-tone fields. This is bounded tone
selection coverage, not complete ply_note or real instrument-library execution.
The earlier 196,608-case envelope regression verified the compiler layout change;
SoundMain/mixer and MPlayMain C-ownership receipts are refreshed for this ELF.

The first fresh runtime verification passed the main image but failed while
stripping an embedded image with 'No space left on device'. Removing 205,205,064
bytes of older generated runtime images/maps preserved sources, logs, the newest
three runs and the existing receipt's run. The retry passed all four images and
exported symbols. No compiler/source cleanup was performed.

Main-ROM ownership is now 720,882 C-owned (92.70%), 33,870 mixed C/assembly,
1,086 assembly-source and 21,792 runtime archive instruction bytes (777,630 total).
Reviewed non-library assembly is 1,496 main-ROM bytes and 420 payload bytes.
Inventory is 568 tracked main C files and 29 assembly entry markers. ply_note
retains 378 assembly instruction bytes: 32 before its C decoder/tone paths and
346 after them. Totals include inherited community work. Next: priority and
channel allocation, followed by remaining setup/frame and broader outstanding
runtime/unit-list/transfer/classification work.

Evidence: `.deps/soundmain-packed/ply-note/tone-production-build.log`,
`tone-production-check.log`, `tone-production-identity.json`, `tone-source.json`,
`tone-linked.json`, `tone-runtime-retry.log`, `tone-production-layout.log` and
refreshed tracked ownership/runtime/audio receipts. Production ELF SHA-256:
`d0c57ea5cc406ddec3f43f59fdfc15c68b5f9c415296d958587159502c20d93e`.

The valid full layout links and all 212 altered layouts reject, including five
new tone extent/continuation and early-exit placement cases.

During this milestone the user authorized proactive disk cleanup. A further
873,070,337 bytes (833 MiB) were reclaimed by compressing 2,088 old generated
assembly files from `.deps/unitlist-match` and `.deps/unitdef-match`. Every file's
SHA-256 was checked inside the completed archive and again against the original
before removing its loose copy. Archives and manifests are retained under
`.deps/archived-compiler-output`; source code, ROMs, compiler installations and
verification logs were preserved. The filesystem reported 4.7 GiB available
afterward; other concurrent disk changes are not attributed to this cleanup.
Recover individual files from the matching `*-assembly.tar.gz` into the original
directory recorded by `*-manifest.json` before rerunning a historical probe that
expects a loose assembly file. Current production builds use no archived paths.


## September 10, 2026 — Priority clamp/dispatch model and near-matching probe

On baseline `bfacce48`, the thirty bytes at 080CFEE0..080CFEFE save the selected
key, add player and track priority bytes, clamp the result to 255, save it, mask
the tone type with seven, save that channel type and dispatch to PCM at 080CFF30
or CGB at 080CFEFE. The carry flag from CMP priority_sum,#255 survives MOVS/ANDS
and both stack stores. A transfer replacement must preserve that carry.

`research/audio/check_ply_note_priority_model.py` passes 147,456 original-ROM
cases: all 65,536 independent priority pairs with rotating type/flags, plus every
type byte and NZCV combination at five priority boundaries and four stack
placements. Saved-key stores can overwrite player or track priority before its
read; storing clamped priority can overwrite tone type before masking. Checks
cover complete r0-r12/CPSR/SP/LR/RAM, SP at each instruction and ordered accesses.
Outcomes are 19,968 PCM and 127,488 CGB transfers. Effective sums are below/equal/
above 255 in 61,186/16,799/69,471 cases. The model stops at channel-selection entry,
not at allocation or a complete ply_note return; supplied-binary mode does not
establish C/compiler provenance.

A deliberate CMP #254 mutation preserves the saturated numeric result but changes
carry at sum=254. The model rejects it at priorities (0,254), tone type=254,
NZCV=14, disjoint stack. This isolates a flag-only failure that a memory/result
comparison would miss.

`research/audio/ply_note_priority.c` compiles to a 32-byte probe; the first 28
bytes exactly equal the original. The remaining BNE/local skip plus unconditional
PCM transfer must collapse to a direct BEQ while retaining the existing ANDS
flags. The current fallthrough is two bytes past the required CGB continuation,
so this probe is not production-ready or claimed behavior-equivalent. Next:
validate that store/flag-preserving direct transfer, require all thirty original
bytes, run the model against the candidate, then integrate. Production still
retains 378 ply_note assembly instruction bytes and 92.70% C ownership.

Probe flags: GCC 16.2.0 -O1 -fno-reorder-blocks, Thumb ARM7TDMI, apcs-gnu,
freestanding; tail_transfer with PlyNoteCgbSelect/PlyNotePcmSelect,
private-frame64, acyclic-branches and terminal-adjacent-destination=PlyNoteCgbSelect.
Evidence: `.deps/soundmain-packed/ply-note/priority-original-model.json`,
`priority-model.log`, `priority-wrong-carry.log`, `priority-probe-report.json`,
`priority-probe.s`, `priority-probe.elf` and `priority-probe.bin`.


## September 10, 2026 — Priority clamp/dispatch candidate matches

On baseline `7ec45b6a`, the thirty bytes at 080CFEE0..080CFEFE now match the C
candidate exactly. `thumb_and_store_tail` validates a low-register AND, its
adjacent volatile word store to an aligned private SP slot, and a nonzero local
skip over the declared tail. The store and branch must consume the AND result;
the skip label must have one use and no intervening instructions or labels.
Exactly one safe sequence must fold. A new backend pattern models the AND result,
ordered store and zero edge, emitting ANDS/STR/BEQ in six bytes. This replaces
the four-byte skip/unconditional dispatch with the original two-byte BEQ without
inserting a carry-clobbering CMP #0. Integration must enforce the short external
branch's range/alignment and the immediate CGB continuation.

The backend rebuild completed successfully. The dependent tail_transfer,
thumb_unsigned_bounds and thumb_block_layout plugins were rebuilt against its
installed headers, along with the new plugin. All 147,456 priority cases pass,
including full flags and stack/priority/tone aliases. Twelve unsupported source
or option contracts reject: wrong operation/result store, unaligned/out-of-frame
or nonvolatile store, reversed condition, missing private annotation, wrong/
missing/duplicate destination, unknown option and intervening flag-changing code.
Unannotated output is unchanged. Command and tone regressions pass 338,688 and
92,160 cases respectively, including their exact bytes, contract rejections and
production source/ROM identity checks.

This is a candidate milestone; production ownership remains 92.70%, with 378
ply_note assembly instruction bytes outstanding. Other production plugins must
rebuild against the new headers on the next production build. Next: integrate
the thirty-byte priority/dispatch path, verify full ROM/runtime and ownership
checks plus altered layouts, then continue actual channel selection/allocation.
The execution models remain bounded fragments, not complete ply_note execution.

Sources: `research/audio/ply_note_priority.c`, `check_ply_note_priority.py`,
`tools/arm-dispatch/thumb_and_store_tail.cc`, its build helper and `matching.md`.
Evidence: `.deps/soundmain-packed/ply-note/priority-report.json`,
`priority-check.log`, `priority-command-regression.log`,
`priority-tone-regression.log`, `priority-backend-build.log`,
`priority-plugin-build.log` and the linked priority candidate artifacts.


## September 10, 2026 — ply_note priority/clamp/dispatch integrated

On baseline `d9f69051`, `src/m4a_ply_note_priority.c` replaces thirty assembly
instruction bytes at 080CFEE0..080CFEFE. Source identity is verified against the
candidate except for its production name. The linker enforces entry+156,
exact extent, immediate CGB continuation and the original aligned/range-safe PCM
transfer to 080CFF30. The preceding tone continuation assertion consistently
masks the new Thumb function symbol. Production plugins rebuilt against the
updated backend headers through their compiler prerequisites.

`make compare -j8` passes. All 147,456 priority cases pass with production ROM and
source identity verified, including saturation carry and ordered stack aliases.
Twelve unsupported contracts reject, and unannotated output is unchanged. Fresh
pinned runtime builds reproduce all four images and exported symbols. SoundMain,
the copied mixer and all 602 MPlayMain instruction bytes retain verified C
ownership. Checks stop at channel selection and do not prove allocation or full
ply_note execution.

Mapped main-ROM ownership is 720,912 C-owned (92.71%), 33,870 mixed C/assembly,
1,056 assembly-source and 21,792 runtime archive instruction bytes, totaling
777,630. Reviewed non-library assembly is 1,466 main-ROM bytes and 420 payload
bytes. Inventory is 569 tracked main C files and 29 assembly entry markers.
ply_note retains 348 assembly instruction bytes: 32 before the C fragments and
316 after them. Totals include inherited community work. Next: CGB/PCM channel
selection and allocation, then remaining setup/frame paths and broader runtime,
unit-list/transfer and executable-classification work.

Evidence: `.deps/soundmain-packed/ply-note/priority-production-build.log`,
`priority-production-check.log`, `priority-production-identity.json`,
`priority-source.json`, `priority-linked.json`, `priority-runtime.log`,
`priority-production-layout.log` and refreshed tracked ownership/runtime/audio
receipts. Production ELF SHA-256:
`5d8b16bad7c214c1678f28508127869e1f36d74d67124a3704e1e66714945625`.

The valid full layout links and all 217 altered layouts reject, including five
new priority extent/continuation and PCM transfer placement cases.


## September 10, 2026 — CGB channel-selection behavior recovered

On baseline `a3c1845c`, the original 50-byte selection region at
080CFEFE..080CFF30 and the compiler-generated 48-byte C probe each pass
246,480 independent model cases. Coverage includes every byte-priority pair,
all status bytes for channel kinds 1..7 at priority and owner boundaries,
wide unsigned requested priorities and missing-bank entries. Checks cover
final r0–r12, SP, LR, CPSR, unchanged RAM and ordered reads. Execution stops
at channel attach or the shared exit; it does not validate subsequent channel
chain mutation or the whole routine. Bank/track addresses are synthetic.

The probe shares reject/accept branches differently from the original and
uses a different equivalent TST operand order. The ADD encoding already matches. It is not byte matching and has
not been integrated. Production counts and the last full-ROM/runtime receipts
remain unchanged. Next work is compiler branch layout and encoding matching.

Sources: `research/audio/ply_note_cgb_select.c` and
`research/audio/check_ply_note_cgb_model.py`. Evidence:
`.deps/soundmain-packed/ply-note/cgb-original-model.json`,
`cgb-candidate-model.json`, corresponding logs and `cgb-probe.{s,o,elf,bin,ld}`.
The probe uses GCC 16.2.0, Thumb ARM7TDMI, -O1 -fno-reorder-blocks,
APCS GNU, freestanding, and tail_transfer with private-frame64,
acyclic-branches and the declared PlyNoteChannelAttach/PlyNoteExit exits.


## September 10, 2026 — CGB channel-selection candidate matches

On baseline `edcbea6b`, the CGB selection candidate now reproduces all fifty
original instruction bytes. Expressing rejection calls locally and disabling
cross-jumping retains the original reject paths. The opt-in
`matching_thumb_shared_tails` pass bypasses one isolated shared tail stub for
masked EQ/NE tests and low-register unsigned LTU/GEU comparisons. It requires
an explicitly declared destination and exact incoming-edge count; preserved
labels, aliases, fallthrough, unsupported comparisons and unaccounted label
uses prevent rewriting. TST operands are ordered ascending. The original ADD
encoding needs no transformation.

A new `match_thumb_unsigned_reg_tail` backend pattern emits CMP plus the direct
conditional transfer, and records the comparison in GCC's Thumb flag tracking.
The following ordinary equality branch can reuse those flags without emitting
a duplicate CMP. The pattern's clobber attribute invalidates older flag state;
normal subsequent instructions still invalidate the recorded comparison when
appropriate. This is a compiler transformation of C comparisons and declared
control-flow edges; no original instruction bytes are embedded in the C source.

The candidate passes all 246,480 model cases, checking complete final register
and flag state, SP/LR, unchanged memory and ordered reads. Fourteen unsupported
compiler contracts reject, including signed/unsupported comparisons, changed
edges, high-register operands, an unsupported zero-test edge, fallthrough into
the stub, missing private ABI and invalid options. Unannotated output remains
byte identical with the plugin loaded. Rebuilt command, tone and priority
regressions pass 338,688, 92,160 and 147,456 cases respectively, retain exact
candidate bytes and production source identity, and retain their negative
contract checks. These are isolated candidate checks; no fresh production ROM
or runtime build is claimed for this milestone.

Production remains at 720,912 C-owned main-ROM instruction bytes (92.71%) and
348 ply_note assembly instruction bytes. Next is production integration with
full-ROM comparison, fresh runtime reproduction and layout rejection tests.
The CGB model still stops at attach/shared exit; full allocation and full-routine
execution remain outside its verified scope.

Sources: `research/audio/ply_note_cgb_select.c`,
`research/audio/check_ply_note_cgb_select.py`,
`tools/arm-dispatch/thumb_shared_tails.cc`, its build helper and `matching.md`.
Evidence: `.deps/soundmain-packed/ply-note/cgb_select-report.json`,
`cgb-select-check.log`, `cgb-backend-build.log`, `cgb-shared-plugin-build.log`,
`cgb-command-regression.log`, `cgb-tone-regression.log`,
`cgb-priority-regression.log` and `cgb_select-candidate.{o,elf,bin,ld}`.


## September 10, 2026 — CGB channel selection integrated

On baseline `faa3d81d`, `src/m4a_ply_note_cgb_select.c` replaces fifty assembly
instruction bytes at 080CFEFE..080CFF30. Its source matches the verified candidate
except for the production function name. A zero-size assembly boundary anchors
the entry, and the original PCM selection remains the immediate continuation.
The linker requires entry+186, exact extent 50 and attach at entry+320, even and
within the common forward reach of all four conditional transfers. The existing
exact shared-exit placement also bounds the three unconditional reject branches.
The preceding priority assertion masks the new Thumb function symbol.

`make compare -j8` passes. All 246,480 production cases pass, including unsigned
priority and owner-pointer tie handling, complete final registers/flags and
ordered reads. Fourteen unsupported compiler contracts reject and unannotated
output is unchanged. Fresh pinned runtime builds reproduce all four images
and exported symbols. The copied mixer, SoundMain and all 602 MPlayMain mapped
instruction bytes retain their C ownership. These checks stop at channel attach
or shared exit; full allocation and full-routine execution remain unfinished.

Mapped main-ROM ownership is 720,962 C-owned (92.71%), 33,870 mixed C/assembly,
1,006 assembly-source and 21,792 runtime archive instruction bytes, totaling
777,630. Reviewed non-library assembly is 1,416 main-ROM bytes and 420 payload
bytes. Inventory is 570 tracked main C files and 29 assembly entry markers.
ply_note retains 298 assembly instruction bytes: 32 before its C fragments and
266 after them. Totals include inherited community work. Next: PCM channel
selection/allocation and remaining setup/frame paths, followed by broader
runtime, unit-list/transfer and executable-classification work.

Evidence: `.deps/soundmain-packed/ply-note/cgb-production-build.log`,
`cgb-production-check.log`, `cgb-production-identity.json`, `cgb-source.json`,
`cgb-linked.json`, `cgb-runtime.log`, `cgb-production-layout.log` and refreshed
tracked ownership/runtime/audio receipts. Production ELF SHA-256:
`633a5b23609cfa936cbbf16008a0823aabf556e53f0b843771c85003bb151437`.

The valid full layout links and all 222 altered layouts reject, including five
new CGB extent/continuation and attach transfer placement cases.


## September 13, 2026 — PCM selection model and matching setup candidate

On baseline `3b1eca5201f0b746725eeb9602927f8ea3eae877`, the existing PCM
selection model passes 37,369 original-ROM cases: 4,738 free-channel exits,
25,782 selected-channel exits and 6,849 no-channel exits. It covers every
status byte, priority/owner boundaries, representative channel pairs, every
byte loop count (including zero examining one channel), and seeded multi-channel
cases. It checks all general registers, flags, SP/LR, unchanged mapped RAM and
ordered reads through attach/shared exit. Synthetic addresses and the lack of
full allocation/routine execution remain limitations.

`research/audio/ply_note_pcm_setup.c` now generates the exact fourteen original
bytes at 080CFF30..080CFF3E with the existing pinned GCC, private-frame adjacent
tail transfer and Thumb ADD-zero copy support. Empty constraints retain register
allocation; no instruction bytes are embedded in C. The isolated execution
probe joins those fourteen generated bytes to the original seventy-byte loop
and passes the same 37,369 cases. The retained loop is explicitly not C-owned.

`research/audio/check_ply_note_pcm_setup.py` checks exact candidate bytes and
six rejected contracts: missing private frame, undeclared destination, work
after the terminal call, modifying SP, an out-of-bounds frame access, and an
unsupported high-register copy contract. Unannotated output is unchanged when
the copy plugin is loaded. `make compare -j8` passes for the existing production
ROM. No production integration, fresh runtime rebuild or ownership increase
is claimed. Production remains at 720,962/777,630 C-owned mapped main-ROM
instruction bytes and 298 ply_note assembly instruction bytes.

Evidence: `.deps/soundmain-packed/ply-note/pcm-original-model.json`,
`pcm-setup-report.json`, `pcm-setup-check.log`, `pcm-setup-candidate.{c,o,bin,log}`,
`pcm-setup-with-original-loop.bin`, `pcm-candidate-model.json`,
`reject-pcm-setup-*.log` and `pcm-baseline-build.log`. Next: integrate the
setup with layout assertions, fresh runtime reproduction and ownership receipts,
then recover the loop and remaining setup/allocation/frame paths.


## September 13, 2026 — PCM selection setup integrated

On baseline `3b1eca52`, `src/m4a_ply_note_pcm_setup.c` replaces fourteen
assembly instruction bytes at 080CFF30..080CFF3E. The source is identical to
the verified candidate except for the function name. The zero-size assembly
`PlyNotePcmSelect` boundary preserves the preceding priority/CGB contracts.
The linker requires entry+236, extent fourteen and immediate fallthrough into
`PlyNotePcmLoop`. No compiler modification was needed.

`make compare -j8` passes. The production checker verifies source identity,
production object bytes and whole-ROM identity; all 37,369 selection cases
pass with the original seventy-byte loop, six unsupported compiler contracts
reject and unannotated output is unchanged. Fresh pinned runtime libraries
reproduce all four images and their exported symbols. The valid layout links
and all 226 altered layouts reject, including four new setup extent,
continuation and loop-address cases. These checks do not prove full ply_note
execution or independent behavior of its later allocation/callback paths.

Ownership is now 720,976 C-owned, 33,870 mixed C/assembly, 992 assembly-source
and 21,792 runtime-archive main-ROM instruction bytes, totaling 777,630.
Reviewed non-library assembly is 1,402 main-ROM bytes and 420 payload bytes.
There are 571 tracked main C files and 29 assembly entry markers. ply_note
retains 284 assembly instruction bytes. Mixer, SoundMain and all 602 mapped
MPlayMain instruction bytes retain their C ownership. Refreshed runtime,
inline-region, ownership and audio-region receipts agree on production ELF
SHA-256 `cf0c5532e8f6ae55f088bbec001924eb259f62f24399af923e2f781fd299e86b`.

Evidence in `.deps/soundmain-packed/ply-note/`: `pcm-setup-production-build.log`,
`pcm-setup-production-check.log`, `pcm-setup-report.json`,
`pcm-setup-production.bin`, `pcm-setup-runtime.log`,
`pcm-setup-runtime-source.log`, `pcm-setup-production-layout.log`,
`pcm-setup-ownership.log`, `pcm-setup-source.json`, `pcm-setup-linked.json`,
and the mixer/SoundMain/MPlayMain audit logs. Next: recover the seventy-byte
PCM selection loop and remaining allocation/setup/frame paths, then runtime
helpers, unit-list/transfer code and final executable classification.


## September 13, 2026 — PCM channel-choice candidate matches

On baseline `68174573`, `research/audio/ply_note_pcm_choose.c` generates the
exact fifty-eight bytes at 080CFF3E..080CFF78. The initial candidate had correct
operations but different branch layout. Disabling branch-probability guessing
and using a constrained closed-region pass restores the original masked-test,
priority and owner-tie layout. Two redundant target-side comparisons initially
added four bytes; a new proven-incoming-comparison pattern removes them.

The opt-in PCM layout mode requires one 0x40 masked-test arm move, two unsigned
comparison-arm moves, and two eliminated jumps to an immediately following
label. The incoming-flags proof requires a non-preserved label with exactly one
use, no physical fallthrough or aliased entry, an immediate repeated comparison,
and a forward incoming GEU/LEU comparison of the same low-register operands.
Only GTU after GEU and LTU after LEU are supported. Both comparison sites must
pass. The backend retains the C comparison in RTL with a proof marker and emits
the conditional branch; no original instruction bytes are embedded in C.

`check_ply_note_pcm_choose.py` passes exact candidate bytes, all 37,369 complete
selection cases when combined with the original setup/advance bytes, thirteen
rejected compiler contracts, and unannotated object identity. Rejections cover
missing private-frame ABI, undeclared destination, signed or changed owner tests,
changed release mask, high-register operands, intervening operand/flag writes,
changed repeated-comparison operands, another incoming path, mixed modes,
duplicate mode and unknown option. The retained 26 harness bytes are not counted
as candidate C ownership; fourteen already belong to integrated setup C.

The pinned backend rebuild passes. Existing tone-selection checks pass 92,160
cases and eleven invalid contracts, retaining exact bytes and unannotated
identity. SoundMain envelope checks pass 196,608 cases with no register or flag
mismatches and eleven invalid contracts; unannotated output is unchanged.
These regressions cover both existing layout modes. No fresh full-ROM or runtime
build is claimed for this candidate milestone. Production remains at 720,976
C-owned mapped instruction bytes and 284 ply_note assembly bytes. Full selection
allocation, callback behavior and full-routine execution are outside this model.

Sources: `research/audio/ply_note_pcm_choose.c`, its checker,
`tools/arm-dispatch/thumb_block_layout.cc`, `matching.md` and `README.md`.
Evidence in `.deps/soundmain-packed/ply-note/`: `pcm-choose-report.json`,
`pcm-choose-check.log`, `pcm-choose-candidate.{c,o,elf,bin,ld,log}`,
`reject-pcm-choose-*.log`, `pcm-choose-with-original-frame.bin`,
`pcm-candidate-model.json`, `pcm-incoming-backend-build.log`,
`pcm-incoming-backend-build-info.json`, `pcm-layout-build.log`,
`pcm-layout-build-info.json`, `pcm-tone-regression.log` and
`pcm-envelope-regression.log`. Next: integrate with full-ROM, runtime, ownership
and layout verification, then recover the twelve-byte loop advancement and
remaining allocation/setup/frame paths.
