#!/bin/bash
# Safely rename a symbol everywhere it appears in the source tree.
# Symbol names are NOT present in the GBA ROM (only .text/.data are linked;
# debug .ascii strings live in stripped .debug_* sections), so renames are
# byte-safe: the SHA-1 match is preserved. This tool only edits source text.
#
# Usage: rename_symbol.sh OLD NEW
#   - whole-word replacement only (avoids substring corruption)
#   - searches src/ asm/ include/ (definitions, references, debug strings)
set -euo pipefail
OLD="$1"; NEW="$2"
if [ -z "$OLD" ] || [ -z "$NEW" ]; then echo "usage: $0 OLD NEW" >&2; exit 1; fi
# Find files containing the whole word, then sed whole-word replace in place.
mapfile -t files < <(grep -rlw --include='*.c' --include='*.h' --include='*.s' "$OLD" src asm include 2>/dev/null || true)
if [ "${#files[@]}" -eq 0 ]; then echo "WARN: '$OLD' not found" >&2; exit 2; fi
for f in "${files[@]}"; do
  sed -i -E "s/\b${OLD}\b/${NEW}/g" "$f"
done
echo "renamed $OLD -> $NEW in ${#files[@]} file(s)"
