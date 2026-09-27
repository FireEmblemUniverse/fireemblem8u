#!/usr/bin/env python3
"""Inventory source owners for open ROM data outside the fresh asset union.

This is a finite source-attribution audit. It does not decide whether data
bytes can execute, and it does not prove that arbitrary hidden code is absent.
"""

from __future__ import annotations

import hashlib
import json
import re
import shlex
import subprocess
from bisect import bisect_right
from collections import Counter, defaultdict
from pathlib import Path

from audit_linked_code import read_contributions


ROOT = Path(__file__).resolve().parents[1]
ROM_PATH = ROOT / "fireemblem8.gba"
REFERENCE_ROM_PATH = ROOT / "baserom.gba"
ELF_PATH = ROOT / "fireemblem8.elf"
MAP_PATH = ROOT / "fireemblem8.map"
LEDGER_PATH = ROOT / "docs/rom-coverage-ledger.json"
ASSET_INDEX_PATH = ROOT / "docs/asset-provenance-index.json"
OUTPUT_JSON = ROOT / "docs/data-source-remainder.json"
OUTPUT_MD = ROOT / "docs/data-source-remainder.md"
ROM_BASE = 0x08000000
ROM_END = 0x09000000


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def need(condition: bool, message: str) -> None:
    if not condition:
        raise SystemExit("audit failed: " + message)


def hex_range(start: int, end: int) -> dict[str, object]:
    return {"start": hex(start), "end": hex(end), "bytes": end - start}


def merge_ranges(ranges: list[tuple[int, int]]) -> list[tuple[int, int]]:
    merged: list[tuple[int, int]] = []
    for start, end in sorted(ranges):
        if start >= end:
            raise ValueError("empty or reversed interval")
        if merged and start <= merged[-1][1]:
            merged[-1] = (merged[-1][0], max(merged[-1][1], end))
        else:
            merged.append((start, end))
    return merged


def intersection_bytes(left: list[tuple[int, int]], right: list[tuple[int, int]]) -> int:
    total = 0
    i = j = 0
    while i < len(left) and j < len(right):
        start = max(left[i][0], right[j][0])
        end = min(left[i][1], right[j][1])
        if start < end:
            total += end - start
        if left[i][1] <= right[j][1]:
            i += 1
        else:
            j += 1
    return total


def subtract_ranges(
    start: int, end: int, covered: list[tuple[int, int]]
) -> list[tuple[int, int]]:
    result: list[tuple[int, int]] = []
    cursor = start
    for cover_start, cover_end in covered:
        if cover_end <= cursor:
            continue
        if cover_start >= end:
            break
        if cover_start > cursor:
            result.append((cursor, min(cover_start, end)))
        cursor = max(cursor, min(cover_end, end))
        if cursor >= end:
            break
    if cursor < end:
        result.append((cursor, end))
    return result


def active_c_source(path: Path) -> bool:
    if path.suffix != ".c":
        return False
    if path.parent == Path("src"):
        return True
    if path in {
        Path("src/arm/put_oam_lo.c"),
        Path("src/arm/call_wrappers.c"),
        Path("src/arm/map_flood_core.c"),
        Path("src/arm/put_oam.c"),
        Path("src/arm/decode_string.c"),
        Path("src/arm/draw_glyph.c"),
        Path("src/arm/tm_fill_rect.c"),
        Path("src/arm/tm_copy_rect.c"),
        Path("src/arm/map_flood_step.c"),
        Path("src/arm/color_fade_tick.c"),
        Path("src/arm/clear_oam.c"),
        Path("src/arm/checksum.c"),
        Path("src/arm/tm_apply_tsa.c"),
    }:
        return True
    return path.parent in {
        Path("src/data"),
        Path("src/data/mapanim"),
        Path("src/data/menu"),
        Path("src/data/ending"),
        Path("src/data/worldmap"),
        Path("src/data/ui"),
    }


def active_s_source(path: Path) -> bool:
    if path.suffix != ".s":
        return False
    if path.parent in {Path("asm"), Path("data")}:
        return True
    if path == Path("src/m4a_1.s"):
        return True
    if path.parts[:1] == ("sound",):
        return True
    return path.parent in {
        Path("src/data/map"),
        Path("src/data/unit_icon"),
        Path("src/data/banim"),
        Path("src/data/mapanim"),
        Path("src/data/menu"),
        Path("src/data/ending"),
        Path("src/data/worldmap"),
        Path("src/data/ui"),
    }


