# JSON files are run through jsonproc, which is a tool that converts JSON data to an output file
# based on an Inja template. https://github.com/pantor/inja

MAP_CHANGE_FILES := $(wildcard $(DATA_SRC_SUBDIR)/map/change/*.json)
MAP_OBJ_ANIM_FILES := $(wildcard $(DATA_SRC_SUBDIR)/map/obj_anim/*.json)
MAP_PAL_ANIM_FILES := $(wildcard $(DATA_SRC_SUBDIR)/map/pal_anim/*.json)

MAP_CHANGE_TARGETS := $(MAP_CHANGE_FILES:.json=.inc)
MAP_OBJ_ANIM_TARGETS := $(MAP_OBJ_ANIM_FILES:.json=.inc)
MAP_PAL_ANIM_TARGETS := $(MAP_PAL_ANIM_FILES:.json=.inc)

AUTO_GEN_TARGETS += $(DATA_SRC_SUBDIR)/chapter_settings.h $(MAP_CHANGE_TARGETS) $(MAP_OBJ_ANIM_TARGETS) $(MAP_PAL_ANIM_TARGETS)

$(DATA_SRC_SUBDIR)/chapter_settings.h: $(DATA_SRC_SUBDIR)/chapter_settings.json $(DATA_SRC_SUBDIR)/chapter_settings.json.txt
	$(JSONPROC) $^ $@

$(MAP_CHANGE_TARGETS): %.inc: %.json $(DATA_SRC_SUBDIR)/map/change/map_change.json.txt
	$(JSONPROC) $^ $@

$(MAP_OBJ_ANIM_TARGETS): %.inc: %.json $(DATA_SRC_SUBDIR)/map/obj_anim/map_obj_anim.json.txt
	$(JSONPROC) $^ $@

$(MAP_PAL_ANIM_TARGETS): %.inc: %.json $(DATA_SRC_SUBDIR)/map/pal_anim/map_pal_anim.json.txt
	$(JSONPROC) $^ $@

$(DATA_SUBDIR)/data_map_change.o: data_dep += $(MAP_CHANGE_TARGETS)

$(DATA_SUBDIR)/data_map_anim.o: data_dep += $(MAP_OBJ_ANIM_TARGETS) $(MAP_PAL_ANIM_TARGETS)

$(DATA_SUBDIR)/chapter_map_asset.o: data_dep += $(MAP_CHANGE_TARGETS) $(MAP_OBJ_ANIM_TARGETS) $(MAP_PAL_ANIM_TARGETS)
