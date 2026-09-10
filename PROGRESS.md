# Sacred Stones decompilation progress

**Status: active — not yet 100% decompiled.**

Updated: September 10, 2026. Latest integration: channel-deadline control and its complete 32-byte pool section now come from C (baseline `5aae98aa` plus this change). Full ROM matching, 98,304 complete-state cases, 17 new compiler rejection cases, 14 existing contract regressions, 3,528 complete audio calls and fresh runtime rebuilds pass.
This file is the standing progress panel; it is updated after meaningful verified
advances, integration results, or changes in the current blocker.

This task builds on existing community work. The starting checkout was
`FireEmblemUniverse/fireemblem8u` at `ecc6798b` (recorded inventory: 358 C files
and 73 assembly entry markers). We later integrated laqieer's data-recovery
fork at `7b47dec8`, including 76 C files, mostly data definitions. Repository
file totals include those inherited contributions. The integrated milestones
below describe replacements and verification performed during this task;
they do not attribute the entire decompilation to this task.

| Meter | Verified progress |
|---|---|
| Full ROM byte match | `████████████████████` **100%** — all 16,777,216 bytes match |
| Overall C decompilation | **Not yet measurable reliably** — complete executable classification remains unfinished |
| Main-ROM instruction ownership | **92.56%** of 777,630 mapped instruction bytes belong to C objects without detected instruction templates; this includes inherited work and is not overall completion |
| Reviewed non-library assembly | **2,592 instruction bytes in main ROM; 420 in expanded payload** — assembly sources plus verified inline sites; runtime archives and classification gaps remain |
| Runtime source rebuild | `████████████████████` **Fresh libc/libgcc reproduce all four images; 21,066 main-ROM and 94 payload C-source instruction bytes verified, including the mixed syscall object** |
| Integrated palette routine | `████████████████████` **52/52 instruction words (100%); full 220-byte section exact** |
| Integrated channel deadline | **32/32 section bytes exact; 98,304 cases pass with original registers, flags, direct exits and ordered data/MMIO accesses** |
| Integrated channel setup | **10/10 bytes exact; 12,288 cases pass with ordered frame/info reads, all registers and flags** |
| Integrated no-reverb clearing | **46/46 bytes exact; 14,640 full-state cases pass, including zero-count flags and private fallthrough** |
| ARM sample-mixing region | `████████████████████` **488/488 contiguous instruction bytes now belong to C-only objects; exact original ROM bytes preserved** |
| Integrated resampling exit | `████████████████████` **All eight bytes exact; 201,216 ROM/copied-RAM cases pass, including source rewind, ordered register restores and frame advance** |
| Integrated shared sample entry | `████████████████████` **All 32 bytes exact; 75,776 original/production ROM/copied-RAM cases pass, including every volume pair and frame/channel aliases** |
| Integrated fixed-rate setup | `████████████████████` **All 44 bytes exact; 100,864 original/production ROM/copied-RAM cases pass across all three paths and signed overflow** |
| Integrated resampling setup | `████████████████████` **All 28 bytes exact; 66,560 original/production ROM/copied-RAM cases pass, including all sample-byte pairs and frame aliases** |
| Integrated packed-lane advances | `████████████████████` **Both eight-byte blocks exact; 49,856 production ROM/copied-RAM cases and 4,672 compiler carry-branch cases pass** |
| Integrated fixed-rate word completion | `████████████████████` **All 20 bytes exact; 203,520 production ROM/copied-RAM cases pass, including ordered stereo stores and repeat/save branches** |
| Integrated resampling word completion | `████████████████████` **All 16 bytes exact; 203,520 production ROM/copied-RAM cases pass, including ordered stereo stores, frame aliases and both count exits** |
| Integrated resampling stop/frame restore | `████████████████████` **All 12 bytes exact; 201,216 production ROM/copied-RAM checks pass, including ordered restores, stack advance and preserved flags** |
| Integrated resampling wrap loop | `████████████████████` **All 16 bytes exact; 40,800 cases compare original/production ROM and copied RAM, including signed overflow and repeat/reload exits** |
| Integrated resampling loop metadata | `████████████████████` **All 20 bytes exact; 540,672 production ROM/copied-RAM cases pass, including both exits and conditional frame reads** |
| Integrated resampling source advance | `████████████████████` **All 32 bytes exact; 35,200 cases compare original and production in ROM and copied RAM, with full registers/flags/frame and both exits** |
| Integrated channel save/frame restore | `████████████████████` **All 24 bytes exact; 245,760 production ROM/copied-RAM cases pass across resampled, save and restore-only entries, including the Thumb transfer** |
| Integrated fixed-rate loop metadata | `████████████████████` **All 16 bytes exact; 67,584 production ROM/copied-RAM cases pass, including conditional frame reads and both exits** |
| Integrated resampling arithmetic | `████████████████████` **All 52 bytes exact; 143,360 production ROM/copied-RAM cases pass across both entries and fractional-wrap boundaries** |
| Integrated partial-word completion | `████████████████████` **All 40 bytes exact; 61,440 production ROM/copied-RAM cases pass through the frame-restore branch, including zero rotation and overlapping state/output** |
| Integrated short-sample block | `████████████████████` **All 44 bytes exact; 184,320 production ROM/copied-RAM cases pass across both entries and four packed lanes** |
| Integrated packed stereo-word block | `████████████████████` **All 68 bytes exact; 36,864 production ROM/copied-RAM cases pass, including repeated words, counter boundaries, ordered accesses and aliases** |
| Integrated reverb block | `████████████████████` **All 84 bytes exact; 13,584 production ROM/copied-RAM cases pass** |
| Integrated audio byte-load entry | `████████████████████` **Both bytes exact; 49,152 production cases pass** |
| Integrated multiply-high ARM body | `████████████████████` **All 12 ARM bytes exact; 41,984 production cases pass; Thumb entry remains assembly** |
| Integrated audio address filter | `████████████████████` **All 22 bytes exact; 206,592 production execution cases pass** |
| Integrated checked audio reader | `████████████████████` **Complete 12-byte section exact; 180,224 production execution cases pass** |
| Integrated audio buffer clear | `████████████████████` **Complete 24-byte section exact; 3,072 production execution cases pass** |
| Integrated audio jump-table copy | `████████████████████` **Complete 24-byte section exact; 3,072 production execution cases pass** |
| Integrated LFO / modulation commands | `████████████████████` **Both 18-byte bodies exact; 99,072 production execution cases pass** |
| Integrated repeat command | `████████████████████` **Complete 48-byte section exact; 264,704 production execution cases pass** |
| Integrated pattern call | `████████████████████` **Complete 28-byte section exact; 49,152 production execution cases pass** |
| Integrated sequence jump | `████████████████████` **All 32 bytes exact; 32,832 production execution cases pass** |
| Integrated voice selection | `████████████████████` **Complete 48-byte section exact; 24,960 production execution cases pass** |
| Integrated modulation type | `████████████████████` **All 24 bytes exact; 66,048 production execution cases pass** |
| Integrated port command | `████████████████████` **All 24 bytes exact; 132,352 production execution cases pass** |
| Integrated tempo | `████████████████████` **All 20 bytes exact; 24,768 production execution cases pass** |
| Integrated pan / bend / tuning | `████████████████████` **Three 20-byte bodies exact; 49,536 production execution cases pass** |
| Integrated key shift / volume / bend range | `████████████████████` **Three 18-byte bodies exact; 49,536 production execution cases pass** |
| Integrated priority / LFO delay | `████████████████████` **Both ten-byte bodies exact; 4,128 production execution cases pass** |
| Integrated audio VSync/DMA | `████████████████████` **All 76 bytes exact; 2,304 production execution cases pass** |
| Integrated stereo channel volume | `████████████████████` **All 48 bytes exact; 4,032 production execution cases pass** |
| Integrated tied-note release | `████████████████████` **All 64 bytes exact; full ROM verified** |
| Integrated audio track stop | `████████████████████` **Complete 68-byte section exact; full ROM verified** |
| Integrated audio byte reader | `████████████████████` **All 10 bytes exact; 32,768 original/production execution cases pass** |
| Integrated map flood dispatcher | `████████████████████` **107/107 instruction words; complete 464-byte section exact; full ROM verified** |
| Integrated map flood helper | `████████████████████` **51/51 instruction words (100%); full 224-byte section exact** |
| Integrated object-list high entry | `████████████████████` **39/39 instruction words (100%); full 160-byte section exact** |
| Integrated string decoder | `████████████████████` **35/35 instruction words (100%); full 148-byte section exact** |
| Half-stride glyph routine | `████████████████████` **All 188 instruction bytes exact; shares the original pointer pool** |
| Glyph drawing routine | `████████████████████` **All 188 instruction bytes exact; shift table and pointer also generated from C** |
| Tilemap fill routine | `████████████████████` **All 56 bytes exact in main and three payload versions** |
| Tilemap copy routine | `████████████████████` **All 92 bytes exact in main and three payload versions** |
| Embedded object-list high entry | `████████████████████` **Exact in all three payload versions; low-entry shim remains assembly** |
| Embedded palette routine | `████████████████████` **Exact in all three payload versions** |

