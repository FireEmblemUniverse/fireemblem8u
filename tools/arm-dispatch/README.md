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


## SoundMain entry frame

`thumb_entry_frame.cc` provides `matching_thumb_entry_frame`. It validates the
entire lock gate and explicit frame construction in `src/m4a_entry_frame.c`:
fixed r0-r11/SP/LR bindings, matching constant-pool values, exact empty ties,
unsigned lock comparison/increment/store, ordered register saves and high-register
copies, stack decrements, and the compiler's zero-local-frame entry/return.
Other operations, labels, frame sizes and debug/unwind configurations reject.

The pass selects two grouped PUSH patterns from the proven word stores, replaces
the mismatch-to-common-return branch with the original equality/early-BX layout,
and removes the compiler's extra LR save/return. Shared loads use the declared
`pointer=VALUE,SYMBOL` and `id=VALUE,SYMBOL` literals only after their compiled
values are verified. The caller's LR is preserved and saved in the mixer frame.
The valid path falls through into adjacent deadline setup, as checked by the
linker. The literal pool itself is defined by `src/m4a_entry_literals.c`.

`check_soundmain_entry_frame.py --production` compares all 32 bytes and checks
ordered saves, RAM aliases, flags, registers, ARM/Thumb early returns and SP at
each instruction. `scripts/audit_soundmain_region.py` verifies the complete
1,064-byte entry/mixer region, including its separately identified C-only data
object. The original SoundMain assembly is fully replaced; other audio routines
still use `src/m4a_1.s`.


## Unsigned inclusive-bound comparison selection

The separate `raise-unsigned-le-bound` tail-transfer option changes unsigned
`x <= k` to `x < k+1` for immediate bounds 0..254. This preserves the branch
decision while selecting the original comparison instruction and its flags.
It does not change the existing `raise-unsigned-bound` option or default behavior.
Signed comparisons and larger bounds remain unchanged; invalid option values,
duplicates and incompatible straight adjacency reject.

The MPlayMain tempo gate uses this option to select CMP r0,150 / BCC after storing
r0's low halfword. The register retains the complete 32-bit value, so the branch
must not use the truncated field. Accumulator and tick-finish fragments use the
existing direct-tail and adjacent-tail modes. The gate touches no stack memory;
its private-tail contract only removes the compiler's extra frame.
`check_mplay_tempo.py --production` verifies the three fragments together, while
`check_tail_unsigned_le.py` guards compiler selection and unaffected cases.

### Private Thumb decrement/store equality branches

`matching_thumb_store_decrement_zero` explicitly selects SUBS/STRB/BEQ-or-BNE
for a decrement by one, byte store of that same register and zero comparison.
It requires `matching_tail_transfer`, low registers, a byte-store address with a
separate low base and offset 0..31, and a short forward target. Intervening work,
nonzero comparisons, signed inequalities and wider stores are rejected. An exact
empty self-tie between subtraction and store is allowed. The rule applies after
the tail-transfer plugin and accepts the remaining tie or a directly adjacent
subtraction. The branch uses the full 32-bit result; only the store truncates.

The attribute deliberately selects the subtraction's carry and overflow flags,
which can differ from a separate comparison for unrestricted 32-bit inputs.
Private callers must verify the required flags. It is not a general optimization
for code that observes compiler-generated NZCV. Unannotated functions are unchanged.
The machine pattern shares the existing decrement marker but accepts only EQ/NE;
the older bounded-counter pattern continues to accept only ordered comparisons.

After rebuilding the matching compiler, build and check the plugin with:

```sh
python3 tools/arm-dispatch/build_thumb_store_decrement_zero.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
.deps/arm-oracle-venv/bin/python research/audio/check_thumb_store_decrement_zero.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_channel_gate.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --decrement-store
```

The standalone checker covers both equality senses, full-width boundary/random
values, all initial NZCV states and unsupported source forms. The MPlayMain
checker additionally tests every status/gate byte and initial NZCV combination
against the original ROM. This rule is used by the matching production MPlayMain channel gate, together
with the direct-tail rule below.


### Direct conditional private tails

`matching_thumb_direct_tails` retargets the validated local continuation stubs
left by `matching_tail_transfer`. It supports a zero comparison, the validated
EQ/NE decrement/store bundle, and an inverse masked-zero or plain-zero branch over an adjacent
unlabelled tail stub. A plain-zero skip becomes a direct nonzero transfer. The masked AND is commutative; low-register operands are
ordered ascending for the required TST encoding. No instruction or labelled entry
may intervene before a removed tail stub. Its obsolete barrier is also removed.

