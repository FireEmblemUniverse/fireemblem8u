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


The ARM adjacent rule also accepts optional `lr-input=read-only`. This requires
a global LR register binding and permits LR reads only in side-effect-free
sources of r0-r12 SETs. LR writes, stack references, implicit writeback and
control uses remain rejected, as do the existing frame/continuation violations.
Without the option, any LR body use is still rejected. This supports the
resampling mixer's fractional-position input without treating it as a normal
return address. `research/audio/check_arm_adjacent_lr.py` verifies arbitrary LR
values, flags and invalid contracts; the original adjacent checks remain passing.


For fractional-position updates, `lr-input=accumulator` adds exactly one
permitted LR-writing pattern to the read-only contract: a non-flag-setting
`LR = LR + r0-r12` SET. The compiler frame/call/restore are removed so the
updated LR reaches the adjacent private continuation. This is deliberately
not a normal C return ABI; explicit global LR binding and linker adjacency
remain required. Other LR writes, memory writeback and stack/control uses
remain rejected. Run `check_arm_adjacent_lr.py --accumulator` for execution
and guard checks; run without the flag to verify the read-only contract.


Optional `conditional=NAME` accepts one exact terminal two-call diamond: an
EQ/NE branch to the second call, first call followed by the common LR restore/
return, and second call jumping back to that return. The first call must name
the conditional target; the second must name the adjacent target. Both labels,
all body/frame checks and absence of prefix jumps bypassing the continuations
are verified. The pass reverses the branch condition, emits the explicit ARM
conditional-tail backend operation, and falls through on the other path.
Side-effect-free LR reads in combined result/condition-code SETs are accepted
when LR input is enabled. Default single-continuation behavior is unchanged.

The external conditional transfer uses an explicit UNSPEC with the condition
register as an input. An ordinary conditional-jump RTL would incorrectly invite
GCC's local-label verification and ARM final predication logic. This pattern
still emits one four-byte conditional ARM branch. The linker MUST enforce
adjacency, word alignment, branch range and the intended copied-code scope;
production resampling checks all of these against its mixer boundaries.
`research/audio/check_arm_conditional.py` checks both outcomes, full shift flags,
relocation to RAM and invalid compiler/link contracts with checking enabled.


Optional `sp-input=frame64` requires a global SP binding and permits only
aligned SI word loads at offsets 0..60 from the incoming private frame, including
single predicated loads. SP updates, stores, other widths and out-of-range
accesses remain rejected; local frames and the existing call/return restrictions
still apply. Removing the sole LR save preserves the explicitly declared incoming
SP coordinate system. This is a private entry contract, not a normal C-call ABI.

Within that contract, an exact CMP(reg,0), conditional frame load, identical CMP
sequence may reuse the first comparison. The load must not write the compared
register, and no other instructions or labels may intervene. The rule removes
any stale condition-code death note on the load. `check_arm_frame.py` verifies
frame boundaries, ordered reads, backward conditional transfers, unchanged
frame/SP/LR, rejection cases and a compared-register overwrite that must retain
the second CMP. Production `src/m4a_loop.c` uses this contract with the shared
`include/gba/m4a_mixer_frame.h` layout.


`arm_indirect_frame.cc` provides `matching_arm_indirect_frame` for a private
ARM entry that stores incoming LR and finishes with an indirect sibling transfer
through r0. It requires global r0/SP/LR bindings, void zero-frame code, one LR
push and its immediate restore before the terminal transfer. Body control flow,
extra calls, explicit stack writes, LR writes, executable assembly, debug and
unwind forms are rejected. SP reads are aligned word loads within 64 bytes;
LR reads are restricted to a word store through an address independent of SP/LR.
The pass removes only the validated push/restore and stale LR death notes,
retaining the compiler-generated BX. This is a private ABI with incoming SP/LR.

When combined with `pc_address`, load that plugin first. An empty aligned
literal-pool shell after the transfer is accepted, but data and executable
instructions are rejected. The production linker enforces the 24-byte extent,
shared entry offsets and exact PC-relative Thumb continuation. Run
`research/audio/check_arm_indirect_frame.py` for execution and rejection checks,
and `check_soundmain_save.py` in ROM and copied-RAM modes for the production ABI.


