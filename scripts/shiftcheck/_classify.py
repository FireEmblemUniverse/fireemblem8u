"""Shared suspect classifier for the shiftability harness.

Both layers reduce to the same question -- "which ROM-pointer-looking words are
NOT relocatable?" -- they only differ in how they decide "relocatable":

  * Layer 1 (scan_relocs.py): the word carries an R_ARM_ABS32 relocation.
  * Layer 2 (diff_shift.py):  the word's value tracks a layout shift.

Given a boolean `relocated` mask over words, this module applies identical
structural precision filters and returns the same buckets, so the two layers'
HIGH-confidence findings are directly comparable (and should agree).

Buckets:
  high    {obj: [recs]} -- coherent unrelocated pointer table in a MIXED object
  medium  {obj: count}  -- other unrelocated words in a MIXED object (scattered)
  blob    {obj: count}  -- owner has no relocatable pointers (pure incbin data)
  selfref {obj: count}  -- word lies inside the very symbol it points at
Plus a `stats` dict.
"""

import bisect

ROM_BASE = 0x08000000
ROM_HI = 0x09000000
MIN_PTR = 0x08000100  # below this is header/logo; small packed data, not pointers
PIN = 0x08C00000      # first absolute-pinned ldscript block
MIN_RUN = 4           # a pointer array is at least this many consecutive ptr/NULL


def _owner_lookup(ranges):
    starts = [r[0] for r in ranges]

    def of(vma):
        i = bisect.bisect_right(starts, vma) - 1
        if i >= 0 and ranges[i][0] <= vma < ranges[i][1]:
            return ranges[i][2], ranges[i][3]
        return None, None

    return of


def _sym_lookup(syms):
    addrs = [s[0] for s in syms]

    def at(val):
        i = bisect.bisect_right(addrs, val) - 1
        if i >= 0:
            return syms[i][1], val - syms[i][0]
        return None, None

    return at


def _in_ranges(val, sorted_ranges):
    if not sorted_ranges:
        return False
    los = [r[0] for r in sorted_ranges]
    i = bisect.bisect_right(los, val) - 1
    return i >= 0 and sorted_ranges[i][0] <= val < sorted_ranges[i][1]


