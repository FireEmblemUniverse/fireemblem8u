# Sacred Stones decompilation progress

**Status: active — not yet 100% decompiled.**

Updated: September 10, 2026. Latest verified implementation: 24-byte fractional/channel save and frame restore integration (`34df7638`); full ROM checksum passes. Latest research: source-advance candidate passes 35,200 cases against ROM and copied RAM, but is not instruction-matching.
This file is the standing progress panel; it is updated after meaningful verified
advances, integration results, or changes in the current blocker.

This task builds on existing community work. The starting checkout was
`FireEmblemUniverse/fireemblem8u` at `ecc6798b` (recorded inventory: 358 C files
and 73 assembly entry markers). We later integrated laqieer's data-recovery
fork at `7b47dec8`, including 76 C files, mostly data definitions. Repository
file totals include those inherited contributions. The integrated milestones
below describe replacements and verification performed during this task;
they do not attribute the entire decompilation to this task.

| Meter | Verified progress |
|---|---|
| Full ROM byte match | `████████████████████` **100%** — all 16,777,216 bytes match |
| Overall C decompilation | **Not yet measurable reliably** — complete executable classification remains unfinished |
| Main-ROM instruction ownership | **92.52%** of 777,630 mapped instruction bytes belong to C objects without detected instruction templates; this includes inherited work and is not overall completion |
| Reviewed non-library assembly | **2,922 instruction bytes in main ROM; 420 in expanded payload** — assembly sources plus verified inline sites; runtime archives and classification gaps remain |
| Integrated palette routine | `████████████████████` **52/52 instruction words (100%); full 220-byte section exact** |
| Integrated channel save/frame restore | `████████████████████` **All 24 bytes exact; 245,760 production ROM/copied-RAM cases pass across resampled, save and restore-only entries, including the Thumb transfer** |
| Integrated fixed-rate loop metadata | `████████████████████` **All 16 bytes exact; 67,584 production ROM/copied-RAM cases pass, including conditional frame reads and both exits** |
| Integrated resampling arithmetic | `████████████████████` **All 52 bytes exact; 143,360 production ROM/copied-RAM cases pass across both entries and fractional-wrap boundaries** |
| Integrated partial-word completion | `████████████████████` **All 36 bytes exact; 61,440 production ROM/copied-RAM cases pass, including zero rotation and overlapping state/output** |
| Integrated short-sample block | `████████████████████` **All 44 bytes exact; 184,320 production ROM/copied-RAM cases pass across both entries and four packed lanes** |
| Integrated packed stereo-word block | `████████████████████` **All 68 bytes exact; 36,864 production ROM/copied-RAM cases pass, including repeated words, counter boundaries, ordered accesses and aliases** |
| Integrated reverb block | `████████████████████` **All 84 bytes exact; 13,584 production ROM/copied-RAM cases pass** |
| Integrated audio byte-load entry | `████████████████████` **Both bytes exact; 49,152 production cases pass** |
| Integrated multiply-high ARM body | `████████████████████` **All 12 ARM bytes exact; 41,984 production cases pass; Thumb entry remains assembly** |
| Integrated audio address filter | `████████████████████` **All 22 bytes exact; 206,592 production execution cases pass** |
| Integrated checked audio reader | `████████████████████` **Complete 12-byte section exact; 180,224 production execution cases pass** |
| Integrated audio buffer clear | `████████████████████` **Complete 24-byte section exact; 3,072 production execution cases pass** |
| Integrated audio jump-table copy | `████████████████████` **Complete 24-byte section exact; 3,072 production execution cases pass** |
| Integrated LFO / modulation commands | `████████████████████` **Both 18-byte bodies exact; 99,072 production execution cases pass** |
| Integrated repeat command | `████████████████████` **Complete 48-byte section exact; 264,704 production execution cases pass** |
| Integrated pattern call | `████████████████████` **Complete 28-byte section exact; 49,152 production execution cases pass** |
| Integrated sequence jump | `████████████████████` **All 32 bytes exact; 32,832 production execution cases pass** |
| Integrated voice selection | `████████████████████` **Complete 48-byte section exact; 24,960 production execution cases pass** |
| Integrated modulation type | `████████████████████` **All 24 bytes exact; 66,048 production execution cases pass** |
| Integrated port command | `████████████████████` **All 24 bytes exact; 132,352 production execution cases pass** |
| Integrated tempo | `████████████████████` **All 20 bytes exact; 24,768 production execution cases pass** |
| Integrated pan / bend / tuning | `████████████████████` **Three 20-byte bodies exact; 49,536 production execution cases pass** |
| Integrated key shift / volume / bend range | `████████████████████` **Three 18-byte bodies exact; 49,536 production execution cases pass** |
| Integrated priority / LFO delay | `████████████████████` **Both ten-byte bodies exact; 4,128 production execution cases pass** |
| Integrated audio VSync/DMA | `████████████████████` **All 76 bytes exact; 2,304 production execution cases pass** |
| Integrated stereo channel volume | `████████████████████` **All 48 bytes exact; 4,032 production execution cases pass** |
| Integrated tied-note release | `████████████████████` **All 64 bytes exact; full ROM verified** |
| Integrated audio track stop | `████████████████████` **Complete 68-byte section exact; full ROM verified** |
| Integrated audio byte reader | `████████████████████` **All 10 bytes exact; 32,768 original/production execution cases pass** |
| Integrated map flood dispatcher | `████████████████████` **107/107 instruction words; complete 464-byte section exact; full ROM verified** |
| Integrated map flood helper | `████████████████████` **51/51 instruction words (100%); full 224-byte section exact** |
| Integrated object-list high entry | `████████████████████` **39/39 instruction words (100%); full 160-byte section exact** |
| Integrated string decoder | `████████████████████` **35/35 instruction words (100%); full 148-byte section exact** |
| Half-stride glyph routine | `████████████████████` **All 188 instruction bytes exact; shares the original pointer pool** |
| Glyph drawing routine | `████████████████████` **All 188 instruction bytes exact; shift table and pointer also generated from C** |
| Tilemap fill routine | `████████████████████` **All 56 bytes exact in main and three payload versions** |
| Tilemap copy routine | `████████████████████` **All 92 bytes exact in main and three payload versions** |
| Embedded object-list high entry | `████████████████████` **Exact in all three payload versions; low-entry shim remains assembly** |
| Embedded palette routine | `████████████████████` **Exact in all three payload versions** |