The subtract-compare rule also accepts a register amount: an adjacent saved
old base, base-minus-amount SET and comparison of old base against that same
amount become SUBS. The amount must be an SI r0-r12 distinct from base and the
dead saved-value temporary. Intervening operations, changed operands and a live
saved temporary are rejected. Exact NZCV equivalence holds for all 32-bit
operands, including signed overflow. `check_subtract_compare.py --register`
checks this form; the default continues to check immediate amounts.


`byte_preincrement.cc` provides opt-in `matching_byte_preincrement`. It folds
exactly three adjacent operations: copy base to the eventual load destination,
update base by that copy plus an offset, and sign-extend a byte loaded from the
same sum into the copy register. The result uses an existing ARM PRE_MODIFY
load, preserving MEM attributes. The offset is either immediate one or a
separate r0-r12 register. Base/destination/offset aliasing is rejected. All
three operations must be unconditional or have the identical predicate;
intervening operations and labels are rejected. Only signed QI loads qualify.

`build_byte_preincrement.py` builds against the pinned compiler headers.
`research/audio/check_byte_preincrement.py` compares baseline/folded registers,
flags, ordered reads and unchanged memory, including untaken predicates,
negative register offsets and all byte values. Production `src/m4a_advance.c` uses this pass.


`subtract_zero.cc` provides opt-in `matching_subtract_zero` for the adjacent
sequence base-=1, empty tied +r(base), compare base with zero. The constraint
must be exactly one matching register input/output, with no labels/clobbers.
It emits SUBS with a comparison of the incoming base against one. This preserves
zero/equality behavior but can change carry and overflow versus CMP(result,0),
so every subsequent condition-code consumer must be an EQ/NE predicate until
an unconditional flag overwrite, call without flag inputs, or return. Labels,
other control transfers, embedded asm and non-equality flag consumers reject.

The rule retains the base register, removes the empty tie and redundant CMP,
and leaves unannotated functions unchanged. `check_subtract_zero.py` checks
baseline/folded values and independently expected flags, signed overflow and
ARM/Thumb returns, plus rejected contracts. The source-advance candidate uses
it to reproduce original SUBS flags; production `src/m4a_advance.c` now uses it.


ARM adjacent `early=NAME` accepts a single prefix EQ/NE or signed relational
branch around a straight-line body ending in the adjacent call. The alternate
arm calls NAME and rejoins the common LR restore/return. Exactly those two
labels and both named calls are required; additional prefix jumps or work after
calls reject. The original branch condition is retained in the explicit ARM
conditional transfer. This mode runs after `shorten` so preceding opt-in
arithmetic folds finish before calls/frame are removed. All emitted instructions
are fixed-width ARM; linker assertions enforce adjacency, alignment, branch
range and copied-code scope. Default terminal-diamond processing is unchanged.

`lr-input=masked` requires the existing global LR binding. In addition to
side-effect-free LR reads, it permits exactly LR &= 0xC07FFFFF and a single-input,
single-output empty tied LR register constraint. Other LR writes remain rejected.
This supports fractional-position masking without saving/restoring a return
address. `check_arm_early.py` checks invalid contracts and
`check_soundmain_advance.py` checks exact linked bytes and production execution
in ROM and copied RAM. Production `src/m4a_advance.c` uses these contracts.


`signed_sum.cc` provides opt-in `matching_signed_sum` for one exact widened
signed addition and positive-test sequence: sign extraction, low-word add with
carry, high-word ADC, low comparison with one, high borrow comparison and GE
branch. It requires a distinct nonglobal high temporary, dead/unused at the
comparison, and dead comparison flags at the branch. All operations must be
adjacent except notes; aliases, extra operations and alternate comparisons
reject. The replacement uses `match_arm_signed_sum_flags` plus an ordinary GT
branch, preserving the original target and operand order.

The explicit flags operation emits ADDS but its opaque condition value may
only feed that immediately following GT branch. A mathematical signed sum can
be negative while its low word is zero (INT_MIN + INT_MIN), so allowing EQ
would be incorrect. The validated positive predicate remains exact for all
signed 32-bit inputs. Rebuild the pinned backend with `build_backend.py` before
building this plugin. `check_signed_sum.py` tests guards and opt-in isolation;
`check_soundmain_wrap.py` tests full registers/NZCV and both iteration outcomes
against the original, including signed overflow. Production `src/m4a_wrap.c` now selects this pass.


