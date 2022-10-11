# JSON files are run through jsonproc, which is a tool that converts JSON data to an output file
# based on an Inja template. https://github.com/pantor/inja

AUTO_GEN_TARGETS += $(DATA_SRC_SUBDIR)/chapter_settings.h
$(DATA_SRC_SUBDIR)/chapter_settings.h: $(DATA_SRC_SUBDIR)/chapter_settings.json $(DATA_SRC_SUBDIR)/chapter_settings.json.txt
	$(JSONPROC) $^ $@
