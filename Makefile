.DEFAULT_GOAL := compare

#### Tools ####

ifeq ($(OS),Windows_NT)
  EXE := .exe
else
  EXE :=
endif

UNAME := $(shell uname)

TOOLCHAIN ?= $(DEVKITARM)
PREFIX ?= arm-none-eabi-

export PATH := $(TOOLCHAIN)/bin:$(PATH)

ifeq ($(UNAME),Darwin)
	SHELL := /bin/bash
endif

CPP ?= $(PREFIX)cpp$(EXE)
AS := $(PREFIX)as$(EXE)
LD := $(PREFIX)ld$(EXE)
OBJCOPY := $(PREFIX)objcopy$(EXE)
STRIP := $(PREFIX)strip$(EXE)

CC1     := tools/agbcc/bin/agbcc$(EXE)
CC1_OLD := tools/agbcc/bin/old_agbcc$(EXE)

BIN2C      := tools/bin2c/bin2c$(EXE)
GBAGFX     := tools/gbagfx/gbagfx$(EXE)
SCANINC    := tools/scaninc/scaninc$(EXE)
AIF2PCM    := tools/aif2pcm/aif2pcm$(EXE)
MID2AGB    := tools/mid2agb/mid2agb$(EXE)
TEXTENCODE := tools/textencode/textencode$(EXE)
JSONPROC   := tools/jsonproc/jsonproc$(EXE)
PREPROC    := tools/preproc/preproc$(EXE)
FETSATOOL  := scripts/gfxtools/tsa_generator.py
TMAP2TSA   := scripts/tmap2tsa.py
MARTOMAP   := scripts/mar_to_map.py
PYTHON    ?= python3
PAL2GBAPAL := $(GBAGFX)

ifeq ($(UNAME),Darwin)
	SED := sed -i ''
else
	SED := sed -i
endif

ifeq ($(UNAME),Darwin)
	SHASUM := shasum
else
	SHASUM := sha1sum
endif

CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm -ffix-debug-line -g
CPPFLAGS := -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef
ASFLAGS  := -mcpu=arm7tdmi -mthumb-interwork -I include

#### Files ####

C_SUBDIR = src
ASM_SUBDIR = asm
DATA_SUBDIR = data
DATA_SRC_SUBDIR = src/data
SAMPLE_SUBDIR = sound/direct_sound_samples
MID_SUBDIR = sound/songs/midi
MAP_LAYOUT_SUBDIR = graphics/map/layout

