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
        .word ContinueUntilSomeTransistion6CExists
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
        .word ContinueUntilSomeTransistion6CExists
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
        .word ContinueUntilSomeTransistion6CExists
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
        .word ContinueUntilSomeTransistion6CExists
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
        .word ContinueUntilSomeTransistion6CExists
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
        .word sub_8013D68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
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
        .word ContinueUntilSomeTransistion6CExists
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
        .word ContinueUntilSomeTransistion6CExists
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
        .word ContinueUntilSomeTransistion6CExists
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
        .word ContinueUntilSomeTransistion6CExists
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

	.global gUnknown_08A1826C
gUnknown_08A1826C:  @ 0x08A1826C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8095BD8
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8095BE8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8095BF4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A1829C
gUnknown_08A1829C:  @ 0x08A1829C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205bd0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8096424
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8095EBC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8095AD8
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8095C84
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8002A6C
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8097394
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8095F2C
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xc
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8096004
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809602C
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xd
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8095C84
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8096004
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8002A6C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809602C
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809631C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8096390
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xa
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x9
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8095C84
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8095C84
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xb
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809625C
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809625C
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8096294
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80962E0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MU_EndAll
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809643C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80ADDD4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A184B4
gUnknown_08A184B4:  @ 0x08A184B4
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8002A6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80964F4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809656C
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8096590
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8002A6C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A184F4
gUnknown_08A184F4:  @ 0x08A184F4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8096424
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CC940
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xc8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8096494
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809643C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA184F4 + 0x38, 0x7A - 0x38

	.global gUnknown_08A1856E
gUnknown_08A1856E:  @ 0x08A1856E
	.incbin "baserom.gba", 0xA1856E, 0x14

	.global gUnknown_08A18582
gUnknown_08A18582:  @ 0x08A18582
	.incbin "baserom.gba", 0xA18582, 0xE

	.global gUnknown_08A18590
gUnknown_08A18590:  @ 0x08A18590
	.incbin "baserom.gba", 0xA18590, 0xE

	.global gUnknown_08A1859E
gUnknown_08A1859E:  @ 0x08A1859E
	.incbin "baserom.gba", 0xA1859E, 0xE

	.global gUnknown_08A185AC
gUnknown_08A185AC:  @ 0x08A185AC
	.incbin "baserom.gba", 0xA185AC, 0x68

	.global gUnknown_08A18614
gUnknown_08A18614:  @ 0x08A18614
@ Replacing .incbin "baserom.gba", 0xA18614, 0xA0
    .4byte gUnknown_08A185AC + 0xe
    .4byte gUnknown_08A185AC + 0x16
    .4byte gUnknown_08A185AC + 0x1e
    .4byte gUnknown_08A185AC + 0x26
    .4byte gUnknown_08A185AC + 0x2e
    .4byte gUnknown_08A185AC + 0x36
    .4byte gUnknown_08A185AC + 0x3e
    .4byte gUnknown_08A185AC + 0x46
    .4byte gUnknown_08A185AC + 0x4e
    .4byte gUnknown_08A185AC + 0x56
    .4byte gUnknown_08A185AC + 0x5e
    .4byte gUnknown_08A185AC + 0xe
    .4byte 0x4000001
    .4byte 0xc808000
    .4byte 0x44000003
    .4byte 0xc948020
    .4byte -0x7fb7bc00
    .4byte 0x4000c98
    .4byte 0xc9c4068
    .4byte 0x44000004
    .4byte 0xc948008
    .4byte -0x7fcfbc00
    .4byte 0x44000cc4
    .4byte 0xcc88050
    .4byte 0x40700400
    .4byte 0x40ccc
    .4byte -0x7fffbc00
    .4byte 0x44000c84
    .4byte 0xc888020
    .4byte -0x7fbfbc00
    .4byte 0x44000c8c
    .4byte 0xc908060
    .4byte 0x44000002
    .4byte 0xc948030
    .4byte -0x7fa7bc00
    .4byte 0xcce
    .4byte gUnknown_08A18614 + 0x38
    .4byte gUnknown_08A18614 + 0x4c
    .4byte gUnknown_08A18614 + 0x66
    .4byte gUnknown_08A18614 + 0x80

	.global gUnknown_08A186B4
gUnknown_08A186B4:  @ 0x08A186B4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8096ABC
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8096BB8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8096BA4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A186DC
gUnknown_08A186DC:  @ 0x08A186DC
	.incbin "baserom.gba", 0xA186DC, 0x10

	.global gUnknown_08A186EC
gUnknown_08A186EC:  @ 0x08A186EC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8096CCC
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8096F98
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8096F6C
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8096D10
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8096F44
        @ PROC_LABEL
        .short 0xb, 0xa
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A18744
gUnknown_08A18744:  @ 0x08A18744
	.incbin "baserom.gba", 0xA18744, 0x8

	.global gUnknown_08A1874C
gUnknown_08A1874C:  @ 0x08A1874C
	.incbin "baserom.gba", 0xA1874C, 0x8

	.global gUnknown_08A18754
gUnknown_08A18754:  @ 0x08A18754
	.incbin "baserom.gba", 0xA18754, 0x48

	.global gUnknown_08A1879C
gUnknown_08A1879C:  @ 0x08A1879C
@ Replacing .incbin "baserom.gba", 0xA1879C, 0x54
    .4byte 0x0
    .4byte gUnknown_08A18754 + 0x8
    .4byte gUnknown_08A18754 + 0x10
    .4byte gUnknown_08A18754 + 0x18
    .4byte gUnknown_08A18754 + 0x20
    .4byte gUnknown_08A18754 + 0x28
    .4byte gUnknown_08A18754 + 0x30
    .4byte gUnknown_08A18754 + 0x38
    .4byte gUnknown_08A18754 + 0x40
    .4byte 0x1
    .4byte 0xa0000
    .4byte 0x1
    .4byte 0xb0000
    .4byte 0x1
    .4byte 0xc0000
    .4byte 0x1
    .4byte 0xd0000
    .4byte 0x1
    .4byte 0xe0000
    .4byte 0x1
    .4byte 0xf0000

	.global gUnknown_08A187F0
gUnknown_08A187F0:  @ 0x08A187F0
@ replacing .incbin "baserom.gba", 0x00a187f0, 0x18
.4byte gUnknown_08A1879C + 0x24
.4byte gUnknown_08A1879C + 0x2c
.4byte gUnknown_08A1879C + 0x34
.4byte gUnknown_08A1879C + 0x3c
.4byte gUnknown_08A1879C + 0x44
.4byte gUnknown_08A1879C + 0x4c

	.global gUnknown_08A18808
gUnknown_08A18808:  @ 0x08A18808
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205bd8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80973B0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80973E4
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A18840
gUnknown_08A18840:  @ 0x08A18840
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205be4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809788C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80979DC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8097AA0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA18870, 0x18

	.global gUnknown_08A18888
gUnknown_08A18888:  @ 0x08A18888
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205bf0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8097CD8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A188A8
gUnknown_08A188A8:  @ 0x08A188A8
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8097D80
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A188C0
gUnknown_08A188C0:  @ 0x08A188C0
	.incbin "baserom.gba", 0xA188C0, 0x24

	.global gUnknown_08A188E4
gUnknown_08A188E4:  @ 0x08A188E4
	.incbin "baserom.gba", 0xA188E4, 0x14

	.global gUnknown_08A188F8
gUnknown_08A188F8:  @ 0x08A188F8
	.incbin "baserom.gba", 0xA188F8, 0x18

	.global gUnknown_08A18910
gUnknown_08A18910:  @ 0x08A18910
	.incbin "baserom.gba", 0xA18910, 0x18

	.global gUnknown_08A18928
gUnknown_08A18928:  @ 0x08A18928
	.incbin "baserom.gba", 0xA18928, 0x1C

	.global gUnknown_08A18944