def classify(words, relocated, ranges, syms, allow=(),
             include_text=False, min_ptr=MIN_PTR, candidate_mask=None):
    """words: np.int64 array; relocated: np.bool_ array (same length).

    ranges: sorted [(start,end,obj,sect)]; syms: sorted [(addr,name)];
    allow: sorted [(lo,hi)] value ranges to suppress.
    candidate_mask: optional np.bool_ array further restricting which ROM-pointer
        words may be flagged (Layer 2 can only assess pointers whose target moved).
    """
    import numpy as np

    n = words.size
    owner_of = _owner_lookup(ranges)
    sym_at = _sym_lookup(syms)

    romptr = (words >= min_ptr) & (words < ROM_HI)
    ptr_or_null = romptr | (words == 0)
    cand = romptr & ~relocated
    if candidate_mask is not None:
        cand = cand & candidate_mask
    suspect_idx = np.nonzero(cand)[0]

    # Per-object count of relocatable pointers -> MIXED (>0) vs BLOB (0).
    reloc_obj = {}
    for idx in np.nonzero(relocated & romptr)[0].tolist():
        obj, _ = owner_of(idx * 4 + ROM_BASE)
        if obj:
            reloc_obj[obj] = reloc_obj.get(obj, 0) + 1
    live_targets = set(words[relocated & romptr].tolist())

    # Maximal runs of consecutive ptr-or-NULL words (pointer arrays).
    run_id = np.full(n, -1, dtype=np.int64)
    run_len = {}
    pe = ptr_or_null
    i = rid = 0
    while i < n:
        if pe[i]:
            j = i
            while j < n and pe[j]:
                j += 1
            if (j - i) >= MIN_RUN:
                run_id[i:j] = rid
                run_len[rid] = j - i
                rid += 1
            i = j
        else:
            i += 1

    recs_all, blob, selfref = [], {}, {}
    pinned_n = text_n = allow_n = 0
    for idx in suspect_idx.tolist():
        vma = idx * 4 + ROM_BASE
        val = int(words[idx])
        if _in_ranges(val, allow):
            allow_n += 1
            continue
        obj, sect = owner_of(vma)
        if vma >= PIN:
            pinned_n += 1
            continue
        if sect == "text" and not include_text:
            text_n += 1
            continue
        if not (obj and reloc_obj.get(obj, 0) > 0):
            blob[obj] = blob.get(obj, 0) + 1
            continue
        sym, delta = sym_at(val)
        loc_sym, _ = sym_at(vma)
        if loc_sym is not None and loc_sym == sym:
            selfref[obj] = selfref.get(obj, 0) + 1
            continue
        recs_all.append(dict(vma=vma, val=val, sym=sym, delta=delta, sect=sect,
                             obj=obj, run=int(run_id[idx]),
                             live=(val in live_targets)))

    by_run = {}
    for r in recs_all:
        by_run.setdefault(r["run"], []).append(r)

    def coherent(entries):
        if len(entries) < MIN_RUN:
            return False
        distinct = len(set(e["sym"] for e in entries))
        return distinct <= max(2, len(entries) // 4)

    coherent_runs = {
        rid for rid, es in by_run.items()
        if rid >= 0 and run_len.get(rid, 0) >= MIN_RUN and coherent(es)
    }

    high, medium = {}, {}
    for r in recs_all:
        if r["run"] in coherent_runs:
            high.setdefault(r["obj"], []).append(r)
        else:
            medium[r["obj"]] = medium.get(r["obj"], 0) + 1

    stats = dict(romptr=int(romptr.sum()), relocated=int((relocated & romptr).sum()),
                 candidates=int(suspect_idx.size), allow=allow_n, text=text_n,
                 pinned=pinned_n)
    return dict(high=high, medium=medium, blob=blob, selfref=selfref, stats=stats)


def report(buckets, title, max_list=80, result_verb="suspect"):
    """Print the standard bucketed report; return the HIGH count."""
    from collections import Counter
    high, medium, blob, selfref = (buckets["high"], buckets["medium"],
                                   buckets["blob"], buckets["selfref"])
    s = buckets["stats"]
    print("=" * 78)
    print(title)
    print("=" * 78)
    print(f"ROM-pointer-looking words: {s['romptr']} | relocatable: {s['relocated']}"
          f" | unrelocated candidates: {s['candidates']}")
    print(f"allowlisted: {s['allow']} | in .text (quiet): {s['text']} | "
          f"pinned region >=0x{PIN:08X}: {s['pinned']}")

    n_high = sum(len(v) for v in high.values())
    print("\n" + "-" * 78)
    print(f"[A] HIGH-CONFIDENCE -- coherent unrelocated pointer table in a MIXED "
          f"object: {n_high} in {len(high)} object(s)")
    print("-" * 78)
    for obj in sorted(high, key=lambda o: -len(high[o])):
        recs = sorted(high[obj], key=lambda r: r["vma"])
        tc = Counter(r["sym"] for r in recs)
        dom = ", ".join(f"{x}({c})" for x, c in tc.most_common(3))
        nruns = len(set(r["run"] for r in recs))
        print(f"\n  {obj}  ({len(recs)} {result_verb}s in {nruns} table(s); "
              f"targets: {dom})")
        for r in recs[:max_list]:
            tgt = f"{r['sym']}+0x{r['delta']:X}" if r["sym"] else "<no symbol>"
            live = " *live" if r["live"] else ""
            print(f"    0x{r['vma']:08X} = 0x{r['val']:08X}  -> {tgt}{live}")
        if len(recs) > max_list:
            print(f"    ... and {len(recs) - max_list} more")

    n_mid = sum(medium.values())
    print("\n" + "-" * 78)
    print(f"[B] MIXED-object scattered (lower confidence; review): {n_mid} in "
          f"{len(medium)} object(s)")
    print("-" * 78)
    for obj, c in sorted(medium.items(), key=lambda t: -t[1])[:20]:
        print(f"    {c:5d}  {obj}")

    for tag, name, d in (("C", "BLOB (no relocatable pointers -> pure incbin data)",
                          blob),
                         ("D", "BLOB-INTERNAL self-references (embedded blob data)",
                          selfref)):
        print("\n" + "-" * 78)
        print(f"[{tag}] {name}: {sum(d.values())} in {len(d)} object(s)")
        print("-" * 78)
        for obj, c in sorted(d.items(), key=lambda t: -t[1])[:10]:
            print(f"    {c:5d}  {obj}")
    return n_high