ROM          := fireemblem8.gba
ELF          := $(ROM:.gba=.elf)
MAP          := $(ROM:.gba=.map)
LDSCRIPT     := ldscript.txt
SYM_FILES    := sym_iwram.txt
CFILES_GENERATED := $(C_SUBDIR)/msg_data.c
CFILES       := $(wildcard $(C_SUBDIR)/*.c)
CFILES       += src/arm/map_flood_core.c src/arm/put_oam.c src/arm/decode_string.c src/arm/draw_glyph.c src/arm/tm_fill_rect.c src/arm/tm_copy_rect.c src/arm/map_flood_step.c src/arm/color_fade_tick.c src/arm/clear_oam.c src/arm/checksum.c src/arm/tm_apply_tsa.c
ifeq (,$(findstring $(CFILES_GENERATED),$(CFILES)))
CFILES       += $(CFILES_GENERATED)
endif
ASM_S_FILES  := $(wildcard $(ASM_SUBDIR)/*.s)
SRC_S_FILES  := src/rom_header.s src/crt0.s src/m4a_1.s src/libagbsyscall.s
DATA_S_FILES := $(wildcard $(DATA_SUBDIR)/*.s)
DATA_SRC_C_FILES := $(wildcard $(DATA_SRC_SUBDIR)/*.c $(DATA_SRC_SUBDIR)/mapanim/*.c $(DATA_SRC_SUBDIR)/menu/*.c $(DATA_SRC_SUBDIR)/ending/*.c $(DATA_SRC_SUBDIR)/worldmap/*.c $(DATA_SRC_SUBDIR)/ui/*.c)
DATA_SRC_C_OBJECTS := $(DATA_SRC_C_FILES:.c=.o)
DATA_SRC_SFILES_COMPILED := $(DATA_SRC_C_FILES:.c=.s)
# Hand-written (extracted, descriptively-named) data assembled directly. Kept in
# src/data/ subdirs (not the top-level src/data/*.s wildcard, which holds
# compiler intermediates of the typed .c data).
DATA_SRC_S_FILES := $(filter-out $(DATA_SRC_SFILES_COMPILED),$(wildcard $(DATA_SRC_SUBDIR)/map/*.s $(DATA_SRC_SUBDIR)/unit_icon/*.s $(DATA_SRC_SUBDIR)/banim/*.s $(DATA_SRC_SUBDIR)/mapanim/*.s $(DATA_SRC_SUBDIR)/menu/*.s $(DATA_SRC_SUBDIR)/ending/*.s $(DATA_SRC_SUBDIR)/worldmap/*.s $(DATA_SRC_SUBDIR)/ui/*.s))
SOUND_S_FILES := $(wildcard sound/*.s sound/songs/*.s sound/songs/mml/*.s sound/voicegroups/*.s)
SFILES       := $(ASM_S_FILES) $(SRC_S_FILES) $(DATA_S_FILES) $(DATA_SRC_S_FILES) $(SOUND_S_FILES)
SFILES_COMPILED := $(CFILES:.c=.s)
C_OBJECTS    := $(CFILES:.c=.o)
ASM_OBJECTS  := $(SFILES:.s=.o)
BANIM_OBJECT := banim/data_banim.o
MID_FILES    := $(wildcard $(MID_SUBDIR)/*.mid)
MID_OBJECTS  := $(MID_FILES:.mid=.o)
ALL_OBJECTS  := $(C_OBJECTS) $(DATA_SRC_C_OBJECTS) $(ASM_OBJECTS) $(BANIM_OBJECT) $(MID_OBJECTS)
OBJECTS_LST  := objects.lst
DEPS_DIR     := .dep

AUTO_GEN_TARGETS :=

# Use the older compiler to build library code
src/agb_sram.o: CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O1 -ffix-debug-line -g
src/m4a.o: CC1 := $(CC1_OLD)

# These routines execute in ARM mode inside the copied ARM code block.
# This compiler warns about -g with -fomit-frame-pointer; this leaf function
# does not create a stack frame. Keep debug information without -Werror here.
src/arm/clear_oam.o: CC1 := tools/agbcc/bin/agbcc_arm$(EXE)
src/arm/clear_oam.o: CC1FLAGS := -quiet -mthumb-interwork -Wimplicit -Wparentheses -O2 -fomit-frame-pointer -fno-schedule-insns2 -g

# Legacy ARM agbcc always saves lr along with any callee-saved registers.
# GNU ARM GCC can reproduce these routines' original leaf prologues without lr.
MODERN_ARM_OBJECTS := src/arm/checksum.o src/arm/tm_apply_tsa.o
$(MODERN_ARM_OBJECTS): CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
$(MODERN_ARM_OBJECTS): CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-auto-inc-dec -fno-ivopts -g

# The prefix pointer pool is emitted by the pinned GCC plugin, not inline opcodes.
ARM_MATCH_PLUGIN := .deps/arm-matching-plugin/zero_test.so
$(ARM_MATCH_PLUGIN): tools/arm-matching/zero_test.cc tools/arm-matching/build.py
	$(PYTHON) tools/arm-matching/build.py

src/arm/color_fade_tick.o: $(ARM_MATCH_PLUGIN)
src/arm/color_fade_tick.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/arm/color_fade_tick.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-auto-inc-dec -fno-ivopts -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-move-loop-invariants -fno-tree-loop-im -fplugin=$(ARM_MATCH_PLUGIN) -fplugin-arg-zero_test-prefix-pool=gPaletteBuffer,gFadeComponents,gFadeComponentStep

# Isolated pinned backend: explicit PC reads, BX dispatch and shared literals.
ARM_DISPATCH_CC := .deps/gcc16-matching/install/bin/arm-none-eabi-gcc
ARM_DISPATCH_DIR := .deps/flood-core-new-backend
ARM_DISPATCH_TABLE := $(ARM_DISPATCH_DIR)/branch_tables.so
ARM_DISPATCH_XOR := $(ARM_DISPATCH_DIR)/xor_flags.so
$(ARM_DISPATCH_CC): tools/arm-dispatch/build_backend.py tools/arm-dispatch/matching.md tools/arm-dispatch/thumb-leaf-frame.patch
	$(PYTHON) tools/arm-dispatch/build_backend.py

$(ARM_DISPATCH_TABLE): $(ARM_DISPATCH_CC) tools/arm-dispatch/branch_tables.cc tools/arm-dispatch/build_branch_tables.py
	$(PYTHON) tools/arm-dispatch/build_branch_tables.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

$(ARM_DISPATCH_XOR): $(ARM_DISPATCH_CC) tools/arm-dispatch/xor_flags.cc tools/arm-dispatch/build_xor_flags.py
	$(PYTHON) tools/arm-dispatch/build_xor_flags.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/arm/map_flood_core.o: $(ARM_DISPATCH_TABLE) $(ARM_DISPATCH_XOR)
src/arm/map_flood_core.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/arm/map_flood_core.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-auto-inc-dec -fno-ivopts -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-move-loop-invariants -fno-tree-loop-im -ffixed-r14 -ffixed-r1 -ffixed-r2 -ffixed-r3 -Werror=attributes -fplugin=$(ARM_DISPATCH_XOR) -fplugin=$(ARM_DISPATCH_TABLE) -fplugin-arg-branch_tables-pc-relative -fplugin-arg-branch_tables-sink-trampolines -fplugin-arg-branch_tables-prefix-symbols=gMovMapFillStPool1,gMovMapFillStPool2 -fplugin-arg-branch_tables-shared-literal=gMovMapFillStPool1,MapFloodCorePool,0 -fplugin-arg-branch_tables-shared-literal=gMovMapFillStPool2,MapFloodCorePool,4 -fplugin-arg-branch_tables-shared-literal=gMovMapFillState,MapFloodCoreStepPool,4

src/arm/map_flood_step.o: $(ARM_MATCH_PLUGIN)
src/arm/map_flood_step.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/arm/map_flood_step.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -ffixed-r14 -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-auto-inc-dec -fno-ivopts -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fplugin=$(ARM_MATCH_PLUGIN) -fplugin-arg-zero_test-prefix-pool=gWorkingTerrainMoveCosts,gMovMapFillState,gWorkingBmMap,gBmMapTerrain,gBmMapUnit

src/arm/tm_copy_rect.o: $(ARM_MATCH_PLUGIN)
src/arm/tm_copy_rect.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/arm/tm_copy_rect.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-auto-inc-dec -fno-ivopts -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-move-loop-invariants -fno-tree-loop-im -fplugin=$(ARM_MATCH_PLUGIN)

src/arm/tm_fill_rect.o: $(ARM_MATCH_PLUGIN)
src/arm/tm_fill_rect.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/arm/tm_fill_rect.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-auto-inc-dec -fno-ivopts -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-move-loop-invariants -fno-tree-loop-im -fplugin=$(ARM_MATCH_PLUGIN) -fplugin-arg-zero_test-scalar-copy-sub-zero

src/arm/draw_glyph.o: $(ARM_MATCH_PLUGIN)
src/arm/draw_glyph.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/arm/draw_glyph.o: CC1FLAGS := -std=gnu89 -O2 -fno-section-anchors -fno-toplevel-reorder -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -ffixed-r14 -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-auto-inc-dec -fno-ivopts -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-move-loop-invariants -fno-tree-loop-im -fplugin=$(ARM_MATCH_PLUGIN) -fplugin-arg-zero_test-prefix-pool=bitTable -fplugin-arg-zero_test-share-prefix-pool

src/arm/put_oam.o: $(ARM_MATCH_PLUGIN)
src/arm/put_oam.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/arm/put_oam.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -ffixed-r14 -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-auto-inc-dec -fno-ivopts -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-move-loop-invariants -fno-tree-loop-im -fplugin=$(ARM_MATCH_PLUGIN) -fplugin-arg-zero_test-prefix-pool=gOamHiPutIt

src/arm/decode_string.o: $(ARM_MATCH_PLUGIN)
src/arm/decode_string.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/arm/decode_string.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -ffixed-r14 -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-auto-inc-dec -fno-ivopts -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-move-loop-invariants -fno-tree-loop-im -fplugin=$(ARM_MATCH_PLUGIN) -fplugin-arg-zero_test-prefix-pool=gMsgHuffmanTableRoot,gMsgHuffmanTable -fplugin-arg-zero_test-zero-self-sub -fplugin-arg-zero_test-sign-zero-tests

# This Thumb leaf must not gain a prologue or alter the calibrated delay loop.
src/sio_multiboot_wait.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/sio_multiboot_wait.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -g

# Matching Thumb audio leaves; channel linkage uses shared PCM/CGB fields.
src/m4a_clear_chain.o src/m4a_pend.o src/m4a_clear_mod.o src/m4a_read_command.o src/m4a_channel_volume.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/m4a_clear_chain.o src/m4a_pend.o src/m4a_clear_mod.o src/m4a_read_command.o src/m4a_channel_volume.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -g

THUMB_SHARED_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_shared_literal.so
$(THUMB_SHARED_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_shared_literal.cc tools/arm-dispatch/build_thumb_shared.py
	$(PYTHON) tools/arm-dispatch/build_thumb_shared.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_sound_vsync.o: $(THUMB_SHARED_PLUGIN)
src/m4a_sound_vsync.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_sound_vsync.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fplugin=$(THUMB_SHARED_PLUGIN) -fplugin-arg-thumb_shared_literal-literal=0x03007ff0,lt2_SOUND_INFO_PTR -fplugin-arg-thumb_shared_literal-literal=0x68736d53,lt2_ID_NUMBER -fplugin-arg-thumb_shared_literal-carry-tests -fplugin-arg-thumb_shared_literal-byte-counter -fplugin-arg-thumb_shared_literal-zero-pool-padding

THUMB_IP_RETURN_PLUGIN := $(ARM_DISPATCH_DIR)/ip_return.so
$(THUMB_IP_RETURN_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/ip_return.cc tools/arm-dispatch/build_ip_return.py
	$(PYTHON) tools/arm-dispatch/build_ip_return.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_command_setters.o: $(THUMB_IP_RETURN_PLUGIN)
src/m4a_command_setters.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_command_setters.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -ffunction-sections -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(THUMB_IP_RETURN_PLUGIN) -fplugin-arg-ip_return-preserves-ip=ld_r3_tp_adr_i

src/m4a_flag_setters.o: $(THUMB_IP_RETURN_PLUGIN)
src/m4a_flag_setters.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_flag_setters.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -ffunction-sections -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(THUMB_IP_RETURN_PLUGIN) -fplugin-arg-ip_return-preserves-ip=ld_r3_tp_adr_i

src/m4a_reset_setters.o: $(THUMB_IP_RETURN_PLUGIN)
src/m4a_reset_setters.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_reset_setters.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -ffunction-sections -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(THUMB_IP_RETURN_PLUGIN) -fplugin-arg-ip_return-preserves-ip=ld_r3_tp_adr_i_unchecked -fplugin-arg-ip_return-preserves-ip=clear_modM -fplugin-arg-ip_return-forward-exits

src/m4a_mod_type.o: $(THUMB_IP_RETURN_PLUGIN)
src/m4a_mod_type.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mod_type.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -ffunction-sections -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(THUMB_IP_RETURN_PLUGIN) -fplugin-arg-ip_return-preserves-ip=ld_r3_tp_adr_i -fplugin-arg-ip_return-forward-exits

src/m4a_tempo.o: $(THUMB_IP_RETURN_PLUGIN)
src/m4a_tempo.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_tempo.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(THUMB_IP_RETURN_PLUGIN) -fplugin-arg-ip_return-preserves-ip=ld_r3_tp_adr_i

ARM_COPY_ADD_ZERO_PLUGIN := $(ARM_DISPATCH_DIR)/copy_add_zero.so
$(ARM_COPY_ADD_ZERO_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/copy_add_zero.cc tools/arm-dispatch/build_copy_add_zero.py
	$(PYTHON) tools/arm-dispatch/build_copy_add_zero.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
ARM_BYTE_POSTINCREMENT_PLUGIN := $(ARM_DISPATCH_DIR)/byte_postincrement.so
$(ARM_BYTE_POSTINCREMENT_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/byte_postincrement.cc tools/arm-dispatch/build_byte_postincrement.py
	$(PYTHON) tools/arm-dispatch/build_byte_postincrement.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
ARM_SUBTRACT_COMPARE_PLUGIN := $(ARM_DISPATCH_DIR)/subtract_compare.so
$(ARM_SUBTRACT_COMPARE_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/subtract_compare.cc tools/arm-dispatch/build_subtract_compare.py
	$(PYTHON) tools/arm-dispatch/build_subtract_compare.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
ARM_PC_ADDRESS_PLUGIN := $(ARM_DISPATCH_DIR)/pc_address.so
$(ARM_PC_ADDRESS_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/pc_address.cc tools/arm-dispatch/build_pc_address.py
	$(PYTHON) tools/arm-dispatch/build_pc_address.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
ARM_ADD_CARRY_PLUGIN := $(ARM_DISPATCH_DIR)/add_carry.so
$(ARM_ADD_CARRY_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/add_carry.cc tools/arm-dispatch/build_add_carry.py
	$(PYTHON) tools/arm-dispatch/build_add_carry.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
ARM_ADJACENT_PLUGIN := $(ARM_DISPATCH_DIR)/arm_adjacent.so
$(ARM_ADJACENT_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/arm_adjacent.cc tools/arm-dispatch/build_arm_adjacent.py
	$(PYTHON) tools/arm-dispatch/build_arm_adjacent.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_packed.o: $(ARM_ADD_CARRY_PLUGIN) $(ARM_SUBTRACT_COMPARE_PLUGIN) $(ARM_ADJACENT_PLUGIN)
src/m4a_packed.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_packed.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_ADD_CARRY_PLUGIN) -fplugin=$(ARM_SUBTRACT_COMPARE_PLUGIN) -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_Short -fplugin-arg-arm_adjacent-conditional=SoundMainRAM_SaveChannel -fplugin-arg-arm_adjacent-lr-input=read-only

src/m4a_short.o: $(ARM_ADJACENT_PLUGIN)
src/m4a_short.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_short.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_ShortCount -fplugin-arg-arm_adjacent-conditional=SoundMainRAM_ShortEnd

ARM_WORD_POSTINCREMENT_PLUGIN := $(ARM_DISPATCH_DIR)/word_postincrement.so
$(ARM_WORD_POSTINCREMENT_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/word_postincrement.cc tools/arm-dispatch/build_word_postincrement.py
	$(PYTHON) tools/arm-dispatch/build_word_postincrement.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_partial.o: $(ARM_WORD_POSTINCREMENT_PLUGIN) $(ARM_ADJACENT_PLUGIN)
src/m4a_partial.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_partial.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_WORD_POSTINCREMENT_PLUGIN) -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_RestoreFrame -fplugin-arg-arm_adjacent-transfer=branch

src/m4a_resample.o: $(ARM_ADJACENT_PLUGIN)
src/m4a_resample.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_resample.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_ResampleAdvance -fplugin-arg-arm_adjacent-lr-input=accumulator -fplugin-arg-arm_adjacent-conditional=SoundMainRAM_ResampleNoAdvance

src/m4a_loop.o: $(ARM_ADJACENT_PLUGIN)
src/m4a_loop.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_loop.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_Partial -fplugin-arg-arm_adjacent-conditional=SoundMainRAM_ShortCount -fplugin-arg-arm_adjacent-sp-input=frame64

ARM_INDIRECT_FRAME_PLUGIN := $(ARM_DISPATCH_DIR)/arm_indirect_frame.so
$(ARM_INDIRECT_FRAME_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/arm_indirect_frame.cc tools/arm-dispatch/build_arm_indirect_frame.py
	$(PYTHON) tools/arm-dispatch/build_arm_indirect_frame.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_save_channel.o: $(ARM_PC_ADDRESS_PLUGIN) $(ARM_INDIRECT_FRAME_PLUGIN)
src/m4a_save_channel.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_save_channel.o: CC1FLAGS := -std=gnu89 -O1 -foptimize-sibling-calls -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_PC_ADDRESS_PLUGIN) -fplugin=$(ARM_INDIRECT_FRAME_PLUGIN) -fplugin-arg-pc_address-symbol=SoundMainRAM_ChanAdvance -fplugin-arg-pc_address-offset=1

src/m4a_reverb.o: $(ARM_BYTE_POSTINCREMENT_PLUGIN) $(ARM_SUBTRACT_COMPARE_PLUGIN) $(ARM_PC_ADDRESS_PLUGIN)
src/m4a_reverb.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_reverb.o: CC1FLAGS := -std=gnu89 -O1 -foptimize-sibling-calls -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_BYTE_POSTINCREMENT_PLUGIN) -fplugin=$(ARM_SUBTRACT_COMPARE_PLUGIN) -fplugin=$(ARM_PC_ADDRESS_PLUGIN) -fplugin-arg-pc_address-symbol=SoundMainRAM_ChanSetup -fplugin-arg-pc_address-offset=47

src/m4a_multiply_high.o: $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_multiply_high.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_multiply_high.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN)

THUMB_COMPARE_ORDER_PLUGIN := $(ARM_DISPATCH_DIR)/compare_order.so
$(THUMB_COMPARE_ORDER_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/compare_order.cc tools/arm-dispatch/build_compare_order.py
	$(PYTHON) tools/arm-dispatch/build_compare_order.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
THUMB_STACK_WORD_PLUGIN := $(ARM_DISPATCH_DIR)/stack_word.so
$(THUMB_STACK_WORD_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/stack_word.cc tools/arm-dispatch/build_stack_word.py
	$(PYTHON) tools/arm-dispatch/build_stack_word.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_address_filter.o: $(THUMB_COMPARE_ORDER_PLUGIN) $(THUMB_STACK_WORD_PLUGIN) $(THUMB_SHARED_PLUGIN)
src/m4a_address_filter.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_address_filter.o: C_END_ALIGN := 1
src/m4a_address_filter.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -Werror=attributes -fplugin=$(THUMB_SHARED_PLUGIN) -fplugin=$(THUMB_STACK_WORD_PLUGIN) -fplugin=$(THUMB_COMPARE_ORDER_PLUGIN) -fplugin-arg-thumb_shared_literal-symbol-literal=gMPlayJumpTableTemplate,lt_MPlayJumpTableTemplate -fplugin-arg-thumb_shared_literal-omit-pool-alignment

THUMB_GROUP_STORES_PLUGIN := $(ARM_DISPATCH_DIR)/group_stores.so
$(THUMB_GROUP_STORES_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/group_stores.cc tools/arm-dispatch/build_group_stores.py
	$(PYTHON) tools/arm-dispatch/build_group_stores.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_clear_block.o: $(THUMB_GROUP_STORES_PLUGIN)
src/m4a_clear_block.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_clear_block.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fno-schedule-insns -fno-schedule-insns2 -Werror=attributes -fplugin=$(THUMB_GROUP_STORES_PLUGIN)

THUMB_COUNTDOWN_PLUGIN := $(ARM_DISPATCH_DIR)/countdown.so
$(THUMB_COUNTDOWN_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/countdown.cc tools/arm-dispatch/build_countdown.py
	$(PYTHON) tools/arm-dispatch/build_countdown.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_jump_table.o: $(THUMB_IP_RETURN_PLUGIN) $(THUMB_SHARED_PLUGIN) $(THUMB_COUNTDOWN_PLUGIN)
src/m4a_jump_table.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_jump_table.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(THUMB_COUNTDOWN_PLUGIN) -fplugin=$(THUMB_SHARED_PLUGIN) -fplugin=$(THUMB_IP_RETURN_PLUGIN) -fplugin-arg-countdown-preserves-counter=chk_adr_r2 -fplugin-arg-thumb_shared_literal-symbol-literal=gMPlayJumpTableTemplate,lt_MPlayJumpTableTemplate -fplugin-arg-thumb_shared_literal-zero-pool-padding -fplugin-arg-ip_return-preserves-ip=chk_adr_r2 -fplugin-arg-ip_return-body-branches

THUMB_SHARED_FRAME_PLUGIN := $(ARM_DISPATCH_DIR)/shared_frame.so
$(THUMB_SHARED_FRAME_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/shared_frame.cc tools/arm-dispatch/build_shared_frame.py
	$(PYTHON) tools/arm-dispatch/build_shared_frame.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_repeat.o: $(THUMB_SHARED_FRAME_PLUGIN)
src/m4a_repeat.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_repeat.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(THUMB_SHARED_FRAME_PLUGIN) -fplugin-arg-shared_frame-destination=ply_goto -fplugin-arg-shared_frame-entry=ply_goto_1 -fplugin-arg-shared_frame-returning-call=ld_r3_tp_adr_i

THUMB_TAIL_TRANSFER_PLUGIN := $(ARM_DISPATCH_DIR)/tail_transfer.so
$(THUMB_TAIL_TRANSFER_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/tail_transfer.cc tools/arm-dispatch/build_tail_transfer.py
	$(PYTHON) tools/arm-dispatch/build_tail_transfer.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_byte_load.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_byte_load.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_byte_load.o: C_END_ALIGN := 1
src/m4a_byte_load.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=chk_adr_r2 -fplugin-arg-tail_transfer-adjacent-destination=chk_adr_r2

src/m4a_checked_reader.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_checked_reader.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_checked_reader.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fno-schedule-insns -fno-schedule-insns2 -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=chk_adr_r2

src/m4a_pattern.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_pattern.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_pattern.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=ply_goto -fplugin-arg-tail_transfer-destination=ply_fine -fplugin-arg-tail_transfer-raise-unsigned-bound

src/m4a_sequence_goto.o: $(ARM_DISPATCH_CC)
src/m4a_sequence_goto.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_sequence_goto.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-unwind-tables -fno-asynchronous-unwind-tables

src/m4a_voice.o: $(THUMB_IP_RETURN_PLUGIN)
src/m4a_voice.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_voice.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(THUMB_IP_RETURN_PLUGIN) -fplugin-arg-ip_return-preserves-ip=chk_adr_r2

src/m4a_port.o: $(THUMB_IP_RETURN_PLUGIN)
src/m4a_port.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_port.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(THUMB_IP_RETURN_PLUGIN) -fplugin-arg-ip_return-preserves-ip=_081DD64A

THUMB_LEAF_PLUGIN := $(ARM_DISPATCH_DIR)/leaf_frame.so
$(THUMB_LEAF_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/leaf_frame.cc tools/arm-dispatch/build_leaf_frame.py
	$(PYTHON) tools/arm-dispatch/build_leaf_frame.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_end_tie.o: $(THUMB_LEAF_PLUGIN)
src/m4a_end_tie.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_end_tie.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -Werror=attributes -fplugin=$(THUMB_LEAF_PLUGIN)

# Empty constraints must contribute zero estimated bytes in this translation
# unit, or Event1B_TEXTSHOW receives an unnecessarily expanded branch.
EMPTY_ASM_CC1 := tools/agbcc-empty-asm/agbcc$(EXE)
src/eventscr.o: CC1 := $(EMPTY_ASM_CC1)
src/eventscr.o: src/eventscr.c $(EMPTY_ASM_CC1)
$(EMPTY_ASM_CC1): tools/agbcc-empty-asm/build.py tools/agbcc-empty-asm/empty-asm-length.patch
	$(PYTHON) tools/agbcc-empty-asm/build.py --output $@

# The channel release handler needs the backend's equality-only bit test.
TST_CC1 := tools/agbcc-tst/agbcc$(EXE)
src/m4a_fine.o src/m4a_track_stop.o: CC1 := $(TST_CC1)
src/m4a_fine.o src/m4a_track_stop.o: $(TST_CC1)
$(TST_CC1): tools/agbcc-tst/build.py tools/agbcc-tst/check.py tools/agbcc-tst/empty-asm-length.patch tools/agbcc-tst/equality-bit-test.patch tools/agbcc-tst/live-and-zero.patch
	$(PYTHON) tools/agbcc-tst/build.py --output $@

# TODO: find a more elegant solution to the inlining issue
src/bmitem.o: CC1FLAGS += -Wno-error
src/menu_def.o: CC1FLAGS += -Wno-error

#### Main Targets ####

compare: $(ROM)
	$(SHASUM) -c checksum.sha1

.PHONY: compare

#### Shiftability harness (scripts/shiftcheck/) ####
# Detects hardcoded pointers (raw absolute addresses that bypass the symbol system)
# which would break if the ROM layout shifted. Entirely separate from the matching
# build: never touches $(ROM)/$(ELF)/compare. See scripts/shiftcheck/README.md.
RELOCS_ELF  := fireemblem8_relocs.elf
SHIFTDIR    := build/shiftcheck
SHIFT       ?= 0x40000
SHIFT2      ?= 0x80000
SHIFTCHECK  := scripts/shiftcheck

# Layer 0: audit hardcoded addresses in the build system (Makefile/ldscripts).
shiftcheck-build:
	$(PYTHON) $(SHIFTCHECK)/scan_build_addrs.py --makefile Makefile \
	    --ldscript $(LDSCRIPT) --banim-ldscript linker_script_banim.txt

# Layer 1: relink with --emit-relocs, then flag ROM-pointer words with no relocation.
$(RELOCS_ELF): $(ALL_OBJECTS) $(OBJECTS_LST) $(LDSCRIPT)
	LD='$(LD)' OBJECTS_LST='$(OBJECTS_LST)' BANIM_OBJECT='$(BANIM_OBJECT)' \
	    $(SHIFTCHECK)/emit_relocs_link.sh $@ $(LDSCRIPT) -q

shiftcheck-static: $(RELOCS_ELF) $(ROM) $(MAP)
	$(PYTHON) $(SHIFTCHECK)/scan_relocs.py --elf $(RELOCS_ELF) --gba $(ROM) \
	    --map $(MAP) --ref-elf $(ELF) --prefix $(PREFIX) \
	    --allowlist $(SHIFTCHECK)/allowlist.txt

# Layer 1b: flag relocations against the WRONG base symbol -- a stored pointer written
# "ResourceA + hardcoded offset" that lands in a different resource B (breaks if A is resized).
shiftcheck-offsets: $(RELOCS_ELF) $(ROM) $(MAP)
	$(PYTHON) $(SHIFTCHECK)/scan_offsets.py --elf $(RELOCS_ELF) --gba $(ROM) \
	    --map $(MAP) --ref-elf $(ELF) --prefix $(PREFIX)

# Layer 2: differential two-shift build; an independent (reloc-table-free) confirm.
shiftcheck-diff: $(ROM) $(MAP) $(OBJECTS_LST)
	LD='$(LD)' OBJCOPY='$(OBJCOPY)' OBJECTS_LST='$(OBJECTS_LST)' \
	    BANIM_OBJECT='$(BANIM_OBJECT)' \
	    $(PYTHON) $(SHIFTCHECK)/diff_shift.py --base-gba $(ROM) --ldscript $(LDSCRIPT) \
	    --map $(MAP) --ref-elf $(ELF) --prefix $(PREFIX) --shifts $(SHIFT),$(SHIFT2) \
	    --outdir $(SHIFTDIR) --allowlist $(SHIFTCHECK)/allowlist.txt

# Layer 3: runtime smoke test (needs mGBA python bindings; non-blocking if absent).
shiftcheck-run: $(ROM) $(MAP) $(OBJECTS_LST)
	LD='$(LD)' OBJCOPY='$(OBJCOPY)' OBJECTS_LST='$(OBJECTS_LST)' \
	    BANIM_OBJECT='$(BANIM_OBJECT)' \
	    $(PYTHON) $(SHIFTCHECK)/run_dynamic.py --base-gba $(ROM) --shift $(SHIFT) \
	    --ldscript $(LDSCRIPT) --map $(MAP) --outdir $(SHIFTDIR) --prefix $(PREFIX)

# Static layers (the CI gate): build-system audit + reloc scan + cross-resource offsets + differential.
shiftcheck: shiftcheck-build shiftcheck-static shiftcheck-offsets shiftcheck-diff

.PHONY: shiftcheck shiftcheck-build shiftcheck-static shiftcheck-offsets shiftcheck-diff shiftcheck-run

CLEAN_FILES := $(ROM) $(ELF) $(MAP) $(OBJECTS_LST) $(SFILES_COMPILED) $(DATA_SRC_SFILES_COMPILED) graphics/*.h $(CFILES_GENERATED) $(RELOCS_ELF) $(RELOCS_ELF:.elf=.map)
CLEAN_DIRS := $(DEPS_DIR) $(SHIFTDIR)
CLEAN_BINS := graphics/statscreen/*.bin $(SAMPLE_SUBDIR)/*.bin $(MAP_LAYOUT_SUBDIR)/*.bin graphics/map/*TileConfiguration*.bin $(AUTO_GEN_TARGETS)
CLEAN_SONGS := $(MID_SUBDIR)/*.s

# Shared clean routine
clean_common:
	$(RM) $(CLEAN_FILES) $(CLEAN_BINS) $(CLEAN_SONGS)
	$(RM) -rf $(CLEAN_DIRS)

clean_fast: clean_common
	$(RM) $(C_OBJECTS) $(ASM_OBJECTS) $(MID_OBJECTS)
	@find . \( -iname '*.o' -o -iname '*.obj' -o -iname '*.feimg*.bin'  -o -iname '*.fetsa*.bin' -o -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.fk' -o -iname '*.latfont' -o -iname '*.hwjpnfont' -o -iname '*.fwjpnfont' \) -not -path './banim/*' -exec rm {} +

.PHONY: clean_fast clean_common

clean: clean_common
	$(RM) $(ALL_OBJECTS)
	# Remove battle animation binaries
	$(RM) -f banim/*.bin banim/*.o banim/*.lz banim/*.bak
	@find . \( -iname '*.o' -o -iname '*.obj' -o -iname '*.feimg*.bin'  -o -iname '*.fetsa*.bin' -o -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.fk' -o -iname '*.latfont' -o -iname '*.hwjpnfont' -o -iname '*.fwjpnfont' \) -exec rm {} +

.PHONY: clean

# Hard clean: remove every untracked and ignored file in the working tree,
# preserving only baserom.gba (and embedded git repos like .deps/agbcc).
# After this you must rebuild the tools (and reinstall agbcc into tools/agbcc
# via .deps/agbcc/install.sh) before `make` will work again.
clean_all:
	git clean -dfx -e baserom.gba

.PHONY: clean_all

tag:
	gtags
	ctags -R
	cscope -Rbkq

.PHONY: tag

#### Recipes ####

# Comprssed Texts Recipes

# =========
# = Texts =
# =========
TEXT_DIR := texts
TEXT_TOOLS := scripts/texttools

TEXT_DECODER := $(PYTHON)  $(TEXT_TOOLS)/textdecoder.py
TEXT_DPARSER := $(PYTHON) $(TEXT_TOOLS)/textdeparser.py
TEXT_PROCESS := $(PYTHON) $(TEXT_TOOLS)/textprocess.py

TEXT_MAIN := $(TEXT_DIR)/texts.txt
TEXT_DEFS := $(TEXT_DIR)/textdefs.txt
TEXT_SRC  := $(TEXT_MAIN) $(shell find $(TEXT_DIR) -type f -name "*.txt")

TEXT_HEADER := include/constants/msg.h
MSG_LIST    := src/msg_data.c

src/msg_data.c: $(TEXT_SRC) $(TEXT_DEFS)
	@$(TEXT_PROCESS) $(TEXT_MAIN) $(TEXT_DEFS) $@ $(TEXT_HEADER) utf8

# Graphics Recipes

include graphics_file_rules.mk
include graphics/banim/assets/img/banim_img_rules.mk
include songs.mk
include json_data_rules.mk

%.s: ;
%.png: ;
%.pal: ;
%.aif: ;

%.1bpp: %.png  ; $(GBAGFX) $< $@
%.4bpp: %.png  ; $(GBAGFX) $< $@
%.8bpp: %.png  ; $(GBAGFX) $< $@
%.gbapal: %.pal ; $(PAL2GBAPAL) $< $@
%.gbapal: %.png ; $(GBAGFX) $< $@
%.lz: % ; $(GBAGFX) $< $@ $(LZ_FLAGS)
# These DemonLight sprite images were compressed in the original ROM with a
# minimum LZ match distance of 3 (gbagfx defaults to 2). Reproduce byte-identically.
graphics/banim/dragonfx/Img_DemonLightSprites_087A5BA4.4bpp.lz: LZ_FLAGS := -mindist 3
graphics/banim/dragonfx/Img_DemonLightSprites_087A5E9C.4bpp.lz: LZ_FLAGS := -mindist 3
# Class-reel (gOpinfo) glyph font: 64 per-glyph 4bpp images, min LZ match distance 2.
graphics/misc/opinfo_letter/%.4bpp.lz: LZ_FLAGS := -mindist 2
# Orphaned LZ77 TSA tilemap (was hidden after Pal_080E1164), min LZ match distance 1.
graphics/banim/misc/Tsa_080E1184.tsa.lz: LZ_FLAGS := -mindist 1
# Orphaned PlayerRankFog fog image (was hidden after Pal_PlayerRankFog), min match distance 2.
graphics/misc/Img_PlayerRankFog.4bpp.lz: LZ_FLAGS := -mindist 2

# The FE6 save-report program embedded in FE8 is built separately: it uses
# agbcc 010110-ThumbPatch, not the main game's compiler configuration.
mgfembp/Makefile:
	$(PYTHON) tools/mgfembp-source/restore.py

mgfembp/tools/install_agbcc.sh: | mgfembp/Makefile
	test -f $@

mgfembp/tools/agbcc/bin/agbcc: mgfembp/tools/install_agbcc.sh | mgfembp/Makefile
	cd mgfembp && env -u C_INCLUDE_PATH bash tools/install_agbcc.sh
	test -x $@

mgfembp/mgfembp.bin: mgfembp/tools/agbcc/bin/agbcc FORCE_MGFEMBP
	env -u C_INCLUDE_PATH $(MAKE) -C mgfembp CPP="$(PREFIX)cpp" PREFIX="$(PREFIX)" tools
	env -u C_INCLUDE_PATH $(MAKE) -C mgfembp CPP="$(PREFIX)cpp" PREFIX="$(PREFIX)" mgfembp.bin

# Distance-one backreferences are valid for the bootstrap's WRAM decompressor.
# Use the payload's compressor, which supports this option.
fe6sio_payload.bin.lz: mgfembp/mgfembp.bin
	mgfembp/tools/gbagfx/gbagfx $< $@ -search 1

asm/fe6sio.o: fe6sio_payload.bin.lz

FORCE_MGFEMBP:
.PHONY: FORCE_MGFEMBP

# Titlescreen dragon-foreground TSA was compressed with minimum LZ match distance 1.
graphics/titlescreen/title_dragon_foreground.map.bin.lz: LZ_FLAGS := -mindist 1
%.rl: % ; $(GBAGFX) $< $@
%.fk: % ; ./scripts/compressor.py $< fk
%.bin: %.mar  ; $(MARTOMAP)  $< $@
sound/%.bin: sound/%.aif ; $(AIF2PCM) $< $@

%.4bpp.h: %.4bpp
	$(BIN2C) $< $(subst .,_,$(notdir $<)) | sed 's/^const //' > $@

%.feimg1.bin %.fetsa1.bin: %.png
	$(FETSATOOL) $< $*.feimg1.bin $*.fetsa1.bin

%.feimg2.bin %.fetsa2.bin: %.png
	$(FETSATOOL) $< $*.feimg2.bin $*.fetsa2.bin

%.feimg3.bin %.fetsa3.bin: %.png
	$(FETSATOOL) $< $*.feimg3.bin $*.fetsa3.bin

%.feimg4.bin %.fetsa4.bin: %.png
	$(FETSATOOL) $< $*.feimg4.bin $*.fetsa4.bin

# Battle Animation Recipes

$(BANIM_OBJECT): $(shell ./scripts/arm_compressing_linker.py -t linker_script_banim.txt -m)
	./scripts/arm_compressing_linker.py -o $@ -t linker_script_banim.txt -b 0x8c02000 -l $(LD) --objcopy $(OBJCOPY) -c ./scripts/compressor.py

%_modes.bin: %_motion.o
	$(OBJCOPY) -O binary -j .data.modes $< $@

%_oam_l.bin: %_motion.o
	$(OBJCOPY) -O binary -j .data.oam_l $< $@

%_oam_r.bin: %_motion.o
	$(OBJCOPY) -O binary -j .data.oam_r $< $@

# Map tileset configuration: assemble .S (metatile/terrain macros) to a flat
# binary, which the %.lz rule then compresses for incbin.
graphics/map/%.bin: graphics/map/%.S graphics/map/tile_config.inc
	$(AS) $(ASFLAGS) -g $< -o $(@:.bin=.o)
	$(OBJCOPY) -O binary $(@:.bin=.o) $@


# Automatic dependency generation

MAKEDEP = mkdir -p $(DEPS_DIR)/$(dir $*) && $(CPP) $(CPPFLAGS) $< -MM -MG -MT $*.o > $(DEPS_DIR)/$*.d

MAKECMDGOALS_NODEP := clean tag

ifeq (,$(filter $(MAKECMDGOALS),$(MAKECMDGOALS_NODEP)))
-include $(addprefix $(DEPS_DIR)/,$(CFILES:.c=.d))
endif

$(DEPS_DIR)/%.d: %.c
	@$(MAKEDEP)

$(OBJECTS_LST): $(ALL_OBJECTS)
	@echo $(ALL_OBJECTS) > $@

$(ELF): $(ALL_OBJECTS) $(OBJECTS_LST) $(LDSCRIPT) $(SYM_FILES)
	$(LD) -T $(LDSCRIPT) -Map $(MAP) @$(OBJECTS_LST) -R $(BANIM_OBJECT).sym.o -L tools/agbcc/lib -o $@ -lc -lgcc
	$(STRIP) -N .gcc2_compiled. $@

%.gba: %.elf
	$(OBJCOPY) --strip-debug -O binary --pad-to 0x9000000 --gap-fill=0xff $< $@

C_END_ALIGN := 2

$(C_OBJECTS): %.o: %.c $(DEPS_DIR)/%.d
	@$(MAKEDEP)
	$(CPP) $(CPPFLAGS) $< | iconv -f UTF-8 -t CP932 | $(CC1) $(CC1FLAGS) -o $*.s
	echo '.ALIGN $(C_END_ALIGN), 0' >> $*.s
ifeq ($(UNAME),Darwin)
	$(SED) -f scripts/align_2_before_debug_section_for_osx.sed $*.s
else
	$(SED) '/.section	.debug_line/i\.align 2, 0' $*.s
endif
	$(AS) $(ASFLAGS) $*.s -o $@

ifeq ($(NODEP),1)
asm/%.o:      data_dep :=
else
asm/%.o:      data_dep = $(shell $(SCANINC) -I include -I "" $*.s)
endif

ifeq ($(NODEP),1)
src/%.o:      data_dep :=
else
src/%.o:      data_dep = $(shell $(SCANINC) -I include -I "" $*.s)
endif

ifeq ($(NODEP),1)
src/data/%.o: data_dep :=
else
src/data/%.o: data_dep = $(shell $(SCANINC) -I include -I "" $(if $(wildcard $*.c),$*.c,$*.s))
endif

ifeq ($(NODEP),1)
data/%.o:     data_dep :=
else
data/%.o:     data_dep = $(shell $(SCANINC) -I include -I "" $*.s)
endif

ifeq ($(NODEP),1)
banim/%.o:    data_dep :=
else
banim/%.o:    data_dep = $(shell $(SCANINC) -I include -I "" $*.s)
endif

ifeq ($(NODEP),1)
sound/%.o:    data_dep :=
else
sound/%.o:    data_dep = $(shell $(SCANINC) -I include -I "" $*.s)
endif

.SECONDEXPANSION:
$(ASM_OBJECTS): %.o: %.s $$(data_dep)
	$(AS) $(ASFLAGS) -g $< -o $@

# Build the host preproc via its own Makefile (plain g++). build_tools.sh already
# does this through make_tools.mk's tools/* wildcard; this explicit rule shadows
# make's built-in %:%.cpp rule, which would otherwise inherit the project's
# -nostdinc CPPFLAGS and fail (<cstdio> not found) if preproc.cpp is newer than
# the binary -- e.g. after a `git pull` followed by `make` without rebuilding tools.
$(PREPROC): tools/preproc/preproc.cpp tools/preproc/Makefile
	$(MAKE) -C tools/preproc

$(DATA_SRC_C_OBJECTS): %.o: %.c $(PREPROC) $$(data_dep)
	$(PREPROC) $< | $(CPP) $(CPPFLAGS) - | iconv -f UTF-8 -t CP932 | $(CC1) $(CC1FLAGS) -o $*.s
	echo '.ALIGN $(C_END_ALIGN), 0' >> $*.s
ifeq ($(UNAME),Darwin)
	$(SED) -f scripts/align_2_before_debug_section_for_osx.sed $*.s
else
	$(SED) '/.section	.debug_line/i\.align 2, 0' $*.s
endif
	$(AS) $(ASFLAGS) $*.s -o $@
%.lz:$(MAP_LAYOUT_SUBDIR)/%.bin ; $(GBAGFX) $< $@

# Don't delete intermediate files
.SECONDARY:

# debug print, to use, call "make print-(your label here)"
print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true

ARM_BYTE_PREINCREMENT_PLUGIN := $(ARM_DISPATCH_DIR)/byte_preincrement.so
$(ARM_BYTE_PREINCREMENT_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/byte_preincrement.cc tools/arm-dispatch/build_byte_preincrement.py
	$(PYTHON) tools/arm-dispatch/build_byte_preincrement.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
ARM_SUBTRACT_ZERO_PLUGIN := $(ARM_DISPATCH_DIR)/subtract_zero.so
$(ARM_SUBTRACT_ZERO_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/subtract_zero.cc tools/arm-dispatch/build_subtract_zero.py
	$(PYTHON) tools/arm-dispatch/build_subtract_zero.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_advance.o: $(ARM_ADJACENT_PLUGIN) $(ARM_SUBTRACT_COMPARE_PLUGIN) $(ARM_BYTE_PREINCREMENT_PLUGIN) $(ARM_SUBTRACT_ZERO_PLUGIN)
src/m4a_advance.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_advance.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin=$(ARM_SUBTRACT_COMPARE_PLUGIN) -fplugin=$(ARM_BYTE_PREINCREMENT_PLUGIN) -fplugin=$(ARM_SUBTRACT_ZERO_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_ResampleNoAdvance -fplugin-arg-arm_adjacent-early=SoundMainRAM_ResampleLoop -fplugin-arg-arm_adjacent-lr-input=masked

src/m4a_resample_loop.o: $(ARM_ADJACENT_PLUGIN)
src/m4a_resample_loop.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_resample_loop.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_ResampleWrap -fplugin-arg-arm_adjacent-early=SoundMainRAM_ResampleStop -fplugin-arg-arm_adjacent-sp-input=frame64

ARM_SIGNED_SUM_PLUGIN := $(ARM_DISPATCH_DIR)/signed_sum.so
$(ARM_SIGNED_SUM_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/signed_sum.cc tools/arm-dispatch/build_signed_sum.py
	$(PYTHON) tools/arm-dispatch/build_signed_sum.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_wrap.o: $(ARM_ADJACENT_PLUGIN) $(ARM_SIGNED_SUM_PLUGIN)
src/m4a_wrap.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_wrap.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_SIGNED_SUM_PLUGIN) -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_ResampleWrap -fplugin-arg-arm_adjacent-early=SoundMainRAM_ResampleReload -fplugin-arg-arm_adjacent-transfer=branch

src/m4a_stop.o: $(ARM_ADJACENT_PLUGIN)
src/m4a_stop.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_stop.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_Partial -fplugin-arg-arm_adjacent-transfer=branch -fplugin-arg-arm_adjacent-sp-input=pop2

src/m4a_word_finish.o: $(ARM_WORD_POSTINCREMENT_PLUGIN) $(ARM_SUBTRACT_COMPARE_PLUGIN) $(ARM_ADJACENT_PLUGIN)
src/m4a_word_finish.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_word_finish.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_WORD_POSTINCREMENT_PLUGIN) -fplugin=$(ARM_SUBTRACT_COMPARE_PLUGIN) -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_ResampleFinish -fplugin-arg-arm_adjacent-early=SoundMainRAM_Resample

src/m4a_fixed_word_finish.o: $(ARM_WORD_POSTINCREMENT_PLUGIN) $(ARM_SUBTRACT_COMPARE_PLUGIN) $(ARM_ADJACENT_PLUGIN)
src/m4a_fixed_word_finish.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_fixed_word_finish.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_WORD_POSTINCREMENT_PLUGIN) -fplugin=$(ARM_SUBTRACT_COMPARE_PLUGIN) -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_SaveChannel -fplugin-arg-arm_adjacent-early=SoundMainRAM_FixedSetup -fplugin-arg-arm_adjacent-transfer=branch

src/m4a_fixed_lane.o: $(ARM_ADD_CARRY_PLUGIN) $(ARM_ADJACENT_PLUGIN)
src/m4a_fixed_lane.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_fixed_lane.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_ADD_CARRY_PLUGIN) -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_FixedWordFinish -fplugin-arg-arm_adjacent-early=SoundMainRAM_ShortMix

src/m4a_resample_lane.o: $(ARM_ADD_CARRY_PLUGIN) $(ARM_ADJACENT_PLUGIN)
src/m4a_resample_lane.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_resample_lane.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_ADD_CARRY_PLUGIN) -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_ResampleWordFinish -fplugin-arg-arm_adjacent-early=SoundMainRAM_ResampleMix

src/m4a_resample_setup.o: $(ARM_BYTE_PREINCREMENT_PLUGIN) $(ARM_ADJACENT_PLUGIN)
src/m4a_resample_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_resample_setup.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_BYTE_PREINCREMENT_PLUGIN) -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_Resample -fplugin-arg-arm_adjacent-sp-input=push2 -fplugin-arg-arm_adjacent-lr-input=load-word

src/m4a_fixed_setup.o: $(ARM_SUBTRACT_COMPARE_PLUGIN) $(ARM_ADJACENT_PLUGIN)
src/m4a_fixed_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_fixed_setup.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_SUBTRACT_COMPARE_PLUGIN) -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_Packed -fplugin-arg-arm_adjacent-early-pair=SoundMainRAM_Short -fplugin-arg-arm_adjacent-lr-input=remainder

src/m4a_sample_entry.o: $(ARM_ADJACENT_PLUGIN)
src/m4a_sample_entry.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_sample_entry.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_FixedSetup -fplugin-arg-arm_adjacent-early=SoundMainRAM_ResampleSetup -fplugin-arg-arm_adjacent-sp-input=store0

src/m4a_resample_finish.o: $(ARM_ADJACENT_PLUGIN)
src/m4a_resample_finish.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_resample_finish.o: CC1FLAGS := -std=gnu89 -O1 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_ADJACENT_PLUGIN) -fplugin-arg-arm_adjacent-destination=SoundMainRAM_SaveResampled -fplugin-arg-arm_adjacent-sp-input=pop2-decrement

# Private Thumb clearing entry: bounded countdown and adjacent channel fallthrough.
ARM_SHIFT_CARRY_PLUGIN := $(ARM_DISPATCH_DIR)/shift_carry.so
$(ARM_SHIFT_CARRY_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/shift_carry.cc tools/arm-dispatch/build_shift_carry.py
	$(PYTHON) tools/arm-dispatch/build_shift_carry.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_no_reverb.o: $(ARM_WORD_POSTINCREMENT_PLUGIN) $(ARM_SHIFT_CARRY_PLUGIN)
src/m4a_no_reverb.o: C_END_ALIGN := 1
src/m4a_no_reverb.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_no_reverb.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(ARM_WORD_POSTINCREMENT_PLUGIN) -fplugin=$(ARM_SHIFT_CARRY_PLUGIN)

THUMB_FALLTHROUGH_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_fallthrough.so
$(THUMB_FALLTHROUGH_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_fallthrough.cc tools/arm-dispatch/build_thumb_fallthrough.py
	$(PYTHON) tools/arm-dispatch/build_thumb_fallthrough.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_channel_setup.o: $(THUMB_FALLTHROUGH_PLUGIN)
src/m4a_channel_setup.o: C_END_ALIGN := 1
src/m4a_channel_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_channel_setup.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_FALLTHROUGH_PLUGIN)

src/m4a_deadline.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_deadline.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_deadline.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=SoundMainRAM_DeadlineContinue -fplugin-arg-tail_transfer-destination=SoundMainRAM_DeadlineExit -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-raise-unsigned-bound -fplugin-arg-tail_transfer-pool-adjacent-destination=SoundMainRAM_DeadlineContinue

THUMB_BLOCK_LAYOUT_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_block_layout.so
$(THUMB_BLOCK_LAYOUT_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_block_layout.cc tools/arm-dispatch/build_thumb_block_layout.py
	$(PYTHON) tools/arm-dispatch/build_thumb_block_layout.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_envelope.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_BLOCK_LAYOUT_PLUGIN) $(THUMB_SHARED_PLUGIN)
src/m4a_envelope.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_envelope.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=SoundMainRAM_EnvelopeVolume -fplugin-arg-tail_transfer-destination=SoundMainRAM_ChanAdvance -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=SoundMainRAM_EnvelopeVolume -fplugin=$(THUMB_BLOCK_LAYOUT_PLUGIN) -fplugin=$(THUMB_SHARED_PLUGIN) -fplugin-arg-thumb_shared_literal-byte-counter-carry

# Private Thumb volume calculation and alias-sensitive loop setup.
src/m4a_volume.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_volume.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_volume.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=SoundMainRAM_ResumeSamples -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=SoundMainRAM_ResumeSamples -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN)

THUMB_FORK_DECREMENT_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_fork_decrement.so
$(THUMB_FORK_DECREMENT_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_fork_decrement.cc tools/arm-dispatch/build_thumb_fork_decrement.py
	python3 tools/arm-dispatch/build_thumb_fork_decrement.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_channel_advance.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_FORK_DECREMENT_PLUGIN)
src/m4a_channel_advance.o: C_END_ALIGN := 1
src/m4a_channel_advance.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_channel_advance.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=SoundMainRAM_DeadlineExit -fplugin-arg-tail_transfer-destination=SoundMainRAM_ChanLoop -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=SoundMainRAM_DeadlineExit -fplugin=$(THUMB_FORK_DECREMENT_PLUGIN)
src/m4a_exit_info.o: $(THUMB_FALLTHROUGH_PLUGIN)
src/m4a_exit_info.o: C_END_ALIGN := 1
src/m4a_exit_info.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_exit_info.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_FALLTHROUGH_PLUGIN)

THUMB_FRAME_RETURN_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_frame_return.so
$(THUMB_FRAME_RETURN_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_frame_return.cc tools/arm-dispatch/build_thumb_frame_return.py
	python3 tools/arm-dispatch/build_thumb_frame_return.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_exit_restore.o: $(THUMB_FRAME_RETURN_PLUGIN)
src/m4a_exit_restore.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_exit_restore.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_FRAME_RETURN_PLUGIN) -fplugin-arg-thumb_frame_return-grouped

THUMB_PC_HANDOFF_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_pc_handoff.so
$(THUMB_PC_HANDOFF_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_pc_handoff.cc tools/arm-dispatch/build_thumb_pc_handoff.py
	python3 tools/arm-dispatch/build_thumb_pc_handoff.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_sample_handoff.o: $(THUMB_PC_HANDOFF_PLUGIN)
src/m4a_sample_handoff.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_sample_handoff.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_PC_HANDOFF_PLUGIN) -fplugin-arg-thumb_pc_handoff-symbol=SoundMainRAM_SampleEntry -fplugin-arg-thumb_pc_handoff-site=6 -fplugin-arg-thumb_pc_handoff-offset=4

THUMB_SPLIT_HANDOFF_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_split_handoff.so
$(THUMB_SPLIT_HANDOFF_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_split_handoff.cc tools/arm-dispatch/build_thumb_split_handoff.py
	python3 tools/arm-dispatch/build_thumb_split_handoff.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_mixer_entry.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_SPLIT_HANDOFF_PLUGIN)
src/m4a_mixer_entry.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mixer_entry.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=SoundMainRAM_NoReverb -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-indirect-register=1 -fplugin=$(THUMB_SPLIT_HANDOFF_PLUGIN) -fplugin-arg-thumb_split_handoff-arm-destination=SoundMainRAM_Reverb -fplugin-arg-thumb_split_handoff-thumb-destination=SoundMainRAM_NoReverb

THUMB_LITERAL_CONSTANTS_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_literal_constants.so
$(THUMB_LITERAL_CONSTANTS_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_literal_constants.cc tools/arm-dispatch/build_thumb_literal_constants.py
	python3 tools/arm-dispatch/build_thumb_literal_constants.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
THUMB_SUBTRACT_BRANCH_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_subtract_branch.so
$(THUMB_SUBTRACT_BRANCH_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_subtract_branch.cc tools/arm-dispatch/build_thumb_subtract_branch.py
	python3 tools/arm-dispatch/build_thumb_subtract_branch.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
THUMB_ADD_ORDER_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_add_order.so
$(THUMB_ADD_ORDER_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_add_order.cc tools/arm-dispatch/build_thumb_add_order.py
	python3 tools/arm-dispatch/build_thumb_add_order.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_buffer_entry.o: $(THUMB_LITERAL_CONSTANTS_PLUGIN) $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_SUBTRACT_BRANCH_PLUGIN) $(THUMB_ADD_ORDER_PLUGIN) $(THUMB_SHARED_PLUGIN)
src/m4a_buffer_entry.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_buffer_entry.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_LITERAL_CONSTANTS_PLUGIN) -fplugin-arg-thumb_literal_constants-value=848 -fplugin-arg-thumb_literal_constants-value=1584 -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-indirect-register=3 -fplugin=$(THUMB_SUBTRACT_BRANCH_PLUGIN) -fplugin=$(THUMB_ADD_ORDER_PLUGIN) -fplugin=$(THUMB_SHARED_PLUGIN) -fplugin-arg-thumb_shared_literal-literal=848,lt_o_SoundInfo_pcmBuffer -fplugin-arg-thumb_shared_literal-literal=1584,lt_PCM_DMA_BUF_SIZE -fplugin-arg-thumb_shared_literal-symbol-literal=SoundMainRAM_BufferThumb,lt_SoundMainRAM_Buffer -fplugin-arg-thumb_shared_literal-zero-pool-padding

src/m4a_deadline_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_SHARED_PLUGIN)
src/m4a_deadline_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_deadline_setup.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -falign-functions=4 -Werror=attributes -fplugin=$(THUMB_SHARED_PLUGIN) -fplugin-arg-thumb_shared_literal-literal=0x04000006,lt_REG_VCOUNT -fplugin-arg-thumb_shared_literal-omit-pool-alignment -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-after-shared-literals -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-destination=SoundMainCallbacks -fplugin-arg-tail_transfer-terminal-adjacent-destination=SoundMainCallbacks -fplugin-arg-tail_transfer-raise-unsigned-bound

THUMB_CALLBACK_CHAIN_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_callback_chain.so
$(THUMB_CALLBACK_CHAIN_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_callback_chain.cc tools/arm-dispatch/build_thumb_callback_chain.py
	python3 tools/arm-dispatch/build_thumb_callback_chain.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_callbacks.o: $(THUMB_CALLBACK_CHAIN_PLUGIN)
src/m4a_callbacks.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_callbacks.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_CHAIN_PLUGIN) -fplugin-arg-thumb_callback_chain-trampoline=SoundMainRAM_ExitRestore -fplugin-arg-thumb_callback_chain-offset=18

THUMB_ENTRY_FRAME_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_entry_frame.so
$(THUMB_ENTRY_FRAME_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_entry_frame.cc tools/arm-dispatch/build_thumb_entry_frame.py
	python3 tools/arm-dispatch/build_thumb_entry_frame.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_entry_frame.o: $(THUMB_ENTRY_FRAME_PLUGIN)
src/m4a_entry_frame.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_entry_frame.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_ENTRY_FRAME_PLUGIN) -fplugin-arg-thumb_entry_frame-pointer=0x03007ff0,lt_SOUND_INFO_PTR -fplugin-arg-thumb_entry_frame-id=0x68736d53,lt_ID_NUMBER
src/m4a_entry_literals.o: $(ARM_DISPATCH_CC)
src/m4a_entry_literals.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_entry_literals.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding

src/m4a_mplay_tempo_accumulate.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_tempo_accumulate.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_tempo_accumulate.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainTempoStore
src/m4a_mplay_tempo_finish.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_tempo_finish.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_tempo_finish.o: C_END_ALIGN := 1
src/m4a_mplay_tempo_finish.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainTempoStore -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainTempoStore
src/m4a_mplay_tempo_gate.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_tempo_gate.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_tempo_gate.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainTickLoop -fplugin-arg-tail_transfer-destination=MPlayMainPostTick -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostTick -fplugin-arg-tail_transfer-raise-unsigned-le-bound
