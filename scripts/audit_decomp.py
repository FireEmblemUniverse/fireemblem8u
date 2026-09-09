#!/usr/bin/env python3
"""Inventory tracked decompilation evidence without claiming a match percentage.

This is a source-marker audit, not a C parser or a substitute for a ROM comparison.
Both sides of preprocessor branches are counted. Generated files are excluded.
"""

import ast
import hashlib
import json
from pathlib import Path
import re
import subprocess


def constant(expression):
    """Evaluate only integer literals, parentheses, addition and subtraction."""
    def visit(node):
        if isinstance(node, ast.Constant) and type(node.value) is int:
            return node.value
        if isinstance(node, ast.BinOp) and isinstance(node.op, (ast.Add, ast.Sub)):
            left, right = visit(node.left), visit(node.right)
            return left + right if isinstance(node.op, ast.Add) else left - right
        raise ValueError("unsupported constant expression: " + expression)

    return visit(ast.parse(expression.strip(), mode="eval").body)


def include_ranges(entries, rom_size):
    ranges, unresolved = [], []
    pattern = re.compile(r'^\s*\.incbin\s+"baserom\.gba"\s*,\s*([^,]+),\s*([^@]+)', re.I)
    for entry in entries:
        match = pattern.match(entry["source"])
        try:
            if not match:
                raise ValueError("unrecognized include syntax")
            start, size = constant(match[1]), constant(match[2])
            if start < 0 or size <= 0 or start + size > rom_size:
                raise ValueError("include is outside the canonical ROM")
            ranges.append({**entry, "rom_offset": start, "size": size, "end": start + size})
        except (ValueError, SyntaxError) as error:
            unresolved.append({**entry, "error": str(error)})

    merged = []
    for entry in sorted(ranges, key=lambda e: e["rom_offset"]):
        start, end = entry["rom_offset"], entry["end"]
        if merged and start <= merged[-1][1]:
            merged[-1][1] = max(merged[-1][1], end)
        else:
            merged.append([start, end])
    return {
        "scope": "Direct includes only; not classified as code or data; compressed contents are not expanded.",
        "unique_rom_bytes": sum(end - start for start, end in merged),
        "summed_include_bytes": sum(e["size"] for e in ranges),
        "ranges": ranges,
        "unresolved": unresolved,
    }


def audit(root):
    paths = subprocess.check_output(
        ["git", "ls-files", "-z"], cwd=root
    ).decode().split("\0")
    markers = {
        "assembly_entry_markers": re.compile(
            r"^\s*(?:thumb|arm)_func_start\s+(\w+)", re.I
        ),
        "naked_function_markers": re.compile(r"^\s*NAKEDFUNC\b"),
        "nonmatching_conditionals": re.compile(r"^\s*#\s*if\w*\b.*\bNONMATCHING\b"),
        "baserom_includes": re.compile(r'^(?!\s*(?:@|//)).*\b(?:incbin|INCBIN\w*)\b.*["\']baserom\.gba["\']', re.I),
        "commented_baserom_includes": re.compile(r'^\s*(?:@|//).*\bincbin\b.*["\']baserom\.gba["\']', re.I),
        "arm_mode_directives": re.compile(r'^\s*\.(?:arm\b|code\s+32\b)', re.I),
    }
    findings = {name: [] for name in markers}
    c_files = []
    for name in sorted(filter(None, paths)):
        path = Path(name)
        if path.parts[0] not in ("asm", "src", "data", "sound"):
            continue
        if path.suffix not in (".c", ".h", ".s", ".inc"):
            continue
        if path.suffix == ".c":
            c_files.append(name)
        for line_no, line in enumerate((root / path).read_text().splitlines(), 1):
            for category, pattern in markers.items():
                if pattern.search(line):
                    findings[category].append({
                        "path": name, "line": line_no, "source": line.strip()
                    })
    result = {
        "checkout_commit": subprocess.check_output(
            ["git", "rev-parse", "HEAD"], cwd=root, text=True
        ).strip(),
        "scope": "Tracked source markers; branches are not evaluated; not verified coverage.",
        "tracked_c_files": len(c_files),
        "counts": {name: len(entries) for name, entries in findings.items()},
        "findings": findings,
        "direct_rom_includes": include_ranges(findings["baserom_includes"], 0x1000000),
    }
    rom_hashes = {}
    for name in ("baserom.gba", "fireemblem8.gba"):
        path = root / name
        if path.is_file():
            data = path.read_bytes()
            rom_hashes[name] = {"size": len(data), "sha1": hashlib.sha1(data).hexdigest()}
    result["local_rom_hashes"] = rom_hashes
    return result


if __name__ == "__main__":
    print(json.dumps(audit(Path(__file__).resolve().parents[1]), indent=2))
