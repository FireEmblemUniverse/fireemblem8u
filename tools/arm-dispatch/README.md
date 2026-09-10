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

The `ip_return` plugin supports the command and flag setters and the tempo, port, modulation-type and voice-selection and LFO/modulation reset handlers.
It is built by `build_ip_return.py` against the installed compiler. The explicit
`matching_ip_return` attribute requires a straight-line void function with an
LR-only frame, and every direct call must have a `preserves-ip=SYMBOL` manifest
entry. The helper and its entire call path must preserve r12; this is a private
ABI requirement checked against the actual audio reader by the production
oracle, not a property inferred for arbitrary external functions.

The pass rejects stack use, indirect calls, unsupported branches, executable or unsupported assembly, global r12
variables, exposed return registers and debug/unwind/exception configurations.
The only accepted inline constraint is an empty, single low-register `+r`
operand with no extra inputs or clobbers; it emits no instructions.
After the return, compiler-generated constant word pools and their alignment
are permitted only behind a control-flow barrier. Executable instructions after
the epilogue remain rejected.
It replaces the entry LR push with a register move and the epilogue with BX r12.
`research/audio/check_ip_return.py` covers accepted and rejected contracts;
`check_command_setters.py --compiler COMPILER --plugin PLUGIN --require-match
--production` checks the exact linked setter bytes and actual ROM helper calls.

The opt-in `forward-exits` option permits low-register EQ/NE branches (including comparisons with zero) to the
single terminal epilogue, after the entry save and at least one contracted call.
The label must occur later in the instruction stream and lead directly to the
epilogue, allowing only the compiler's zero-code SP-use marker in between.
Backward branches, ordered comparisons and targets before further body work
remain rejected. `src/m4a_mod_type.c` uses this option; the existing setters keep
the default straight-line restriction. `check_command_setters.py --mod-type`
exercises both taken and fallthrough paths with the actual ROM reader.


## Direct Thumb terminal transfers

`tail_transfer.cc` and `build_tail_transfer.py` provide the opt-in
`matching_tail_transfer` contract used by `src/m4a_pattern.c`. Each direct
Thumb destination is listed with `destination=SYMBOL`. The pass proves that
all paths reach terminal calls, rejects local frames and work after calls,
and replaces the LR-only frame/calls with direct branches. It rejects debug,
unwind, indirect calls, backward loops and bare return paths. Keep
`-fno-reorder-blocks` for the supported forward layout.

`raise-unsigned-bound` permits a GTU-immediate to GEU-next-immediate rewrite;
private flags must be verified for the selected routine. The pattern oracle
checks actual destination-entry SP/LR as well as memory and final registers.
The assembler/linker must reject out-of-range Thumb branches; this contract
does not synthesize veneers. `research/audio/check_tail_contracts.py` and
`check_tail_range.py` cover rejection rules and branch limits.


## Shared Thumb stack frames

`shared_frame.cc` and `build_shared_frame.py` support the opt-in
`matching_shared_frame` attribute used by `src/m4a_repeat.c`. One declared
`destination=SYMBOL` is replaced by a branch to `entry=SYMBOL`, whose private
contract consumes the already saved LR. Explicit `returning-call=SYMBOL`
entries remain ordinary calls. The LR-only entry frame and common local return
are retained, so local-completion paths remain valid. Terminal transfer paths
must reach that return without further body work. Debug/unwind, unsupported
stack uses, indirect calls and backward control flow are rejected.

The repeat oracle compares actual shared-entry SP/LR and covers counter
wraparound and aliased reads. The private entry and returning-reader register
contracts are verified against ROM code; they are not inferred for arbitrary
manifest symbols. Branch-range restrictions are the same as terminal transfers.


`ip_return` also has an opt-in `body-branches` mode for private-ABI loops.
All direct branch labels must be inside the region after the LR save and before
the terminal epilogue; indirect transfers and return-register/stack operands
remain forbidden. Every call still needs its r12-preservation contract. The
trailing pool may contain integer or symbol-address words behind the terminal
barrier. The jump-table research oracle exercises this mode; it is not enabled
for existing production functions.


Shared literal manifests also accept `symbol-literal=SOURCE_SYMBOL,POOL_SYMBOL`.
The source must be a symbol-address word in the compiler's local pool; the
replacement names an existing shared pool word containing that same address.
Explicit assembler-name aliases are normalized, and duplicate/missing sources
or malformed identifiers are rejected. The linker must still enforce the Thumb
PC-relative load range. The jump-table research oracle exercises the real shared
pool; production VSync continues to use numeric manifests.


