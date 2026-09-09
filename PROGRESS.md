# Sacred Stones decompilation progress

**Status: active — not yet 100% decompiled.**

Updated: September 9, 2026. Latest verified implementation: prefix-pool research milestone (this change).
This file is the standing progress panel; it is updated after meaningful verified
advances, integration results, or changes in the current blocker.

| Meter | Verified progress |
|---|---|
| Full ROM byte match | `████████████████████` **100%** — all 16,777,216 bytes match |
| Overall C decompilation | **Not yet measurable reliably** — complete executable classification remains unfinished |
| Current palette candidate | `████████████████████` **52/52 instruction words (100%); full 220-byte section exact** |
| Current map flood candidate | `██████████████████░░` **45/51 instruction words (88.2%)** |

The candidate percentages describe those two functions only. Both remain outside
the production build. The palette candidate now also has exact literal placement;
production integration and reproducible build wiring are next.
An exact ROM build can still contain assembly; its 100% meter is not C coverage.

## Working on now

**Next: repair embedded compiler bootstrap, then integrate ColorFadeTick.** The optional compiler plugin
now produces the entire original 220-byte pool/function section exactly. The
map flood candidate still differs in six pointer loads. Next milestone: wire
the checked compiler option into a reproducible production build and replace
the palette assembly, then verify the full ROM again.

Latest checks: 65,536 palette component/step pairs; 80 map flood cases with no
return-flag differences; 18,144 compiler-plugin execution probes; 10 relocated prefix-pool probes in both
pointer orders and four invalid-manifest rejection checks. All passed.

The latest build attempt exposed a masked failure in the embedded compiler
installer: it failed to rebuild, then used an existing compiler and ROM. The
ROM checksum passes, but fresh toolchain setup needs repair before claiming
reproducible integration.

## Completed milestones

- [x] Verify the supplied USA ROM and reproduce the entire ROM exactly.
- [x] Remove direct baserom includes from tracked source.
- [x] Build and verify all three embedded payload variants; preserve local source changes reproducibly.
- [x] Replace main ClearOam, Checksum32, TmApplyTsa and their embedded counterparts with matching C.
- [x] Replace audio RealClearChain, ply_pend, ply_fine and clear_modM with matching C.
- [x] Recover matching C for GetUnitDefinitionFormEventScr, Event1B_TEXTSHOW and DisplayEventMapAnim.
- [ ] Finish palette and map flood candidate matching and integration.
- [ ] Replace remaining recoverable assembly, including the unit-list fallback, ARM, audio and transfer code.
- [ ] Complete executable coverage accounting, including embedded code and hardware interfaces.
- [ ] Run and document the final complete decompilation verification.

## Remaining inventory

| Scope | Latest source audit |
|---|---|
| Main program | 66 assembly entry markers; 1 naked-function marker; 7 instruction-bearing inline assembly templates |
| Embedded payload | 20 assembly function declarations; 1 instruction-bearing inline assembly template |
| Additional identified code | 200 ARM instruction bytes in the transfer wrapper's data section |

These are source markers, not counts of independent unfinished functions. Empty
compiler constraints and register bindings are not counted as assembly instructions.
No overall percentage or completion date is inferred from these counts.

The immediate goal is the original GBA decompilation. The root blueprint's native
LÖVE/Lua engine and mod platform are separate work and are not counted as delivered.

Detailed evidence and history: [decomp-completion.md](docs/decomp-completion.md).