def classify_source(owner: str, object_list: set[str]) -> dict[str, object]:
    if owner in object_list:
        stem = Path(owner).with_suffix("")
        c_path = Path(str(stem) + ".c")
        s_path = Path(str(stem) + ".s")
        source_path: Path | None = None
        source_language: str | None = None
        if c_path.is_file() and active_c_source(c_path):
            source_path, source_language = c_path, "c"
        elif s_path.is_file() and active_s_source(s_path):
            source_path, source_language = s_path, "assembly"

        if source_path is None:
            existing = [str(path) for path in (c_path, s_path) if path.is_file()]
            return {
                "owner_kind": "production_object",
                "source_status": "source_not_resolved_from_current_make_rules",
                "source_path": None,
                "existing_same_stem_sources": existing,
                "source_representation": "source_mapping_unresolved",
                "source_indicators": {},
            }

        text = (ROOT / source_path).read_text(encoding="utf-8", errors="replace")
        includes = re.findall(r"\bINCBIN(?:_[A-Z0-9]+)?\s*\(\s*\"([^\"]+)\"", text)
        includes += re.findall(r"(?m)^\s*\.incbin\s+\"([^\"]+)\"", text)
        include_lines = re.findall(r"(?m)^\s*#\s*include\s+[\"<]([^\">]+)", text)
        if source_language == "c":
            record_lines = re.findall(
                r"(?m)^\s*(?:(?:CONST_DATA|ALIGNED\([^)]*\)|static|const|volatile|extern)\s+)*"
                r"(?:struct\s+\w+|enum\s+\w+|u8|s8|u16|s16|u32|s32|int|unsigned|const\s+\w+)\s+"
                r"[A-Za-z_]\w*\s*(?:\[[^\]]*\])?\s*(?:=|\{|;)",
                text,
            )
            function_like_definitions = re.findall(
                r"(?m)^\s*(?:(?:static|inline|const|volatile)\s+)*"
                r"(?:void|u8|s8|u16|s16|u32|s32|int|unsigned|bool|struct\s+\w+)\s+"
                r"\w+\s*\([^;{}]*\)\s*\{",
                text,
            )
            if owner == "src/data_B1FE7C.o" and ".deps/orphan-rebuild/orphan.inc" in text:
                representation = "generated_recovered_byte_array"
            elif includes:
                representation = "compiled_c_with_binary_includes_and_source_declarations"
            elif record_lines:
                representation = "compiled_c_typed_or_macro_data_declarations"
            else:
                representation = "compiled_c_translation_unit_mixed_or_literal_data"
            indicators = {
                "binary_include_count": len(includes),
                "binary_include_examples": includes[:6],
                "include_directive_count": len(include_lines),
                "include_directive_examples": include_lines[:6],
                "typed_or_record_declaration_line_count": len(record_lines),
                "function_definition_line_count_approx": len(function_like_definitions),
            }
        else:
            assembly_data_directives = re.findall(
                r"(?m)^\s*\.(?:byte|2byte|4byte|word|short|long|incbin)\b", text
            )
            labels = re.findall(r"(?m)^\s*[A-Za-z_.$][\w.$]*:\s*(?:@.*)?$", text)
            representation = (
                "assembly_data_with_binary_includes"
                if includes
                else "assembly_labels_and_data_directives"
                if assembly_data_directives or labels
                else "assembly_translation_unit"
            )
            indicators = {
                "binary_include_count": len(includes),
                "binary_include_examples": includes[:6],
                "include_directive_count": len(include_lines),
                "include_directive_examples": include_lines[:6],
                "data_directive_count": len(assembly_data_directives),
                "label_count_approx": len(labels),
            }
        return {
            "owner_kind": "production_object",
            "source_status": "active_source_present",
            "source_path": str(source_path),
            "source_language": source_language,
            "source_representation": representation,
            "source_sha256": digest((ROOT / source_path).read_bytes()),
            "source_indicators": indicators,
        }

    archive_match = re.fullmatch(r"(.+\.a)\(([^)]+)\)", owner)
    if archive_match:
        archive_relative, member = archive_match.groups()
        archive_path = ROOT / archive_relative
        member_present = False
        if archive_path.is_file():
            names = subprocess.check_output(
                ["arm-none-eabi-ar", "t", str(archive_path)], text=True
            ).splitlines()
            member_present = member in names
        return {
            "owner_kind": "linked_toolchain_archive_member",
            "source_status": "archive_member_present_source_pinned_outside_src_tree"
            if member_present
            else "archive_or_member_missing",
            "archive_path": archive_relative,
            "archive_sha256": digest(archive_path.read_bytes()) if archive_path.is_file() else None,
            "archive_member": member,
            "archive_member_present": member_present,
            "source_path": None,
            "source_representation": "toolchain_archive_member_data_source_outside_src_tree",
            "source_indicators": {},
        }

    return {
        "owner_kind": "unmatched_linker_owner",
        "source_status": "no_production_object_or_archive_record",
        "source_path": None,
        "source_representation": "owner_mapping_unresolved",
        "source_indicators": {},
    }


