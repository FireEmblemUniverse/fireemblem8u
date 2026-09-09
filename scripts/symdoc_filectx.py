#!/usr/bin/env python3
"""Universal file-context namer for address-named structured-data symbols.

For each OLD symbol <Prefix>_<addr>:
  - if Prefix carries context beyond the bare type (e.g. AnimSprite_EfxLvupOBJ2),
    keep it: <Prefix>_<ordinal>
  - else (Prefix is just a type like Img/Tsa/Sprite/AnimConf), derive context
    from the DEFINING file's basename: <Type>_<FileCtx>_<ordinal>
    (FileCtx dropped if redundant with the type)
Ordinals are assigned per (final-stem) in file/address order; names are made
globally unique against existing symbols.

Usage: symdoc_filectx.py <targets_file>
Requires /tmp/symdoc/def_all.txt  (symbol<TAB>file) and /tmp/symdoc/base_syms.txt
"""
import os, re, sys
from collections import defaultdict

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ADDR = re.compile(r'^(.*)_[0-28][0-9A-Fa-f]{5,7}$')

# known type prefixes (so we can tell "bare type" from "type+context")
TYPES = {'Img','Tsa','Pal','AnimSprite','AnimConf','AnimScr','Obj','Sprite',
         'gSprite','sSprite','SpriteArray','ProcScr','gProcScr','gPal','gTsa',
         'Frames','Lut','gObj','DirectSoundData','gAiScript','Aiscript',
         'PaletteData','gUnk','Unk','sHelpInfo','gProc',
         'gUnknown','sUnknown','Unknown','nullsub','sub'}

def file_ctx(path, typ):
    b = re.sub(r'\.(c|s)$', '', os.path.basename(path))
    b = re.sub(r'^(data_|anim_|banim-|data-)', '', b)
    b = re.sub(r'-(data|main)$', '', b)
    parts = [p for p in re.split(r'[-_]', b) if p]
    ctx = ''.join(p[:1].upper()+p[1:] for p in parts)
    import re as _re
    if _re.search(r'[0-9A-F]{5,}', ctx): ctx='UnkData'
    # drop if redundant with the type
    if ctx.lower() in typ.lower() or typ.lower() in ctx.lower():
        return ''
    return ctx

def main():
    targets = [l.strip() for l in open(sys.argv[1]) if l.strip()]
    deffile = {}
    for line in open('/tmp/symdoc/def_all.txt'):
        if '\t' in line:
            s, f = line.rstrip('\n').split('\t', 1)
            deffile.setdefault(s, f)
    existing = set(l.strip() for l in open('/tmp/symdoc/base_syms.txt')) - set(targets)

    # compute desired stem per target, preserving file order via deffile + addr
    def deunk(s):
        # calcrom flags any name containing 'Unknown_'/'unknown_'/'sub_' as
        # undocumented, so strip those tokens from generated stems.
        s = re.sub(r'gUnknown_', 'g', s)   # gUnknown_Fontgrp -> gFontgrp
        s = re.sub(r'sUnknown_', 's', s)
        s = re.sub(r'gUnknown', 'gUnk', s) # bare gUnknown -> gUnk
        s = re.sub(r'sUnknown', 'sUnk', s)
        s = s.replace('Unknown', 'Unk')
        s = re.sub(r'nullsub', 'Nop', s)
        s = re.sub(r'sub_', 'Sub', s)
        return s

    def stem(sym):
        m = ADDR.match(sym)
        if not m: return None
        prefix = m.group(1)
        typ = prefix.split('_')[0]
        if prefix != typ:           # multi-token prefix, has context already
            return deunk(prefix)
        if typ not in TYPES:        # single-token but descriptive (e.g. ChapterIntro)
            return deunk(prefix)
        ctx = file_ctx(deffile.get(sym, ''), typ) if sym in deffile else ''
        return deunk(f"{typ}_{ctx}" if ctx else typ)

    TYPE_MAP={'gUnknown':'g','sUnknown':'s','Unknown':'Unk','gUnk':'g','nullsub':'NullSub'}
    bucket = defaultdict(list)
    addr_of = {}
    for sym in targets:
        m = ADDR.match(sym)
        if not m: continue
        st = stem(sym)
        if not st: continue
        addr_of[sym] = sym  # sort key by address text
        bucket[st].append(sym)
    used = set(); renames = {}
    for st, syms in bucket.items():
        syms.sort()
        multi = len(syms) > 1
        # start ordinal past any existing <st>_<n>
        base_n = 0
        for e in existing:
            mm = re.match(rf'{re.escape(st)}_(\d+)$', e)
            if mm: base_n = max(base_n, int(mm.group(1)) + 1)
        c = base_n
        for sym in syms:
            name = f"{st}_{c}" if multi or base_n else f"{st}";
            if not (multi or base_n): name = f"{st}_0"
            while name in used or name in existing:
                c += 1; name = f"{st}_{c}"
            used.add(name); renames[sym] = name; c += 1
    for s, n in sorted(renames.items()):
        # final guard: must be valid identifier and not address-like
        if re.match(r'^[A-Za-z_]\w*$', n) and not re.search(r'_[0-28][0-9A-Fa-f]{5,6}$', n):
            print(f"{s}\t{n}")
    sys.stderr.write(f"named {len(renames)} of {len(targets)}\n")

if __name__ == '__main__':
    main()