ARM adjacent `transfer=branch` retains a terminal transfer instead of removing
it for fallthrough. After the complete existing frame/body validation, the
normal direct call becomes the compiler's direct sibling-call pattern, which
emits B without changing LR. The sole LR push, restore and return are removed.
It composes with the `early` exit contract. Default fallthrough is unchanged.
The caller's linker contract must check the named destination's ARM mode and
branch range rather than adjacency; the production wrap loop branches to its
own verified entry. `check_arm_repeat.py` covers invalid contracts and
`check_soundmain_wrap.py` checks production backward/forward exits in ROM/RAM.


ARM adjacent `sp-input=pop2` requires global SP and exactly three prefix body
operations immediately after the validated sole LR save: an SI load from SP,
an SI load from SP+4 into a higher-numbered r0-r12, and SP+=8. The pass combines
them into the existing ARM load-multiple-with-writeback operation, preserving
both MEM attributes and load order. No other explicit SP use is accepted in
this mode; it is separate from read-only `frame64`. Labels, intervening operations,
wrong offsets/widths/order and additional stack accesses reject. The compiler's
LR push/restore are then removed under the existing private-frame validation.

Production `src/m4a_stop.c` uses pop2 with `transfer=branch`. Its linker checks
12 bytes and a forward ARM partial-completion target in the copied mixer.
`check_arm_pop_pair.py` checks rejected contracts; `check_soundmain_stop.py`
checks original/production ordered reads, exact SP advance, all registers/flags
and untouched frame/canaries in ROM and copied RAM.


ARM adjacent `early=NAME` also accepts LTU/GEU condition codes, preserving the
incoming CC mode and condition when emitting the external conditional transfer.
This includes CC_C produced by `matching_add_carry`; its reversed carry encoding
is retained, so a C overflow test branches with the corresponding BCC/BCS.
Default terminal-diamond conditions remain EQ/NE. Existing exact tail, prefix,
frame and destination validation still applies.

Production `src/m4a_fixed_lane.c` and `src/m4a_resample_lane.c` use unsigned
addition overflow to advance the packed output lane. Both compile to ADDS/BCC
and fall through to adjacent word completion on carry. Link assertions check
eight-byte size, adjacent completion and backward aligned mix targets inside
the copied mixer. `check_arm_carry_early.py` exercises both carry polarities in
ROM and relocated code; an extra return rejects in add_carry before the adjacent
pass, while post-call work, debug and unwind settings reject in arm_adjacent.
`check_soundmain_lane.py` checks both original/production blocks and full flags.


ARM adjacent `sp-input=push2` requires global SP and exactly three prefix
operations after the compiler's sole LR save: SP-=8, an SI store from a general
r0-r12 to SP, then an SI store from a higher-numbered r0-r12 to SP+4. No labels,
barriers, wrong offsets, reversed register order or additional SP use are
accepted. It emits GCC's existing push pattern, with conservative memory alias
information and volatility retained. The generic store-multiple predicate
rejects negative writeback, so this uses the dedicated push representation.
Normal compiler LR save/restore removal still requires the complete existing
terminal-frame contract. Default frame modes are unchanged.

`lr-input=load-word` requires a global LR binding and exactly one unconditional
SI load into LR from a general r0-r12 base, optionally plus an aligned constant
from zero through 60. Writeback, stack-relative loads, arithmetic writes and
additional LR operations reject. This preserves a channel's fractional position
while entering the private resampling frame. Other LR modes are unchanged.

Production `src/m4a_resample_setup.c` combines these contracts with signed byte
preincrement. `check_arm_push_pair.py` verifies 13 rejected configurations;
`check_soundmain_resample_setup.py` compiles an exact standalone 28-byte object
and checks the original and production blocks in ROM/copied RAM, full state,
ordered accesses and aliases. The linker checks original entry/size and the
adjacent ARM mixing continuation.


ARM adjacent `early-pair=NAME` handles one strictly validated three-path tail:
two prefix conditional branches, a main call to `destination`, common LR
restore/return, a call to NAME plus jump to that restore, and an LR=0 assignment
followed by another destination call and jump to the same restore. Exactly
three labels must identify those two alternate blocks and the common restore;
other branch shapes, changed targets or additional alternate-block work reject.
Conditions are EQ/NE or signed LE/LT/GE/GT. It requires `lr-input=remainder`.

