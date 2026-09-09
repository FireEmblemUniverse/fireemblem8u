# Sacred Stones decompilation progress

**Status: active — not yet 100% decompiled.**

Updated: September 9, 2026. Latest verified implementation: PutOamHi embedded integration at `0a19de24`; latest research: dispatcher 103/107 matching instruction words (this change).
This file is the standing progress panel; it is updated after meaningful verified
advances, integration results, or changes in the current blocker.

| Meter | Verified progress |
|---|---|
| Full ROM byte match | `████████████████████` **100%** — all 16,777,216 bytes match |
| Overall C decompilation | **Not yet measurable reliably** — complete executable classification remains unfinished |
| Integrated palette routine | `████████████████████` **52/52 instruction words (100%); full 220-byte section exact** |
| Map flood dispatcher candidate | `███████████████████░` **103/107 instruction words (96.3%); four literal loads differ; not integrated** |
| Integrated map flood helper | `████████████████████` **51/51 instruction words (100%); full 224-byte section exact** |
| Integrated object-list high entry | `████████████████████` **39/39 instruction words (100%); full 160-byte section exact** |
| Integrated string decoder | `████████████████████` **35/35 instruction words (100%); full 148-byte section exact** |
| Half-stride glyph routine | `████████████████████` **All 188 instruction bytes exact; shares the original pointer pool** |
| Glyph drawing routine | `████████████████████` **All 188 instruction bytes exact; shift table and pointer also generated from C** |
| Tilemap fill routine | `████████████████████` **All 56 bytes exact in main and three payload versions** |
| Tilemap copy routine | `████████████████████` **All 92 bytes exact in main and three payload versions** |
| Embedded object-list high entry | `████████████████████` **Exact in all three payload versions; low-entry shim remains assembly** |
| Embedded palette routine | `████████████████████` **Exact in all three payload versions** |

The function percentages describe these routines only. Completed replacements are in the production build; the dispatcher remains a candidate.
An exact ROM build can still contain assembly; its 100% meter is not C coverage.

## Working on now

**Working on: matching the dispatcher shared/prefix literal layout.**
The isolated GCC 16.2.0 build completed. Its explicit PC-read and BX patterns
now generate the original four-instruction address/jump sequence using r0.
An explicit valid-index contract removes the extra guard, and the final table
entry falls through as in the ROM. The candidate passes 640 controlled-helper and
240 actual-helper cases, plus 4,608 table and 10,080 XOR compiler probes.
The backend is still experimental and is not used by production.

Dispatcher evidence so far:
A maintained C candidate passes 640 original/candidate cases checking ordered
neighbor calls, repeated queue alternation, complete queue memory, preserved
registers and return flags with finite-enqueue helper models. Budgets range from
zero to 24 inserted nodes. Another 240 cases run the actual ROM movement helper: final maps match an
independent reference, and original/candidate memory, queues and return flags
agree. Instruction matching remains unfinished. All 16 helper argument setups now match the original 48 instruction words.
An experimental compiler pass now emits the original EORS phase test; its
434-byte candidate passes both the 640 controlled-helper and 240 actual-helper
cases. Jump-table and literal placement still differ; the pass is not enabled
in production. A standalone suite now passes 10,080 baseline/plugin executions,
checking XOR results, branch decisions, preserved registers and excluded forms.
A separate experimental compiler pass now emits six ARM branch-table entries.
The current 444-byte candidate passes all dispatcher checks. Its 428-byte
instruction body matches 103 of 107 words at the original ROM address; only
four queue-pool literal-load offsets differ. The shared-state load is exact,
with 384 standalone literal comparisons and six rejected out-of-range links. The loop trampoline now matches. Literals
still need the original shared/prefix layout. Another 1,280 standalone valid-index cases
verify the opt-in unchecked contract.
An alternate computed-goto fixture also passes 640 controlled-helper cases;
it removes the extra bounds check but emits an address table, so it remains
separate research. Low-entry object-list shims also remain unfinished.

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
- [ ] Replace remaining recoverable assembly, including the unit-list fallback, ARM, audio and transfer code.
- [ ] Complete executable coverage accounting, including embedded code and hardware interfaces.
- [ ] Run and document the final complete decompilation verification.

## Remaining inventory

| Scope | Latest source audit |
|---|---|
| Main program | 58 assembly entry markers; 1 naked-function marker; 7 instruction-bearing inline assembly templates |
| Embedded payload | 16 assembly function declarations; 1 instruction-bearing inline assembly template |
| Additional identified code | 200 ARM instruction bytes in the transfer wrapper's data section |

These are source markers, not counts of independent unfinished functions. Empty
compiler constraints and register bindings are not counted as assembly instructions.
No overall percentage or completion date is inferred from these counts.

The immediate goal is the original GBA decompilation. The root blueprint's native
LÖVE/Lua engine and mod platform are separate work and are not counted as delivered.

Detailed evidence and history: [decomp-completion.md](docs/decomp-completion.md).
