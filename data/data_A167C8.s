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
        .word AtMenu_LockGame
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
        .word AtMenu_Reinitialize
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
        .word EnablePrepScreenMenu
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
        .word AtMenu_Reinitialize
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
        .word AtMenu_StartSubmenu
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word AtMenu_OnSubmenuEnd
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
        .word AtMenu_Reinitialize
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
        .word AtMenu_Reinitialize
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
        .word EndAllProcChildren
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
        .word AtMenu_LockGame
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
        .word PrepScreenMenu_OnInit
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word PrepScreenMenu_OnEnd
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word PrepScreenMenu_OnLoop_0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word PrepScreenMenu_OnActiveLoop
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word PrepScreenMenu_OnLoop_2
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
        .word ProcPrepUnit_OnEnd
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ProcPrepUnit_OnInit
        @ PROC_CALL
        .short 0x2, 0x0
        .word ProcPrepUnit_InitScreen
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
        .word ProcPrepUnit_Idle
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
        .word ProcPrepUnit_InitScreen
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
        .word ProcPrepUnit_InitScreen
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
        .word ProcPrepUnit_OnGameStart
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
        .word PrepItemUse_InitDisplay
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
        .word PrepItemUse_HandleItemEffect
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
        .word PrepItemUse_InitDisplay
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
        .word PrepItemBooster_OnEnd
        @ PROC_CALL
        .short 0x2, 0x0
        .word PrepItemBooster_OnInit
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word PrepItemBooster_Idle
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A191C4
gUnknown_08A191C4:  @ 0x08A191C4
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word PrepJunaEffect_OnEnd
        @ PROC_CALL
        .short 0x2, 0x0
        .word PrepJunaEffect_OnInit
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
    .incbin "baserom.gba", 0xA1983C, 0x14

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
    .4byte 0x8A708A7 + 0xa5
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

	.global Pal_MapBattleInfoNum
Pal_MapBattleInfoNum:  @ 0x08A1D79C
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
