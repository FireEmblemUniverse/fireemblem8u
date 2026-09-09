# Optional ARM equality-zero-test plugin

This is an experimental GCC 16.2.0 plugin for matching research. The production
Makefile does not load it. It uses installed GCC plugin headers and checks
compiler-version compatibility at load time. Host C++ and GMP headers are
required to build it. The source is GPL-3.0-or-later; generated host binaries
and build provenance remain in ignored `.deps/arm-matching-plugin/`.

The RTL pass runs immediately before branch shortening. For an ARM word-sized
register compared with zero, it requires the next real instruction to be an
EQ/NE branch consuming that exact condition-code register, with a REG_DEAD note
on that use. It then submits a self-AND zero test in CC_NZ mode to GCC's normal
instruction recognizer, including the backend's required scratch clobber.
The comparison and branch changes are validated together and rolled back if
GCC rejects them. Branch notes are updated to the new condition-code mode.
Thumb instructions, signed branches, and unknown/multiple flag uses are skipped.

There are no game symbols, addresses or instruction byte templates in the pass.
It changes compiler RTL and lets the ARM backend emit TST. It does not rewrite
assembled opcodes. TST preserves carry/overflow, unlike CMP-zero; the restricted
consumer guard is necessary because signed branches can depend on overflow.

From the repository root:

```sh
python3 research/arm/compiler/build.py
.deps/arm-oracle-venv/bin/python research/arm/compiler/check.py --plugin .deps/arm-matching-plugin/zero_test.so
.deps/arm-oracle-venv/bin/python research/arm/check_map_flood_step.py --plugin .deps/arm-matching-plugin/zero_test.so
python3 research/arm/build_color_fade.py --plugin .deps/arm-matching-plugin/zero_test.so
.deps/arm-oracle-venv/bin/python research/arm/check_color_fade.py --rom baserom.gba --arm-candidate .deps/color-fade-match/candidate.bin
```

The comparison probes execute baseline and plugin-generated code for EQ, NE,
LT, LE, GT, GE and mixed flag use on nine signed-boundary values and all sixteen
incoming NZCV combinations: 2,016 executions total. Assembly selection checks
require TST only for the EQ/NE probes, and a separate comparison requires Thumb
output to remain identical. These bounded checks are not a general compiler
correctness proof.

With the plugin, the flood helper has six differing words (literal loads only),
with no return-NZCV differences in its 80 cases. The palette helper has nine
differing words: three literal loads and six upper-clamp comparison/branch words.
Its 65,536 component/step checks still pass against original ARM execution.
Both candidates remain excluded from the ROM build because instruction/data
layout is not yet exact. Omit `--plugin` to retain the stock-compiler research
baseline; reports record plugin binary hashes when one is selected.