Every destination must be declared with `destination=NAME`; duplicate destinations
are rejected. `expected-transfers=N` requires exactly that many rewrites and rejects
missing or unsupported forms. The rule runs after branch shortening, so the
existing decrement/store rule has completed; transformations only shorten code or
retain its size. New external conditional targets require linker range assertions.
The production linker checks all three branch PCs, even destinations, the 28-byte
fragment extent and both continuation positions. The rule leaves unannotated
compilation unchanged and does not insert assembly into C source.

```sh
python3 tools/arm-dispatch/build_thumb_direct_tails.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
.deps/arm-oracle-venv/bin/python research/audio/check_thumb_direct_tails.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_channel_gate.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --production
python3 research/audio/check_mplay_channel_layout.py
```

The Makefile builds both new plugins automatically for `m4a_mplay_channel_gate.o`.
The channel checker proves exact original and production bytes before executing
all 1,048,576 status/gate/NZCV cases. Twelve existing invalid compiler contracts, four next-channel source forms and
eight altered production layouts are rejected. Channel traversal, ClearChain and full
MPlayMain execution remain outside this fragment's semantic checker.


The direct-tail rule also supports `m4a_mplay_channel_next.o`: a word load into r4,
CMP against zero, and BNE back to the channel gate. The zero path falls through
to track initialization. The linker proves the six-byte extent, adjacent track
entry and backward conditional-branch range; Thumb function symbols are masked
to their even instruction addresses for placement checks.

```sh
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_channel_next.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --production
```

Its 68,288 cases include pointer-word boundaries, every bit and 1,024 random
words across all initial NZCV states and four channel addresses, including reads
at SP, SP-4 and the last mapped RAM word. It checks the one ordered word read,
complete RAM, all registers and both continuations. Four invalid source forms
reject, and loading the plugin leaves unannotated compilation unchanged.


The existing direct-tail and tail-transfer rules also compile MPlayMain's
track-start guard (8 bytes) and default writes (24 bytes). No new compiler rule
was needed. The guard's TST preserves carry/overflow; the defaults' final ADD
retains track+6 in r1 while STRB reaches the tone type through its derived offset.
The six-byte `Clear64byte` call between these C fragments remains assembly.

```sh
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_track_init.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --production
python3 research/audio/check_mplay_channel_layout.py
```

The fragment checker passes 16,384 guard cases and 16,384 default-write cases,
covering all flags/memory-pattern bytes and initial NZCV, four track addresses,
all registers, complete RAM and ordered accesses. It checks the two fragments
independently and excludes the intervening clear call. Five new layout mutations
join the existing eight, checking guard/default extents, dispatch continuation,
and far or odd wait destinations.


MPlayMain's command-byte reader uses both existing unsigned-bound options in one
private tail function: `raise-unsigned-bound` emits CMP 128/BCS, and
`raise-unsigned-le-bound` emits CMP 189/BCC. Its final continuation is adjacent.
The resulting 22 bytes preserve the original running-status load, pointer advance
and conditional running-status store, including the required comparison flags.

```sh
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_command_read.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --production
```

The checker passes 328,640 cases: every constructed command/status byte pair in
five fixtures with cycling initial flags, plus all-NZCV boundary sweeps. Fixtures
include aliased stream/status and stream/pointer-field storage, a pointer field
at SP and a stream at the last RAM byte. For self-aliases the effective initial
pointer and bytes are derived after constructing memory. All registers, flags,
complete RAM and ordered accesses agree; execution stops before command decoding.
Two new size/continuation mutations bring the combined layout checks to fifteen.


### Preserving high-register Thumb copies

`copy_add_zero` now accepts the explicit flag `preserve-thumb-high-copies` with
`matching_thumb_copy_add_zero`. It leaves a distinct r0..r12 register copy
unchanged when either register is high, while still converting low-register copies
to flag-setting ADDS #0. At least one low-register copy must be converted. SP, LR,
PC, duplicate/value-bearing options and use with the ARM copy contract reject.
Without this option the original strict behavior remains; unannotated functions
are unchanged. The extended checker rejects eight original forms and five new
option/source forms and verifies a mixed high/low-copy fixture.

MPlayMain's 12-byte note setup uses this option to preserve MOV r0,r8, load the
callback pointer, subtract 207 from the command and put player/track arguments in
r1/r2. The last ADDS determines the required flags. Its callback invocation is an
adjacent C continuation, covered separately by the callback-tail checker below.

```sh
python3 research/audio/check_copy_add_zero.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --plugin .deps/flood-core-new-backend/copy_add_zero.so
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_note_setup.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --production
```