The function percentages describe these routines only. All replacements listed above are in the production build.
An exact ROM build can still contain assembly; its 100% meter is not C coverage.

## Working on now

**Working on: remaining audio handlers, ARM shims, unit-list fallback and transfer code.**
Next milestone: resolve no-reverb zero-inclusive countdown flags and private fallthrough, then integrate its 46-byte block. Runtime source rebuilding is verified; syscall inline-assembly review remains open.
The SoundMain setup arithmetic model passes 21,504 cases against the original
entry, covering deadlines, all DMA counters/VCOUNT values, wrapped buffer
selection, stable callback order, lock update and the 64-byte mixer frame.
The entry model additionally passes 600 callback-mutation cases and 1,800
locked/invalid-entry cases. It retains the initial SoundInfo pointer, computes
the deadline before callbacks and uses updated buffer fields after callbacks.
A further 6,912 original-entry/mixer-return cases verify all saved frame words,
stereo clearing without reverb, lock release and r4-r11 restoration in both
return modes. The typed 64-byte frame layout compiles with offset/size checks.
The 84-byte reverb block is now integrated in `src/m4a_reverb.c`, including the
original ARM-to-Thumb transfer. All 13,584 production/original comparisons pass
(6,792 from ROM and 6,792 after copying the mixer to RAM), with identical memory,
ordered accesses, r0-r12, LR, flags/mode and untouched stack. The full ROM matches.
The compiler's PC-address rule passes 96 execution cases, six compiler rejection
cases and twelve link-contract rejection cases. The byte-load and subtraction
rules pass 8,192 and 33,152 standalone checks. The setup/frame models above are
still research; the full SoundMain entry and remaining mixer are unfinished.
The channel-preparation C model passes 31,232 comparisons through the sample-
mixing boundary: 9,819 skipped/stopped channels, 13,739 ready-to-mix channels and
7,674 deadline exits. It covers all status and VCOUNT bytes, envelope boundaries,
loop metadata and complete channel/frame updates. This is research, not yet a
matching replacement for the channel loop or sample mixer.
The fixed-rate sample-mixing model passes 10,080 original/C comparisons,
including short samples, repeated loops, packed-word overflow and final partial
words. It reproduces full sound memory and private frame effects; 944 cases
stop and 9,136 continue. The resampling model also passes 6,912 comparisons
covering fractional wrap, interpolation and multiple loop crossings (1,066 stop,
5,846 continue). Both sample paths still need matching code generation and
integration; their semantic checks do not add production coverage.
The composed SoundMain C model passes 3,528 complete original/C calls with active
channels: 3,456 valid entries (including 1,728 forced deadline exits) and 72
rejected entries. Full sound memory, callback/VCOUNT traces, global-pointer
mutations, preserved registers, SP and both return modes agree. This establishes
semantic composition; the original private frame and matching instruction
sequence remain unfinished, so production coverage is unchanged.
The 68-byte packed stereo-word block is integrated as `src/m4a_packed.c`,
including word loads/stores and the outer sample-count decrement/repeat branch.
It adds the short-sample remainder and branches to channel saving when complete,
otherwise falling through to the short-sample C block.
All 36,864 production/original checks pass across ROM and copied RAM, including
source/output overlap, 15 counter values (up to 528 samples and signed-overflow
boundaries), ordered accesses, registers, flags and stack canaries. The full production
SoundMain also passes the 3,528 complete-call suite. The continuation rule passes
160 executions, eleven compiler rejection cases and two link rejection cases.
The addition-carry rule passes 116,032 standalone checks.
The short-sample word loads and one-sample arithmetic are now integrated as
`src/m4a_short.c` (44 bytes), including the source-count decrement and end branch. Both the word-load entry and shared sample entry
pass 184,320 production/original comparisons across ROM and copied RAM; source
aliases, all signed bytes, four packed lanes, ordered accesses, registers,
subtraction flags, selected exit and untouched memory/stack agree. Full ROM matching and the
3,528 complete-call regression pass. Source inventory is now 478 C files,
32 assembly entry markers and six manual assembly function declarations.
The partial-word completion shared by fixed-rate and resampled paths is now
integrated as `src/m4a_partial.c` (40 bytes including the frame-restore branch). Its 61,440 ROM/copied-RAM checks
verify all four lanes (including zero rotation), status-byte truncation,
channel/output aliases, ordered writes and expected full memory/register state.
The word-store writeback rule passes 37,056 standalone comparisons and rejects
nine unsupported patterns. Full ROM matching and 3,528 complete-call checks pass.
The resampling word loads and interpolation/stereo arithmetic are integrated
as `src/m4a_resample.c` (52 bytes), including the fractional-position update
and flag-setting shift/conditional continuation. Both entries pass 143,360 ROM/copied-RAM
checks covering signed samples, difference/fraction boundaries and overflow,
four packed lanes and independently calculated register/memory effects.
The explicit read-only LR continuation contract passes 13,056 executions and
nine rejection cases; accumulator mode adds another 13,056 passing executions
and nine rejection cases. The original continuation guards still pass. The
production checks verify wrapped LR output across step boundaries, including
exact wrap to zero. Full ROM matching and the 3,528 complete-call regression
pass. The production cases now include 101,540 advance-path and 41,820
no-advance-path exits across ROM/RAM, checking complete shift flags and branch
destinations. The conditional-continuation compiler rule passes 13,632 standalone
executions, eleven compiler rejections and three linker rejections. Source
advancement and sample-loop transitions remain assembly.
Both packed-lane advances are now integrated as C; remaining setup and frame/channel control still contain assembly.
The latest countdown checks cover ten short-source counts, including zero and
signed-overflow boundaries (18,440 end exits across ROM/RAM), and all 135 selected
packed counter/remainder pairs (3,288 channel-save exits). They verify complete
addition/subtraction flags and the exact exit PC. The existing conditional rule
handles both paths without further compiler changes. Full ROM matching and
3,528 complete-call checks pass. Fixed-rate loop metadata is now integrated
as `src/m4a_loop.c` (16 bytes): 67,584 ROM/copied-RAM cases verify conditional
frame reads, both exits, comparison flags, all registers and an untouched frame.
The read-only frame compiler contract passes 55,296 cases, retains the second
comparison when its input changes, and rejects eight invalid forms. The shared
64-byte frame definition now lives in `include/gba/m4a_mixer_frame.h` with
loop-field offset checks; research uses the same header. The shared header also
models the resampling path's 72-byte frame, including the two saved registers
below the main frame. Resampling loop metadata is integrated as
`src/m4a_resample_loop.c` (20 bytes): 540,672 ROM/copied-RAM checks verify all
registers, exact flags, conditional ordered frame reads, unchanged frame/SP/LR,
and both loop/stop exits. The length read stays at SP+24 and source at SP+20.
The wrap-addition loop is integrated as `src/m4a_wrap.c` (16 bytes).
All 40,800 iteration cases pass against original/production ROM and copied RAM,
including 9,888 signed-overflow cases. Every register, flag, frame byte and
repeat/reload exit matches. The private terminal branch replaces the compiler
call/return frame with the original backward branch. Eight invalid branch
contracts reject, and existing compiler regression suites pass. The complete
audio regression passes 3,528 calls. Resampling stop-frame restoration is now
integrated as `src/m4a_stop.c` (12 bytes): 201,216 cases verify the ordered r4/r12
restores, eight-byte SP advance, zero remaining count and exact partial-completion
branch. All registers, flags, frame bytes and canaries match at three stack
placements. Ten invalid pop-pair contracts reject; existing compiler suites pass.
Resampling stereo-word completion is integrated as `src/m4a_word_finish.c`
(16 bytes): 203,520 cases verify left/right store ordering, pointer writeback,
signed incoming-count comparison, all registers/flags and both continuations.
The tests include four output placements with frame aliases. Existing compiler
rules suffice; no compiler changes were needed. Packed-lane advancement and the
source/frame update before channel saving still remain assembly.
Fixed-rate stereo-word completion is now integrated as
`src/m4a_fixed_word_finish.c` (20 bytes), including the backward setup branch
and forward channel-save branch. All 203,520 ROM/copied-RAM cases pass across
count boundaries, stereo words and frame aliases. The complete audio regression
passes 3,528 calls. No compiler changes were needed for this integration.
Source advancement is now integrated as
`src/m4a_advance.c` (32 bytes), including the shared reload entry at +20.
All 35,200 cases pass across original/production ROM and copied RAM, with
independent expected registers, flags, frame, ordered reads and both exits.
The early-exit compiler contract rejects 12 invalid forms; existing adjacent,
conditional, frame and LR regression suites pass. Full ROM matching and
3,528 complete audio calls pass. The earlier 84-byte research candidate is
now replaced by the exact eight-instruction production block.
Fractional-position and channel ct/cp saving, sample-count restoration and the
ARM-to-Thumb transfer are integrated as `src/m4a_save_channel.c` (24 bytes).
All three entries pass 245,760 ROM/copied-RAM checks, including channel/frame
overlap, ordered stores/load, all registers, unchanged SP/LR/NZCV and the exact
Thumb destination/mode. Full ROM matching and 3,528 complete audio calls pass.
The explicit indirect-tail frame contract removes only the validated compiler
LR save/restore, preserving incoming fractional LR and private-frame coordinates.
Its standalone checks pass 27,648 executions and reject 14 invalid forms;
unannotated output is unchanged. The earlier research candidate is now integrated.
The fixed-rate and resampling packed-lane advances are integrated as
`src/m4a_fixed_lane.c` and `src/m4a_resample_lane.c`, eight bytes each. Both
produce the original ADDS/BCC pair. All 49,856 production/original checks pass
across ROM and copied RAM: wrapped output, all NZCV flags, both destinations,
all registers, SP/LR and frame canaries. The early-exit compiler contract now
accepts unsigned carry conditions; 4,672 checks cover both polarities and code
placements, four invalid forms reject, and all existing adjacent/frame/LR
regressions pass. Full ROM matching and 3,528 complete audio calls pass.
Channel-deadline control is integrated as `src/m4a_deadline.c`: all 26 instruction
bytes, two padding bytes and the four-byte VCOUNT pointer match. All 98,304 cases
pass with exact destinations, registers, NZCV, private frame and ordered data/MMIO
accesses in original/candidate ROM and copied RAM. Production ROM equality and
entry size/address are required by the checker. The earlier r2 decision and flag
differences are eliminated. The compiler validates private frame accesses and a
terminal continuation after one literal pool; 17 unsafe forms reject, 14 existing
contracts still reject, and unannotated assembly is unchanged. Full ROM matching,
3,528 complete audio calls and fresh runtime rebuilds pass. The next audio work
is channel status/envelope control and the remaining entry/frame handling.
Channel setup is integrated as `src/m4a_channel_setup.c` (ten bytes). All 12,288
cases pass across ROM/copied RAM, all channel-count bytes, all initial flags,
random frequency/register values and three frame/info alias placements. The
private fallthrough compiler contract permits only aligned word reads within
the 64-byte frame and removes the verified leaf return; 12 unsafe forms reject,
and unannotated objects are unchanged. Full ROM matching, 3,528 complete audio
calls and fresh runtime builds pass. The following assembly section now starts
at a word boundary, so its temporary halfword alignment adjustment is removed.
Current source inventory: 493 C files, 32 assembly entry markers, three manual
assembly function declarations, and seven instruction-bearing inline templates.
The no-reverb clearing block is integrated as `src/m4a_no_reverb.c`, with all
46 original bytes exact. Its 14,640 original/production/candidate ROM/copied-RAM
cases cover 183 counts, five stereo-buffer offsets, every initial NZCV value and
1,554,080 ordered writes per implementation. All registers, flags, frame canaries
and the fallthrough agree, including the minimum four-pair loop below count 16.
The bounded countdown/fallthrough compiler contract passes 16,448 boundary checks
and rejects 12 unsafe configurations. The existing shift/carry suite still passes
140,864 cases and nine rejections, with unannotated output unchanged. Full ROM
matching, 3,528 complete audio calls and fresh runtime rebuilds of all four images
pass. The next audio targets are the remaining Thumb channel control and
entry/frame code; the complete executable-coverage audit also remains unfinished.
Both final ARM exit fragments are now integrated: source rewind/register
restoration in `src/m4a_resample_finish.c` (eight bytes) and the terminal branch
in `src/m4a_partial.c` (now 40 bytes). Their suites pass 201,216 and 61,440 cases
respectively across ROM/copied RAM, checking exact exits and full state.
The linked [ARM region audit](docs/mixer-arm-region.json) covers every byte from
0x080CF6E4 through 0x080CF8CC: all 488 instruction bytes are owned by C objects
without detected instruction templates, with no gaps or overlaps. Surrounding
Thumb channel/frame control and no-reverb clearing remain assembly.
The shared sample entry is integrated as `src/m4a_sample_entry.c` (32 bytes):
save the sample count at incoming SP, read/expand stereo volumes, then select
fixed or resampled playback from the channel type. All 75,776 cases compare
original and production in ROM/copied RAM, with exact registers, flags, ordered
accesses and complete tested memory. They include all 65,536 volume pairs and
10,240 alias cases. Twelve invalid incoming-SP store contracts reject. Existing
compiler regressions, full ROM checksum, 3,528 complete audio calls and fresh
runtime relinks of all four images pass.
Fixed-rate setup is integrated as `src/m4a_fixed_setup.c` (44 bytes), including
both early exits, conditional LR clearing, signed subtraction and final packed
remainder. All 100,864 cases now exercise the real original/production entries
in ROM and copied RAM, with no frame skipping or intercepted calls. Registers,
LR, SP, NZCV, paths and canaries agree, including 10,192 overflow cases.
Twelve invalid two-exit contracts reject; existing compiler regressions, full
ROM checksum, 3,528 complete audio calls and fresh runtime relinks all pass.
Resampling setup is integrated as `src/m4a_resample_setup.c` (28 bytes):
private stack save, fractional-position/frequency reads, frequency multiplication,
signed current/next sample loads and source advance. All 66,560 cases compare
original and production in ROM and copied RAM, checking full registers/flags,
SP/LR, ordered accesses, data/frame memory and aliases. The compiler's private
push-pair/LR-load contracts reject 13 invalid forms; existing continuation,
frame, LR and carry suites pass. The full ROM and 3,528 complete audio calls pass.
Fresh runtime libraries also reproduce all four current images and symbols.
The [runtime inventory](docs/runtime-source-inventory.md) identifies every linked
archive member's candidate source at the pinned agbcc revision. Six assembly
helpers rebuild exactly and contribute 726 instruction bytes in each image.
Fresh libc/libgcc builds from the pinned source and headers reproduce the
entire main ROM and all three embedded payloads, with matching exported symbol
addresses and sizes. This verifies the C-source rebuild for 21,066 main-ROM and
94 payload runtime instruction bytes. The main total includes the 1,014-byte
syscalls.o object, which contains inline assembly; that assembly still needs
instruction-level review and recovery. The six helpers remain assembly.
[Runtime rebuild evidence](docs/runtime-rebuild.json) records the source snapshot,
compiler and image fingerprints. The reproducible verifier uses an isolated
fresh directory and does not replace the installed archives.
All eight detected instruction-bearing inline sites now have source/symbol/byte
checks. They contribute 410 main-ROM instruction bytes and two payload bytes.
The unit-list fallback accounts for 396 of those main-ROM bytes, plus 40 bytes
of literals/alignment. Combined with assembly sources, reviewed non-library
assembly totals 2,592 main-ROM bytes and 420 expanded-payload bytes. This is
still not a complete whole-ROM C percentage.
The [size-weighted inventory](docs/code-ownership.md) is now reproducible from
current ELF/map files. Main-ROM mapped instructions total 777,630 bytes:
719,786 C-owned, 33,870 in C objects containing assembly, 2,182 in assembly
sources, and 21,792 in runtime archives. Mixed-object sizes are not remaining
assembly sizes. The expanded payload is measured separately: 25,716 mapped
instruction bytes, including 418 in assembly sources. The 200-byte transfer
bootstrap is already included in the main assembly total, not counted twice.
The interworking-entry C probe passes 20,992 result/preserved-register cases,
but uses 24 bytes including a veneer versus four original entry bytes and
changes r1. It remains research-only; production is unchanged.
The byte-load entry is integrated as C: its two bytes match exactly, and the
linker requires the filter to follow immediately. All 49,152 production cases
and 32,832 sequence-jump caller cases pass. Full ROM comparison passes.
The multiply-high ARM body is integrated as C: all 12 bytes match. Its 41,984
production cases pass through both ARM and original Thumb entries, preserving
r0-r12, flags, SP and both return modes. The full ROM checksum passes.
The two-instruction Thumb entry remains assembly and is still in scope.
The shared address filter is integrated as C: all 22 instruction bytes match
at 080CF972, with the shared literal retained at 080CF988. The complete ROM
checksum passes, and 206,592 production filter cases pass, including flags,
registers and stack canaries. Checked-reader and jump-table caller checks also
exercise the integrated filter. The linked audit has no orphan mappings.
The checked byte reader is integrated: all 12 section bytes match and 180,224
production cases pass across both entry points, pointer aliases, low-address
rejection, all byte values and NZCV states, and ARM/Thumb returns. Its alternate
entry remains at 080CF98E. Full ROM comparison passes.
The 64-byte audio clear is integrated as C. Its 22 instruction bytes and two
padding bytes match, and all 3,072 production execution cases agree on memory,
canaries, r0-r12, SP, return mode and flags. The installed grouped-store pass
rejects six unsupported sequences and leaves unannotated output unchanged.
The complete ROM checksum passes; the linked audit has no orphan mappings.
The jump-table copy is integrated as C. All 22 instruction bytes and two zero
padding bytes match. Its 3,072 production cases verify data, canaries, r0-r12,
flags and ARM/Thumb returns. The installed countdown passes 320 standalone
executions and rejects eight unsupported loops. The shared literal has an
explicit linker range check, and the complete ROM checksum passes.
LFO speed and modulation commands are integrated as C. Both 18-byte bodies
match; 99,072 production cases verify zero-byte resets, three modulation types,
track flags, unchecked low reads, pointer aliases and all r0-r12/return flags.
The installed private-return contract passes 128 cases and rejects 23 unsupported
forms. The complete ROM checksum passes.
Repeat handling is integrated as C. All 46 instruction bytes and two padding
bytes match. Its 264,704 production cases include 66,950 shared-entry jumps and
197,754 local completions, with no SP/LR, memory, register or flag differences.
Ten unsupported compiler contracts are rejected. The full ROM checksum passes.
Pattern handling is integrated as C. Its 26 instruction bytes and two padding
bytes match. All 49,152 production cases agree on track/channel RAM, r0-r12,
flags, final return state and callee-entry SP/LR. Eleven unsupported compiler
contracts are rejected; branch-range checks pass. The full ROM checksum passes.
The sequence jump is integrated as C. All 32 bytes match; 32,832 production
cases verify every value in each pointer byte, rejected low-byte reads,
command-pointer aliases, public/shared-stack entries and ARM/Thumb returns.
All RAM, r0-r12, flags and SP agree. The full ROM checksum passes.
Voice selection is integrated as C. All 46 instruction bytes and two padding
bytes match. The 24,960 production cases verify every voice index, rejected
sources, four overlapping copies and command-pointer aliases, including full
RAM, r0-r12, flags, SP and return PC. The full ROM checksum passes.
Modulation type is integrated as C. All 24 bytes match; 66,048 production cases
verify changed/unchanged types, rejected reads, pointer aliases, flags and all
r0-r12. The full ROM checksum passes. The installed private-return contract
passes 128 executions and rejects 22 unsupported configurations.
The port handler is integrated as C: all 24 bytes, including its literal pool,
match. All 132,352 production cases pass for normal/rejected reads, five pointer
aliases, ordered byte writes, r0-r12 and flags. The full ROM checksum passes.
Tempo regression passes 24,768 cases; the installed private-return contract
passes 128 cases and rejects 19 unsupported configurations.
Tempo is integrated as C. All 20 original bytes match; 24,768 production
execution cases verify tempo arithmetic, rejected reads, pointer aliases,
registers and flags. The full ROM checksum passes. The updated private-return
contract passes 128 two-call executions and rejects 19 unsupported contracts;
all 99,072 existing flag-setter regression cases also pass.
Pan, bend and tuning are integrated as C, including their subtraction of 64
and byte wraparound. All 60 instruction bytes match, and their 49,536 production
cases agree on memory, r0-r12 and return flags. The combined six-handler suite
passes 99,072 cases and the full ROM checksum passes.
Key shift, volume and bend range are now integrated as C, with all 54 instruction
bytes exact. Their 49,536 production/original cases include every command byte,
eight initial track-flag patterns, rejected reads and command-pointer aliases;
all memory, r0-r12 and return flags agree. The full ROM checksum passes.
Priority and LFO-delay setters are integrated as C. Both ten-byte bodies match;
all 4,128 production/original cases agree on memory, flags and r0-r12, including
rejected reads and command-pointer aliases. `make compare -j8` passes for the
complete ROM. Their installed private-return compiler contract passes 128
two-call executions with ARM/Thumb return modes and rejects nineteen unsupported
configurations. The source inventory now has 473 C files and 32 assembly entries.
VSync/DMA handling is integrated: the complete 76-byte C section matches,
including shared literal loads, every instruction, zero padding and local data.
All 2,304 production/original cases pass for ordered counter and DMA accesses,
memory, r0-r12 and return flags. `make compare -j8` verifies the complete ROM.
The installed compiler's bounded counter tests pass 65,664 executions; six
unsupported patterns remain unchanged. Shared-only literal pools pass 224
execution cases, and eight invalid plugin configurations are rejected.
Another 4,096 standalone
bit-test executions pass across bit positions, branch senses and short/long/far
branch distances, including saved return-address checks. Large leaf-function
far-branch probes trigger a baseline GCC internal error; such large leaf functions remain unsupported. The production VSync branches
are short and pass the matching checks. A standalone
Thumb literal probe passes 192 execution cases; explicit link assertions reject
12 offsets that the linker otherwise silently wraps.

