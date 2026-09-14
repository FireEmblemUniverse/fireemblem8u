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
CFILES       += src/arm/put_oam_lo.c src/arm/call_wrappers.c src/arm/map_flood_core.c src/arm/put_oam.c src/arm/decode_string.c src/arm/draw_glyph.c src/arm/tm_fill_rect.c src/arm/tm_copy_rect.c src/arm/map_flood_step.c src/arm/color_fade_tick.c src/arm/clear_oam.c src/arm/checksum.c src/arm/tm_apply_tsa.c
ifeq (,$(findstring $(CFILES_GENERATED),$(CFILES)))
CFILES       += $(CFILES_GENERATED)
endif
ASM_S_FILES  := $(wildcard $(ASM_SUBDIR)/*.s)
SRC_S_FILES  := src/m4a_1.s src/libagbsyscall.s
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
src/arm/call_wrappers.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/arm/call_wrappers.o: CC1FLAGS := -std=gnu89 -O2 -marm -mcpu=arm7tdmi -mno-thumb-interwork -mabi=apcs-gnu -ffreestanding -fno-builtin -fomit-frame-pointer -fno-unwind-tables -fno-asynchronous-unwind-tables

src/rom_header.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/rom_header.o: CC1FLAGS := -std=gnu89 -O2 -fno-toplevel-reorder -marm -mcpu=arm7tdmi -mno-thumb-interwork -mabi=apcs-gnu -ffreestanding -fno-unwind-tables -fno-asynchronous-unwind-tables

src/serial_boot.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/serial_boot.o: CC1FLAGS := -std=gnu89 -O2 -marm -mcpu=arm7tdmi -mno-thumb-interwork -mabi=apcs-gnu -ffreestanding -fno-unwind-tables -fno-asynchronous-unwind-tables

src/serial_poll.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/serial_poll.o: CC1FLAGS := -std=gnu89 -O2 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-unwind-tables -fno-asynchronous-unwind-tables

SERIAL_RESET_PLUGIN := .deps/serial-reset-backend/arm_lr_transfer.so
$(SERIAL_RESET_PLUGIN): tools/arm-dispatch/arm_lr_transfer.cc tools/arm-dispatch/build_arm_lr_transfer.py
	$(PYTHON) tools/arm-dispatch/build_arm_lr_transfer.py --compiler $(PREFIX)gcc$(EXE) --output-dir .deps/serial-reset-backend
src/serial_reset.o: $(SERIAL_RESET_PLUGIN)
src/serial_reset.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/serial_reset.o: CC1FLAGS := -std=gnu89 -O2 -fno-cse-follow-jumps -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-unwind-tables -fno-asynchronous-unwind-tables -fplugin=$(SERIAL_RESET_PLUGIN) -fplugin-arg-arm_lr_transfer-callee=sio_polling

IRQ_SEARCH_PLUGIN := .deps/irq-search-backend/arm_noreturn_frame.so
$(IRQ_SEARCH_PLUGIN): tools/arm-dispatch/arm_noreturn_frame.cc tools/arm-dispatch/build_arm_noreturn_frame.py
	$(PYTHON) tools/arm-dispatch/build_arm_noreturn_frame.py --compiler $(PREFIX)gcc$(EXE) --output-dir .deps/irq-search-backend
src/irq_search.o: $(IRQ_SEARCH_PLUGIN)
src/irq_search.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/irq_search.o: CC1FLAGS := -std=gnu89 -O2 -fno-cse-follow-jumps -fno-shrink-wrap -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-unwind-tables -fno-asynchronous-unwind-tables -fplugin=$(IRQ_SEARCH_PLUGIN) -fplugin-arg-arm_noreturn_frame-callee=IrqSelected -fplugin-arg-arm_noreturn_frame-fold-halts=2 -fplugin-arg-arm_noreturn_frame-adjacent=IrqSelected

src/irq_entry.o: $(IRQ_SEARCH_PLUGIN)
src/irq_entry.o: CC1 := $(PREFIX)gcc$(EXE) -S -x cpp-output -
src/irq_entry.o: CC1FLAGS := -std=gnu89 -O2 -fno-shrink-wrap -fno-schedule-insns2 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-unwind-tables -fno-asynchronous-unwind-tables -fplugin=$(IRQ_SEARCH_PLUGIN) -fplugin-arg-arm_noreturn_frame-callee=IrqSaveFrame -fplugin-arg-arm_noreturn_frame-adjacent=IrqSaveFrame

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

STARTUP_FRAME_PLUGIN := .deps/startup-frame-backend/startup_frame.so
$(STARTUP_FRAME_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/startup_frame.cc tools/arm-dispatch/build_startup_frame.py
	$(PYTHON) tools/arm-dispatch/build_startup_frame.py --compiler $(ARM_DISPATCH_CC) --output-dir .deps/startup-frame-backend
src/crt0.o: $(STARTUP_FRAME_PLUGIN)
src/crt0.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/crt0.o: CC1FLAGS := -std=gnu89 -O2 -fno-schedule-insns2 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(STARTUP_FRAME_PLUGIN) -fplugin-arg-startup_frame-layout

IRQ_FRAME_PLUGIN := .deps/irq-frame-backend/irq_frame.so
$(IRQ_FRAME_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/irq_frame.cc tools/arm-dispatch/build_irq_frame.py
	$(PYTHON) tools/arm-dispatch/build_irq_frame.py --compiler $(ARM_DISPATCH_CC) --output-dir .deps/irq-frame-backend
src/irq_save_frame.o: $(IRQ_FRAME_PLUGIN)
src/irq_save_frame.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/irq_save_frame.o: CC1FLAGS := -std=gnu89 -O2 -fno-schedule-insns2 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(IRQ_FRAME_PLUGIN) -fplugin-arg-irq_frame-save-adjacent=IrqSearch
src/irq_continuation.o: $(IRQ_FRAME_PLUGIN)
src/irq_continuation.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/irq_continuation.o: CC1FLAGS := -std=gnu89 -O2 -fno-schedule-insns2 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(IRQ_FRAME_PLUGIN) -fplugin-arg-irq_frame-pool=IrqHandlersPointer

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

OAM_ENTRY_PLUGIN := .deps/oam-entry-backend/oam_entry.so
$(OAM_ENTRY_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/oam_entry.cc tools/arm-dispatch/build_oam_entry.py
	$(PYTHON) tools/arm-dispatch/build_oam_entry.py --compiler $(ARM_DISPATCH_CC) --output-dir .deps/oam-entry-backend
src/arm/put_oam_lo.o: $(OAM_ENTRY_PLUGIN)
src/arm/put_oam_lo.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/arm/put_oam_lo.o: CC1FLAGS := -std=gnu89 -O2 -fno-schedule-insns2 -marm -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-unwind-tables -fno-asynchronous-unwind-tables -Werror=attributes -fplugin=$(OAM_ENTRY_PLUGIN)

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
ROW_SHIFT_CC1 := tools/agbcc-row-shift/agbcc$(EXE)
src/unitlistscreen.o: CC1 := $(ROW_SHIFT_CC1)
src/unitlistscreen.o: src/unitlistscreen.c $(ROW_SHIFT_CC1)
$(ROW_SHIFT_CC1): tools/agbcc-row-shift/build.py tools/agbcc-row-shift/empty-asm-length.patch tools/agbcc-row-shift/row-shift-alloc.patch
	$(PYTHON) tools/agbcc-row-shift/build.py --output $@

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

THUMB_STORE_DECREMENT_ZERO_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_store_decrement_zero.so
$(THUMB_STORE_DECREMENT_ZERO_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_store_decrement_zero.cc tools/arm-dispatch/build_thumb_store_decrement_zero.py
	python3 tools/arm-dispatch/build_thumb_store_decrement_zero.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
THUMB_DIRECT_TAILS_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_direct_tails.so
$(THUMB_DIRECT_TAILS_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_direct_tails.cc tools/arm-dispatch/build_thumb_direct_tails.py
	python3 tools/arm-dispatch/build_thumb_direct_tails.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
THUMB_CALLBACK_TAIL_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_callback_tail.so
$(THUMB_CALLBACK_TAIL_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_callback_tail.cc tools/arm-dispatch/build_thumb_callback_tail.py
	python3 tools/arm-dispatch/build_thumb_callback_tail.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_mplay_note_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_mplay_note_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_note_invoke.o: C_END_ALIGN := 1
src/m4a_mplay_note_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-trampoline=call_r3 -fplugin-arg-thumb_callback_tail-continuation=MPlayMainTrackWait

src/m4a_mplay_command_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_mplay_command_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_command_invoke.o: C_END_ALIGN := 1
src/m4a_mplay_command_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-trampoline=call_r3 -fplugin-arg-thumb_callback_tail-continuation=MPlayMainCommandStatus -fplugin-arg-thumb_callback_tail-fallthrough

src/m4a_mplay_command_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_mplay_command_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_command_setup.o: C_END_ALIGN := 1
src/m4a_mplay_command_setup.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainCommandInvoke -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainCommandInvoke -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN) -fplugin-arg-copy_add_zero-preserve-thumb-high-copies

src/m4a_mplay_note_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_mplay_note_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_note_setup.o: C_END_ALIGN := 1
src/m4a_mplay_note_setup.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainNoteInvoke -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainNoteInvoke -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN) -fplugin-arg-copy_add_zero-preserve-thumb-high-copies

src/m4a_mplay_command_read.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_command_read.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_command_read.o: C_END_ALIGN := 1
src/m4a_mplay_command_read.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainCommandDecode -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainCommandDecode -fplugin-arg-tail_transfer-raise-unsigned-bound -fplugin-arg-tail_transfer-raise-unsigned-le-bound

src/m4a_mplay_track_init_guard.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_track_init_guard.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_track_init_guard.o: C_END_ALIGN := 1
src/m4a_mplay_track_init_guard.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainTrackWait -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=MPlayMainTrackClear -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainTrackClear -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainTrackWait -fplugin-arg-thumb_direct_tails-expected-transfers=1

src/m4a_mplay_track_init_defaults.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_track_init_defaults.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_track_init_defaults.o: C_END_ALIGN := 1
src/m4a_mplay_track_init_defaults.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainTrackWait -fplugin-arg-tail_transfer-private-frame64

src/m4a_mplay_channel_next.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_channel_next.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_channel_next.o: C_END_ALIGN := 1
src/m4a_mplay_channel_next.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainChannelGate -fplugin-arg-tail_transfer-destination=MPlayMainTrackInit -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainTrackInit -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainChannelGate -fplugin-arg-thumb_direct_tails-expected-transfers=1

src/m4a_mplay_channel_gate.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_STORE_DECREMENT_ZERO_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_channel_gate.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_channel_gate.o: C_END_ALIGN := 1
src/m4a_mplay_channel_gate.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainChannelClear -fplugin-arg-tail_transfer-destination=MPlayMainChannelNext -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin=$(THUMB_STORE_DECREMENT_ZERO_PLUGIN) -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainChannelClear -fplugin-arg-thumb_direct_tails-destination=MPlayMainChannelNext -fplugin-arg-thumb_direct_tails-expected-transfers=3

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


src/m4a_mplay_command_status.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_command_status.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_command_status.o: C_END_ALIGN := 1
src/m4a_mplay_command_status.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainTrackFinish -fplugin-arg-tail_transfer-destination=MPlayMainTrackWait -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainTrackFinish -fplugin-arg-thumb_direct_tails-expected-transfers=1


src/m4a_mplay_wait_command.o: $(THUMB_SHARED_PLUGIN) $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_wait_command.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_wait_command.o: C_END_ALIGN := 1
src/m4a_mplay_wait_command.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_SHARED_PLUGIN) -fplugin-arg-thumb_shared_literal-symbol-literal=gClockTable,lt_gClockTable -fplugin-arg-thumb_shared_literal-omit-pool-alignment -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-after-shared-literals -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-destination=MPlayMainTrackWait -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainTrackWait


src/m4a_mplay_track_wait.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_track_wait.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_track_wait.o: C_END_ALIGN := 1
src/m4a_mplay_track_wait.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainTrackDispatch -fplugin-arg-tail_transfer-destination=MPlayMainModulationStart -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainTrackDispatch -fplugin-arg-thumb_direct_tails-expected-transfers=1 -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainModulationStart


src/m4a_mplay_modulation_guard.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_modulation_guard.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_modulation_guard.o: C_END_ALIGN := 1
src/m4a_mplay_modulation_guard.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainTrackFinish -fplugin-arg-tail_transfer-destination=MPlayMainModulationUpdate -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainTrackFinish -fplugin-arg-thumb_direct_tails-destination=MPlayMainModulationUpdate -fplugin-arg-thumb_direct_tails-expected-transfers=3


src/m4a_mplay_modulation_update.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_mplay_modulation_update.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_modulation_update.o: C_END_ALIGN := 1
src/m4a_mplay_modulation_update.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -fno-if-conversion -fno-if-conversion2 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainTrackFinish -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainTrackFinish -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN)


src/m4a_mplay_track_finish.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_track_finish.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_track_finish.o: C_END_ALIGN := 1
src/m4a_mplay_track_finish.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=MPlayMainTrackAdvance -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainTrackAdvance

src/m4a_mplay_track_advance.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_FORK_DECREMENT_PLUGIN)
src/m4a_mplay_track_advance.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_track_advance.o: C_END_ALIGN := 1
src/m4a_mplay_track_advance.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=MPlayMainTrackLoop -fplugin-arg-tail_transfer-destination=MPlayMainClockUpdate -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainClockUpdate -fplugin=$(THUMB_FORK_DECREMENT_PLUGIN)


src/m4a_mplay_clock_update.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_clock_update.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_clock_update.o: C_END_ALIGN := 1
src/m4a_mplay_clock_update.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainExit -fplugin-arg-tail_transfer-destination=MPlayMainTempoFinish -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainTempoFinish


src/m4a_mplay_post_track_guard.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_post_track_guard.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_track_guard.o: C_END_ALIGN := 1
src/m4a_mplay_post_track_guard.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainPostTrackNext -fplugin-arg-tail_transfer-destination=MPlayMainPostTrackSetup -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostTrackSetup -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainPostTrackNext -fplugin-arg-thumb_direct_tails-expected-transfers=2 -fplugin-arg-thumb_direct_tails-descending-mask-operands


src/m4a_mplay_post_entry.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_post_entry.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_entry.o: C_END_ALIGN := 1
src/m4a_mplay_post_entry.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=MPlayMainPostTrackGuard -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainPostTrackGuard


src/m4a_mplay_post_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_mplay_post_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_setup.o: C_END_ALIGN := 1
src/m4a_mplay_post_setup.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=MPlayMainPostTrackInvoke -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainPostTrackInvoke -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN) -fplugin-arg-copy_add_zero-preserve-thumb-high-copies


src/m4a_mplay_post_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_mplay_post_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_invoke.o: C_END_ALIGN := 1
src/m4a_mplay_post_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-direct-callee=TrkVolPitSet -fplugin-arg-thumb_callback_tail-continuation=MPlayMainPostChannelLoad -fplugin-arg-thumb_callback_tail-fallthrough


src/m4a_mplay_post_channel_load.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_post_channel_load.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_channel_load.o: C_END_ALIGN := 1
src/m4a_mplay_post_channel_load.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=MPlayMainPostTrackFinish -fplugin-arg-tail_transfer-destination=MPlayMainPostChannelGate -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostChannelGate -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainPostTrackFinish -fplugin-arg-thumb_direct_tails-expected-transfers=1


src/m4a_mplay_post_channel_next.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_post_channel_next.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_channel_next.o: C_END_ALIGN := 1
src/m4a_mplay_post_channel_next.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=MPlayMainPostTrackFinish -fplugin-arg-tail_transfer-destination=MPlayMainPostChannelGate -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostTrackFinish -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainPostChannelGate -fplugin-arg-thumb_direct_tails-expected-transfers=1


src/m4a_mplay_post_track_finish.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_post_track_finish.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_track_finish.o: C_END_ALIGN := 1
src/m4a_mplay_post_track_finish.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=MPlayMainPostTrackNext -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainPostTrackNext

src/m4a_mplay_post_channel_gate.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_post_channel_gate.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_channel_gate.o: C_END_ALIGN := 1
src/m4a_mplay_post_channel_gate.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fno-reorder-blocks -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainPostChannelBody -fplugin-arg-tail_transfer-destination=MPlayMainPostClearSetup -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostClearSetup -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainPostChannelBody -fplugin-arg-thumb_direct_tails-expected-transfers=1

src/m4a_mplay_post_clear_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_mplay_post_clear_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_clear_setup.o: C_END_ALIGN := 1
src/m4a_mplay_post_clear_setup.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainPostClearInvoke -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainPostClearInvoke -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN)

src/m4a_mplay_post_clear_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_mplay_post_clear_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_clear_invoke.o: C_END_ALIGN := 1
src/m4a_mplay_post_clear_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-direct-callee=ClearChain -fplugin-arg-thumb_callback_tail-continuation=MPlayMainPostChannelNext

src/m4a_mplay_post_volume_guard.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_post_volume_guard.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_volume_guard.o: C_END_ALIGN := 1
src/m4a_mplay_post_volume_guard.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fno-reorder-blocks -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainPostPitchGuard -fplugin-arg-tail_transfer-destination=MPlayMainPostVolumeInvoke -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostVolumeInvoke -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainPostPitchGuard -fplugin-arg-thumb_direct_tails-expected-transfers=1

src/m4a_mplay_post_volume_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_mplay_post_volume_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_volume_invoke.o: C_END_ALIGN := 1
src/m4a_mplay_post_volume_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-direct-callee=ChnVolSetAsm -fplugin-arg-thumb_callback_tail-continuation=MPlayMainPostVolumeFinish -fplugin-arg-thumb_callback_tail-fallthrough

src/m4a_mplay_post_volume_finish.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_post_volume_finish.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_volume_finish.o: C_END_ALIGN := 1
src/m4a_mplay_post_volume_finish.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fno-reorder-blocks -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainPostPitchGuard -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostPitchGuard

THUMB_ADD_SIGN_BRANCH_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_add_sign_branch.so
$(THUMB_ADD_SIGN_BRANCH_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_add_sign_branch.cc tools/arm-dispatch/build_thumb_add_sign_branch.py
	python3 tools/arm-dispatch/build_thumb_add_sign_branch.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)

src/m4a_mplay_post_pitch_guard.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_post_pitch_guard.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_pitch_guard.o: C_END_ALIGN := 1
src/m4a_mplay_post_pitch_guard.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainPostChannelNext -fplugin-arg-tail_transfer-destination=MPlayMainPostKeyAdjust -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostKeyAdjust -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainPostChannelNext -fplugin-arg-thumb_direct_tails-expected-transfers=1

src/m4a_mplay_post_key_adjust.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_ADD_SIGN_BRANCH_PLUGIN)
src/m4a_mplay_post_key_adjust.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_key_adjust.o: C_END_ALIGN := 1
src/m4a_mplay_post_key_adjust.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fno-if-conversion -fno-if-conversion2 -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainPostFrequencySelect -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostFrequencySelect -fplugin=$(THUMB_ADD_SIGN_BRANCH_PLUGIN)

src/m4a_mplay_post_frequency_select.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_post_frequency_select.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_frequency_select.o: C_END_ALIGN := 1
src/m4a_mplay_post_frequency_select.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainPostCgbSetup -fplugin-arg-tail_transfer-destination=MPlayMainPostPcmSetup -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostCgbSetup -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainPostPcmSetup -fplugin-arg-thumb_direct_tails-expected-transfers=1

src/m4a_mplay_post_cgb_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_mplay_post_cgb_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_cgb_setup.o: C_END_ALIGN := 1
src/m4a_mplay_post_cgb_setup.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainPostCgbInvoke -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainPostCgbInvoke -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN) -fplugin-arg-copy_add_zero-preserve-thumb-high-copies

src/m4a_mplay_post_pcm_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_mplay_post_pcm_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_pcm_setup.o: C_END_ALIGN := 1
src/m4a_mplay_post_pcm_setup.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainPostPcmInvoke -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainPostPcmInvoke -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN)

src/m4a_mplay_post_cgb_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_mplay_post_cgb_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_cgb_invoke.o: C_END_ALIGN := 1
src/m4a_mplay_post_cgb_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-trampoline=call_r3 -fplugin-arg-thumb_callback_tail-continuation=MPlayMainPostCgbStore -fplugin-arg-thumb_callback_tail-fallthrough

src/m4a_mplay_post_cgb_store.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_post_cgb_store.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_cgb_store.o: C_END_ALIGN := 1
src/m4a_mplay_post_cgb_store.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainPostChannelNext -fplugin-arg-tail_transfer-private-frame64

src/m4a_mplay_post_pcm_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_mplay_post_pcm_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_pcm_invoke.o: C_END_ALIGN := 1
src/m4a_mplay_post_pcm_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-direct-callee=MidiKeyToFreq -fplugin-arg-thumb_callback_tail-continuation=MPlayMainPostPcmStore -fplugin-arg-thumb_callback_tail-fallthrough

src/m4a_mplay_post_pcm_store.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_post_pcm_store.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_pcm_store.o: C_END_ALIGN := 1
src/m4a_mplay_post_pcm_store.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainPostChannelNext -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainPostChannelNext

src/m4a_mplay_exit_unlock.o: $(THUMB_SHARED_PLUGIN) $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_exit_unlock.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_exit_unlock.o: C_END_ALIGN := 1
src/m4a_mplay_exit_unlock.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_SHARED_PLUGIN) -fplugin-arg-thumb_shared_literal-literal=0x68736d53,lt2_ID_NUMBER -fplugin-arg-thumb_shared_literal-omit-pool-alignment -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-after-shared-literals -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-destination=MPlayMainExitRestore -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainExitRestore
src/m4a_mplay_exit_restore.o: $(THUMB_FRAME_RETURN_PLUGIN)
src/m4a_mplay_exit_restore.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_exit_restore.o: C_END_ALIGN := 1
src/m4a_mplay_exit_restore.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_FRAME_RETURN_PLUGIN) -fplugin-arg-thumb_frame_return-grouped -fplugin-arg-thumb_frame_return-frame36 -fplugin-arg-thumb_frame_return-return-entry=call_r3

THUMB_POSITIVE_ADVANCE_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_positive_advance.so
$(THUMB_POSITIVE_ADVANCE_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_positive_advance.cc tools/arm-dispatch/build_thumb_positive_advance.py
	python3 tools/arm-dispatch/build_thumb_positive_advance.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_mplay_post_track_next.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_FORK_DECREMENT_PLUGIN) $(THUMB_POSITIVE_ADVANCE_PLUGIN)
src/m4a_mplay_post_track_next.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_post_track_next.o: C_END_ALIGN := 1
src/m4a_mplay_post_track_next.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainExit -fplugin-arg-tail_transfer-destination=MPlayMainPostTrackGuard -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainExit -fplugin=$(THUMB_FORK_DECREMENT_PLUGIN) -fplugin=$(THUMB_POSITIVE_ADVANCE_PLUGIN) -fplugin-arg-thumb_positive_advance-destination=MPlayMainPostTrackGuard

src/m4a_mplay_channel_clear_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_mplay_channel_clear_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_channel_clear_setup.o: C_END_ALIGN := 1
src/m4a_mplay_channel_clear_setup.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainChannelClearInvoke -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainChannelClearInvoke -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN)

src/m4a_mplay_channel_clear_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_mplay_channel_clear_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_channel_clear_invoke.o: C_END_ALIGN := 1
src/m4a_mplay_channel_clear_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-direct-callee=ClearChain -fplugin-arg-thumb_callback_tail-continuation=MPlayMainChannelNext -fplugin-arg-thumb_callback_tail-fallthrough

src/m4a_mplay_track_clear_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_mplay_track_clear_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_track_clear_setup.o: C_END_ALIGN := 1
src/m4a_mplay_track_clear_setup.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainTrackClearInvoke -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainTrackClearInvoke -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN)

src/m4a_mplay_track_clear_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_mplay_track_clear_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_track_clear_invoke.o: C_END_ALIGN := 1
src/m4a_mplay_track_clear_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-direct-callee=Clear64byte -fplugin-arg-thumb_callback_tail-continuation=MPlayMainTrackDefaults -fplugin-arg-thumb_callback_tail-fallthrough

src/m4a_mplay_note_guard.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_note_guard.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_note_guard.o: C_END_ALIGN := 1
src/m4a_mplay_note_guard.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainNonNoteCommand -fplugin-arg-tail_transfer-destination=MPlayMainNoteSetup -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainNoteSetup -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainNonNoteCommand -fplugin-arg-thumb_direct_tails-expected-transfers=1 -fplugin-arg-thumb_direct_tails-unsigned-immediate=lt

src/m4a_mplay_wait_guard.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_wait_guard.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_wait_guard.o: C_END_ALIGN := 1
src/m4a_mplay_wait_guard.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainWaitCommand -fplugin-arg-tail_transfer-destination=MPlayMainCommandSetup -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainCommandSetup -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainWaitCommand -fplugin-arg-thumb_direct_tails-expected-transfers=1 -fplugin-arg-thumb_direct_tails-unsigned-immediate=le

src/m4a_mplay_tick_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_tick_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_tick_setup.o: C_END_ALIGN := 1
src/m4a_mplay_tick_setup.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainTrackLoop -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-adjacent-destination=MPlayMainTrackLoop

src/m4a_mplay_track_dispatch.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_track_dispatch.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_track_dispatch.o: C_END_ALIGN := 1
src/m4a_mplay_track_dispatch.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainChannelGate -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainChannelGate -fplugin-arg-tail_transfer-destination=MPlayMainTrackAdvance -fplugin-arg-tail_transfer-destination=MPlayMainTrackInit -fplugin-arg-tail_transfer-acyclic-branches -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainTrackInit -fplugin-arg-thumb_direct_tails-expected-transfers=1 -fplugin-arg-thumb_direct_tails-descending-local-mask-operands

src/m4a_mplay_entry_status.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_mplay_entry_status.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_entry_status.o: C_END_ALIGN := 1
src/m4a_mplay_entry_status.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-destination=MPlayMainSoundInfoSetup -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainSoundInfoSetup -fplugin-arg-tail_transfer-destination=MPlayMainExit -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN)

src/m4a_mplay_sound_info_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN) $(THUMB_SHARED_PLUGIN)
src/m4a_mplay_sound_info_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_sound_info_setup.o: C_END_ALIGN := 1
src/m4a_mplay_sound_info_setup.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_SHARED_PLUGIN) -fplugin-arg-thumb_shared_literal-literal=0x03007ff0,lt2_SOUND_INFO_PTR -fplugin-arg-thumb_shared_literal-omit-pool-alignment -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-destination=MPlayMainFadeInvoke -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainFadeInvoke -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN) -fplugin-arg-tail_transfer-after-shared-literals -fplugin-arg-copy_add_zero-preserve-thumb-high-copies

src/m4a_mplay_fade_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_mplay_fade_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_fade_invoke.o: C_END_ALIGN := 1
src/m4a_mplay_fade_invoke.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-direct-callee=FadeOutBody -fplugin-arg-thumb_callback_tail-continuation=MPlayMainFadeStatus -fplugin-arg-thumb_callback_tail-fallthrough

src/m4a_mplay_fade_status.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_mplay_fade_status.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_fade_status.o: C_END_ALIGN := 1
src/m4a_mplay_fade_status.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-destination=MPlayMainTempoAccumulate -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainTempoAccumulate -fplugin-arg-tail_transfer-destination=MPlayMainExit

src/m4a_mplay_entry_callback_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_mplay_entry_callback_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_entry_callback_setup.o: C_END_ALIGN := 1
src/m4a_mplay_entry_callback_setup.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=MPlayMainEntryFrame -fplugin-arg-tail_transfer-destination=MPlayMainEntryCallbackInvoke -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainEntryCallbackInvoke -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=MPlayMainEntryFrame -fplugin-arg-thumb_direct_tails-expected-transfers=1

src/m4a_mplay_entry_callback_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_mplay_entry_callback_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_entry_callback_invoke.o: C_END_ALIGN := 1
src/m4a_mplay_entry_callback_invoke.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-trampoline=call_r3 -fplugin-arg-thumb_callback_tail-continuation=MPlayMainEntryFrame -fplugin-arg-thumb_callback_tail-fallthrough

THUMB_SAVED_ENTRY_FRAME_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_saved_entry_frame.so
$(THUMB_SAVED_ENTRY_FRAME_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_saved_entry_frame.cc tools/arm-dispatch/build_thumb_saved_entry_frame.py
	python3 tools/arm-dispatch/build_thumb_saved_entry_frame.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_mplay_entry_frame.o: $(THUMB_SAVED_ENTRY_FRAME_PLUGIN)
src/m4a_mplay_entry_frame.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_entry_frame.o: C_END_ALIGN := 1
src/m4a_mplay_entry_frame.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_SAVED_ENTRY_FRAME_PLUGIN) -fplugin-arg-thumb_saved_entry_frame-continuation=MPlayMainEntryStatus

THUMB_LOCK_FRAME_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_lock_frame.so
$(THUMB_LOCK_FRAME_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_lock_frame.cc tools/arm-dispatch/build_thumb_lock_frame.py
	python3 tools/arm-dispatch/build_thumb_lock_frame.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_mplay_lock.o: $(THUMB_LOCK_FRAME_PLUGIN)
src/m4a_mplay_lock.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_mplay_lock.o: C_END_ALIGN := 1
src/m4a_mplay_lock.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_LOCK_FRAME_PLUGIN) -fplugin-arg-thumb_lock_frame-id=0x68736d53,lt2_ID_NUMBER -fplugin-arg-thumb_lock_frame-continuation=MPlayMainEntryCallbackSetup

THUMB_UNSIGNED_BOUNDS_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_unsigned_bounds.so
$(THUMB_UNSIGNED_BOUNDS_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_unsigned_bounds.cc tools/arm-dispatch/build_thumb_unsigned_bounds.py
	python3 tools/arm-dispatch/build_thumb_unsigned_bounds.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_ply_note_command.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_UNSIGNED_BOUNDS_PLUGIN)
src/m4a_ply_note_command.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_command.o: C_END_ALIGN := 1
src/m4a_ply_note_command.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=PlyNoteToneSetup -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNoteToneSetup -fplugin=$(THUMB_UNSIGNED_BOUNDS_PLUGIN) -fplugin-arg-thumb_unsigned_bounds-bound=128 -fplugin-arg-thumb_unsigned_bounds-expected=3

src/m4a_ply_note_tone.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_BLOCK_LAYOUT_PLUGIN)
src/m4a_ply_note_tone.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_tone.o: C_END_ALIGN := 1
src/m4a_ply_note_tone.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=PlyNotePriority -fplugin-arg-tail_transfer-destination=PlyNoteExit -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNotePriority -fplugin=$(THUMB_BLOCK_LAYOUT_PLUGIN) -fplugin-arg-thumb_block_layout-tone-selection

THUMB_SHARED_TAILS_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_shared_tails.so
$(THUMB_SHARED_TAILS_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_shared_tails.cc tools/arm-dispatch/build_thumb_shared_tails.py
	python3 tools/arm-dispatch/build_thumb_shared_tails.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_ply_note_finish.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_ply_note_finish.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_finish.o: C_END_ALIGN := 1
src/m4a_ply_note_finish.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=PlyNoteExit -fplugin-arg-tail_transfer-adjacent-destination=PlyNoteExit

src/m4a_ply_note_frequency_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_ADD_SIGN_BRANCH_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_ply_note_frequency_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_frequency_setup.o: C_END_ALIGN := 1
src/m4a_ply_note_frequency_setup.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -fno-if-conversion -fno-if-conversion2 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-destination=PlyNotePcmFrequencySetup -fplugin-arg-tail_transfer-destination=PlyNoteCgbFrequencyInvoke -fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNoteCgbFrequencyInvoke -fplugin=$(THUMB_ADD_SIGN_BRANCH_PLUGIN) -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN) -fplugin-arg-copy_add_zero-preserve-thumb-high-copies -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=PlyNotePcmFrequencySetup -fplugin-arg-thumb_direct_tails-expected-transfers=1

src/m4a_ply_note_channel_init.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_ply_note_channel_init.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_channel_init.o: C_END_ALIGN := 1
src/m4a_ply_note_channel_init.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=PlyNoteVolumeInvoke -fplugin-arg-tail_transfer-adjacent-destination=PlyNoteVolumeInvoke

src/m4a_ply_note_channel_link.o: $(THUMB_TAIL_TRANSFER_PLUGIN)
src/m4a_ply_note_channel_link.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_channel_link.o: C_END_ALIGN := 1
src/m4a_ply_note_channel_link.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-destination=PlyNoteLfoDelay -fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNoteLfoDelay

src/m4a_ply_note_pcm_advance.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_FORK_DECREMENT_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_ply_note_pcm_advance.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_pcm_advance.o: C_END_ALIGN := 1
src/m4a_ply_note_pcm_advance.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-destination=PlyNotePcmLoop -fplugin-arg-tail_transfer-destination=PlyNoteExit -fplugin-arg-tail_transfer-destination=PlyNoteChannelAttach -fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNoteChannelAttach -fplugin=$(THUMB_FORK_DECREMENT_PLUGIN) -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=PlyNotePcmLoop -fplugin-arg-thumb_direct_tails-destination=PlyNoteExit -fplugin-arg-thumb_direct_tails-expected-transfers=2 -fplugin-arg-thumb_direct_tails-fork-decrement

src/m4a_ply_note_pcm_choose.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN) $(THUMB_BLOCK_LAYOUT_PLUGIN)
src/m4a_ply_note_pcm_choose.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_pcm_choose.o: C_END_ALIGN := 1
src/m4a_ply_note_pcm_choose.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -fno-crossjumping -fno-guess-branch-probability -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-destination=PlyNoteChannelAttach -fplugin-arg-tail_transfer-destination=PlyNotePcmAdvance -fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNotePcmAdvance -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=PlyNoteChannelAttach -fplugin-arg-thumb_direct_tails-expected-transfers=1 -fplugin=$(THUMB_BLOCK_LAYOUT_PLUGIN) -fplugin-arg-thumb_block_layout-pcm-selection

src/m4a_ply_note_pcm_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_ply_note_pcm_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_pcm_setup.o: C_END_ALIGN := 1
src/m4a_ply_note_pcm_setup.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=PlyNotePcmLoop -fplugin-arg-tail_transfer-adjacent-destination=PlyNotePcmLoop -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN) -fplugin-arg-copy_add_zero-preserve-thumb-high-copies

src/m4a_ply_note_cgb_select.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_SHARED_TAILS_PLUGIN)
src/m4a_ply_note_cgb_select.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_cgb_select.o: C_END_ALIGN := 1
src/m4a_ply_note_cgb_select.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -fno-crossjumping -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=PlyNoteChannelAttach -fplugin-arg-tail_transfer-destination=PlyNoteExit -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin=$(THUMB_SHARED_TAILS_PLUGIN) -fplugin-arg-thumb_shared_tails-destination=PlyNoteChannelAttach -fplugin-arg-thumb_shared_tails-expected-transfers=4

THUMB_AND_STORE_TAIL_PLUGIN := $(ARM_DISPATCH_DIR)/thumb_and_store_tail.so
$(THUMB_AND_STORE_TAIL_PLUGIN): $(ARM_DISPATCH_CC) tools/arm-dispatch/thumb_and_store_tail.cc tools/arm-dispatch/build_thumb_and_store_tail.py
	python3 tools/arm-dispatch/build_thumb_and_store_tail.py --compiler $(ARM_DISPATCH_CC) --output-dir $(ARM_DISPATCH_DIR)
src/m4a_ply_note_priority.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(THUMB_AND_STORE_TAIL_PLUGIN)
src/m4a_ply_note_priority.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_priority.o: C_END_ALIGN := 1
src/m4a_ply_note_priority.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-destination=PlyNoteCgbSelect -fplugin-arg-tail_transfer-destination=PlyNotePcmSelect -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNoteCgbSelect -fplugin=$(THUMB_AND_STORE_TAIL_PLUGIN) -fplugin-arg-thumb_and_store_tail-destination=PlyNotePcmSelect

src/m4a_ply_note_clear_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_ply_note_clear_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_clear_invoke.o: C_END_ALIGN := 1
src/m4a_ply_note_clear_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-direct-callee=ClearChain -fplugin-arg-thumb_callback_tail-continuation=PlyNoteChannelLink -fplugin-arg-thumb_callback_tail-fallthrough

src/m4a_ply_note_mod_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_ply_note_mod_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_mod_invoke.o: C_END_ALIGN := 1
src/m4a_ply_note_mod_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-direct-callee=clear_modM -fplugin-arg-thumb_callback_tail-continuation=PlyNoteTrackVolumeSetup -fplugin-arg-thumb_callback_tail-fallthrough

src/m4a_ply_note_track_volume_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_ply_note_track_volume_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_track_volume_invoke.o: C_END_ALIGN := 1
src/m4a_ply_note_track_volume_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-direct-callee=TrkVolPitSet -fplugin-arg-thumb_callback_tail-continuation=PlyNoteChannelInit -fplugin-arg-thumb_callback_tail-fallthrough

src/m4a_ply_note_volume_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_ply_note_volume_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_volume_invoke.o: C_END_ALIGN := 1
src/m4a_ply_note_volume_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-direct-callee=ChnVolSetAsm -fplugin-arg-thumb_callback_tail-continuation=PlyNoteFrequencySetup -fplugin-arg-thumb_callback_tail-fallthrough

src/m4a_ply_note_cgb_frequency_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_ply_note_cgb_frequency_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_cgb_frequency_invoke.o: C_END_ALIGN := 1
src/m4a_ply_note_cgb_frequency_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-trampoline=call_r3 -fplugin-arg-thumb_callback_tail-continuation=PlyNoteFinish

src/m4a_ply_note_pcm_frequency_invoke.o: $(THUMB_CALLBACK_TAIL_PLUGIN)
src/m4a_ply_note_pcm_frequency_invoke.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_pcm_frequency_invoke.o: C_END_ALIGN := 1
src/m4a_ply_note_pcm_frequency_invoke.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_CALLBACK_TAIL_PLUGIN) -fplugin-arg-thumb_callback_tail-direct-callee=MidiKeyToFreq -fplugin-arg-thumb_callback_tail-continuation=PlyNoteFinish -fplugin-arg-thumb_callback_tail-fallthrough

src/m4a_ply_note_clear_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_ply_note_clear_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_clear_setup.o: C_END_ALIGN := 1
src/m4a_ply_note_clear_setup.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=PlyNoteClearInvoke -fplugin-arg-tail_transfer-adjacent-destination=PlyNoteClearInvoke -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN)

src/m4a_ply_note_track_volume_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_ply_note_track_volume_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_track_volume_setup.o: C_END_ALIGN := 1
src/m4a_ply_note_track_volume_setup.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=PlyNoteTrackVolumeInvoke -fplugin-arg-tail_transfer-adjacent-destination=PlyNoteTrackVolumeInvoke -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN)

src/m4a_ply_note_pcm_frequency_setup.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_ply_note_pcm_frequency_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_pcm_frequency_setup.o: C_END_ALIGN := 1
src/m4a_ply_note_pcm_frequency_setup.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=PlyNotePcmFrequencyInvoke -fplugin-arg-tail_transfer-adjacent-destination=PlyNotePcmFrequencyInvoke -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN)

src/m4a_ply_note_exit_restore.o: $(THUMB_FRAME_RETURN_PLUGIN)
src/m4a_ply_note_exit_restore.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_exit_restore.o: C_END_ALIGN := 1
src/m4a_ply_note_exit_restore.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_FRAME_RETURN_PLUGIN) -fplugin-arg-thumb_frame_return-grouped -fplugin-arg-thumb_frame_return-frame60-r0

src/m4a_ply_note_lfo_delay.o: $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN) $(THUMB_DIRECT_TAILS_PLUGIN)
src/m4a_ply_note_lfo_delay.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_lfo_delay.o: C_END_ALIGN := 1
src/m4a_ply_note_lfo_delay.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=PlyNoteModInvoke -fplugin-arg-tail_transfer-destination=PlyNoteTrackVolumeSetup -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNoteModInvoke -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN) -fplugin=$(THUMB_DIRECT_TAILS_PLUGIN) -fplugin-arg-thumb_direct_tails-destination=PlyNoteTrackVolumeSetup -fplugin-arg-thumb_direct_tails-expected-transfers=1 -fplugin-arg-thumb_direct_tails-register-equality

src/m4a_ply_note_entry_frame.o: $(THUMB_SAVED_ENTRY_FRAME_PLUGIN)
src/m4a_ply_note_entry_frame.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_entry_frame.o: C_END_ALIGN := 1
src/m4a_ply_note_entry_frame.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_SAVED_ENTRY_FRAME_PLUGIN) -fplugin-arg-thumb_saved_entry_frame-continuation=PlyNoteEntrySetup -fplugin-arg-thumb_saved_entry_frame-saved-lr-frame60
src/m4a_ply_note_entry_setup.o: $(THUMB_SHARED_PLUGIN) $(THUMB_TAIL_TRANSFER_PLUGIN) $(ARM_COPY_ADD_ZERO_PLUGIN)
src/m4a_ply_note_entry_setup.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_ply_note_entry_setup.o: C_END_ALIGN := 1
src/m4a_ply_note_entry_setup.o: CC1FLAGS := -std=gnu89 -O1 -fno-reorder-blocks -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_SHARED_PLUGIN) -fplugin-arg-thumb_shared_literal-literal=0x03007ff0,lt_PlyNoteSoundInfo -fplugin-arg-thumb_shared_literal-symbol-literal=gClockTable,lt_PlyNoteClockTable -fplugin-arg-thumb_shared_literal-omit-pool-alignment -fplugin=$(THUMB_TAIL_TRANSFER_PLUGIN) -fplugin-arg-tail_transfer-after-shared-literals -fplugin-arg-tail_transfer-private-frame64 -fplugin-arg-tail_transfer-destination=PlyNoteCommandBoundary -fplugin-arg-tail_transfer-acyclic-branches -fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNoteCommandBoundary -fplugin=$(ARM_COPY_ADD_ZERO_PLUGIN)

src/m4a_multiply_entry.o: $(THUMB_PC_HANDOFF_PLUGIN)
src/m4a_multiply_entry.o: CC1 := $(ARM_DISPATCH_CC) -S -x cpp-output -
src/m4a_multiply_entry.o: C_END_ALIGN := 1
src/m4a_multiply_entry.o: CC1FLAGS := -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -Werror=attributes -fplugin=$(THUMB_PC_HANDOFF_PLUGIN) -fplugin-arg-thumb_pc_handoff-symbol=multiply_high_arm -fplugin-arg-thumb_pc_handoff-site=0 -fplugin-arg-thumb_pc_handoff-offset=0 -fplugin-arg-thumb_pc_handoff-r2-entry