gUnknown_08A18944:  @ 0x08A18944
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098448
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8098474
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A18964
gUnknown_08A18964:  @ 0x08A18964
	.incbin "baserom.gba", 0xA18964, 0x28

	.global gUnknown_08A1898C
gUnknown_08A1898C:  @ 0x08A1898C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098514
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809852C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A189A4
gUnknown_08A189A4:  @ 0x08A189A4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098408
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098620
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098CC0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098CC0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8099120
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AD5B4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80990D4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099100
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098CC0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnableAllGfx
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80995D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80985B8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099654
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80996E8
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098600
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099AF8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099C60
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8099C70
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AD5B4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80990D4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099100
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099AF8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099C60
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnableAllGfx
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099DB8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098620
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099AF8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099C60
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80989BC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099E30
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098620
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8034194
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80996B0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80995D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80985B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099654
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x9
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80989BC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099DE8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098620
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8034194
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80996B0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80995D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80985B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099654
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xa
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80989BC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099E00
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098620
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8034194
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80996B0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80995D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80985B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099654
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xb
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80989BC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099E18
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098620
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8034194
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80996B0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80995D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80985B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099654
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xc
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80989BC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099E48
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8098620
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8034194
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80996B0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80995D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80985B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099654
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xd
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80989BC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8099E68
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
@ Replacing .incbin "baserom.gba", 0xA189A4 + 0x478, 0x490 - 0x478
    .4byte 0x40000003
    .4byte 0x8000000
    .4byte 0x4008
    .4byte 0x40100806
    .4byte 0x80c0000
    .4byte 0x2040200

	.global gUnknown_08A18E34
gUnknown_08A18E34:  @ 0x08A18E34
	.incbin "baserom.gba", 0xA18E34, 0x1A

	.global gUnknown_08A18E4E
gUnknown_08A18E4E:  @ 0x08A18E4E
	.incbin "baserom.gba", 0xA18E4E, 0x14

	.global gUnknown_08A18E62
gUnknown_08A18E62:  @ 0x08A18E62
	.incbin "baserom.gba", 0xA18E62, 0x14

	.global gUnknown_08A18E76
gUnknown_08A18E76:  @ 0x08A18E76
	.incbin "baserom.gba", 0xA18E76, 0x16

	.global gUnknown_08A18E8C
gUnknown_08A18E8C:  @ 0x08A18E8C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_809B40C
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809AE3C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809AE7C
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809B038
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809B370
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809B2DC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809B3B4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809B324
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809B388
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809B014
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809B458
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809B478
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809AE7C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809B4C0
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809B014
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809B504
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809B520
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809AE7C
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809B4E4
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x63
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809B438
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_GOTO
        .short 0xc, 0x64
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xa
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_LABEL
        .short 0xb, 0x64
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A1901C
gUnknown_08A1901C:  @ 0x08A1901C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809B86C
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809BB34
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809BE24
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A19064
gUnknown_08A19064:  @ 0x08A19064
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809C4D8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809C4E4
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809C820
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809C9F4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809CA14
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809CB38
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word gUnknown_08A191A4
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word gUnknown_08A191C4
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CC990
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809CC9C
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809CC60
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809C4E4
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8002A6C
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809C940
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A191A4
gUnknown_08A191A4:  @ 0x08A191A4
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_809CF8C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809CDD4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809CF48
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A191C4
gUnknown_08A191C4:  @ 0x08A191C4
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_809D1C0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809D0D4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809D17C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807EE74
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A191F4
gUnknown_08A191F4:  @ 0x08A191F4
	.incbin "baserom.gba", 0xA191F4, 0xC

	.global gUnknown_08A19200
gUnknown_08A19200:  @ 0x08A19200
@ replacing .incbin "baserom.gba", 0x00a19200, 0x4
.4byte gUnknown_0200F15C + 0x20

	.global gUnknown_08A19204
gUnknown_08A19204:  @ 0x08A19204
	.incbin "baserom.gba", 0xA19204, 0x8

	.global gUnknown_08A1920C
gUnknown_08A1920C:  @ 0x08A1920C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809D570
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809D914
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809DA00
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809DC70
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809DCD4
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809E184
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809E420
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809DFB0
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809E054
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809E840
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809E974
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_LABEL
        .short 0xb, 0x9
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809EA7C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A192EC
gUnknown_08A192EC:  @ 0x08A192EC
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispSuspend
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809EAF4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809D570
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809D914
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809DA00
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809DC70
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809DCD4
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809E184
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809E420
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809DFB0
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809E054
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809E840
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809E974
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_LABEL
        .short 0xb, 0x9
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809EA7C
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispResume
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshBMapGraphics
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809EB14
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A19424
gUnknown_08A19424:  @ 0x08A19424
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809EB78
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809ED8C
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809F5F4
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809F688
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809F0FC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809FD54
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809FB34
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809FC24
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809F218
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_809F2C4
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_LABEL
        .short 0xb, 0x9
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809F0FC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A1951C
gUnknown_08A1951C:  @ 0x08A1951C
	.incbin "baserom.gba", 0xA1951C, 0x8

	.global gUnknown_08A19524
gUnknown_08A19524:  @ 0x08A19524
@ replacing .incbin "baserom.gba", 0x00a19524, 0x4
.4byte gUnknown_0200F15C + 0x20

	.global gUnknown_08A19528
gUnknown_08A19528:  @ 0x08A19528
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_809FE58
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A00DC
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A03C4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A0424
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A0570
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A064C
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A06F0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA19528 + 0x88, 0xD0 - 0x88

	.global gUnknown_08A195F8
gUnknown_08A195F8:  @ 0x08A195F8
	.incbin "baserom.gba", 0xA195F8, 0x10

	.global gUnknown_08A19608
gUnknown_08A19608:  @ 0x08A19608
@ replacing .incbin "baserom.gba", 0x00a19608, 0x24
.4byte gUnknown_08A19528 + 0x88
.4byte gUnknown_08A19528 + 0x90
.4byte gUnknown_08A19528 + 0x98
.4byte gUnknown_08A19528 + 0xa0
.4byte gUnknown_08A19528 + 0xa8
.4byte gUnknown_08A19528 + 0xb0
.4byte gUnknown_08A19528 + 0xb8
.4byte gUnknown_08A19528 + 0xc0
.4byte gUnknown_08A19528 + 0xc8

	.global gUnknown_08A1962C
gUnknown_08A1962C:  @ 0x08A1962C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A0758
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A0924
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A0900
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A0900
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A0900
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A196C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A196BC
gUnknown_08A196BC:  @ 0x08A196BC
	.incbin "baserom.gba", 0xA196BC, 0x14

	.global gUnknown_08A196D0
gUnknown_08A196D0:  @ 0x08A196D0
	.incbin "baserom.gba", 0xA196D0, 0x2C

	.global gUnknown_08A196FC
gUnknown_08A196FC:  @ 0x08A196FC
@ replacing .incbin "baserom.gba", 0x00a196fc, 0x4
.4byte gUnknown_0200F15C + 0x20

	.global gUnknown_08A19700
gUnknown_08A19700:  @ 0x08A19700
	.incbin "baserom.gba", 0xA19700, 0x26

	.global gUnknown_08A19726
gUnknown_08A19726:  @ 0x08A19726
	.incbin "baserom.gba", 0xA19726, 0x16

	.global gUnknown_08A1973C
