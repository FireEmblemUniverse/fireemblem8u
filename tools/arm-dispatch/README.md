# Matching ARM dispatcher compiler

The production `src/arm/map_flood_core.c` uses an isolated GCC 16.2.0 backend
with explicit PC-read, BX and PC-relative shared-literal RTL patterns. Two late
passes fuse XOR/zero comparisons and lower switch tables, preserve the source's
valid-index contract, move eligible jump-only blocks, and emit prefix pointers
and branch targets from compiler RTL. The passes contain no game opcodes or
ROM byte arrays. Game-specific pointer names are Makefile arguments.

Run `make compare -j8` from the repository root. Make builds the compiler and
compatible plugins as needed. The bootstrap currently targets the project's
Apple Silicon macOS environment: clang/clang++, make, tar, and Homebrew GMP,
MPFR, MPC, ISL and ARM binutils under `/opt/homebrew` are required. It downloads
GCC from GNU, checks the pinned SHA-256 and original ARM backend checksum, and
installs under `.deps/gcc16-matching/install`. It does not replace system GCC.
The legacy research-path comment in the appended backend include is retained
as part of the existing checked source format; `matching.md` here is canonical.

Explicit bootstrap commands:

```sh
python3 tools/arm-dispatch/build_backend.py
python3 tools/arm-dispatch/build_branch_tables.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
python3 tools/arm-dispatch/build_xor_flags.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
```

Do not reuse plugin binaries built against system GCC: the extension changes
machine-pattern IDs. The builders use the selected compiler's own plugin headers.
Build provenance JSON files record source/binary hashes and compiler commands.

Validation fixtures remain in `research/arm/compiler/`: `check_xor_flags.py`,
`check_branch_tables.py`, `check_shared_literal.py`, and `check_prefix_tables.py`.
They accept `--compiler` and `--plugin`. The dispatcher tests additionally
compose the two passes and execute both controlled and actual ROM helpers:

```sh
.deps/arm-oracle-venv/bin/python research/arm/check_map_flood_full.py \
  --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc \
  --plugin .deps/flood-core-new-backend/xor_flags.so \
  --plugin .deps/flood-core-new-backend/branch_tables.so \
  --pc-relative --unchecked --sink-trampolines --shared-literal \
  --shared-queue-literals --prefix-table
```

The unchecked switch attribute requires the caller to supply a valid connection
in 0..5. Prefix emission rejects surviving references to the removed literal
pool. Shared literal relocations are checked by the linker for ARM range limits.
These tools support this matching build; they are not a general GCC distribution.

The same isolated compiler also builds `src/m4a_end_tie.c`. The pinned
`thumb-leaf-frame.patch` and `leaf_frame` plugin provide an explicit Thumb-1
leaf contract, low-register save frame, encodable unsigned boundary rewrites
and commutative register TST operand ordering. Default functions retain normal
compiler behavior. The builder verifies both original and patched `arm.cc`
hashes, applies the patch to original source when needed, and records its hash.
`build_leaf_frame.py` builds against the chosen compiler's plugin headers.

`research/audio/check_leaf_frame.py` checks the contract and rejected uses.
`research/audio/check_end_tie.py --compiler COMPILER --plugin PLUGIN --production`
compares the exact candidate with the production ROM and executes the original
and production code, including r0-r12, stack, complete test RAM and flags.

VSync uses `thumb_shared_literal.cc`, built by `build_thumb_shared.py` against
the same installed compiler headers. Its explicit options select shared Thumb
word relocations, carry-bit branches, proven unsigned-byte decrement/store/branch
bundles and zero-filled data-pool alignment. See `research/audio/README.md`
for the contracts. GNU ld can silently wrap the Thumb PC8 relocation, so
`ldscript.txt` explicitly bounds both shared literals relative to the complete
VSync section. The original pool remains in the adjacent MPlayMain assembly.

The normal `make compare -j8` builds the compiler/plugin dependencies and
verifies the whole ROM. Run `research/audio/check_sound_vsync.py` with the
installed compiler, `thumb_shared_literal.so`, `--carry-tests --byte-counter
--zero-pool-padding --require-match --production` for the production CPU oracle.
Standalone regressions are `check_thumb_byte_counter.py`, `check_thumb_carry.py`
and `check_thumb_literal_plugin.py`, each accepting `--compiler` and `--plugin`.
Large leaf far-branch fixtures remain unsupported by this GCC backend (the
baseline compiler also rejects them); VSync only uses short branches.

The `ip_return` plugin supports the command and flag setters and `src/m4a_tempo.c`.
It is built by `build_ip_return.py` against the installed compiler. The explicit
`matching_ip_return` attribute requires a straight-line void function with an
LR-only frame, and every direct call must have a `preserves-ip=SYMBOL` manifest
entry. The helper and its entire call path must preserve r12; this is a private
ABI requirement checked against the actual audio reader by the production
oracle, not a property inferred for arbitrary external functions.

The pass rejects stack use, indirect calls, branches, executable or unsupported assembly, global r12
variables, exposed return registers and debug/unwind/exception configurations.
The only accepted inline constraint is an empty, single low-register `+r`
operand with no extra inputs or clobbers; it emits no instructions.
It replaces the entry LR push with a register move and the epilogue with BX r12.
`research/audio/check_ip_return.py` covers accepted and rejected contracts;
`check_command_setters.py --compiler COMPILER --plugin PLUGIN --require-match
--production` checks the exact linked setter bytes and actual ROM helper calls.
