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

#Battle Backgrounds
graphics/btl_bg/btl_bg_1.feimg3.bin graphics/btl_bg/btl_bg_1.fetsa3.bin: graphics/btl_bg/btl_bg_1.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_1.feimg3.bin graphics/btl_bg/btl_bg_1.fetsa3.bin --flip_y_indexes=375,376,377,378,385,386,387,388,389

graphics/btl_bg/btl_bg_10.feimg3.bin graphics/btl_bg/btl_bg_10.fetsa3.bin: graphics/btl_bg/btl_bg_10.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_10.feimg3.bin graphics/btl_bg/btl_bg_10.fetsa3.bin --flip_y_indexes=375,376,377,378,385,386,388,389

graphics/btl_bg/btl_bg_13.feimg3.bin graphics/btl_bg/btl_bg_13.fetsa3.bin: graphics/btl_bg/btl_bg_13.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_13.feimg3.bin graphics/btl_bg/btl_bg_13.fetsa3.bin --flip_y_indexes=50,375,376,377,378,379,380,381,382,383,384,386,387,388,389,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419

graphics/btl_bg/btl_bg_32.feimg3.bin graphics/btl_bg/btl_bg_32.fetsa3.bin: graphics/btl_bg/btl_bg_32.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_32.feimg3.bin graphics/btl_bg/btl_bg_32.fetsa3.bin --flip_y_indexes=195,225,255

graphics/btl_bg/btl_bg_47.feimg3.bin graphics/btl_bg/btl_bg_47.fetsa3.bin: graphics/btl_bg/btl_bg_47.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_47.feimg3.bin graphics/btl_bg/btl_bg_47.fetsa3.bin --flip_y_indexes=15,16,17,18,19,20,21,22,23,24,25,26,27,28,29

graphics/btl_bg/btl_bg_56.feimg3.bin graphics/btl_bg/btl_bg_56.fetsa3.bin: graphics/btl_bg/btl_bg_56.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_56.feimg3.bin graphics/btl_bg/btl_bg_56.fetsa3.bin --blank_tile_index=298 --pop_last_tile

graphics/btl_bg/btl_bg_57.feimg3.bin graphics/btl_bg/btl_bg_57.fetsa3.bin: graphics/btl_bg/btl_bg_57.png
	$(FETSATOOL) $< graphics/btl_bg/btl_bg_57.feimg3.bin graphics/btl_bg/btl_bg_57.fetsa3.bin --blank_tile_index=305 --pop_last_tile

#op anim
graphics/op_anim/OpAnimWorldMapFog.feimg4.bin graphics/op_anim/OpAnimWorldMapFog.fetsa4.bin: graphics/op_anim/OpAnimWorldMapFog.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimWorldMapFog.feimg4.bin  graphics/op_anim/OpAnimWorldMapFog.fetsa4.bin --blank_tile_index=255

graphics/op_anim/OpAnimEirika.feimg4.bin graphics/op_anim/OpAnimEirika.fetsa4.bin: graphics/op_anim/OpAnimEirika.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimEirika.feimg4.bin  graphics/op_anim/OpAnimEirika.fetsa4.bin --num_tiles=256 --insert_indexes=114:1

graphics/op_anim/OpAnimEirikaBlur1.feimg4.bin graphics/op_anim/OpAnimEirikaBlur1.fetsa4.bin: graphics/op_anim/OpAnimEirikaBlur1.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimEirikaBlur1.feimg4.bin  graphics/op_anim/OpAnimEirikaBlur1.fetsa4.bin --num_tiles=256 --insert_indexes=119:1

graphics/op_anim/OpAnimEirikaBlur2.feimg4.bin graphics/op_anim/OpAnimEirikaBlur2.fetsa4.bin: graphics/op_anim/OpAnimEirikaBlur2.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimEirikaBlur2.feimg4.bin  graphics/op_anim/OpAnimEirikaBlur2.fetsa4.bin --num_tiles=256 --insert_indexes=136:1

graphics/op_anim/OpAnimEirikaBlur3.feimg4.bin graphics/op_anim/OpAnimEirikaBlur3.fetsa4.bin: graphics/op_anim/OpAnimEirikaBlur3.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimEirikaBlur3.feimg4.bin  graphics/op_anim/OpAnimEirikaBlur3.fetsa4.bin --num_tiles=256 --insert_indexes=161:1

graphics/op_anim/OpAnimEphraim.feimg4.bin graphics/op_anim/OpAnimEphraim.fetsa4.bin: graphics/op_anim/OpAnimEphraim.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimEphraim.feimg4.bin  graphics/op_anim/OpAnimEphraim.fetsa4.bin --num_tiles=256 --insert_indexes=133:1

graphics/op_anim/OpAnimEphraimBlur1.feimg4.bin graphics/op_anim/OpAnimEphraimBlur1.fetsa4.bin: graphics/op_anim/OpAnimEphraimBlur1.png
	$(FETSATOOL) $< graphics/op_anim/OpAnimEphraimBlur1.feimg4.bin  graphics/op_anim/OpAnimEphraimBlur1.fetsa4.bin --num_tiles=256 --insert_indexes=149:1

#graphics/op_anim/OpAnimEphraimBlur3.feimg4.bin graphics/op_anim/OpAnimEphraimBlur3.fetsa4.bin: graphics/op_anim/OpAnimEphraimBlur3.png
#	$(FETSATOOL) $< graphics/op_anim/OpAnimEphraimBlur3.feimg4.bin  graphics/op_anim/OpAnimEphraimBlur3.fetsa4.bin --num_tiles=256 --insert_indexes=167:1