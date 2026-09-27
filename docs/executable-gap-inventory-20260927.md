# Executable and source gap inventory — September 27, 2026

## Finding

The current receipts identify no unowned native instruction bytes in the
intended main ROM or the expanded FE6 save-report payload. They do show finite
source-history and behavior-evidence gaps, plus a large byte-classification
frontier that must be closed through known game loaders and interpreters. The
13,381,675 bytes in that frontier are not 13 MB of missing code.

The scope here is valid execution of the original USA GBA program: reset and
interrupt entries, ordinary calls and branches, declared function-pointer
tables, the FE6 payload decompressor/copy path, and game-authored interpreted
streams. It excludes control flow created only by arbitrary memory corruption.
ROM equality establishes byte fidelity, while the ownership and source receipts
below establish where current instructions come from; neither alone proves
complete behavior or an overall C-decompilation percentage.

## Source inclusion and instruction ownership

Production inputs are not just `src/*.c`. The Makefile includes explicit ARM C
objects, `asm/*.s`, the M4A assembly source, typed data C, selected handwritten
data assembly, sound/song sources, MIDI objects, and the generated
`banim/data_banim.o`. `asm/fe6sio.s` contributes the FE6 header and compressed
payload. `src/data_B1FE7C.c` includes a generated 42,888-byte duplicate built
from the recovered objects by `scripts/rebuild_orphan_from_objects.py`.
Relevant inclusion rules are in [Makefile](../Makefile:67),
[asm/fe6sio.s](../asm/fe6sio.s), [src/data_B1FE7C.c](../src/data_B1FE7C.c),
and [scripts/rebuild_orphan_from_objects.py](../scripts/rebuild_orphan_from_objects.py).

For the current ELF/map receipt (`docs/code-ownership.json`), all 777,630
main-ROM instruction bytes are assigned: 746,068 to C objects without detected
instruction templates, 9,770 to C objects containing assembly, and 21,792 to
runtime archive objects. The assembly-source category and unresolved-owner
category are both zero. The 9,770 figure is whole mixed-object size; the
instruction-level inline receipt counts 84 main-ROM bytes. The reviewed inline
sites are classified as 50 software-interrupt bytes, 32 processor-status bytes,
and two execution-address bytes in `docs/platform-operations.json`.

The expanded payload at 0x02010000 has 25,714 mapped instruction bytes:
18,364 C-owned, 6,530 in mixed C/assembly objects, and 820 runtime bytes. Its 58
reviewed inline bytes are classified as software interrupts and processor-status
operations. Runtime-source receipts report zero assembly-source instruction
bytes and fresh C-source rebuilds for 21,792 main-ROM and 820 payload bytes;
the separate 26-byte syscall SWI inventory is retained. These totals do not turn
hardware instructions into C coverage.

`docs/executable-frontier.json` checks every declared function start: 8,663 in
the main ROM and 340/340/339 in the three payload builds. Every start lies in an
instruction-mapped region. This is bounded entry evidence, not a proof about
untyped computed targets. The aligned exact-function-pointer candidate audit is
now closed for its stated 5,561-word scope: `docs/function-pointer-closure.json`
accounts for all 5,561, with zero unaccounted candidates. That receipt expressly
does not claim all computed targets or reachability.

## Confirmed executable content inside apparent data

There are two known mechanisms that must remain overlaid on the ordinary ELF
mapping.

First, the 42,888-byte `gUnkData_108` block at 0x08B1FE7C is generated from
recovered objects and matches the ROM. It contains 200 bytes copied from known
ARM routines at 0x08B247F4, 0x08B248B4, 0x08B248D4, and 0x08B24900. Their source
owners are `src/serial_boot.c`, `src/serial_poll.c`, and `src/serial_reset.c`.
It also contains a second physical copy of the 21,452-byte compressed FE6 payload
at 0x08B24AA4. `docs/duplicate-executable-content.json` verifies the native
overlays and expands both payload copies to the same 34,956-byte image. The
expanded image contains 25,714 instruction bytes, 9,235 mapped data bytes, and
seven nonmapped bytes. The copy is accounted for; its valid runtime use is not
established by byte equality alone.

