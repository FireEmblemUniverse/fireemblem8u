# Equality-only Thumb bit-test compiler

This agbcc variant adds a general C bit-test lowering rule needed by
`src/m4a_fine.c`. It is based on pret/agbcc revision
`da598c1d918402c42c0c0d7128ba14567f3175e9` and also includes the existing
empty-assembly length correction and equality-only live AND/zero folding.
`src/m4a_fine.c` and `src/m4a_track_stop.c` use this variant.
Other translation units keep their previously selected compilers.

The new machine pattern recognizes a condition-code setting bitwise AND.
It calls the compiler's existing `next_insn_tests_no_inequality` predicate,
which requires a known condition-code consumer with no ordered comparison.
Consequently equality/non-equality can use TST. Signed comparisons keep
AND/CMP: TST preserves the overflow flag, whereas CMP against zero clears it.
The unrestricted form of this rule was rejected for that reason. The patch
contains no game symbols, addresses, registers or precomputed ROM instructions.

`python3 tools/agbcc-tst/build.py` checks out the pinned committed sources into
an isolated ignored directory, applies all three patches, verifies the patched
`final.c` and `thumb.md` hashes, and performs a serial clean compiler build.
It records source revision, patch and compiler hashes, and build location in
`build-info.json` in that directory. The resulting host binary is ignored.
A normal Make build creates it when absent or stale.

`python3 tools/agbcc-tst/check.py` compiles twelve independent comparison cases.
It requires TST without redundant AND/CMP for EQ and NE and requires AND/CMP
without TST for LT, LE, GT and GE. This checks the specific flag distinction;
it is not a general compiler correctness proof. Full-ROM comparison separately
verifies the actual game translation unit after integration. The compiler is
GPL-licensed; the upstream license is included in `COPYING`.

`live-and-zero.patch` folds a same-destination register AND followed by its
zero compare only when the existing predicate confirms an equality-only
consumer. The AND result remains available to subsequent code. Signed
comparisons retain CMP because AND preserves overflow instead of clearing it.
`research/audio/check_live_and.py --baseline OLD_COMPILER --compiler NEW_COMPILER`
executes 14,336 baseline/folded probes across all NZCV inputs, live return values,
callback clobbers and signed/high-bit operands. Signed cases and an intervening
empty-asm barrier are required to retain identical assembly.
