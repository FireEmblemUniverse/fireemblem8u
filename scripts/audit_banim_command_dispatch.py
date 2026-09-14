#!/usr/bin/env python3
"""Inventory actual motion command IDs against outer C dispatch switches."""
import hashlib
import json
import re
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

def sha(data):
    return hashlib.sha256(data).hexdigest()

def outer_cases(source, marker, constants):
    # Comments must not affect brace depth or introduce spurious case labels.
    clean = re.sub(r'/\*.*?\*/|//[^\n]*', '', source, flags=re.S)
    start = clean.index('{', clean.index(marker))
    depth = 0
    values = []
    default = False
    for token in re.finditer(r'[{}]|\bcase\s+(\w+)\s*:|\bdefault\s*:', clean[start:]):
        text = token.group()
        if text == '{':
            depth += 1
        elif text == '}':
            depth -= 1
            if depth == 0:
                break
        elif depth == 1:
            if text.startswith('default'):
                default = True
            else:
                name = token[1]
                values.append(constants[name] if name in constants else int(name, 0))
    assert depth == 0 and values
    assert len(values) == len(set(values))
    return set(values), default

header = (ROOT / 'include/anime.h').read_text()
constants = {name: int(value, 0) for name, value in re.findall(r'\b(ANIM_CMD_\w+)\s*=\s*(0x[0-9a-fA-F]+|\d+)', header)}
receipt = json.loads((ROOT / 'docs/banim-command-classification.json').read_text())
counts = Counter()
frames = Counter()
for row in receipt['streams_detail']:
    data = (ROOT / row['path'][:-3]).read_bytes()
    assert sha(data) == row['motion_sha256']
    i = 0
    while i < len(data):
        word = int.from_bytes(data[i:i+4], 'little')
        tag = word >> 24
        assert tag in (0x80, 0x85, 0x86)
        if tag == 0x85:
            counts[word & 255] += 1
        if tag == 0x86:
            frames[word & 65535] += 1
        i += 12 if tag == 0x86 else 4
    assert i == len(data)
assert sum(counts.values()) == receipt['commands']['0x85']
assert sum(frames.values()) == receipt['commands']['0x86']
handlers = {}
for path, marker in [('src/banim-main.c', 'switch (anim->commandQueue['), ('src/banim-ekrmainmini.c', 'switch (r0)')]:
    source = (ROOT / path).read_text()
    cases, default = outer_cases(source, marker, constants)
    handlers[path] = dict(source_sha256=sha(source.encode()), explicit_cases=sorted(cases), has_default=default,
        observed_without_explicit_case=sorted(set(counts)-cases))
# Regression: nested case labels and commented braces cannot count as commands.
assert outer_cases('switch (x) { case 1: switch(y) {case 99: break;} /* } case 8: */ case 2: break; default: break;}', 'switch (x)', {}) == ({1, 2}, True)
report = dict(scope='Static observed command-ID/outer-switch inventory, not handler execution or mode reachability. Expanded stream hashes match the prior grammar receipt; no fresh linked-ROM provenance claim.',
    streams=len(receipt['streams_detail']), command_records=sum(counts.values()), observed_command_ids=len(counts),
    command_counts={hex(k):v for k,v in sorted(counts.items())}, frame_delay_counts=dict(sorted(frames.items())),
    zero_delay_frames=frames[0], handlers=handlers, grammar_receipt_sha256=sha((ROOT/'docs/banim-command-classification.json').read_bytes()),
    header_sha256=sha(header.encode()))
(ROOT/'docs/banim-command-dispatch.json').write_text(json.dumps(report, indent=2)+'\n')
print(json.dumps({k:v for k,v in report.items() if k not in ('command_counts','frame_delay_counts')}, indent=2))
