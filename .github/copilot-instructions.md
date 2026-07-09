# Copilot Instructions — fireemblem8u

This is a decompilation project for **Fire Emblem: The Sacred Stones** (GBA). The goal is to reverse-engineer the original ROM into matching C source code, translating ARM/Thumb assembly in `asm/` into equivalent C in `src/`. The output must produce a byte-identical ROM when compiled.

## Build

A legally obtained ROM named `baserom.gba` must be at the repo root. First-time
setup (installs agbcc + builds the `tools/`): `./scripts/quickstart.sh` (see
`docs/quickstart.md`). Manual setup is in `README.md`.

```bash
# Build the ROM (uses agbcc, a GCC 2.95-based GBA C compiler)
make fireemblem8.gba -j$(nproc)

# Build AND verify the SHA-1 against baserom — this is the project's "test"
make -j$(nproc) compare

# Clean all build artifacts (slow — recompresses battle animations)
make clean

# Clean everything except battle animation compression outputs
make clean_fast
```

A successful build ends with `fireemblem8.gba: OK` (SHA-1 checksum match against
`baserom.gba`). There is no unit-test suite — **byte-identical ROM output is the
only test**. Verify the last line of `make compare` output is `OK`; `FAILED`
means the C does not match. There is no single-test granularity: the whole ROM
is rebuilt and checksummed. To narrow down a single function's mismatch, use
`./asmdiff.sh <hex_addr> <byte_len>` (objdump side-by-side of `baserom.gba` vs
`fireemblem8.gba`). `bash scripts/calcrom.sh` reports decompilation progress.

## Architecture

### Compiler & toolchain
- **agbcc**: a modified GCC 2.95 targeting ARM7TDMI (Thumb/ARM interwork). Located at `tools/agbcc/`. This is C89-era — no `//` comments in compiled code, no C99 features.
- Compiler flags: `-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm`
- Source is preprocessed with `cpp`, piped through `iconv` (UTF-8 → CP932), then compiled with `agbcc`.
- Some files use the older compiler (`old_agbcc`) or different flags — see per-file overrides in `Makefile`.

### Decompilation workflow
Assembly lives in `asm/` (only `arm.s` and `arm_call.s` remain, plus data files in `data/`). Decompiled C goes in `src/`. The linking order in `ldscript.txt` determines ROM layout — when decompiling a function, you add `src/x.o(.text)` **before** `asm/x.o(.text)` and remove the function from the `.s` file. Keep **both** the `src/` and `asm/` linker entries until `asm/x.s` is fully empty; leaving a function in both places causes a `multiple definition` link error. For undeclared symbols, locate the type with `git grep "<symbol>" include/` and add the owning header (functions still living in `asm/` get a bare forward declaration, not `extern`). The decomp tutorial in `CONTRIBUTING.md` walks a full function end-to-end.

### Files that must NOT be decompiled
These are handwritten assembly, already commented, and stay in `asm/`: `crt0.s`, `libagbsyscall.s`, `libgcnmultiboot.s`, `m4a_1.s`, `m4a_3.s`, `arm.s`, `arm_call.s`.

### Proc system (cooperative multitasking)
The engine uses a **Proc** system (`include/proc.h`, `src/proc.c`) — a tree-based cooperative scheduler. Game entities are `struct Proc` with script tables (`struct ProcCmd[]`) that define behavior as sequences of commands: `PROC_CALL`, `PROC_REPEAT`, `PROC_SLEEP`, `PROC_YIELD`, `PROC_START_CHILD_BLOCKING`, etc. Local proc structs embed `PROC_HEADER` at offset 0 and add custom fields after.

### Memory sections
- `EWRAM_DATA` — variables placed in external work RAM (256 KB). Used for all large/global game state.
- `CONST_DATA` — data that *should* be `const` but was placed in `.data` in the original binary (use `SECTION(".data")`).
- `EWRAM_OVERLAY(id)` — overlaid EWRAM sections for memory reuse between screens.

