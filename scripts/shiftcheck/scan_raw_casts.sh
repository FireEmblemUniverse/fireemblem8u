#!/usr/bin/env bash
# Source-level detector for the "redas" bug class: raw absolute-address pointers in
# data that won't relocate (and break a shifted ROM). This is more reliable than the
# binary delta-0 heuristic in scan_relocs.py -- it finds the pointer at its source.
#
#   1. C raw pointer casts to a ROM/RAM address, e.g. `.redas = (void *)0x88b6e28`
#      or `(struct Foo *)0x080abcde`. Hardware 0x04-0x07 (IO/VRAM/OAM/palette) are
#      legitimate fixed addresses and excluded.
#   2. Raw 32-bit ROM-address literals in COMMITTED hand-written asm data
#      (data_*/anim_*/const_data_*.s, asm/*.s, *.inc): `.4byte 0x08..` / `.word 0x08..`.
#      (Compiler-intermediate .s are git-ignored and skipped.)
#
# A non-empty result is a candidate non-relocatable pointer to convert to a symbol
# reference. Exit nonzero if any are found.
set -uo pipefail
cd "$(git rev-parse --show-toplevel 2>/dev/null || echo .)"

echo "== (1) C raw ROM/RAM pointer casts in typed data/source =="
# The type may be multi-word (e.g. `unsigned char *`, `const struct Foo *`), so the
# bare-identifier branch allows trailing words to avoid false negatives.
c_hits=$(grep -rnE '\((const +)?(void|struct +[A-Za-z_]+|union +[A-Za-z_]+|u8|u16|u32|s8|s16|s32|[A-Za-z_]+( +[A-Za-z_]+)*) ?\*+\) ?0x0[2389][0-9A-Fa-f]{6}' \
  src/ include/ 2>/dev/null | grep -vE '0x0[4567][0-9A-Fa-f]{6}')
[ -n "$c_hits" ] && echo "$c_hits" || echo "  (none)"

echo
echo "== (2) raw .4byte/.word ROM-address literals in committed asm data =="
asm_hits=""
while IFS= read -r f; do
  h=$(grep -HnE '\.(4byte|word|long)[[:space:]]+0x0[89][0-9A-Fa-f]{6}\b' "$f" 2>/dev/null)
  [ -n "$h" ] && asm_hits+="$h"$'\n'
done < <(git ls-files 'src/**/*.s' 'asm/*.s' 'src/**/*.inc' 'src/*.inc' 2>/dev/null \
         | grep -E 'data_[^/]*\.s$|anim_[^/]*\.s$|const_data_[^/]*\.s$|^asm/|\.inc$')
[ -n "$asm_hits" ] && printf '%s' "$asm_hits" || echo "  (none)"

echo
if [ -n "$c_hits" ] || [ -n "$asm_hits" ]; then
  echo "RESULT: raw non-relocatable pointer(s) found -> convert each to a symbol reference"
  exit 1
fi
echo "RESULT: no raw ROM/RAM pointer literals in source (the redas class is clean)"
