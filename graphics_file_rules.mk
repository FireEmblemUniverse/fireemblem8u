MOVEUNITGFXDIR := graphics/unit_icon/move

### Move Unit Icon Animation Sheets ###

$(MOVEUNITGFXDIR)/unit_icon_move_2_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_3_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_10_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_16_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_17_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_20_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_21_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_30_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_31_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_32_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_34_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_42_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_43_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_55_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_76_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 256

$(MOVEUNITGFXDIR)/unit_icon_move_79_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 252

$(MOVEUNITGFXDIR)/unit_icon_move_89_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_100_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_105_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 252

$(MOVEUNITGFXDIR)/unit_icon_move_107_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 252

## Map Tileset OBJ

MAPDIR := graphics/map

$(MAPDIR)/ObjectType1.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 1024

$(MAPDIR)/ObjectType2.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 1024

$(MAPDIR)/ObjectType3.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 1024

$(MAPDIR)/ObjectType4.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 918

$(MAPDIR)/ObjectType5.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 632

$(MAPDIR)/ObjectType6.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 1024

$(MAPDIR)/ObjectType7.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 929

$(MAPDIR)/ObjectType8.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 1019

$(MAPDIR)/ObjectType9.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 1024

$(MAPDIR)/ObjectType10.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 768

$(MAPDIR)/TowerOfValniObjectType.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 976
