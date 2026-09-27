#!/usr/bin/env python3
"""Index receipt-backed source-data intervals against the current ROM ledger.

This reports byte provenance only. It deliberately does not infer execution
classification from asset names, extensions, symbols, or source declarations.
"""
from __future__ import annotations

import hashlib
import json
import re
import subprocess
import sys
import tempfile
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BASE = 0x08000000
OUT_JSON = ROOT / "docs/asset-provenance-index.json"
OUT_MD = ROOT / "docs/asset-provenance-index.md"


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def load_json(path: Path):
    return json.loads(path.read_text())


def addr(value) -> int:
    return int(value, 16) if isinstance(value, str) else int(value)


def rel(path: str) -> str:
    return path[2:] if path.startswith("./") else path


class Audit:
    def __init__(self, rom: bytes, ledger: dict, root: Path = ROOT):
        self.rom = rom
        self.ledger = ledger
        self.root = root
        self.file_cache: dict[str, tuple[bytes | None, str | None]] = {}
        self.receipts: dict[str, dict] = {}
        self.intervals: list[dict] = []
        self.unmatched: list[dict] = []

    def receipt(self, name: str, support: str, note: str) -> dict:
        path = self.root / "docs" / f"{name}.json"
        if name in self.receipts:
            return self.receipts[name]
        try:
            doc = load_json(path)
            digest = sha(path.read_bytes())
            state = "unknown"
            error = None
        except Exception as exc:
            doc = {}
            digest = None
            state = "stale"
            error = f"could not read receipt: {exc}"
        result = dict(
            name=name,
            path=f"docs/{name}.json",
            support_status=support,
            note=note,
            receipt_sha256=digest,
            freshness_status=state,
            freshness_checks=[],
            indexed_interval_count=0,
            unmatched_entry_count=0,
            unmatched_entries=[],
        )
        if error:
            result["error"] = error
        self.receipts[name] = result
        result["_doc"] = doc
        return result

    def check_hash(self, name: str, label: str, expected: str | None, path: str | Path):
        receipt = self.receipts[name]
        p = Path(path)
        if not p.is_absolute():
            p = self.root / p
        actual = None
        status = "missing_expected_hash"
        if expected:
            try:
                data, actual = self.file_data(p)
                status = "match" if actual == expected else "mismatch"
                if data is None:
                    status = "missing_file"
            except Exception as exc:
                status = f"read_error: {exc}"
        check = dict(label=label, path=str(p.relative_to(self.root)) if p.is_relative_to(self.root) else str(p),
                     expected_sha256=expected, actual_sha256=actual, status=status)
        receipt["freshness_checks"].append(check)
        return status

    def file_data(self, path: str | Path) -> tuple[bytes | None, str | None]:
        p = Path(path)
        if not p.is_absolute():
            p = self.root / p
        key = str(p)
        if key not in self.file_cache:
            try:
                data = p.read_bytes()
                self.file_cache[key] = (data, sha(data))
            except OSError:
                self.file_cache[key] = (None, None)
        return self.file_cache[key]

    def add_unmatched(self, name: str, entry: str, reason: str, byte_count: int | None = None,
                      detail: dict | None = None):
        item = dict(receipt=name, entry=entry, reason=reason)
        if byte_count is not None:
            item["bytes"] = byte_count
        if detail:
            item["detail"] = detail
        self.unmatched.append(item)
        receipt = self.receipts[name]
        receipt["unmatched_entries"].append({k: v for k, v in item.items() if k != "receipt"})
        receipt["unmatched_entry_count"] += 1

    def add_interval(self, name: str, entry: str, start: int, end: int, *,
                     source_kind: str, source_path: str | None = None,
                     expected_source_sha256: str | None = None,
                     expected_rom_sha256: str | None = None,
                     source_bytes: bytes | None = None,
                     source_dependencies: list[str] | None = None,
                     extra: dict | None = None):
        receipt = self.receipts[name]
        size = end - start
        valid_range = 0 <= start - BASE <= end - BASE <= len(self.rom) and size > 0
        actual_rom = sha(self.rom[start - BASE:end - BASE]) if valid_range else None
        source_digest = None
        source_status = "not_applicable"
        source_data = source_bytes
        if source_path:
            source_data, source_digest = self.file_data(source_path)
            if source_data is None:
                source_status = "missing_file"
                self.check_hash(name, f"{entry} source", expected_source_sha256, source_path)
            elif expected_source_sha256:
                check_status = self.check_hash(name, f"{entry} source", expected_source_sha256, source_path)
                source_status = "fresh" if check_status == "match" else "stale"
            else:
                source_status = "unhashed_source"
        elif source_bytes is not None:
            source_digest = sha(source_bytes)
            source_status = "derived_bytes"

        if source_data is not None and valid_range and len(source_data) == size:
            source_matches_rom = self.rom[start - BASE:end - BASE] == source_data
        else:
            source_matches_rom = None
        if expected_rom_sha256:
            rom_status = "match" if actual_rom == expected_rom_sha256 else "mismatch"
        elif source_matches_rom is not None:
            rom_status = "match" if source_matches_rom else "mismatch"
        else:
            rom_status = "unverified"

        # Keep provenance and execution classification independent.
        item = dict(
            id=f"{name}:{entry}",
            receipt=name,
            entry=entry,
            source_kind=source_kind,
            start=hex(start),
            end=hex(end),
            bytes=size,
            source_path=rel(source_path) if source_path else None,
            source_dependencies=source_dependencies or [],
            expected_source_sha256=expected_source_sha256,
            actual_source_sha256=source_digest,
            source_status=source_status,
            expected_rom_sha256=expected_rom_sha256,
            actual_rom_sha256=actual_rom,
            rom_status=rom_status,
            source_rom_byte_match=source_matches_rom,
            range_status="valid" if valid_range else "out_of_bounds_or_empty",
        )
        if extra:
            item.update(extra)
        self.intervals.append(item)
        receipt["indexed_interval_count"] += 1

    def finalize_receipts(self):
        for receipt in self.receipts.values():
            checks = receipt["freshness_checks"]
            states = [x["status"] for x in checks]
            if receipt.get("error"):
                receipt["freshness_status"] = "stale"
            elif not states:
                receipt["freshness_status"] = "unknown"
            elif any(state != "match" for state in states):
                receipt["freshness_status"] = "stale"
            else:
                receipt["freshness_status"] = "fresh"
            receipt["freshness_check_count"] = len(checks)
            receipt["stale_check_count"] = sum(x["status"] != "match" for x in checks)
            receipt.pop("_doc", None)


def receipt_dep(audit: Audit, name: str, doc: dict, field: str, path: str):
    return audit.check_hash(name, field, doc.get(field), path)


def asset_source(audit: Audit, receipt_name: str, entry: str, asset: str,
                 start: int, size: int, expected_sha: str | None,
                 *, source_kind: str, extra: dict | None = None,
                 source_dependencies: list[str] | None = None):
    p = rel(asset)
    data, actual = audit.file_data(p)
    if data is None:
        audit.add_unmatched(receipt_name, entry, "source asset file is missing", size,
                            {"asset": p, "start": hex(start)})
        audit.check_hash(receipt_name, f"{entry} source", expected_sha, p)
        return
    if len(data) != size:
        audit.add_unmatched(receipt_name, entry, "source asset size differs from claimed ROM interval", size,
                            {"asset": p, "source_bytes": len(data), "start": hex(start)})
        audit.check_hash(receipt_name, f"{entry} source", expected_sha, p)
        return
    audit.add_interval(receipt_name, entry, start, start + size, source_kind=source_kind,
                       source_path=p, expected_source_sha256=expected_sha,
                       expected_rom_sha256=expected_sha, source_dependencies=source_dependencies,
                       extra=extra)


