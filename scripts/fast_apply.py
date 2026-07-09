#!/usr/bin/env python3
"""Fast whole-word symbol renamer: one compiled alternation regex per file,
dict-based replacement (vs sed's O(rules x lines) which is pathological for
1000+ rules). Also restores INCBIN/incbin asset paths corrupted by the rename.

Usage: fast_apply.py <map.tsv> <file1> [file2 ...]
  map.tsv: OLD<TAB>NEW per line
"""
import sys, re

tsv = sys.argv[1]
files = sys.argv[2:]
pairs = [l.rstrip('\n').split('\t') for l in open(tsv) if '\t' in l]
mapping = {o: n for o, n in pairs}
# one big alternation, longest names first so prefixes don't shadow
alt = sorted(mapping, key=len, reverse=True)
rx = re.compile(r'\b(' + '|'.join(re.escape(o) for o in alt) + r')\b')

def repl(m): return mapping[m.group(0)]

for f in files:
    try:
        txt = open(f, encoding='utf-8', errors='replace').read()
    except OSError:
        continue
    if not rx.search(txt):
        continue
    new = rx.sub(repl, txt)
    # restore corrupted INCBIN/incbin asset paths: '/NEW.' -> '/OLD.'
    if 'INCBIN' in new or '.incbin' in new:
        for o, n in pairs:
            if '/' + n + '.' in new:
                new = new.replace('/' + n + '.', '/' + o + '.')
    if new != txt:
        open(f, 'w').write(new)
