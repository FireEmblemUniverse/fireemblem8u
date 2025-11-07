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

## Backgrounds

graphics/bg/bg_Black_Temple_Inside.feimg2.bin graphics/bg/bg_Black_Temple_Inside.fetsa2.bin: graphics/bg/bg_Black_Temple_Inside.png
	$(FETSATOOL) $< graphics/bg/bg_Black_Temple_Inside.feimg2.bin graphics/bg/bg_Black_Temple_Inside.fetsa2.bin --starting_index 29

graphics/bg/bg_Black_Temple_Outside.feimg2.bin graphics/bg/bg_Black_Temple_Outside.fetsa2.bin: graphics/bg/bg_Black_Temple_Outside.png
	$(FETSATOOL) $< graphics/bg/bg_Black_Temple_Outside.feimg2.bin graphics/bg/bg_Black_Temple_Outside.fetsa2.bin --starting_index 29

graphics/bg/bg_Burning_Castle.feimg2.bin graphics/bg/bg_Burning_Castle.fetsa2.bin: graphics/bg/bg_Burning_Castle.png
	$(FETSATOOL) $< graphics/bg/bg_Burning_Castle.feimg2.bin graphics/bg/bg_Burning_Castle.fetsa2.bin --starting_index 29

graphics/bg/bg_Caer_Pelyn.feimg2.bin graphics/bg/bg_Caer_Pelyn.fetsa2.bin: graphics/bg/bg_Caer_Pelyn.png
	$(FETSATOOL) $< graphics/bg/bg_Caer_Pelyn.feimg2.bin graphics/bg/bg_Caer_Pelyn.fetsa2.bin --starting_index 597

graphics/bg/bg_Darkling_Woods.feimg2.bin graphics/bg/bg_Darkling_Woods.fetsa2.bin: graphics/bg/bg_Darkling_Woods.png
	$(FETSATOOL) $< graphics/bg/bg_Darkling_Woods.feimg2.bin graphics/bg/bg_Darkling_Woods.fetsa2.bin --starting_index 29

graphics/bg/bg_Grado_Chamber.feimg2.bin graphics/bg/bg_Grado_Chamber.fetsa2.bin: graphics/bg/bg_Grado_Chamber.png
	$(FETSATOOL) $< graphics/bg/bg_Grado_Chamber.feimg2.bin graphics/bg/bg_Grado_Chamber.fetsa2.bin --starting_index 594

graphics/bg/bg_Renais_Chamber.feimg2.bin graphics/bg/bg_Renais_Chamber.fetsa2.bin: graphics/bg/bg_Renais_Chamber.png
	$(FETSATOOL) $< graphics/bg/bg_Renais_Chamber.feimg2.bin graphics/bg/bg_Renais_Chamber.fetsa2.bin --starting_index 20 --padding 1

graphics/bg/bg_Stream.feimg2.bin graphics/bg/bg_Stream.fetsa2.bin: graphics/bg/bg_Stream.png
	$(FETSATOOL) $< graphics/bg/bg_Stream.feimg2.bin graphics/bg/bg_Stream.fetsa2.bin --starting_index 480 --padding -1

#Opening subtitles

graphics/op_subtitle/OpSubtitle_05.feimg2.bin graphics/op_subtitle/OpSubtitle_05.fetsa2.bin:  graphics/op_subtitle/OpSubtitle_05.png
	$(FETSATOOL) $< graphics/op_subtitle/OpSubtitle_05.feimg2.bin graphics/op_subtitle/OpSubtitle_05.fetsa2.bin --padding 6