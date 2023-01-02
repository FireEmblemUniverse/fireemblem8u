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

	.global gUnknown_08A177A0
gUnknown_08A177A0:  @ 0x08A177A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205b74
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispSuspend
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091180
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091AB4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8091AEC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091C00
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispResume
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshBMapGraphics
        @ PROC_CALL
        .short 0x2, 0x0
        .word MU_EndAll
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091CC0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8091D54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8091F10
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8090620
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80906AC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80906D8
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A178C0
gUnknown_08A178C0:  @ 0x08A178C0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205b74
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091180
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D8C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091AB4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8091AEC
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartFadeInBlackMedium
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091C00
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091CC0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8091D54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8091F10
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8090620
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80906AC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80906D8
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A17990
gUnknown_08A17990:  @ 0x08A17990
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091180
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091AB4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8091AEC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091C00
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8090620
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80906AC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80906D8
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A17A30
gUnknown_08A17A30:  @ 0x08A17A30
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205b74
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091180
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091AB4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8091AEC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091C00
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8091CC0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8091D54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8091F10
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8090620
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80906AC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80906D8
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A17B08
gUnknown_08A17B08:  @ 0x08A17B08
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205b7c
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80906F8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8090784
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_63
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A17B30
gUnknown_08A17B30:  @ 0x08A17B30
	.incbin "baserom.gba", 0xA17B30, 0x6

	.global gUnknown_08A17B36
gUnknown_08A17B36:  @ 0x08A17B36
	.incbin "baserom.gba", 0xA17B36, 0x22

	.global gUnknown_08A17B58
gUnknown_08A17B58:  @ 0x08A17B58
@ replacing .incbin "baserom.gba", 0x00a17b58, 0xc
.4byte gUnknown_08A17B36 + 0xa
.4byte gUnknown_08A17B36 + 0x12
.4byte gUnknown_08A17B36 + 0x1a

	.global gUnknown_08A17B64
gUnknown_08A17B64:  @ 0x08A17B64
	.incbin "baserom.gba", 0xA17B64, 0x8

	.global gUnknown_08A17B6C
gUnknown_08A17B6C:  @ 0x08A17B6C
	.incbin "baserom.gba", 0xA17B6C, 0xB4

	.global gUnknown_08A17C20
gUnknown_08A17C20:  @ 0x08A17C20
@ replacing .incbin "baserom.gba", 0x00a17c20, 0x28
.4byte gUnknown_08A17B6C + 0x9e
.4byte gUnknown_08A17B6C + 0x2c
.4byte gUnknown_08A17B6C + 0x3a
.4byte gUnknown_08A17B6C + 0x4e
.4byte gUnknown_08A17B6C + 0x62
.4byte gUnknown_08A17B6C + 0x76
.4byte gUnknown_08A17B6C + 0x8a
.4byte gUnknown_08A17B6C + 0x8a
.4byte gUnknown_08A17B6C + 0x8a
.4byte gUnknown_08A17B6C + 0x8a

	.global gUnknown_08A17C48
gUnknown_08A17C48:  @ 0x08A17C48
	.incbin "baserom.gba", 0xA17C48, 0x4

	.global gUnknown_08A17C4C
gUnknown_08A17C4C:  @ 0x08A17C4C
	.incbin "baserom.gba", 0xA17C4C, 0x59C

	.global gUnknown_08A181E8
gUnknown_08A181E8:  @ 0x08A181E8
	.incbin "baserom.gba", 0xA181E8, 0x18

	.global gUnknown_08A18200
gUnknown_08A18200:  @ 0x08A18200
	.incbin "baserom.gba", 0xA18200, 0x6C
