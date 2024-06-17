#### Tools ####

COMPARE ?= 0
MODERN ?= 0

ifeq (,$(MAKECMDGOALS))
  COMPARE := 1
else ifeq (compare,$(MAKECMDGOALS))
  COMPARE := 1
endif

ifeq (modern,$(MAKECMDGOALS))
  MODERN := 1
endif

ifeq ($(OS),Windows_NT)
  EXE := .exe
else
  EXE :=
endif

UNAME := $(shell uname)

TOOLCHAIN ?= $(DEVKITARM)
PREFIX ?= arm-none-eabi-

ifneq (,$(TOOLCHAIN))
  ifneq (,$(wildcard $(TOOLCHAIN)/bin))
    export PATH := $(TOOLCHAIN)/bin:$(PATH)
  endif
endif

ifeq ($(UNAME),Darwin)
  SHELL := env PATH=$(PATH) /bin/bash
endif

ifeq ($(MODERN),0)
  CPP ?= $(PREFIX)cpp$(EXE)
else
  CPP := $(PREFIX)cpp$(EXE)
endif
AS := $(PREFIX)as$(EXE)
LD := $(PREFIX)ld$(EXE)
OBJCOPY := $(PREFIX)objcopy$(EXE)
STRIP := $(PREFIX)strip$(EXE)

# note: the makefile must be set up so MODERNCC is never called
# if MODERN=0
MODERNCC := $(PREFIX)gcc$(EXE)
PATH_MODERNCC := PATH="$(PATH)" $(MODERNCC)

ifeq ($(MODERN),0)
  CC1 := tools/agbcc/bin/agbcc$(EXE)
  CC1_OLD := tools/agbcc/bin/old_agbcc$(EXE)
else
  CC1 := $(shell $(PATH_MODERNCC) -print-prog-name=cc1) -quiet
endif

BIN2C      := tools/bin2c/bin2c$(EXE)
GBAGFX     := tools/gbagfx/gbagfx$(EXE)
SCANINC    := tools/scaninc/scaninc$(EXE)
AIF2PCM    := tools/aif2pcm/aif2pcm$(EXE)
MID2AGB    := tools/mid2agb/mid2agb$(EXE)
TEXTENCODE := tools/textencode/textencode$(EXE)
JSONPROC   := tools/jsonproc/jsonproc$(EXE)

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

ifeq ($(MODERN),0)
  CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm -ffix-debug-line -g
else
  CC1FLAGS := -mthumb -mthumb-interwork -mabi=apcs-gnu -mtune=arm7tdmi -march=armv4t -fno-toplevel-reorder -Werror -g
endif
CPPFLAGS := -iquote include -iquote . -DMODERN=$(MODERN)
ifeq ($(MODERN),0)
  CPPFLAGS += -I tools/agbcc/include -nostdinc -undef
endif
ASFLAGS := -mcpu=arm7tdmi -mthumb-interwork -I include

#### Files ####

ROM_NAME := fireemblem8.gba
ELF_NAME := $(ROM_NAME:.gba=.elf)
MAP_NAME := $(ROM_NAME:.gba=.map)
BUILD_DIR_NAME := build/fe8u

MODERN_ROM_NAME := fireemblem8_modern.gba
MODERN_ELF_NAME := $(MODERN_ROM_NAME:.gba=.elf)
MODERN_MAP_NAME := $(MODERN_ROM_NAME:.gba=.map)
MODERN_BUILD_DIR_NAME := build/modern

ifeq ($(MODERN),0)
  BUILD_DIR := $(BUILD_DIR_NAME)
else
  BUILD_DIR := $(MODERN_BUILD_DIR_NAME)
endif

C_SUBDIR = src
ASM_SUBDIR = asm
DATA_SUBDIR = data
DATA_SRC_SUBDIR = src/data
SOUND_SUBDIR = sound
SAMPLE_SUBDIR = sound/direct_sound_samples
MID_SUBDIR = sound/songs/midi
BANIM_SUBDIR = data/banim

C_BUILDDIR = $(BUILD_DIR)/$(C_SUBDIR)
ASM_BUILDDIR = $(BUILD_DIR)/$(ASM_SUBDIR)
DATA_BUILDDIR = $(BUILD_DIR)/$(DATA_SUBDIR)
SOUND_BUILDDIR = $(BUILD_DIR)/$(SOUND_SUBDIR)
MID_BUILDDIR = $(BUILD_DIR)/$(MID_SUBDIR)

ifeq ($(MODERN),0)
  ROM := $(ROM_NAME)
else
  ROM := $(MODERN_ROM_NAME)
