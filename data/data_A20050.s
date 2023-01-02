    .section .data

	.global gUnknown_08A20050
gUnknown_08A20050:  @ 0x08A20050
	.incbin "baserom.gba", 0xA20050, 0x18

	.global gUnknown_08A20068
gUnknown_08A20068:  @ 0x08A20068
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A9D84
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A9DBC
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20098
gUnknown_08A20098:  @ 0x08A20098
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA100
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA118
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_SaveMenu
ProcScr_SaveMenu:  @ 0x08A200B8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205dd4
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A8C2C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ProcSaveMenu_InitScreen
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A8F04
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_WHILE
        .short 0x14, 0x0
        .word MusicProc4Exists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A9014
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_savemenu
        @ PROC_GOTO
        .short 0xc, 0xf
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA1EC
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AD5B4
        @ PROC_CALL
        .short 0x2, 0x0
        .word NewNewGameDifficultySelect
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA30C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA1EC
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA458
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA47C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A9494
        @ PROC_GOTO
        .short 0xc, 0xf
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A96D0
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A96DC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A96EC
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A99C0
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA4B4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A9A18
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A9A68
        @ PROC_LABEL
        .short 0xb, 0x9
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A9AB0
        @ PROC_LABEL
        .short 0xb, 0xc
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A9A08
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A9AF4
        @ PROC_LABEL
        .short 0xb, 0xd
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A9B44
        @ PROC_LABEL
        .short 0xb, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A9B90
        @ PROC_LABEL
        .short 0xb, 0xb
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA49C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A9E1C
        @ PROC_LABEL
        .short 0xb, 0xe
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_WHILE
        .short 0x14, 0x0
        .word IsMusicProc2Running
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA158
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A8C2C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ProcSaveMenu_InitScreen
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A8F04
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_WHILE
        .short 0x14, 0x0
        .word IsMusicProc2Running
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA1BC
        @ PROC_LABEL
        .short 0xb, 0x15
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x12
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_GOTO
        .short 0xc, 0xf
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x11
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_LABEL
        .short 0xb, 0xf
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA030
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A203A8
gUnknown_08A203A8:  @ 0x08A203A8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205dd4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A8F8C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A8AF0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ProcSaveMenu_InitScreen
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA4F8
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x14
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A9494
        @ PROC_GOTO
        .short 0xc, 0xf
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80A96DC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80A96EC
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x12
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_GOTO
        .short 0xc, 0xf
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x11
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_LABEL
        .short 0xb, 0xf
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA030
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A204B8
gUnknown_08A204B8:  @ 0x08A204B8
@ replacing .incbin "baserom.gba", 0x00a204b8, 0x4
.4byte gUnknown_02000948 + 0x20

	.global gUnknown_08A204BC
gUnknown_08A204BC:  @ 0x08A204BC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA550
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA614
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AA69C
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA658
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AA69C
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA6D8
        @ PROC_LABEL
        .short 0xb, 0xa
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2051C
gUnknown_08A2051C:  @ 0x08A2051C
	.incbin "baserom.gba", 0xA2051C, 0x1A

	.global gUnknown_08A20536
gUnknown_08A20536:  @ 0x08A20536
	.incbin "baserom.gba", 0xA20536, 0x3A

	.global gUnknown_08A20570
gUnknown_08A20570:  @ 0x08A20570
	.incbin "baserom.gba", 0xA20570, 0x8

	.global gUnknown_08A20578
gUnknown_08A20578:  @ 0x08A20578
	.incbin "baserom.gba", 0xA20578, 0x8

	.global gUnknown_08A20580
gUnknown_08A20580:  @ 0x08A20580
	.incbin "baserom.gba", 0xA20580, 0x8

	.global gUnknown_08A20588
gUnknown_08A20588:  @ 0x08A20588
	.incbin "baserom.gba", 0xA20588, 0x8

	.global gUnknown_08A20590
gUnknown_08A20590:  @ 0x08A20590
	.incbin "baserom.gba", 0xA20590, 0xC0

	.global gUnknown_08A20650
