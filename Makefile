#### Tools ####

CC1      := tools/agbcc/bin/agbcc
CC1_OLD  := tools/agbcc/bin/old_agbcc
CPP      := $(DEVKITARM)/bin/arm-none-eabi-cpp
AS       := $(DEVKITARM)/bin/arm-none-eabi-as
LD       := $(DEVKITARM)/bin/arm-none-eabi-ld
OBJCOPY  := $(DEVKITARM)/bin/arm-none-eabi-objcopy
BIN2C    := tools/bin2c/bin2c
GBAGFX   := tools/gbagfx/gbagfx

CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm
CPPFLAGS := -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef
ASFLAGS  := -mcpu=arm7tdmi -mthumb-interwork -I include


#### Files ####

ROM          := fireemblem8.gba
ELF          := $(ROM:.gba=.elf)
MAP          := $(ROM:.gba=.map)
LDSCRIPT     := ldscript.txt
SYM_FILES    := sym_iwram.txt sym_ewram.txt
CFILES       := $(wildcard src/*.c)
SFILES       := $(wildcard asm/*.s) $(wildcard asm/libc/*.s) $(wildcard data/*.s)
C_OBJECTS    := $(CFILES:.c=.o)
ASM_OBJECTS  := $(SFILES:.s=.o)
ALL_OBJECTS  := $(C_OBJECTS) $(ASM_OBJECTS)
DEPS_DIR     := .dep

# Use the older compiler to build library code
src/agb_sram.o: CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O1
src/m4a_2.o: CC1 := tools/agbcc/bin/old_agbcc
src/m4a_4.o: CC1 := tools/agbcc/bin/old_agbcc


#### Main Targets ####

compare: $(ROM)
	sha1sum -c checksum.sha1

clean:
	$(RM) $(ROM) $(ELF) $(MAP) $(ALL_OBJECTS) src/*.s graphics/*.h -r $(DEPS_DIR)


#### Recipes ####

# Automatic dependency generation
# Generate dependency rule for object produced from .c file
MAKEDEP_C = $(CPP) $(CPPFLAGS) $1 -MM -MG -MT ${1:.c=.o}
# Generate dependency rule for object produced from .s file (only scans incbins)
MAKEDEP_ASM = { echo "$(1:.s=.o):" & grep -F '.incbin' "$1" | cut -d \" -f2 | sort -u; } | tr '\n' ' '

-include $(addprefix $(DEPS_DIR)/,$(CFILES:.c=.d))
-include $(addprefix $(DEPS_DIR)/,$(SFILES:.s=.d))

$(DEPS_DIR)/%.d: %.c
	@mkdir -p $(dir $@) && $(call MAKEDEP_C,$<) > $@

$(DEPS_DIR)/data/%.d: data/%.s
	@mkdir -p $(dir $@) && $(call MAKEDEP_ASM,$<) > $@

$(ELF): $(ALL_OBJECTS) $(LDSCRIPT) $(SYM_FILES)
	$(LD) -T $(LDSCRIPT) -Map $(MAP) $(ALL_OBJECTS) tools/agbcc/lib/libgcc.a tools/agbcc/lib/libc.a -o $@

%.gba: %.elf
	$(OBJCOPY) -O binary --pad-to 0x9000000 $< $@

$(C_OBJECTS): %.o: %.c $(DEPS_DIR)/%.d
	$(CPP) $(CPPFLAGS) $< | $(CC1) $(CC1FLAGS) -o $*.s
	echo '.ALIGN 2, 0' >> $*.s
	$(AS) $(ASFLAGS) $*.s -o $@

$(ASM_OBJECTS): %.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

# Graphics Recipes

%.4bpp:   %.png; $(GBAGFX) $< $@
%.8bpp:   %.png; $(GBAGFX) $< $@
#%.gbapal: %.pal; $(GBAGFX) $< $@
#%.gbapal: %.png; $(GBAGFX) $< $@
%.lz:     %;     $(GBAGFX) $< $@

%.4bpp.h: %.4bpp
	$(BIN2C) $< $(subst .,_,$(notdir $<)) | sed 's/^const //' > $@
