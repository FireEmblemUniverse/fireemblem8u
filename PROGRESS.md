# Sacred Stones decompilation progress

**Status: active — not yet 100% decompiled.**

Updated: September 9, 2026. Latest verified implementation: jump-table integration (baseline `51d4ccb4` plus this change); full ROM checksum passes.
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
| Integrated palette routine | `████████████████████` **52/52 instruction words (100%); full 220-byte section exact** |
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
Next milestone: continue the remaining audio engine and assembly interfaces.
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
configurations. The source inventory now has 466 C files and 34 assembly entries.
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
Main source inventory is now 466 C files and 34 assembly entry markers.

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
| Main program | 34 assembly entry markers; 1 naked-function marker; 7 instruction-bearing inline assembly templates |
| Embedded payload | 16 assembly function declarations; 1 instruction-bearing inline assembly template |
| Additional identified code | 200 ARM instruction bytes in the transfer wrapper's data section |

These are source markers, not counts of independent unfinished functions. Empty
compiler constraints and register bindings are not counted as assembly instructions.
No overall percentage or completion date is inferred from these counts.

The immediate goal is the original GBA decompilation. The root blueprint's native
LÖVE/Lua engine and mod platform are separate work and are not counted as delivered.

Detailed evidence and history: [decomp-completion.md](docs/decomp-completion.md).
