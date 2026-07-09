# Banim AnimScr Decompilation & Linker Pipeline Report

## 1. Overview
As part of the effort to remove uncompiled binary blobs (`.bin`) from the Fire Emblem 8 ROM decompilation project, we targeted two battle animation scripts:
* `007219FC_AnimScr_NaglfarBG4.bin`
* `00723208_AnimScr_DarkBreath_Far.bin`

This document details the exploration of the project's custom build pipeline, the discovery of shared data structures between these binaries, and the process of successfully converting them to assembly source code (`.s`) that builds byte-for-byte identically to the original ROM.

## 2. The `arm_compressing_linker.py` Pipeline
During the investigation, we analyzed the project's custom compression workflow, which is primarily driven by `scripts/arm_compressing_linker.py` and configured via `linker_script_banim.txt`.

The pipeline functions as follows for typical animated assets (e.g., `banim_arcf_ar1_2_motion.s`):
1. **Compilation:** The `.s` file is assembled into an object file (`.o`).
2. **Extraction & Compression:** The Python script reads `linker_script_banim.txt`. If it encounters a directive like `file.o|section>lz`, it extracts the specified section (often `.data.script` or `.data.tsa`) and passes it through an external LZ77 compression tool.
3. **Relinking:** The newly compressed binary blob is re-wrapped into a standard object file. The Python script generates a new `.s` wrapper that `.incbin`s the compressed data and assigns it a symbol with an `_o` suffix (e.g., `banim_arcf_ar1_2_motion_o`).
4. **Integration:** The main linker handles this wrapper object, mapping the compressed asset to its final ROM destination.

## 3. Analysis of Naglfar & DarkBreath Scripts
Upon disassembling `NaglfarBG4` and `DarkBreath_Far`, two critical details emerged:

### 3.1 Shared OAM Arrays
The `DarkBreath_Far` script does not contain its own Object Attribute Memory (OAM) frame definitions. Instead, its animation script pointers reference memory addresses located *inside* the `NaglfarBG4` binary block (specifically between offsets `0xc3c` and `0x1808` of the Naglfar file). This meant they could not be safely disassembled in isolation without breaking label references.

### 3.2 Bypass of the Compression Pipeline
A review of `data/data_banim.s` revealed that these two scripts were included using standard `.incbin` directives without a `.lz` suffix. Because neither file was compressed in the original ROM, **the `arm_compressing_linker.py` pipeline was not required for them.**

## 4. The Solution: Direct Assembly Integration
Instead of forcing the files through the complex Python linker script, we opted for a native GNU Assembler approach:

1. **Unified Disassembly:** Both scripts and their shared OAM arrays were disassembled into a single file: `data/banim/animscr_naglfarbg4_darkbreath.s`. This allowed the DarkBreath script to natively reference the Naglfar OAM labels.
2. **Macro Translation:** Raw hexadecimal values were reverse-engineered and translated into standard human-readable macros from `include/animscr.inc` (such as `anim_sprite`, `ANIMSCR_FORCE_SPRITE`, and `animscr_loop`).
3. **Assembler Arithmetic:** The `ANIMSCR_FORCE_SPRITE` macro performs complex bitwise label math (`label + (time & 0x3) + ((time & 0x1C) << 26)`). Because we skipped the Python linker and directly included the `.s` file, the `arm-none-eabi-as` assembler seamlessly translated these calculations into standard `R_ARM_ABS32` relocations.
4. **Direct Include:** We replaced the `.incbin` commands in `data/data_banim.s` with a single `.include "data/banim/animscr_naglfarbg4_darkbreath.s"`.

## 5. Result
- The unreadable binary blobs (`007219FC_AnimScr_NaglfarBG4.bin` and `00723208_AnimScr_DarkBreath_Far.bin`) were completely deleted from the repository.
- The repository was successfully built using standard `make fireemblem8.gba -j`.
- Executing `sha1sum -c checksum.sha1` confirmed a 100% byte-for-byte match with the original ROM.

**Conclusion:** The Python `arm_compressing_linker.py` tool is strictly for handling assets that require LZ compression or isolated symbol-wrapping. For standard, uncompressed sequential data, combining related blocks into unified `.s` files and using `.include` natively resolves complex label arithmetic and produces a cleaner, identical build.

## 6. C-side FORCE_SPRITE scripts (`gEkrdragonfx`, `efxmagic`) — 2026-06-03

The same FORCE_SPRITE pattern also appears in the **C** data files (`src/data/banim-*.c`), where animation scripts are written as `u32[]`/`AnimScr[]` and use the C macros in `include/anime.h` (`ANIMSCR_FORCE_SPRITE`, `ANIMSCR_DISABLED`, `ANIM_SPRITE_END`) rather than the `.inc` assembler macros. Three scripts still carried raw/obfuscated FORCE_SPRITE pointers and were decompiled to macro form, byte-identically:

- **`gEkrdragonfx_0` / `gEkrdragonfx_1`** (final-boss `efxMaohFlashEyeOBJ1`, the left/right-facing variants). Each is a force-sprite list — `ANIMSCR_FORCE_SPRITE(sprite, dur) ×8 + ANIMSCR_DISABLED`. Exactly as in §3.1, the referenced `struct AnimSpriteData` lived **inside other blobs**: `gEkr0`'s sprites were embedded in the `Pal_DemonLightSprites_EyeFlash` "palette", and `gEkr1`'s sprites inside `gEkr0`'s own body. Carved into 16 named `AnimSprite_Ekrdragonfx{0,1}_*[]` arrays; `gEkr1` mirrors `gEkr0` (`ATTR1_FLIP_X` + negated x), which independently confirms the decode.
- **`efxmagic`** (`FramScr_Unk5D4F90[0]`): a lone raw FORCE_SPRITE word → `ANIMSCR_FORCE_SPRITE(FramScr_Unk5D4F84, 1)`.

The C-macro arithmetic matches the assembler's: `ANIMSCR_FORCE_SPRITE(s, d) = (u32)s + ((d & 3) + ((d & 0x3C) << 26))`, and `(u32)&array` decays to a relocatable label, so the compiler emits the same `R_ARM_ABS32` relocation the assembler would.

**Shiftability note:** the original raw forms (`0x187A5138`, …) were absolute addresses carrying no relocation — they survived the byte-identical build but would break under a ROM layout shift; the macro/label forms relocate correctly.

The discovery that `Pal_DemonLightSprites_EyeFlash` was a palette with `AnimSpriteData` baked onto its end generalized into a broader audit — see `docs/banim_asset_extraction.md` § "Oversized `.agbpal` with hidden trailing assets" (5 more `.agbpal` in this PR carried hidden assets). `gEfxlvupfx_0` is a related case still awaiting full C-side AnimScr decomp.