gUnknown_08A1973C:  @ 0x08A1973C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A10D0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A10FC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A1975C
gUnknown_08A1975C:  @ 0x08A1975C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A0C40
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A10BC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A1270
        @ PROC_WHILE
        .short 0x14, 0x0
        .word IsMusicProc2Running
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D8C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8002A6C
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A157C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A15B0
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A1554
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A1918
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A1930
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A1554
        @ PROC_WHILE
        .short 0x14, 0x0
        .word IsMusicProc2Running
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A1983C
gUnknown_08A1983C:  @ 0x08A1983C
@ Replacing .incbin "baserom.gba", 0xA1983C, 0x14
    .4byte 0x40000003
    .4byte DirectSoundData_pr_hyuun1_e4_13k8b + 0x1b58
    .4byte 0x40204000
    .4byte 0x40000830
    .4byte DirectSoundData_nosferatu1b_e_p45_10k8b + 0x2bd4

	.global gUnknown_08A19850
gUnknown_08A19850:  @ 0x08A19850
	.incbin "baserom.gba", 0xA19850, 0xE

	.global gUnknown_08A1985E
gUnknown_08A1985E:  @ 0x08A1985E
@ Replacing .incbin "baserom.gba", 0xA1985E, 0x14
    .4byte 0x40000003
    .4byte 0x8068000
    .4byte -0x7fdfc000
    .4byte 0x80a
    .4byte gUnknown_080E3B78 + 0x4c8

	.global gUnknown_08A19872
gUnknown_08A19872:  @ 0x08A19872
	.incbin "baserom.gba", 0xA19872, 0xE

	.global gUnknown_08A19880
gUnknown_08A19880:  @ 0x08A19880
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A21D0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A2274
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8002A6C
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A2448
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A2B7C
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A2B5C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_8002A6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A25F8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_WHILE
        .short 0x14, 0x0
        .word EventEngineExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A2BD0
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A26A8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A2800
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A29C0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A286C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A2AAC
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A26A8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A28E0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A29C0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A294C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A2AAC
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A2B5C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A199C8
gUnknown_08A199C8:  @ 0x08A199C8
	.incbin "baserom.gba", 0xA199C8, 0x244

	.global gUnknown_08A19C0C
gUnknown_08A19C0C:  @ 0x08A19C0C
	.incbin "baserom.gba", 0xA19C0C, 0xA0

	.global gUnknown_08A19CAC
gUnknown_08A19CAC:  @ 0x08A19CAC
	.incbin "baserom.gba", 0xA19CAC, 0x20

	.global gUnknown_08A19CCC
gUnknown_08A19CCC:  @ 0x08A19CCC
	.incbin "baserom.gba", 0xA19CCC, 0x3B8

	.global gUnknown_08A1A084
gUnknown_08A1A084:  @ 0x08A1A084
	.incbin "baserom.gba", 0xA1A084, 0x20

	.global gUnknown_08A1A0A4
gUnknown_08A1A0A4:  @ 0x08A1A0A4
	.incbin "baserom.gba", 0xA1A0A4, 0x198

	.global gUnknown_08A1A23C
gUnknown_08A1A23C:  @ 0x08A1A23C
	.incbin "baserom.gba", 0xA1A23C, 0x1C0

	.global gUnknown_08A1A3FC
gUnknown_08A1A3FC:  @ 0x08A1A3FC
@ Replacing .incbin "baserom.gba", 0xA1A3FC, 0x20
    .4byte 0x5ab50000
    .4byte 0x2508462f
    .4byte 0x26b50000
    .4byte gUnknown_08A708A7 + 0xa5
    .4byte 0x59400956
    .4byte 0x394e520e
    .4byte 0x32ca01a1
    .4byte 0x30a5

	.global gUnknown_08A1A41C
gUnknown_08A1A41C:  @ 0x08A1A41C
	.incbin "baserom.gba", 0xA1A41C, 0x18

	.global gUnknown_08A1A434
gUnknown_08A1A434:  @ 0x08A1A434
	.incbin "baserom.gba", 0xA1A434, 0x40

	.global gUnknown_08A1A474
gUnknown_08A1A474:  @ 0x08A1A474
	.incbin "baserom.gba", 0xA1A474, 0x54

	.global gUnknown_08A1A4C8
gUnknown_08A1A4C8:  @ 0x08A1A4C8
	.incbin "baserom.gba", 0xA1A4C8, 0x41C

	.global gUnknown_08A1A8E4
gUnknown_08A1A8E4:  @ 0x08A1A8E4
	.incbin "baserom.gba", 0xA1A8E4, 0x3A4

	.global gUnknown_08A1AC88
gUnknown_08A1AC88:  @ 0x08A1AC88
	.incbin "baserom.gba", 0xA1AC88, 0x450

	.global gUnknown_08A1B0D8
gUnknown_08A1B0D8:  @ 0x08A1B0D8
	.incbin "baserom.gba", 0xA1B0D8, 0x7C

	.global gUnknown_08A1B154
gUnknown_08A1B154:  @ 0x08A1B154
	.incbin "baserom.gba", 0xA1B154, 0x20

	.global gUnknown_08A1B174
gUnknown_08A1B174:  @ 0x08A1B174
	.incbin "baserom.gba", 0xA1B174, 0x20

	.global gUnknown_08A1B194
gUnknown_08A1B194:  @ 0x08A1B194
	.incbin "baserom.gba", 0xA1B194, 0x68

	.global gUnknown_08A1B1FC
gUnknown_08A1B1FC:  @ 0x08A1B1FC
	.incbin "baserom.gba", 0xA1B1FC, 0x43C

	.global gUnknown_08A1B638
gUnknown_08A1B638:  @ 0x08A1B638
	.incbin "baserom.gba", 0xA1B638, 0x20

	.global gUnknown_08A1B658
gUnknown_08A1B658:  @ 0x08A1B658
	.incbin "baserom.gba", 0xA1B658, 0x40

	.global gUnknown_08A1B698
gUnknown_08A1B698:  @ 0x08A1B698
	.incbin "baserom.gba", 0xA1B698, 0x98

	.global gUnknown_08A1B730
gUnknown_08A1B730:  @ 0x08A1B730
	.incbin "baserom.gba", 0xA1B730, 0x98

	.global gUnknown_08A1B7C8
gUnknown_08A1B7C8:  @ 0x08A1B7C8
	.incbin "baserom.gba", 0xA1B7C8, 0xF0

	.global gUnknown_08A1B8B8
gUnknown_08A1B8B8:  @ 0x08A1B8B8
	.incbin "baserom.gba", 0xA1B8B8, 0xD8

	.global gUnknown_08A1B990
gUnknown_08A1B990:  @ 0x08A1B990
	.incbin "baserom.gba", 0xA1B990, 0x5C

	.global gUnknown_08A1B9EC
gUnknown_08A1B9EC:  @ 0x08A1B9EC
	.incbin "baserom.gba", 0xA1B9EC, 0xCC

	.global gUnknown_08A1BAB8
gUnknown_08A1BAB8:  @ 0x08A1BAB8
	.incbin "baserom.gba", 0xA1BAB8, 0x2C

	.global gUnknown_08A1BAE4
gUnknown_08A1BAE4:  @ 0x08A1BAE4
	.incbin "baserom.gba", 0xA1BAE4, 0xEC

	.global gUnknown_08A1BBD0
gUnknown_08A1BBD0:  @ 0x08A1BBD0
	.incbin "baserom.gba", 0xA1BBD0, 0xF0

	.global gUnknown_08A1BCC0
gUnknown_08A1BCC0:  @ 0x08A1BCC0
	.incbin "baserom.gba", 0xA1BCC0, 0x40

	.global gUnknown_08A1BD00
gUnknown_08A1BD00:  @ 0x08A1BD00
	.incbin "baserom.gba", 0xA1BD00, 0x40

	.global gUnknown_08A1BD40
gUnknown_08A1BD40:  @ 0x08A1BD40
	.incbin "baserom.gba", 0xA1BD40, 0x20

	.global gUnknown_08A1BD60
gUnknown_08A1BD60:  @ 0x08A1BD60
	.incbin "baserom.gba", 0xA1BD60, 0x9A4

	.global gUnknown_08A1C704
