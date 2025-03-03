MOVEUNITGFXDIR := graphics/unit_icon/move

### Move Unit Icon Animation Sheets ###

$(MOVEUNITGFXDIR)/unit_icon_move_Ephraim_Master_Lord_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Eirika_Master_Lord_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_General_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_Hero_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Hero_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Swordmaster_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Swordmaster_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Wyvern_Rider_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Wyvern_Lord_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Wyvern_Lord_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_Wyvern_Knight_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_Bishop_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Bishop_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Journeyman_T2_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241

$(MOVEUNITGFXDIR)/unit_icon_move_Dancer_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 256

$(MOVEUNITGFXDIR)/unit_icon_move_Fleet_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 252

$(MOVEUNITGFXDIR)/unit_icon_move_Cyclops_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_Draco_Zombie_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

$(MOVEUNITGFXDIR)/unit_icon_move_Blst_Long_Empty_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 252

$(MOVEUNITGFXDIR)/unit_icon_move_Blst_Killer_Empty_sheet.4bpp: %.4bpp: %.png
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