The function percentages describe these routines only. All replacements listed above are in the production build.
An exact ROM build can still contain assembly; its 100% meter is not C coverage.

## Working on now

**Working on: remaining audio handlers, ARM shims, unit-list fallback and transfer code.**
Next milestone: match the resampling source-advance block, then continue mixer
frame and channel-control integration. Runtime C rebuild/syscall verification remains open.
The SoundMain setup arithmetic model passes 21,504 cases against the original
entry, covering deadlines, all DMA counters/VCOUNT values, wrapped buffer
selection, stable callback order, lock update and the 64-byte mixer frame.
The entry model additionally passes 600 callback-mutation cases and 1,800
locked/invalid-entry cases. It retains the initial SoundInfo pointer, computes
the deadline before callbacks and uses updated buffer fields after callbacks.
A further 6,912 original-entry/mixer-return cases verify all saved frame words,
stereo clearing without reverb, lock release and r4-r11 restoration in both
return modes. The typed 64-byte frame layout compiles with offset/size checks.
The 84-byte reverb block is now integrated in `src/m4a_reverb.c`, including the
original ARM-to-Thumb transfer. All 13,584 production/original comparisons pass
(6,792 from ROM and 6,792 after copying the mixer to RAM), with identical memory,
ordered accesses, r0-r12, LR, flags/mode and untouched stack. The full ROM matches.
The compiler's PC-address rule passes 96 execution cases, six compiler rejection
cases and twelve link-contract rejection cases. The byte-load and subtraction
rules pass 8,192 and 33,152 standalone checks. The setup/frame models above are
still research; the full SoundMain entry and remaining mixer are unfinished.
The channel-preparation C model passes 31,232 comparisons through the sample-
mixing boundary: 9,819 skipped/stopped channels, 13,739 ready-to-mix channels and
7,674 deadline exits. It covers all status and VCOUNT bytes, envelope boundaries,
loop metadata and complete channel/frame updates. This is research, not yet a
matching replacement for the channel loop or sample mixer.
The fixed-rate sample-mixing model passes 10,080 original/C comparisons,
including short samples, repeated loops, packed-word overflow and final partial
words. It reproduces full sound memory and private frame effects; 944 cases
stop and 9,136 continue. The resampling model also passes 6,912 comparisons
covering fractional wrap, interpolation and multiple loop crossings (1,066 stop,
5,846 continue). Both sample paths still need matching code generation and
integration; their semantic checks do not add production coverage.
The composed SoundMain C model passes 3,528 complete original/C calls with active
channels: 3,456 valid entries (including 1,728 forced deadline exits) and 72
rejected entries. Full sound memory, callback/VCOUNT traces, global-pointer
mutations, preserved registers, SP and both return modes agree. This establishes
semantic composition; the original private frame and matching instruction
sequence remain unfinished, so production coverage is unchanged.
The 68-byte packed stereo-word block is integrated as `src/m4a_packed.c`,
including word loads/stores and the outer sample-count decrement/repeat branch.
It adds the short-sample remainder and branches to channel saving when complete,
otherwise falling through to the short-sample C block.
All 36,864 production/original checks pass across ROM and copied RAM, including
source/output overlap, 15 counter values (up to 528 samples and signed-overflow
boundaries), ordered accesses, registers, flags and stack canaries. The full production
SoundMain also passes the 3,528 complete-call suite. The continuation rule passes
160 executions, eleven compiler rejection cases and two link rejection cases.
The addition-carry rule passes 116,032 standalone checks.
The short-sample word loads and one-sample arithmetic are now integrated as
`src/m4a_short.c` (44 bytes), including the source-count decrement and end branch. Both the word-load entry and shared sample entry
pass 184,320 production/original comparisons across ROM and copied RAM; source
aliases, all signed bytes, four packed lanes, ordered accesses, registers,
subtraction flags, selected exit and untouched memory/stack agree. Full ROM matching and the
3,528 complete-call regression pass. Source inventory is now 478 C files,
32 assembly entry markers and six manual assembly function declarations.
The partial-word completion shared by fixed-rate and resampled paths is now
integrated as `src/m4a_partial.c` (36 bytes). Its 61,440 ROM/copied-RAM checks
verify all four lanes (including zero rotation), status-byte truncation,
channel/output aliases, ordered writes and expected full memory/register state.
The word-store writeback rule passes 37,056 standalone comparisons and rejects
nine unsupported patterns. Full ROM matching and 3,528 complete-call checks pass.
The resampling word loads and interpolation/stereo arithmetic are integrated
as `src/m4a_resample.c` (52 bytes), including the fractional-position update
and flag-setting shift/conditional continuation. Both entries pass 143,360 ROM/copied-RAM
checks covering signed samples, difference/fraction boundaries and overflow,
four packed lanes and independently calculated register/memory effects.
The explicit read-only LR continuation contract passes 13,056 executions and
nine rejection cases; accumulator mode adds another 13,056 passing executions
and nine rejection cases. The original continuation guards still pass. The
production checks verify wrapped LR output across step boundaries, including
exact wrap to zero. Full ROM matching and the 3,528 complete-call regression
pass. The production cases now include 101,540 advance-path and 41,820
no-advance-path exits across ROM/RAM, checking complete shift flags and branch
destinations. The conditional-continuation compiler rule passes 13,632 standalone
executions, eleven compiler rejections and three linker rejections. Source
advancement and sample-loop transitions remain assembly.
The short path's packed-lane control and remaining resampling control are still assembly.
The latest countdown checks cover ten short-source counts, including zero and
signed-overflow boundaries (18,440 end exits across ROM/RAM), and all 135 selected
packed counter/remainder pairs (3,288 channel-save exits). They verify complete
addition/subtraction flags and the exact exit PC. The existing conditional rule
handles both paths without further compiler changes. Full ROM matching and
3,528 complete-call checks pass. Fixed-rate loop metadata is now integrated
as `src/m4a_loop.c` (16 bytes): 67,584 ROM/copied-RAM cases verify conditional
frame reads, both exits, comparison flags, all registers and an untouched frame.
The read-only frame compiler contract passes 55,296 cases, retains the second
comparison when its input changes, and rejects eight invalid forms. The shared
64-byte frame definition now lives in `include/gba/m4a_mixer_frame.h` with
loop-field offset checks; research uses the same header. Resampling loop metadata
handling and source advancement remain assembly.
A source-advance C candidate now passes 35,200 cases against both original ROM
and copied RAM: signed subtraction-overflow boundaries, one/multiple-sample
advancement, signed byte reads and ordered memory accesses. All r0-r12 and live LR now match at both private exits. Checks independently
validate the original and candidate frame/flags, including the candidate's
remaining extra LR save; candidate flags now match the original. The candidate now emits 56 bytes (down from 84) versus the original
32 and is not integrated; compiler frame, scratch registers, flags and terminal
calls still differ. Register-subtraction flag reuse now passes 91,168 standalone execution cases
and six rejection cases; the existing immediate rule passes 33,152 cases.
Signed-byte preincrement folding now passes 102,400 baseline/folded cases and
eight rejection cases, including conditional loads and backward offsets.
The decrement now stays in r9 and preserves r12. The equality-only flag fold
passes 16,576 baseline/folded cases and eight rejection cases, emitting the
original SUBS. Matching still needs the private frame and continuation contract.
Fractional-position and channel ct/cp saving, sample-count restoration and the
ARM-to-Thumb transfer are integrated as `src/m4a_save_channel.c` (24 bytes).
All three entries pass 245,760 ROM/copied-RAM checks, including channel/frame
overlap, ordered stores/load, all registers, unchanged SP/LR/NZCV and the exact
Thumb destination/mode. Full ROM matching and 3,528 complete audio calls pass.
The explicit indirect-tail frame contract removes only the validated compiler
LR save/restore, preserving incoming fractional LR and private-frame coordinates.
Its standalone checks pass 27,648 executions and reject 14 invalid forms;
unannotated output is unchanged. The earlier research candidate is now integrated.
The [runtime inventory](docs/runtime-source-inventory.md) identifies every linked
archive member's candidate source at the pinned agbcc revision. Six assembly
helpers rebuild exactly and contribute 726 instruction bytes in each image.
The other 21,066 main-ROM and 94 payload runtime bytes have located C sources,
not yet verified matching rebuilds; syscalls.c contains additional inline assembly.
All eight detected instruction-bearing inline sites now have source/symbol/byte
checks. They contribute 410 main-ROM instruction bytes and two payload bytes.
The unit-list fallback accounts for 396 of those main-ROM bytes, plus 40 bytes
of literals/alignment. Combined with assembly sources, reviewed non-library
assembly totals 2,922 main-ROM bytes and 420 expanded-payload bytes. This is
still not a complete whole-ROM C percentage.
The [size-weighted inventory](docs/code-ownership.md) is now reproducible from
current ELF/map files. Main-ROM mapped instructions total 777,630 bytes:
719,456 C-owned, 33,870 in C objects containing assembly, 2,512 in assembly
sources, and 21,792 in runtime archives. Mixed-object sizes are not remaining
assembly sizes. The expanded payload is measured separately: 25,716 mapped
instruction bytes, including 418 in assembly sources. The 200-byte transfer
bootstrap is already included in the main assembly total, not counted twice.
The interworking-entry C probe passes 20,992 result/preserved-register cases,
but uses 24 bytes including a veneer versus four original entry bytes and
changes r1. It remains research-only; production is unchanged.
The byte-load entry is integrated as C: its two bytes match exactly, and the
linker requires the filter to follow immediately. All 49,152 production cases
and 32,832 sequence-jump caller cases pass. Full ROM comparison passes.
The multiply-high ARM body is integrated as C: all 12 bytes match. Its 41,984
production cases pass through both ARM and original Thumb entries, preserving
r0-r12, flags, SP and both return modes. The full ROM checksum passes.
The two-instruction Thumb entry remains assembly and is still in scope.
The shared address filter is integrated as C: all 22 instruction bytes match
at 080CF972, with the shared literal retained at 080CF988. The complete ROM
checksum passes, and 206,592 production filter cases pass, including flags,
registers and stack canaries. Checked-reader and jump-table caller checks also
exercise the integrated filter. The linked audit has no orphan mappings.
The checked byte reader is integrated: all 12 section bytes match and 180,224
production cases pass across both entry points, pointer aliases, low-address
rejection, all byte values and NZCV states, and ARM/Thumb returns. Its alternate
entry remains at 080CF98E. Full ROM comparison passes.
The 64-byte audio clear is integrated as C. Its 22 instruction bytes and two
padding bytes match, and all 3,072 production execution cases agree on memory,
canaries, r0-r12, SP, return mode and flags. The installed grouped-store pass
rejects six unsupported sequences and leaves unannotated output unchanged.
The complete ROM checksum passes; the linked audit has no orphan mappings.
The jump-table copy is integrated as C. All 22 instruction bytes and two zero
padding bytes match. Its 3,072 production cases verify data, canaries, r0-r12,
flags and ARM/Thumb returns. The installed countdown passes 320 standalone
executions and rejects eight unsupported loops. The shared literal has an
explicit linker range check, and the complete ROM checksum passes.
LFO speed and modulation commands are integrated as C. Both 18-byte bodies
match; 99,072 production cases verify zero-byte resets, three modulation types,
track flags, unchecked low reads, pointer aliases and all r0-r12/return flags.
The installed private-return contract passes 128 cases and rejects 23 unsupported
forms. The complete ROM checksum passes.
Repeat handling is integrated as C. All 46 instruction bytes and two padding
bytes match. Its 264,704 production cases include 66,950 shared-entry jumps and
197,754 local completions, with no SP/LR, memory, register or flag differences.
Ten unsupported compiler contracts are rejected. The full ROM checksum passes.
Pattern handling is integrated as C. Its 26 instruction bytes and two padding
bytes match. All 49,152 production cases agree on track/channel RAM, r0-r12,
flags, final return state and callee-entry SP/LR. Eleven unsupported compiler
contracts are rejected; branch-range checks pass. The full ROM checksum passes.
The sequence jump is integrated as C. All 32 bytes match; 32,832 production
cases verify every value in each pointer byte, rejected low-byte reads,
command-pointer aliases, public/shared-stack entries and ARM/Thumb returns.
All RAM, r0-r12, flags and SP agree. The full ROM checksum passes.
Voice selection is integrated as C. All 46 instruction bytes and two padding
bytes match. The 24,960 production cases verify every voice index, rejected
sources, four overlapping copies and command-pointer aliases, including full
RAM, r0-r12, flags, SP and return PC. The full ROM checksum passes.
Modulation type is integrated as C. All 24 bytes match; 66,048 production cases
verify changed/unchanged types, rejected reads, pointer aliases, flags and all
r0-r12. The full ROM checksum passes. The installed private-return contract
passes 128 executions and rejects 22 unsupported configurations.
The port handler is integrated as C: all 24 bytes, including its literal pool,
match. All 132,352 production cases pass for normal/rejected reads, five pointer
aliases, ordered byte writes, r0-r12 and flags. The full ROM checksum passes.
Tempo regression passes 24,768 cases; the installed private-return contract
passes 128 cases and rejects 19 unsupported configurations.
Tempo is integrated as C. All 20 original bytes match; 24,768 production
execution cases verify tempo arithmetic, rejected reads, pointer aliases,
registers and flags. The full ROM checksum passes. The updated private-return
contract passes 128 two-call executions and rejects 19 unsupported contracts;
all 99,072 existing flag-setter regression cases also pass.
Pan, bend and tuning are integrated as C, including their subtraction of 64
and byte wraparound. All 60 instruction bytes match, and their 49,536 production
cases agree on memory, r0-r12 and return flags. The combined six-handler suite
passes 99,072 cases and the full ROM checksum passes.
Key shift, volume and bend range are now integrated as C, with all 54 instruction
bytes exact. Their 49,536 production/original cases include every command byte,
eight initial track-flag patterns, rejected reads and command-pointer aliases;
all memory, r0-r12 and return flags agree. The full ROM checksum passes.
Priority and LFO-delay setters are integrated as C. Both ten-byte bodies match;
all 4,128 production/original cases agree on memory, flags and r0-r12, including
rejected reads and command-pointer aliases. `make compare -j8` passes for the
complete ROM. Their installed private-return compiler contract passes 128
two-call executions with ARM/Thumb return modes and rejects nineteen unsupported
configurations. The source inventory now has 473 C files and 32 assembly entries.
VSync/DMA handling is integrated: the complete 76-byte C section matches,
including shared literal loads, every instruction, zero padding and local data.
All 2,304 production/original cases pass for ordered counter and DMA accesses,
memory, r0-r12 and return flags. `make compare -j8` verifies the complete ROM.
The installed compiler's bounded counter tests pass 65,664 executions; six
unsupported patterns remain unchanged. Shared-only literal pools pass 224
execution cases, and eight invalid plugin configurations are rejected.
Another 4,096 standalone
bit-test executions pass across bit positions, branch senses and short/long/far
branch distances, including saved return-address checks. Large leaf-function
far-branch probes trigger a baseline GCC internal error; such large leaf functions remain unsupported. The production VSync branches
are short and pass the matching checks. A standalone
Thumb literal probe passes 192 execution cases; explicit link assertions reject
12 offsets that the linker otherwise silently wraps.

