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


def classify_inline_assembly(source, entry):
    """Classify a literal asm template; keep unsupported syntax unresolved.

    This does not evaluate preprocessor branches or count machine instructions.
    Register bindings are declarations, not executable assembly templates.
    """
    offset = sum(len(line) for line in source.splitlines(keepends=True)[:entry["line"] - 1])
    line = source[offset:].splitlines()[0]
    match = re.search(r"\b(?:asm|__asm__?)\s*(?:(?:volatile|__volatile__?)\s*)?\(", line)
    if not match:
        return {**entry, "kind": "unresolved", "reason": "asm opening not found"}
    prefix = line[:match.start()]
    cursor = offset + match.end()
    literals = []
    while True:
        trivia = re.match(r"(?:\s+|/\*.*?\*/|//[^\n]*(?:\n|$))*", source[cursor:], re.S)
        cursor += trivia.end()
        literal = re.match(r'"(?:\\[\s\S]|[^"\\])*"', source[cursor:])
        if not literal:
            break
        try:
            literals.append(ast.literal_eval(literal[0]))
        except (SyntaxError, ValueError):
            return {**entry, "kind": "unresolved", "reason": "unsupported string literal"}
        cursor += literal.end()
    if not literals or cursor >= len(source) or source[cursor] not in ":)":
        return {**entry, "kind": "unresolved", "reason": "nonliteral or incomplete template"}
    template = "".join(literals)
    if re.search(r"\bregister\b", prefix) and re.fullmatch(r"(?:r(?:1[0-5]|[0-9])|[av][1-8]|ip|sp|lr|pc|fp|sl)", template):
        kind = "register_binding"
    elif not template.strip():
        kind = "empty_template"
    else:
        # Classify directives separately, but never infer instruction counts:
        # one assembler statement can expand into several instructions or data.
        statements = [part.split("@", 1)[0].strip() for part in re.split(r"[\n;]", template)]
        statements = [part for part in statements if part and not re.fullmatch(r"[\w.$]+:", part)]
        kind = "directive_only" if statements and all(part.startswith(".") for part in statements) else "instruction_template"
    return {**entry, "kind": kind, "template": template}


def audit(root):
    paths = subprocess.check_output(
        ["git", "ls-files", "-z"], cwd=root
    ).decode().split("\0")
    markers = {
        "assembly_entry_markers": re.compile(
            r"^\s*(?:thumb|arm)_func_start\s+(\w+)", re.I
        ),
        "assembly_function_declarations": re.compile(
            r"^\s*\.type\s+\w+\s*,\s*[%@]?function\b", re.I
        ),
        "inline_assembly_sites": re.compile(
            r"\b(?:asm|__asm__?)\s*(?:(?:volatile|__volatile__?)\s*)?\("
        ),
        "naked_function_markers": re.compile(r"^\s*NAKEDFUNC\b"),
        "naked_function_attributes": re.compile(r"\b__attribute__\s*\(\([^\n]*\bnaked\b"),
        "nonmatching_conditionals": re.compile(r"^\s*#\s*if\w*\b.*\bNONMATCHING\b"),
        "baserom_includes": re.compile(r'^(?!\s*(?:@|//)).*\b(?:incbin|INCBIN\w*)\b.*["\']baserom\.gba["\']', re.I),
        "commented_baserom_includes": re.compile(r'^\s*(?:@|//).*\bincbin\b.*["\']baserom\.gba["\']', re.I),
        "arm_mode_directives": re.compile(r'^\s*\.(?:arm\b|code\s+32\b)', re.I),
    }
    findings = {name: [] for name in markers}
    c_files = []
    for name in sorted(filter(None, paths)):
        path = Path(name)
        if path.parts[0] not in ("asm", "src", "data", "sound", "banim"):
            continue
        if path.suffix.lower() not in (".c", ".h", ".s", ".inc"):
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
    classified = [
        classify_inline_assembly((root / entry["path"]).read_text(), entry)
        for entry in findings["inline_assembly_sites"]
    ]
    result["inline_assembly_classification"] = {
        "scope": "Literal source templates, including inactive branches; not executable coverage or instruction counts.",
        "counts": {kind: sum(entry["kind"] == kind for entry in classified) for kind in (
            "register_binding", "empty_template", "directive_only", "instruction_template", "unresolved"
        )},
        "sites": classified,
    }
    rom_hashes = {}
    for name in ("baserom.gba", "fireemblem8.gba"):
        path = root / name
        if path.is_file():
            data = path.read_bytes()
            rom_hashes[name] = {"size": len(data), "sha1": hashlib.sha1(data).hexdigest()}
    result["local_rom_hashes"] = rom_hashes
    # An embedded executable must not disappear from the inventory when its
    # baserom include is replaced by a separately linked source build.
    payload = root / "mgfembp"
    if (root / ".gitmodules").is_file() and "mgfembp" in paths:
        entry = {
            "path": "mgfembp",
            "rom_offset": 0xB1A368,
            "compressed_size": 0x53CC,
            "load_address": 0x02010000,
            "expanded_size": 0x888C,
            "pinned_commit": subprocess.check_output(
                ["git", "rev-parse", ":mgfembp"], cwd=root, text=True
            ).strip(),
            "initialized": (payload / "Makefile").is_file(),
        }
        if entry["initialized"]:
            entry["source_inventory"] = audit(payload)
        binary = payload / "mgfembp.bin"
        if binary.is_file():
            data = binary.read_bytes()
            entry["built_binary"] = {
                "size": len(data), "sha1": hashlib.sha1(data).hexdigest()
            }
        result["embedded_executables"] = [entry]
    return result


if __name__ == "__main__":
    print(json.dumps(audit(Path(__file__).resolve().parents[1]), indent=2))
