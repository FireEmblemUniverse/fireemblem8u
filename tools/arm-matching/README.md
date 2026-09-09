# ARM matching compiler plugin

This GCC 16.2.0 plugin generates the matching production ColorFadeTick routine.
The production Makefile builds and loads it only for that C translation unit. It uses installed GCC plugin headers and checks
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

A second guarded rule changes unsigned LEU/GTU comparisons at a power-of-two
boundary minus one to LTU/GEU at the boundary. For example, `x <= 31` becomes
`x < 32`. It requires the same immediate dead flag consumer and rejects signed,
non-power-of-two, and potentially overflowing boundaries. GCC must recognize
both replacements before either change is kept.

There are no game symbols, addresses or instruction byte templates in the pass.
It changes compiler RTL and lets the ARM backend emit TST. It does not rewrite
assembled opcodes. TST preserves carry/overflow, unlike CMP-zero; the restricted
consumer guard is necessary because signed branches can depend on overflow.

From the repository root:

```sh
python3 tools/arm-matching/build.py
.deps/arm-oracle-venv/bin/python tools/arm-matching/check.py --plugin .deps/arm-matching-plugin/zero_test.so
.deps/arm-oracle-venv/bin/python research/arm/check_map_flood_step.py --plugin .deps/arm-matching-plugin/zero_test.so
python3 research/arm/build_color_fade.py --plugin .deps/arm-matching-plugin/zero_test.so
.deps/arm-oracle-venv/bin/python research/arm/check_color_fade.py --rom baserom.gba --arm-candidate .deps/color-fade-match/candidate.bin
```

The probes execute baseline and plugin-generated code for zero comparisons,
mixed flag use, unsigned power-of-two boundaries, non-power-of-two boundaries,
signed boundaries, and unsigned overflow limits. Twenty-one boundary values
and all sixteen incoming NZCV combinations give 18,144 executions. Selection
checks verify TST for EQ/NE zero tests and CMP-32 for the eligible 31 boundary.
Excluded comparisons and Thumb output must remain identical to the baseline.
These bounded checks are not a general compiler correctness proof.

With the comparison rules alone, the flood helper has six differing words
(literal loads only), with no return-NZCV differences in its 80 cases. The
palette helper has three differing literal loads until the prefix-pool option
below is enabled. Its 65,536 component/step checks pass against original ARM
execution. Omit `--plugin` to retain the stock-compiler research baseline;
reports record plugin binary hashes when one is selected.

## Opt-in preceding pointer pool

`-fplugin-arg-zero_test-prefix-pool=firstSymbol,secondSymbol` requests a single
pool containing exactly the named pointer symbols in that order. The pass
validates load-address RTL changes, rejects unmatched or duplicate symbols,
unsupported element sizes and leftover pool references, and emits pointer data
before the compiler's function label. Instructions still come from the ARM
backend. This restricted option supports the production palette routine; it is not a general pool placer.

```sh
.deps/arm-oracle-venv/bin/python tools/arm-matching/check_prefix_pool.py --plugin .deps/arm-matching-plugin/zero_test.so
python3 research/arm/build_color_fade.py --plugin .deps/arm-matching-plugin/zero_test.so --prefix-pool
.deps/arm-oracle-venv/bin/python research/arm/check_color_fade.py --rom baserom.gba --arm-candidate .deps/color-fade-match/candidate-body.bin
```

The prefix check links and executes two symbol orders at independent addresses,
checks the function entry after its pool, and rejects four invalid manifests.
With this option the palette candidate matches all 220 bytes (12 data + 208
instruction bytes) at the original location. `candidate.bin` includes the pool;
`candidate-body.bin` starts at the function for the execution oracle. The report
records the complete-section comparison separately from instruction differences.
The production palette routine is integrated and the complete ROM matches.
The flood helper remains an isolated candidate.