gUnknown_08A1C704:  @ 0x08A1C704
	.incbin "baserom.gba", 0xA1C704, 0xD4

	.global gUnknown_08A1C7D8
gUnknown_08A1C7D8:  @ 0x08A1C7D8
	.incbin "baserom.gba", 0xA1C7D8, 0xDC

	.global gUnknown_08A1C8B4
gUnknown_08A1C8B4:  @ 0x08A1C8B4
	.incbin "baserom.gba", 0xA1C8B4, 0x4B4

	.global gUnknown_08A1CD68
gUnknown_08A1CD68:  @ 0x08A1CD68
	.incbin "baserom.gba", 0xA1CD68, 0x5C

	.global gUnknown_08A1CDC4
gUnknown_08A1CDC4:  @ 0x08A1CDC4
	.incbin "baserom.gba", 0xA1CDC4, 0x4C4

	.global gUnknown_08A1D288
gUnknown_08A1D288:  @ 0x08A1D288
	.incbin "baserom.gba", 0xA1D288, 0x1C0

	.global gUnknown_08A1D448
gUnknown_08A1D448:  @ 0x08A1D448
	.incbin "baserom.gba", 0xA1D448, 0x80

	.global gUnknown_08A1D4C8
gUnknown_08A1D4C8:  @ 0x08A1D4C8
	.incbin "baserom.gba", 0xA1D4C8, 0x20

	.global gUnknown_08A1D4E8
gUnknown_08A1D4E8:  @ 0x08A1D4E8
	.incbin "baserom.gba", 0xA1D4E8, 0x28

	.global gUnknown_08A1D510
gUnknown_08A1D510:  @ 0x08A1D510
	.incbin "baserom.gba", 0xA1D510, 0x28C

	.global gUnknown_08A1D79C
gUnknown_08A1D79C:  @ 0x08A1D79C
	.incbin "baserom.gba", 0xA1D79C, 0x40

	.global gUnknown_08A1D7DC
gUnknown_08A1D7DC:  @ 0x08A1D7DC
	.incbin "baserom.gba", 0xA1D7DC, 0xF4

	.global gUnknown_08A1D8D0
gUnknown_08A1D8D0:  @ 0x08A1D8D0
	.incbin "baserom.gba", 0xA1D8D0, 0x2B0

	.global gUnknown_08A1DB80
gUnknown_08A1DB80:  @ 0x08A1DB80
	.incbin "baserom.gba", 0xA1DB80, 0x9C

	.global gUnknown_08A1DC1C
gUnknown_08A1DC1C:  @ 0x08A1DC1C
	.incbin "baserom.gba", 0xA1DC1C, 0xF0

	.global gUnknown_08A1DD0C
gUnknown_08A1DD0C:  @ 0x08A1DD0C
	.incbin "baserom.gba", 0xA1DD0C, 0x3CC

	.global gUnknown_08A1E0D8