The latter passes 74,880 cases with every command byte, full-width command
boundaries/random words, all NZCV, three info addresses, and zero/high/full-width
player/track words. It checks all registers, SP/LR, flags, complete RAM and the
single callback-pointer read. Two new layout mutations bring the combined checks
to seventeen.


### Private callback followed by a continuation

`matching_thumb_callback_tail` handles exactly one no-argument r3 callback and
one declared no-argument direct continuation. It requires global r0-r3 bindings,
a void/no-argument zero-local-frame Thumb entry, an LR-only compiler prologue,
the exact return epilogue, no live labels, and no debug/unwind/profiling setup.
It removes that extra compiler frame, emits the callback through the declared
shared BX r3 trampoline, and branches to the continuation without changing the
callback's returned registers, SP or flags. Other instruction/call layouts reject.
The trampoline must be a typed Thumb function implementing BX r3; this contract
is verified from the linked ELF and matching ROM bytes for the production use.

```sh
python3 tools/arm-dispatch/build_thumb_callback_tail.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_note_invoke.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --production
```

The MPlayMain invocation is six bytes: BL call_r3, then B to track wait. Its
49,152 tests execute synthetic Thumb and ARM callbacks containing STR/BX LR,
cover every pair of incoming/returned NZCV states, four stack positions and three
write aliases, and compare callback-entry state, all returned registers, full RAM
and ordered accesses. Eleven unsupported compiler contracts reject; unannotated
objects are unchanged. The checker does not claim to validate real ply_note logic.

Linker expressions resolve the Thumb function to its even instruction address,
so the Thumb tag is checked in ELF symbol metadata rather than a linker bit test.
The linker checks the exact shared-trampoline address, fragment extent, following
entry and continuation range. Four new negative layouts bring the combined checks
to twenty-one.


The non-note command setup also uses the existing private tail and mixed-register
copy rules. Its 18 bytes compute command-177, store the command byte, load the
jump-table pointer, scale the full-width index, read the callback and copy player/
track arguments. The byte store uses an offset derived from `MusicPlayerInfo.cmd`;
the subtraction/index stays full width until the original shift. The compiler
preserves the store before either table read, including overlapping storage.

```sh
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_command_setup.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --production
```

The 279,552 cases cover all command bytes with four top-bit patterns, additional
word boundaries, all NZCV and four track words. They include table/command fields
at SP, a command store overlapping the selected entry, and a command store that
changes the table pointer before it is read. The latter uses aligned resulting
word loads. Full RAM, r0-r12, SP/LR, flags and ordered accesses agree. The callback
invocation and post-callback logic are excluded. Two new layout checks bring the
combined negative layouts to twenty-three; no compiler rule changed here.


### Unsigned immediate command guards

`thumb_direct_tails` accepts opt-in `unsigned-immediate=lt` or `=le` with
`expected-transfers=1`. It recognizes a low-register unsigned `x > k` branch
that skips a single declared unconditional tail, with no intervening instructions
or labels before the stub and no instructions between it and the skip label.
The inverted external transfer is `x <= k`; `lt` expresses the equivalent
`x < k+1` and requires the adjusted bound to fit 0..255. `le` retains the bound.
The new machine pattern emits CMP/BCC or CMP/BLS. Exactly one such rewrite must
occur; this option cannot combine with descending masked-operand order.
Signed comparisons and unsupported immediate shapes fail this contract.
The option is inactive unless the function carries the private tail and direct
tail attributes; existing direct-tail behavior is unchanged without it.

The strict form recovers the original comparison against 207, rather than the
compiler's canonical comparison against 206, so the MPlayMain note guard has
matching CMP flags as well as matching branch decisions. The wait guard uses
inclusive comparison against 176. Both fragments are integrated in production; complete MPlayMain verification
remains unfinished.

```sh
python3 tools/arm-dispatch/build_backend.py
python3 tools/arm-dispatch/build_tail_transfer.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
python3 tools/arm-dispatch/build_thumb_direct_tails.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_command_guards.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
```

Both four-byte candidates match and pass 26,880 execution cases apiece, checking
all registers/CPSR/SP/LR and absence of memory accesses. Each rejects ten invalid
source/option configurations and preserves unannotated compilation.


### Local masked-branch operand order

`thumb_direct_tails` optionally accepts `descending-local-mask-operands`.
Exactly one local EQ/NE branch must test the AND of two distinct low registers
against zero. The pass orders the higher register first, preserving the logical
result and flags, and keeps this branch local. Other declared transfers can
still use the existing direct-tail rewrites. Missing/multiple masked branches,
duplicate/valued options, or combinations with unsigned-immediate or descending
external-mask order are rejected. Unannotated compilation is unchanged.

