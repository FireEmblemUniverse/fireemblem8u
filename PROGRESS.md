# Sacred Stones decompilation progress

**Status: active — not yet 100% decompiled.**

Updated: September 9, 2026. Latest verified implementation: integrated main and embedded TmCopyRect (this change).
This file is the standing progress panel; it is updated after meaningful verified
advances, integration results, or changes in the current blocker.

| Meter | Verified progress |
|---|---|
| Full ROM byte match | `████████████████████` **100%** — all 16,777,216 bytes match |
| Overall C decompilation | **Not yet measurable reliably** — complete executable classification remains unfinished |
| Integrated palette routine | `████████████████████` **52/52 instruction words (100%); full 220-byte section exact** |
| Integrated map flood helper | `████████████████████` **51/51 instruction words (100%); full 224-byte section exact** |
| Tilemap copy routine | `████████████████████` **All 92 bytes exact in main and three payload versions** |
| Embedded palette routine | `████████████████████` **Exact in all three payload versions** |

The function percentages describe these routines only. Both main routines and
the embedded palette replacement are integrated into the production build.
An exact ROM build can still contain assembly; its 100% meter is not C coverage.

## Working on now

**Next: TmFillRect and the remaining ARM routines.**
TmCopyRect now compiles from C in the main game and all three payload versions.
Its 2,560 execution cases cover nonpositive dimensions, overlapping buffers,
registers, write boundaries, and all incoming flags. TmFillRect still has two
MOV-versus-SUB-zero instruction differences. The full ROM remains exact.

Latest checks: 65,536 palette component/step pairs; 80 map flood cases with no
return-flag differences; 18,816 compiler-plugin execution probes; 10 relocated prefix-pool probes in both
pointer orders and four invalid-manifest rejection checks. All passed.

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
- [ ] Replace remaining recoverable assembly, including the unit-list fallback, ARM, audio and transfer code.
- [ ] Complete executable coverage accounting, including embedded code and hardware interfaces.
- [ ] Run and document the final complete decompilation verification.

## Remaining inventory

| Scope | Latest source audit |
|---|---|
| Main program | 63 assembly entry markers; 1 naked-function marker; 7 instruction-bearing inline assembly templates |
| Embedded payload | 18 assembly function declarations; 1 instruction-bearing inline assembly template |
| Additional identified code | 200 ARM instruction bytes in the transfer wrapper's data section |

These are source markers, not counts of independent unfinished functions. Empty
compiler constraints and register bindings are not counted as assembly instructions.
No overall percentage or completion date is inferred from these counts.

The immediate goal is the original GBA decompilation. The root blueprint's native
LÖVE/Lua engine and mod platform are separate work and are not counted as delivered.

Detailed evidence and history: [decomp-completion.md](docs/decomp-completion.md).
