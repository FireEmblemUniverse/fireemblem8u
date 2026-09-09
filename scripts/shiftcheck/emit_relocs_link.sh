#!/bin/sh
# Single source of truth for the production link command, parameterized so the
# shiftability harness can produce variant ELFs without duplicating the link line
# (which lives in the Makefile $(ELF) rule). Two uses:
#   - Layer 1: relink with `-q` (--emit-relocs) so the ELF retains R_ARM_ABS32
#     relocations; scan_relocs.py uses them to separate symbol-derived pointers
#     (safe) from raw hardcoded address literals (unsafe).
#   - Layer 2: relink against a *shifted* ldscript to produce a moved image.
#
# It NEVER touches the matching build: it writes to a separate output ELF/map.
#
# Usage: emit_relocs_link.sh <out.elf> <ldscript> [extra ld flags...]
# Env (default to the project's values): LD, OBJECTS_LST, BANIM_OBJECT.
set -e

OUT="$1"
LDSCRIPT="$2"
shift 2

LD="${LD:-arm-none-eabi-ld}"
OBJECTS_LST="${OBJECTS_LST:-objects.lst}"
BANIM_OBJECT="${BANIM_OBJECT:-banim/data_banim.o}"

exec "$LD" -T "$LDSCRIPT" -Map "${OUT%.elf}.map" @"$OBJECTS_LST" \
    -R "${BANIM_OBJECT}.sym.o" -L tools/agbcc/lib -o "$OUT" -lc -lgcc "$@"
