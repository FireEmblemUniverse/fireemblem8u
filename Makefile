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

CPP := $(PREFIX)cpp$(EXE)
AS := $(PREFIX)as$(EXE)
LD := $(PREFIX)ld$(EXE)
OBJCOPY := $(PREFIX)objcopy$(EXE)

CC1     := tools/agbcc/bin/agbcc$(EXE)
CC1_OLD := tools/agbcc/bin/old_agbcc$(EXE)

BIN2C    := tools/bin2c/bin2c$(EXE)
GBAGFX   := tools/gbagfx/gbagfx$(EXE)
SCANINC  := tools/scaninc/scaninc$(EXE)
PREPROC  := tools/preproc/preproc$(EXE)

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

CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm -g
CPPFLAGS := -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef
ASFLAGS  := -mcpu=arm7tdmi -mthumb-interwork -I include

#### Files ####

C_SUBDIR = src
ASM_SUBDIR = asm
DATA_ASM_SUBDIR = data

ROM          := fireemblem8.gba
ELF          := $(ROM:.gba=.elf)
MAP          := $(ROM:.gba=.map)
LDSCRIPT     := ldscript.txt
SYM_FILES    := sym_iwram.txt sym_ewram.txt
CFILES       := $(wildcard src/*.c)
ASM_S_FILES  := $(wildcard asm/*.s)
DATA_S_FILES := $(wildcard data/*.s) 
SFILES       := $(ASM_S_FILES) $(DATA_S_FILES)
C_OBJECTS    := $(CFILES:.c=.o)
ASM_OBJECTS  := $(SFILES:.s=.o)
ALL_OBJECTS  := $(C_OBJECTS) $(ASM_OBJECTS) data/banim/data_banim.o
DEPS_DIR     := .dep

# Use the older compiler to build library code
src/agb_sram.o: CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O1 -g
src/m4a.o: CC1 := $(CC1_OLD)

# TODO: find a more elegant solution to the inlining issue
src/bmitem.o: CC1FLAGS += -Wno-error

#### Main Targets ####

compare: $(ROM)
	$(SHASUM) -c checksum.sha1

.PHONY: compare

clean:
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.fk' -o -iname '*.latfont' -o -iname '*.hwjpnfont' -o -iname '*.fwjpnfont' \) -exec rm {} +
	$(RM) $(ROM) $(ELF) $(MAP) $(ALL_OBJECTS) src/*.s graphics/*.h
	$(RM) -rf $(DEPS_DIR)
	# Remove battle animation binaries
	$(RM) data/banim/*.bin data/banim/*.o data/banim/*.lz data/banim/*.bak

.PHONY: clean

tag:
	gtags
	ctags -R
	cscope -Rbkq

.PHONY: tag

# Graphics Recipes

include graphics_file_rules.mk

%.s: ;
%.png: ;
%.pal: ;
%.aif: ;

%.1bpp: %.png  ; $(GBAGFX) $< $@
%.4bpp: %.png  ; $(GBAGFX) $< $@
%.8bpp: %.png  ; $(GBAGFX) $< $@
%.gbapal: %.pal
ifneq ($(OS),Windows_NT)
ifeq ($(UNAME),Darwin)
	$(SED) $$'s/\r*$$/\r/' $<
else
	$(SED) -e 's/\r*$$/\r/' $<
endif
endif
	$(GBAGFX) $< $@
%.gbapal: %.png ; $(GBAGFX) $< $@
%.lz: % ; $(GBAGFX) $< $@
%.rl: % ; $(GBAGFX) $< $@
%.fk: % ; ./scripts/compressor.py $< fk

%.4bpp.h: %.4bpp
	$(BIN2C) $< $(subst .,_,$(notdir $<)) | sed 's/^const //' > $@

# Battle Animation Recipes

data/banim/data_banim.o: $(shell ./scripts/arm_compressing_linker.py -t linker_script_banim.txt -m)
	./scripts/arm_compressing_linker.py -o $@ -t linker_script_banim.txt -b 0x8c02000 -l $(LD) --objcopy $(OBJCOPY) -c ./scripts/compressor.py

%_modes.bin: %_motion.o
	$(OBJCOPY) -O binary -j .data.modes $< $@

%_oam_l.bin: %_motion.o
	$(OBJCOPY) -O binary -j .data.oam_l $< $@

%_oam_r.bin: %_motion.o
	$(OBJCOPY) -O binary -j .data.oam_r $< $@

#### Recipes ####

# Automatic dependency generation
MAKEDEP = mkdir -p $(DEPS_DIR)/$(dir $*) && $(CPP) $(CPPFLAGS) $< -MM -MG -MT $*.o > $(DEPS_DIR)/$*.d

-include $(addprefix $(DEPS_DIR)/,$(CFILES:.c=.d))

$(DEPS_DIR)/%.d: %.c
	@$(MAKEDEP)

$(ELF): $(ALL_OBJECTS) $(LDSCRIPT) $(SYM_FILES)
	$(LD) -T $(LDSCRIPT) -Map $(MAP) $(ALL_OBJECTS) -L tools/agbcc/lib -o $@ -lc -lgcc

%.gba: %.elf
	$(OBJCOPY) --strip-debug -O binary --pad-to 0x9000000 --gap-fill=0xff $< $@

$(C_OBJECTS): %.o: %.c $(DEPS_DIR)/%.d
	@$(MAKEDEP)
	$(CPP) $(CPPFLAGS) $< | $(CC1) $(CC1FLAGS) -o $*.s
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
data/%.o:     data_dep :=
else
data/%.o:     data_dep = $(shell $(SCANINC) -I include -I "" $*.s)
endif

ifeq ($(NODEP),1)
banim/%.o:    data_dep :=
else
banim/%.o:    data_dep = $(shell $(SCANINC) -I include -I "" $*.s)
endif

.SECONDEXPANSION:
$(ASM_OBJECTS): %.o: %.s $$(data_dep)
	$(AS) $(ASFLAGS) -g $< -o $@

# Don't delete intermediate files
.SECONDARY:

# debug print, to use, call "make print-(your label here)"
print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
