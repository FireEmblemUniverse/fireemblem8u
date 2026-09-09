# Sacred Stones decompilation progress

**Status: active — not yet 100% decompiled.**

Updated: September 9, 2026. Latest verified implementation: DecodeString integrated in `4a00f9b8`; latest research: PutOamHi execution oracle (changes following `7d423683`).
This file is the standing progress panel; it is updated after meaningful verified
advances, integration results, or changes in the current blocker.

| Meter | Verified progress |
|---|---|
| Full ROM byte match | `████████████████████` **100%** — all 16,777,216 bytes match |
| Overall C decompilation | **Not yet measurable reliably** — complete executable classification remains unfinished |
| Integrated palette routine | `████████████████████` **52/52 instruction words (100%); full 220-byte section exact** |
| Integrated map flood helper | `████████████████████` **51/51 instruction words (100%); full 224-byte section exact** |
| Object-list high-entry candidate | `██████████████████░░` **37/39 instruction words (94.9%); not integrated** |
| Integrated string decoder | `████████████████████` **35/35 instruction words (100%); full 148-byte section exact** |
| Half-stride glyph routine | `████████████████████` **All 188 instruction bytes exact; shares the original pointer pool** |
| Glyph drawing routine | `████████████████████` **All 188 instruction bytes exact; shift table and pointer also generated from C** |
| Tilemap fill routine | `████████████████████` **All 56 bytes exact in main and three payload versions** |
| Tilemap copy routine | `████████████████████` **All 92 bytes exact in main and three payload versions** |
| Embedded palette routine | `████████████████████` **Exact in all three payload versions** |

The function percentages describe these routines only. Rows marked integrated and completed replacements
are in the production build; the object-list candidate remains research.
An exact ROM build can still contain assembly; its 100% meter is not C coverage.

## Working on now

**Working on: PutOamHi/PutOamLo shared object-list body.**
The high-entry C candidate matches 37 of 39 instruction words and its four-byte
pointer pool. Remaining differences are the entry SUBS versus TST and BLT versus
BMI. The execution oracle passes 1,280 memory/cursor cases, but detects r12
clobbering in all cases and return-flag differences in 192 cases. The candidate
is not ready for integration. Next: resolve the entry encodings and preserve
the low-entry shared-body layout.

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
- [ ] Replace remaining recoverable assembly, including the unit-list fallback, ARM, audio and transfer code.
- [ ] Complete executable coverage accounting, including embedded code and hardware interfaces.
- [ ] Run and document the final complete decompilation verification.

## Remaining inventory

| Scope | Latest source audit |
|---|---|
| Main program | 59 assembly entry markers; 1 naked-function marker; 7 instruction-bearing inline assembly templates |
| Embedded payload | 17 assembly function declarations; 1 instruction-bearing inline assembly template |
| Additional identified code | 200 ARM instruction bytes in the transfer wrapper's data section |

These are source markers, not counts of independent unfinished functions. Empty
compiler constraints and register bindings are not counted as assembly instructions.
No overall percentage or completion date is inferred from these counts.

The immediate goal is the original GBA decompilation. The root blueprint's native
LÖVE/Lua engine and mod platform are separate work and are not counted as delivered.

Detailed evidence and history: [decomp-completion.md](docs/decomp-completion.md).