### Key subsystems
- **Units**: `struct Unit` / `struct CharacterData` / `struct ClassData` in `bmunit.h`. Unit arrays: `gUnitArrayBlue` (player), `gUnitArrayRed` (enemy), `gUnitArrayGreen` (NPC), `gUnitArrayPurple`.
- **Events**: scripted cutscenes via an event engine (`src/event.c`, `src/eventscr*.c`). Event scripts are `ProcCmd` tables.
- **Battle animations**: `src/banim-*.c` — the largest subsystem by file count. Battle animation data is in `banim/` with a custom compression linker (`scripts/arm_compressing_linker.py`).
- **World map**: `src/worldmap_*.c` — overworld screen and navigation.
- **Text system**: text source in `texts/*.txt`, processed by `scripts/texttools/` into `src/msg_data.c` and `include/constants/msg.h`.

## Conventions

### Include order
Every `.c` file starts with `#include "global.h"` as the first include. This pulls in GBA types, `prelude.h`, `types.h`, `variables.h`, and `functions.h`. Other includes follow — constants headers (`constants/*.h`), then module headers.

### Naming
- Functions and types use `PascalCase` (`Proc_Start`, `struct Unit`, `GetItemAttributes`).
- Global variables use `gCamelCase` (`gActiveUnitId`, `gPaletteBuffer`).
- Static/local variables use `sCamelCase` (`sProcArray`, `sKeyStatusBuffer`).
- Constants/enums use `UPPER_SNAKE_CASE` (`UNIT_LEVEL_MAX`, `PROC_MARK_EVENT`).
- Many functions still have original `sub_XXXXXXXX` placeholder names from the ROM addresses. Renaming these to descriptive names is part of the decompilation effort.

### Struct layout comments
Struct fields are annotated with byte offset comments: `/* 0C */ struct Vec2 camera;`. This aids matching against the original binary layout.

### Header guards
All headers use `#ifndef GUARD_FILENAME_H` / `#define GUARD_FILENAME_H` style guards.

### Formatting
Configured in `.clang-format`: Allman braces, 4-space indent, 100-column limit, no tabs. `global.h` is always sorted first in includes.

### Matching requirements
The compiled output must be **byte-identical** to the original ROM. This means:
- Register allocation, instruction selection, and data layout must match exactly.
- Sometimes "ugly" code is required to coerce the compiler into generating specific instructions.
- `STRUCT_PAD(from, to)` is used to pad struct fields to match original layout.
- The `SHOULD_BE_CONST` marker denotes data that logically should be const but must stay mutable to match.

### Asset extraction
Raw data blobs are migrated from `dump/`*.bin into typed source (C arrays, or
`.png`/`.pal`/`.map.bin` tilemap graphics) following `docs/dump_extraction_plan.md`; each
conversion must round-trip byte-identical.

**Two tilemap (TSA) formats** — committed as binary, distinguished by file
extension (the bytes cannot be told apart structurally, only by the engine
consumer):
- `.map.bin` — **headerless** (pokeemerald `GBA_4BPP` style): raw `u16` entries,
  rows top-to-bottom, no header; size = `2*W*H`. Used by banim, scrolling
  backgrounds, and other raw tilemap consumers.
- `.tsa.bin` — **headered** ("FEGBA struct" / tilemap-studio `FEGBA_4BPP`): a
  2-byte header (`u8 width-1`, `u8 height-1`) then `(W*H)` `u16` entries, rows
  **bottom-to-top**; size = `2 + 2*W*H`. Consumed by `TmApplyTsa` /
  `CallARM_FillTileRect` (the FE "TSA" tile arrangement). Symbols use the `Tsa_`
  prefix. A few `.tsa.bin` blobs concatenate multiple TSAs after the first
  header (e.g. `gUnknown_085B0F2C`).

Renaming between these is build-safe (only the file extension and the `.incbin`
path change, not the ROM bytes). LZ-compressed assets are committed
**decompressed** (the build recompresses via `Makefile %.lz` rules) — never
commit `.lz`/`.4bpp`/`.gbapal`/`.map.bin.lz`/`.tsa.bin.lz` artifacts. When a recompressed asset
only prefix-matches the original at the 4-byte LZ header, sweep gbagfx's
minimum match distance (`gbagfx in out.lz -mindist N`, default 2) and pin the
winning value per-target via `LZ_FLAGS := -mindist N` in the `Makefile` — this
is a min-distance mismatch, not incompatible compression. See
`docs/lz_suffix_diagnostic.md`.