The LR=0 assignment is predicated by the second branch condition and moved
immediately before that branch. Both branches become external conditional
transfers, preserving their CC modes. The original assignment UID is reused:
this pass runs after shortening, where allocating a new instruction UID would
invalidate final-pass address tables. The usual whole-body/frame validation
then removes only the main call and common compiler frame. All remaining
instructions have fixed ARM widths; link assertions constrain destinations.

`lr-input=remainder` permits LR copies from r0-r12, LR minus r0-r12, and a
CC-predicated LR=0 SET. Other LR operations reject. Production fixed-rate setup
uses this with the existing subtraction comparison fold. `check_arm_early_pair.py`
checks twelve invalid forms; `check_soundmain_fixed_setup.py` checks all three
paths, signed-overflow flags, original/production ROM/copied RAM and exact bytes.
Existing single-exit/default frame contracts remain unchanged.


ARM adjacent `sp-input=store0` requires a global SP binding and one exact prefix
instruction immediately after the compiler's sole LR save: an SI store from
r0-r12 to incoming SP with no writeback. Any label, barrier or other prefix work
rejects; the complete body check rejects further SP accesses or updates. The
store itself is retained unchanged, including its memory attributes, while the
existing contract removes the compiler LR save/restore. Frame64, pop2 and push2
modes are unchanged. Production `src/m4a_sample_entry.c` uses this with the early
resampling exit. `check_arm_store_zero.py` covers twelve invalid contracts;
`check_soundmain_sample_entry.py` verifies exact bytes, ordered accesses, flags,
registers and alias effects against the original in ROM and copied RAM.


ARM adjacent `sp-input=pop2-decrement` retains one exact nonflag prefix decrement
before the existing pop-pair sequence: a general r0-r12 register minus one.
That register must differ from both restored registers. The remaining prefix
must be the normal ascending word loads from SP/SP+4 and SP+=8; barriers,
other arithmetic, wrong offsets and further SP effects reject. Only the loads
and stack adjustment are combined, preserving the preceding decrement and
original load attributes. Ordinary pop2 behavior is unchanged. Production
`src/m4a_resample_finish.c` uses this to rewind r3 and restore r4/r12 before
falling through to channel saving. `check_arm_pop_decrement.py` covers ten
invalid contracts; `check_soundmain_resample_finish.py` checks production state,
ordered reads, source wrap and stack canaries in ROM/copied RAM.


`word_postincrement.cc` additionally provides opt-in
`matching_thumb_word_postincrement` for Thumb-1. It requires the same adjacent
SI store and same-base increment by four, with distinct low-register base/value
operands. The copied MEM retains volatility and alias attributes; POST_INC
selects Thumb STMIA writeback and the update is removed. ARM's original attribute
still rejects Thumb mode, and selecting both attributes rejects. Unannotated
functions are unchanged. A high C register binding may first be copied into a
low RTL operand, which is valid; the fold itself never emits a high-register STM.

Thumb STM preserves NZCV, unlike a separate flag-setting ADDS pointer update.
`check_thumb_word_postincrement.py` verifies the resulting flags, memory, registers
and both return modes across four register pairs, including a stack-slot output.
The no-reverb research candidate uses empty tied pointer constraints to preserve
each store/update boundary, avoiding address coalescing and temporary-register
copies. These constraints contain no executable instructions. The whole block
still needs shift/carry, countdown and private-fallthrough matching.


`shift_carry.cc` provides opt-in `matching_shift_carry` for Thumb-1. It requires
an exact four-operation sequence: a low counter copied to a distinct nonglobal
low temporary, counter >>= n (1..31), an empty tied counter constraint, and a
bit-test branch on bit n-1 of the copy. The branch must both consume and clobber
the dead temporary. The late pass replaces it with `match_thumb_shift_carry`,
which explicitly describes the shifted counter result and the discarded-bit
branch. It deletes only the copied temporary, separate shift and empty tie.
The counter result and flags come from LSRS; EQ/NE select BCC/BCS respectively.