The tied-note release handler is integrated: all 64 Thumb bytes match.
Its 768 production-ROM execution cases verify all r0-r12 values, preserved
registers, stack, RAM and final flags. The installed compiler passes 5,760
standalone frame/rewrite executions; five invalid contracts are rejected.

TrackStop is integrated: its entire 68-byte section matches, and all 768
original/C cases pass. A fresh pinned compiler build passes 14,336 standalone
baseline/folded executions; signed comparisons and asm barriers stay unchanged.

The map-flood dispatcher is now integrated. Its complete 464-byte section at
`0x08000850` matches: 452 ARM instruction bytes (including the duplicate branch
prefix) and 12 pointer bytes. All 880 dispatcher execution cases and 2,560
prefix-table cases pass. The complete 16 MiB ROM passes `make compare -j8`.
The linked audit attributes the entire region to `src/arm/map_flood_core.o`.

The isolated pinned GCC backend and compiler passes now live in
`tools/arm-dispatch/`; the Makefile builds them when needed and applies them only
to the dispatcher. The C source uses the project's queue/state structures.
The audio command-byte reader is also integrated: all 10 Thumb bytes match,
including its private r3 result convention. All 32,768 original/production
execution cases pass, including command-pointer aliasing.
The stereo channel-volume helper is also integrated: all 48 bytes and 4,032
original/production execution cases match, including saturation and private ABI.
Main source inventory is now 473 C files and 32 assembly entry markers.

