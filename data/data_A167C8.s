    .section .data

	.global gGfx_PlayerInterfaceFontTiles
gGfx_PlayerInterfaceFontTiles:  @ 0x08A167C8
	.incbin "graphics/player_interface/player_interface_font_tiles.4bpp.lz"

	.global gGfx_PlayerInterfaceNumbers
gGfx_PlayerInterfaceNumbers:  @ 0x08A16D6C
	.incbin "graphics/player_interface/player_interface_numbers.4bpp.lz"

	.global gGfx_StatusText
gGfx_StatusText:  @ 0x08A16DEC
	.incbin "graphics/player_interface/status_text.4bpp"

	.global gPal_PlayerInterface_Blue
gPal_PlayerInterface_Blue:  @ 0x08A1738C
	.incbin "graphics/player_interface/player_interface_blue.gbapal"

	.global gPal_PlayerInterface_Red
gPal_PlayerInterface_Red:  @ 0x08A173AC
	.incbin "graphics/player_interface/player_interface_red.gbapal"

	.global gPal_PlayerInterface_Green
gPal_PlayerInterface_Green:  @ 0x08A173CC
	.incbin "graphics/player_interface/player_interface_green.gbapal"

	.global gUnknown_08A173EC
gUnknown_08A173EC:  @ 0x08A173EC
	.incbin "graphics/player_interface/gUnknown_08A173EC.gbapal"

	.global gUnknown_08A1740C
gUnknown_08A1740C:  @ 0x08A1740C
	.incbin "graphics/player_interface/gUnknown_08A1740C.gbapal"

	.global gTSA_TerrainBox
gTSA_TerrainBox:  @ 0x08A1742C
	.incbin "baserom.gba", 0xA1742C, 0x58

	.global gTSA_MinimugBox
gTSA_MinimugBox:  @ 0x08A17484
	.incbin "baserom.gba", 0xA17484, 0x130

	.global gUnknown_08A175B4
gUnknown_08A175B4:  @ 0x08A175B4
	.incbin "baserom.gba", 0xA175B4, 0x14

	.global gUnknown_08A175C8
gUnknown_08A175C8:  @ 0x08A175C8
	.incbin "baserom.gba", 0xA175C8, 0x14

	.global gUnknown_08A175DC
gUnknown_08A175DC:  @ 0x08A175DC
	.incbin "baserom.gba", 0xA175DC, 0x14

	.global gUnknown_08A175F0
gUnknown_08A175F0:  @ 0x08A175F0
	.incbin "baserom.gba", 0xA175F0, 0x14

	.global gUnknown_08A17604
gUnknown_08A17604:  @ 0x08A17604
	.incbin "baserom.gba", 0xA17604, 0x38

	.global gUnknown_08A1763C
gUnknown_08A1763C:  @ 0x08A1763C
	.incbin "baserom.gba", 0xA1763C, 0x14

	.global gUnknown_08A17650
gUnknown_08A17650:  @ 0x08A17650
	.incbin "baserom.gba", 0xA17650, 0x14

	.global gUnknown_08A17664
gUnknown_08A17664:  @ 0x08A17664
	.incbin "baserom.gba", 0xA17664, 0x14

	.global gUnknown_08A17678
gUnknown_08A17678:  @ 0x08A17678
	.incbin "baserom.gba", 0xA17678, 0x14

	.global gTSA_TerrainBox_Something
gTSA_TerrainBox_Something:  @ 0x08A1768C
	.incbin "baserom.gba", 0xA1768C, 0x10

	.global gTSA_TerrainBox_Ballistae
gTSA_TerrainBox_Ballistae:  @ 0x08A1769C
	.incbin "baserom.gba", 0xA1769C, 0x8

	.global gTSA_TerrainBox_Destructable
gTSA_TerrainBox_Destructable:  @ 0x08A176A4
	.incbin "baserom.gba", 0xA176A4, 0x10

	.global gUnknown_08A176B4
gUnknown_08A176B4:  @ 0x08A176B4
	.incbin "baserom.gba", 0xA176B4, 0x8

	.global gTSA_GoalBox_TwoLines
gTSA_GoalBox_TwoLines:  @ 0x08A176BC
	.incbin "baserom.gba", 0xA176BC, 0x88

	.global gTSA_GoalBox_OneLine
gTSA_GoalBox_OneLine:  @ 0x08A17744
	.incbin "baserom.gba", 0xA17744, 0x5C