Second, `asm/fe6sio.s` stores the primary compressed payload at 0x08B1A368.
The 21,452 stored bytes expand to 34,956 bytes loaded at 0x02010000. Its mapped
native instructions are represented by the `mgfembp` sources and included
runtime C sources. This is a concrete executable path, not an unexplained raw
blob.

The single formerly unowned exact-function-pointer candidate at 0x08B22960 is
also resolved at the byte-source level. It equals the source word at 0x08B18224,
which is offset 0x6C0 within the verified compressed asset
`graphics/misc/Img_ChapterIntro_LensFlare.4bpp.lz`; all three word values are
`0x08082A7D`. The updated closure receipt classifies it as
`verified_duplicate_asset_bytes`. It is not a newly discovered instruction or
missing function.

## Bounded remaining work

| Item | What remains | Finite acceptance evidence |
|---|---|---|
| Fresh build recovery | Current ROM/ELF/map and receipts predate removal of the generated `.deps` directory. This is a build reproducibility blocker, not evidence of missing source. | Rebuild the current production inputs, compare the complete USA ROM and embedded payload hashes, then regenerate receipts against the fresh ELF/map. The dependency-recovery workstream owns this. |
| Intended execution closure | The physical ledger leaves 13,381,675 input-data bytes open because mapping as data or lacking an ELF instruction map does not establish whether valid game code interprets a range. Large portions already have source/format receipts: direct sound (3,272,220 bytes), messages (492,968 object bytes), battle-animation inputs (2,380,160 bytes), and the duplicate block (42,888 bytes). These classes overlap the ledger and must not be summed as additional ROM space. | Trace the program-defined reset/IRQ/callback roots and valid copy/decompression/interpreter inputs to their destinations. Count only ranges reached as native code or as defined VM streams. Leave ordinary asset provenance separate. No arbitrary-corruption scan is needed. |
| Orphan copy's exceptional word | At `gUnkData_108 + 0xA028`, the earlier linked data has 0x08587790 while the generated duplicate has 0x085913F0. Prior analysis identifies the old target as the string `"C"` and the copied target as `gProcScr_TalkWaitForInput`; the generator preserves the latter as an explicit historical constant. This is an unresolved four-byte source-history/meaning question, not an absent routine. | Determine whether a supported current-game path reads this copied runtime-data word. If none does, record it as stale copied-link residue and keep the exact constant for fidelity. If a valid path does, document its expected owner/relocation. |
| Battle-animation behavior evidence | The byte source is in place: 201 motion sources freshly assemble into 804 sections (2,334,324 bytes) with 30,693 resolved relocations; 201 streams are parsed and all 1,475 inputs in the merged contribution are source-bound. The existing completion log still leaves effects for command IDs 5, 13, and 14, frame processing, and scheduling open. | If behavior-level source completeness is part of the goal, close those named commands and the top-level frame/scheduler path with bounded consumer traces. This is VM semantics evidence; current receipts do not show missing native code for these handlers. |

The largest raw/encoded classes are not equivalent to missing instruction
sources. Direct-sound records rebuild from 439 AIFF inputs; 3,404 compressed
messages regenerate and decode to source tokens; the merged battle-animation
contribution has a source list for all 1,475 assets and complete LZ boundaries;
and the FE6 multiboot payload is explicitly decompressed and mapped. The
remaining data work is to establish which of these formats the original game
actually interprets as code or script, rather than to disassemble every byte
that could be entered only after corrupting memory.

## Delivery criteria

The source/code portion can be treated as closed for intended native execution
when a fresh build reproduces the canonical image, every reachable ARM/Thumb
range has a source owner or an explicitly documented hardware operation, every
valid copied/decompressed executable is separately mapped to source, and each
game-authored VM stream consumed on supported paths has a bounded parser and
dispatch account. The current artifacts satisfy the owner, payload-source,
candidate-pointer, and byte-reconstruction portions. Fresh build recovery,
the four-byte historical pointer decision, and intended-path closure for
scripted execution remain the targeted open items. These are discrete checks,
not a denominator based on all bytes the CPU could theoretically fetch.