def check_rom_map_elf(audit: Audit, name: str, doc: dict):
    for field, path in (("rom_sha256", "fireemblem8.gba"),
                        ("elf_sha256", "fireemblem8.elf"),
                        ("map_sha256", "fireemblem8.map")):
        if field in doc:
            receipt_dep(audit, name, doc, field, path)


def index_banim_data(audit: Audit, banim_receipt: dict) -> dict[str, dict]:
    name = "banim-data-classification"
    note = "Addressed asset rows are checked against source files and ROM bytes. This is provenance evidence only."
    r = audit.receipt(name, "supported_intervals", note)
    d = r["_doc"]
    receipt_dep(audit, name, d, "script_sha256", "linker_script_banim.txt")
    receipt_dep(audit, name, d, "elf_sha256", "fireemblem8.elf")
    receipt_dep(audit, name, d, "map_sha256", "fireemblem8.map")
    assets: dict[str, dict] = {}
    for i, row in enumerate(d.get("assets", [])):
        path = rel(row.get("path", ""))
        if not path or "start" not in row or "bytes" not in row:
            audit.add_unmatched(name, f"assets[{i}]", "asset row lacks a path or explicit interval", row.get("bytes"))
            continue
        size = int(row["bytes"])
        start = addr(row["start"])
        expected = row.get("sha256")
        entry = f"{path}@{row['start']}"
        asset_source(audit, name, entry, path, start, size, expected,
                     source_kind=f"battle_animation_{row.get('kind','asset')}",
                     extra={"asset_kind": row.get("kind"), "expanded_bytes": row.get("expanded_bytes"),
                            "expanded_sha256": row.get("expanded_sha256")})
        if path in assets:
            audit.add_unmatched(name, f"assets[{i}]", "duplicate source path in base receipt", size,
                                {"path": path})
        assets[path] = row
    return assets


def index_banim_graphics(audit: Audit, base_assets: dict[str, dict]):
    name = "banim-graphics-rebuild"
    r = audit.receipt(name, "supported_supplement", "Rebuild receipt joins to the addressed battle-animation assets; it adds no separate physical interval rows.")
    d = r["_doc"]
    receipt_dep(audit, name, d, "gbagfx_sha256", "tools/gbagfx/gbagfx")
    receipt_dep(audit, name, d, "elf_sha256", "fireemblem8.elf")
    base = audit.receipts["banim-data-classification"]
    if d.get("asset_receipt_sha256"):
        audit.check_hash(name, "asset_receipt_sha256", d.get("asset_receipt_sha256"), ROOT / base["path"])
    joined = 0
    for i, row in enumerate(d.get("assets", [])):
        path = rel(row.get("path", ""))
        base_row = base_assets.get(path)
        if not base_row:
            audit.add_unmatched(name, f"assets[{i}]", "no addressed base asset row", row.get("compressed_bytes"), {"path": path})
            continue
        if (row.get("compressed_bytes") != base_row.get("bytes") or
                row.get("compressed_sha256") != base_row.get("sha256")):
            audit.add_unmatched(name, f"assets[{i}]", "rebuild row differs from addressed base asset", row.get("compressed_bytes"), {"path": path})
            continue
        if row.get("source") and row.get("source_sha256"):
            status = audit.check_hash(name, f"assets[{i}] source", row["source_sha256"], rel(row["source"]))
            if status != "match":
                audit.add_unmatched(name, f"assets[{i}]", "rebuild source hash is stale", row.get("compressed_bytes"), {"path": path, "source": row["source"]})
                continue
        joined += 1
    r["joined_asset_count"] = joined
    r["unjoined_asset_count"] = len(d.get("assets", [])) - joined


def index_banim_source_rebuild(audit: Audit, base_assets: dict[str, dict]):
    name = "banim-source-rebuild"
    r = audit.receipt(name, "supported_supplement", "Source section hashes join to the addressed compressed or raw battle-animation asset records; no separate physical interval rows.")
    d = r["_doc"]
    receipt_dep(audit, name, d, "elf_sha256", "fireemblem8.elf")
    receipt_dep(audit, name, d, "linker_script_sha256", "linker_script_banim.txt")
    for path, expected in d.get("macro_headers", {}).items():
        audit.check_hash(name, f"macro header {path}", expected, path)
    joined = 0
    unmatched = 0
    for i, source in enumerate(d.get("sources", [])):
        source_path = rel(source.get("source", ""))
        source_hash = source.get("source_sha256")
        source_status = audit.check_hash(name, f"sources[{i}]", source_hash, source_path)
        if source_status != "match":
            audit.add_unmatched(name, f"sources[{i}]", "assembly source hash is stale", detail={"source": source_path})
            unmatched += len(source.get("sections", []))
            continue
        for j, section in enumerate(source.get("sections", [])):
            digest = section.get("sha256")
            size = section.get("bytes")
            matches = [p for p, a in base_assets.items()
                       if ((a.get("bytes") == size and a.get("sha256") == digest) or
                           (a.get("expanded_bytes") == size and a.get("expanded_sha256") == digest))]
            if matches:
                joined += 1
            else:
                audit.add_unmatched(name, f"sources[{i}].sections[{j}]",
                                    "section hash does not resolve uniquely to a base asset receipt row",
                                    size, {"source": source_path, "section": section.get("section"),
                                           "matching_assets": len(matches)})
                unmatched += 1
    r["joined_section_count"] = joined
    r["unjoined_section_count"] = unmatched


def parse_c_ints(text: str) -> list[int]:
    return [int(value.strip(), 0) for value in text.split(",") if value.strip()]