The tied-note release handler is integrated: all 64 Thumb bytes match.
Its 768 production-ROM execution cases verify all r0-r12 values, preserved
registers, stack, RAM and final flags. The installed compiler passes 5,760
standalone frame/rewrite executions; five invalid contracts are rejected.

TrackStop is integrated: its entire 68-byte section matches, and all 768
original/C cases pass. A fresh pinned compiler build passes 14,336 standalone
baseline/folded executions; signed comparisons and asm barriers stay unchanged.

The map-flood dispatcher is now integrated. Its complete 464-byte section at
`0x08000850` matches: 452 ARM instruction bytes (including the duplicate branch
prefix) and 12 pointer bytes. All 880 dispatcher execution cases and 2,560
prefix-table cases pass. The complete 16 MiB ROM passes `make compare -j8`.
The linked audit attributes the entire region to `src/arm/map_flood_core.o`.

The isolated pinned GCC backend and compiler passes now live in
`tools/arm-dispatch/`; the Makefile builds them when needed and applies them only
to the dispatcher. The C source uses the project's queue/state structures.
The audio command-byte reader is also integrated: all 10 Thumb bytes match,
including its private r3 result convention. All 32,768 original/production
execution cases pass, including command-pointer aliasing.
The stereo channel-volume helper is also integrated: all 48 bytes and 4,032
original/production execution cases match, including saturation and private ABI.
Main source inventory is now 473 C files and 32 assembly entry markers.