gUnknown_08A1E0D8:  @ 0x08A1E0D8
@ Replacing .incbin "baserom.gba", 0xA1E0D8, 0x1A1C
    .4byte 0x14c7520e
    .4byte 0x2d2628e4
    .4byte 0x3d8a3548
    .4byte 0x4a0e41cc
    .4byte 0x56925250
    .4byte 0x7fff14c7
    .4byte 0x52d7677d
    .4byte 0x3e11
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xe200e1c
    .4byte 0xe9c0e24
    .4byte 0xea40ea0
    .4byte 0xf200f1c
    .4byte 0xe1c0f24
    .4byte 0xe240e20
    .4byte 0xea00e9c
    .4byte 0xf1c0ea4
    .4byte 0xf240f20
    .4byte 0xe200e1c
    .4byte 0xe9c0e24
    .4byte 0xea40ea0
    .4byte 0xf200f1c
    .4byte 0xe1c0f24
    .4byte 0xe240e20
    .4byte 0xea00e9c
    .4byte 0xf1c0ea4
    .4byte 0xf240f20
    .4byte 0x800080
    .4byte 0x800080
    .4byte 0x3000300
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x38
    .4byte 0x3000601
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x4a
    .4byte 0x3010b02
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x5c
    .4byte 0x30a0003
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x6e
    .4byte 0x1020404
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x80
    .4byte 0x1020705
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x82
    .4byte 0x1030c06
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x84
    .4byte 0x10c0107
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x86
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xa38
    .4byte 0x7100690
    .4byte 0xa38
    .4byte 0x7100690
    .4byte 0xa38
    .4byte DirectSoundData_breath_magic1_e1_10k8b + 0x1ec
    .4byte 0x93408bc
    .4byte gUnknown_08B1FE7C + 0xa089c
    .4byte 0x1000100
    .4byte 0x1000100
    .4byte 0x2080400
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0xf4
    .4byte 0x20b0401
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0xfc
    .4byte 0x2070802
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x104
    .4byte 0x1030203
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x10c
    .4byte 0x10a0604
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x110
    .4byte 0x1050a05
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x112
    .4byte 0x1030606
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x114
    .4byte 0x1030807
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x116
    .4byte 0x1030a08
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x118
    .4byte 0x10c0609
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x11a
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xe200e1c
    .4byte 0xe9c0e24
    .4byte 0xea40ea0
    .4byte 0xf200f1c
    .4byte 0x1c0f24
    .4byte 0x2c0010
    .4byte 0xe200e1c
    .4byte 0xe9c0e24
    .4byte 0xea40ea0
    .4byte 0xf200f1c
    .4byte 0x800f24
    .4byte 0x10001c
    .4byte 0x80002c
    .4byte 0x3000700
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1a0
    .4byte 0x1080401
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1b2
    .4byte 0x3090002
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1b8
    .4byte 0x1020803
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1ca
    .4byte 0x1080404
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1cc
    .4byte 0x10b0105
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1d2
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xb940b90
    .4byte 0xc100c88
    .4byte 0xd080c14
    .4byte 0xb940b90
    .4byte 0xc100c88
    .4byte 0xd080c14
    .4byte 0xb940b90
    .4byte 0xc100c88
    .4byte 0xd080c14
    .4byte 0xb940c88
    .4byte 0xd080b98
    .4byte 0xc180c14
    .4byte 0x800080
    .4byte 0x800080
    .4byte 0x3000400
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x228
    .4byte 0x3050401
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x234
    .4byte 0x3090b02
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x240
    .4byte 0x3120b03
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x24c
    .4byte 0x1010504
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x258
    .4byte 0x1060505
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x25a
    .4byte 0x10a0c06
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x25c
    .4byte 0x1130c07
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x25e
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x40004
    .4byte 0xcd0
    .4byte 0x1080400
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x2cc
    .4byte 0x1080501
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x2ce
    .4byte 0x10a0402
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x2d0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xe200e1c
    .4byte 0xe9c0e24
    .4byte 0xea40ea0
    .4byte 0xf200f1c
    .4byte 0x800f24
    .4byte 0x3100a00
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x304
    .4byte 0x1120b01
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x316
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x7480cd0
    .4byte 0x7c80000
    .4byte 0xce40000
    .4byte 0xcd00cd4
    .4byte 0x40004
    .4byte 0x370036c
    .4byte 0x3780374
    .4byte 0x3f003ec
    .4byte 0x3f803f0
    .4byte 0x470046c
    .4byte 0x4780474
    .4byte 0x4
    .4byte 0x1071400
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x348
    .4byte 0x2060401
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x34a
    .4byte 0x1050102
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x356
    .4byte 0x1030103
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x358
    .4byte 0x1030204
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x35a
    .4byte 0x4151205
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x35c
    .4byte 0x1041306
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x374
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xb940b90
    .4byte 0xc100b98
    .4byte 0xc180c14
    .4byte 0xb940b90
    .4byte 0xc100b98
    .4byte 0xc180c14
    .4byte 0xe040e04
    .4byte 0x30a0000
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x3d8
    .4byte 0x30e0a01
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x3e4
    .4byte 0x10b0102
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x3f0
    .4byte 0x10f0b03
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x3f2
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xb4c0b68
    .4byte 0xd980d98
    .4byte 0xd980d98
    .4byte 0x2090a00
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x430
    .4byte 0x1070a01
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x434
    .4byte 0x1060b02
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x436
    .4byte 0x1060c03
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x438
    .4byte 0x1080d04
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x43a
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1040104
    .4byte 0xbc00104
    .4byte 0xb440bc0
    .4byte 0x1080300
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x484
    .4byte 0x10b0c01
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x486
    .4byte 0x1051102
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x488
    .4byte 0x10b0403
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x48a
    .4byte 0x20d1104
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x48c
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xe180e18
    .4byte 0xc180c18
    .4byte 0x10a0600
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x4d8
    .4byte 0x10c0501
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x4da
    .4byte 0x10a0602
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x4dc
    .4byte 0x10c0503
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x4de
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x6a806a8
    .4byte 0x6a806a8
    .4byte 0x6a8
    .4byte 0xce40000
    .4byte 0xc480c48
    .4byte 0xc48
    .4byte 0x0
    .4byte 0xc440c40
    .4byte 0xc44
    .4byte 0x0
    .4byte 0x1840c40
    .4byte 0xc40
    .4byte 0x0
    .4byte 0xc480c40
    .4byte 0xc44
    .4byte 0x0
    .4byte 0x1840c40
    .4byte 0xc40
    .4byte 0x0
    .4byte 0xc480c40
    .4byte 0xc44
    .4byte 0x0
    .4byte 0xc440c40
    .4byte 0xc44
    .4byte 0x0
    .4byte 0xc400000
    .4byte 0x0
    .4byte 0x0
    .4byte 0xcd80000
    .4byte 0x0
    .4byte 0xcd00804
    .4byte 0xc4c0604
    .4byte 0xc480c44
    .4byte 0xc440c40
    .4byte 0xc400c44
    .4byte 0xc440c44
    .4byte 0xc440c40
    .4byte 0xc400c44
    .4byte 0xc440c44
    .4byte 0xc400000
    .4byte 0xcd00000
    .4byte 0x6a80cd8
    .4byte 0x6a806a8
    .4byte 0xcc806a8
    .4byte 0xc480c48
    .4byte 0xc440c48
    .4byte 0x1840c44
    .4byte 0xc400c40
    .4byte 0xc480c44
    .4byte 0xc400c44
    .4byte 0xc440c44
    .4byte 0xc44
    .4byte 0xc40
    .4byte 0xcd00000
    .4byte 0x6a806a8
    .4byte 0x6a806a8
    .4byte 0x6a806a8
    .4byte 0xc4c0730
    .4byte 0x1840c48
    .4byte 0x1840c4c
    .4byte 0xc480c4c
    .4byte 0xc440c40
    .4byte 0xc440c48
    .4byte 0xc440c48
    .4byte 0xd480c44
    .4byte 0xc440c44
    .4byte 0xc440c44
    .4byte 0xc440c44
    .4byte 0xc440c44
    .4byte 0xc440c44
    .4byte 0xc440c44
    .4byte 0xc44
    .4byte 0x0
    .4byte 0xc40
    .4byte 0x0
    .4byte 0x6a806a8
    .4byte 0x6a806a8
    .4byte 0xc480c4c
    .4byte 0xc480c48
    .4byte 0x1840c40
    .4byte 0xc440c40
    .4byte 0xc480c40
    .4byte 0xc440c44
    .4byte 0xc440c40
    .4byte 0xc440c44
    .4byte 0xc400000
    .4byte 0x0
    .4byte 0x1040104
    .4byte 0x8040000
    .4byte 0x6040cd0
    .4byte 0xc4c08a4
    .4byte 0xc480c44
    .4byte 0xc440ce4
    .4byte 0xc440c44
    .4byte 0xc400000
    .4byte 0xc440c44
    .4byte 0xc400000
    .4byte 0xc440c44
    .4byte 0xc400000
    .4byte 0xc440c44
    .4byte 0x1040104
    .4byte 0x1040104
    .4byte 0x6001300
    .4byte 0xa
    .4byte gUnknown_08A1E0D8 + 0x528
    .4byte 0x30b1501
    .4byte 0x7
    .4byte gUnknown_08A1E0D8 + 0x5a0
    .4byte 0x2021102
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x5ca
    .4byte 0x40e1003
    .4byte 0x6
    .4byte gUnknown_08A1E0D8 + 0x5ce
    .4byte 0x10e0a04
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x5fe
    .4byte 0x7130605
    .4byte 0x6
    .4byte gUnknown_08A1E0D8 + 0x600
    .4byte 0x40e0106
    .4byte 0x6
    .4byte gUnknown_08A1E0D8 + 0x654
    .4byte 0x1031607
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x684
    .4byte 0x1051608
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x686
    .4byte 0x40b1409
    .4byte 0x6
    .4byte gUnknown_08A1E0D8 + 0x688
    .4byte 0x110120a
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x6b8
    .4byte 0x114080b
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x6ba
    .4byte 0x110020c
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x6bc
    .4byte 0x1140a0d
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x6be
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xecc0ec8
    .4byte 0xf480ed0
    .4byte 0xf500f4c
    .4byte 0xfcc0fc8
    .4byte 0xe500fd0
    .4byte 0x30c0000
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x774
    .4byte 0x10e0101
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x786
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xc400740
    .4byte 0xc440000
    .4byte 0xc4008a4
    .4byte 0x7b0
    .4byte 0xc44
    .4byte 0x40004
    .4byte 0xc400004
    .4byte 0xf680004
    .4byte 0xfdc068c
    .4byte 0x9c00000
    .4byte 0xc2c
    .4byte 0x2030300
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x7ac
    .4byte 0x30a0201
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x7b4
    .4byte 0x10c0302
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x7c0
    .4byte 0x1011403
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x7c2
    .4byte 0x1031404
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x7c4
    .4byte 0x1040105
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x7c6
    .4byte 0x1051406
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x7c8
    .4byte 0x1020d07
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x7ca
    .4byte 0x2020e08
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x7ce
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x9c001c
    .4byte 0x110002c
    .4byte 0x1140094
    .4byte 0xe0c0e0c
    .4byte 0x10e0400
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x850
    .4byte 0x30d0f01
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x856
    .4byte 0x1020c02
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x85c
    .4byte 0x1140103
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x85e
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x40004
    .4byte 0x40004
    .4byte 0x40004
    .4byte 0xb440b40
    .4byte 0x10b0200
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x8a8
    .4byte 0x10c0301
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x8aa
    .4byte 0x10b0402
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x8ac
    .4byte 0x10a1b03
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x8ae
    .4byte 0x10c1b04
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x8b0
    .4byte 0x10e1b05
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x8b2
    .4byte 0x10f0306
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x8b4
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xc500cd4
    .4byte 0xdd00d50
    .4byte 0x40004
    .4byte 0x1130400
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x924
    .4byte 0x1131201
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x928
    .4byte 0x1121502
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x92c
    .4byte 0x1120203
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x92e
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xcd40cd0
    .4byte 0xcd40cd0
    .4byte 0x7a8
    .4byte 0xcd40ce4
    .4byte 0xcd80cd0
    .4byte 0x1040104
    .4byte 0x104
    .4byte 0x2110c00
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x978
    .4byte 0x2010d01
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x980
    .4byte 0x1030c02
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x988
    .4byte 0x1010703
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x98c
    .4byte 0x1011204
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x98e
    .4byte 0x1011705
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x990
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xe880e84
    .4byte 0xf040e8c
    .4byte 0xf0c0f08
    .4byte 0xf880f84
    .4byte 0xe840f8c
    .4byte 0xe8c0e88
    .4byte 0xf080f04
    .4byte 0xf840f0c
    .4byte 0xf8c0f88
    .4byte 0xf800f80
    .4byte 0x800080
    .4byte 0xf800f80
    .4byte 0x3000800
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x9e8
    .4byte 0x30a0301
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x9fa
    .4byte 0x1010502
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xa0c
    .4byte 0x1000603
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xa0e
    .4byte 0x1020904
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xa10
    .4byte 0x10c0405
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xa12
    .4byte 0x10e0806
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xa14
    .4byte 0x10e0907
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xa16
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_0867EEB4 + 0x19b8
    .4byte 0x0
    .4byte 0x0
    .4byte 0x64c0768
    .4byte gUnknown_0867EEB4 + 0x17b4
    .4byte 0x7680000
    .4byte 0x7e807ec
    .4byte 0x6e40378
    .4byte gUnknown_0867EEB4 + 0x1938
    .4byte 0x768
    .4byte 0x3f003ec
    .4byte 0x3f803f4
    .4byte 0x76807ec
    .4byte 0x46c0468
    .4byte 0x4740470
    .4byte 0x47c0478
    .4byte 0x4e80768
    .4byte 0x6780584
    .4byte 0x4f80598
    .4byte 0x76804fc
    .4byte 0x60403e4
    .4byte 0x6100598
    .4byte 0x4600608
    .4byte 0x4640768
    .4byte 0x4f406f4
    .4byte 0x4f404f4
    .4byte 0x76804e0
    .4byte 0x6f40464
    .4byte 0x58c04f4
    .4byte 0x4e00678
    .4byte 0x4640768
    .4byte 0x4f406f4
    .4byte 0x674060c
    .4byte 0x76804e0
    .4byte 0x6f40464
    .4byte 0x58c04f4
    .4byte 0x4e00678
    .4byte 0x4640768
    .4byte 0x4f406f4
    .4byte 0x674060c
    .4byte 0x76804e0
    .4byte 0x0
    .4byte gUnknown_086BDA5C + 0x25a4
    .4byte 0x868
    .4byte 0x0
    .4byte 0x0
    .4byte 0x64c086c
    .4byte gUnknown_0867EEB4 + 0x17b4
    .4byte 0x0
    .4byte _banim_pal_end + 0x548c
    .4byte 0x37807e8
    .4byte 0x7ec06e4
    .4byte 0x868
    .4byte gUnknown_086BDA5C + 0x2e94
    .4byte 0x3f003ec
    .4byte 0x3f803f4
    .4byte gUnknown_0867EEB4 + 0x1938
    .4byte 0x4680868
    .4byte 0x470046c
    .4byte 0x4780474
    .4byte 0x7ec047c
    .4byte 0x4e8086c
    .4byte 0x6780584
    .4byte 0x4f80598
    .4byte 0x7ec04fc
    .4byte 0x3e4076c
    .4byte 0x5980604
    .4byte 0x6080610
    .4byte 0x460
    .4byte 0x4640000
    .4byte 0x4f406f4
    .4byte 0x4f404f4
    .4byte 0x4e0
    .4byte 0x4640000
    .4byte 0x4f406f4
    .4byte 0x678058c
    .4byte 0x7ec04e0
    .4byte 0x4640000
    .4byte 0x4f406f4
    .4byte 0x674060c
    .4byte 0x76804e0
    .4byte 0x4640000
    .4byte 0x4f406f4
    .4byte 0x678058c
    .4byte 0x76804e0
    .4byte 0x4640000
    .4byte 0x4f406f4
    .4byte 0x674060c
    .4byte 0x76804e0
    .4byte 0x3e40000
    .4byte 0x59806f4
    .4byte 0x4f40598
    .4byte 0x76804e0
    .4byte 0x3e4086c
    .4byte 0x67005a0
    .4byte 0x5a00610
    .4byte 0x3e0
    .4byte 0x4cc0000
    .4byte 0x3d403d0
    .4byte 0x4540450
    .4byte 0x768054c
    .4byte 0x5d00868
    .4byte 0x75c05d4
    .4byte 0x5e00760
    .4byte 0x7ec05e4
    .4byte 0x650086c
    .4byte 0x6580654
    .4byte 0x660065c
    .4byte gUnknown_086BDA5C + 0x2c08
    .4byte 0x7ec0000
    .4byte 0x6d806d4
    .4byte 0x6e006dc
    .4byte 0x7e8
    .4byte 0x0
    .4byte 0x96807ec
    .4byte 0x7e80968
    .4byte 0x0
    .4byte 0x59c0618
    .4byte 0x61c059c
    .4byte 0x59c0618
    .4byte 0x61c059c
    .4byte 0x76c0000
    .4byte 0x4640000
    .4byte 0x3e0
    .4byte 0x3e40000
    .4byte 0x59c0618
    .4byte 0x61c059c
    .4byte 0x868
    .4byte 0x0
    .4byte gUnknown_0867EEB4 + 0x19b8
    .4byte gUnknown_0867EEB4 + 0x19b4
    .4byte gUnknown_086BDA5C + 0x25a4
    .4byte 0x668064c
    .4byte 0x7ec047c
    .4byte gUnknown_086BDA5C + 0x2d8c
    .4byte 0x6e40378
    .4byte 0x7ec04fc
    .4byte 0x3ec07e8
    .4byte 0x3f403f0
    .4byte 0x7ec0460
    .4byte 0x46c0468
    .4byte 0x4740470
    .4byte 0x4e0
    .4byte 0x5a004e8
    .4byte 0x5980578
    .4byte 0x4e0
    .4byte 0x6f80568
    .4byte 0x4f404f4
    .4byte 0x4e0
    .4byte 0x6f405e8
    .4byte 0x58c04f4
    .4byte 0x59c0618
    .4byte 0x6f4061c
    .4byte 0x60c04f4
    .4byte 0x4e0
    .4byte 0x6f40464
    .4byte 0x58c04f4
    .4byte 0x4e0
    .4byte 0x6f403e4
    .4byte 0x60c04f4
    .4byte 0x3e0
    .4byte 0x6f40464
    .4byte 0x4f404f4
    .4byte 0x54c
    .4byte 0x5a003e4
    .4byte 0x4f40670
    .4byte 0x7ec05e4
    .4byte 0x3d004cc
    .4byte 0x55c0560
    .4byte 0x7ec0664
    .4byte 0x5d405d0
    .4byte 0x5dc05d8
    .4byte 0x7e8
    .4byte 0x6540650
    .4byte 0x65c0658
    .4byte 0x0
    .4byte 0x6d407ec
    .4byte 0x6dc06d8
    .4byte 0x7070e00
    .4byte 0xc
    .4byte gUnknown_08A1E0D8 + 0xa84
    .4byte 0x8000901
    .4byte 0x13
    .4byte gUnknown_08A1E0D8 + 0xb2c
    .4byte 0x4070702
    .4byte 0x5
    .4byte gUnknown_08A1E0D8 + 0xc5c
    .4byte 0x6020f03
    .4byte 0x11
    .4byte gUnknown_08A1E0D8 + 0xc84
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xb940b90
    .4byte 0xc100b84
    .4byte 0xc040c14
    .4byte 0x80
    .4byte 0x3040400
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0xd8c
    .4byte 0x1050501
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xd98
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xe200e1c
    .4byte 0xe9c0e24
    .4byte 0xea40ea0
    .4byte 0xf200f1c
    .4byte 0xe1c0f24
    .4byte 0xe240e20
    .4byte 0xea00e9c
    .4byte 0xf1c0ea4
    .4byte 0xf240f20
    .4byte 0x800080
    .4byte 0x100028
    .4byte 0x2c
    .4byte 0x3100300
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0xdc0
    .4byte 0x30b1001
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0xdd2
    .4byte 0x1120402
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xde4
    .4byte 0x10d1103
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xde6
    .4byte 0x1110a04
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0xde8
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x6840680
    .4byte 0x6800684
    .4byte 0x6840684
    .4byte 0x80c0980
    .4byte 0x9840890
    .4byte 0x80c0a94
    .4byte 0x88c0984
    .4byte 0x904088c
    .4byte 0x88c088c
    .4byte 0x80c0980
    .4byte 0x984080c
    .4byte 0x8100888
    .4byte 0x6840680
    .4byte 0x6800684
    .4byte 0x6840684
    .4byte 0x40004
    .4byte 0x40004
    .4byte 0x4
    .4byte 0x3070d00
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0xe38
    .4byte 0x30c0601
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0xe44
    .4byte 0x30c1402
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0xe56
    .4byte 0x3140d03
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0xe68
    .4byte 0x1120d04
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xe74
    .4byte 0x1120f05
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xe76
    .4byte 0x1010306
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xe78
    .4byte 0x1011b07
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xe7a
    .4byte 0x1120e08
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xe7c
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xc400740
    .4byte 0xc440000
    .4byte 0xc4008a4
    .4byte 0x7b0
    .4byte 0xc44
    .4byte 0x40004
    .4byte 0x4
    .4byte 0x2030300
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0xf04
    .4byte 0x30a0201
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0xf0c
    .4byte 0x10c0302
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xf18
    .4byte 0x1021403
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xf1a
    .4byte 0x1041404
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xf1c
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x9c001c
    .4byte 0x110002c
    .4byte 0x1140094
    .4byte 0x10e0400
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0xf68
    .4byte 0x30d0f01
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xf6e
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x40004
    .4byte 0xb440b40
    .4byte 0x40004
    .4byte 0x10c0200
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xfa4
    .4byte 0x10c0401
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xfa6
    .4byte 0x10f0302
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0xfa8
    .4byte 0x10c1b03
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xfac
    .4byte 0x10a1b04
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0xfae
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x110
    .4byte 0x1030a00
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1034
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1100110
    .4byte 0x1090600
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x105c
    .4byte 0x10e0e01
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x105e
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x8d4
    .4byte 0x8cc
    .4byte 0x140018
    .4byte 0x8d4
    .4byte 0x8cc
    .4byte 0x140018
    .4byte 0x1100110
    .4byte 0x8d4
    .4byte 0x8cc
    .4byte 0x140018
    .4byte 0x1c08c8
    .4byte banim_swmm_sw1_sheet_1 + 0x11c
    .4byte banim_data + 0x14
    .4byte 0x140000
    .4byte banim_forf_sw1_sheet_2 + 0x8b8
    .4byte 0x6c8001c
    .4byte 0x1c08c4
    .4byte 0x8c0
    .4byte 0x14
    .4byte 0x8c8
    .4byte 0x8c4
    .4byte 0x140018
    .4byte 0x1c08c8
    .4byte 0x1c08c4
    .4byte 0x140000
    .4byte 0x1c08c8
    .4byte 0x1c08c4
    .4byte 0x140000
    .4byte banim_fakf_sp1_sheet_4 + 0x92c
    .4byte banim_genm_al1_sheet_blank_2 + 0x158
    .4byte 0x180000
    .4byte banim_fakf_sp1_sheet_4 + 0x830
    .4byte banim_genm_al1_sheet_blank_2 + 0x158
    .4byte 0x180000
    .4byte banim_fakf_sp1_sheet_4 + 0x830
    .4byte banim_genm_al1_sheet_blank_2 + 0x158
    .4byte 0x180000
    .4byte 0x6c80014
    .4byte banim_data + 0x6c4
    .4byte 0x180844
    .4byte banim_forf_sw1_sheet_2 + 0x8d0
    .4byte banim_swmm_sw1_sheet_0 + 0xb28
    .4byte 0x1c
    .4byte 0x1100014
    .4byte 0x2030500
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1084
    .4byte 0x2000801
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1090
    .4byte 0x1010a02
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x109c
    .4byte 0x1010c03
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x109e
    .4byte 0x2080404
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x10a0
    .4byte 0x3060905
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x10ac
    .4byte 0x3060e06
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x10be
    .4byte 0x20b0707
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x10d0
    .4byte 0x2090d08
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x10dc
    .4byte 0x2091109
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x10e8
    .4byte 0x112020a
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x10f4
    .4byte 0x210040b
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x10f6
    .4byte 0x210070c
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1102
    .4byte 0x2100a0d
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x110e
    .4byte 0x210100e
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x111a
    .4byte 0x210120f
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1126
    .4byte 0x1011310
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1132
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x940094
    .4byte 0x940094
    .4byte 0x940094
    .4byte 0x940094
    .4byte 0x940094
    .4byte 0x940094
    .4byte 0x940094
    .4byte 0x940094
    .4byte 0x940094
    .4byte 0x94
    .4byte 0x94
    .4byte 0x94
    .4byte 0x94
    .4byte 0x94
    .4byte 0x94
    .4byte 0x94
    .4byte 0x94
    .4byte 0x94
    .4byte 0x940094
    .4byte 0x940094
    .4byte 0x940094
    .4byte 0x940094
    .4byte 0x940094
    .4byte 0x94
    .4byte 0x10d0900
    .4byte 0x7
    .4byte gUnknown_08A1E0D8 + 0x120c
    .4byte 0x10c1101
    .4byte 0x8
    .4byte gUnknown_08A1E0D8 + 0x121a
    .4byte 0x2041602
    .4byte 0xb
    .4byte gUnknown_08A1E0D8 + 0x122a
    .4byte 0x1020c03
    .4byte 0x4
    .4byte gUnknown_08A1E0D8 + 0x1256
    .4byte 0x3020404
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x125e
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x110
    .4byte 0x1080b00
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x12b4
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xdd0
    .4byte 0x2030400
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x12e8
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xd18
    .4byte 0x654
    .4byte 0xfbc0e3c
    .4byte 0x20d0900
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1304
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xd180004
    .4byte 0xe3c0000
    .4byte 0xeb80fb8
    .4byte 0xfbc0eb8
    .4byte 0xc180c18
    .4byte 0xc18
    .4byte 0xe3c0e3c
    .4byte 0xd18
    .4byte 0xfb80e3c
    .4byte 0xeb80004
    .4byte 0xfbc0eb8
    .4byte 0xfbc0eb8
    .4byte 0x40ebc
    .4byte 0xeb80d18
    .4byte 0xfb80e3c
    .4byte 0x1020100
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1328
    .4byte 0x2010301
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x132a
    .4byte 0x1070102
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1332
    .4byte 0x2060803
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1334
    .4byte 0x3000e04
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x1338
    .4byte 0x2030f05
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x1344
    .4byte 0x1031106
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x134c
    .4byte 0x1081107
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x134e
    .4byte 0x10a0808
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x1350
    .4byte 0x10f0109
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x1354
    .4byte 0x116010a
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1358
    .4byte 0x10f0f0b
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x135a
    .4byte 0x20d110c
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x135c
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xd18
    .4byte 0x650
    .4byte 0xfbc0e3c
    .4byte 0xebc0dac
    .4byte 0x5d40c20
    .4byte 0xd980ebc
    .4byte 0xfbc0000
    .4byte 0x40000
    .4byte 0xc240004
    .4byte 0x5d40ebc
    .4byte 0xebc
    .4byte 0xc240fbc
    .4byte 0xc900ebc
    .4byte 0xebc05d4
    .4byte 0x0
    .4byte 0xfbc
    .4byte 0xeb80c94
    .4byte 0xeb80000
    .4byte 0xeb80000
    .4byte 0xebc0c24
    .4byte 0xebc05d4
    .4byte 0xfbc0000
    .4byte 0xc180c18
    .4byte 0xd9c0d9c
    .4byte 0xe3c0e3c
    .4byte 0xd18
    .4byte 0x654
    .4byte 0xfbc0e3c
    .4byte 0xd18
    .4byte 0x654
    .4byte 0xfbc0e3c
    .4byte 0xd18
    .4byte 0x654
    .4byte 0xfbc0e3c
    .4byte 0xebc0c24
    .4byte 0x5d40c90
    .4byte 0xebc
    .4byte 0xfbc0000
    .4byte 0xeb80000
    .4byte 0xebc0d18
    .4byte 0xec40654
    .4byte 0xdac0000
    .4byte 0xc900ebc
    .4byte 0xebc05d4
    .4byte 0x0
    .4byte 0xfbc
    .4byte 0xebc0c24
    .4byte 0xebc05d4
    .4byte 0xfbc0000
    .4byte 0xebc0c94
    .4byte 0xebc0000
    .4byte 0xeb80000
    .4byte 0xebc0c24
    .4byte 0xebc05d4
    .4byte 0xfbc0000
    .4byte 0x2030400
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x140c
    .4byte 0x3020c01
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1418
    .4byte 0x1021202
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x142a
    .4byte 0x11a0103
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x142c
    .4byte 0x2090104
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x142e
    .4byte 0x3090705
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x143a
    .4byte 0x2090c06
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x144c
    .4byte 0x20d0107
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1458
    .4byte 0x2090408
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1464
    .4byte 0x20d0609
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1470
    .4byte 0x20d0b0a
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x147c
    .4byte 0x211040b
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1488
    .4byte 0x310070c
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x1494
    .4byte 0x2100e0d
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x14a6
    .4byte 0x30f100e
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x14b2
    .4byte 0x214060f
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x14c4
    .4byte 0x2140b10
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x14d0
    .4byte 0x2180911
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x14dc
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x40004
    .4byte 0xe140004
    .4byte 0xebc
    .4byte 0xebc
    .4byte 0xeb80eb8
    .4byte 0xeb80d18
    .4byte 0xfbc0654
    .4byte 0x0
    .4byte 0x1040400
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x15cc
    .4byte 0x10a0d01
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x15ce
    .4byte 0x1151102
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x15d0
    .4byte 0x2060003
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x15d2
    .4byte 0x2050804
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x15de
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xd18
    .4byte 0xfbc0e3c
    .4byte 0xfbc0ebc
    .4byte 0xebc
    .4byte 0x2010700
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x1634
    .4byte 0x1041101
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x163c
    .4byte 0x1071002
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1640
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xc180004
    .4byte 0xe3c0c18
    .4byte 0xc940e3c
    .4byte 0xc900ebc
    .4byte 0xebc0000
    .4byte 0x0
    .4byte 0x10b0500
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1674
    .4byte 0x2110e01
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x1676
    .4byte 0x3041002
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x167e
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x25c06cc
    .4byte 0x2dc06cc
    .4byte 0x2dc06cc
    .4byte 0x6cc06cc
    .4byte 0x6cc0358
    .4byte 0x2dc06cc
    .4byte 0x6cc06cc
    .4byte 0x6cc06cc
    .4byte 0x6cc06cc
    .4byte 0x2d802dc
    .4byte 0x6cc02d8
    .4byte 0x35806cc
    .4byte 0x2d8
    .4byte 0x35806cc
    .4byte 0x6cc06cc
    .4byte 0x6cc0358
    .4byte 0x2dc06cc
    .4byte 0x6cc06cc
    .4byte 0x6cc02dc
    .4byte 0x2dc06cc
    .4byte 0x6cc06cc
    .4byte 0x6cc02dc
    .4byte 0x2dc06cc
    .4byte 0x6cc06cc
    .4byte 0x6cc0000
    .4byte 0x6cc06cc
    .4byte 0x2d80358
    .4byte 0x6cc02d8
    .4byte 0x6cc
    .4byte 0x0
    .4byte 0x6cc0000
    .4byte 0x6cc06cc
    .4byte 0x6cc06cc
    .4byte 0x6cc06cc
    .4byte 0x6cc
    .4byte 0x6cc
    .4byte 0x2dc06cc
    .4byte 0xdb00004
    .4byte 0xd28
    .4byte 0x20f0000
    .4byte 0x3
    .4byte gUnknown_08A1E0D8 + 0x16bc
    .4byte 0x30a0001
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x16c8
    .4byte 0x7030002
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x16d4
    .4byte 0x1130503
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x16f0
    .4byte 0x30f0904
    .4byte 0x4
    .4byte gUnknown_08A1E0D8 + 0x16f4
    .4byte 0x3090905
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x170c
    .4byte 0x3060906
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1718
    .4byte 0x30b0c07
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x171e
    .4byte 0x2140b08
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x172a
    .4byte 0x50d0f09
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x172e
    .4byte 0x307100a
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1742
    .4byte 0x210040b
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x1748
    .4byte 0x10c040c
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1750
    .4byte 0x205100d
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1752
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xb700734
    .4byte 0x7340730
    .4byte 0x7300b70
    .4byte 0x3050100
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x180c
    .4byte 0x30b0f01
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1812
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x4
    .4byte 0x1020900
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x183c
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x8100810
    .4byte 0x8100810
    .4byte 0x1000100
    .4byte 0x1000100
    .4byte 0x8100810
    .4byte 0x8100810
    .4byte 0x1000100
    .4byte 0x1000100
    .4byte 0x8100810
    .4byte 0x8100810
    .4byte 0x10a0e00
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1870
    .4byte 0x10a0d01
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1872
    .4byte 0x10a0c02
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1874
    .4byte 0x10a0b03
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1876
    .4byte 0x10b0e04
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1878
    .4byte 0x10b0d05
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x187a
    .4byte 0x10b0c06
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x187c
    .4byte 0x10b0b07
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x187e
    .4byte 0x10c0e08
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1880
    .4byte 0x10c0d09
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1882
    .4byte 0x10c0c0a
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1884
    .4byte 0x10c0b0b
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1886
    .4byte 0x10d0e0c
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1888
    .4byte 0x10d0d0d
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x188a
    .4byte 0x10d0c0e
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x188c
    .4byte 0x10d0b0f
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x188e
    .4byte 0x10e0e10
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1890
    .4byte 0x10e0d11
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1892
    .4byte 0x10e0c12
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1894
    .4byte 0x10e0b13
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1896
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xc440c40
    .4byte 0x2070700
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x1994
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0x7880780
    .4byte 0x7880780
    .4byte 0x2061200
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x19b0
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xe680de8
    .4byte 0xe640de4
    .4byte 0x1020500
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x19d0
    .4byte 0x1020901
    .4byte 0x2
    .4byte gUnknown_08A1E0D8 + 0x19d4
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0
    .4byte 0xb440b40
    .4byte 0xb44
    .4byte 0x3070600
    .4byte 0x1
    .4byte gUnknown_08A1E0D8 + 0x19fc
    .4byte 0xff
    .4byte 0x0
    .4byte 0x0

	.global gUnknown_08A1FAF4
gUnknown_08A1FAF4:  @ 0x08A1FAF4
	.incbin "baserom.gba", 0xA1FAF4, 0x4

	.global gUnknown_08A1FAF8
gUnknown_08A1FAF8:  @ 0x08A1FAF8
	.incbin "baserom.gba", 0xA1FAF8, 0x10

	.global gUnknown_08A1FB08
gUnknown_08A1FB08:  @ 0x08A1FB08
	.incbin "baserom.gba", 0xA1FB08, 0x28

	.global gUnknown_08A1FB30
gUnknown_08A1FB30:  @ 0x08A1FB30
	.incbin "baserom.gba", 0xA1FB30, 0x4

	.global gUnknown_08A1FB34
gUnknown_08A1FB34:  @ 0x08A1FB34
@ replacing .incbin "baserom.gba", 0x00a1fb34, 0x4
.4byte end + 0x48
