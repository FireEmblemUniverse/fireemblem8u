# Unit-list allocation diagnostic

This experiment is not a production compiler solution. Instruction UIDs only
identify RTL for this exact baseline; do not use them as a compiler contract.

1. Run `python3 research/unitlist/probe_page_change_in.py` to populate the
   standalone preprocessed baseline, linker script and typed Thumb call symbols.
2. In a disposable copy of the pinned agbcc GCC source directory with the
   existing empty-asm-length patch applied, apply `no-shift-merge.patch` using
   `patch -p1`, then build with `make -j1 normal`.
3. Compile `.deps/unitlist-page-in/baseline.i` with that compiler using
   `-mthumb-interwork -O2 -fhex-asm -ffix-debug-line -da`, once with environment
   `UNITLIST_NO_SHIFT_MERGE` unset and once each with values 1, 200 and 401.
   Set `-o` to a distinct assembly path for each run. Value 1 selects all
   shifts by six; other values select a single matching RTL instruction UID.
4. Assemble with `arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include`,
   link with `.deps/unitlist-page-in/probe.ld` and `thumb-symbols.o`, then
   extract `.text` using `arm-none-eabi-objcopy -O binary -j .text`.
5. Compare against `baserom.gba[0x91f10:0x920c4]`. The unset control gives
   425/436 equal bytes; values 1, 200, 401 give 405, 403, 427 respectively.

The 401 result fixes the reverse loop but leaves all nine forward-loop
halfwords different. Byte equality here includes forty literal/padding bytes.
The 427-byte-match diagnostic passes the 5,520-case behavioral model; the other diagnostic outputs have not been model-checked.

For the address-chain experiment, use `address-merge-mask.patch` instead of
`no-shift-merge.patch`. Compile with `UNITLIST_MERGE_MASK=0` through `15`;
bits 1, 2, 4, 8 decline merges at UIDs 200, 201, 202, 401 respectively.
No mask improves on reverse-only mask 8. In particular, declining both
forward shift and add merges does not fix the forward loop. These remain
diagnostic RTL selectors, with no production use.

Validate a diagnostic binary with:

```sh
.deps/arm-oracle-venv/bin/python research/unitlist/check_page_change_in_model.py --candidate .deps/unitlist-page-in/merge-mask-8.bin --report .deps/unitlist-page-in/allocator-model-report.json
```

The exact result is now available without diagnostic selectors: apply
`row-shift-alloc.patch` to the same empty-asm-patched pinned GCC source
directory, then build `normal`. Compile `page_change_in_contract.c` with
that compiler and the original probe flags/linker. It produces all 436
original bytes. Save the extracted text to `contract.bin`, run the normal
probe with `--row-pointer`, then run `check_row_shift_contract.py --compiler
<compiler-path>`. The research gate checks four rejected contracts and
61 unchanged unannotated outputs. Production integration is pending.
