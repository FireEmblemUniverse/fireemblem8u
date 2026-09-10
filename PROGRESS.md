# Sacred Stones decompilation progress

**Status: active — not yet 100% decompiled.**

Updated: September 9, 2026. Latest verified production implementation: stereo channel-volume integration (`70290e0c`); full ROM checksum passes. Latest research milestone: complete VSync candidate match (baseline `e60c244d` plus this change).
This file is the standing progress panel; it is updated after meaningful verified
advances, integration results, or changes in the current blocker.

| Meter | Verified progress |
|---|---|
| Full ROM byte match | `████████████████████` **100%** — all 16,777,216 bytes match |
| Overall C decompilation | **Not yet measurable reliably** — complete executable classification remains unfinished |
| Integrated palette routine | `████████████████████` **52/52 instruction words (100%); full 220-byte section exact** |
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
Next milestone: match and integrate the audio VSync/DMA handler.
Its complete 76-byte C candidate now matches the original section exactly, including
shared literal loads, every instruction, zero padding and local literal data.
All 2,304 original/C cases pass, checking ordered counter and DMA accesses,
memory, r0-r12 and return flags. The bounded counter transformation passes
65,664 baseline/plugin executions; six unsupported patterns remain unchanged.
Next: promote the reproducible compiler support, integrate the C object and verify
the complete ROM. This candidate is still research, not a production replacement.
Another 4,096 standalone
bit-test executions pass across bit positions, branch senses and short/long/far
branch distances, including saved return-address checks. Large leaf-function
far-branch probes trigger a baseline GCC internal error; this remains a compiler
limitation to resolve or reject explicitly before promoting the extension. A standalone
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
Main source inventory is now 454 C files and 53 assembly entry markers.

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
| Main program | 53 assembly entry markers; 1 naked-function marker; 7 instruction-bearing inline assembly templates |
| Embedded payload | 16 assembly function declarations; 1 instruction-bearing inline assembly template |
| Additional identified code | 200 ARM instruction bytes in the transfer wrapper's data section |

These are source markers, not counts of independent unfinished functions. Empty
compiler constraints and register bindings are not counted as assembly instructions.
No overall percentage or completion date is inferred from these counts.

The immediate goal is the original GBA decompilation. The root blueprint's native
LÖVE/Lua engine and mod platform are separate work and are not counted as delivered.

Detailed evidence and history: [decomp-completion.md](docs/decomp-completion.md).