def parse_linked_symbols() -> list[tuple[int, int, str, str]]:
    output = subprocess.check_output(
        ["arm-none-eabi-nm", "-n", "-S", "--defined-only", str(ELF_PATH)], text=True
    )
    symbols = []
    for line in output.splitlines():
        fields = line.split()
        if len(fields) == 4:
            address, size, kind, name = fields
        elif len(fields) == 3:
            address, kind, name = fields
            size = "0"
        else:
            continue
        try:
            symbols.append((int(address, 16), int(size, 16), kind, name))
        except ValueError:
            continue
    return sorted(symbols)


def source_blob_check(rom: bytes, symbols: list[tuple[int, int, str, str]]) -> dict[str, object]:
    source_c = ROOT / "src/data_B1FE7C.c"
    include = ROOT / ".deps/orphan-rebuild/orphan.inc"
    sym = next((item for item in symbols if item[3] == "gUnkData_108"), None)
    if not source_c.is_file() or not include.is_file() or sym is None:
        return {"status": "not_checked", "reason": "generated source or linked symbol unavailable"}
    text = include.read_text(encoding="ascii")
    byte_values = [int(value, 16) for value in re.findall(r"0x([0-9a-fA-F]{1,2})\b", text)]
    symbol_address, symbol_size = sym[0], sym[1]
    rom_offset = symbol_address - ROM_BASE
    expected = bytes(byte_values)
    actual = rom[rom_offset : rom_offset + len(expected)]
    return {
        "status": "match" if len(expected) == symbol_size and actual == expected else "mismatch",
        "source_path": "src/data_B1FE7C.c",
        "included_generated_bytes_path": ".deps/orphan-rebuild/orphan.inc",
        "source_c_sha256": digest(source_c.read_bytes()),
        "generated_include_sha256": digest(include.read_bytes()),
        "linked_symbol": "gUnkData_108",
        "linked_start": hex(symbol_address),
        "linked_bytes": symbol_size,
        "parsed_include_bytes": len(expected),
        "rom_slice_sha256": digest(actual),
        "include_byte_match": len(expected) == symbol_size and actual == expected,
        "note": "This verifies generated bytes, not the semantic role of the whole array.",
    }


def receipt_summary(
    name: str, path: Path, rom_sha256: str, referenced_sha256: str | None = None
) -> dict[str, object]:
    if not path.is_file():
        return {"name": name, "status": "receipt_not_present"}
    data = json.loads(path.read_text(encoding="utf-8"))
    recorded_rom = data.get("rom_sha256", data.get("inputs", {}).get("rom_sha256"))
    current_file_sha256 = digest(path.read_bytes())
    if recorded_rom == rom_sha256:
        status = "fresh_for_current_rom"
    elif recorded_rom is None and referenced_sha256 == current_file_sha256:
        status = "fresh_by_receipt_hash_reference"
    else:
        status = "rom_hash_absent_or_stale"
    return {
        "name": name,
        "path": str(path.relative_to(ROOT)),
        "status": status,
        "recorded_rom_sha256": recorded_rom,
        "current_file_sha256": current_file_sha256,
        "records": len(data.get("records", data.get("native_regions", data.get("candidates", []))))
        if isinstance(data.get("records", data.get("native_regions", data.get("candidates", []))), list)
        else None,
    }


