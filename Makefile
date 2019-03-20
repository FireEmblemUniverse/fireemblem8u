#### Tools ####

PREFIX := $(CURDIR)/tools/binutils/bin/arm-none-eabi-

CC1      := tools/agbcc/bin/agbcc
CC1_OLD  := tools/agbcc/bin/old_agbcc
CPP      := cpp
AS       := $(PREFIX)as
LD       := $(PREFIX)ld
OBJCOPY  := $(PREFIX)objcopy
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
src/m4a.o: CC1 := tools/agbcc/bin/old_agbcc

# TODO: find a more elegant solution to the inlining issue
src/bmitem.o: CC1FLAGS += -Wno-error

#### Main Targets ####

compare: $(ROM)
	sha1sum -c checksum.sha1

clean:
	$(RM) $(ROM) $(ELF) $(MAP) $(ALL_OBJECTS) src/*.s graphics/*.h -r $(DEPS_DIR)


#### Recipes ####

# Automatic dependency generation
MAKEDEP = mkdir -p $(DEPS_DIR)/$(dir $*) && $(CPP) $(CPPFLAGS) $< -MM -MG -MT $*.o > $(DEPS_DIR)/$*.d

-include $(addprefix $(DEPS_DIR)/,$(CFILES:.c=.d))

$(DEPS_DIR)/%.d: %.c
	@$(MAKEDEP)

$(ELF): $(ALL_OBJECTS) $(LDSCRIPT) $(SYM_FILES)
	$(LD) -T $(LDSCRIPT) -Map $(MAP) $(ALL_OBJECTS) tools/agbcc/lib/libgcc.a tools/agbcc/lib/libc.a -o $@

%.gba: %.elf
	$(OBJCOPY) -O binary --pad-to 0x9000000 $< $@

$(C_OBJECTS): %.o: %.c $(DEPS_DIR)/%.d
	@$(MAKEDEP)
	$(CPP) $(CPPFLAGS) $< | $(CC1) $(CC1FLAGS) -o $*.s
	echo '.ALIGN 2, 0' >> $*.s
	$(AS) $(ASFLAGS) $*.s -o $@

$(ASM_OBJECTS): %.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

# Graphics Recipes

%.4bpp: %.png; $(GBAGFX) $< $@
%.8bpp: %.png; $(GBAGFX) $< $@

%.4bpp.h: %.4bpp
	$(BIN2C) $< $(subst .,_,$(notdir $<)) | sed 's/^const //' > $@
