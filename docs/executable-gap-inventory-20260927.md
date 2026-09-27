# Executable and source gap inventory — September 27, 2026

## Finding

The completed source inventory identifies no unowned native instruction bytes
in the main ROM or expanded FE6 save-report payload. The fresh build, native
copy-path inventory and remaining data-owner review are now complete. See
[native-source-completion.md](native-source-completion.md) for the original
matching-source acceptance criteria and explicit limits. The physical ledger
retains conservative execution-classification uncertainty for data; it is not
evidence of 13,381,675 bytes of missing code.

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

## Disposition of the earlier gaps

| Earlier item | Final disposition |
|---|---|
| Fresh build recovery | Closed. All 1,327 main objects and 99 linked payload objects were rebuilt; canonical images and fresh runtime/export comparisons pass. See `build-recovery-20260927.md`. |
| Native copy/decompression inventory | Completed in `native-load-paths.md`: four main and three payload copy mechanisms, serial decompression/entry, and generic MultiBoot capability. The exact FE6 serial transport edge is not fully established, but its receiver and expanded payload have matching source. No missing native implementation was found. |
| Input-data source accounting | Completed by `asset-provenance-index.md` and `data-source-remainder.md`. All previously unmapped input bytes have provenance; the remainder has linked source owners. This does not prove data is unreachable as code. |
| Orphan copy's exceptional word | Its value is exactly preserved and targets the existing `gProcScr_TalkWaitForInput` script-data table. No named source consumer or aligned base-pointer reference was found. Historical meaning and possible computed aliases remain uncertain; no missing native routine is established. |
| Battle-animation behavior documentation | Motion/asset source bytes and native handlers are present. Further explanation of command IDs 5, 13 and 14, frame processing and scheduling is semantic documentation beyond matching-source recovery, not an identified native implementation gap. |

The largest raw/encoded classes are not equivalent to missing instruction
sources. Direct-sound records rebuild from 439 AIFF inputs; 3,404 compressed
messages regenerate and decode to source tokens; the merged battle-animation
contribution has a source list for all 1,475 assets and complete LZ boundaries;
and the FE6 multiboot payload is explicitly decompressed and mapped.
The source/data inventory is complete for this review. No raw byte range is
called nonexecutable solely because of its filename, source directory, format,
or ELF data marker.

## Acceptance scope

The original requirements are matching-source recovery of the GBA program,
explicit accounting for embedded/copied code and hardware interfaces, separate
ROM-data accounting, and reproducible verification. The completed receipts
satisfy those source-recovery checks. An exhaustive indirect-control-flow proof,
every historical data meaning, every VM behavior explanation, and a native-engine
port are not claimed. `native-source-completion.md` records the detailed
assessment without treating ROM equality or a pure-C-object percentage as overall
C coverage.