gUnknown_08A20650:  @ 0x08A20650
@ replacing .incbin "baserom.gba", 0x00a20650, 0x2c
.4byte gUnknown_08A20590 + 0xe
.4byte gUnknown_08A20590 + 0x16
.4byte gUnknown_08A20590 + 0x1e
.4byte gUnknown_08A20590 + 0x26
.4byte gUnknown_08A20590 + 0x2e
.4byte gUnknown_08A20590 + 0x36
.4byte gUnknown_08A20590 + 0x3e
.4byte gUnknown_08A20590 + 0x46
.4byte gUnknown_08A20590 + 0x4e
.4byte gUnknown_08A20590 + 0x56
.4byte gUnknown_08A20590 + 0x5e

	.global gUnknown_08A2067C
gUnknown_08A2067C:  @ 0x08A2067C
@ replacing .incbin "baserom.gba", 0x00a2067c, 0x2c
.4byte gUnknown_08A20590 + 0x66
.4byte gUnknown_08A20590 + 0x6e
.4byte gUnknown_08A20590 + 0x76
.4byte gUnknown_08A20590 + 0x7e
.4byte gUnknown_08A20590 + 0x86
.4byte gUnknown_08A20590 + 0x8e
.4byte gUnknown_08A20590 + 0x96
.4byte gUnknown_08A20590 + 0x9e
.4byte gUnknown_08A20590 + 0xa6
.4byte gUnknown_08A20590 + 0xae
.4byte gUnknown_08A20590 + 0xb6

	.global gUnknown_08A206A8
gUnknown_08A206A8:  @ 0x08A206A8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205de0
        @ PROC_MARK
        .short 0xf, 0xc
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80AAA6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AAA78
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AB2A0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A206D8
gUnknown_08A206D8:  @ 0x08A206D8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205df4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AB314
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AB340
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A206F8
gUnknown_08A206F8:  @ 0x08A206F8
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8014E3C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AB720
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AA9D8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20720
gUnknown_08A20720:  @ 0x08A20720
	.incbin "baserom.gba", 0xA20720, 0x1C

	.global gUnknown_08A2073C
gUnknown_08A2073C:  @ 0x08A2073C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205e04
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80ABAB4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2075C
gUnknown_08A2075C:  @ 0x08A2075C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205e0c
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80ABBE4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA2077C, 0x220

	.global gUnknown_08A2099C
gUnknown_08A2099C:  @ 0x08A2099C
@ replacing .incbin "baserom.gba", 0x00a2099c, 0x1c
.4byte gUnknown_08A2075C + 0xee
.4byte gUnknown_08A2075C + 0x108
.4byte gUnknown_08A2075C + 0x122
.4byte gUnknown_08A2075C + 0x13c
.4byte gUnknown_08A2075C + 0x156
.4byte gUnknown_08A2075C + 0x170
.4byte gUnknown_08A2075C + 0x18a

	.global gUnknown_08A209B8
gUnknown_08A209B8:  @ 0x08A209B8
@ replacing .incbin "baserom.gba", 0x00a209b8, 0x2c
.4byte gUnknown_08A2075C + 0x20
.4byte gUnknown_08A2075C + 0x3a
.4byte gUnknown_08A2075C + 0x54
.4byte gUnknown_08A2075C + 0x68
.4byte gUnknown_08A2075C + 0x82
.4byte gUnknown_08A2075C + 0x96
.4byte gUnknown_08A2075C + 0xa4
.4byte gUnknown_08A2075C + 0x3a
.4byte gUnknown_08A2075C + 0xcc
.4byte gUnknown_08A2075C + 0xe6
.4byte gUnknown_08A2075C + 0xb2

	.global gUnknown_08A209E4
gUnknown_08A209E4:  @ 0x08A209E4
@ replacing .incbin "baserom.gba", 0x00a209e4, 0xc
.4byte gUnknown_08A2075C + 0x1ce
.4byte gUnknown_08A2075C + 0x1f4
.4byte gUnknown_08A2075C + 0x21a

	.global gUnknown_08A209F0
gUnknown_08A209F0:  @ 0x08A209F0
@ replacing .incbin "baserom.gba", 0x00a209f0, 0xc
.4byte gUnknown_08A2075C + 0x192
.4byte gUnknown_08A2075C + 0x1a6
.4byte gUnknown_08A2075C + 0x1ba

	.global gUnknown_08A209FC
gUnknown_08A209FC:  @ 0x08A209FC
	.incbin "baserom.gba", 0xA209FC, 0xC

	.global gUnknown_08A20A08
