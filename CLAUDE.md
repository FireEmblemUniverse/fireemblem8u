# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a decompilation of **Fire Emblem: The Sacred Stones** (GBA). The goal is to reverse-engineer the original ROM into matching C source code, translating ARM/Thumb assembly from `asm/` into equivalent C in `src/`. The compiled output must be **byte-identical** to the original ROM. Only `asm/arm.s` and `asm/arm_call.s` remain as non-handwritten assembly to decompile.

## Build Commands

```bash
# Build the ROM (parallel)
make fireemblem8.gba -j$(nproc)

# Clean all build artifacts (slow — recompresses battle animations)
make clean

# Clean everything except battle animation compression outputs (preferred)
make clean_fast
```

A successful build ends with `fireemblem8.gba: OK` (SHA-1 checksum match). This is the only "test" — there is no test suite. If the last line says `FAILED`, the decompiled code does not match the original ROM.

## Compiler & Toolchain

- **agbcc**: a modified GCC 2.95 targeting ARM7TDMI (Thumb/ARM interwork), located at `tools/agbcc/`
- This is **C89-era** — no `//` comments in compiled code, no C99 features
- Compiler flags: `-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm`
- Source is preprocessed with `cpp`, piped through `iconv` (UTF-8 → CP932), then compiled with `agbcc`
- Some files use `old_agbcc` or different flags — see per-file overrides in `Makefile`

## Architecture

### Decompilation Workflow

Assembly lives in `asm/`, decompiled C goes in `src/`. The linking order in `ldscript.txt` determines ROM layout. When decompiling a function: add `src/x.o(.text)` **before** `asm/x.o(.text)` in `ldscript.txt`, remove the function from the `.s` file, and write the C equivalent in `src/x.c`.

### Proc System (Cooperative Multitasking)

The engine uses a **Proc** system (`include/proc.h`, `src/proc.c`) — a tree-based cooperative scheduler. Game entities are `struct Proc` with script tables (`struct ProcCmd[]`) defining behavior as command sequences: `PROC_CALL`, `PROC_REPEAT`, `PROC_SLEEP`, `PROC_YIELD`, `PROC_START_CHILD_BLOCKING`, etc. Local proc structs embed `PROC_HEADER` at offset 0 and add custom fields after.

### Memory Sections

- `EWRAM_DATA` — variables in external work RAM (256 KB), used for large/global game state
- `CONST_DATA` / `SECTION(".data")` — data that logically should be `const` but was in `.data` in the original binary
- `EWRAM_OVERLAY(id)` — overlaid EWRAM sections for memory reuse between screens

### Key Subsystems

- **Units**: `struct Unit` / `struct CharacterData` / `struct ClassData` in `bmunit.h`. Arrays: `gUnitArrayBlue` (player), `gUnitArrayRed` (enemy), `gUnitArrayGreen` (NPC), `gUnitArrayPurple`
- **Events**: scripted cutscenes via event engine (`src/event.c`, `src/eventscr*.c`)
- **Battle animations**: `src/banim-*.c` — largest subsystem. Data in `banim/` with custom compression linker (`scripts/arm_compressing_linker.py`)
- **World map**: `src/worldmap_*.c`
- **Text system**: source in `texts/*.txt`, processed by `scripts/texttools/` into `src/msg_data.c` and `include/constants/msg.h`

## Code Conventions

### Include Order

Every `.c` file starts with `#include "global.h"` as the **first** include. This pulls in GBA types, `prelude.h`, `types.h`, `variables.h`, and `functions.h`. Then constants headers (`constants/*.h`), then module headers.

### Naming

- Functions and types: `PascalCase` (`Proc_Start`, `struct Unit`, `GetItemAttributes`)
- Global variables: `gCamelCase` (`gActiveUnitId`, `gPaletteBuffer`)
- Static/local variables: `sCamelCase` (`sProcArray`, `sKeyStatusBuffer`)
- Constants/enums: `UPPER_SNAKE_CASE` (`UNIT_LEVEL_MAX`, `PROC_MARK_EVENT`)
- Many functions retain `sub_XXXXXXXX` placeholder names from ROM addresses

### Struct Layout

Struct fields are annotated with byte offset comments: `/* 0C */ struct Vec2 camera;`

### Header Guards

All headers use `#ifndef GUARD_FILENAME_H` / `#define GUARD_FILENAME_H`.

### Formatting

`.clang-format` configured: Allman braces, 4-space indent, 100-column limit, no tabs. `global.h` is always sorted first in includes.

### Matching Requirements

Compiled output must be byte-identical to the original ROM:
- Register allocation, instruction selection, and data layout must match exactly
- Sometimes "ugly" code is needed to coerce specific instruction generation
- `STRUCT_PAD(from, to)` pads struct fields to match original layout
- `SHOULD_BE_CONST` marks data that logically should be const but must stay mutable to match
