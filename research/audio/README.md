# Audio C matching research

The former `ply_fine.c` candidate has graduated to `src/m4a_fine.c` and is
included in the matching ROM build. Its complete 46-byte body occupies
`0x080CF928..0x080CF956`; two following zero alignment bytes are outside it.

Modern GNU ARM GCC produced an otherwise exact candidate but used MOVS
register copies at `0x080CF92A` and `0x080CF940` where the original has
ADD-zero copies. Legacy agbcc produced the correct copies but lacked a
bitwise TST machine pattern, emitting AND/CMP instead.

An isolated backend experiment established that a general bit-test pattern
could produce the original function. The unrestricted pattern was rejected:
signed comparisons need CMP's cleared overflow flag, while TST preserves it.
Initial guard experiments looked for the unsimplified compare-of-AND form and
did not fire. Compiler RTL diagnostics showed the actual zero comparison had
already simplified to `(set (cc0) (and:SI ...))`. Recognizing that form with
the existing `next_insn_tests_no_inequality` predicate gives TST for EQ/NE
while preserving AND/CMP for signed comparisons.

The reproducible compiler, six comparison checks, source hashes and license
are in `tools/agbcc-tst/`. The final condition is `mask & status` to preserve
the original operand order. Empty register constraints preserve allocation;
all function instructions are generated from C. Fresh pinned-source compiler
build and complete ROM comparison both pass. Earlier experiments remain in
ignored `.deps/audio-match` and `.deps/agbcc-tst-gcc` directories.

The internal unchecked command-byte reader is now in `src/m4a_read_command.c`.
Run `.deps/arm-oracle-venv/bin/python research/audio/check_read_command.py` after
`make compare -j8` to compare its private register ABI against the original ROM.
The checker includes pointer-field aliases, so it verifies store-before-read
ordering in addition to the ordinary command stream cases.

VSync is implemented in `src/m4a_sound_vsync.c`. Its compiler support lives in
`tools/arm-dispatch/`: `build_backend.py` installs the pinned matching GCC and
`build_thumb_shared.py` builds the plugin against that compiler's generated
headers. The normal Makefile builds both dependencies.
The shared-literal plugin has independent opt-in transformations:

- `literal=integer,symbol` relocates a selected word load to a shared forward
  pool. Explicit linker range assertions are required because GNU ld can wrap
  the scaled Thumb relocation silently.
- `carry-tests` lowers single-bit equality tests to shifts and carry branches.
- `byte-counter` bundles a proven unsigned-byte load followed by decrement,
  byte store and signed GT/LE branch. Only an adjacent load, optionally separated
  by an input-only empty constraint, establishes the range. The store must use
  an independent low base register and offset 0..31. Only forward branches with
  a conservative span of at most 200 bytes are accepted. Full-width or signed
  inputs, output constraints and intervening clobbers do not establish proof.
- `zero-pool-padding` explicitly zero-fills word alignment immediately before
  the selected pool, requiring a preceding control-flow barrier. It cannot be
  enabled without a literal manifest.

These are compiler RTL operations and alignment directives; the source does
not embed the game's instruction bytes. The pinned production compiler includes these patterns; other compilation
units do not enable the Thumb plugin unless their Makefile rule requests it.
`check_thumb_byte_counter.py` checks both accepted patterns and unchanged
unsupported patterns. `check_sound_vsync.py --require-match` makes exact bytes,
registers and return flags mandatory in addition to its ordered-access checks.