gUnknown_08A20A08:  @ 0x08A20A08
	.incbin "baserom.gba", 0xA20A08, 0x8

	.global ProcScr_NewGameDiffilcultySelect
ProcScr_NewGameDiffilcultySelect:  @ 0x08A20A10
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80AC078
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AD5B4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AC1A8
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnableAllGfx
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AC288
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
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
        .word nullsub_64
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20A98
gUnknown_08A20A98:  @ 0x08A20A98
	.incbin "baserom.gba", 0xA20A98, 0x8

	.global gUnknown_08A20AA0
gUnknown_08A20AA0:  @ 0x08A20AA0
	.incbin "baserom.gba", 0xA20AA0, 0xE

	.global gUnknown_08A20AAE
gUnknown_08A20AAE:  @ 0x08A20AAE
    .incbin "baserom.gba", 0xA20AAE, 0x14

	.global gUnknown_08A20AC2
gUnknown_08A20AC2:  @ 0x08A20AC2
	.incbin "baserom.gba", 0xA20AC2, 0x46

	.global gUnknown_08A20B08
gUnknown_08A20B08:  @ 0x08A20B08
@ replacing .incbin "baserom.gba", 0x00a20b08, 0xc
.4byte gUnknown_08A20AC2 + 0xe
.4byte gUnknown_08A20AC2 + 0x22
.4byte gUnknown_08A20AC2 + 0x30

	.global gUnknown_08A20B14
gUnknown_08A20B14:  @ 0x08A20B14
	.incbin "baserom.gba", 0xA20B14, 0x8

	.global gUnknown_08A20B1C
gUnknown_08A20B1C:  @ 0x08A20B1C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AC3F4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AC588
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20B3C
gUnknown_08A20B3C:  @ 0x08A20B3C
	.incbin "baserom.gba", 0xA20B3C, 0x8

	.global gUnknown_08A20B44
gUnknown_08A20B44:  @ 0x08A20B44
	.incbin "baserom.gba", 0xA20B44, 0x8

	.global gUnknown_08A20B4C
gUnknown_08A20B4C:  @ 0x08A20B4C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AC904
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AC930
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20B7C
gUnknown_08A20B7C:  @ 0x08A20B7C
	.incbin "baserom.gba", 0xA20B7C, 0xE

	.global gUnknown_08A20B8A
gUnknown_08A20B8A:  @ 0x08A20B8A
	.incbin "baserom.gba", 0xA20B8A, 0xA

	.global gUnknown_08A20B94
gUnknown_08A20B94:  @ 0x08A20B94
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80ACB14
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80ACB34
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20BB4
gUnknown_08A20BB4:  @ 0x08A20BB4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80ACDF0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80ACDF8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20BD4
gUnknown_08A20BD4:  @ 0x08A20BD4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80ACE3C
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80ACE54
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_ParallelWorker
ProcScr_ParallelWorker:  @ 0x08A20C04
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ParallelWorker_OnLoop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20C1C
gUnknown_08A20C1C:  @ 0x08A20C1C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AD434
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AD43C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20C4C
gUnknown_08A20C4C:  @ 0x08A20C4C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AD5F8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AD610
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA20C4C + 0x18, 0x120 - 0x18

	.global gUnknown_08A20D6C
gUnknown_08A20D6C:  @ 0x08A20D6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80ADA24
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80ADA3C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20D8C
gUnknown_08A20D8C:  @ 0x08A20D8C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80ADCA4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20DA4
gUnknown_08A20DA4:  @ 0x08A20DA4
        @ PROC_CALL
        .short 0x2, 0x0
        .word FadeInOut_DisableGfx
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word FadeInOut_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word FadeIn_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20DCC
gUnknown_08A20DCC:  @ 0x08A20DCC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnableAllGfx
        @ PROC_CALL
        .short 0x2, 0x0
        .word FadeInOut_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word FadeOut_Loop
        @ PROC_CALL
        .short 0x2, 0x0
        .word FadeInOut_DisableGfx
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20DFC
gUnknown_08A20DFC:  @ 0x08A20DFC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AE4D8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AE518
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AE71C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20E24
gUnknown_08A20E24:  @ 0x08A20E24
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AE930
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AE938
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20E44
gUnknown_08A20E44:  @ 0x08A20E44
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AEB60
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AEB8C
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20E74
gUnknown_08A20E74:  @ 0x08A20E74
	.incbin "baserom.gba", 0xA20E74, 0x460

	.global gUnknown_08A212D4