Latest integrated milestone:
PutOamHi and its pointer pool are integrated as matching C in the main ROM
and all three embedded payload versions. The existing
three-instruction PutOamLo shim branches into the shared C-generated body at
its original address. Each entry passes 1,280 execution cases with matching
memory, cursor, registers and flags. The full ROM checksum passes. PutOamLo's
shim remains assembly and is still counted as unfinished work.

Latest integrated milestone:
DecodeString is now integrated as matching C. All 640 valid-tree cases pass,
including output, consumed input, registers, write boundaries and return flags.
Its entire 148-byte pool/function section matches, and `make compare -j8`
verifies the complete production ROM. The linked audit attributes its 140 ARM
instruction bytes and eight pointer bytes to the new C object, with no orphan
mapping symbols.

Latest checks: 65,536 palette component/step pairs; 80 map flood cases with no
return-flag differences; 18,816 compiler-plugin execution probes; 30 relocated prefix-pool probes in both pointer orders, including cross-function
sharing under forced compiler garbage collection. Invalid manifests, Thumb
placement, and cross-section sharing are rejected. All checks passed.

The embedded compiler installer is repaired: pinned source, serial generator
builds, propagated failures, and staged installation. A fresh compiler installation
and fresh objects for all three payload versions passed their checksum gates.