def decode_message(data: bytes, tree: list[int], root: int) -> list[int]:
    node = root
    tokens: list[int] = []
    for bit in range(len(data) * 8):
        value = tree[node]
        node = (value >> 16) & 0xFFFF if (data[bit // 8] >> (bit % 8)) & 1 else value & 0xFFFF
        if node >= len(tree):
            raise ValueError("invalid Huffman child")
        value = tree[node]
        if value >> 16 == 0xFFFF:
            token = value & 0xFFFF
            tokens.append(token)
            node = root
            if token == 0:
                if (bit + 8) // 8 != len(data):
                    raise ValueError("unused compressed bytes after terminator")
                return tokens
    raise ValueError("unterminated message")


def read_symbols(elf: Path) -> dict[str, tuple[int, int]]:
    result = subprocess.run(["arm-none-eabi-readelf", "-sW", str(elf)], check=True,
                            capture_output=True, text=True).stdout
    symbols = {}
    for line in result.splitlines():
        fields = line.split()
        if len(fields) >= 8 and fields[0].rstrip(":").isdigit() and fields[3] == "OBJECT":
            symbols[fields[7]] = (int(fields[1], 16), int(fields[2]))
    return symbols


def index_messages(audit: Audit):
    name = "message-data-classification"
    r = audit.receipt(name, "supported_reconstructed_intervals", "Per-message addresses are reconstructed from current linked ELF symbols and generated source, then checked against each receipt stream hash, decoded-token hash, ROM bytes, object extent, and zero alignment.")
    d = r["_doc"]
    for field, path in (("source_sha256", "src/msg_data.c"),
                        ("header_sha256", "include/constants/msg.h"),
                        ("elf_sha256", "fireemblem8.elf"),
                        ("map_sha256", "fireemblem8.map")):
        receipt_dep(audit, name, d, field, path)
    try:
        source_path = ROOT / "src/msg_data.c"
        text = source_path.read_text()
        arrays = {}
        for symbol, body in re.findall(r"static const u8 (CompressedText_MSG_[0-9A-F]+)\[\] = \{([^}]+)\};", text):
            arrays[symbol] = bytes(parse_c_ints(body))
        tree_body = re.search(r"const u32 gMsgHuffmanTable\[\] = \{([^}]+)\};", text, re.S)
        root_match = re.search(r"gMsgHuffmanTableRoot = gMsgHuffmanTable \+ (0x[0-9A-Fa-f]+|[0-9]+);", text)
        ptr_body = re.search(r"const u8 \* const gMsgTable\[\] = \{([^}]+)\};", text, re.S)
        if not tree_body or not root_match or not ptr_body:
            raise ValueError("generated message table declarations were not found")
        tree = parse_c_ints(tree_body.group(1))
        root = int(root_match.group(1), 0)
        names = [item.strip() for item in ptr_body.group(1).split(",") if item.strip()]
        symbols = read_symbols(ROOT / "fireemblem8.elf")
        map_module = ROOT / "scripts"
        sys.path.insert(0, str(map_module))
        from audit_linked_code import read_contributions
        contributions = read_contributions((ROOT / "fireemblem8.map").read_text())
        sections = [x for x in contributions if x["object"] == "src/msg_data.o"]
        if len(sections) != 1:
            raise ValueError(f"expected one message object contribution, found {len(sections)}")
        section = sections[0]
        expected_rows = {row["name"]: row for row in d.get("messages_detail", [])}
        if set(expected_rows) != set(arrays) or len(names) != len(arrays):
            raise ValueError("receipt, source arrays, and pointer table names differ")
        if d.get("messages") != len(arrays) or d.get("huffman_nodes") != len(tree):
            raise ValueError("receipt message or Huffman-node count is stale")
        message_intervals = []
        for symbol, data in arrays.items():
            if symbol not in symbols:
                raise ValueError(f"missing linked symbol {symbol}")
            start, size = symbols[symbol]
            if size != len(data):
                raise ValueError(f"ELF size mismatch for {symbol}")
            row = expected_rows[symbol]
            if row.get("compressed_bytes") != len(data):
                raise ValueError(f"receipt size mismatch for {symbol}")
            tokens = decode_message(data, tree, root)
            decoded_hash = sha(b"".join(token.to_bytes(2, "little") for token in tokens))
            if decoded_hash != row.get("decoded_sha256") or len(tokens) != row.get("decoded_tokens"):
                raise ValueError(f"decoded receipt mismatch for {symbol}")
            message_intervals.append((start, start + size, symbol, data))
        if sum(len(x[3]) for x in message_intervals) != d.get("compressed_message_bytes"):
            raise ValueError("compressed message byte total differs from receipt")

        # Recreate the linked Huffman tree, root pointer and string-pointer table.
        tree_data = b"".join(value.to_bytes(4, "little") for value in tree)
        table_data = b"".join(symbols[symbol][0].to_bytes(4, "little") for symbol in names)
        root_data = (symbols["gMsgHuffmanTable"][0] + root * 4).to_bytes(4, "little")
        other = [
            ("gMsgHuffmanTable", tree_data, "huffman_tree"),
            ("gMsgHuffmanTableRoot", root_data, "huffman_root_pointer"),
            ("gMsgTable", table_data, "message_pointer_table"),
        ]
        for symbol, data, kind in other:
            if symbol not in symbols:
                raise ValueError(f"missing linked symbol {symbol}")
            start, size = symbols[symbol]
            if size != len(data):
                raise ValueError(f"ELF size mismatch for {symbol}")
            if kind == "huffman_tree" and len(data) // 4 != d.get("huffman_nodes"):
                raise ValueError("Huffman tree length differs from receipt")
            if kind == "message_pointer_table" and len(data) != d.get("pointer_table_bytes"):
                raise ValueError("pointer table length differs from receipt")
            message_intervals.append((start, start + size, symbol, data, kind))

        message_intervals.sort(key=lambda x: x[0])
        cursor = section["start"]
        alignment_bytes = 0
        for row in message_intervals:
            start, end, symbol, data = row[:4]
            kind = row[4] if len(row) > 4 else "compressed_message"
            if start < cursor or end > section["end"]:
                raise ValueError(f"overlapping or out-of-section message symbol {symbol}")
            gap = start - cursor
            if gap:
                zeroes = audit.rom[cursor - BASE:start - BASE]
                if gap > 3 or zeroes != bytes(gap):
                    raise ValueError(f"nonzero or oversized message-section gap before {symbol}")
                alignment_bytes += gap
                audit.add_interval(name, f"zero_alignment@{hex(cursor)}", cursor, start,
                                   source_kind="verified_zero_alignment",
                                   expected_rom_sha256=sha(zeroes),
                                   source_dependencies=["src/msg_data.c", "fireemblem8.map"],
                                   extra={"alignment_bytes": gap})
            actual = audit.rom[start - BASE:end - BASE]
            if actual != data:
                raise ValueError(f"ROM differs from generated source for {symbol}")
            audit.add_interval(name, symbol, start, end,
                               source_kind=kind,
                               source_bytes=data,
                               expected_rom_sha256=sha(data),
                               source_dependencies=["src/msg_data.c"],
                               extra={"symbol": symbol})
            cursor = end
        gap = section["end"] - cursor
        if gap:
            zeroes = audit.rom[cursor - BASE:section["end"] - BASE]
            if gap > 3 or zeroes != bytes(gap):
                raise ValueError("nonzero or oversized terminal message-section gap")
            alignment_bytes += gap
            audit.add_interval(name, f"zero_alignment@{hex(cursor)}", cursor, section["end"],
                               source_kind="verified_zero_alignment", expected_rom_sha256=sha(zeroes),
                               source_dependencies=["src/msg_data.c", "fireemblem8.map"],
                               extra={"alignment_bytes": gap})
        if cursor + gap != section["end"] or alignment_bytes != d.get("internal_alignment_bytes"):
            raise ValueError("message alignment total differs from receipt")
        if section["end"] - section["start"] != d.get("object_bytes"):
            raise ValueError("message object extent differs from receipt")
        r["reconstructed_message_count"] = len(message_intervals) - len(other)
        r["reconstructed_structure_count"] = len(other)
        r["reconstructed_alignment_bytes"] = alignment_bytes
        r["reconstruction_status"] = "verified"
    except Exception as exc:
        audit.intervals = [x for x in audit.intervals if x["receipt"] != name]
        r["indexed_interval_count"] = 0
        r["support_status"] = "unsupported_reconstruction_failed"
        r["reconstruction_status"] = "failed"
        r["reconstruction_error"] = str(exc)
        audit.add_unmatched(name, "message section reconstruction", "address/hash reconstruction failed", detail={"error": str(exc)})


def index_unmapped_assets(audit: Audit):
    name = "unmapped-asset-provenance"
    r = audit.receipt(name, "supported_intervals", "Source-declared binary asset bindings are checked byte-for-byte; residual rows remain explicit and may be covered by later receipts.")
    d = r["_doc"]
    receipt_dep(audit, name, d, "elf_sha256", "fireemblem8.elf")
    receipt_dep(audit, name, d, "map_sha256", "fireemblem8.map")
    for source, expected in d.get("sources", {}).items():
        audit.check_hash(name, f"source {source}", expected, source)
    for i, row in enumerate(d.get("bindings", [])):
        start, end = addr(row["start"]), addr(row["end"])
        source = rel(row["asset"])
        asset_source(audit, name, f"{row.get('object')}:{row.get('symbol')}@{row['start']}", source,
                     start, end - start, row.get("asset_sha256"),
                     source_kind="unmapped_source_asset",
                     extra={"object": row.get("object"), "symbol": row.get("symbol")})
    r["unbound_input_bytes"] = d.get("residual_bytes")
    r["unbound_input_interval_count"] = len(d.get("residual", []))
    r["_unbound_rows"] = d.get("residual", [])


def final_source_for_record(row: dict) -> str | None:
    obj = row.get("object", "")
    if obj == ".deps/runtime-c/libc.a(vfprintf.o)":
        return ".deps/agbcc/libc/stdio/vfprintf.c"
    if obj == "asm/fe6sio.o":
        return "src/data/fe6_rom_header.inc"
    if obj.startswith("src/"):
        return obj[:-2] + ".c" if obj.endswith(".o") else None
    return None


def index_final_unmapped(audit: Audit):
    name = "final-unmapped-provenance"
    r = audit.receipt(name, "supported_intervals", "Fresh-source or explicit-source residual records are hash-checked against ROM bytes; the compiler, ELF, map, and source pins are checked when present.")
    d = r["_doc"]
    receipt_dep(audit, name, d, "elf_sha256", "fireemblem8.elf")
    receipt_dep(audit, name, d, "map_sha256", "fireemblem8.map")
    if d.get("compiler_sha256"):
        receipt_dep(audit, name, d, "compiler_sha256", "tools/agbcc/bin/agbcc")
    for i, row in enumerate(d.get("records", [])):
        start, end = addr(row["start"]), addr(row["end"])
        path = final_source_for_record(row)
        expected_source = row.get("source_sha256")
        if not path:
            audit.add_unmatched(name, f"records[{i}]", "source path cannot be resolved", row.get("bytes"), {"object": row.get("object")})
            continue
        audit.add_interval(name, f"{row.get('object')}@{row['start']}", start, end,
                           source_kind="final_unmapped_source_rebuild",
                           source_path=path, expected_source_sha256=expected_source,
                           expected_rom_sha256=row.get("sha256"),
                           source_dependencies=[path, "fireemblem8.elf", "fireemblem8.map"],
                           extra={"object": row.get("object"), "method": row.get("method"), "section": row.get("section")})


def index_sound_samples(audit: Audit):
    name = "sound-sample-data"
    r = audit.receipt(name, "supported_intervals", "Current indexed .bin source hashes, ROM bytes, direct-sound assembly source hash, and converter source hash are checked. The receipt has no AIFF input hashes, so unchanged AIFF inputs are not independently certified.")
    d = r["_doc"]
    receipt_dep(audit, name, d, "source_sha256", "sound/direct_sound_data.s")
    receipt_dep(audit, name, d, "converter_source_sha256", "tools/aif2pcm/main.c")
    region_start = addr(d["region_start"])
    region_end = region_start + int(d["region_bytes"])
    rows = sorted(d.get("records_detail", []), key=lambda x: addr(x["address"]))
    cursor = region_start
    padding = 0
    for i, row in enumerate(rows):
        start = addr(row["address"])
        size = int(row["bytes"])
        if start < cursor or start + size > region_end:
            audit.add_unmatched(name, f"records_detail[{i}]", "sample interval overlaps or exceeds the declared region", size, {"symbol": row.get("symbol")})
            continue
        gap = start - cursor
        if gap:
            data = audit.rom[cursor - BASE:start - BASE]
            if data != bytes(gap):
                audit.add_unmatched(name, f"alignment_before_{row.get('symbol')}", "alignment bytes are not all zero", gap)
            else:
                padding += gap
                audit.add_interval(name, f"zero_alignment@{hex(cursor)}", cursor, start,
                                   source_kind="verified_zero_alignment", expected_rom_sha256=sha(data),
                                   source_dependencies=["sound/direct_sound_data.s"],
                                   extra={"alignment_bytes": gap})
        asset_source(audit, name, row.get("symbol", f"record_{i}"), row["source"], start,
                     size, row.get("sha256"), source_kind="direct_sound_wave_data",
                     extra={"symbol": row.get("symbol"), "sample_count": row.get("sample_count"),
                            "looped": row.get("looped")})
        cursor = start + size
    tail = region_end - cursor
    if tail:
        data = audit.rom[cursor - BASE:region_end - BASE]
        if data != bytes(tail):
            audit.add_unmatched(name, "terminal_alignment", "terminal region bytes are not all zero", tail)
        else:
            padding += tail
            audit.add_interval(name, f"zero_alignment@{hex(cursor)}", cursor, region_end,
                               source_kind="verified_zero_alignment", expected_rom_sha256=sha(data),
                               source_dependencies=["sound/direct_sound_data.s"],
                               extra={"alignment_bytes": tail})
    if padding != d.get("alignment_bytes") or len(rows) != d.get("records"):
        audit.add_unmatched(name, "aggregate", "record count or alignment total differs from receipt",
                            detail={"records": len(rows), "expected_records": d.get("records"),
                                    "alignment_bytes": padding, "expected_alignment_bytes": d.get("alignment_bytes")})
    r["indexed_sample_count"] = sum(1 for x in rows if (ROOT / rel(x["source"])).is_file())
    r["indexed_alignment_bytes"] = padding


def index_sound_references(audit: Audit):
    name = "sound-sample-references"
    r = audit.receipt(name, "supported_supplement", "Instrument pointer records join to the source sample inventory; the receipt has no sample extents of its own.")
    d = r["_doc"]
    if d.get("sample_receipt_sha256"):
        audit.check_hash(name, "sample_receipt_sha256", d.get("sample_receipt_sha256"), ROOT / audit.receipts["sound-sample-data"]["path"])
    audit.check_hash(name, "macro_source_sha256", d.get("macro_source_sha256"), "asm/macros/music_voice.inc")
    sample_names = {row.get("symbol") for row in audit.receipts["sound-sample-data"]["_doc"].get("records_detail", [])}
    unknown = [row.get("sample") for row in d.get("records", []) if row.get("sample") not in sample_names]
    r["reference_record_count"] = len(d.get("records", []))
    r["unresolved_sample_name_count"] = len(unknown)
    if unknown:
        audit.add_unmatched(name, "records", "instrument reference names are absent from sample receipt", detail={"examples": unknown[:10]})


def index_sound_relocations(audit: Audit):
    name = "sound-relocations"
    r = audit.receipt(name, "supported_supplement", "Relocation and pointer-word evidence supplements sample intervals; it is not a separate asset extent receipt.")
    d = r["_doc"]
    check_rom_map_elf(audit, name, d)
    if d.get("reference_receipt_sha256"):
        audit.check_hash(name, "reference_receipt_sha256", d.get("reference_receipt_sha256"), ROOT / audit.receipts["sound-sample-references"]["path"])
    r["relocation_count"] = len(d.get("relocations", []))
    r["verified_instrument_pointer_count"] = d.get("verified_instrument_pointers")


def index_residual_tables(audit: Audit, unmapped_doc: dict):
    name = "residual-table-provenance"
    r = audit.receipt(name, "supported_intervals", "Numeric tables have explicit addresses. Two binary graphics rows are located through their matching residual intervals in the unmapped-asset receipt.")
    d = r["_doc"]
    receipt_dep(audit, name, d, "terrain_source_sha256", "src/data_terrains.c")
    receipt_dep(audit, name, d, "terrain_header_sha256", "include/constants/terrains.h")
    receipt_dep(audit, name, d, "elf_sha256", "fireemblem8.elf")
    for i, row in enumerate(d.get("tables", [])):
        start, end = addr(row["start"]), addr(row["end"])
        audit.add_interval(name, f"{row.get('name')}@{hex(start)}", start, end,
                           source_kind="terrain_lookup_table", expected_rom_sha256=row.get("sha256"),
                           source_dependencies=["src/data_terrains.c", "include/constants/terrains.h"],
                           extra={"symbol": row.get("name"), "value_kind": row.get("kind")})
    residuals = unmapped_doc.get("residual", [])
    source_for_object = {
        "src/fontgrp.o": "src/fontgrp.c",
        "src/data/unit_icon/const_data_unit_icon_move.o": "src/data/unit_icon/const_data_unit_icon_move.s",
    }
    for i, row in enumerate(d.get("graphics", [])):
        candidates = [x for x in residuals if x.get("object") == row.get("object") and x.get("bytes") == row.get("bytes")]
        if len(candidates) != 1:
            audit.add_unmatched(name, f"graphics[{i}]", "graphics row does not resolve to one residual interval", row.get("bytes"), {"object": row.get("object"), "matches": len(candidates)})
            continue
        start, end = addr(candidates[0]["start"]), addr(candidates[0]["end"])
        source_path = source_for_object.get(row.get("object"))
        if source_path:
            audit.check_hash(name, f"graphics[{i}] source declaration", row.get("source_sha256"), source_path)
        asset_source(audit, name, f"{row.get('symbol')}@{hex(start)}", row["asset"], start,
                     end - start, row.get("sha256"), source_kind="residual_binary_asset",
                     extra={"object": row.get("object"), "symbol": row.get("symbol"),
                            "source_declaration": source_path})


def index_pointer_data_owners(audit: Audit, banim_assets: dict[str, dict]):
    name = "function-pointer-data-owners"
    r = audit.receipt(name, "supported_intervals", "Verified source-asset words are expanded to their complete source intervals and checked against ROM. Duplicate-asset rows require independent full-copy byte equality.")
    d = r["_doc"]
    if d.get("prior_sha256"):
        audit.check_hash(name, "prior_sha256", d.get("prior_sha256"), "docs/function-pointer-residuals.json")
    if d.get("unit_header_sha256"):
        audit.check_hash(name, "unit_header_sha256", d.get("unit_header_sha256"), "include/bmunit.h")
    for i, row in enumerate(d.get("records", [])):
        kind = row.get("classification")
        asset = row.get("asset")
        if kind in ("verified_incbin_asset_bytes", "verified_assembly_incbin_asset_bytes") and asset and row.get("asset_sha256"):
            start = addr(row["address"]) - int(row["asset_offset"])
            asset_source(audit, name, f"record[{i}]:{rel(asset)}@{hex(start)}", asset, start,
                         (ROOT / rel(asset)).stat().st_size if (ROOT / rel(asset)).is_file() else 0,
                         row.get("asset_sha256"), source_kind="pointer_owner_source_asset",
                         extra={"owner": row.get("owner"), "pointer_word_address": row.get("address"),
                                "asset_offset": row.get("asset_offset"), "classification": kind})
        elif kind == "verified_animation_asset_bytes" and asset:
            path = rel(asset)
            base = banim_assets.get(path)
            if not base:
                audit.add_unmatched(name, f"records[{i}]", "animation asset cannot join to base addressed receipt", 4, {"asset": path})
                continue
            asset_source(audit, name, f"record[{i}]:{path}@{base['start']}", path,
                         addr(base["start"]), int(base["bytes"]), base.get("sha256"),
                         source_kind="pointer_owner_animation_asset",
                         extra={"owner": row.get("owner"), "pointer_word_address": row.get("address"),
                                "asset_offset": row.get("asset_offset"), "classification": kind,
                                "joined_receipt": "banim-data-classification"})
        elif kind == "verified_duplicate_asset_bytes" and asset and row.get("asset_sha256"):
            path = rel(asset)
            data, digest = audit.file_data(path)
            if data is None or digest != row.get("asset_sha256"):
                audit.add_unmatched(name, f"records[{i}]", "duplicate source asset is missing or stale", 4, {"asset": path})
                audit.check_hash(name, f"records[{i}] asset", row.get("asset_sha256"), path)
                continue
            source_word = addr(row["source_address"])
            offset = int(row["asset_offset"])
            source_start = source_word - offset
            delta = addr(row["duplicate_delta"])
            duplicate_start = source_start + delta
            if source_start < BASE or source_start + len(data) > BASE + len(audit.rom):
                audit.add_unmatched(name, f"records[{i}]", "duplicate source asset range is outside ROM", len(data), {"asset": path})
                continue
            if audit.rom[source_start - BASE:source_start - BASE + len(data)] != data:
                audit.add_unmatched(name, f"records[{i}] source", "whole source asset does not match ROM", len(data), {"asset": path})
                continue
            asset_source(audit, name, f"record[{i}]:source:{path}@{hex(source_start)}", path,
                         source_start, len(data), row.get("asset_sha256"),
                         source_kind="duplicate_asset_source",
                         extra={"classification": kind, "duplicate_delta": hex(delta)})
            if duplicate_start != addr(row["address"]) - offset:
                audit.add_unmatched(name, f"records[{i}] duplicate", "derived duplicate interval disagrees with pointer-word offset", 4,
                                    {"derived_start": hex(duplicate_start), "address_minus_offset": hex(addr(row['address']) - offset)})
                continue
            asset_source(audit, name, f"record[{i}]:duplicate:{path}@{hex(duplicate_start)}", path,
                         duplicate_start, len(data), row.get("asset_sha256"),
                         source_kind="verified_full_duplicate_asset",
                         extra={"classification": kind, "source_start": hex(source_start), "duplicate_delta": hex(delta)})
        else:
            audit.add_unmatched(name, f"records[{i}]", "record is a locator or data classification, not a source-asset extent", 4,
                                {"classification": kind, "address": row.get("address")})


def index_other_receipts(audit: Audit):
    # These receipts are deliberately inventoried as unsupported for physical
    # source-asset extents. Their evidence concerns copied bytes, references, or
    # semantics and remains separate from this byte-provenance index.
    specs = {
        "function-pointer-residuals": "Pointer candidates and payload matches do not identify complete source-asset extents.",
        "orphan-duplicate": "Copy relationships and mixed duplicate contents are not source-asset provenance.",
        "orphan-runtime-copy": "Reconstructed runtime-copy relationships are not source-asset provenance.",
    }
    for name, note in specs.items():
        r = audit.receipt(name, "unsupported_extent_receipt", note)
        d = r["_doc"]
        check_rom_map_elf(audit, name, d)
        if name == "function-pointer-residuals" and d.get("prior_receipt_sha256"):
            audit.check_hash(name, "prior_receipt_sha256", d.get("prior_receipt_sha256"),
                             "docs/function-pointer-relocations.json")


def find_asset_receipt_candidates() -> set[str]:
    explicit = {
        "banim-source-rebuild", "message-data-classification", "sound-sample-data",
        "sound-sample-references", "sound-relocations", "final-unmapped-provenance",
        "function-pointer-residuals", "orphan-duplicate", "orphan-runtime-copy",
    }
    candidates = set(explicit)
    for path in (ROOT / "docs").glob("*.json"):
        try:
            d = load_json(path)
        except Exception:
            continue
        if "assets" in d:
            candidates.add(path.stem)
        stack = [d]
        while stack:
            value = stack.pop()
            if isinstance(value, dict):
                if "asset" in value or "asset_sha256" in value:
                    candidates.add(path.stem)
                    break
                stack.extend(value.values())
            elif isinstance(value, list):
                stack.extend(value)
    return candidates


def merge_and_overlap(intervals: list[dict]) -> tuple[list[dict], dict]:
    eligible = [x for x in intervals if x.get("_eligible")]
    events = []
    for index, row in enumerate(eligible):
        start, end = addr(row["start"]), addr(row["end"])
        events.append((start, 1, index))
        events.append((end, -1, index))
    events.sort(key=lambda item: (item[0], item[1]))
    active: set[int] = set()
    cursor = None
    union = []
    overlap_segments = []
    for position, sign, index in events:
        if cursor is not None and position > cursor and active:
            ids = sorted(eligible[i]["id"] for i in active)
            span = dict(start=hex(cursor), end=hex(position), bytes=position - cursor)
            if not union or addr(union[-1]["end"]) != cursor:
                union.append(dict(start=hex(cursor), end=hex(position), bytes=position - cursor))
            else:
                union[-1]["end"] = hex(position)
                union[-1]["bytes"] += position - cursor
            if len(ids) > 1:
                if overlap_segments and overlap_segments[-1]["interval_ids"] == ids and addr(overlap_segments[-1]["end"]) == cursor:
                    overlap_segments[-1]["end"] = hex(position)
                    overlap_segments[-1]["bytes"] += position - cursor
                else:
                    overlap_segments.append({**span, "interval_ids": ids})
        # Remove at an interval end before adding intervals beginning there.
        if sign < 0:
            active.discard(index)
        else:
            active.add(index)
        cursor = position
    raw_claimed = sum(x["bytes"] for x in eligible)
    union_bytes = sum(x["bytes"] for x in union)
    overlap_claim_bytes = raw_claimed - union_bytes
    overlap_physical_bytes = sum(x["bytes"] for x in overlap_segments)
    return union, dict(
        eligible_interval_count=len(eligible),
        claimed_interval_bytes=raw_claimed,
        unique_union_bytes=union_bytes,
        duplicate_claim_bytes=overlap_claim_bytes,
        unique_physical_bytes_with_multiple_claims=overlap_physical_bytes,
        overlap_segment_count=len(overlap_segments),
        segments=overlap_segments,
    )


def eligible_for_coverage(receipt_fresh: bool, source_status: str, rom_status: str,
                          range_status: str, ledger_ok: bool,
                          source_rom_byte_match: bool | None = None) -> bool:
    return (receipt_fresh and source_status in ("fresh", "derived_bytes", "not_applicable")
            and rom_status == "match" and range_status == "valid" and ledger_ok
            and source_rom_byte_match is not False)


def validate_ledger(ledger: dict, rom_bytes: int, current_hashes: dict) -> dict:
    input_checks = {field: ledger.get(field) == actual for field, actual in current_hashes.items()}
    structure_ok = isinstance(ledger.get("ranges"), list) and ledger.get("rom_bytes") == rom_bytes
    cursor = BASE
    if structure_ok:
        try:
            for row in ledger["ranges"]:
                start, end = addr(row["start"]), addr(row["end"])
                if start != cursor or end <= start or end - start != row.get("bytes"):
                    structure_ok = False
                    break
                cursor = end
        except (KeyError, TypeError, ValueError):
            structure_ok = False
    if cursor != BASE + rom_bytes:
        structure_ok = False
    return dict(input_hash_checks=input_checks,
                structure_valid=structure_ok,
                matches_current_inputs=all(input_checks.values()) and structure_ok)


def run_synthetic_audit(case_specs: list[dict], rom: bytes, ledger_ok: bool = True) -> list[dict]:
    """Exercise the production receipt/hash/interval/freshness path in a temp root."""
    with tempfile.TemporaryDirectory(prefix="asset-index-negative-check-") as temp_dir:
        temp_root = Path(temp_dir)
        docs = temp_root / "docs"
        docs.mkdir()
        audit = Audit(rom, {}, root=temp_root)
        for i, spec in enumerate(case_specs):
            name = f"synthetic-{i}"
            source_rel = f"{name}.bin"
            source_path = temp_root / source_rel
            source_path.write_bytes(spec["source_bytes"])
            source_pin = spec["expected_source_sha256"]
            (docs / f"{name}.json").write_text(json.dumps({"source_sha256": source_pin}))
            audit.receipt(name, "supported_intervals", "temporary negative self-check fixture")
            audit.check_hash(name, "source_sha256", source_pin, source_rel)
            audit.add_interval(name, spec.get("entry", "fixture"), spec["start"], spec["end"],
                               source_kind="synthetic_fixture", source_path=source_rel,
                               expected_source_sha256=source_pin,
                               expected_rom_sha256=spec["expected_rom_sha256"])
        audit.finalize_receipts()
        for item in audit.intervals:
            receipt_fresh = audit.receipts[item["receipt"]]["freshness_status"] == "fresh"
            item["receipt_fresh"] = receipt_fresh
            item["_eligible"] = eligible_for_coverage(
                receipt_fresh, item["source_status"], item["rom_status"],
                item["range_status"], ledger_ok, item["source_rom_byte_match"])
        return audit.intervals


def run_negative_self_checks() -> dict:
    checks = {}

    overlapping_rom = b"0123456789"
    overlapping_cases = [
        dict(source_bytes=overlapping_rom[:6], expected_source_sha256=sha(overlapping_rom[:6]),
             expected_rom_sha256=sha(overlapping_rom[:6]), start=BASE, end=BASE + 6, entry="left"),
        dict(source_bytes=overlapping_rom[4:], expected_source_sha256=sha(overlapping_rom[4:]),
             expected_rom_sha256=sha(overlapping_rom[4:]), start=BASE + 4, end=BASE + 10, entry="right"),
    ]
    overlap_items = run_synthetic_audit(overlapping_cases, overlapping_rom)
    union, overlap = merge_and_overlap(overlap_items)
    checks["overlapping_claims_count_once"] = (
        all(x["_eligible"] for x in overlap_items) and sum(x["bytes"] for x in union) == 10
        and overlap["duplicate_claim_bytes"] == 2
        and overlap["unique_physical_bytes_with_multiple_claims"] == 2
    )

    stale_rom = b"ABCD"
    stale_items = run_synthetic_audit([
        dict(source_bytes=stale_rom, expected_source_sha256=sha(b"OLD!"),
             expected_rom_sha256=sha(stale_rom), start=BASE, end=BASE + 4),
    ], stale_rom)
    checks["stale_receipt_excluded"] = (
        not stale_items[0]["_eligible"] and stale_items[0]["receipt_fresh"] is False
        and stale_items[0]["rom_status"] == "match"
    )

    changed_rom = b"ABCD"
    changed_source = b"WXYZ"
    changed_items = run_synthetic_audit([
        dict(source_bytes=changed_source, expected_source_sha256=sha(changed_source),
             expected_rom_sha256=sha(changed_rom), start=BASE, end=BASE + 4),
    ], changed_rom)
    checks["same_length_source_ROM_mismatch_excluded"] = (
        not changed_items[0]["_eligible"] and changed_items[0]["receipt_fresh"] is True
        and changed_items[0]["rom_status"] == "match"
        and changed_items[0]["source_rom_byte_match"] is False
    )

    bounds_rom = b"ABCD"
    bounds_source = b"XY"
    bounds_items = run_synthetic_audit([
        dict(source_bytes=bounds_source, expected_source_sha256=sha(bounds_source),
             expected_rom_sha256=sha(bounds_source), start=BASE - 1, end=BASE + 1),
    ], bounds_rom)
    checks["invalid_interval_bounds_excluded"] = (
        not bounds_items[0]["_eligible"] and bounds_items[0]["receipt_fresh"] is True
        and bounds_items[0]["range_status"] == "out_of_bounds_or_empty"
    )

    fake_rom = b"12345678"
    current = dict(rom_sha256=sha(fake_rom), elf_sha256=sha(b"elf"), map_sha256=sha(b"map"))
    valid_ledger = dict(**current, rom_bytes=len(fake_rom), ranges=[
        dict(start=hex(BASE), end=hex(BASE + 4), bytes=4),
        dict(start=hex(BASE + 4), end=hex(BASE + 8), bytes=4),
    ])
    overlapping_ledger = dict(**current, rom_bytes=len(fake_rom), ranges=[
        dict(start=hex(BASE), end=hex(BASE + 5), bytes=5),
        dict(start=hex(BASE + 4), end=hex(BASE + 8), bytes=4),
    ])
    malformed_ledger = dict(**current, rom_bytes=len(fake_rom), ranges=[
        dict(start=hex(BASE), end=hex(BASE + 8)),
    ])
    valid_result = validate_ledger(valid_ledger, len(fake_rom), current)
    overlap_result = validate_ledger(overlapping_ledger, len(fake_rom), current)
    malformed_result = validate_ledger(malformed_ledger, len(fake_rom), current)
    checks["valid_synthetic_ledger_accepted"] = valid_result["matches_current_inputs"] is True
    checks["overlapping_ledger_rejected"] = (
        overlap_result["input_hash_checks"] == {k: True for k in current}
        and overlap_result["structure_valid"] is False
        and overlap_result["matches_current_inputs"] is False
    )
    checks["malformed_ledger_rejected"] = malformed_result["structure_valid"] is False
    ledger_blocked_items = run_synthetic_audit([
        dict(source_bytes=fake_rom, expected_source_sha256=sha(fake_rom),
             expected_rom_sha256=sha(fake_rom), start=BASE, end=BASE + 8),
    ], fake_rom, ledger_ok=overlap_result["matches_current_inputs"])
    checks["overlapping_ledger_contributes_zero"] = not ledger_blocked_items[0]["_eligible"]
    return checks


def ledger_intersections(union: list[dict], ledger: dict) -> dict:
    ranges = ledger["ranges"]
    starts = [addr(x["start"]) for x in ranges]
    totals = Counter()
    i = 0
    for item in union:
        start, end = addr(item["start"]), addr(item["end"])
        while i < len(ranges) and addr(ranges[i]["end"]) <= start:
            i += 1
        j = i
        while j < len(ranges) and starts[j] < end:
            row = ranges[j]
            lo, hi = max(start, starts[j]), min(end, addr(row["end"]))
            if lo < hi:
                totals[row["classification"]] += hi - lo
            j += 1
    return dict(sorted(totals.items()))


def link_unmapped_residuals(audit: Audit):
    receipt = audit.receipts.get("unmapped-asset-provenance")
    if not receipt:
        return
    rows = receipt.pop("_unbound_rows", [])
    other = [x for x in audit.intervals
             if x.get("eligible_for_unique_coverage") and x["receipt"] != "unmapped-asset-provenance"]
    for i, row in enumerate(rows):
        start, end = addr(row["start"]), addr(row["end"])
        intersections = sorted((max(start, addr(x["start"])), min(end, addr(x["end"])), x["receipt"])
                              for x in other
                              if addr(x["start"]) < end and start < addr(x["end"]))
        covered_segments = []
        covering_receipts = set()
        for lo, hi, receipt_name in intersections:
            if lo < hi:
                covering_receipts.add(receipt_name)
                if not covered_segments or lo > covered_segments[-1][1]:
                    covered_segments.append([lo, hi])
                else:
                    covered_segments[-1][1] = max(covered_segments[-1][1], hi)
        covered = sum(hi - lo for lo, hi in covered_segments)
        size = end - start
        reason = ("residual is fully covered by other fresh indexed receipts" if covered == size else
                  "residual is partly covered by other fresh indexed receipts" if covered else
                  "residual is not covered by another fresh indexed receipt")
        audit.add_unmatched("unmapped-asset-provenance", f"residual[{i}]", reason, size,
                            {"object": row.get("object"), "start": row.get("start"), "end": row.get("end"),
                             "covered_by_other_receipts_bytes": covered, "uncovered_bytes": size - covered,
                             "supporting_receipts": sorted(covering_receipts)})


def build_index():
    rom = (ROOT / "fireemblem8.gba").read_bytes()
    ledger = load_json(ROOT / "docs/rom-coverage-ledger.json")
    audit = Audit(rom, ledger)
    current = {
        "rom_sha256": sha(rom),
        "elf_sha256": sha((ROOT / "fireemblem8.elf").read_bytes()),
        "map_sha256": sha((ROOT / "fireemblem8.map").read_bytes()),
    }
    ledger_validation = validate_ledger(ledger, len(rom), current)
    ledger_checks = ledger_validation["input_hash_checks"]
    ledger_structure_ok = ledger_validation["structure_valid"]
    ledger_ok = ledger_validation["matches_current_inputs"]

    base_assets = index_banim_data(audit, {})
    index_banim_graphics(audit, base_assets)
    index_banim_source_rebuild(audit, base_assets)
    index_messages(audit)
    index_unmapped_assets(audit)
    unmapped_doc = audit.receipts["unmapped-asset-provenance"]["_doc"]
    index_final_unmapped(audit)
    index_sound_samples(audit)
    index_sound_references(audit)
    index_sound_relocations(audit)
    index_residual_tables(audit, unmapped_doc)
    index_pointer_data_owners(audit, base_assets)
    index_other_receipts(audit)

    candidates = find_asset_receipt_candidates()
    for name in sorted(candidates - set(audit.receipts)):
        audit.receipt(name, "unsupported_unmatched_receipt",
                      "Asset-related receipt discovered by the index but no interval adapter is defined; inspect its schema before treating it as coverage evidence.")
    audit.finalize_receipts()

    # Keep only public interval fields in output and count coverage only when
    # both current receipt inputs and physical ROM bytes validate.
    receipt_state = {x["name"]: x["freshness_status"] for x in audit.receipts.values()}
    for item in audit.intervals:
        receipt_fresh = receipt_state.get(item["receipt"]) == "fresh"
        item["receipt_fresh"] = receipt_fresh
        item["eligible_for_unique_coverage"] = eligible_for_coverage(
            receipt_fresh, item["source_status"], item["rom_status"], item["range_status"], ledger_ok,
            item["source_rom_byte_match"])
        item["_eligible"] = item["eligible_for_unique_coverage"]
    link_unmapped_residuals(audit)
    union, overlap = merge_and_overlap(audit.intervals)
    category_coverage = ledger_intersections(union, ledger)
    all_intervals = [{k: v for k, v in row.items() if not k.startswith("_")} for row in audit.intervals]
    stale_receipts = [x["name"] for x in audit.receipts.values() if x["freshness_status"] != "fresh"]
    unsupported = [x["name"] for x in audit.receipts.values() if x["support_status"].startswith("unsupported")]
    matched_interval_bytes = sum(x["bytes"] for x in audit.intervals if x["eligible_for_unique_coverage"])
    negative_checks = run_negative_self_checks()
    summary = dict(
        rom_bytes=len(rom),
        rom_sha256=current["rom_sha256"],
        ledger_sha256=sha((ROOT / "docs/rom-coverage-ledger.json").read_bytes()),
        ledger_matches_current_inputs=ledger_ok,
        ledger_input_hash_checks=ledger_checks,
        ledger_structure_valid=ledger_structure_ok,
        receipt_count=len(audit.receipts),
        fresh_receipt_count=sum(x["freshness_status"] == "fresh" for x in audit.receipts.values()),
        stale_or_unknown_receipt_count=len(stale_receipts),
        unsupported_receipt_count=len(unsupported),
        unmatched_entry_count=len(audit.unmatched),
        unmatched_entry_bytes=sum(x.get("bytes", 0) for x in audit.unmatched),
        unresolved_unmatched_bytes=sum(x.get("detail", {}).get("uncovered_bytes", x.get("bytes", 0))
                                       for x in audit.unmatched),
        interval_record_count=len(audit.intervals),
        eligible_interval_record_count=overlap["eligible_interval_count"],
        verified_fresh_claimed_bytes=matched_interval_bytes,
        unique_verified_fresh_coverage_bytes=overlap["unique_union_bytes"],
        duplicate_claim_bytes=overlap["duplicate_claim_bytes"],
        unique_physical_bytes_with_multiple_claims=overlap["unique_physical_bytes_with_multiple_claims"],
        uncovered_rom_bytes=len(rom) - overlap["unique_union_bytes"],
        stale_receipts=stale_receipts,
        unsupported_receipts=unsupported,
        negative_self_checks=negative_checks,
        negative_self_checks_passed=all(negative_checks.values()),
    )
    result = dict(
        schema_version=1,
        scope=("Source-asset and source-data provenance mapped onto the physical ROM ledger. "
               "This index does not classify bytes as executable or nonexecutable."),
        summary=summary,
        ledger_category_unique_coverage_bytes=category_coverage,
        overlap=overlap,
        receipt_inventory=sorted(audit.receipts.values(), key=lambda x: x["name"]),
        intervals=all_intervals,
        unmatched_entries=audit.unmatched,
    )
    return result


def render_markdown(index: dict) -> str:
    s = index["summary"]
    lines = [
        "# Asset provenance index",
        "",
        "This index binds source-asset and source-data receipts to physical ROM intervals. It is provenance evidence only; it does not classify any byte as executable or nonexecutable.",
        "",
        f"ROM bytes: {s['rom_bytes']:,}  ",
        f"ROM SHA-256: `{s['rom_sha256']}`  ",
        f"Ledger matches current ROM/ELF/map and partitions the ROM: `{s['ledger_matches_current_inputs']}`  ",
        f"Fresh receipts: {s['fresh_receipt_count']}/{s['receipt_count']}  ",
        f"Unsupported receipt schemas: {s['unsupported_receipt_count']}  ",
        "",
        "## Unique physical-byte coverage",
        "",
        "| Ledger classification | Unique bytes with fresh provenance |",
        "|---|---:|",
    ]
    for kind, amount in index["ledger_category_unique_coverage_bytes"].items():
        lines.append(f"| {kind} | {amount:,} |")
    lines += [
        "",
        f"Unique bytes covered: {s['unique_verified_fresh_coverage_bytes']:,}  ",
        f"Uncovered bytes: {s['uncovered_rom_bytes']:,}  ",
        f"Fresh interval claims before deduplication: {s['verified_fresh_claimed_bytes']:,}  ",
        f"Duplicate claims removed by interval union: {s['duplicate_claim_bytes']:,}  ",
        f"Physical bytes with more than one receipt: {s['unique_physical_bytes_with_multiple_claims']:,} across {index['overlap']['overlap_segment_count']:,} overlap segments.",
        "",
        "## Receipt inventory",
        "",
        "| Receipt | Index treatment | Freshness | Intervals | Unmatched entries |",
        "|---|---|---|---:|---:|",
    ]
    for r in index["receipt_inventory"]:
        lines.append(f"| `{r['path']}` | {r['support_status']} | {r['freshness_status']} | {r['indexed_interval_count']} | {r['unmatched_entry_count']} |")
    lines += [
        "",
        "Sound freshness checks pin each indexed `.bin` source file and its ROM bytes, plus `sound/direct_sound_data.s` and the converter source. The sound receipt does not record AIFF input hashes, so this index cannot independently certify that the original AIFF inputs are unchanged.",
    ]
    lines += ["", "## Unmatched evidence", ""]
    if not index["unmatched_entries"]:
        lines.append("No unmatched asset interval entries.")
    else:
        for row in index["unmatched_entries"]:
            byte_text = f" ({row['bytes']:,} bytes)" if isinstance(row.get("bytes"), int) else ""
            detail = f" Details: `{json.dumps(row['detail'], sort_keys=True)}`." if row.get("detail") else ""
            lines.append(f"- `{row['receipt']}` / `{row['entry']}`{byte_text}: {row['reason']}.{detail}")
    lines += [
        "",
        "The JSON file contains the interval-level bindings, freshness checks, source and ROM hashes, overlap segments, and ledger-category intersections. It lists asset receipts whose schema cannot supply an addressed, freshly verified extent, with the reason recorded.",
        "",
    ]
    return "\n".join(lines)


def main():
    result = build_index()
    OUT_JSON.write_text(json.dumps(result, indent=2) + "\n")
    OUT_MD.write_text(render_markdown(result))
    print(json.dumps(result["summary"], indent=2))
    print("ledger_category_unique_coverage_bytes=" + json.dumps(result["ledger_category_unique_coverage_bytes"], sort_keys=True))
    print("receipt_inventory=" + json.dumps([
        {k: row[k] for k in ("name", "support_status", "freshness_status", "indexed_interval_count", "unmatched_entry_count")}
        for row in result["receipt_inventory"]
    ], sort_keys=True))


if __name__ == "__main__":
    main()
