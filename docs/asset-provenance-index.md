# Asset provenance index

This index binds source-asset and source-data receipts to physical ROM intervals. It is provenance evidence only; it does not classify any byte as executable or nonexecutable.

ROM bytes: 16,777,216  
ROM SHA-256: `638cda9d9b72657220fbf7e7a500cd3b64d9686c36e8a56fca69d26d13886f2f`  
Ledger matches current ROM/ELF/map and partitions the ROM: `True`  
Fresh receipts: 14/14  
Unsupported receipt schemas: 3  

## Unique physical-byte coverage

| Ledger classification | Unique bytes with fresh provenance |
|---|---:|
| input_data_execution_classification_open | 6,535,922 |

Unique bytes covered: 6,535,922  
Uncovered bytes: 10,241,294  
Fresh interval claims before deduplication: 6,606,730  
Duplicate claims removed by interval union: 70,808  
Physical bytes with more than one receipt: 70,808 across 15 overlap segments.

## Receipt inventory

| Receipt | Index treatment | Freshness | Intervals | Unmatched entries |
|---|---|---|---:|---:|
| `docs/banim-data-classification.json` | supported_intervals | fresh | 1475 | 0 |
| `docs/banim-graphics-rebuild.json` | supported_supplement | fresh | 0 | 0 |
| `docs/banim-source-rebuild.json` | supported_supplement | fresh | 0 | 0 |
| `docs/final-unmapped-provenance.json` | supported_intervals | fresh | 17 | 0 |
| `docs/function-pointer-data-owners.json` | supported_intervals | fresh | 34 | 8 |
| `docs/function-pointer-residuals.json` | unsupported_extent_receipt | fresh | 0 | 0 |
| `docs/message-data-classification.json` | supported_reconstructed_intervals | fresh | 3408 | 0 |
| `docs/orphan-duplicate.json` | unsupported_extent_receipt | fresh | 0 | 0 |
| `docs/orphan-runtime-copy.json` | unsupported_extent_receipt | fresh | 0 | 0 |
| `docs/residual-table-provenance.json` | supported_intervals | fresh | 111 | 0 |
| `docs/sound-relocations.json` | supported_supplement | fresh | 0 | 0 |
| `docs/sound-sample-data.json` | supported_intervals | fresh | 779 | 0 |
| `docs/sound-sample-references.json` | supported_supplement | fresh | 0 | 0 |
| `docs/unmapped-asset-provenance.json` | supported_intervals | fresh | 157 | 20 |

Sound freshness checks pin each indexed `.bin` source file and its ROM bytes, plus `sound/direct_sound_data.s` and the converter source. The sound receipt does not record AIFF input hashes, so this index cannot independently certify that the original AIFF inputs are unchanged.

## Unmatched evidence

- `function-pointer-data-owners` / `records[11]` (4 bytes): record is a locator or data classification, not a source-asset extent. Details: `{"address": "0x88b4588", "classification": "unit_definition_scalar_fields"}`.
- `function-pointer-data-owners` / `records[12]` (4 bytes): record is a locator or data classification, not a source-asset extent. Details: `{"address": "0x88b492c", "classification": "unit_definition_scalar_fields"}`.
- `function-pointer-data-owners` / `records[13]` (4 bytes): record is a locator or data classification, not a source-asset extent. Details: `{"address": "0x88b49e0", "classification": "unit_definition_scalar_fields"}`.
- `function-pointer-data-owners` / `records[14]` (4 bytes): record is a locator or data classification, not a source-asset extent. Details: `{"address": "0x88b83e4", "classification": "unit_definition_scalar_fields"}`.
- `function-pointer-data-owners` / `records[15]` (4 bytes): record is a locator or data classification, not a source-asset extent. Details: `{"address": "0x88c26dc", "classification": "unit_definition_scalar_fields"}`.
- `function-pointer-data-owners` / `records[16]` (4 bytes): record is a locator or data classification, not a source-asset extent. Details: `{"address": "0x88d1ba0", "classification": "unit_definition_scalar_fields"}`.
- `function-pointer-data-owners` / `records[22]` (4 bytes): record is a locator or data classification, not a source-asset extent. Details: `{"address": "0x8a18e20", "classification": "sprite_oam_halfwords"}`.
- `function-pointer-data-owners` / `records[23]` (4 bytes): record is a locator or data classification, not a source-asset extent. Details: `{"address": "0x8a984f4", "classification": "worldmap_rectangle_tile_halfwords"}`.
- `unmapped-asset-provenance` / `residual[0]` (32 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 32, "end": "0x8587720", "object": ".deps/runtime-c/libc.a(vfprintf.o)", "start": "0x8587700", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[1]` (177 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 177, "end": "0x8b1a16d", "object": "asm/fe6sio.o", "start": "0x8b1a0bc", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[2]` (55 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 55, "end": "0x80daf27", "object": "src/banim-ekrmain.o", "start": "0x80daef0", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[3]` (40 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 40, "end": "0x859e520", "object": "src/bksel.o", "start": "0x859e4f8", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[4]` (4 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 4, "end": "0x80d7c18", "object": "src/bmreliance.o", "start": "0x80d7c14", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[5]` (9 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 9, "end": "0x80d8175", "object": "src/cp_data.o", "start": "0x80d816c", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[6]` (2,480 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 2480, "end": "0x81c3d7c", "object": "src/data/unit_icon/const_data_unit_icon_move.o", "start": "0x81c33cc", "supporting_receipts": ["residual-table-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[7]` (7,020 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 7020, "end": "0x880d374", "object": "src/data_terrains.o", "start": "0x880b808", "supporting_receipts": ["residual-table-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[8]` (192 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 192, "end": "0x89ed7cc", "object": "src/events_shoplist.o", "start": "0x89ed70c", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[9]` (2,048 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 2048, "end": "0x8588240", "object": "src/fontgrp.o", "start": "0x8587a40", "supporting_receipts": ["residual-table-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[10]` (25 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 25, "end": "0x8a3cb1d", "object": "src/gamerankings.o", "start": "0x8a3cb04", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[11]` (51 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 51, "end": "0x8205db7", "object": "src/minimap.o", "start": "0x8205d84", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[12]` (8 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 8, "end": "0x88d2060", "object": "src/monstergen_data.o", "start": "0x88d2058", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[13]` (84 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 84, "end": "0x85aa1ac", "object": "src/sio_battlemap.o", "start": "0x85aa158", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[14]` (32 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 32, "end": "0x80d9f48", "object": "src/sio_points.o", "start": "0x80d9f28", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[15]` (7 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 7, "end": "0x8205f83", "object": "src/worldmap_gmapunit.o", "start": "0x8205f7c", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[16]` (20 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 20, "end": "0x8206b84", "object": "src/worldmap_radar.o", "start": "0x8206b70", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[17]` (8 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 8, "end": "0x8a3ee74", "object": "src/worldmap_radar.o", "start": "0x8a3ee6c", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[18]` (58 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 58, "end": "0x820648a", "object": "src/worldmap_screen2.o", "start": "0x8206450", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.
- `unmapped-asset-provenance` / `residual[19]` (10 bytes): residual is fully covered by other fresh indexed receipts. Details: `{"covered_by_other_receipts_bytes": 10, "end": "0x8206952", "object": "src/worldmap_timemons.o", "start": "0x8206948", "supporting_receipts": ["final-unmapped-provenance"], "uncovered_bytes": 0}`.

The JSON file contains the interval-level bindings, freshness checks, source and ROM hashes, overlap segments, and ledger-category intersections. It lists asset receipts whose schema cannot supply an addressed, freshly verified extent, with the reason recorded.
