# ARM matching compiler plugin

This GCC 16.2.0 plugin generates the matching production ColorFadeTick and
MapFloodCoreStep, TmCopyRect, TmFillRect, DrawGlyph, DrawGlyphHalfStride and DecodeString routines. The production Makefile loads it only for those six
C translation units. It uses installed GCC plugin headers and checks
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
Thumb instructions and unknown flag uses are skipped. Standalone signed
comparisons retain their original form; the paired rule below handles one
specific multi-consumer case.

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
and all sixteen incoming NZCV combinations give 18,816 executions across 28
functions, including a paired zero/sign test. Selection
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
MapFloodCoreStep is also integrated: its 20-byte prefix pool and 204-byte body
match exactly. Its remaining assembly caller uses an R_ARM_LDR_PC_G0 relocation
to read the shared pool through a linker-defined symbol, preserving the original
instruction encoding without duplicating a literal.

```sh
.deps/arm-oracle-venv/bin/python research/arm/check_map_flood_step.py --plugin .deps/arm-matching-plugin/zero_test.so --prefix-pool
```

## Paired zero and sign branches

For a CMP-zero followed by EQ and LT branches to the same destination, the
pass can use a TST with CC_NZ-mode consumers. The sign branch then tests N,
independent of the incoming V bit. The last consumer must have a REG_DEAD note
for the condition-code register. Between branches, only input-only empty asm
constraints are accepted; labels, calls, nonempty asm, and clobbers stop the
pattern. The three RTL changes are validated together and the final death
note is updated to the new CC mode. This emits the original TST/BEQ/BMI sequence
for TmCopyRect without editing instruction bytes.

`research/arm/check_tm_copy_rect.py` compiles the isolated C fixture, verifies
all 92 bytes, and runs 2,560 cases against the canonical ROM and sequential
memory-copy reference. It covers overlapping buffers, zero and negative
sizes, widths crossing the 32-tile stride, every incoming NZCV combination,
all r0-r12 results, preserved stack/registers, and write boundaries.

## Optional scalar copy encoding

`-fplugin-arg-zero_test-scalar-copy-sub-zero` selects non-flag-setting SUB-zero
instead of MOV for 32-bit register-to-register copies. It skips pointer-tagged
registers, frame-related instructions, and r13-r15 and special registers. Each
replacement goes through the ARM recognizer; rejection fails compilation.
Explicit requests in Thumb mode are rejected. No opcode bytes are patched.
Only TmFillRect enables this option; other functions keep the default behavior.

```sh
.deps/arm-oracle-venv/bin/python tools/arm-matching/check_scalar_copy.py --plugin .deps/arm-matching-plugin/zero_test.so
.deps/arm-oracle-venv/bin/python research/arm/check_tm_fill_rect.py --plugin .deps/arm-matching-plugin/zero_test.so
```

The encoding probes execute 384 baseline/option scalar and pointer cases,
checking all incoming NZCV, return values, r1-r12 and SP, unchanged pointer
assembly, and Thumb rejection. The fill oracle covers 2,016 cases with inclusive
zero counters, selected negative counter bit patterns, widths crossing the
32-tile stride, value truncation, register/flag results, and write boundaries.
All 56 original instruction bytes match. Original counter value 0x80000000
would require an impractically large write and is outside these bounded cases;
whole-section equality remains the stronger instruction-matching evidence.

## Glyph drawing integration

DrawGlyph uses the existing ordered prefix pool at O2. O1 retains an unnecessary
r11 save/restore after its 64-bit multiply temporaries disappear; O2 removes it
and matches the original seven-register save set. Production disables section
anchors so the pointer pool names the C shift table directly. The half-stride C routine now reuses that shared pool in the same translation
unit. No additional compiler-plugin transformation was needed.

```sh
.deps/arm-oracle-venv/bin/python research/arm/check_draw_glyph.py --plugin .deps/arm-matching-plugin/zero_test.so
```

The glyph code deliberately reproduces ARM word loads at two-byte lookup
strides, retaining only their low halfwords. It is target-specific C and uses
`-fno-strict-aliasing`; it is not a portable unaligned-load abstraction. The
independent reference uses halfword lookups and agrees for both LUT alignments.

## Sharing a prefix pool between functions

`-fplugin-arg-zero_test-share-prefix-pool` reuses the first emitted pool for
later functions with the same ordered manifest in the same output section.
It requires the prefix-pool manifest and rejects cross-section reuse. Only
label numbers are cached across functions; no transient RTL pointers are kept.
The assembler retains its normal PC-relative range checks. This option is
currently enabled only for the translation unit containing both glyph routines.
Source order is preserved explicitly with `-fno-toplevel-reorder`.

The pool test suite now runs 30 relocated executions in both pointer orders,
including a second function whose pool encounter order differs, forced GCC
garbage collection, and rejection of cross-section sharing or a missing manifest.

```sh
.deps/arm-oracle-venv/bin/python research/arm/check_draw_glyph.py --plugin .deps/arm-matching-plugin/zero_test.so --half-stride
```

This verifies the complete 380-byte shared pointer/function pair and executes
2,048 half-stride cases. The reference deliberately reads at column offsets
0/64/128 bytes while writing at 0/32/64 bytes, over eight rows. Arbitrary initial
pixels and overlap exercise that asymmetry rather than assuming a blank buffer.

## Optional zero initialization and sign tests

`zero-self-sub` materializes integer zero with a non-flag-setting self-subtract
in ordinary SI hard registers, excluding pointers, special registers and frame
setup. `sign-zero-tests` converts an immediate, dead LT/GE consumer of a word
comparison against zero to CC_NZ-mode TST plus MI/PL semantics. Updating the
consumer's mode makes the sign test independent of incoming overflow. The
option does not generalize to LE/GT tests or live/multiple flag consumers.
Both options are disabled by default and explicitly rejected in Thumb mode.

```sh
.deps/arm-oracle-venv/bin/python tools/arm-matching/check.py --plugin .deps/arm-matching-plugin/zero_test.so --zero-encodings
.deps/arm-oracle-venv/bin/python tools/arm-matching/check_scalar_copy.py --plugin .deps/arm-matching-plugin/zero_test.so
.deps/arm-oracle-venv/bin/python research/arm/check_decode_string.py --plugin .deps/arm-matching-plugin/zero_test.so --zero-encodings
```

The branch suite passes 18,816 executions with these options and separately
with defaults. Unsigned comparisons against 0x7fffffff that GCC has already
lowered to sign tests are also eligible; their predicates remain unchanged.
The expanded scalar suite passes 864 baseline/copy/zero cases, including
arbitrary initial destination bits, every NZCV, preserved registers, pointer
exclusions and Thumb rejection. Production DecodeString enables both options
and its two-symbol prefix pool. An empty read/write register constraint before
the final byte-mask test produces TST without emitting an assembly instruction.
All 35 instruction words and the eight pointer bytes match the original; the
replacement is integrated into the ROM.


The zero/sign branch-pair rule also accepts an input-only empty assembly
constraint with a sole memory clobber. This barrier emits no instruction and
cannot alter the condition flags. Outputs, register/flag clobbers and nonempty
templates remain excluded. The expanded branch suite executes 20,832 cases in
each default/optional configuration, including memory, register and CC barriers.
This resolves the isolated PutOamHi entry: all 160 pool/function bytes and
1,280 execution cases match. Shared low-entry layout is still pending.