Latest integrated milestone:
PutOamHi and its pointer pool are integrated as matching C in the main ROM
and all three embedded payload versions. The existing
three-instruction PutOamLo shim branches into the shared C-generated body at
its original address. Each entry passes 1,280 execution cases with matching
memory, cursor, registers and flags. The full ROM checksum passes. PutOamLo's
shim remains assembly and is still counted as unfinished work.

Latest integrated milestone:
DecodeString is now integrated as matching C. All 640 valid-tree cases pass,
including output, consumed input, registers, write boundaries and return flags.
Its entire 148-byte pool/function section matches, and `make compare -j8`
verifies the complete production ROM. The linked audit attributes its 140 ARM
instruction bytes and eight pointer bytes to the new C object, with no orphan
mapping symbols.

Latest checks: 65,536 palette component/step pairs; 80 map flood cases with no
return-flag differences; 18,816 compiler-plugin execution probes; 30 relocated prefix-pool probes in both pointer orders, including cross-function
sharing under forced compiler garbage collection. Invalid manifests, Thumb
placement, and cross-section sharing are rejected. All checks passed.

The embedded compiler installer is repaired: pinned source, serial generator
builds, propagated failures, and staged installation. A fresh compiler installation
and fresh objects for all three payload versions passed their checksum gates.