The MPlayMain track-dispatch candidate uses this for the original TST r1,r0,
while its separate zero-channel branch is folded to BEQ TrackInit. The tick
setup candidate needs only the existing private adjacent-tail contract and
ordered empty register constraints. Both fragments are integrated in production; complete MPlayMain remains unfinished.

```sh
python3 tools/arm-dispatch/build_thumb_direct_tails.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_tick_setup.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_track_dispatch.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
```


### Saved entry frame

`thumb_saved_entry_frame` selects MPlayMain's private POP/PUSH frame setup from
explicit C memory operations. It requires a zero-local-frame void Thumb function
with no arguments/debug/unwind and bound r0/r4-r11/SP, carrying
`matching_thumb_saved_entry_frame`. One `continuation` option names the no-argument
call that must be the terminal operation; the matching fragment falls through
and its linker must place that continuation immediately after its 14 bytes.

The pass checks exactly 19 compiler operations: the compiler LR-only prologue,
a volatile stack-word read, net SP adjustment -12, four ordered low-register
stores, four high-to-low copies, SP adjustment -16, four ordered high-bank stores,
the declared call and compiler return markers. It replaces the read/first
adjustment with POP r0 / PUSH r4-r7, and the second adjustment/stores with PUSH
r4-r7, preserving the four copies. Only the proven compiler prologue/return and
redundant scalar stores are removed. All other shapes are rejected.
The POP precedes the first PUSH, which overwrites the original saved-player word;
that ordering and every intermediate SP are verified against the ROM.

```sh
python3 tools/arm-dispatch/build_backend.py
python3 tools/arm-dispatch/build_thumb_saved_entry_frame.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_entry_frame.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_lock_callback_frame_model.py --frame-candidate
```

The frame is integrated as matching C in production. Its direct checker passes
26,880 cases and rejects 15 unsupported contracts; the complete original entry
path with the candidate frame passes 86,016 model cases, including lock rejections.

### MPlayMain lock and initial player/return save

`thumb_lock_frame.cc` implements `matching_thumb_lock_frame` for a private
zero-local-frame Thumb entry. It requires bound r0-r11, SP and LR, a void function
without arguments/debug/unwind, exactly two empty self-ties and eighteen other
RTL operations. The exact comparison, identifier read/store at r0+52, increment,
stack decrement, ordered player/LR saves, restored lock value, declared no-argument
continuation and ordinary compiler prologue/epilogue must all validate.

The successful comparison establishes the incremented lock value, allowing the
compiler's temporary LR copy and redundant constant reload to disappear when
selecting PUSH {r0,lr}. Rejection uses a flag-preserving BX LR; success falls
through into the declared continuation. The identifier store stays before both
stack writes, including overlapping addresses. The shared literal has an explicit
PC-relative relocation. This is a private entry convention, not ordinary ABI
function-call semantics. Integration must enforce the continuation's adjacency,
entry extent and literal address/range in the linker script.

Both `id=VALUE,SYMBOL` and `continuation=SYMBOL` are required; unknown and duplicate
options reject. Unannotated functions retain ordinary compiler output.

```
python3 tools/arm-dispatch/build_backend.py
python3 tools/arm-dispatch/build_thumb_lock_frame.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_lock.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
.deps/arm-oracle-venv/bin/python research/audio/check_mplay_lock_callback_frame_model.py --lock-candidate
```

Rebuild other plugins against the installed headers after a backend rebuild.
The direct checker links at the original address, requires all sixteen original
bytes, checks 22 invalid contracts and unchanged unannotated output, then runs
the independent 32,256-case lock model. The separate 86,016-case entry model
executes the candidate with the original callback/frame path and controlled
ARM/Thumb callbacks. These tests do not establish complete MPlayMain behavior.

### Local unsigned bounds with explicit comparison flags

`thumb_unsigned_bounds.cc` adds `matching_thumb_unsigned_bounds` for functions
also annotated `matching_tail_transfer`. On Thumb-1, after branch shortening,
it validates every remaining local conditional as an unsigned low-register
`x > bound-1` branch to a label, then selects `x >= bound`. Both forms take the
same edge for every unsigned word; this private contract explicitly selects the
flags from CMP bound, including equality at the threshold. Branch targets and
instruction lengths remain unchanged. No instruction templates are inserted
into C sources, and no backend rebuild is needed.

Required options are `bound=1..255` and `expected=1..255`. All conditional shapes
and the count must match, and missing, duplicate or unknown options reject.
Unannotated functions are unchanged. This pass does not remove a function's ABI
frame or establish its continuation contract; tail_transfer provides that part.

