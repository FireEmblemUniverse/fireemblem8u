# Data source remainder

This inventory groups open ledger bytes that are not already covered by the fresh asset union. It reports linked object and source representation only. It does not say these bytes cannot execute.

Fresh asset union: **6,535,922 bytes**. Remaining open input data: **6,845,753 bytes** across **1,223 owners** and **12,018 intervals**.

## Source and mapping coverage

The ledger initially had 3,172,286 bytes without an ELF `$a`/`$t`/`$d` mapping marker. The fresh asset union covers 3,172,286 of them; **0 unmapped bytes remain**. Every remainder byte is attributed to a linked input section (6,845,753 bytes matched; 0 unmatched).

The message-data object contributes 492,968 open bytes; the indexed message-data source reconstruction leaves **0** outside the union.

| Source representation | Owner groups | Remaining bytes |
|---|---:|---:|
| `compiled_c_with_binary_includes_and_source_declarations` | 64 | 3,646,568 |
| `assembly_data_with_binary_includes` | 9 | 2,120,035 |
| `compiled_c_typed_or_macro_data_declarations` | 345 | 478,999 |
| `assembly_labels_and_data_directives` | 707 | 420,908 |
| `compiled_c_translation_unit_mixed_or_literal_data` | 53 | 158,486 |
| `generated_recovered_byte_array` | 1 | 16,624 |
| `toolchain_archive_member_data_source_outside_src_tree` | 44 | 4,133 |

The 44 linked runtime archive-member owners account for 4,133 bytes and have pinned source evidence outside `src/`: 43 have member-level C source rebuild records in `docs/runtime-source-inventory.json`; the remaining data-only `libc.a(impure.o)` source is present in the pinned toolchain checkout and is omitted from its instruction inventory. `docs/runtime-rebuild.json` pins the source commit and is hash-linked from the source inventory. These are not source-availability gaps; they are distinct from the 3 unsupported asset-receipt schemas below.

## Largest remaining owners

| Owner | Source form | Bytes | Source |
|---|---|---:|---|
| `src/data/banim/data_banim.o` | `assembly_data_with_binary_includes` | 1,558,588 | `src/data/banim/data_banim.s` |
| `src/data/data_portrait.o` | `compiled_c_with_binary_includes_and_source_declarations` | 651,528 | `src/data/data_portrait.c` |
| `src/data/data_bg.o` | `compiled_c_with_binary_includes_and_source_declarations` | 545,860 | `src/data/data_bg.c` |
| `src/data/banim-ekrdragonfx.o` | `compiled_c_with_binary_includes_and_source_declarations` | 402,888 | `src/data/banim-ekrdragonfx.c` |
| `src/data/data_opanim_gfx.o` | `compiled_c_with_binary_includes_and_source_declarations` | 376,220 | `src/data/data_opanim_gfx.c` |
| `src/data/const_data_chapter_maps.o` | `compiled_c_with_binary_includes_and_source_declarations` | 355,368 | `src/data/const_data_chapter_maps.c` |
| `src/data/unit_icon/const_data_unit_icon_move.o` | `assembly_data_with_binary_includes` | 268,676 | `src/data/unit_icon/const_data_unit_icon_move.s` |
| `src/data/map/data_map_anim_frames.o` | `assembly_data_with_binary_includes` | 254,256 | `src/data/map/data_map_anim_frames.s` |
| `src/data/ending/ending_cg.o` | `compiled_c_with_binary_includes_and_source_declarations` | 221,564 | `src/data/ending/ending_cg.c` |
| `src/data/data_btl_bg.o` | `compiled_c_with_binary_includes_and_source_declarations` | 207,488 | `src/data/data_btl_bg.c` |
| `src/data/mapanim/mapanim_eventcall.o` | `compiled_c_with_binary_includes_and_source_declarations` | 193,808 | `src/data/mapanim/mapanim_eventcall.c` |
| `src/events_udefs.o` | `compiled_c_typed_or_macro_data_declarations` | 124,052 | `src/events_udefs.c` |
| `src/events_script.o` | `compiled_c_translation_unit_mixed_or_literal_data` | 72,936 | `src/events_script.c` |
| `src/data/data_banim_terrain.o` | `compiled_c_with_binary_includes_and_source_declarations` | 72,404 | `src/data/data_banim_terrain.c` |
| `src/data/banim-efxlvupfx.o` | `compiled_c_with_binary_includes_and_source_declarations` | 48,972 | `src/data/banim-efxlvupfx.c` |
| `src/data/data_chap_title.o` | `compiled_c_with_binary_includes_and_source_declarations` | 46,388 | `src/data/data_chap_title.c` |
| `src/data/data-ekrdk.o` | `compiled_c_with_binary_includes_and_source_declarations` | 37,412 | `src/data/data-ekrdk.c` |
| `src/data/const_data_unit_icon_wait.o` | `compiled_c_with_binary_includes_and_source_declarations` | 37,160 | `src/data/const_data_unit_icon_wait.c` |
| `src/fontgrp-data.o` | `compiled_c_translation_unit_mixed_or_literal_data` | 36,008 | `src/fontgrp-data.c` |
| `src/data/data_titlescreen.o` | `compiled_c_with_binary_includes_and_source_declarations` | 35,536 | `src/data/data_titlescreen.c` |

## Native-code candidate review

No additional concrete candidate surfaced in the finite owner/source review and current pointer/duplicate receipts. The known copied routines and compressed payload are already explicitly inventoried. The generated orphan block's current bytes and pointer-relocated source reconstruction are verified; its historical origin, semantic role, and reachability remain unproven, and no further native implementation is inferred from its suffix.

The current receipts report 200 bytes in 4 copied native-code regions; the exact whole-function frontier reports 2 matches. The duplicated compressed payload stores 21,452 bytes and expands to 34,956 bytes with mapped native instructions; it is already inventoried by `docs/duplicate-executable-content.json`. Function-pointer closure accounts for 5,561/5,561 candidates.

`src/data_B1FE7C.c` includes generated bytes rather than a semantic data model. The included 42,888-byte sequence was parsed and compared byte-for-byte with linked symbol `gUnkData_108`; the runtime-copy receipt reconstructs the current block with 260 shifted pointer words and one semantic exception. The duplicate comparison marks a 1,936-byte tail as non-identical to the source prefix. Current byte provenance is verified, while original build history, semantic role, and reachability remain unproven.

No source filename, extension, linker `$d` mapping, or exact asset match is used as standalone proof of nonexecution. The bounded review can miss hidden, modified, relocated, or computed-target code.

## Unsupported receipt metadata

- `function-pointer-residuals`: This is an evidence-format gap, not proof that its source or linked bytes are missing.
- `orphan-duplicate`: This is an evidence-format gap, not proof that its source or linked bytes are missing.
- `orphan-runtime-copy`: This is an evidence-format gap, not proof that its source or linked bytes are missing.

Exact remaining address intervals and owner/source records are in `data-source-remainder.json`; the JSON is interval-based and contains no per-byte expansion.