endif
ELF := $(ROM:.gba=.elf)
MAP := $(ROM:.gba=.map)
ifeq ($(MODERN),0)
  LDSCRIPT := ldscript.txt
  SYM_FILES := sym_iwram.txt
  LDSCRIPT_DEPS := linker_script_sound.txt $(SYM_FILES)
else
  LDSCRIPT := ldscript_modern.txt
  LDSCRIPT_DEPS :=
endif

C_FILES_GENERATED := $(C_SUBDIR)/msg_data.c

LDSCRIPT_BUILD := $(BUILD_DIR)/$(LDSCRIPT)
LDSCRIPT_DEPS_BUILD := $(foreach dep,$(LDSCRIPT_DEPS),$(BUILD_DIR)/$(dep))

BANIM_OBJECT := $(BANIM_SUBDIR)/data_banim.o
BANIM_OBJECT_BUILD := $(BUILD_DIR)/$(BANIM_OBJECT)

OBJECTS_LST := objects.lst
OBJECTS_LST_BUILD := $(BUILD_DIR)/$(OBJECTS_LST)

DEPS_DIR := $(BUILD_DIR)/.dep

# check if we need to scan dependencies based on the rule
ifeq (,$(MAKECMDGOALS))
  SCAN_DEPS ?= 1
else
  # clean, tidy, tidymodern, tidynonmodern don't even build the ROM
  ifeq (,$(filter-out clean tidy tidymodern tidynonmodern,$(MAKECMDGOALS)))
    SCAN_DEPS ?= 0
  else
    SCAN_DEPS ?= 1
  endif
endif

