#!/bin/bash
# Apply a symbol-rename map (TSV: OLD<TAB>NEW) safely.
# Symbol names are not in the ROM, so renames preserve the SHA-1 match; this
# tool guards against the ways a rename CAN break the build:
#   - NEW collides with an existing (non-renamed) symbol -> duplicate definition
#   - NEW is still address-like -> not actually documented
#   - OLD still present after apply (outside .incbin asset paths) -> dangling ref
# Verifies collisions BEFORE editing, then applies across src/ include/ asm/,
# rebuilds, and runs `make compare`.
set -euo pipefail
TSV="$1"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
[ -f "$TSV" ] || { echo "no such map: $TSV" >&2; exit 1; }

# Current defined symbols (authoritative: the linked ELF).
arm-none-eabi-nm fireemblem8.elf | awk 'NF==3{print $3}' | sort -u > /tmp/symdoc/_existing.txt
cut -f1 "$TSV" | sort -u > /tmp/symdoc/_olds.txt
# existing symbols that survive the rename (NEW must avoid these)
comm -23 /tmp/symdoc/_existing.txt /tmp/symdoc/_olds.txt > /tmp/symdoc/_survive.txt

python3 - "$TSV" <<'PY'
import sys,re
tsv=sys.argv[1]
survive=set(l.strip() for l in open('/tmp/symdoc/_survive.txt'))
pairs=[l.rstrip('\n').split('\t') for l in open(tsv) if '\t' in l]
errs=[]; seen={}
for o,n in pairs:
    if not re.match(r'^[A-Za-z_][A-Za-z0-9_]*$',n): errs.append(f"invalid C identifier: {o}->{n}")
    if re.search(r'_0[0-9A-Fa-f]{5,7}$',n): errs.append(f"address-like NEW: {o}->{n}")
    if n in survive: errs.append(f"collides w/ existing symbol: {o}->{n}")
    if n in seen and seen[n]!=o: errs.append(f"duplicate NEW name: {o} and {seen[n]} ->{n}")
    seen[n]=o
if errs:
    print("COLLISION CHECK FAILED:"); [print("  "+e) for e in errs[:40]]
    print(f"... {len(errs)} problems"); sys.exit(3)
print(f"collision check OK ({len(pairs)} renames)")
PY

# Apply (fast single-pass Python: one compiled alternation regex per file +
# INCBIN-path restoration. sed with 1000+ rules is pathologically slow.)
grep -rlF -f /tmp/symdoc/_olds.txt src include asm sound ldscript.txt sym_iwram.txt 2>/dev/null > /tmp/symdoc/_files.txt || true
xargs -a /tmp/symdoc/_files.txt python3 "$ROOT/scripts/fast_apply.py" "$TSV"
echo "applied to $(wc -l < /tmp/symdoc/_files.txt) files"

# Verify no OLD remains outside .incbin asset paths
REM=$(grep -rhnF -f /tmp/symdoc/_olds.txt src include asm 2>/dev/null | grep -v '\.incbin' | wc -l)
echo "non-incbin OLD occurrences remaining: $REM"
[ "$REM" -eq 0 ] || { echo "WARN: stragglers remain" >&2; }

# Rebuild + compare. A rename that changes ROM bytes (e.g. a name collision that
# silently redirects a pointer) MUST fail here -- treat it as a hard error.
if ! make fireemblem8.gba -j"$(nproc)" > /tmp/symdoc/_build.log 2>&1; then
    echo "BUILD FAILED:"; tail -8 /tmp/symdoc/_build.log; exit 4
fi
if make compare 2>&1 | tail -1 | grep -q ': OK'; then
    echo "SHA OK (byte-identical) — $(wc -l < "$TSV") symbols documented"
else
    echo "!!! SHA MISMATCH — rename changed ROM bytes. Investigate before continuing." >&2
    sha1sum fireemblem8.gba; exit 5
fi