Only a short forward target through a single straight block is allowed. Labels,
calls, other jumps or executable assembly before the target reject; the bounded
span must be at most 240 bytes. This avoids depending on unchecked Thumb branch
range or expanding a carry branch into a call. Rebuild the pinned backend before
building this plugin. `check_shift_carry.py` covers all 31 shifts, both branch
polarities, full registers/NZCV and ROM/copied code, plus rejection and opt-in
isolation checks. The no-reverb candidate supplies an explicit discarded-bit
expression and a branch-likelihood hint to retain the original inline layout;
its signed countdown/fallthrough still require separate matching work.


## Subtraction flags and unsigned branches

`thumb_subtract_branch.cc` provides `matching_thumb_subtract_branch`, used by `src/m4a_buffer_entry.c` and its research checker with `--subtract-branch`.
It requires `matching_tail_transfer` and Thumb-1. A low-register `dst=src-1`,
an exact empty self-tie on dst, and an immediately following unsigned `src<=1`
branch become a single SUBS/BLS bundle. Distinct source/destination registers
and a conservative short forward target are required. Unsupported annotated
functions fail compilation; unannotated functions are unchanged. The standalone
`check_thumb_subtract_branch.py` verifies full-width arithmetic, registers,
flags and private transfers, plus invalid contracts. The production buffer object selects this attribute with its private transfer contract.


## Buffer entry literal and ADD selection

`thumb_add_order.cc` provides `matching_thumb_add_order`. After allocation it
commutes low-register additions when the destination is the second source, so
the destination is printed first. Modular arithmetic and ADD flags are unchanged.
Unsupported annotated functions fail; unannotated functions are unchanged.
`check_thumb_add_order.py` covers full-width sums, NZCV, registers and rejection
contracts. `build_thumb_add_order.py` builds against the installed matching GCC.

The integrated `src/m4a_buffer_entry.c` combines this rule with literal constant
selection, subtraction/branch folding, private r3 transfer and the existing
shared-literal pool pass. Its pool remains in the assembly entry object; the
linker verifies the 36-byte C extent and every fixed shared-pool position.
`SoundMainRAM_BufferThumb` is the linker alias for the copied Thumb entry address.
The compiler removes its private pointer pool in favor of the existing shared
word. The remaining outer assembly loads use explicit R_ARM_THM_PC8 relocations
after splitting their pool into a separate input section.


## Deadline setup after shared-pool removal

The `after-shared-literals` option on `tail_transfer.cc` schedules its pass after
branch shortening, when the existing shared-literal pass has already removed
local pool words and alignment. This mode requires one terminal call and the
private, acyclic terminal-adjacency contract. It only removes that call/frame
and uses same-length unsigned-bound rewrites; it does not create new branches.
A zero-valued VUNSPEC_POOL_END marker is accepted and removed as zero-code
metadata. Any remaining alignment, word data or executable trailing operation
still rejects. Other users keep the existing pass timing.

`src/m4a_deadline_setup.c` uses this mode to fall through into the adjacent
SoundMainCallbacks fragment. The linker proves its 20-byte extent, callback
adjacency and shared VCOUNT literal position. The checker
`research/audio/check_soundmain_deadline_setup.py` supports `--production` for
byte verification and `--guards-only` for compiler checks without repeating the
exhaustive execution run. A normal run covers every pair of byte inputs, every
initial NZCV and two ordinary/stack-alias layouts.


## Shared callback trampoline

`thumb_callback_chain.cc` provides `matching_thumb_callback_chain`, used by
`src/m4a_callbacks.c`. It accepts only the private r0/r3/SP optional/mandatory
callback shape: a volatile pointer load and exact empty r3 tie, null branch,
argument load and first callback, bounded frame reload, mandatory pointer load
and second callback. It proves the branch target, LR-only compiler frame,
zero local frame, empty argument usage and the ordinary epilogue; debug/unwind,
extra work, live labels or other frame/register conventions reject.

The pass removes the compiler's extra frame and epilogue and selects
`match_thumb_shared_callback` for each C indirect call. The RTL still calls the
r3 callback; its encoding uses BL to the declared `trampoline=SYMBOL` plus an
even `offset`, where an existing BX r3 transfers to that callback. Production
uses the typed `SoundMainRAM_ExitRestore` function plus 18, avoiding a veneer for
an untyped odd alias. The linker proves callback extent, final fallthrough and
BL reach; execution checks verify the shared BX bytes and both ARM/Thumb modes.
`check_soundmain_callback_chain.py` also verifies unannotated output is unchanged and rejects
12 unsupported contracts. No new inline instruction template is added to C.