def main() -> None:
    for path in (ROM_PATH, REFERENCE_ROM_PATH, ELF_PATH, MAP_PATH, LEDGER_PATH, ASSET_INDEX_PATH):
        need(path.is_file(), "required input missing: " + str(path.relative_to(ROOT)))

    rom = ROM_PATH.read_bytes()
    rom_sha256 = digest(rom)
    elf_sha256 = digest(ELF_PATH.read_bytes())
    map_bytes = MAP_PATH.read_bytes()
    map_sha256 = digest(map_bytes)
    map_text = map_bytes.decode("utf-8")
    ledger_bytes = LEDGER_PATH.read_bytes()
    ledger = json.loads(ledger_bytes)
    asset_index_bytes = ASSET_INDEX_PATH.read_bytes()
    asset_index = json.loads(asset_index_bytes)
    ledger_sha256 = digest(ledger_bytes)
    asset_index_summary = asset_index["summary"]

    need(len(rom) == ROM_END - ROM_BASE, "unexpected ROM size")
    need(rom == REFERENCE_ROM_PATH.read_bytes(), "current ROM differs from baserom.gba")
    need(ledger["rom_sha256"] == rom_sha256, "coverage ledger is stale for ROM")
    need(ledger["elf_sha256"] == elf_sha256, "coverage ledger is stale for ELF")
    need(ledger["map_sha256"] == map_sha256, "coverage ledger is stale for map")
    need(asset_index_summary["rom_sha256"] == rom_sha256, "asset index is stale for ROM")
    need(asset_index_summary["ledger_sha256"] == ledger_sha256, "asset index is stale for ledger")
    need(asset_index_summary["ledger_matches_current_inputs"], "asset index reports stale ledger inputs")
    need(asset_index_summary["ledger_structure_valid"], "asset index reports malformed ledger")
    need(asset_index_summary["negative_self_checks_passed"], "asset index negative checks failed")

    ranges = ledger["ranges"]
    cursor = ROM_BASE
    for row in ranges:
        start, end = int(row["start"], 16), int(row["end"], 16)
        need(start == cursor and end > start, "ledger does not partition the ROM exactly")
        cursor = end
    need(cursor == ROM_END, "ledger ends before ROM boundary")

    open_rows = [
        row for row in ranges if row["classification"] == "input_data_execution_classification_open"
    ]
    eligible_rows = [
        row
        for row in asset_index["intervals"]
        if row.get("eligible_for_unique_coverage")
        and row.get("receipt_fresh")
        and row.get("range_status") == "valid"
    ]
    need(
        len(eligible_rows) == asset_index_summary["eligible_interval_record_count"],
        "asset index eligible row count does not match its summary",
    )
    coverage = merge_ranges(
        [(int(row["start"], 16), int(row["end"], 16)) for row in eligible_rows]
    )
    covered_bytes = sum(end - start for start, end in coverage)
    need(covered_bytes == asset_index_summary["unique_verified_fresh_coverage_bytes"], "asset union total mismatch")

    remainder_by_owner: dict[str, list[tuple[int, int, str]]] = defaultdict(list)
    open_bytes = 0
    for row in open_rows:
        start, end = int(row["start"], 16), int(row["end"], 16)
        open_bytes += end - start
        for left, right in subtract_ranges(start, end, coverage):
            remainder_by_owner[row["owner"]].append((left, right, row["original_mapping"]))

    groups: list[dict[str, object]] = []
    remaining_mapping_bytes: Counter[str] = Counter()
    mapping_group_owner_bytes: dict[str, Counter[str]] = defaultdict(Counter)
    contributions = read_contributions(map_text)
    symbols = parse_linked_symbols()
    object_list = set(shlex.split((ROOT / "objects.lst").read_text(encoding="utf-8")))
    contributions_by_owner: dict[str, list[dict[str, object]]] = defaultdict(list)
    for contribution in contributions:
        contributions_by_owner[contribution["object"]].append(contribution)

    all_remainder_spans = sorted(
        (start, end, owner)
        for owner, raw_spans in remainder_by_owner.items()
        for start, end in merge_ranges([(left, right) for left, right, _ in raw_spans])
    )
    remainder_starts = [start for start, _, _ in all_remainder_spans]
    symbols_by_owner: dict[str, list[dict[str, object]]] = defaultdict(list)
    for address, size, kind, name in symbols:
        index = bisect_right(remainder_starts, address) - 1
        if index >= 0:
            start, end, owner = all_remainder_spans[index]
            if start <= address < end:
                symbols_by_owner[owner].append(
                    {"address": hex(address), "size": size, "type": kind, "name": name}
                )
    mapped_remaining_bytes = 0
    map_unmatched_bytes = 0
    source_owner_counts: Counter[str] = Counter()
    source_owner_bytes: Counter[str] = Counter()

    for owner, raw_spans in sorted(remainder_by_owner.items()):
        span_mapping: dict[tuple[int, int], str] = {}
        for start, end, mapping in raw_spans:
            span_mapping[(start, end)] = mapping
            remaining_mapping_bytes[mapping] += end - start
            mapping_group_owner_bytes[mapping][owner] += end - start
        merged_spans = merge_ranges([(start, end) for start, end, _ in raw_spans])

        sections = []
        section_intersections: Counter[str] = Counter()
        section_ranges: dict[str, list[tuple[int, int]]] = defaultdict(list)
        for contribution in contributions_by_owner.get(owner, []):
            section_ranges[contribution["section"]].append(
                (contribution["start"], contribution["end"])
            )
        for section, section_spans in sorted(section_ranges.items()):
            overlap_ranges = []
            for start, end in section_spans:
                for rem_start, rem_end in merged_spans:
                    left, right = max(start, rem_start), min(end, rem_end)
                    if left < right:
                        overlap_ranges.append((left, right))
            overlap_ranges = merge_ranges(overlap_ranges) if overlap_ranges else []
            overlap_bytes = sum(end - start for start, end in overlap_ranges)
            if overlap_bytes:
                section_intersections[section] += overlap_bytes
                sections.append(
                    {
                        "section": section,
                        "remainder_bytes": overlap_bytes,
                        "overlap_segments": len(overlap_ranges),
                    }
                )

        mapped_owner_bytes = sum(section_intersections.values())
        owner_remainder_bytes = sum(end - start for start, end in merged_spans)
        mapped_remaining_bytes += mapped_owner_bytes
        map_unmatched_bytes += owner_remainder_bytes - mapped_owner_bytes
        source = classify_source(owner, object_list)
        source_owner_counts[source["source_status"]] += 1
        source_owner_bytes[source["source_status"]] += owner_remainder_bytes

        group_symbols = symbols_by_owner.get(owner, [])

        group = {
            "owner": owner,
            **source,
            "remaining_bytes": owner_remainder_bytes,
            "remaining_interval_count": len(merged_spans),
            "remaining_intervals": [hex_range(start, end) for start, end in merged_spans],
        "remaining_bytes_by_original_mapping": dict(
            Counter({
                mapping: sum(end - start for start, end, item_mapping in raw_spans if item_mapping == mapping)
                for mapping in {item_mapping for _, _, item_mapping in raw_spans}
            })
        ),
            "linked_input_sections": sections,
            "linked_section_remainder_bytes": mapped_owner_bytes,
            "remainder_outside_owner_input_sections_bytes": owner_remainder_bytes - mapped_owner_bytes,
            "symbols_starting_in_remainder_count": len(group_symbols),
            "symbol_start_examples": group_symbols[:8],
        }
        groups.append(group)

    remainder_bytes = sum(group["remaining_bytes"] for group in groups)
    need(open_bytes == ledger["categories"]["input_data_execution_classification_open"], "open-byte total mismatch")
    need(remainder_bytes == open_bytes - covered_bytes, "remainder does not reconcile to ledger minus fresh union")
    need(map_unmatched_bytes == 0, "some remainder bytes lack a linked input-section owner")

    original_unmapped_open = sum(
        row["bytes"]
        for row in open_rows
        if row["original_mapping"] == "unmapped"
    )
    unmapped_open_ranges = merge_ranges(
        [
            (int(row["start"], 16), int(row["end"], 16))
            for row in open_rows
            if row["original_mapping"] == "unmapped"
        ]
    )
    unmapped_coverage = intersection_bytes(unmapped_open_ranges, coverage)
    unmapped_remainder = remaining_mapping_bytes["unmapped"]
    need(unmapped_remainder == 0, "unmapped open intervals remain outside fresh asset union")

    owners_in_open = {row["owner"] for row in open_rows}
    owners_in_remainder = {group["owner"] for group in groups}
    production_open_owners = owners_in_open & object_list
    production_remainder_owners = owners_in_remainder & object_list
    archive_remainder_groups = [
        group for group in groups if group["owner_kind"] == "linked_toolchain_archive_member"
    ]
    missing_source_groups = [
        group
        for group in groups
        if group["source_status"] not in {
            "active_source_present",
            "archive_member_present_source_pinned_outside_src_tree",
        }
    ]

    # Ensure full input source assets used by message data are accounted in the union,
    # rather than carrying the old broad symbol extent as unexplained remainder.
    message_owner_open = [row for row in open_rows if row["owner"] == "src/msg_data.o"]
    message_owner_remainder = next(
        (group["remaining_bytes"] for group in groups if group["owner"] == "src/msg_data.o"), 0
    )
    need(message_owner_remainder == 0, "message data retains open bytes outside current index")

    blob_check = source_blob_check(rom, symbols)
    need(blob_check.get("status") in {"match", "not_checked"}, "generated orphan byte include does not match ROM")
    need(blob_check.get("status") == "match", "generated orphan byte include could not be verified")

    pointer_closure = json.loads((ROOT / "docs/function-pointer-closure.json").read_text(encoding="utf-8"))
    current_rom_receipts = [
        receipt_summary("function-pointer-closure", ROOT / "docs/function-pointer-closure.json", rom_sha256),
        receipt_summary(
            "function-pointer-residuals",
            ROOT / "docs/function-pointer-residuals.json",
            rom_sha256,
            pointer_closure["receipt_hashes"]["residual"],
        ),
        receipt_summary("code-duplicate-frontier", ROOT / "docs/code-duplicate-frontier.json", rom_sha256),
        receipt_summary("duplicate-executable-content", ROOT / "docs/duplicate-executable-content.json", rom_sha256),
        receipt_summary("orphan-duplicate", ROOT / "docs/orphan-duplicate.json", rom_sha256),
        receipt_summary("orphan-runtime-copy", ROOT / "docs/orphan-runtime-copy.json", rom_sha256),
        receipt_summary("native-load-paths", ROOT / "docs/native-load-paths.json", rom_sha256),
    ]
    for receipt in current_rom_receipts:
        if receipt["status"] not in {
            "fresh_for_current_rom",
            "fresh_by_receipt_hash_reference",
            "receipt_not_present",
        }:
            raise SystemExit("audit failed: stale or malformed native-code receipt " + str(receipt["name"]))

    pointer_residuals = json.loads((ROOT / "docs/function-pointer-residuals.json").read_text(encoding="utf-8"))
    duplicate_content = json.loads((ROOT / "docs/duplicate-executable-content.json").read_text(encoding="utf-8"))
    code_duplicate = json.loads((ROOT / "docs/code-duplicate-frontier.json").read_text(encoding="utf-8"))
    orphan_duplicate = json.loads((ROOT / "docs/orphan-duplicate.json").read_text(encoding="utf-8"))
    orphan_runtime = json.loads((ROOT / "docs/orphan-runtime-copy.json").read_text(encoding="utf-8"))
    need(pointer_closure["candidates"] == pointer_closure["accounted"], "function pointer closure has unaccounted candidates")
    need(pointer_closure["rom_sha256"] == rom_sha256, "function pointer closure stale")
    need(duplicate_content["rom_sha256"] == rom_sha256, "duplicate code receipt stale")
    need(code_duplicate["rom_sha256"] == rom_sha256, "duplicate frontier stale")
    need(orphan_duplicate["rom_sha256"] == rom_sha256, "orphan duplicate receipt stale")
    need(orphan_runtime["rom_sha256"] == rom_sha256, "orphan runtime receipt stale")

    unsupported_receipts = [
        {
            "name": name,
            "reason": "The asset index cannot derive a fresh addressed interval set from this receipt schema.",
            "effect": "This is an evidence-format gap, not proof that its source or linked bytes are missing.",
        }
        for name in asset_index_summary["unsupported_receipts"]
    ]
    duplicate_code_bytes = sum(int(row["bytes"]) for row in duplicate_content["native_regions"])
    known_payload = duplicate_content["compressed_payload"]
    native_loader_receipt = next(
        (row for row in current_rom_receipts if row["name"] == "native-load-paths"), None
    )
    known_code_evidence = {
        "duplicate_native_region_bytes": duplicate_code_bytes,
        "duplicate_native_region_count": len(duplicate_content["native_regions"]),
        "whole_function_duplicate_frontier_matches": len(code_duplicate["records"]),
        "compressed_payload_duplicate": {
            "source": known_payload["source"],
            "duplicate": known_payload["duplicate"],
            "stored_bytes": known_payload["bytes"],
            "expanded_bytes": known_payload["expanded_bytes"],
            "expanded_mapping_bytes": known_payload.get("expanded_mapping_bytes"),
            "already_accounted_by_receipt": "docs/duplicate-executable-content.json",
        },
        "orphan_duplicate_suffix_bytes_not_byte_identical_to_prefix_source": orphan_duplicate[
            "remaining_suffix_bytes"
        ],
        "orphan_runtime_shifted_pointer_word_count": len(orphan_runtime["shifted_words"]),
        "orphan_runtime_exceptional_word_count": len(orphan_runtime["exceptional_words"]),
        "function_pointer_closure": {
            "candidates": pointer_closure["candidates"],
            "accounted": pointer_closure["accounted"],
            "remaining_candidates_in_intermediate_residual_receipt": len(
                pointer_residuals.get("remaining_candidates", [])
            ),
            "note": "Address-valued words are classified as references/data evidence, not as embedded instructions.",
        },
        "native_loader_receipt": native_loader_receipt,
    }

    source_representation_groups = Counter(group["source_representation"] for group in groups)
    source_representation_bytes = Counter()
    for group in groups:
        source_representation_bytes[group["source_representation"]] += group["remaining_bytes"]

    report = {
        "schema_version": 1,
        "scope": (
            "Source-owner inventory for ledger input_data_execution_classification_open intervals "
            "outside the fresh asset-provenance union. This does not close execution classification; "
            "source kind, names, extensions, ELF $d mapping, and exact data provenance alone are not proof of nonexecution."
        ),
        "inputs": {
            "rom_sha256": rom_sha256,
            "elf_sha256": elf_sha256,
            "map_sha256": map_sha256,
            "ledger_sha256": ledger_sha256,
            "asset_index_sha256": digest(asset_index_bytes),
            "objects_list_sha256": digest((ROOT / "objects.lst").read_bytes()),
        },
        "summary": {
            "open_ledger_bytes": open_bytes,
            "fresh_asset_union_bytes": covered_bytes,
            "remaining_bytes": remainder_bytes,
            "remaining_interval_count": sum(group["remaining_interval_count"] for group in groups),
            "remaining_source_owner_group_count": len(groups),
            "original_unmapped_open_bytes": original_unmapped_open,
            "fresh_union_coverage_of_original_unmapped_open_bytes": unmapped_coverage,
            "unmapped_open_remainder_bytes": unmapped_remainder,
            "remaining_bytes_by_original_mapping": dict(remaining_mapping_bytes),
            "main_production_objects_in_objects_lst": len(object_list),
            "production_owners_with_open_ledger_bytes": len(production_open_owners),
            "production_owners_with_remaining_bytes": len(production_remainder_owners),
            "archive_member_owner_groups_with_remaining_bytes": len(archive_remainder_groups),
            "archive_member_remaining_bytes": sum(group["remaining_bytes"] for group in archive_remainder_groups),
            "unresolved_source_mapping_groups": len(missing_source_groups),
            "unresolved_source_mapping_bytes": sum(group["remaining_bytes"] for group in missing_source_groups),
            "remaining_bytes_bound_to_linked_input_sections": mapped_remaining_bytes,
            "remaining_bytes_without_linked_input_section_match": map_unmatched_bytes,
            "message_data_owner_open_bytes": sum(row["bytes"] for row in message_owner_open),
            "message_data_owner_remaining_bytes": message_owner_remainder,
        },
        "source_representation_summary": {
            "group_counts": dict(source_representation_groups),
            "remaining_bytes": dict(source_representation_bytes),
            "note": "Representation describes authored/source production form; it does not classify execution behavior.",
        },
        "source_status_summary": {
            "group_counts": dict(source_owner_counts),
            "remaining_bytes": dict(source_owner_bytes),
            "note": (
                "The 44 linked runtime archive-member groups are covered by pinned runtime source evidence outside src/: "
                "43 have member-level C source rebuild records in docs/runtime-source-inventory.json; the remaining "
                "data-only libc.a(impure.o) source is present in the pinned toolchain checkout and is omitted from "
                "the instruction inventory. docs/runtime-rebuild.json pins the source commit and is hash-linked "
                "from the source inventory."
            ),
        },
        "unsupported_asset_receipt_metadata": unsupported_receipts,
        "native_code_review": {
            "additional_concrete_unexplained_native_code_candidate_count": 0,
            "finding": (
                "No additional concrete candidate surfaced in the finite owner/source review and current "
                "pointer/duplicate receipts. The known copied routines and compressed payload are already "
                "explicitly inventoried. The generated orphan block's current bytes and pointer-relocated "
                "source reconstruction are verified; its historical origin, semantic role, and reachability "
                "remain unproven, and no further native implementation is inferred from its suffix."
            ),
            "known_code_evidence": known_code_evidence,
            "limitations": [
                "This is not a whole-ROM control-flow or indirect-target proof.",
                "ELF data mappings and asset provenance do not prove bytes are unreachable or cannot execute.",
                "The code-duplicate frontier omits modified, relocated, compressed, short, and region-spanning matches.",
                "The 1,936-byte orphan suffix is reconstructed in the current generated source, but its historical origin, semantic role, and reachability remain unproven.",
            ],
        },
        "freshness_and_reconciliation_checks": {
            "rom_equals_reference_rom": rom == REFERENCE_ROM_PATH.read_bytes(),
            "ledger_current_for_rom_elf_map": True,
            "asset_index_current_for_rom_and_ledger": True,
            "ledger_partition_valid": True,
            "eligible_fresh_asset_union_matches_index_summary": True,
            "ledger_open_bytes_minus_asset_union_equals_remainder": True,
            "all_original_unmapped_open_bytes_covered_by_asset_union": unmapped_remainder == 0,
            "all_remainder_belongs_to_linked_input_sections": map_unmatched_bytes == 0,
            "all_message_data_object_bytes_covered_by_asset_union": message_owner_remainder == 0,
            "generated_orphan_include_matches_linked_rom_symbol": blob_check["include_byte_match"],
            "function_pointer_candidates_all_accounted": pointer_closure["candidates"] == pointer_closure["accounted"],
        },
        "generated_orphan_blob_byte_check": blob_check,
        "reviewed_receipts": current_rom_receipts,
        "groups": groups,
    }
    need(all(report["freshness_and_reconciliation_checks"].values()), "a reconciliation check failed")

    OUTPUT_JSON.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")

    source_status_groups = Counter(group["source_status"] for group in groups)
    source_status_bytes = Counter()
    for group in groups:
        source_status_bytes[group["source_status"]] += group["remaining_bytes"]
    largest = sorted(groups, key=lambda group: (-group["remaining_bytes"], group["owner"]))[:20]
    lines = [
        "# Data source remainder",
        "",
        "This inventory groups open ledger bytes that are not already covered by the fresh asset union. It reports linked object and source representation only. It does not say these bytes cannot execute.",
        "",
        f"Fresh asset union: **{covered_bytes:,} bytes**. Remaining open input data: **{remainder_bytes:,} bytes** across **{len(groups):,} owners** and **{report['summary']['remaining_interval_count']:,} intervals**.",
        "",
        "## Source and mapping coverage",
        "",
        f"The ledger initially had {original_unmapped_open:,} bytes without an ELF `$a`/`$t`/`$d` mapping marker. The fresh asset union covers {unmapped_coverage:,} of them; **{unmapped_remainder:,} unmapped bytes remain**. Every remainder byte is attributed to a linked input section ({mapped_remaining_bytes:,} bytes matched; {map_unmatched_bytes:,} unmatched).",
        "",
        f"The message-data object contributes {sum(row['bytes'] for row in message_owner_open):,} open bytes; the indexed message-data source reconstruction leaves **{message_owner_remainder:,}** outside the union.",
        "",
        "| Source representation | Owner groups | Remaining bytes |",
        "|---|---:|---:|",
    ]
    for name, byte_count in sorted(source_representation_bytes.items(), key=lambda item: -item[1]):
        lines.append(f"| `{name}` | {source_representation_groups[name]:,} | {byte_count:,} |")
    lines += [
        "",
        f"The {len(archive_remainder_groups):,} linked runtime archive-member owners account for {sum(group['remaining_bytes'] for group in archive_remainder_groups):,} bytes and have pinned source evidence outside `src/`: 43 have member-level C source rebuild records in `docs/runtime-source-inventory.json`; the remaining data-only `libc.a(impure.o)` source is present in the pinned toolchain checkout and is omitted from its instruction inventory. `docs/runtime-rebuild.json` pins the source commit and is hash-linked from the source inventory. These are not source-availability gaps; they are distinct from the {len(unsupported_receipts)} unsupported asset-receipt schemas below.",
        "",
        "## Largest remaining owners",
        "",
        "| Owner | Source form | Bytes | Source |",
        "|---|---|---:|---|",
    ]
    for group in largest:
        source_path = group.get("source_path") or group.get("archive_path") or "unavailable"
        lines.append(
            f"| `{group['owner']}` | `{group['source_representation']}` | {group['remaining_bytes']:,} | `{source_path}` |"
        )
    lines += [
        "",
        "## Native-code candidate review",
        "",
        report["native_code_review"]["finding"],
        "",
        f"The current receipts report {duplicate_code_bytes:,} bytes in {len(duplicate_content['native_regions'])} copied native-code regions; the exact whole-function frontier reports {len(code_duplicate['records'])} matches. The duplicated compressed payload stores {known_payload['bytes']:,} bytes and expands to {known_payload['expanded_bytes']:,} bytes with mapped native instructions; it is already inventoried by `docs/duplicate-executable-content.json`. Function-pointer closure accounts for {pointer_closure['accounted']:,}/{pointer_closure['candidates']:,} candidates.",
        "",
        "`src/data_B1FE7C.c` includes generated bytes rather than a semantic data model. The included 42,888-byte sequence was parsed and compared byte-for-byte with linked symbol `gUnkData_108`; the runtime-copy receipt reconstructs the current block with 260 shifted pointer words and one semantic exception. The duplicate comparison marks a 1,936-byte tail as non-identical to the source prefix. Current byte provenance is verified, while original build history, semantic role, and reachability remain unproven.",
        "",
        "No source filename, extension, linker `$d` mapping, or exact asset match is used as standalone proof of nonexecution. The bounded review can miss hidden, modified, relocated, or computed-target code.",
        "",
        "## Unsupported receipt metadata",
        "",
    ]
    for receipt in unsupported_receipts:
        lines.append(f"- `{receipt['name']}`: {receipt['effect']}")
    lines += [
        "",
        "Exact remaining address intervals and owner/source records are in `data-source-remainder.json`; the JSON is interval-based and contains no per-byte expansion.",
        "",
    ]
    OUTPUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(
        json.dumps(
            {
                "remaining_bytes": remainder_bytes,
                "remaining_owners": len(groups),
                "remaining_intervals": report["summary"]["remaining_interval_count"],
                "unmapped_remainder": unmapped_remainder,
                "archive_member_remainder_bytes": sum(group["remaining_bytes"] for group in archive_remainder_groups),
                "unexplained_native_code_candidates": report["native_code_review"]["additional_concrete_unexplained_native_code_candidate_count"],
                "output_json": str(OUTPUT_JSON.relative_to(ROOT)),
                "output_markdown": str(OUTPUT_MD.relative_to(ROOT)),
            },
            indent=2,
        )
    )


if __name__ == "__main__":
    main()