## Guarded countdown loops

`countdown.cc` and `build_countdown.py` provide `matching_countdown` for the
jump-table copy. It requires a positive constant initializer in 1..255, one
short backward loop branch and one adjacent decrement, with no other counter
writes. Calls need `preserves-counter=SYMBOL`; that is a private ABI contract
verified against the actual helper. The bounded counter cannot overflow, so
SUBS flags replace the redundant comparison. The Makefile combines this pass
with private-return and symbolic shared-literal support for `m4a_jump_table.o`.
The linker explicitly bounds its shared literal. `check_countdown.py` exercises
boundary counts, rejected forms and unchanged unannotated code.


`byte_postincrement.cc` provides the opt-in ARM-only
`matching_byte_postincrement` attribute. It selects an existing post-index
signed/unsigned byte-load pattern from an adjacent byte load and +1 pointer
update, preserving memory attributes and rejecting annotated functions with no
eligible pair. It does not cross instructions or labels and excludes special
or overlapping base/destination registers. Build with
`build_byte_postincrement.py`. The production `src/m4a_reverb.c` uses this rule.
`research/audio/check_byte_postincrement.py` checks instruction bytes, execution,
rejection boundaries and unchanged unannotated output.


`subtract_compare.cc` provides opt-in ARM `matching_subtract_compare` for an
adjacent old-value copy, subtraction and comparison with the same immediate
(1..255). The copy's temporary must be non-global and dead at the comparison.
The existing GCC SUBS pattern reproduces the comparison's full flags, including
overflow; no positive-count assumption is needed for the fold itself. Build with
`build_subtract_compare.py`; test with `research/audio/check_subtract_compare.py`.
The production `src/m4a_reverb.c` uses this rule.


`pc_address.cc` and `build_pc_address.py` provide `matching_pc_address` with
mandatory `symbol=NAME` and `offset=0..255` arguments. One direct symbol-word
pool load becomes the backend's explicit `match_arm_pc_address` operation:
ADD destination, PC, immediate. The pool word is removed. Other symbols,
multiple loads, unsupported pool references and non-ARM use are rejected.
The linker MUST assert the symbol address equals the emitted instruction's
address plus eight plus the selected offset. Production reverb asserts its
84-byte size and Thumb continuation address relative to the 76-byte calculation.
C's indirect sibling call then emits BX and honors the Thumb bit. This keeps the
transfer valid after SoundInit copies the mixer to RAM. `check_pc_address.py`
covers PC values, flags, rejection cases, and deliberately broken link contracts.


`add_carry.cc` and `build_add_carry.py` provide opt-in ARM `matching_add_carry`.
The pass replaces an equivalent negative-immediate comparison/add pair followed
by an unsigned carry branch with GCC's addition/carry pattern, preserving the
machine branch sense across CC/CC_C modes. Positive addends must be below
0x80000000; the condition flags must die at the adjacent LTU/GEU branch. It does
not cross other operations. Tests are `research/audio/check_add_carry.py` and
`check_soundmain_packed.py`. The production packed-mixer loop uses this rule.


`arm_adjacent.cc` and `build_arm_adjacent.py` provide `matching_arm_adjacent`
with a mandatory `destination=NAME` contract. They remove a sole LR save,
terminal direct call, immediate LR restore and return, allowing private ARM
code to fall through to its continuation. The linker MUST place that ARM
continuation immediately after the C section. Local loops are allowed; branches
that bypass the call, additional calls, local frames, SP/LR body uses, executable
asm, debug/unwind and non-void functions are rejected. Empty register constraints
are allowed. `src/m4a_packed.c` uses this with explicit size and adjacency asserts;
`research/audio/check_arm_adjacent.py` covers execution and rejection boundaries.


`word_postincrement.cc` and `build_word_postincrement.py` provide opt-in ARM
`matching_word_postincrement`. An adjacent SI word store and non-flag-setting
base increment by four become the existing ARM POST_INC store pattern. Base
and stored value must occupy distinct r0-r12 registers. The pass copies MEM
volatility/alias attributes, adds REG_INC, and crosses no intervening operation
or label. Thumb, wrong widths/steps, offset addresses, same-register operands,
loads and missing updates are rejected when no eligible sequence exists.
Unannotated functions are unchanged. `src/m4a_partial.c` uses this rule;
`research/audio/check_word_postincrement.py` compares baseline/folded execution,
ordered writes, all flags, ARM/Thumb returns and rejection boundaries.
