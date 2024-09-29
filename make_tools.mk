
MAKEFLAGS += --no-print-directory

TOOLDIRS := $(filter-out tools/agbcc,$(wildcard tools/*))

.PHONY: all $(TOOLDIRS) clean

all: $(TOOLDIRS)

$(TOOLDIRS):
	@$(MAKE) -C $@

clean:
	@$(foreach tooldir,$(TOOLDIRS),$(MAKE) clean -C $(tooldir);)