gUnknown_08A212D4:  @ 0x08A212D4
@ replacing .incbin "baserom.gba", 0x00a212d4, 0x4
.4byte gGenericBuffer

	.global gUnknown_08A212D8
gUnknown_08A212D8:  @ 0x08A212D8
@ replacing .incbin "baserom.gba", 0x00a212d8, 0x4
.4byte gUnknown_02020988

	.global gUnknown_08A212DC
gUnknown_08A212DC:  @ 0x08A212DC
@ replacing .incbin "baserom.gba", 0x00a212dc, 0x4
.4byte gUnknown_02021188

	.global gUnknown_08A212E0
gUnknown_08A212E0:  @ 0x08A212E0
@ replacing .incbin "baserom.gba", 0x00a212e0, 0x4
.4byte gUnknown_02021188 + 0x200

	.global gUnknown_08A212E4
gUnknown_08A212E4:  @ 0x08A212E4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AEEC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AEEE8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A21304
gUnknown_08A21304:  @ 0x08A21304
@ replacing .incbin "baserom.gba", 0x00a21304, 0x4
.4byte gSoundInfo

	.global gUnknown_08A21308
gUnknown_08A21308:  @ 0x08A21308
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AF220
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_65
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AF22C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A21338
gUnknown_08A21338:  @ 0x08A21338
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AF524
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_WHILE
        .short 0x14, 0x0
        .word MusicProc4Exists
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AF8A0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AFBBC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFC60
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFC98
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AFCE4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFCF8
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AFBBC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFC60
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AFD48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFD5C
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFDF4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFE8C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AFCE4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFCF8
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFA64
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AFA94
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A21440
gUnknown_08A21440:  @ 0x08A21440
	.incbin "baserom.gba", 0xA21440, 0xE

	.global gUnknown_08A2144E
gUnknown_08A2144E:  @ 0x08A2144E
	.incbin "baserom.gba", 0xA2144E, 0xE

	.global gUnknown_08A2145C
gUnknown_08A2145C:  @ 0x08A2145C
	.incbin "baserom.gba", 0xA2145C, 0xE

	.global gUnknown_08A2146A
gUnknown_08A2146A:  @ 0x08A2146A
	.incbin "baserom.gba", 0xA2146A, 0x20

	.global gUnknown_08A2148A
gUnknown_08A2148A:  @ 0x08A2148A
	.incbin "baserom.gba", 0xA2148A, 0x14

	.global gUnknown_08A2149E
gUnknown_08A2149E:  @ 0x08A2149E
	.incbin "baserom.gba", 0xA2149E, 0x8

	.global gUnknown_08A214A6
gUnknown_08A214A6:  @ 0x08A214A6
	.incbin "baserom.gba", 0xA214A6, 0x8

	.global gUnknown_08A214AE
gUnknown_08A214AE:  @ 0x08A214AE
	.incbin "baserom.gba", 0xA214AE, 0x5A

	.global gUnknown_08A21508
gUnknown_08A21508:  @ 0x08A21508
@ replacing .incbin "baserom.gba", 0x00a21508, 0x28
.4byte gUnknown_08A214AE + 0x8
.4byte gUnknown_08A214AE + 0x10
.4byte gUnknown_08A214AE + 0x18
.4byte gUnknown_08A214AE + 0x20
.4byte gUnknown_08A214AE + 0x28
.4byte gUnknown_08A214AE + 0x30
.4byte gUnknown_08A214AE + 0x38
.4byte gUnknown_08A214AE + 0x40
.4byte gUnknown_08A214AE + 0x48
.4byte gUnknown_08A214AE + 0x50

	.global gUnknown_08A21530
gUnknown_08A21530:  @ 0x08A21530
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B031C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B0324
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A21550
gUnknown_08A21550:  @ 0x08A21550
	.incbin "baserom.gba", 0xA21550, 0x18

	.global gUnknown_08A21568
