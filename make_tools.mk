
MAKEFLAGS += --no-print-directory

TOOLDIRS := ./tools

TOOLS :=
TOOLS += $(TOOLDIRS)/aif2pcm
TOOLS += $(TOOLDIRS)/bin2c
TOOLS += $(TOOLDIRS)/textencode
TOOLS += $(TOOLDIRS)/jsonproc
TOOLS += $(TOOLDIRS)/mid2agb
TOOLS += $(TOOLDIRS)/scaninc
TOOLS += $(TOOLDIRS)/gbagfx

.PHONY: all $(TOOLS) clean

all: $(TOOLS)

$(TOOLS):
	@$(MAKE) -C $@

clean:
	@$(foreach tooldir,$(TOOLS),$(MAKE) clean -C $(tooldir);)
