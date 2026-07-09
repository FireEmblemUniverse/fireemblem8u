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
	SHELL := env PATH=$(PATH) /bin/bash
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
# FE6 SIO multiboot image, built from source via the mgfembp submodule
# (StanHash/mgfembp) instead of a committed blob, then LZ-compressed (the original
# ROM used minimum match distance 1) for the incbin in asm/fe6sio.s. mgfembp
# needs its own agbcc variant (010110-ThumbPatch, fetched by its installer) and
# CPP=cpp because arm-none-eabi-cpp may be absent.
mgfembp/tools/agbcc/bin/agbcc:
	cd mgfembp && bash tools/install_agbcc.sh

mgfembp/mgfembp.bin: mgfembp/tools/agbcc/bin/agbcc FORCE
	$(MAKE) -C mgfembp CPP=cpp PREFIX="$(PREFIX)" tools
	$(MAKE) -C mgfembp CPP=cpp PREFIX="$(PREFIX)" mgfembp.bin

fe6sio_payload.bin.lz: mgfembp/mgfembp.bin
	$(GBAGFX) $< $@ -mindist 1

FORCE:
.PHONY: FORCE
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

$(C_OBJECTS): %.o: %.c $(DEPS_DIR)/%.d
	@$(MAKEDEP)
	$(CPP) $(CPPFLAGS) $< | iconv -f UTF-8 -t CP932 | $(CC1) $(CC1FLAGS) -o $*.s
	echo '.ALIGN 2, 0' >> $*.s
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
	echo '.ALIGN 2, 0' >> $*.s
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