## Completed milestones

- [x] Verify the supplied USA ROM and reproduce the entire ROM exactly.
- [x] Remove direct baserom includes from tracked source.
- [x] Build and verify all three embedded payload variants; preserve local source changes reproducibly.
- [x] Replace main ClearOam, Checksum32, TmApplyTsa and their embedded counterparts with matching C.
- [x] Replace audio RealClearChain, ply_pend, ply_fine and clear_modM with matching C.
- [x] Recover matching C for GetUnitDefinitionFormEventScr, Event1B_TEXTSHOW and DisplayEventMapAnim.
- [x] Integrate the exact 220-byte main palette pool/function C replacement.
- [x] Repair and verify fresh embedded compiler setup.
- [x] Integrate the exact 224-byte map flood pool/helper C replacement.
- [x] Replace embedded ColorFadeTick with matching C in all three payload versions.
- [x] Replace main and embedded TmCopyRect with matching C.
- [x] Replace main and embedded TmFillRect with matching C.
- [x] Replace DrawGlyph and its shift table with matching C.
- [x] Replace DrawGlyphHalfStride with matching C and preserve its shared pool.
- [x] Replace DecodeString and its pointer pool with matching C.
- [x] Integrate PutOamHi and its shared drawing body as matching C.
- [x] Replace embedded PutOamHi with matching C in all three payload versions.
- [x] Integrate the complete matching map-flood dispatcher and compiler-generated prefix.
- [x] Replace the internal audio command-byte reader with matching C.
- [x] Replace TrackStop with matching C and validate live AND/zero compiler folding.
- [x] Replace the tied-note release handler with matching C and validate its Thumb leaf frame.
- [x] Replace stereo channel-volume calculation with matching C.
- [ ] Replace remaining recoverable assembly, including the unit-list fallback, ARM, audio and transfer code.
- [ ] Complete executable coverage accounting, including embedded code and hardware interfaces.
- [ ] Run and document the final complete decompilation verification.

## Remaining inventory

| Scope | Latest source audit |
|---|---|
| Main program | 32 assembly entry markers; 1 naked-function marker; 7 instruction-bearing inline assembly templates |
| Embedded payload | 16 assembly function declarations; 1 instruction-bearing inline assembly template |
| Additional identified code | 200 ARM instruction bytes in the transfer wrapper's data section |

These are source markers, not counts of independent unfinished functions. Empty
compiler constraints and register bindings are not counted as assembly instructions.
No overall percentage or completion date is inferred from these counts.

The immediate goal is the original GBA decompilation. The root blueprint's native
LÖVE/Lua engine and mod platform are separate work and are not counted as delivered.

Detailed evidence and history: [decomp-completion.md](docs/decomp-completion.md).