ifneq ($(SCAN_DEPS),0)
  C_FILES := $(wildcard $(C_SUBDIR)/*.c)
  ifeq (,$(findstring $(C_FILES_GENERATED),$(C_FILES)))
    C_FILES += $(C_FILES_GENERATED)
  endif
  C_OBJECTS := $(patsubst $(C_SUBDIR)/%.c,$(C_BUILDDIR)/%.o,$(C_FILES))

  ASM_S_FILES := $(wildcard $(ASM_SUBDIR)/*.s)
  ASM_OBJECTS := $(patsubst $(ASM_SUBDIR)/%.s,$(ASM_BUILDDIR)/%.o,$(ASM_S_FILES))

  DATA_S_FILES := $(wildcard $(DATA_SUBDIR)/*.s $(BANIM_SUBDIR)/*.s)
  DATA_OBJECTS := $(patsubst $(DATA_SUBDIR)/%.s,$(DATA_BUILDDIR)/%.o,$(DATA_S_FILES))

  SOUND_S_FILES := $(wildcard $(SOUND_SUBDIR)/*.s $(SOUND_SUBDIR)/songs/*.s $(SOUND_SUBDIR)/songs/mml/*.s $(SOUND_SUBDIR)/voicegroups/*.s)
  SOUND_OBJECTS := $(patsubst $(SOUND_SUBDIR)/%.s,$(SOUND_BUILDDIR)/%.o,$(SOUND_S_FILES))

  MID_FILES := $(wildcard $(MID_SUBDIR)/*.mid)
  MID_OBJECTS := $(patsubst $(MID_SUBDIR)/%.mid,$(MID_BUILDDIR)/%.o,$(MID_FILES))

  ALL_OBJECTS := $(C_OBJECTS) $(ASM_OBJECTS) $(DATA_OBJECTS) $(BANIM_OBJECT_BUILD) $(SOUND_OBJECTS) $(MID_OBJECTS)
  OBJECTS_RELATIVE := $(patsubst $(BUILD_DIR)/%,%,$(ALL_OBJECTS))

  SUBDIRS := $(sort $(dir $(ALL_OBJECTS)))
  $(shell mkdir -p $(SUBDIRS))

  BANIM_OBJECTS_DIRS := $(addprefix $(BUILD_DIR)/,$(sort $(dir $(shell ./scripts/arm_compressing_linker.py -t linker_script_banim.txt -m))))
  $(shell mkdir -p $(BANIM_OBJECTS_DIRS))
endif

AUTO_GEN_TARGETS :=

ifeq ($(MODERN),0)
# Use the older compiler to build library code
$(C_BUILDDIR)/agb_sram.o: CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O1 -ffix-debug-line -g
$(C_BUILDDIR)/m4a.o: CC1 := $(CC1_OLD)
else
$(C_BUILDDIR)/bmpatharrowdisp.o: CC1FLAGS += -Wno-stringop-overflow
$(C_BUILDDIR)/cursor_hand.o: CC1FLAGS += -Wno-aggressive-loop-optimizations
$(C_BUILDDIR)/m4a.o: CC1FLAGS += -Wno-pointer-to-int-cast
endif

# TODO: find a more elegant solution to the inlining issue
$(C_BUILDDIR)/bmitem.o: CC1FLAGS += -Wno-error

#### Main Targets ####

# Clear the default suffixes
.SUFFIXES:

# Don't delete intermediate files
.SECONDARY:

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

.PHONY: rom compare modern clean tidy tidynonmodern tidymodern tag

rom: $(ROM)
ifneq ($(COMPARE),0)
	$(SHASUM) -c checksum.sha1
endif

compare: rom

modern: rom

clean: tidy
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.fk' -o -iname '*.latfont' -o -iname '*.hwjpnfont' -o -iname '*.fwjpnfont' \) -exec rm {} +
	$(RM) graphics/*.h $(C_FILES_GENERATED)
	# Remove converted sound samples
	$(RM) -f $(SAMPLE_SUBDIR)/*.bin
	# Remove converted songs
	$(RM) -f $(MID_SUBDIR)/*.s
	$(RM) -f $(AUTO_GEN_TARGETS)

tidy: tidynonmodern tidymodern
	$(RM) -rf build

tidynonmodern:
	$(RM) -f $(ROM_NAME) $(ELF_NAME) $(MAP_NAME)
	$(RM) -rf $(BUILD_DIR_NAME)

tidymodern:
	$(RM) -f $(MODERN_ROM_NAME) $(MODERN_ELF_NAME) $(MODERN_MAP_NAME)
	$(RM) -rf $(MODERN_BUILD_DIR_NAME)

tag:
	gtags
	ctags -R
	cscope -Rbkq

# Graphics Recipes

include graphics_file_rules.mk
include songs.mk
include json_data_rules.mk

%.s: ;
%.png: ;
%.pal: ;
%.aif: ;

%.1bpp: %.png  ; $(GBAGFX) $< $@
%.4bpp: %.png  ; $(GBAGFX) $< $@
%.8bpp: %.png  ; $(GBAGFX) $< $@
%.gbapal: %.pal ; $(GBAGFX) $< $@
%.gbapal: %.png ; $(GBAGFX) $< $@
%.lz: % ; $(GBAGFX) $< $@
%.rl: % ; $(GBAGFX) $< $@
%.fk: % ; ./scripts/compressor.py $< fk
sound/%.bin: sound/%.aif ; $(AIF2PCM) $< $@

%.4bpp.h: %.4bpp
	$(BIN2C) $< $(subst .,_,$(notdir $<)) | sed 's/^const //' > $@

# Battle Animation Recipes

$(BANIM_OBJECT_BUILD): $(shell ./scripts/arm_compressing_linker.py -t linker_script_banim.txt -m --build-dir $(BUILD_DIR))
	./scripts/arm_compressing_linker.py -o $@ -t linker_script_banim.txt -b 0x8c02000 -l $(LD) --objcopy $(OBJCOPY) -c ./scripts/compressor.py --build-dir $(BUILD_DIR)

%_modes.bin: %_motion.o
	$(OBJCOPY) -O binary -j .data.modes $< $@

%_oam_l.bin: %_motion.o
	$(OBJCOPY) -O binary -j .data.oam_l $< $@

%_oam_r.bin: %_motion.o
	$(OBJCOPY) -O binary -j .data.oam_r $< $@

#### Recipes ####

$(OBJECTS_LST_BUILD): $(ALL_OBJECTS)
	@echo $(OBJECTS_RELATIVE) > $@

$(LDSCRIPT_BUILD): $(LDSCRIPT) $(LDSCRIPT_DEPS_BUILD)
	@cp -f $< $@

$(LDSCRIPT_DEPS_BUILD): $(BUILD_DIR)/%: %
	@cp -f $< $@

$(ELF): $(ALL_OBJECTS) $(OBJECTS_LST_BUILD) $(LDSCRIPT_BUILD) $(LDSCRIPT_DEPS_BUILD)
	cd $(BUILD_DIR) && $(LD) -T $(LDSCRIPT) -Map ../../$(MAP) @$(OBJECTS_LST) -R $(BANIM_OBJECT).sym.o -L ../../tools/agbcc/lib -o ../../$@ -lc -lgcc
	$(STRIP) -N .gcc2_compiled. $@

$(ROM): $(ELF)
	$(OBJCOPY) --strip-debug -O binary --pad-to 0x9000000 --gap-fill=0xff $< $@

# Generate msg_data.c
$(C_SUBDIR)/msg_data.c: msg_list.txt
	$(TEXTENCODE) $< $@

ifneq ($(SCAN_DEPS),0)

# Automatic dependency generation
MAKE_C_DEP = mkdir -p $(DEPS_DIR)/$(C_SUBDIR)/$(dir $*) && $(CPP) $(CPPFLAGS) $< -MM -MG -MT $(C_BUILDDIR)/$*.o > $(DEPS_DIR)/$(C_SUBDIR)/$*.d
MAKE_ASM_DEP = mkdir -p $(DEPS_DIR)/$(ASM_SUBDIR)/$(dir $*) && echo "$(ASM_BUILDDIR)/$*.o:" > $(DEPS_DIR)/$(ASM_SUBDIR)/$*.d && $(SCANINC) -I include -I "" $< >> $(DEPS_DIR)/$(ASM_SUBDIR)/$*.d && $(SED) ':a;N;$$!ba;s/\n/ /g' $(DEPS_DIR)/$(ASM_SUBDIR)/$*.d
MAKE_DATA_DEP = mkdir -p $(DEPS_DIR)/$(DATA_SUBDIR)/$(dir $*) && echo "$(DATA_BUILDDIR)/$*.o:" > $(DEPS_DIR)/$(DATA_SUBDIR)/$*.d && $(SCANINC) -I include -I "" $< >> $(DEPS_DIR)/$(DATA_SUBDIR)/$*.d && $(SED) ':a;N;$$!ba;s/\n/ /g' $(DEPS_DIR)/$(DATA_SUBDIR)/$*.d
MAKE_SOUND_DEP = mkdir -p $(DEPS_DIR)/$(SOUND_SUBDIR)/$(dir $*) && echo "$(SOUND_BUILDDIR)/$*.o:" > $(DEPS_DIR)/$(SOUND_SUBDIR)/$*.d && $(SCANINC) -I include -I "" $< >> $(DEPS_DIR)/$(SOUND_SUBDIR)/$*.d && $(SED) ':a;N;$$!ba;s/\n/ /g' $(DEPS_DIR)/$(SOUND_SUBDIR)/$*.d

-include $(addprefix $(DEPS_DIR)/,$(C_FILES:.c=.d))
-include $(addprefix $(DEPS_DIR)/,$(ASM_S_FILES:.s=.d))
-include $(addprefix $(DEPS_DIR)/,$(DATA_S_FILES:.s=.d))
-include $(addprefix $(DEPS_DIR)/,$(SOUND_S_FILES:.s=.d))

$(DEPS_DIR)/$(C_SUBDIR)/%.d: $(C_SUBDIR)/%.c
	@$(MAKE_C_DEP)

$(DEPS_DIR)/$(ASM_SUBDIR)/%.d: $(ASM_SUBDIR)/%.s
	@$(MAKE_ASM_DEP)

$(DEPS_DIR)/$(DATA_SUBDIR)/%.d: $(DATA_SUBDIR)/%.s
	@$(MAKE_DATA_DEP)

$(DEPS_DIR)/$(SOUND_SUBDIR)/%.d: $(SOUND_SUBDIR)/%.s
	@$(MAKE_SOUND_DEP)

$(C_BUILDDIR)/%.o: $(C_SUBDIR)/%.c $(DEPS_DIR)/$(C_SUBDIR)/%.d
	@$(MAKE_C_DEP)
	$(CPP) $(CPPFLAGS) $< | iconv -f UTF-8 -t CP932 | $(CC1) $(CC1FLAGS) -o $(C_BUILDDIR)/$*.s
	echo '.ALIGN 2, 0' >> $(C_BUILDDIR)/$*.s
ifeq ($(UNAME),Darwin)
	$(SED) -f scripts/align_2_before_debug_section_for_osx.sed $(C_BUILDDIR)/$*.s
else
	$(SED) '/.section	.debug_line/i\.align 2, 0' $(C_BUILDDIR)/$*.s
endif
	$(AS) $(ASFLAGS) $(C_BUILDDIR)/$*.s -o $@

$(ASM_OBJECTS): $(ASM_BUILDDIR)/%.o: $(ASM_SUBDIR)/%.s $(DEPS_DIR)/$(ASM_SUBDIR)/%.d $$(data_dep)
	@$(MAKE_ASM_DEP)
	$(AS) $(ASFLAGS) -g $< -o $@

$(DATA_OBJECTS): $(DATA_BUILDDIR)/%.o: $(DATA_SUBDIR)/%.s $(DEPS_DIR)/$(DATA_SUBDIR)/%.d $$(data_dep)
	@$(MAKE_DATA_DEP)
	$(AS) $(ASFLAGS) -g $< -o $@

$(SOUND_OBJECTS): $(SOUND_BUILDDIR)/%.o: $(SOUND_SUBDIR)/%.s $(DEPS_DIR)/$(SOUND_SUBDIR)/%.d $$(data_dep)
	@$(MAKE_SOUND_DEP)
	$(AS) $(ASFLAGS) -g $< -o $@

endif # SCAN_DEPS

# debug print, to use, call "make print-(your label here)"
print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