gUnknown_08A21568:  @ 0x08A21568
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B04BC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B04F8
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_66
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B05C4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A21590
gUnknown_08A21590:  @ 0x08A21590
@ replacing .incbin "baserom.gba", 0x00a21590, 0x4
.4byte gUnknown_02000948 + 0x20

	.global gUnknown_08A21594
gUnknown_08A21594:  @ 0x08A21594
@ replacing .incbin "baserom.gba", 0x00a21594, 0x4
.4byte gUnknown_02000C78 + 0xf0

	.global gUnknown_08A21598
gUnknown_08A21598:  @ 0x08A21598
@ replacing .incbin "baserom.gba", 0x00a21598, 0x4
.4byte gUnknown_02001088 + 0xe0

	.global gUnknown_08A2159C
gUnknown_08A2159C:  @ 0x08A2159C
@ replacing .incbin "baserom.gba", 0x00a2159c, 0x4
.4byte gUnknown_02001188 + 0x3e0

	.global gUnknown_08A215A0
gUnknown_08A215A0:  @ 0x08A215A0
@ replacing .incbin "baserom.gba", 0x00a215a0, 0x4
.4byte gUnknown_02001188 + 0x4e0

	.global gUnknown_08A215A4
gUnknown_08A215A4:  @ 0x08A215A4
@ replacing .incbin "baserom.gba", 0x00a215a4, 0x4
.4byte gUnknown_02001188 + 0x1e0

	.global gUnknown_08A215A8
gUnknown_08A215A8:  @ 0x08A215A8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B0ADC
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B0D38
        @ PROC_GOTO
        .short 0xc, 0x64
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B1020
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B1288
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B1350
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B13BC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B15E8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B1620
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x64
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B166C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A21658
gUnknown_08A21658:  @ 0x08A21658
	.incbin "baserom.gba", 0xA21658, 0x4774

	.global gUnknown_08A25DCC
gUnknown_08A25DCC:  @ 0x08A25DCC
	.incbin "baserom.gba", 0xA25DCC, 0x100

	.global gUnknown_08A25ECC
gUnknown_08A25ECC:  @ 0x08A25ECC
	.incbin "baserom.gba", 0xA25ECC, 0x4B4

	.global gUnknown_08A26380
gUnknown_08A26380:  @ 0x08A26380
	.incbin "baserom.gba", 0xA26380, 0x558

	.global gUnknown_08A268D8
gUnknown_08A268D8:  @ 0x08A268D8
	.incbin "baserom.gba", 0xA268D8, 0x20

	.global gUnknown_08A268F8
gUnknown_08A268F8:  @ 0x08A268F8
	.incbin "baserom.gba", 0xA268F8, 0x17C

	.global Img_SaveScreenSprits
Img_SaveScreenSprits:  @ 0x08A26A74
	.incbin "baserom.gba", 0xA26A74, 0x14F4

	.global Pal_SaveScreenSprits
Pal_SaveScreenSprits:  @ 0x08A27F68
	.incbin "baserom.gba", 0xA27F68, 0x120

	.global gUnknown_08A28088
gUnknown_08A28088:  @ 0x08A28088
	.incbin "baserom.gba", 0xA28088, 0x20

	.global gUnknown_08A280A8
gUnknown_08A280A8:  @ 0x08A280A8
	.incbin "baserom.gba", 0xA280A8, 0x84

	.global Img_GameMainMenuObjs
Img_GameMainMenuObjs:  @ 0x08A2812C
	.incbin "baserom.gba", 0xA2812C, 0x8E0

	.global Img_DifficultyMenuObjs
Img_DifficultyMenuObjs:  @ 0x08A28A0C
	.incbin "baserom.gba", 0xA28A0C, 0xA0C

	.global Pal_DifficultyMenuObjs
Pal_DifficultyMenuObjs:  @ 0x08A29418
	.incbin "baserom.gba", 0xA29418, 0x82

	.global gUnknown_08A2949A
gUnknown_08A2949A:  @ 0x08A2949A
	.incbin "baserom.gba", 0xA2949A, 0x20

	.global gUnknown_08A294BA
gUnknown_08A294BA:  @ 0x08A294BA
	.incbin "baserom.gba", 0xA294BA, 0x9E

	.global gUnknown_08A29558
gUnknown_08A29558:  @ 0x08A29558
	.incbin "baserom.gba", 0xA29558, 0x5C

	.global gUnknown_08A295B4