## Completed milestones

- [x] Verify the supplied USA ROM and reproduce the entire ROM exactly.
- [x] Remove direct baserom includes from tracked source.
- [x] Build and verify all three embedded payload variants; preserve local source changes reproducibly.
- [x] Replace main ClearOam, Checksum32, TmApplyTsa and their embedded counterparts with matching C.
- [x] Replace audio RealClearChain, ply_pend, ply_fine and clear_modM with matching C.
- [x] Recover matching C for GetUnitDefinitionFormEventScr, Event1B_TEXTSHOW and DisplayEventMapAnim.
- [x] Integrate the exact 220-byte main palette pool/function C replacement.
- [x] Repair and verify fresh embedded compiler setup.
- [x] Integrate the exact 224-byte map flood pool/helper C replacement.
- [x] Replace embedded ColorFadeTick with matching C in all three payload versions.
- [x] Replace main and embedded TmCopyRect with matching C.
- [x] Replace main and embedded TmFillRect with matching C.
- [x] Replace DrawGlyph and its shift table with matching C.
- [x] Replace DrawGlyphHalfStride with matching C and preserve its shared pool.
- [x] Replace DecodeString and its pointer pool with matching C.
- [x] Integrate PutOamHi and its shared drawing body as matching C.
- [x] Replace embedded PutOamHi with matching C in all three payload versions.
- [x] Integrate the complete matching map-flood dispatcher and compiler-generated prefix.
- [x] Replace the internal audio command-byte reader with matching C.
- [x] Replace TrackStop with matching C and validate live AND/zero compiler folding.
- [x] Replace the tied-note release handler with matching C and validate its Thumb leaf frame.
- [x] Replace stereo channel-volume calculation with matching C.
- [ ] Replace remaining recoverable assembly, including the unit-list fallback, ARM, audio and transfer code.
- [x] Rebuild pinned runtime libraries and verify exact main/all three payload images and exported symbols.
- [ ] Complete executable coverage accounting, including embedded code and hardware interfaces.
- [ ] Run and document the final complete decompilation verification.

## Remaining inventory

| Scope | Latest source audit |
|---|---|
| Main program | 32 assembly entry markers; 1 naked-function marker; 7 instruction-bearing inline assembly templates |
| Embedded payload | 16 assembly function declarations; 1 instruction-bearing inline assembly template |
| Additional identified code | 200 ARM instruction bytes in the transfer wrapper's data section |

These are source markers, not counts of independent unfinished functions. Empty
compiler constraints and register bindings are not counted as assembly instructions.
No overall percentage or completion date is inferred from these counts.

The immediate goal is the original GBA decompilation. The root blueprint's native
LÖVE/Lua engine and mod platform are separate work and are not counted as delivered.

Detailed evidence and history: [decomp-completion.md](docs/decomp-completion.md).
