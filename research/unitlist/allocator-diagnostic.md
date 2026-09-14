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
The baseline behavioral model has not been rerun on these diagnostic outputs.