gUnknown_08A295B4:  @ 0x08A295B4
	.incbin "baserom.gba", 0xA295B4, 0x20

	.global gUnknown_08A295D4
gUnknown_08A295D4:  @ 0x08A295D4
	.incbin "baserom.gba", 0xA295D4, 0x4B4

	.global gUnknown_08A29A88
gUnknown_08A29A88:  @ 0x08A29A88
	.incbin "baserom.gba", 0xA29A88, 0x175C

	.global gUnknown_08A2B1E4
gUnknown_08A2B1E4:  @ 0x08A2B1E4
	.incbin "baserom.gba", 0xA2B1E4, 0xF38

	.global gUnknown_08A2C11C
gUnknown_08A2C11C:  @ 0x08A2C11C
	.incbin "baserom.gba", 0xA2C11C, 0x120

	.global gUnknown_08A2C23C
gUnknown_08A2C23C:  @ 0x08A2C23C
	.incbin "baserom.gba", 0xA2C23C, 0x28C

	.global gUnknown_08A2C4C8
gUnknown_08A2C4C8:  @ 0x08A2C4C8
	.incbin "baserom.gba", 0xA2C4C8, 0xE0

	.global gUnknown_08A2C5A8
gUnknown_08A2C5A8:  @ 0x08A2C5A8
	.incbin "baserom.gba", 0xA2C5A8, 0x1FC

	.global gUnknown_08A2C7A4
gUnknown_08A2C7A4:  @ 0x08A2C7A4
	.incbin "baserom.gba", 0xA2C7A4, 0x94

	.global gUnknown_08A2C838
gUnknown_08A2C838:  @ 0x08A2C838
	.incbin "baserom.gba", 0xA2C838, 0x70

	.global gUnknown_08A2C8A8
gUnknown_08A2C8A8:  @ 0x08A2C8A8
	.incbin "baserom.gba", 0xA2C8A8, 0x60

	.global gUnknown_08A2C908
gUnknown_08A2C908:  @ 0x08A2C908
	.incbin "baserom.gba", 0xA2C908, 0x24

	.global gUnknown_08A2C92C
gUnknown_08A2C92C:  @ 0x08A2C92C
	.incbin "baserom.gba", 0xA2C92C, 0x190

	.global gUnknown_08A2CABC
gUnknown_08A2CABC:  @ 0x08A2CABC
	.incbin "baserom.gba", 0xA2CABC, 0x810

	.global gUnknown_08A2D2CC
gUnknown_08A2D2CC:  @ 0x08A2D2CC
	.incbin "baserom.gba", 0xA2D2CC, 0x60

	.global gUnknown_08A2D32C
gUnknown_08A2D32C:  @ 0x08A2D32C
	.incbin "baserom.gba", 0xA2D32C, 0xE8C

	.global gUnknown_08A2E1B8
gUnknown_08A2E1B8:  @ 0x08A2E1B8
	.incbin "baserom.gba", 0xA2E1B8, 0x40

	.global gUnknown_08A2E1F8
gUnknown_08A2E1F8:  @ 0x08A2E1F8
	.incbin "baserom.gba", 0xA2E1F8, 0x1C

	.global gUnknown_08A2E214
gUnknown_08A2E214:  @ 0x08A2E214
	.incbin "baserom.gba", 0xA2E214, 0x290

	.global gUnknown_08A2E4A4
gUnknown_08A2E4A4:  @ 0x08A2E4A4
	.incbin "baserom.gba", 0xA2E4A4, 0x20

	.global gUnknown_08A2E4C4
gUnknown_08A2E4C4:  @ 0x08A2E4C4
	.incbin "baserom.gba", 0xA2E4C4, 0x128

	.global gUnknown_08A2E5EC
gUnknown_08A2E5EC:  @ 0x08A2E5EC
	.incbin "baserom.gba", 0xA2E5EC, 0x304

	.global gUnknown_08A2E8F0
gUnknown_08A2E8F0:  @ 0x08A2E8F0
	.incbin "baserom.gba", 0xA2E8F0, 0x60

	.global gUnknown_08A2E950
gUnknown_08A2E950:  @ 0x08A2E950
	.incbin "baserom.gba", 0xA2E950, 0x24
