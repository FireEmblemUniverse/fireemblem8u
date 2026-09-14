# Masked-row allocation compiler

Build with `python3 tools/agbcc-row-shift/build.py`. The builder uses a pinned
agbcc checkout and records source, patch and compiler hashes beside the output.
The Makefile selects this compiler only for `src/unitlistscreen.c`.

`__attribute__((thumb_row_shift_alloc))` requires -O2, two masked (31) row
indices feeding shifts by five and six, and dead shift-by-six inputs. The
allocator separates the row and shift-result quantities and prefers r3 for
the first row, checking the resulting assignments. It does not rewrite RTL
or emit instruction templates. Unannotated functions use the original allocator.

Validation: run `python3 research/unitlist/probe_page_change_in.py --row-pointer`,
then `python3 research/unitlist/check_row_shift_contract.py --compiler
tools/agbcc-row-shift/agbcc`. Run `make compare` and
`python3 scripts/audit_unitlist_region.py` for production verification.
The compiler gate checks exact/renamed output, eight rejections, and 61
unchanged unannotated outputs. The region audit checks actual production
ownership and all ROM bytes. Whole-game completion is not implied.
