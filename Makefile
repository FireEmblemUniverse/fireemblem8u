#### Tools ####

CC1      := tools/agbcc/bin/agbcc
CC1_OLD  := tools/agbcc/bin/old_agbcc
CPP      := $(DEVKITARM)/bin/arm-none-eabi-cpp
AS       := $(DEVKITARM)/bin/arm-none-eabi-as
LD       := $(DEVKITARM)/bin/arm-none-eabi-ld
OBJCOPY  := $(DEVKITARM)/bin/arm-none-eabi-objcopy

CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -O2 -fhex-asm
CPPFLAGS := -I tools/agbcc/include -iquote include -nostdinc -undef
ASFLAGS  := -mcpu=arm7tdmi -mthumb-interwork -I include


#### Files ####

ROM      := fireemblem8.gba
ELF      := $(ROM:.gba=.elf)
MAP      := $(ROM:.gba=.map)
LDSCRIPT := ldscript.txt
CFILES   := $(wildcard src/*.c)
SFILES   := $(wildcard asm/*.s) $(wildcard asm/libc/*.s) $(wildcard data/*.s)
OFILES   := $(SFILES:.s=.o) $(CFILES:.c=.o)

src/agb_flash.o: CC1FLAGS := -O1 -mthumb-interwork
src/agb_flash_1m.o: CC1FLAGS := -O1 -mthumb-interwork
src/agb_flash_mx.o: CC1FLAGS := -O1 -mthumb-interwork

src/libc.o: CC1 := $(CC1_OLD)
src/libc.o: CC1FLAGS := -O2


#### Main Targets ####

compare: $(ROM)
	sha1sum -c checksum.sha1

clean:
	$(RM) $(ROM) $(ELF) $(MAP) $(OFILES) src/*.s


#### Recipes ####

$(ELF): $(OFILES) $(LDSCRIPT)
	$(LD) -T $(LDSCRIPT) -Map $(MAP) $(OFILES) tools/agbcc/lib/libgcc.a tools/agbcc/lib/libc.a -o $@

%.gba: %.elf
	$(OBJCOPY) -O binary --pad-to 0x9000000 $< $@

%.o: %.c
	$(CPP) $(CPPFLAGS) $< | $(CC1) $(CC1FLAGS) -o $*.s
	$(AS) $(ASFLAGS) $*.s -o $*.o

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@
