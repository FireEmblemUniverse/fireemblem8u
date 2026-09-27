# Matching native-source completion — September 27, 2026

**Accepted result: matching source recovery for the audited native program is
complete, with the hardware exceptions and evidence limits below.**

## Acceptance scope

The original task is recovery of the Sacred Stones USA GBA program as matching
source. The completion requirements recorded in `decomp-completion.md` are a
canonical full-ROM build, an executable inventory including embedded and copied
code, matching C for recoverable routines, explicit hardware exceptions, separate
data accounting, and reproducible verification.

This assessment uses that scope. It does not require reconstructing every
historical symbol name, explaining every data constant, proving all possible
indirect control flow, or implementing the separate native-engine blueprint.
Hardware instruction templates remain visible and counted; a source-complete
matching decompilation is not a claim that every instruction is portable C.

## Verified source and image evidence

| Requirement | Evidence |
|---|---|
| Fresh program build | All 1,327 main objects and 99 linked payload objects were recreated; all 1,426 match their saved pre-build hashes. Six unlinked stale cache files were excluded and preserved. See `build-recovery-20260927.md`. |
| Exact images | The entire 16,777,216-byte USA ROM matches SHA-1 `c25b145e37456171ada4b0d440bf88a19f4d509f`. All three payload variants match their canonical checksums. |
| Native C compilation | `compile-provenance.json` binds every mapped nonarchive native owner to the actual fresh C compiler command, source and object hashes. There are 490 such main owners and 31 per payload variant. |
| Runtime sources | Fresh pinned C runtime builds reproduce all four complete images and exported symbols. The installed old compiler is fingerprinted and reused; this is not a claim of a full compiler bootstrap. |
| Copied and compressed native code | `native-load-paths.json` inventories four main and three payload RAM-copy mechanisms. `duplicate-executable-content.json` separately accounts for 200 copied native bytes and both compressed payload instances. |
| Entry and branch accounting | Every declared function entry is instruction-mapped. The independent decoder traverses every mapped instruction byte and checks 57,756 main direct branches plus 1,213/1,241/1,210 payload branches. All targets have the correct mapping, mode and alignment. |
| Bounded pointer accounting | All 5,561 aligned exact-function-pointer candidates have provenance: 5,483 named function references and 78 data words. This is not a complete computed-target analysis. |
| ROM data accounting | The physical ledger partitions all 16,777,216 bytes without gaps or overlaps. The fresh asset union accounts for 6,535,922 bytes, including every one of the 3,172,286 previously unmapped input bytes. The remaining 6,845,753 input-data bytes have linked owners and source representations. |

The native instruction inventories are deliberately separate from physical
compressed storage and from RAM copies:

| Image or overlay | Native instruction bytes | Source accounting |
|---|---:|---|
| Main mapped image | 777,630 | 755,838 in freshly compiled C objects plus 21,792 in verified C runtime members |
| Copied native overlay in generated duplicate | 200 | Exact copies of recovered serial boot, poll and reset sources |
| Expanded default payload | 25,714 | 24,894 in freshly compiled C objects plus 820 runtime bytes |
| Expanded 20030206 payload variant | 26,124 | 25,304 in freshly compiled C objects plus 820 runtime bytes |
| Expanded 20030219 payload variant | 25,666 | 24,846 in freshly compiled C objects plus 820 runtime bytes |

No assembly-source native owner or unresolved native owner remains in these
inventories. Neither the 95.94% pure-C-object share nor the 100% ROM-byte match
is used as an overall C-completion percentage.

## Explicit hardware exceptions

The main mapped image retains 84 nonlibrary instruction bytes: 50 software
interrupt bytes, 32 processor-status bytes, and two execution-address bytes.
Its runtime contributes 26 additional software-interrupt bytes, for **110 main
hardware-interface bytes**. The copied 200-byte serial overlay contains another
physical copy of four software-interrupt bytes already identified in its source.
The expanded default payload retains **58 hardware-interface bytes**: 26 software
interrupt and 32 processor-status bytes. Runtime and payload variants are
separately source-verified; compressed physical bytes are not counted as native
instruction bytes.

These instructions are not hidden as C. They implement explicit platform
interfaces and remain listed in `platform-operations.json`,
`inline-assembly-regions.json`, and `runtime-syscall-inline.json`. Empty compiler
constraints, register bindings and assembly layout directives emit no instruction
templates and are not counted as hardware code.

## Residual uncertainty

The audits establish matching source and a reviewed native inventory. They are
not a formal proof that every possible computed address is nonexecutable. The
physical ledger therefore retains its conservative
`input_data_execution_classification_open` category; this assessment does not
rename it or turn asset provenance into a nonexecution proof.

The exceptional word in the generated duplicate points to the existing
`gProcScr_TalkWaitForInput` script table. Its historical meaning and the complete
use of the duplicate remain uncertain, but the full block rebuilds exactly from
recovered objects and an explicit historical constant. No absent routine was
identified there. The exact FE6 serial transport edge and unused generic
MultiBoot caller relationships are also not fully established; both the receiving
stub and the stored/expanded payload have matching source.

Some animation-command semantics and data formats could be documented further.
Their native handlers and source bytes are present. Such semantic documentation,
hardware playtesting, an exhaustive behavior proof and a native-engine port are
separate from the matching-source recovery requirements above.

## Reproduction

The fresh rebuild procedure, preserved cache manifest and command-log hashes are
in `build-recovery-20260927.md`. Run from the repository root after building:

```sh
make -j4 compare
env -u C_INCLUDE_PATH -u CPATH -u CPLUS_INCLUDE_PATH make -j4 -C mgfembp compare
python3 scripts/rebuild_orphan_from_objects.py --objects objects.lst --verify
python3 scripts/verify_runtime_rebuild.py --json docs/runtime-rebuild.json
```

The compiler-provenance audit consumes the preserved fresh-build logs; an
incremental build alone is not equivalent evidence. The source/coverage receipts
are independently reproducible with their `scripts/audit_*.py` generators.
`docs/decomp-completion.md` preserves the earlier per-routine matching and
execution checks, failed experiments, integration history and Jev review records.