```
python3 tools/arm-dispatch/build_thumb_unsigned_bounds.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
.deps/arm-oracle-venv/bin/python research/audio/check_ply_note_command.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
```

The decoder checker requires the original 38 bytes with bound 128 and three
branches, rejects eleven altered source/options, checks unchanged unannotated
output, and executes 338,688 independent command/track-alias cases with full
registers, flags and ordered memory effects. Its scope ends at tone selection.

### Tone-selection branch layout

The optional flag `thumb_block_layout` → `tone-selection` selects two explicit
masked tests (0xc0 and 0x40) retained through empty self-ties. It permits empty
r0-r11 ties and requires exactly two branch-arm swaps with no removed jumps.
Each selected branch has a straight fallthrough arm ending in a jump to a shared
forward join; the following arm must fall into that join. The pass inverts the
selector, moves the following arm ahead of the first, and moves the existing
join jump to the moved arm's end. Labels and all branch destinations are retained.
Its normal low-register ADD #0 and TST operand canonicalization then applies.
Unknown/duplicate/value-bearing options reject; default mode is unchanged.

```
python3 tools/arm-dispatch/build_thumb_block_layout.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
.deps/arm-oracle-venv/bin/python research/audio/check_ply_note_tone.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
.deps/arm-oracle-venv/bin/python research/audio/check_soundmain_envelope.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
```

The tone checker requires all 86 original bytes, rejects eleven unsupported
contracts, checks unannotated output is unchanged, and executes 92,160 independent
full-state alias cases. The envelope checker exercises the existing default mode.

### AND/store with a flag-preserving zero transfer

`thumb_and_store_tail.cc` supplies `matching_thumb_and_store_tail` for private
Thumb tail-transfer functions. It validates exactly one adjacent low-register
AND, volatile aligned word store to the private SP frame (offset 0..60), and
nonzero local skip over the declared tail. The store and zero test must use the
AND result. The skip label must have one use, and the skipped region must contain
only the declared transfer, notes and barriers. Any intervening operation prevents
the fold. The `destination` option is required, unique and nonempty.

The backend pattern represents the AND result, ordered store and zero edge
explicitly, emitting ANDS/STR/BEQ in six bytes. It preserves carry and overflow
through ANDS and STR; no CMP #0 is inserted. This matters when the preceding
priority clamp's carry must survive into channel selection. The external short
branch requires an integration-time range/alignment assertion. Unannotated code
is unchanged. Rebuild plugins against the installed headers after rebuilding
the backend.

```
python3 tools/arm-dispatch/build_backend.py
python3 tools/arm-dispatch/build_tail_transfer.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
python3 tools/arm-dispatch/build_thumb_and_store_tail.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc --output-dir .deps/flood-core-new-backend
.deps/arm-oracle-venv/bin/python research/audio/check_ply_note_priority.py --compiler .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
```

The priority checker requires all thirty original bytes, rejects twelve unsupported
contracts, checks unchanged unannotated output and runs 147,456 independent cases.
Those cases include the priority-comparison carry and ordered stack aliases;
they stop at channel selection, not at allocation or full ply_note return.

PCM channel selection uses the opt-in `matching_thumb_block_layout` attribute
with `-fplugin-arg-thumb_block_layout-pcm-selection`. This mode requires one
closed masked-test arm move, two unsigned comparison-arm moves, and removal of
two jumps to the immediately following label. It accepts a low-register 0x40
mask and unsigned register comparisons, preserving all control-flow edges.
The owner-comparison diamond may contain a conditional exit in its other arm.
It cannot be combined with tone-selection mode.

Two repeated comparisons may use incoming condition flags only when the target
label has one use, is not preserved, has no fallthrough or aliased entry, and
immediately precedes the repeated comparison. Its sole incoming edge must be a
forward unsigned comparison of the same low-register operands: GEU followed by
GTU, or LEU followed by LTU. The backend `match_thumb_incoming_compare` pattern
retains the C comparison in RTL, adds a proof marker, and emits only its branch.
No code executes between the incoming comparison and that target branch. The
mode rejects a candidate unless both comparisons have this proof. Other modes
and unannotated functions do not enable this transformation.

`research/audio/check_ply_note_pcm_choose.py --compiler COMPILER` verifies the
58-byte choice candidate, rejected compiler contracts, unchanged unannotated
output, and complete PCM-selection model behavior when combined with the
original setup and advancement bytes. Pass `--production` to verify the
integrated source/object and ROM identity. Its final twelve-byte loop
advancement remains assembly.
