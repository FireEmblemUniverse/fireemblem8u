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


	.global gUnknown_08A200B8
gUnknown_08A200B8:  @ 0x08A200B8
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
        .word sub_80A8CD4
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
        .word sub_8002A6C
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
        .word sub_80A8CD4
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
        .word sub_80A8CD4
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

	.global gUnknown_08A20A10
gUnknown_08A20A10:  @ 0x08A20A10
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
@ Replacing .incbin "baserom.gba", 0xA20AAE, 0x14
    .4byte 0x40080003
    .4byte DirectSoundData_08507D60 + 0x2b0
    .4byte -0x7fcfbff8
    .4byte 0x40080854
    .4byte debug_font_4bpp + 0x610

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


	.global gUnknown_08A20C04
gUnknown_08A20C04:  @ 0x08A20C04
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word _CallDifferedLoop
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
.4byte gUnknown_02020188

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
        .word sub_8002A6C
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

	.global gUnknown_08A26A74
gUnknown_08A26A74:  @ 0x08A26A74
	.incbin "baserom.gba", 0xA26A74, 0x14F4

	.global gUnknown_08A27F68
gUnknown_08A27F68:  @ 0x08A27F68
	.incbin "baserom.gba", 0xA27F68, 0x120

	.global gUnknown_08A28088
gUnknown_08A28088:  @ 0x08A28088
	.incbin "baserom.gba", 0xA28088, 0x20

	.global gUnknown_08A280A8
gUnknown_08A280A8:  @ 0x08A280A8
	.incbin "baserom.gba", 0xA280A8, 0x84

	.global gUnknown_08A2812C
gUnknown_08A2812C:  @ 0x08A2812C
	.incbin "baserom.gba", 0xA2812C, 0x8E0

	.global gUnknown_08A28A0C
gUnknown_08A28A0C:  @ 0x08A28A0C
	.incbin "baserom.gba", 0xA28A0C, 0xA0C

	.global gUnknown_08A29418
gUnknown_08A29418:  @ 0x08A29418
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

	.global gUnknown_08A2E974
gUnknown_08A2E974:  @ 0x08A2E974
@ replacing .incbin "baserom.gba", 0x00a2e974, 0x4
.4byte gUnknown_02020188

	.global gUnknown_08A2E978
gUnknown_08A2E978:  @ 0x08A2E978
	.incbin "baserom.gba", 0xA2E978, 0xE

	.global gUnknown_08A2E986
gUnknown_08A2E986:  @ 0x08A2E986
	.incbin "baserom.gba", 0xA2E986, 0x16

	.global gUnknown_08A2E99C
gUnknown_08A2E99C:  @ 0x08A2E99C
	.incbin "baserom.gba", 0xA2E99C, 0x2EC

	.global gUnknown_08A2EC88
gUnknown_08A2EC88:  @ 0x08A2EC88
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205e38
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B1784
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2ECA8
gUnknown_08A2ECA8:  @ 0x08A2ECA8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205e48
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B1920
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B1938
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProcScr_Config1
gProcScr_Config1:  @ 0x08A2ECE0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205e68
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispSuspend
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B1A08
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B220C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndHelpBox
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_80B2464
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispResume
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshBMapGraphics
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2ED88
gUnknown_08A2ED88:  @ 0x08A2ED88
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205e68
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B1A08
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B24AC
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B220C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndHelpBox
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_80B2464
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2EE00
gUnknown_08A2EE00:  @ 0x08A2EE00
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205e68
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispSuspend
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B1A08
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B24C0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B220C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndHelpBox
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_80B2464
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispResume
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshBMapGraphics
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2EE90
gUnknown_08A2EE90:  @ 0x08A2EE90
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205e74
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B24DC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B251C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2EEC0
gUnknown_08A2EEC0:  @ 0x08A2EEC0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205e80
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_67
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B2608
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2EEF0
gUnknown_08A2EEF0:  @ 0x08A2EEF0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205e8c
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B2818
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B2904
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B29D4
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B29E0
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2EF48
gUnknown_08A2EF48:  @ 0x08A2EF48
	.incbin "baserom.gba", 0xA2EF48, 0x8

	.global gUnknown_08A2EF50
gUnknown_08A2EF50:  @ 0x08A2EF50
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205eac
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B2B8C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B2E30
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B2EA8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B2F08
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B2F2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2EFC0
gUnknown_08A2EFC0:  @ 0x08A2EFC0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205eb8
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B2F58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B2F74
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B2FD0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B2FF8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2EFF8
gUnknown_08A2EFF8:  @ 0x08A2EFF8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205ec4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B3088
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B31B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B31EC
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B3208
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2F038
gUnknown_08A2F038:  @ 0x08A2F038
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B327C
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08A2F068
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B32AC
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A2F068
gUnknown_08A2F068:  @ 0x08A2F068
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B33E4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B3498
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A2F088
gUnknown_08A2F088:  @ 0x08A2F088
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B37FC
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80B3E9C
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B3C50
        @ PROC_LABEL
        .short 0xb, 0x9
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B3D84
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B3E18
        @ PROC_GOTO
        .short 0xc, 0x9
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xa
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_GOTO
        .short 0xc, 0x8
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x2
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2F138
gUnknown_08A2F138:  @ 0x08A2F138
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205f0c
        @ PROC_SLEEP
        .short 0xe, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B3EFC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B3F90
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA2F138 + 0x28, 0x20

	.global gUnknown_08A2F180
gUnknown_08A2F180:  @ 0x08A2F180
@ Replacing .incbin "baserom.gba", 0xA2F180, 0x50
    .4byte gUnknown_08A2F138 + 0x28
    .4byte gUnknown_08A2F138 + 0x30
    .4byte gUnknown_08A2F138 + 0x38
    .4byte gUnknown_08A2F138 + 0x40
    .4byte 0x1
    .4byte 0x7008000
    .4byte 0x1
    .4byte 0x7048000
    .4byte 0x1
    .4byte 0x7088000
    .4byte 0x1
    .4byte 0x70c8000
    .4byte 0x1
    .4byte 0x7108000
    .4byte 0x1
    .4byte 0x7148000
    .4byte 0x1
    .4byte 0x7188000
    .4byte 0x1
    .4byte 0x71c8000

	.global gUnknown_08A2F1D0
gUnknown_08A2F1D0:  @ 0x08A2F1D0
@ replacing .incbin "baserom.gba", 0x00a2f1d0, 0x20
.4byte gUnknown_08A2F180 + 0x10
.4byte gUnknown_08A2F180 + 0x18
.4byte gUnknown_08A2F180 + 0x20
.4byte gUnknown_08A2F180 + 0x28
.4byte gUnknown_08A2F180 + 0x30
.4byte gUnknown_08A2F180 + 0x38
.4byte gUnknown_08A2F180 + 0x40
.4byte gUnknown_08A2F180 + 0x48

	.global gUnknown_08A2F1F0
gUnknown_08A2F1F0:  @ 0x08A2F1F0
	.incbin "baserom.gba", 0xA2F1F0, 0xD0

	.global gUnknown_08A2F2C0
gUnknown_08A2F2C0:  @ 0x08A2F2C0
@ replacing .incbin "baserom.gba", 0x00a2f2c0, 0x914
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A37300 + 0x1e48
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A37300 + 0x1968
    .4byte gUnknown_08A37300 + 0x19a0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A37300 + 0x20
    .4byte gUnknown_08A37300 + 0xa0
    .4byte gUnknown_08A37300 + 0x130
    .4byte gUnknown_08A37300 + 0x1a4
    .4byte gUnknown_08A37300 + 0x224
    .4byte gUnknown_08A37300 + 0x2b0
    .4byte gUnknown_08A37300 + 0x334
    .4byte gUnknown_08A37300 + 0x3c4
    .4byte gUnknown_08A37300 + 0x43c
    .4byte gUnknown_08A37300 + 0x4ac
    .4byte gUnknown_08A37300 + 0x52c
    .4byte gUnknown_08A37300 + 0x5bc
    .4byte gUnknown_08A37300 + 0x62c
    .4byte gUnknown_08A37300 + 0x6cc
    .4byte gUnknown_08A37300 + 0x768
    .4byte gUnknown_08A37300 + 0x7e8
    .4byte gUnknown_08A37300 + 0x85c
    .4byte gUnknown_08A37300 + 0x8ec
    .4byte gUnknown_08A37300 + 0x970
    .4byte gUnknown_08A37300 + 0x9f4
    .4byte gUnknown_08A37300 + 0xa74
    .4byte gUnknown_08A37300 + 0xb08
    .4byte gUnknown_08A37300 + 0xb80
    .4byte gUnknown_08A37300 + 0xc1c
    .4byte gUnknown_08A37300 + 0xcac
    .4byte gUnknown_08A37300 + 0xd2c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A37300 + 0xdb0
    .4byte gUnknown_08A37300 + 0xe28
    .4byte gUnknown_08A37300 + 0xea8
    .4byte gUnknown_08A37300 + 0xf0c
    .4byte gUnknown_08A37300 + 0xf88
    .4byte gUnknown_08A37300 + 0xff4
    .4byte gUnknown_08A37300 + 0x1068
    .4byte gUnknown_08A37300 + 0x10f0
    .4byte gUnknown_08A37300 + 0x1168
    .4byte gUnknown_08A37300 + 0x11d0
    .4byte gUnknown_08A37300 + 0x1248
    .4byte gUnknown_08A37300 + 0x12cc
    .4byte gUnknown_08A37300 + 0x1344
    .4byte gUnknown_08A37300 + 0x13c8
    .4byte gUnknown_08A37300 + 0x142c
    .4byte gUnknown_08A37300 + 0x1494
    .4byte gUnknown_08A37300 + 0x1514
    .4byte gUnknown_08A37300 + 0x1590
    .4byte gUnknown_08A37300 + 0x15f4
    .4byte gUnknown_08A37300 + 0x1664
    .4byte gUnknown_08A37300 + 0x16cc
    .4byte gUnknown_08A37300 + 0x1740
    .4byte gUnknown_08A37300 + 0x17a8
    .4byte gUnknown_08A37300 + 0x1820
    .4byte gUnknown_08A37300 + 0x1890
    .4byte gUnknown_08A37300 + 0x1904
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A37300 + 0x19d0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A37300 + 0x1a58
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A37300 + 0x1ae0
    .4byte gUnknown_08A37300 + 0x1b60
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A37300 + 0x1be8
    .4byte gUnknown_08A37300 + 0x1c54
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A37300 + 0x1ccc
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A37300 + 0x1d48
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A37300 + 0x1dc4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000006f6
    .4byte 0x020002ff
    .4byte 0x00000000
    .4byte 0x00141400
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x000006fa
    .4byte 0x3a00073b
    .4byte 0x00000000
    .4byte 0x00120b00
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x000006fb
    .4byte 0x3f000902
    .4byte 0x00000000
    .4byte 0x00020200
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x000006f9
    .4byte 0x330005ff
    .4byte 0x00000000
    .4byte 0x00001100
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x0000071c
    .4byte 0x6500483f
    .4byte 0x00000000
    .4byte 0x00191900
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x0000071a
    .4byte 0x7e004544
    .4byte 0x00000003
    .4byte 0x00120b00
    .4byte gUnknown_08A2F1F0 + 0x86
    .4byte 0x0000070e
    .4byte 0x91003dff
    .4byte 0x00000000
    .4byte 0x00001100
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000711
    .4byte 0x18003f1d
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x000006fd
    .4byte 0x88000d5d
    .4byte 0x00000000
    .4byte 0x001c1c00
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000703
    .4byte 0x27001900
    .4byte 0x00000000
    .4byte 0x00131300
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000709
    .4byte 0x6b00262e
    .4byte 0x00000001
    .4byte 0x00191900
    .4byte gUnknown_08A2F1F0 + 0x58
    .4byte 0x00000719
    .4byte 0x7c004436
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte gUnknown_08A2F1F0 + 0x7a
    .4byte 0x00000725
    .4byte 0x9f0152ff
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x00000726
    .4byte 0xa00153ff
    .4byte 0x00000000
    .4byte 0x00131300
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x00000727
    .4byte 0xa10154ff
    .4byte 0x00000000
    .4byte 0x000f0e00
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x00000730
    .4byte 0xb9015fff
    .4byte 0x00000007
    .4byte 0x00191900
    .4byte gUnknown_08A2F1F0 + 0xb6
    .4byte 0x00000729
    .4byte 0xab0158ff
    .4byte 0x00000000
    .4byte 0x00040400
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x00000700
    .4byte 0x10001337
    .4byte 0x00000000
    .4byte 0x00180b00
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x0000071e
    .4byte 0x7f004a42
    .4byte 0x00000003
    .4byte 0x00120b00
    .4byte gUnknown_08A2F1F0 + 0x86
    .4byte 0x000006f5
    .4byte 0x000001ff
    .4byte 0x00000000
    .4byte 0x00141400
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000723
    .4byte 0x990142ff
    .4byte 0x00000000
    .4byte 0x000c0c00
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000713
    .4byte 0x1f0141ff
    .4byte 0x00000000
    .4byte 0x00161600
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000716
    .4byte 0x74012dff
    .4byte 0x00000005
    .4byte 0x00151500
    .4byte gUnknown_08A2F1F0 + 0xaa
    .4byte 0x00000704
    .4byte 0x29001b51
    .4byte 0x00000000
    .4byte 0x00141400
    .4byte gUnknown_08A2F1F0 + 0x1e
    .4byte 0x000006fe
    .4byte 0x0a000f30
    .4byte 0x00000000
    .4byte 0x00010100
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000721
    .4byte 0x90004d14
    .4byte 0x00000000
    .4byte 0x000e0e00
    .4byte gUnknown_08A2F1F0 + 0x92
    .4byte 0x0000070f
    .4byte 0x94003eff
    .4byte 0x00000001
    .4byte 0x00191900
    .4byte gUnknown_08A2F1F0 + 0x6e
    .4byte 0x00000700
    .4byte 0x120014ff
    .4byte 0x00000000
    .4byte 0x00120b00
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x0000071b
    .4byte 0x950047ff
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000733
    .4byte 0xbc0163ff
    .4byte 0x00000000
    .4byte 0x00161600
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x0000072f
    .4byte 0xb5015eff
    .4byte 0x00000000
    .4byte 0x00010100
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x0000072b
    .4byte 0xad015aff
    .4byte 0x00000000
    .4byte 0x00040400
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x0000072c
    .4byte 0xb0015bff
    .4byte 0x00000000
    .4byte 0x00131300
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000728
    .4byte 0xa60156ff
    .4byte 0x00000000
    .4byte 0x000f0e00
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x0000071f
    .4byte 0x85004b61
    .4byte 0x00000003
    .4byte 0x00110000
    .4byte gUnknown_08A2F1F0 + 0x86
    .4byte 0x00000714
    .4byte 0x22004312
    .4byte 0x00000000
    .4byte 0x00101000
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000710
    .4byte 0x8e003345
    .4byte 0x00000000
    .4byte 0x001c1c00
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x0000070a
    .4byte 0x6c00274b
    .4byte 0x00000001
    .4byte 0x00191900
    .4byte gUnknown_08A2F1F0 + 0x58
    .4byte 0x00000715
    .4byte 0x4f00352c
    .4byte 0x00000000
    .4byte 0x00120b00
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x000006f8
    .4byte 0x070004ff
    .4byte 0x00000000
    .4byte 0x00141400
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x00000705
    .4byte 0x2e011dff
    .4byte 0x00000000
    .4byte 0x00131300
    .4byte gUnknown_08A2F1F0 + 0x40
    .4byte 0x00000712
    .4byte 0x1b0140ff
    .4byte 0x00000000
    .4byte 0x00131300
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000702
    .4byte 0x8a0117ff
    .4byte 0x00000000
    .4byte 0x001d1d00
    .4byte gUnknown_08A2F1F0 + 0x4c
    .4byte 0x0000070b
    .4byte 0x70002a35
    .4byte 0x00000002
    .4byte 0x00001100
    .4byte gUnknown_08A2F1F0 + 0x7a
    .4byte 0x000006f7
    .4byte 0x040003ff
    .4byte 0x00000000
    .4byte 0x00141400
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x00000720
    .4byte 0x86004cff
    .4byte 0x00000004
    .4byte 0x00001100
    .4byte gUnknown_08A2F1F0 + 0x7a
    .4byte 0x00000717
    .4byte 0x76012fff
    .4byte 0x00000005
    .4byte 0x00151500
    .4byte gUnknown_08A2F1F0 + 0xaa
    .4byte 0x000006fc
    .4byte 0x44010bff
    .4byte 0x00000000
    .4byte 0x00020200
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x00000701
    .4byte 0x140015ff
    .4byte 0x00000000
    .4byte 0x00090900
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x00000708
    .4byte 0x61002368
    .4byte 0x00000000
    .4byte 0x00161600
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x0000070c
    .4byte 0x81002b0d
    .4byte 0x00000004
    .4byte 0x00141400
    .4byte gUnknown_08A2F1F0 + 0x7a
    .4byte 0x00000707
    .4byte 0x5c002117
    .4byte 0x00000000
    .4byte 0x00161600
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x000006ff
    .4byte 0x0d00116b
    .4byte 0x00000000
    .4byte 0x00171700
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x0000071d
    .4byte 0x6700491c
    .4byte 0x00000000
    .4byte 0x000d0d00
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x0000072a
    .4byte 0xac0159ff
    .4byte 0x00000000
    .4byte 0x00040400
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x0000072e
    .4byte 0xb2015dff
    .4byte 0x00000000
    .4byte 0x00010100
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000734
    .4byte 0xbe0164ff
    .4byte 0x00000000
    .4byte 0x00161600
    .4byte gUnknown_08A2F1F0 + 0x34
    .4byte 0x0000072d
    .4byte 0xb1015cff
    .4byte 0x00000000
    .4byte 0x00131300
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000732
    .4byte 0xbb0161ff
    .4byte 0x00000008
    .4byte 0x00010100
    .4byte gUnknown_08A2F1F0 + 0xc2
    .4byte 0x00000724
    .4byte 0x9c014fff
    .4byte 0x00000002
    .4byte 0x00141400
    .4byte gUnknown_08A2F1F0 + 0x7a
    .4byte 0x00000718
    .4byte 0x7a01314f
    .4byte 0x00000005
    .4byte 0x00151500
    .4byte gUnknown_08A2F1F0 + 0xaa
    .4byte 0x0000070d
    .4byte 0xc4003cff
    .4byte 0x00000006
    .4byte 0x00101000
    .4byte gUnknown_08A2F1F0 + 0x9e
    .4byte 0x00000731
    .4byte 0xba0160ff
    .4byte 0x00000007
    .4byte 0x00060600
    .4byte gUnknown_08A2F1F0 + 0xb6
    .4byte 0x00000706
    .4byte 0x57001f15
    .4byte 0x00000000
    .4byte 0x00040400
    .4byte gUnknown_08A2F1F0 + 0x8
    .4byte 0x00000722
    .4byte 0x97014eff
    .4byte 0x00000000
    .4byte 0x00141400
    .4byte gUnknown_08A2F1F0 + 0x8

	.global gUnknown_08A2FBD4
gUnknown_08A2FBD4:  @ 0x08A2FBD4
	.incbin "baserom.gba", 0xA2FBD4, 0xC

	.global gUnknown_08A2FBE0
gUnknown_08A2FBE0:  @ 0x08A2FBE0
@ Replacing .incbin "baserom.gba", 0xA2FBE0, 0x1F0
    .4byte gUnknown_08A2F2C0 + 0x70c
    .4byte gUnknown_08A2F2C0 + 0x89c
    .4byte gUnknown_08A2F2C0 + 0x630
    .4byte gUnknown_08A2F2C0 + 0x8b0
    .4byte gUnknown_08A2F2C0 + 0x8c4
    .4byte gUnknown_08A2F2C0 + 0x770
    .4byte gUnknown_08A2F2C0 + 0x838
    .4byte gUnknown_08A2F2C0 + 0x84c
    .4byte gUnknown_08A2F2C0 + 0x860
    .4byte gUnknown_08A2F2C0 + 0x874
    .4byte gUnknown_08A2F2C0 + 0x888
    .4byte gUnknown_08A2F2C0 + 0x8d8
    .4byte gUnknown_08A2F2C0 + 0x7d4
    .4byte gUnknown_08A2F2C0 + 0x7e8
    .4byte gUnknown_08A2F2C0 + 0x7fc
    .4byte gUnknown_08A2F2C0 + 0x810
    .4byte gUnknown_08A2F2C0 + 0x824
    .4byte gUnknown_08A2F2C0 + 0x784
    .4byte gUnknown_08A2F2C0 + 0x720
    .4byte gUnknown_08A2F2C0 + 0x748
    .4byte gUnknown_08A2F2C0 + 0x75c
    .4byte gUnknown_08A2F2C0 + 0x7ac
    .4byte gUnknown_08A2F2C0 + 0x7c0
    .4byte gUnknown_08A2F2C0 + 0x798
    .4byte gUnknown_08A2F2C0 + 0x658
    .4byte gUnknown_08A2F2C0 + 0x66c
    .4byte gUnknown_08A2F2C0 + 0x680
    .4byte gUnknown_08A2F2C0 + 0x694
    .4byte gUnknown_08A2F2C0 + 0x504
    .4byte gUnknown_08A2F2C0 + 0x5cc
    .4byte gUnknown_08A2F2C0 + 0x5e0
    .4byte gUnknown_08A2F2C0 + 0x5f4
    .4byte gUnknown_08A2F2C0 + 0x608
    .4byte gUnknown_08A2F2C0 + 0x900
    .4byte gUnknown_08A2F2C0 + 0x6f8
    .4byte gUnknown_08A2F2C0 + 0x6a8
    .4byte gUnknown_08A2F2C0 + 0x6bc
    .4byte gUnknown_08A2F2C0 + 0x6d0
    .4byte gUnknown_08A2F2C0 + 0x6e4
    .4byte gUnknown_08A2F2C0 + 0x734
    .4byte gUnknown_08A2F2C0 + 0x8ec
    .4byte gUnknown_08A2F2C0 + 0x554
    .4byte gUnknown_08A2F2C0 + 0x568
    .4byte gUnknown_08A2F2C0 + 0x57c
    .4byte gUnknown_08A2F2C0 + 0x590
    .4byte gUnknown_08A2F2C0 + 0x5a4
    .4byte gUnknown_08A2F2C0 + 0x5b8
    .4byte gUnknown_08A2F2C0 + 0x478
    .4byte gUnknown_08A2F2C0 + 0x48c
    .4byte gUnknown_08A2F2C0 + 0x4a0
    .4byte gUnknown_08A2F2C0 + 0x4b4
    .4byte gUnknown_08A2F2C0 + 0x4c8
    .4byte gUnknown_08A2F2C0 + 0x4dc
    .4byte gUnknown_08A2F2C0 + 0x400
    .4byte gUnknown_08A2F2C0 + 0x414
    .4byte gUnknown_08A2F2C0 + 0x428
    .4byte gUnknown_08A2F2C0 + 0x43c
    .4byte gUnknown_08A2F2C0 + 0x450
    .4byte gUnknown_08A2F2C0 + 0x464
    .4byte gUnknown_08A2F2C0 + 0x4f0
    .4byte gUnknown_08A2F2C0 + 0x518
    .4byte gUnknown_08A2F2C0 + 0x52c
    .4byte gUnknown_08A2F2C0 + 0x540
    .4byte gUnknown_08A2F2C0 + 0x644
    .4byte 0x0
    .4byte 0x40000002
    .4byte 0xc008000
    .4byte 0x40004010
    .4byte 0x40c40
    .4byte 0x8000
    .4byte 0x100c04
    .4byte 0xc440000
    .4byte 0x40080000
    .4byte 0x40100c05
    .4byte 0xc450008
    .4byte -0x7ffffffc
    .4byte 0xc070000
    .4byte 0x10
    .4byte 0xc47
    .4byte 0xc084008
    .4byte 0x84010
    .4byte 0x40c48
    .4byte 0x8000
    .4byte 0x100c04
    .4byte 0xc440000
    .4byte 0x40080000
    .4byte 0x40100c0a
    .4byte 0xc4a0008
    .4byte -0x7ffffffc
    .4byte 0xc040000
    .4byte 0x10
    .4byte 0xc44
    .4byte 0xc0c4008
    .4byte 0x84010
    .4byte 0x40c4c
    .4byte 0x8000
    .4byte 0x100c04
    .4byte 0xc440000
    .4byte 0x40080000
    .4byte 0x40100c0e
    .4byte 0xc4e0008
    .4byte -0x7ffffffc
    .4byte 0xc100000
    .4byte 0x10
    .4byte 0xc50
    .4byte 0xc114008
    .4byte 0x84010
    .4byte 0x40c51
    .4byte 0x8000
    .4byte 0x100c04
    .4byte 0xc440000
    .4byte 0x40080000
    .4byte 0x40100c13
    .4byte 0xc530008
    .4byte -0x7ffffffc
    .4byte 0xc040000
    .4byte 0x10
    .4byte -0x7ffff3bc
    .4byte 0xc150008
    .4byte 0x80010
    .4byte 0x20c55
    .4byte -0x7fffc000
    .4byte 0x40100c74
    .4byte 0xcb44000

	.global gUnknown_08A2FDD0
gUnknown_08A2FDD0:  @ 0x08A2FDD0
	.incbin "baserom.gba", 0xA2FDD0, 0x30

	.global gUnknown_08A2FE00
gUnknown_08A2FE00:  @ 0x08A2FE00
@ Replacing .incbin "baserom.gba", 0xA2FE00, 0x3A8
    .4byte 0xc560008
    .4byte -0x7ffffffc
    .4byte 0xc180000
    .4byte 0x10
    .4byte 0xc58
    .4byte 0xc194008
    .4byte 0x84010
    .4byte 0x40c59
    .4byte 0x8000
    .4byte 0x100c04
    .4byte 0xc440000
    .4byte 0x40080000
    .4byte 0x40100c1b
    .4byte 0xc5b0008
    .4byte -0x7ffffffc
    .4byte 0xc040000
    .4byte 0x10
    .4byte 0xc44
    .4byte 0xc1d4008
    .4byte 0x84010
    .4byte 0x40c5d
    .4byte 0x8000
    .4byte 0x100c04
    .4byte 0xc440000
    .4byte 0x40080000
    .4byte 0x40100c60
    .4byte 0xca00008
    .4byte -0x7ff7fffd
    .4byte 0xc820000
    .4byte 0x40080000
    .4byte 0x40100c63
    .4byte 0xca30008
    .4byte -0x7ffffffc
    .4byte 0xc040000
    .4byte 0x10
    .4byte 0xc44
    .4byte 0xc654008
    .4byte 0x84010
    .4byte 0x30ca5
    .4byte 0x8000
    .4byte 0xc67
    .4byte 0xc684008
    .4byte 0x84010
    .4byte 0x40ca8
    .4byte 0x8000
    .4byte 0xc67
    .4byte 0xc6a4008
    .4byte 0x84010
    .4byte -0x7ffff356
    .4byte 0xc6c0018
    .4byte 0x3
    .4byte 0xc6d0000
    .4byte 0x40080000
    .4byte 0x40100c6e
    .4byte 0xcae0008
    .4byte 0x80001
    .4byte 0xc784000
    .4byte 0x2
    .4byte 0xcc24000
    .4byte 0x4010
    .4byte 0x10d02
    .4byte 0x8008
    .4byte 0x20c7a
    .4byte 0x40000000
    .4byte 0x40100cc4
    .4byte 0xd040000
    .4byte 0x80001
    .4byte 0xc7b4000
    .4byte -0x7ffffffe
    .4byte 0xcc60000
    .4byte 0x10
    .4byte 0x20d06
    .4byte 0x40000008
    .4byte 0x40180cc8
    .4byte 0xd080000
    .4byte 0x2
    .4byte 0xcca4000
    .4byte 0x4010
    .4byte 0x20d0a
    .4byte 0x8000
    .4byte 0x100ccc
    .4byte 0xd0c0000
    .4byte -0x7ffffffe
    .4byte 0xc7f0000
    .4byte 0x8010
    .4byte 0x20cbf
    .4byte 0x40000000
    .4byte 0x40100ccd
    .4byte 0xd0d0000
    .4byte -0x7ffffffe
    .4byte 0xccf0000
    .4byte 0x10
    .4byte 0x10d0f
    .4byte 0x40000008
    .4byte 0x10c7d
    .4byte 0x40000008
    .4byte 0x10cb8
    .4byte 0x40000008
    .4byte 0x20cba
    .4byte 0x40000008
    .4byte 0x40180cd0
    .4byte 0xd100000
    .4byte 0x80002
    .4byte 0xcd24000
    .4byte 0x4018
    .4byte 0x20d12
    .4byte 0x8000
    .4byte 0x100cd4
    .4byte 0xd140000
    .4byte -0x7ff7ffff
    .4byte 0xcbc0000
    .4byte -0x7ffffffe
    .4byte 0xcd50000
    .4byte 0x10
    .4byte 0x10d15
    .4byte 0x40000008
    .4byte 0x10cbd
    .4byte 0x40000008
    .4byte 0x20cf8
    .4byte 0x40000008
    .4byte 0x20cfa
    .4byte 0x40000008
    .4byte 0x20cfc
    .4byte 0x40000008
    .4byte 0x40180cd6
    .4byte 0xd160000
    .4byte 0x80001
    .4byte 0xcfe4000
    .4byte -0x7ff7ffff
    .4byte 0xc3f0000
    .4byte gUnknown_08A2FBE0 + 0x104
    .4byte 0x1900
    .4byte gUnknown_08A2FBE0 + 0x112
    .4byte 0x1100
    .4byte gUnknown_08A2FBE0 + 0x12c
    .4byte 0x1200
    .4byte gUnknown_08A2FBE0 + 0x146
    .4byte 0x1400
    .4byte gUnknown_08A2FBE0 + 0x160
    .4byte 0x1000
    .4byte gUnknown_08A2FBE0 + 0x17a
    .4byte 0x1000
    .4byte gUnknown_08A2FBE0 + 0x194
    .4byte 0x1200
    .4byte gUnknown_08A2FBE0 + 0x1ae
    .4byte 0x1400
    .4byte gUnknown_08A2FBE0 + 0x1c8
    .4byte 0xf00
    .4byte gUnknown_08A2FBE0 + 0x1e2
    .4byte 0x1600
    .4byte gUnknown_08A2FDD0
    .4byte 0x1500
    .4byte gUnknown_08A2FDD0 + 0x1a
    .4byte 0x1100
    .4byte gUnknown_08A2FE00 + 0x4
    .4byte 0x1600
    .4byte gUnknown_08A2FE00 + 0x1e
    .4byte 0x1400
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A2FE00 + 0x38
    .4byte 0x1000
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A2FE00 + 0x52
    .4byte 0x1500
    .4byte gUnknown_08A2FE00 + 0x6c
    .4byte 0x1700
    .4byte gUnknown_08A2FE00 + 0x80
    .4byte 0x1100
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A2FE00 + 0x9a
    .4byte 0x1300
    .4byte gUnknown_08A2FE00 + 0xae
    .4byte 0x1800
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A2FE00 + 0xc8
    .4byte 0x1700
    .4byte gUnknown_08A2FE00 + 0xdc
    .4byte 0x800
    .4byte gUnknown_08A2FE00 + 0xe4
    .4byte 0x900
    .4byte gUnknown_08A2FE00 + 0xf2
    .4byte 0x600
    .4byte gUnknown_08A2FE00 + 0xfa
    .4byte 0x800
    .4byte gUnknown_08A2FE00 + 0x108
    .4byte 0x800
    .4byte gUnknown_08A2FE00 + 0x110
    .4byte 0x700
    .4byte gUnknown_08A2FE00 + 0x11e
    .4byte 0xb01
    .4byte gUnknown_08A2FE00 + 0x12c
    .4byte 0x901
    .4byte gUnknown_08A2FE00 + 0x13a
    .4byte 0x600
    .4byte gUnknown_08A2FE00 + 0x148
    .4byte 0x701
    .4byte gUnknown_08A2FE00 + 0x156
    .4byte 0x901
    .4byte gUnknown_08A2FE00 + 0x164
    .4byte 0x601
    .4byte gUnknown_08A2FE00 + 0x172
    .4byte 0xd00
    .4byte gUnknown_08A2FE00 + 0x17a
    .4byte 0x900
    .4byte gUnknown_08A2FE00 + 0x182
    .4byte 0x700
    .4byte gUnknown_08A2FE00 + 0x18a
    .4byte 0x800
    .4byte gUnknown_08A2FE00 + 0x198
    .4byte 0xa00
    .4byte gUnknown_08A2FE00 + 0x1a6
    .4byte 0x700
    .4byte gUnknown_08A2FE00 + 0x1b4
    .4byte 0x700
    .4byte gUnknown_08A2FE00 + 0x1bc
    .4byte 0x600
    .4byte gUnknown_08A2FE00 + 0x1ca
    .4byte 0x901
    .4byte gUnknown_08A2FE00 + 0x1d2
    .4byte 0x801
    .4byte gUnknown_08A2FE00 + 0x1da
    .4byte 0xc01
    .4byte gUnknown_08A2FE00 + 0x1e2
    .4byte 0x901
    .4byte gUnknown_08A2FE00 + 0x1ea
    .4byte 0xa01
    .4byte gUnknown_08A2FE00 + 0x1f8
    .4byte 0x801

	.global gUnknown_08A301A8
gUnknown_08A301A8:  @ 0x08A301A8
@ Replacing .incbin "baserom.gba", 0xA301A8, 0x8
    .4byte gUnknown_08A2FE00 + 0x200
    .4byte 0x500

	.global gUnknown_08A301B0
gUnknown_08A301B0:  @ 0x08A301B0
	.incbin "baserom.gba", 0xA301B0, 0x5D0

	.global gUnknown_08A30780
gUnknown_08A30780:  @ 0x08A30780
	.incbin "baserom.gba", 0xA30780, 0x80

	.global gUnknown_08A30800
gUnknown_08A30800:  @ 0x08A30800
	.incbin "baserom.gba", 0xA30800, 0x178

	.global gUnknown_08A30978
gUnknown_08A30978:  @ 0x08A30978
	.incbin "baserom.gba", 0xA30978, 0x4B4

	.global gUnknown_08A30E2C
gUnknown_08A30E2C:  @ 0x08A30E2C
	.incbin "baserom.gba", 0xA30E2C, 0x465C

	.global gUnknown_08A35488
gUnknown_08A35488:  @ 0x08A35488
	.incbin "baserom.gba", 0xA35488, 0x4B4

	.global gUnknown_08A3593C
gUnknown_08A3593C:  @ 0x08A3593C
	.incbin "baserom.gba", 0xA3593C, 0x100

	.global gUnknown_08A35A3C
gUnknown_08A35A3C:  @ 0x08A35A3C
	.incbin "baserom.gba", 0xA35A3C, 0x594

	.global gUnknown_08A35FD0
gUnknown_08A35FD0:  @ 0x08A35FD0
	.incbin "baserom.gba", 0xA35FD0, 0xF8

	.global gUnknown_08A360C8
gUnknown_08A360C8:  @ 0x08A360C8
	.incbin "baserom.gba", 0xA360C8, 0x20

	.global gUnknown_08A360E8
gUnknown_08A360E8:  @ 0x08A360E8
	.incbin "baserom.gba", 0xA360E8, 0x19C

	.global gUnknown_08A36284
gUnknown_08A36284:  @ 0x08A36284
	.incbin "baserom.gba", 0xA36284, 0xB4

	.global gUnknown_08A36338
gUnknown_08A36338:  @ 0x08A36338
	.incbin "baserom.gba", 0xA36338, 0xF88

	.global gUnknown_08A372C0
gUnknown_08A372C0:  @ 0x08A372C0
	.incbin "baserom.gba", 0xA372C0, 0x40

	.global gUnknown_08A37300
gUnknown_08A37300:  @ 0x08A37300
	.incbin "baserom.gba", 0xA37300, 0x1E70

	.global gUnknown_08A39170
gUnknown_08A39170:  @ 0x08A39170
	.incbin "baserom.gba", 0xA39170, 0x10

	.global gUnknown_08A39180
gUnknown_08A39180:  @ 0x08A39180
	.incbin "baserom.gba", 0xA39180, 0xC

	.global gUnknown_08A3918C
gUnknown_08A3918C:  @ 0x08A3918C
	.incbin "baserom.gba", 0xA3918C, 0xC

	.global gUnknown_08A39198
gUnknown_08A39198:  @ 0x08A39198
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, -0x1
        .word sub_8014BD0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispSuspend
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A391D0
gUnknown_08A391D0:  @ 0x08A391D0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8010E50
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispResume
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshBMapGraphics
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80160D0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D8C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A39210
gUnknown_08A39210:  @ 0x08A39210
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B4B7C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B4BEC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B4474
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08A394C0 + 0x10
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B432C
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B4350
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B43A8
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B4474
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B44A8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B4630
        @ PROC_GOTO
        .short 0xc, 0x9
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B4760
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B4774
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B4788
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B47B4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B4930
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B49B8
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B49CC
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B49E8
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x9
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B464C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B46B0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B4730
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B474C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x7
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B46FC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B471C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xb
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B46CC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x7
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xd
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B4A40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B4A54
        @ PROC_LABEL
        .short 0xb, 0xc
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B49F8
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x2
        .word sub_8014BD0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B4A20
        @ PROC_END_EACH
        .short 0x9, 0x0
        .word gUnknown_08A394C0 + 0x10
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B4BB0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A39478
gUnknown_08A39478:  @ 0x08A39478
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B5040
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A39488
gUnknown_08A39488:  @ 0x08A39488
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B5148
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A39498
gUnknown_08A39498:  @ 0x08A39498
	.incbin "baserom.gba", 0xA39498, 0x28

	.global gUnknown_08A394C0
gUnknown_08A394C0:  @ 0x08A394C0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B52A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
@ Replacing .incbin "baserom.gba", 0xA394D0, 0x8
    .4byte 0x3
    .4byte sub_80B5378

	.global gUnknown_08A394D8
gUnknown_08A394D8:  @ 0x08A394D8
@ replacing .incbin "baserom.gba", 0x00a394d8, 0x4
.4byte gUnknown_0203EF68 + 0x30

	.global gUnknown_08A394DC
gUnknown_08A394DC:  @ 0x08A394DC
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, -0x1
        .word sub_8014BD0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispSuspend
        @ PROC_CALL_ARG
        .short 0x18, 0x38
        .word sub_8014BC0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B57A0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B5998
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B59CC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B59EC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B5A38
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B5A7C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B5A90
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x2
        .word sub_8014BD0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B5AB4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispResume
        @ PROC_JUMP
        .short 0xd, 0x0
        .word gUnknown_08A3963C
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B5BE4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8010E50
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispResume
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshBMapGraphics
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80160D0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D8C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3963C
gUnknown_08A3963C:  @ 0x08A3963C
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B5B00
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispSuspend
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08A3972C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B57A0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B5B18
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B5B9C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_END_EACH
        .short 0x9, 0x0
        .word gUnknown_08A3972C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x2
        .word sub_8014BD0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B5970
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B5BE4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8010E50
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispResume
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshBMapGraphics
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80160D0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D8C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A3972C
gUnknown_08A3972C:  @ 0x08A3972C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B5CE0
        @ PROC_SLEEP
        .short 0xe, 0xd2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B5D2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A3974C
gUnknown_08A3974C:  @ 0x08A3974C
	.incbin "baserom.gba", 0xA3974C, 0xA3CB04 - 0xA3974C

	.global gUnknown_08A3CB04
gUnknown_08A3CB04:  @ 0x08A3CB04
	.incbin "baserom.gba", 0xA3CB04, 0x1A

	.global gUnknown_08A3CB1E
gUnknown_08A3CB1E:  @ 0x08A3CB1E
	.incbin "baserom.gba", 0xA3CB1E, 0xC

	.global gUnknown_08A3CB2A
gUnknown_08A3CB2A:  @ 0x08A3CB2A
	.incbin "baserom.gba", 0xA3CB2A, 0x10

	.global gUnknown_08A3CB3A
gUnknown_08A3CB3A:  @ 0x08A3CB3A
	.incbin "baserom.gba", 0xA3CB3A, 0xC

	.global gUnknown_08A3CB46
gUnknown_08A3CB46:  @ 0x08A3CB46
	.incbin "baserom.gba", 0xA3CB46, 0xA

	.global gUnknown_08A3CB50
gUnknown_08A3CB50:  @ 0x08A3CB50
@ Replacing .incbin "baserom.gba", 0xA3CB50, 0x19C
    .4byte 0x50003c
    .4byte 0x960078
    .4byte 0xc800c8
    .4byte gUnknown_08A4D0CC + 0x11c
    .4byte gUnknown_08A4D0CC + 0x6ec
    .4byte gUnknown_08A4D0CC + 0xeec
    .4byte gUnknown_08A4D0CC + 0x1710
    .4byte gUnknown_08A4D0CC + 0x1f74
    .4byte gUnknown_08A4D0CC + 0x27cc
    .4byte gUnknown_08A4D0CC + 0x304c
    .4byte gUnknown_08A4D0CC + 0x38b4
    .4byte gUnknown_08A4D0CC + 0x4124
    .4byte gUnknown_08A4D0CC + 0x4984
    .4byte gUnknown_08A4D0CC + 0x518c
    .4byte gUnknown_08A4D0CC + 0x5918
    .4byte gUnknown_08A4D0CC + 0x6130
    .4byte gUnknown_08A4D0CC + 0x6944
    .4byte gUnknown_08A4D0CC + 0x7150
    .4byte gUnknown_08A4D0CC + 0x7964
    .4byte gUnknown_08A4D0CC + 0x81a8
    .4byte gUnknown_08A4D0CC + 0x8950
    .4byte gUnknown_08A4D0CC + 0x9144
    .4byte gUnknown_08A4D0CC + 0x9958
    .4byte gUnknown_08A4D0CC + 0xa134
    .4byte gUnknown_08A4D0CC + 0xa964
    .4byte gUnknown_08A4D0CC + 0xb1bc
    .4byte gUnknown_08A4D0CC + 0xba18
    .4byte gUnknown_08A4D0CC + 0xc28c
    .4byte gUnknown_08A4D0CC + 0xcb0c
    .4byte gUnknown_08A4D0CC + 0xd368
    .4byte gUnknown_08A4D0CC + 0xdb68
    .4byte gUnknown_08A4D0CC + 0xe2c4
    .4byte gUnknown_08A4D0CC + 0xea88
    .4byte gUnknown_08A4D0CC + 0xf284
    .4byte gUnknown_08A4D0CC + 0xfa54
    .4byte gUnknown_08A4D0CC + 0x1022c
    .4byte gUnknown_08A4D0CC + 0x109a4
    .4byte gUnknown_08A4D0CC + 0x111b0
    .4byte gUnknown_08A4D0CC + 0x119d0
    .4byte gUnknown_08A4D0CC + 0x12224
    .4byte gUnknown_08A4D0CC + 0x12a54
    .4byte gUnknown_08A4D0CC + 0x13220
    .4byte gUnknown_08A4D0CC + 0x13a58
    .4byte gUnknown_08A4D0CC + 0x142bc
    .4byte gUnknown_08A4D0CC + 0x14af8
    .4byte gUnknown_08A4D0CC + 0x1535c
    .4byte gUnknown_08A4D0CC + 0x15bc0
    .4byte gUnknown_08A4D0CC + 0x16420
    .4byte gUnknown_08A4D0CC + 0x16c98
    .4byte gUnknown_08A4D0CC + 0x17504
    .4byte gUnknown_08A4D0CC + 0x17d20
    .4byte gUnknown_08A4D0CC + 0x18550
    .4byte gUnknown_08A4D0CC + 0x18d68
    .4byte gUnknown_08A4D0CC + 0x19568
    .4byte gUnknown_08A4D0CC + 0x19d18
    .4byte gUnknown_08A4D0CC + 0x1a4fc
    .4byte gUnknown_08A4D0CC + 0x1acf4
    .4byte gUnknown_08A4D0CC + 0x1b530
    .4byte gUnknown_08A4D0CC + 0x1bd6c
    .4byte gUnknown_08A4D0CC + 0x1c5c8
    .4byte gUnknown_08A4D0CC + 0x1cdf8
    .4byte gUnknown_08A4D0CC + 0x1d600
    .4byte gUnknown_08A4D0CC + 0x1ddb8
    .4byte gUnknown_08A4D0CC + 0x1e4f8
    .4byte gUnknown_08A4D0CC + 0x1ed0c
    .4byte gUnknown_08A4D0CC + 0x1f560
    .4byte gUnknown_08A4D0CC + 0x1fdb4
    .4byte gUnknown_08A4D0CC + 0x20610
    .4byte gUnknown_08A4D0CC + 0x20e84
    .4byte gUnknown_08A4D0CC + 0x21700
    .4byte gUnknown_08A4D0CC + 0x21f74
    .4byte gUnknown_08A4D0CC + 0x227c8
    .4byte gUnknown_08A4D0CC + 0x23018
    .4byte gUnknown_08A708A7 + 0x4d
    .4byte gUnknown_08A708A7 + 0x65d
    .4byte gUnknown_08A708A7 + 0xe39
    .4byte gUnknown_08A708A7 + 0x163d
    .4byte gUnknown_08A708A7 + 0x1e71
    .4byte gUnknown_08A708A7 + 0x269d
    .4byte gUnknown_08A708A7 + 0x2ef9
    .4byte gUnknown_08A708A7 + 0x3749
    .4byte gUnknown_08A708A7 + 0x3f65
    .4byte gUnknown_08A708A7 + 0x474d
    .4byte gUnknown_08A708A7 + 0x4f91
    .4byte gUnknown_08A708A7 + 0x5709
    .4byte gUnknown_08A708A7 + 0x5f55
    .4byte gUnknown_08A708A7 + 0x67c9
    .4byte gUnknown_08A708A7 + 0x7031
    .4byte gUnknown_08A708A7 + 0x7845
    .4byte gUnknown_08A708A7 + 0x8085
    .4byte gUnknown_08A708A7 + 0x88e1
    .4byte gUnknown_08A708A7 + 0x9145
    .4byte gUnknown_08A708A7 + 0x9971
    .4byte gUnknown_08A708A7 + 0xa165
    .4byte gUnknown_08A708A7 + 0xa94d
    .4byte gUnknown_08A708A7 + 0xb185
    .4byte gUnknown_08A708A7 + 0xb9d9
    .4byte gUnknown_08A708A7 + 0xc229
    .4byte gUnknown_08A708A7 + 0xca7d
    .4byte gUnknown_08A708A7 + 0xd2c9
    .4byte gUnknown_08A708A7 + 0xdb39
    .4byte gUnknown_08A708A7 + 0xe395
    .4byte gUnknown_08A708A7 + 0xebed

	.global gUnknown_08A3CCEC
gUnknown_08A3CCEC:  @ 0x08A3CCEC
@ replacing .incbin "baserom.gba", 0x00a3ccec, 0x78
.4byte gUnknown_08A3CB50 + 0xc
.4byte gUnknown_08A708A7 + 0xf435
.4byte gUnknown_08A708A7 + 0x1233d
.4byte gUnknown_08A3CB50 + 0x34
.4byte gUnknown_08A708A7 + 0xf8e9
.4byte gUnknown_08A708A7 + 0x123fd
.4byte gUnknown_08A3CB50 + 0x5c
.4byte gUnknown_08A708A7 + 0xfd9d
.4byte gUnknown_08A708A7 + 0x124bd
.4byte gUnknown_08A3CB50 + 0x84
.4byte gUnknown_08A708A7 + 0x10251
.4byte gUnknown_08A708A7 + 0x1257d
.4byte gUnknown_08A3CB50 + 0xac
.4byte gUnknown_08A708A7 + 0x10705
.4byte gUnknown_08A708A7 + 0x1263d
.4byte gUnknown_08A3CB50 + 0xd4
.4byte gUnknown_08A708A7 + 0x10bb9
.4byte gUnknown_08A708A7 + 0x126fd
.4byte gUnknown_08A3CB50 + 0xfc
.4byte gUnknown_08A708A7 + 0x1106d
.4byte gUnknown_08A708A7 + 0x127bd
.4byte gUnknown_08A3CB50 + 0x124
.4byte gUnknown_08A708A7 + 0x11521
.4byte gUnknown_08A708A7 + 0x1287d
.4byte gUnknown_08A3CB50 + 0x14c
.4byte gUnknown_08A708A7 + 0x119d5
.4byte gUnknown_08A708A7 + 0x1293d
.4byte gUnknown_08A3CB50 + 0x174
.4byte gUnknown_08A708A7 + 0x11e89
.4byte gUnknown_08A708A7 + 0x129fd

	.global gUnknown_08A3CD64
gUnknown_08A3CD64:  @ 0x08A3CD64
	.incbin "baserom.gba", 0xA3CD64, 0x444

	.global gUnknown_08A3D1A8
gUnknown_08A3D1A8:  @ 0x08A3D1A8
@ replacing .incbin "baserom.gba", 0x00a3d1a8, 0x8
.4byte gUnknown_08A3CD64 + 0x4
.4byte gUnknown_08A3CD64 + 0x224

	.global gUnknown_08A3D1B0
gUnknown_08A3D1B0:  @ 0x08A3D1B0
	.incbin "baserom.gba", 0xA3D1B0, 0x110

	.global gUnknown_08A3D2C0
gUnknown_08A3D2C0:  @ 0x08A3D2C0
	.incbin "baserom.gba", 0xA3D2C0, 0x88

	.global gUnknown_08A3D348
gUnknown_08A3D348:  @ 0x08A3D348
@ replacing .incbin "baserom.gba", 0x00a3d348, 0x10
.4byte gUnknown_020007A0
.4byte gUnknown_02000F00 + 0xa0
.4byte gUnknown_02001188 + 0x618
.4byte gUnknown_02001F70 + 0x30

	.global gUnknown_08A3D358
gUnknown_08A3D358:  @ 0x08A3D358
@ replacing .incbin "baserom.gba", 0x00a3d358, 0x4
.4byte gTradeMenuText + 0x14

	.global gUnknown_08A3D35C
gUnknown_08A3D35C:  @ 0x08A3D35C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B696C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6AE0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B69D4
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6BD8
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6C00
        @ PROC_SLEEP
        .short 0xe, 0x72
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x63
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6AE0
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x64
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x7
        .word sub_8014BD0
        @ PROC_CALL_ARG
        .short 0x18, 0x2
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6C14
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D40C
gUnknown_08A3D40C:  @ 0x08A3D40C
    .incbin "baserom.gba", 0xA3D40C, 0x14

	.global gUnknown_08A3D420
gUnknown_08A3D420:  @ 0x08A3D420
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6D24
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B6ED0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D440
gUnknown_08A3D440:  @ 0x08A3D440
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6F34
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B71DC
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B723C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B7274
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D478
gUnknown_08A3D478:  @ 0x08A3D478
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B72C4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B734C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D498
gUnknown_08A3D498:  @ 0x08A3D498
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B74B0
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B74D8
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word sub_8014BD0
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x64
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B7500
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B7540
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x64
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B7574
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D540
gUnknown_08A3D540:  @ 0x08A3D540
	.incbin "baserom.gba", 0xA3D540, 0x20

	.global gUnknown_08A3D560
gUnknown_08A3D560:  @ 0x08A3D560
	.incbin "baserom.gba", 0xA3D560, 0xE

	.global gUnknown_08A3D56E
gUnknown_08A3D56E:  @ 0x08A3D56E
	.incbin "baserom.gba", 0xA3D56E, 0xE

	.global gUnknown_08A3D57C
gUnknown_08A3D57C:  @ 0x08A3D57C
	.incbin "baserom.gba", 0xA3D57C, 0xE

	.global gUnknown_08A3D58A
gUnknown_08A3D58A:  @ 0x08A3D58A
	.incbin "baserom.gba", 0xA3D58A, 0xE

	.global gUnknown_08A3D598
gUnknown_08A3D598:  @ 0x08A3D598
	.incbin "baserom.gba", 0xA3D598, 0xE

	.global gUnknown_08A3D5A6
gUnknown_08A3D5A6:  @ 0x08A3D5A6
	.incbin "baserom.gba", 0xA3D5A6, 0xE

	.global gUnknown_08A3D5B4
gUnknown_08A3D5B4:  @ 0x08A3D5B4
	.incbin "baserom.gba", 0xA3D5B4, 0x70

	.global gUnknown_08A3D624
gUnknown_08A3D624:  @ 0x08A3D624
@ replacing .incbin "baserom.gba", 0x00a3d624, 0x18
.4byte gUnknown_08A3D5B4 + 0x36
.4byte gUnknown_08A3D5B4 + 0x2e
.4byte gUnknown_08A3D5B4 + 0x26
.4byte gUnknown_08A3D5B4 + 0x1e
.4byte gUnknown_08A3D5B4 + 0x16
.4byte gUnknown_08A3D5B4 + 0xe

	.global gUnknown_08A3D63C
gUnknown_08A3D63C:  @ 0x08A3D63C
@ replacing .incbin "baserom.gba", 0x00a3d63c, 0x18
.4byte gUnknown_08A3D5B4 + 0x66
.4byte gUnknown_08A3D5B4 + 0x5e
.4byte gUnknown_08A3D5B4 + 0x56
.4byte gUnknown_08A3D5B4 + 0x4e
.4byte gUnknown_08A3D5B4 + 0x46
.4byte gUnknown_08A3D5B4 + 0x3e

	.global gUnknown_08A3D654
gUnknown_08A3D654:  @ 0x08A3D654
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B75AC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B7614
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A3D674
gUnknown_08A3D674:  @ 0x08A3D674
@ replacing .incbin "baserom.gba", 0x00a3d674, 0x4
.4byte gTradeMenuText + 0x14

	.global gUnknown_08A3D678
gUnknown_08A3D678:  @ 0x08A3D678
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B7648
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B770C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B8014
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B7B30
        @ PROC_SLEEP
        .short 0xe, 0x78
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B8168
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D6E0
gUnknown_08A3D6E0:  @ 0x08A3D6E0
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B820C
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D700
gUnknown_08A3D700:  @ 0x08A3D700
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_57
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B823C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B8630
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D728
gUnknown_08A3D728:  @ 0x08A3D728
	.incbin "baserom.gba", 0xA3D728, 0x20

	.global gUnknown_08A3D748
gUnknown_08A3D748:  @ 0x08A3D748
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word WorldMap_Destruct
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B8FD4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_CALL_ARG
        .short 0x18, 0x1
        .word sub_8014BD0
        @ PROC_SLEEP
        .short 0xe, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word WorldMap_SetupChapterStuff
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B9BA4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9D14
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9D04
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9A34
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9DB8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B9DC4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9D04
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9F54
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9A34
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF13C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3E80
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B97F8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B9804
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF15C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3E94
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BC454
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF15C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3E94
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B8A7C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B8B3C
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B8BA4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B96DC
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x9
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9820
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_GOTO
        .short 0xc, 0x17
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_80B987C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B989C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B98A8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xb
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_80B98F8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9918
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9924
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xc
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_80B9974
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9994
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B99A0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xd
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9FD4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL
        .short 0x2, 0x0
        .word Make6C_savemenu2
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_GOTO
        .short 0xc, 0x17
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xe
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF15C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3E94
        @ PROC_LABEL
        .short 0xb, 0xf
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word WorldMap_InitChapterTransition
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WorldMap_WaitForChapterIntroEvents
        @ PROC_CALL
        .short 0x2, 0x0
        .word WorldMap_HideEverything
        @ PROC_GOTO
        .short 0xc, 0x19
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x10
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF15C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3E94
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9A58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B9A94
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9AB0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9AEC
        @ PROC_GOTO
        .short 0xc, 0x19
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x11
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9DE0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B9E40
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x12
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF15C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3E94
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BC5B4
        @ PROC_SLEEP
        .short 0xe, 0x6
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x13
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9F14
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_GOTO
        .short 0xc, 0x18
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x14
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9F24
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_GOTO
        .short 0xc, 0x18
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x15
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9F34
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_GOTO
        .short 0xc, 0x18
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x16
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9F44
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_GOTO
        .short 0xc, 0x18
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x18
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B982C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_GOTO
        .short 0xc, 0x12
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x17
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B982C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x19
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9EA4
        @ PROC_CALL
        .short 0x2, 0x0
        .word DoNothing
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DD08
gUnknown_08A3DD08:  @ 0x08A3DD08
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BA06C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DD20
gUnknown_08A3DD20:  @ 0x08A3DD20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BA100
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DD38
gUnknown_08A3DD38:  @ 0x08A3DD38
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BA1F4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DD50
gUnknown_08A3DD50:  @ 0x08A3DD50
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word NewWorldMap
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gUnknown_08A3D748
        @ PROC_END_EACH
        .short 0x9, 0x0
        .word gUnknown_08A20DA4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DD88
gUnknown_08A3DD88:  @ 0x08A3DD88
	.incbin "baserom.gba", 0xA3DD88, 0x6C

	.global gUnknown_08A3DDF4
gUnknown_08A3DDF4:  @ 0x08A3DDF4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205f60
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BA61C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BA628
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA3DDF4 + 0x28, 0x90 - 0x28

	.global gUnknown_08A3DE84
gUnknown_08A3DE84:  @ 0x08A3DE84
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205f70
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word MapScreen_OnDelete
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapScreen_Init
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BA490
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BA4D0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BAB00
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BAB0C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DECC
gUnknown_08A3DECC:  @ 0x08A3DECC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205f84
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word GmapUnit_Destruct
        @ PROC_CALL
        .short 0x2, 0x0
        .word GmapUnit_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word GmapUnit_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DEFC
gUnknown_08A3DEFC:  @ 0x08A3DEFC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205f84
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word GmapUnitContainer_Destruct
        @ PROC_CALL
        .short 0x2, 0x0
        .word GmapUnitContainer_Init
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DF2C
gUnknown_08A3DF2C:  @ 0x08A3DF2C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205f90
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word GmapUnitFade_Destruct
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word GmapUnitFade_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word GmapUnitFade_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DF64
gUnknown_08A3DF64:  @ 0x08A3DF64
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x820648c
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word GmapScreen2_Destruct
        @ PROC_CALL
        .short 0x2, 0x0
        .word GmapScreen2_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word GmapScreen2_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DF94
gUnknown_08A3DF94:  @ 0x08A3DF94
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82064b0
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_59
        @ PROC_CALL
        .short 0x2, 0x0
        .word GmapCursor_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word GmapCursor_Destruct
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DFC4
gUnknown_08A3DFC4:  @ 0x08A3DFC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82067f4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_38
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BBEB8
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BBF60
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word MapRoute_StartTransition
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_80BC0F4
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word MapRoute_EnableBGSyncs
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapRoute_TransitionLoop
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word MapRoute_TransitionEnd
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
@ Replacing .incbin "baserom.gba", 0xA3DFC4 + 0x88, 0x160 - 0x88
    .4byte gUnknown_08206674 + 0x1ac
    .4byte 0x6df0645
    .4byte 0x0
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_80BC4C4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x1a4
    .4byte 0x6e00646
    .4byte 0x100
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_80BC4DC
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x19c
    .4byte 0x6e50647
    .4byte 0x200
    .4byte MapMenu_IsGuideCommandAvailable
    .4byte sub_80BC4F4
    .4byte sub_80BC56C
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x194
    .4byte 0x6e10648
    .4byte 0x300
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_80BC584
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x18c
    .4byte 0x6790649
    .4byte 0x400
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_80BC59C
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0

	.global gUnknown_08A3E124
gUnknown_08A3E124:  @ 0x08A3E124
@ Replacing .incbin "baserom.gba", 0xA3E124, 0x24
    .4byte 0x60101
    .4byte 0x0
    .4byte gUnknown_08A3DFC4 + 0x88
    .4byte sub_80BC490
    .4byte sub_80BC4A0
    .4byte 0x0
    .4byte sub_80BC4AC
    .4byte MenuAutoHelpBoxSelect
    .4byte MenuStdHelpBox

	.global gUnknown_08A3E148
gUnknown_08A3E148:  @ 0x08A3E148
@ Replacing .incbin "baserom.gba", 0xA3E148, 0xB8
    .4byte 0x70101
    .4byte gUnknown_08206674 + 0x1e4
    .4byte 0x6cf066e
    .4byte 0x0
    .4byte sub_80BC674
    .4byte 0x0
    .4byte sub_80BC77C
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x1d4
    .4byte 0x6d0066f
    .4byte 0x100
    .4byte sub_80BC6AC
    .4byte 0x0
    .4byte sub_80BC7A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x1c4
    .4byte 0x6d10670
    .4byte 0x200
    .4byte sub_80BC6E4
    .4byte 0x0
    .4byte sub_80BC7CC
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x1b4
    .4byte 0x6780671
    .4byte 0x300
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_80BC7F4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0

	.global gUnknown_08A3E200
gUnknown_08A3E200:  @ 0x08A3E200
@ Replacing .incbin "baserom.gba", 0xA3E200, 0x24
    .4byte 0x80a14
    .4byte 0x0
    .4byte gUnknown_08A3E148 + 0x4
    .4byte sub_80BC634
    .4byte sub_80BC644
    .4byte 0x0
    .4byte sub_80BC650
    .4byte MenuAutoHelpBoxSelect
    .4byte MenuStdHelpBox

	.global gUnknown_08A3E224
gUnknown_08A3E224:  @ 0x08A3E224
	.incbin "baserom.gba", 0xA3E224, 0x4

	.global gUnknown_08A3E228
gUnknown_08A3E228:  @ 0x08A3E228
	.incbin "baserom.gba", 0xA3E228, 0x4

	.global gUnknown_08A3E22C
gUnknown_08A3E22C:  @ 0x08A3E22C
	.incbin "baserom.gba", 0xA3E22C, 0x10

	.global gUnknown_08A3E23C
gUnknown_08A3E23C:  @ 0x08A3E23C
@ Replacing .incbin "baserom.gba", 0xA3E23C, 0xC
    .4byte 0x8001000
    .4byte 0x1000
    .4byte 0x0

	.global gUnknown_08A3E248
gUnknown_08A3E248:  @ 0x08A3E248
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206870
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_37
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD410
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_70
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD444
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BD830
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD9D8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BDA78
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E2C0
gUnknown_08A3E2C0:  @ 0x08A3E2C0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206880
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_49
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapMU_FillPrim
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E2F0
gUnknown_08A3E2F0:  @ 0x08A3E2F0
	.incbin "baserom.gba", 0xA3E2F0, 0x8

	.global gUnknown_08A3E2F8
gUnknown_08A3E2F8:  @ 0x08A3E2F8
	.incbin "baserom.gba", 0xA3E2F8, 0x24

	.global gUnknown_08A3E31C
gUnknown_08A3E31C:  @ 0x08A3E31C
	.incbin "baserom.gba", 0xA3E31C, 0x44

	.global gUnknown_08A3E360
gUnknown_08A3E360:  @ 0x08A3E360
	.incbin "baserom.gba", 0xA3E360, 0x2E

	.global gUnknown_08A3E38E
gUnknown_08A3E38E:  @ 0x08A3E38E
	.incbin "baserom.gba", 0xA3E38E, 0x2C

	.global gUnknown_08A3E3BA
gUnknown_08A3E3BA:  @ 0x08A3E3BA
	.incbin "baserom.gba", 0xA3E3BA, 0x58

	.global gUnknown_08A3E412
gUnknown_08A3E412:  @ 0x08A3E412
	.incbin "baserom.gba", 0xA3E412, 0x36

	.global gUnknown_08A3E448
gUnknown_08A3E448:  @ 0x08A3E448
	.incbin "baserom.gba", 0xA3E448, 0x10

	.global gUnknown_08A3E458
gUnknown_08A3E458:  @ 0x08A3E458
	.incbin "baserom.gba", 0xA3E458, 0x3

	.global gUnknown_08A3E45B
gUnknown_08A3E45B:  @ 0x08A3E45B
	.incbin "baserom.gba", 0xA3E45B, 0x3

	.global gUnknown_08A3E45E
gUnknown_08A3E45E:  @ 0x08A3E45E
	.incbin "baserom.gba", 0xA3E45E, 0x3

	.global gUnknown_08A3E461
gUnknown_08A3E461:  @ 0x08A3E461
	.incbin "baserom.gba", 0xA3E461, 0x3

	.global gUnknown_08A3E464
gUnknown_08A3E464:  @ 0x08A3E464
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206888
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BEFB8
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BEF6C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BEBD4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BEC58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BECB8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BEDCC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BEDD4
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E4D4
gUnknown_08A3E4D4:  @ 0x08A3E4D4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_WHILE
        .short 0x14, 0x0
        .word DoesBMXFADEExist
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF048
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E4F4
gUnknown_08A3E4F4:  @ 0x08A3E4F4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x820688c
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80BF180
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF190
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BF198
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E52C
gUnknown_08A3E52C:  @ 0x08A3E52C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82068a0
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80BF2AC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF2D0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BF2D8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E55C
gUnknown_08A3E55C:  @ 0x08A3E55C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82068b4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_50
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF5C4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BF5DC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E594
gUnknown_08A3E594:  @ 0x08A3E594
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82068c4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80BF804
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF890
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BFA1C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF8CC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BF988
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E5E4
gUnknown_08A3E5E4:  @ 0x08A3E5E4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82068d4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80BFB4C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BFB90
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BFBCC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BFC44
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E624
gUnknown_08A3E624:  @ 0x08A3E624
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82068d4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_48
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BFD80
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BFEF8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0080
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BFFD0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0144
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E6AC
gUnknown_08A3E6AC:  @ 0x08A3E6AC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82068e4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C0308
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C040C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C04CC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E6E4
gUnknown_08A3E6E4:  @ 0x08A3E6E4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x820690c
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_47
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C05AC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0610
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C05C4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0610
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C05F8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0610
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C05C4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0610
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C05F8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0610
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C06F0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C07B8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E78C
gUnknown_08A3E78C:  @ 0x08A3E78C
@ Replacing .incbin "baserom.gba", 0xA3E78C, 0xFC
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0x1c
    .4byte gUnknown_08A3E78C + 0xa8
    .4byte 0x0
    .4byte 0x50a8
    .4byte 0x0
    .4byte sub_80C0A10
    .4byte gUnknown_08A3E78C
    .4byte gUnknown_08A3E78C + 0x38
    .4byte gUnknown_08A3E78C + 0xc4
    .4byte 0x0
    .4byte 0x6e86888
    .4byte 0x0
    .4byte sub_80C0A44
    .4byte gUnknown_08A3E78C + 0x1c
    .4byte gUnknown_08A3E78C + 0x70
    .4byte gUnknown_08A3E78C + 0xe0
    .4byte gUnknown_08A3E78C + 0x54
    .4byte 0x5427888
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0x1c
    .4byte gUnknown_08A3E78C + 0x70
    .4byte gUnknown_08A3E78C + 0x38
    .4byte 0x0
    .4byte 0x54378a8
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0x38
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0xe0
    .4byte 0x0
    .4byte 0x5448888
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0xa8
    .4byte 0x0
    .4byte gUnknown_08A3E78C
    .4byte 0x6763020
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0x8c
    .4byte gUnknown_08A3E78C + 0xc4
    .4byte 0x0
    .4byte gUnknown_08A3E78C
    .4byte 0x6774810
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0xa8
    .4byte gUnknown_08A3E78C + 0xe0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0x1c
    .4byte 0x6f35810
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0xc4
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0x70
    .4byte 0x6f07818
    .4byte 0x0
    .4byte 0x0

	.global gUnknown_08A3E888
gUnknown_08A3E888:  @ 0x08A3E888
	.incbin "baserom.gba", 0xA3E888, 0x18

	.global gUnknown_08A3E8A0
gUnknown_08A3E8A0:  @ 0x08A3E8A0
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0EBC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A3E8B8
gUnknown_08A3E8B8:  @ 0x08A3E8B8
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C0E4C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C0DF0
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispSuspend
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C0CF4
        @ PROC_CALL
        .short 0x2, 0x0
        .word NewGreenTextColorManager
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C0C44
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C0E58
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08A3E8A0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0F00
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C0FA4
        @ PROC_CALL
        .short 0x2, 0x0
        .word MU_EndAll
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispResume
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA3E8B8 + 0x88, 0xE8 - 0x88

	.global gUnknown_08A3E9A0
gUnknown_08A3E9A0:  @ 0x08A3E9A0
@ Replacing .incbin "baserom.gba", 0xA3E9A0, 0x60
    .4byte gUnknown_08A3E8B8 + 0x88
    .4byte 0xf8f844
    .4byte gUnknown_08A3E8B8 + 0x90
    .4byte 0xf80044
    .4byte gUnknown_08A3E8B8 + 0x98
    .4byte 0xf844
    .4byte gUnknown_08A3E8B8 + 0xa0
    .4byte 0x44
    .4byte gUnknown_08A3E8B8 + 0xa8
    .4byte 0xf0f004
    .4byte gUnknown_08A3E8B8 + 0xb0
    .4byte 0xf00004
    .4byte gUnknown_08A3E8B8 + 0xb8
    .4byte 0xf004
    .4byte gUnknown_08A3E8B8 + 0xc0
    .4byte 0x4
    .4byte gUnknown_08A3E8B8 + 0xc8
    .4byte 0xe0e000
    .4byte gUnknown_08A3E8B8 + 0xd0
    .4byte 0xe00000
    .4byte gUnknown_08A3E8B8 + 0xd8
    .4byte 0xe000
    .4byte gUnknown_08A3E8B8 + 0xe0
    .4byte 0x0

	.global gUnknown_08A3EA00
gUnknown_08A3EA00:  @ 0x08A3EA00
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206920
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C0FB0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C0FE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C10B8
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EA38
gUnknown_08A3EA38:  @ 0x08A3EA38
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206930
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C128C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C12AC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1324
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EA70
gUnknown_08A3EA70:  @ 0x08A3EA70
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x820693c
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C1470
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C1480
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1524
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1624
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EAA8
gUnknown_08A3EAA8:  @ 0x08A3EAA8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206ab4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_72
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C18EC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1920
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1A58
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EAF0
gUnknown_08A3EAF0:  @ 0x08A3EAF0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206ac4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1E2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EB10
gUnknown_08A3EB10:  @ 0x08A3EB10
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206ac4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C1E40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1E54
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C1E70
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1E8C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EB50
gUnknown_08A3EB50:  @ 0x08A3EB50
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206ad4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C1F6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C1FDC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C1FE0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C205C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C20B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C210C
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2320
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2094
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2078
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C214C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C224C
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2398
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EBE8
gUnknown_08A3EBE8:  @ 0x08A3EBE8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206adc
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C2598
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C25B8
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C25F8
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2658
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EC48
gUnknown_08A3EC48:  @ 0x08A3EC48
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206b50
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C2728
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2750
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2804
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2964
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C29F8
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2A1C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C29F8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C28C4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C28DC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3ECB0
gUnknown_08A3ECB0:  @ 0x08A3ECB0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206adc
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C2C54
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2C58
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2D44
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2DA4
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3ED10
gUnknown_08A3ED10:  @ 0x08A3ED10
	.incbin "baserom.gba", 0xA3ED10, 0x8

	.global gUnknown_08A3ED18
gUnknown_08A3ED18:  @ 0x08A3ED18
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206b50
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C2E70
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2EA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2F7C
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2F9C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2F7C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A3ED60
gUnknown_08A3ED60:  @ 0x08A3ED60
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206b60
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C3124
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C31A8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C31C4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C31FC
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3220
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3264
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C31FC
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3280
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C32E4
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3350
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C31E0
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3244
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3264
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EE28
gUnknown_08A3EE28:  @ 0x08A3EE28
	.incbin "baserom.gba", 0xA3EE28, 0x1C

	.global gUnknown_08A3EE44
gUnknown_08A3EE44:  @ 0x08A3EE44
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C35C4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C35EC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EE6C
gUnknown_08A3EE6C:  @ 0x08A3EE6C
    .incbin "baserom.gba", 0x00a3ee6c, 0x4

	.global gUnknown_08A3EE70
gUnknown_08A3EE70:  @ 0x08A3EE70
	.incbin "baserom.gba", 0xA3EE70, 0x4

	.global gUnknown_08A3EE74
gUnknown_08A3EE74:  @ 0x08A3EE74
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206b84
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3D9C
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3AB8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3D24
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3B40
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3D5C
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EED4
gUnknown_08A3EED4:  @ 0x08A3EED4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3DAC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EEEC
gUnknown_08A3EEEC:  @ 0x08A3EEEC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206b90
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_71
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3EC8
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3EDC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3F24
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3F88
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3FB4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3FE0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3F04
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA3EEEC + 0xC8, 0x824 - 0xC8

	.global gUnknown_08A3F710
gUnknown_08A3F710:  @ 0x08A3F710
	.incbin "baserom.gba", 0xA3F710, 0x40

	.global gUnknown_08A3F750
gUnknown_08A3F750:  @ 0x08A3F750
	.incbin "baserom.gba", 0xA3F750, 0x89C

	.global gUnknown_08A3FFEC
gUnknown_08A3FFEC:  @ 0x08A3FFEC
    .incbin "baserom.gba", 0xA3FFEC, 0x7C

	.global gUnknown_08A40068
gUnknown_08A40068:  @ 0x08A40068
	.incbin "baserom.gba", 0xA40068, 0x7C

	.global gUnknown_08A400E4
gUnknown_08A400E4:  @ 0x08A400E4
	.incbin "baserom.gba", 0xA400E4, 0x120

	.global gUnknown_08A40204
gUnknown_08A40204:  @ 0x08A40204
	.incbin "baserom.gba", 0xA40204, 0x148

	.global gUnknown_08A4034C
gUnknown_08A4034C:  @ 0x08A4034C
	.incbin "baserom.gba", 0xA4034C, 0x124

	.global gUnknown_08A40470
gUnknown_08A40470:  @ 0x08A40470
	.incbin "baserom.gba", 0xA40470, 0x144

	.global gUnknown_08A405B4
gUnknown_08A405B4:  @ 0x08A405B4
	.incbin "baserom.gba", 0xA405B4, 0x20

	.global gUnknown_08A405D4
gUnknown_08A405D4:  @ 0x08A405D4
	.incbin "baserom.gba", 0xA405D4, 0x3FC

	.global gUnknown_08A409D0
gUnknown_08A409D0:  @ 0x08A409D0
	.incbin "baserom.gba", 0xA409D0, 0x104

	.global gUnknown_08A40AD4
gUnknown_08A40AD4:  @ 0x08A40AD4
@ Replacing .incbin "baserom.gba", 0xA40AD4, 0x40
    .4byte 0x63f70000
    .4byte 0x4fb15bf4
    .4byte 0x3b0a476d
    .4byte 0x536e32c7
    .4byte 0x42cb4b2c
    .4byte 0x2e483689
    .4byte 0x19a525e6
    .4byte 0x9021143
    .4byte 0x432f4290
    .4byte 0x2ea93aec
    .4byte 0x1a022665
    .4byte 0x326611c2
    .4byte 0x21c32a24
    .4byte 0xd421582
    .4byte gUnknown_08A2075C + 0x186
    .4byte DirectSoundData_mon_gog_move1_13k + 0x1e2

	.global gUnknown_08A40B14
gUnknown_08A40B14:  @ 0x08A40B14
	.incbin "baserom.gba", 0xA40B14, 0x4B4

	.global gUnknown_08A40FC8
gUnknown_08A40FC8:  @ 0x08A40FC8
	.incbin "baserom.gba", 0xA40FC8, 0xBF64

	.global gUnknown_08A4CF2C
gUnknown_08A4CF2C:  @ 0x08A4CF2C
	.incbin "baserom.gba", 0xA4CF2C, 0x1A0

	.global gUnknown_08A4D0CC
gUnknown_08A4D0CC:  @ 0x08A4D0CC
	.incbin "baserom.gba", 0xA4D0CC, 0x237DB

	.global gUnknown_08A708A7
gUnknown_08A708A7:  @ 0x08A708A7
	.incbin "baserom.gba", 0xA708A7, 0x12ABD

	.global gUnknown_08A83364
gUnknown_08A83364:  @ 0x08A83364
	.incbin "baserom.gba", 0xA83364, 0x12C00

	.global gUnknown_08A95F64
gUnknown_08A95F64:  @ 0x08A95F64
	.incbin "baserom.gba", 0xA95F64, 0x80

	.global gUnknown_08A95FE4
gUnknown_08A95FE4:  @ 0x08A95FE4
	.incbin "baserom.gba", 0xA95FE4, 0x80

	.global gUnknown_08A96064
gUnknown_08A96064:  @ 0x08A96064
	.incbin "baserom.gba", 0xA96064, 0x2A4

	.global gUnknown_08A96308
gUnknown_08A96308:  @ 0x08A96308
	.incbin "baserom.gba", 0xA96308, 0x1108

	.global gUnknown_08A97410
gUnknown_08A97410:  @ 0x08A97410
	.incbin "baserom.gba", 0xA97410, 0x630

	.global gUnknown_08A97A40
gUnknown_08A97A40:  @ 0x08A97A40
	.incbin "baserom.gba", 0xA97A40, 0x20

	.global gUnknown_08A97A60
gUnknown_08A97A60:  @ 0x08A97A60
	.incbin "baserom.gba", 0xA97A60, 0x20

	.global gUnknown_08A97A80
gUnknown_08A97A80:  @ 0x08A97A80
	.incbin "baserom.gba", 0xA97A80, 0x4C

	.global gUnknown_08A97ACC
gUnknown_08A97ACC:  @ 0x08A97ACC
	.incbin "baserom.gba", 0xA97ACC, 0x20

	.global gUnknown_08A97AEC
gUnknown_08A97AEC:  @ 0x08A97AEC
	.incbin "baserom.gba", 0xA97AEC, 0x1AC

	.global gUnknown_08A97C98
gUnknown_08A97C98:  @ 0x08A97C98
	.incbin "baserom.gba", 0xA97C98, 0x190

	.global gUnknown_08A97E28
gUnknown_08A97E28:  @ 0x08A97E28
	.incbin "baserom.gba", 0xA97E28, 0x20

	.global gUnknown_08A97E48
gUnknown_08A97E48:  @ 0x08A97E48
	.incbin "baserom.gba", 0xA97E48, 0x90

	.global gUnknown_08A97ED8
gUnknown_08A97ED8:  @ 0x08A97ED8
	.incbin "baserom.gba", 0xA97ED8, 0xCC

	.global gUnknown_08A97FA4
gUnknown_08A97FA4:  @ 0x08A97FA4
	.incbin "baserom.gba", 0xA97FA4, 0x71C

	.global gUnknown_08A986C0
gUnknown_08A986C0:  @ 0x08A986C0
	.incbin "baserom.gba", 0xA986C0, 0x538

	.global gUnknown_08A98BF8
gUnknown_08A98BF8:  @ 0x08A98BF8
	.incbin "baserom.gba", 0xA98BF8, 0x104

	.global gUnknown_08A98CFC
gUnknown_08A98CFC:  @ 0x08A98CFC
	.incbin "baserom.gba", 0xA98CFC, 0x5C

	.global gUnknown_08A98D58
gUnknown_08A98D58:  @ 0x08A98D58
	.incbin "baserom.gba", 0xA98D58, 0x30

	.global gUnknown_08A98D88
gUnknown_08A98D88:  @ 0x08A98D88
	.incbin "baserom.gba", 0xA98D88, 0x18

	.global gUnknown_08A98DA0
gUnknown_08A98DA0:  @ 0x08A98DA0
	.incbin "baserom.gba", 0xA98DA0, 0x18

	.global gUnknown_08A98DB8
gUnknown_08A98DB8:  @ 0x08A98DB8
	.incbin "baserom.gba", 0xA98DB8, 0x14

	.global gUnknown_08A98DCC
gUnknown_08A98DCC:  @ 0x08A98DCC
	.incbin "baserom.gba", 0xA98DCC, 0x60

	.global gUnknown_08A98E2C
gUnknown_08A98E2C:  @ 0x08A98E2C
	.incbin "baserom.gba", 0xA98E2C, 0x20

	.global gUnknown_08A98E4C
gUnknown_08A98E4C:  @ 0x08A98E4C
@ Replacing .incbin "baserom.gba", 0xA98E4C, 0x20
    .4byte 0x7fff520e
    .4byte 0x2dd25fbe
    .4byte 0x7bdf00aa
    .4byte 0x6b7e73bf
    .4byte 0x56fc633d
    .4byte 0xd5a117c
    .4byte 0x9160d38
    .4byte banim_drmm_sp1_sheet_7 + 0xc3b

	.global gUnknown_08A98E6C
gUnknown_08A98E6C:  @ 0x08A98E6C
	.incbin "baserom.gba", 0xA98E6C, 0x20

	.global gUnknown_08A98E8C
gUnknown_08A98E8C:  @ 0x08A98E8C
	.incbin "baserom.gba", 0xA98E8C, 0x20

	.global gUnknown_08A98EAC
gUnknown_08A98EAC:  @ 0x08A98EAC
	.incbin "baserom.gba", 0xA98EAC, 0x84

	.global gUnknown_08A98F30
gUnknown_08A98F30:  @ 0x08A98F30
	.incbin "baserom.gba", 0xA98F30, 0xEC

	.global gUnknown_08A9901C
gUnknown_08A9901C:  @ 0x08A9901C
	.incbin "baserom.gba", 0xA9901C, 0x104

	.global gUnknown_08A99120
gUnknown_08A99120:  @ 0x08A99120
	.incbin "baserom.gba", 0xA99120, 0x20

	.global gUnknown_08A99140
gUnknown_08A99140:  @ 0x08A99140
	.incbin "baserom.gba", 0xA99140, 0x4E34

	.global gUnknown_08A9DF74
gUnknown_08A9DF74:  @ 0x08A9DF74
	.incbin "baserom.gba", 0xA9DF74, 0x550

	.global gUnknown_08A9E4C4
gUnknown_08A9E4C4:  @ 0x08A9E4C4
	.incbin "baserom.gba", 0xA9E4C4, 0x80

	.global gUnknown_08A9E544
gUnknown_08A9E544:  @ 0x08A9E544
	.incbin "baserom.gba", 0xA9E544, 0x78

	.global gUnknown_08A9E5BC
gUnknown_08A9E5BC:  @ 0x08A9E5BC
	.incbin "baserom.gba", 0xA9E5BC, 0x20

	.global gUnknown_08A9E5DC
gUnknown_08A9E5DC:  @ 0x08A9E5DC
	.incbin "baserom.gba", 0xA9E5DC, 0xAC

	.global gUnknown_08A9E688
gUnknown_08A9E688:  @ 0x08A9E688
	.incbin "baserom.gba", 0xA9E688, 0x2AC4

	.global gUnknown_08AA114C
gUnknown_08AA114C:  @ 0x08AA114C
	.incbin "baserom.gba", 0xAA114C, 0x44

	.global gUnknown_08AA1190
gUnknown_08AA1190:  @ 0x08AA1190
	.incbin "baserom.gba", 0xAA1190, 0x20

	.global gUnknown_08AA11B0
gUnknown_08AA11B0:  @ 0x08AA11B0
	.incbin "baserom.gba", 0xAA11B0, 0x20

	.global gUnknown_08AA11D0
gUnknown_08AA11D0:  @ 0x08AA11D0
	.incbin "baserom.gba", 0xAA11D0, 0xB0

	.global gUnknown_08AA1280
gUnknown_08AA1280:  @ 0x08AA1280
	.incbin "baserom.gba", 0xAA1280, 0x60C

	.global gUnknown_08AA188C
gUnknown_08AA188C:  @ 0x08AA188C
	.incbin "baserom.gba", 0xAA188C, 0x20

	.global gUnknown_08AA18AC
gUnknown_08AA18AC:  @ 0x08AA18AC
	.incbin "baserom.gba", 0xAA18AC, 0x84

	.global gUnknown_08AA1930
gUnknown_08AA1930:  @ 0x08AA1930
	.incbin "baserom.gba", 0xAA1930, 0x20

	.global gUnknown_08AA1950
gUnknown_08AA1950:  @ 0x08AA1950
	.incbin "baserom.gba", 0xAA1950, 0x20

	.global gUnknown_08AA1970
gUnknown_08AA1970:  @ 0x08AA1970
	.incbin "baserom.gba", 0xAA1970, 0x300

	.global gUnknown_08AA1C70
gUnknown_08AA1C70:  @ 0x08AA1C70
	.incbin "baserom.gba", 0xAA1C70, 0x3D4

	.global gUnknown_08AA2044
gUnknown_08AA2044:  @ 0x08AA2044
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C40B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C40B8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C412C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4158
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4184
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C41E4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA2084
gUnknown_08AA2084:  @ 0x08AA2084
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C4460
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4664
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C46E4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C46F0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C4738
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
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
        .word sub_80C47B0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D74
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C47F4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA213C
gUnknown_08AA213C:  @ 0x08AA213C
	.incbin "baserom.gba", 0xAA213C, 0x18


	.global gUnknown_08AA2154
gUnknown_08AA2154:  @ 0x08AA2154
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C4A3C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4A88
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C4BA0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08AA2184
gUnknown_08AA2184:  @ 0x08AA2184
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x24
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C51A8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08AA21A4
gUnknown_08AA21A4:  @ 0x08AA21A4
	.incbin "baserom.gba", 0xAA21A4, 0x18

	.global gUnknown_08AA21BC
gUnknown_08AA21BC:  @ 0x08AA21BC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C4944
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x2
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4C3C
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C4C60
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4DA0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4C3C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4E18
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4C3C
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08AA2154
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08AA2184
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C50A0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4C3C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C5104
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5218
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4C3C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C501C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4C3C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5328
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C4CD0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4F60
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4C3C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C501C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4C3C
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4C3C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5370
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C538C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4C3C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C4C60
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4DA0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4C3C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4EC4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4C3C
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_END_EACH
        .short 0x9, 0x0
        .word gUnknown_08AA2154
        @ PROC_END_EACH
        .short 0x9, 0x0
        .word gUnknown_08AA2184
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5400
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D74
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x7
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_END_EACH
        .short 0x9, 0x0
        .word gUnknown_08AA2154
        @ PROC_END_EACH
        .short 0x9, 0x0
        .word gUnknown_08AA2184
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x7
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C540C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA239C
gUnknown_08AA239C:  @ 0x08AA239C
	.incbin "baserom.gba", 0xAA239C, 0x43D8

	.global gUnknown_08AA6774
gUnknown_08AA6774:  @ 0x08AA6774
	.incbin "baserom.gba", 0xAA6774, 0x20

	.global gUnknown_08AA6794
gUnknown_08AA6794:  @ 0x08AA6794
	.incbin "baserom.gba", 0xAA6794, 0x1A

	.global gUnknown_08AA67AE
gUnknown_08AA67AE:  @ 0x08AA67AE
	.incbin "baserom.gba", 0xAA67AE, 0x32

	.global gUnknown_08AA67E0
gUnknown_08AA67E0:  @ 0x08AA67E0
	.incbin "baserom.gba", 0xAA67E0, 0x1C

	.global gUnknown_08AA67FC
gUnknown_08AA67FC:  @ 0x08AA67FC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5430
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C5440
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA6814
gUnknown_08AA6814:  @ 0x08AA6814
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C5580
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA682C
gUnknown_08AA682C:  @ 0x08AA682C
	.incbin "baserom.gba", 0xAA682C, 0x2C

	.global gUnknown_08AA6858
gUnknown_08AA6858:  @ 0x08AA6858
	.incbin "baserom.gba", 0xAA6858, 0x1F8

	.global gUnknown_08AA6A50
gUnknown_08AA6A50:  @ 0x08AA6A50
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C55CC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C56F4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5848
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5870
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C55A4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C58CC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5A44
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C5AF0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5BD4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C5C64
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5DF0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C5E60
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C5EA0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5F2C
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5F84
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5FB4
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C55B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C5FE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C6090
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C6104
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C6204
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C62DC
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C6354
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C63C4
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C63D0
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xAA6A50 + 0x168, 0x1AA - 0x168

	.global gUnknown_08AA6BFA
gUnknown_08AA6BFA:  @ 0x08AA6BFA
	.incbin "baserom.gba", 0xAA6BFA, 0x14

	.global gUnknown_08AA6C0E
gUnknown_08AA6C0E:  @ 0x08AA6C0E
	.incbin "baserom.gba", 0xAA6C0E, 0x14

	.global gUnknown_08AA6C22
gUnknown_08AA6C22:  @ 0x08AA6C22
	.incbin "baserom.gba", 0xAA6C22, 0x14

	.global gUnknown_08AA6C36
gUnknown_08AA6C36:  @ 0x08AA6C36
	.incbin "baserom.gba", 0xAA6C36, 0x14

	.global gUnknown_08AA6C4A
gUnknown_08AA6C4A:  @ 0x08AA6C4A
	.incbin "baserom.gba", 0xAA6C4A, 0xE

	.global gUnknown_08AA6C58
gUnknown_08AA6C58:  @ 0x08AA6C58
	.incbin "baserom.gba", 0xAA6C58, 0xE

	.global gUnknown_08AA6C66
gUnknown_08AA6C66:  @ 0x08AA6C66
	.incbin "baserom.gba", 0xAA6C66, 0xE

	.global gUnknown_08AA6C74
gUnknown_08AA6C74:  @ 0x08AA6C74
	.incbin "baserom.gba", 0xAA6C74, 0xE

	.global gUnknown_08AA6C82
gUnknown_08AA6C82:  @ 0x08AA6C82
	.incbin "baserom.gba", 0xAA6C82, 0x8

	.global gUnknown_08AA6C8A
gUnknown_08AA6C8A:  @ 0x08AA6C8A
	.incbin "baserom.gba", 0xAA6C8A, 0x8

	.global gUnknown_08AA6C92
gUnknown_08AA6C92:  @ 0x08AA6C92
	.incbin "baserom.gba", 0xAA6C92, 0x8

	.global gUnknown_08AA6C9A
gUnknown_08AA6C9A:  @ 0x08AA6C9A
	.incbin "baserom.gba", 0xAA6C9A, 0xA

	.global gUnknown_08AA6CA4
gUnknown_08AA6CA4:  @ 0x08AA6CA4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C6704
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA6CBC
gUnknown_08AA6CBC:  @ 0x08AA6CBC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C6B50
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C6B8C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA6CDC
gUnknown_08AA6CDC:  @ 0x08AA6CDC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C6E14
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C6E1C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Until6C2AIs8Callback
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C6EB0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA6D04
gUnknown_08AA6D04:  @ 0x08AA6D04
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C71B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA6D14
gUnknown_08AA6D14:  @ 0x08AA6D14
@ replacing .incbin "baserom.gba", 0x00aa6d14, 0x190
.4byte gUnknown_08AF47F0 + 0x80
.4byte gUnknown_08AF47F0 + 0x4e8
.4byte gUnknown_08AF47F0 + 0x94c
.4byte gUnknown_08AF47F0 + 0xdc4
.4byte gUnknown_08AF47F0 + 0x1238
.4byte gUnknown_08AF47F0 + 0x16a8
.4byte gUnknown_08AF47F0 + 0x1b18
.4byte gUnknown_08AF47F0 + 0x1f90
.4byte gUnknown_08AF47F0 + 0x2408
.4byte gUnknown_08AF47F0 + 0x2880
.4byte gUnknown_08AF47F0 + 0x2cf8
.4byte gUnknown_08AF47F0 + 0x3170
.4byte gUnknown_08AF47F0 + 0x35e4
.4byte gUnknown_08AF47F0 + 0x3a5c
.4byte gUnknown_08AF47F0 + 0x3ed4
.4byte gUnknown_08AF47F0 + 0x4348
.4byte gUnknown_08AF47F0 + 0x47c0
.4byte gUnknown_08AF47F0 + 0x4c38
.4byte gUnknown_08AF47F0 + 0x50b0
.4byte gUnknown_08AF47F0 + 0x5528
.4byte gUnknown_08AF47F0 + 0x59a0
.4byte gUnknown_08AF47F0 + 0x5e18
.4byte gUnknown_08AF47F0 + 0x6290
.4byte gUnknown_08AF47F0 + 0x6708
.4byte gUnknown_08AF47F0 + 0x6b80
.4byte gUnknown_08AF47F0 + 0x6ff8
.4byte gUnknown_08AF47F0 + 0x7470
.4byte gUnknown_08AF47F0 + 0x78e4
.4byte gUnknown_08AF47F0 + 0x7d58
.4byte gUnknown_08AF47F0 + 0x81c4
.4byte gUnknown_08AF47F0 + 0x8638
.4byte gUnknown_08AF47F0 + 0x8aac
.4byte gUnknown_08AF47F0 + 0x8f10
.4byte gUnknown_08AF47F0 + 0x9374
.4byte gUnknown_08AF47F0 + 0x97e4
.4byte gUnknown_08AF47F0 + 0x9c58
.4byte gUnknown_08AF47F0 + 0xa0cc
.4byte gUnknown_08AF47F0 + 0xa540
.4byte gUnknown_08AF47F0 + 0xa9b8
.4byte gUnknown_08AF47F0 + 0xae28
.4byte gUnknown_08AF47F0 + 0xb290
.4byte gUnknown_08AF47F0 + 0xb6f8
.4byte gUnknown_08AF47F0 + 0xbb68
.4byte gUnknown_08AF47F0 + 0xbfe0
.4byte gUnknown_08AF47F0 + 0xc458
.4byte gUnknown_08AF47F0 + 0xc8c8
.4byte gUnknown_08AF47F0 + 0xcd3c
.4byte gUnknown_08AF47F0 + 0xd1b4
.4byte gUnknown_08AF47F0 + 0xd628
.4byte gUnknown_08AF47F0 + 0xda90
.4byte gUnknown_08AF47F0 + 0xdf04
.4byte gUnknown_08AF47F0 + 0xe36c
.4byte gUnknown_08AF47F0 + 0xe7dc
.4byte gUnknown_08AF47F0 + 0xec48
.4byte gUnknown_08AF47F0 + 0xf0bc
.4byte gUnknown_08AF47F0 + 0xf52c
.4byte gUnknown_08AF47F0 + 0xf9a4
.4byte gUnknown_08AF47F0 + 0xfe1c
.4byte gUnknown_08AF47F0 + 0x10294
.4byte gUnknown_08AF47F0 + 0x10700
.4byte gUnknown_08AF47F0 + 0x10b74
.4byte gUnknown_08AF47F0 + 0x10fe0
.4byte gUnknown_08AF47F0 + 0x11448
.4byte gUnknown_08AF47F0 + 0x118bc
.4byte gUnknown_08AF47F0 + 0x11d34
.4byte gUnknown_08AF47F0 + 0x121ac
.4byte gUnknown_08AF47F0 + 0x12620
.4byte gUnknown_08AF47F0 + 0x12a90
.4byte gUnknown_08AF47F0 + 0x12f00
.4byte gUnknown_08AF47F0 + 0x13378
.4byte gUnknown_08AF47F0 + 0x137e0
.4byte gUnknown_08AF47F0 + 0x13c50
.4byte gUnknown_08AF47F0 + 0x140c8
.4byte gUnknown_08AF47F0 + 0x14540
.4byte gUnknown_08AF47F0 + 0x149ac
.4byte gUnknown_08AF47F0 + 0x14e1c
.4byte gUnknown_08AF47F0 + 0x15294
.4byte gUnknown_08AF47F0 + 0x15708
.4byte gUnknown_08AF47F0 + 0x15b80
.4byte gUnknown_08AF47F0 + 0x15ff4
.4byte gUnknown_08AF47F0 + 0x1646c
.4byte gUnknown_08AF47F0 + 0x168e4
.4byte gUnknown_08AF47F0 + 0x16d54
.4byte gUnknown_08AF47F0 + 0x171c8
.4byte gUnknown_08AF47F0 + 0x17640
.4byte gUnknown_08AF47F0 + 0x17ab4
.4byte gUnknown_08AF47F0 + 0x17f28
.4byte gUnknown_08AF47F0 + 0x18398
.4byte gUnknown_08AF47F0 + 0x1880c
.4byte gUnknown_08AF47F0 + 0x18c44
.4byte gUnknown_08AF47F0 + 0x190ac
.4byte gUnknown_08AF47F0 + 0x194f4
.4byte gUnknown_08AF47F0 + 0x19920
.4byte gUnknown_08AF47F0 + 0x19d94
.4byte gUnknown_08AF47F0 + 0x1a1f0
.4byte gUnknown_08AF47F0 + 0x1a664
.4byte gUnknown_08AF47F0 + 0x1aab0
.4byte gUnknown_08AF47F0 + 0x1af28
.4byte gUnknown_08AF47F0 + 0x1b32c
.4byte gUnknown_08AF47F0 + 0x1b77c

	.global gUnknown_08AA6EA4
gUnknown_08AA6EA4:  @ 0x08AA6EA4
@ replacing .incbin "baserom.gba", 0x00aa6ea4, 0x190
.4byte gUnknown_08AF47F0 + 0x4ac
.4byte gUnknown_08AF47F0 + 0x910
.4byte gUnknown_08AF47F0 + 0xd88
.4byte gUnknown_08AF47F0 + 0x11fc
.4byte gUnknown_08AF47F0 + 0x166c
.4byte gUnknown_08AF47F0 + 0x1adc
.4byte gUnknown_08AF47F0 + 0x1f54
.4byte gUnknown_08AF47F0 + 0x23cc
.4byte gUnknown_08AF47F0 + 0x2844
.4byte gUnknown_08AF47F0 + 0x2cbc
.4byte gUnknown_08AF47F0 + 0x3134
.4byte gUnknown_08AF47F0 + 0x35a8
.4byte gUnknown_08AF47F0 + 0x3a20
.4byte gUnknown_08AF47F0 + 0x3e98
.4byte gUnknown_08AF47F0 + 0x430c
.4byte gUnknown_08AF47F0 + 0x4784
.4byte gUnknown_08AF47F0 + 0x4bfc
.4byte gUnknown_08AF47F0 + 0x5074
.4byte gUnknown_08AF47F0 + 0x54ec
.4byte gUnknown_08AF47F0 + 0x5964
.4byte gUnknown_08AF47F0 + 0x5ddc
.4byte gUnknown_08AF47F0 + 0x6254
.4byte gUnknown_08AF47F0 + 0x66cc
.4byte gUnknown_08AF47F0 + 0x6b44
.4byte gUnknown_08AF47F0 + 0x6fbc
.4byte gUnknown_08AF47F0 + 0x7434
.4byte gUnknown_08AF47F0 + 0x78a8
.4byte gUnknown_08AF47F0 + 0x7d1c
.4byte gUnknown_08AF47F0 + 0x8188
.4byte gUnknown_08AF47F0 + 0x85fc
.4byte gUnknown_08AF47F0 + 0x8a70
.4byte gUnknown_08AF47F0 + 0x8ed4
.4byte gUnknown_08AF47F0 + 0x9338
.4byte gUnknown_08AF47F0 + 0x97a8
.4byte gUnknown_08AF47F0 + 0x9c1c
.4byte gUnknown_08AF47F0 + 0xa090
.4byte gUnknown_08AF47F0 + 0xa504
.4byte gUnknown_08AF47F0 + 0xa97c
.4byte gUnknown_08AF47F0 + 0xadec
.4byte gUnknown_08AF47F0 + 0xb254
.4byte gUnknown_08AF47F0 + 0xb6bc
.4byte gUnknown_08AF47F0 + 0xbb2c
.4byte gUnknown_08AF47F0 + 0xbfa4
.4byte gUnknown_08AF47F0 + 0xc41c
.4byte gUnknown_08AF47F0 + 0xc88c
.4byte gUnknown_08AF47F0 + 0xcd00
.4byte gUnknown_08AF47F0 + 0xd178
.4byte gUnknown_08AF47F0 + 0xd5ec
.4byte gUnknown_08AF47F0 + 0xda54
.4byte gUnknown_08AF47F0 + 0xdec8
.4byte gUnknown_08AF47F0 + 0xe330
.4byte gUnknown_08AF47F0 + 0xe7a0
.4byte gUnknown_08AF47F0 + 0xec0c
.4byte gUnknown_08AF47F0 + 0xf080
.4byte gUnknown_08AF47F0 + 0xf4f0
.4byte gUnknown_08AF47F0 + 0xf968
.4byte gUnknown_08AF47F0 + 0xfde0
.4byte gUnknown_08AF47F0 + 0x10258
.4byte gUnknown_08AF47F0 + 0x106c4
.4byte gUnknown_08AF47F0 + 0x10b38
.4byte gUnknown_08AF47F0 + 0x10fa4
.4byte gUnknown_08AF47F0 + 0x1140c
.4byte gUnknown_08AF47F0 + 0x11880
.4byte gUnknown_08AF47F0 + 0x11cf8
.4byte gUnknown_08AF47F0 + 0x12170
.4byte gUnknown_08AF47F0 + 0x125e4
.4byte gUnknown_08AF47F0 + 0x12a54
.4byte gUnknown_08AF47F0 + 0x12ec4
.4byte gUnknown_08AF47F0 + 0x1333c
.4byte gUnknown_08AF47F0 + 0x137a4
.4byte gUnknown_08AF47F0 + 0x13c14
.4byte gUnknown_08AF47F0 + 0x1408c
.4byte gUnknown_08AF47F0 + 0x14504
.4byte gUnknown_08AF47F0 + 0x14970
.4byte gUnknown_08AF47F0 + 0x14de0
.4byte gUnknown_08AF47F0 + 0x15258
.4byte gUnknown_08AF47F0 + 0x156cc
.4byte gUnknown_08AF47F0 + 0x15b44
.4byte gUnknown_08AF47F0 + 0x15fb8
.4byte gUnknown_08AF47F0 + 0x16430
.4byte gUnknown_08AF47F0 + 0x168a8
.4byte gUnknown_08AF47F0 + 0x16d18
.4byte gUnknown_08AF47F0 + 0x1718c
.4byte gUnknown_08AF47F0 + 0x17604
.4byte gUnknown_08AF47F0 + 0x17a78
.4byte gUnknown_08AF47F0 + 0x17eec
.4byte gUnknown_08AF47F0 + 0x1835c
.4byte gUnknown_08AF47F0 + 0x187d0
.4byte gUnknown_08AF47F0 + 0x18c08
.4byte gUnknown_08AF47F0 + 0x19070
.4byte gUnknown_08AF47F0 + 0x194b8
.4byte gUnknown_08AF47F0 + 0x198e4
.4byte gUnknown_08AF47F0 + 0x19d58
.4byte gUnknown_08AF47F0 + 0x1a1b4
.4byte gUnknown_08AF47F0 + 0x1a628
.4byte gUnknown_08AF47F0 + 0x1aa74
.4byte gUnknown_08AF47F0 + 0x1aeec
.4byte gUnknown_08AF47F0 + 0x1b2f0
.4byte gUnknown_08AF47F0 + 0x1b740
.4byte gUnknown_08AF47F0 + 0x1bbac

	.global gUnknown_08AA7034
gUnknown_08AA7034:  @ 0x08AA7034
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C7610
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C7618
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08AA704C
gUnknown_08AA704C:  @ 0x08AA704C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8554
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08AA705C
gUnknown_08AA705C:  @ 0x08AA705C
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C85FC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8580
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C85B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA707C
gUnknown_08AA707C:  @ 0x08AA707C
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C8684
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8608
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8638
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA709C
gUnknown_08AA709C:  @ 0x08AA709C
	.incbin "baserom.gba", 0xAA709C, 0x20

	.global gUnknown_08AA70BC
gUnknown_08AA70BC:  @ 0x08AA70BC
	.incbin "baserom.gba", 0xAA70BC, 0x20

	.global gUnknown_08AA70DC
gUnknown_08AA70DC:  @ 0x08AA70DC
	.incbin "baserom.gba", 0xAA70DC, 0xE

	.global gUnknown_08AA70EA
gUnknown_08AA70EA:  @ 0x08AA70EA
	.incbin "baserom.gba", 0xAA70EA, 0x2C

	.global gUnknown_08AA7116
gUnknown_08AA7116:  @ 0x08AA7116
	.incbin "baserom.gba", 0xAA7116, 0x14

	.global gUnknown_08AA712A
gUnknown_08AA712A:  @ 0x08AA712A
	.incbin "baserom.gba", 0xAA712A, 0x32

	.global gUnknown_08AA715C
gUnknown_08AA715C:  @ 0x08AA715C
	.incbin "baserom.gba", 0xAA715C, 0x38

	.global gUnknown_08AA7194
gUnknown_08AA7194:  @ 0x08AA7194
	.incbin "baserom.gba", 0xAA7194, 0x34

	.global gUnknown_08AA71C8
gUnknown_08AA71C8:  @ 0x08AA71C8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Initialize6CIntroSequence
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C6C24
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08AA6CDC
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_80C6EF8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C6F10
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C6F70
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C7050
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C73B0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C71C0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C76C8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C7900
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C79F4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C7A84
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C7AE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C7B80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C7CF8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C7F90
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8100
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8184
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8214
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8278
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C835C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C84D8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08AA705C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8690
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08AA704C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9DF0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9E6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9C08
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9FF8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CA10C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CA3B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9EE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9F7C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C883C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9DF0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9E6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9C5C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9FF8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CA10C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CA3B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9EE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9F7C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8934
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9DF0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9E6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9CAC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9FF8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CA10C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CA3B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9EE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9F7C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8A20
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9DF0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9E6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9CFC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9FF8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CA10C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CA3B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9EE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9F7C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8B0C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9DF0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9E6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9D4C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9FF8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CA10C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CA3B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9EE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9F7C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8BF8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9DF0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9E6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9DA0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9FF8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CA10C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CA3B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C9EE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9F7C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08AA707C
        @ PROC_END_EACH
        .short 0x9, 0x0
        .word gUnknown_08AA704C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8CE4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA4A4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CA4DC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA92C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8D30
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CAA38
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8ED4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CABB0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9024
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CAE20
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9100
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CAF2C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9218
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CB0A0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9330
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CB20C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C940C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CB320
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C955C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CB594
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9638
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CB6A0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9750
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CB878
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C98A0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CBA64
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C99B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CA940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CBC40
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8564
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9A94
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C9AFC
        @ PROC_SLEEP
        .short 0xe, 0x20
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x63
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CBD7C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA7680
gUnknown_08AA7680:  @ 0x08AA7680
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CC1E0
        @ PROC_CALL
        .short 0x2, 0x0
        .word PrepareHealthAndSafetyScreen
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CC2F4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CC074
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CC32C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CC430
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CC074
        @ PROC_LABEL
        .short 0xb, 0x3e7
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CBE0C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CC1E8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CC098
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CC074
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CC0FC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CC074
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8000D00
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CC1F0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CC13C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CC074
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CC1A0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CC074
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8000D00
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80CBF9C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CBFC0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA7760
gUnknown_08AA7760:  @ 0x08AA7760
	.incbin "baserom.gba", 0xAA7760, 0x1FA8

	.global gUnknown_08AA9708
gUnknown_08AA9708:  @ 0x08AA9708
	.incbin "baserom.gba", 0xAA9708, 0x1788

	.global gUnknown_08AAAE90
gUnknown_08AAAE90:  @ 0x08AAAE90
	.incbin "baserom.gba", 0xAAAE90, 0x564

	.global gUnknown_08AAB3F4
gUnknown_08AAB3F4:  @ 0x08AAB3F4
	.incbin "baserom.gba", 0xAAB3F4, 0x20

	.global gUnknown_08AAB414
gUnknown_08AAB414:  @ 0x08AAB414
	.incbin "baserom.gba", 0xAAB414, 0xE90

	.global gUnknown_08AAC2A4
gUnknown_08AAC2A4:  @ 0x08AAC2A4
	.incbin "baserom.gba", 0xAAC2A4, 0x2E8

	.global gUnknown_08AAC58C
gUnknown_08AAC58C:  @ 0x08AAC58C
	.incbin "baserom.gba", 0xAAC58C, 0x20

	.global gUnknown_08AAC5AC
gUnknown_08AAC5AC:  @ 0x08AAC5AC
	.incbin "baserom.gba", 0xAAC5AC, 0x930

	.global gUnknown_08AACEDC
gUnknown_08AACEDC:  @ 0x08AACEDC
	.incbin "baserom.gba", 0xAACEDC, 0xC8C

	.global gUnknown_08AADB68
gUnknown_08AADB68:  @ 0x08AADB68
	.incbin "baserom.gba", 0xAADB68, 0x80

	.global gUnknown_08AADBE8
gUnknown_08AADBE8:  @ 0x08AADBE8
	.incbin "baserom.gba", 0xAADBE8, 0x20

	.global gUnknown_08AADC08
gUnknown_08AADC08:  @ 0x08AADC08
	.incbin "baserom.gba", 0xAADC08, 0xA14

	.global gUnknown_08AAE61C
gUnknown_08AAE61C:  @ 0x08AAE61C
	.incbin "baserom.gba", 0xAAE61C, 0x2B0

	.global gUnknown_08AAE8CC
gUnknown_08AAE8CC:  @ 0x08AAE8CC
	.incbin "baserom.gba", 0xAAE8CC, 0x20

	.global gUnknown_08AAE8EC
gUnknown_08AAE8EC:  @ 0x08AAE8EC
	.incbin "baserom.gba", 0xAAE8EC, 0x103C

	.global gUnknown_08AAF928
gUnknown_08AAF928:  @ 0x08AAF928
	.incbin "baserom.gba", 0xAAF928, 0x3CC

	.global gUnknown_08AAFCF4
gUnknown_08AAFCF4:  @ 0x08AAFCF4
	.incbin "baserom.gba", 0xAAFCF4, 0x20

	.global gUnknown_08AAFD14
gUnknown_08AAFD14:  @ 0x08AAFD14
	.incbin "baserom.gba", 0xAAFD14, 0x1FC

	.global gUnknown_08AAFF10
gUnknown_08AAFF10:  @ 0x08AAFF10
	.incbin "baserom.gba", 0xAAFF10, 0x204

	.global gUnknown_08AB0114
gUnknown_08AB0114:  @ 0x08AB0114
	.incbin "baserom.gba", 0xAB0114, 0x20

	.global gUnknown_08AB0134
gUnknown_08AB0134:  @ 0x08AB0134
	.incbin "baserom.gba", 0xAB0134, 0x8EC

	.global gUnknown_08AB0A20
gUnknown_08AB0A20:  @ 0x08AB0A20
	.incbin "baserom.gba", 0xAB0A20, 0x104

	.global gUnknown_08AB0B24
gUnknown_08AB0B24:  @ 0x08AB0B24
@ Replacing .incbin "baserom.gba", 0xAB0B24, 0x20
    .4byte 0x4414290
    .4byte 0x1f3e571d
    .4byte 0x33bf277f
    .4byte 0x6bff47bf
    .4byte 0x45ee21ba
    .4byte gUnknown_086FFD3C + 0x2c4
    .4byte 0xcd2467b
    .4byte 0x7fff044a

	.global gUnknown_08AB0B44
gUnknown_08AB0B44:  @ 0x08AB0B44
	.incbin "baserom.gba", 0xAB0B44, 0xD4C

	.global gUnknown_08AB1890
gUnknown_08AB1890:  @ 0x08AB1890
	.incbin "baserom.gba", 0xAB1890, 0x374

	.global gUnknown_08AB1C04
gUnknown_08AB1C04:  @ 0x08AB1C04
	.incbin "baserom.gba", 0xAB1C04, 0x20

	.global gUnknown_08AB1C24
gUnknown_08AB1C24:  @ 0x08AB1C24
	.incbin "baserom.gba", 0xAB1C24, 0x4E8

	.global gUnknown_08AB210C
gUnknown_08AB210C:  @ 0x08AB210C
	.incbin "baserom.gba", 0xAB210C, 0x60

	.global gUnknown_08AB216C
gUnknown_08AB216C:  @ 0x08AB216C
	.incbin "baserom.gba", 0xAB216C, 0x4C

	.global gUnknown_08AB21B8
gUnknown_08AB21B8:  @ 0x08AB21B8
	.incbin "baserom.gba", 0xAB21B8, 0x20

	.global gUnknown_08AB21D8
gUnknown_08AB21D8:  @ 0x08AB21D8
	.incbin "baserom.gba", 0xAB21D8, 0x3BB8

	.global gUnknown_08AB5D90
gUnknown_08AB5D90:  @ 0x08AB5D90
	.incbin "baserom.gba", 0xAB5D90, 0x57C

	.global gUnknown_08AB630C
gUnknown_08AB630C:  @ 0x08AB630C
@ Replacing .incbin "baserom.gba", 0xAB630C, 0x20
    .4byte 0x3b1f7c1f
    .4byte 0x537f473f
    .4byte 0x2a9d32de
    .4byte 0x223a267c
    .4byte 0x19f81e19
    .4byte 0x117315b5
    .4byte 0xcee1131
    .4byte portrait_Vigarde_dead_tileset + 0xfea

	.global gUnknown_08AB632C
gUnknown_08AB632C:  @ 0x08AB632C
	.incbin "baserom.gba", 0xAB632C, 0x1794

	.global gUnknown_08AB7AC0
gUnknown_08AB7AC0:  @ 0x08AB7AC0
	.incbin "baserom.gba", 0xAB7AC0, 0x2F0

	.global gUnknown_08AB7DB0
gUnknown_08AB7DB0:  @ 0x08AB7DB0
	.incbin "baserom.gba", 0xAB7DB0, 0x20

	.global gUnknown_08AB7DD0
gUnknown_08AB7DD0:  @ 0x08AB7DD0
	.incbin "baserom.gba", 0xAB7DD0, 0xA10

	.global gUnknown_08AB87E0
gUnknown_08AB87E0:  @ 0x08AB87E0
	.incbin "baserom.gba", 0xAB87E0, 0x4CC

	.global gUnknown_08AB8CAC
gUnknown_08AB8CAC:  @ 0x08AB8CAC
	.incbin "baserom.gba", 0xAB8CAC, 0x20

	.global gUnknown_08AB8CCC
gUnknown_08AB8CCC:  @ 0x08AB8CCC
	.incbin "baserom.gba", 0xAB8CCC, 0x760

	.global gUnknown_08AB942C
gUnknown_08AB942C:  @ 0x08AB942C
	.incbin "baserom.gba", 0xAB942C, 0x1D20

	.global gUnknown_08ABB14C
gUnknown_08ABB14C:  @ 0x08ABB14C
	.incbin "baserom.gba", 0xABB14C, 0xF28

	.global gUnknown_08ABC074
gUnknown_08ABC074:  @ 0x08ABC074
	.incbin "baserom.gba", 0xABC074, 0x1B8

	.global gUnknown_08ABC22C
gUnknown_08ABC22C:  @ 0x08ABC22C
	.incbin "baserom.gba", 0xABC22C, 0xF48

	.global gUnknown_08ABD174
gUnknown_08ABD174:  @ 0x08ABD174
	.incbin "baserom.gba", 0xABD174, 0x1D4

	.global gUnknown_08ABD348
gUnknown_08ABD348:  @ 0x08ABD348
	.incbin "baserom.gba", 0xABD348, 0xDD8

	.global gUnknown_08ABE120
gUnknown_08ABE120:  @ 0x08ABE120
	.incbin "baserom.gba", 0xABE120, 0x1E4

	.global gUnknown_08ABE304
gUnknown_08ABE304:  @ 0x08ABE304
	.incbin "baserom.gba", 0xABE304, 0xC6C

	.global gUnknown_08ABEF70
gUnknown_08ABEF70:  @ 0x08ABEF70
	.incbin "baserom.gba", 0xABEF70, 0x1F8

	.global gUnknown_08ABF168
gUnknown_08ABF168:  @ 0x08ABF168
	.incbin "baserom.gba", 0xABF168, 0x1A70

	.global gUnknown_08AC0BD8
gUnknown_08AC0BD8:  @ 0x08AC0BD8
	.incbin "baserom.gba", 0xAC0BD8, 0xCA0

	.global gUnknown_08AC1878
gUnknown_08AC1878:  @ 0x08AC1878
	.incbin "baserom.gba", 0xAC1878, 0x320

	.global gUnknown_08AC1B98
gUnknown_08AC1B98:  @ 0x08AC1B98
	.incbin "baserom.gba", 0xAC1B98, 0xF4

	.global gUnknown_08AC1C8C
gUnknown_08AC1C8C:  @ 0x08AC1C8C
	.incbin "baserom.gba", 0xAC1C8C, 0x160

	.global gUnknown_08AC1DEC
gUnknown_08AC1DEC:  @ 0x08AC1DEC
	.incbin "baserom.gba", 0xAC1DEC, 0xD38

	.global gUnknown_08AC2B24
gUnknown_08AC2B24:  @ 0x08AC2B24
	.incbin "baserom.gba", 0xAC2B24, 0x190

	.global gUnknown_08AC2CB4
gUnknown_08AC2CB4:  @ 0x08AC2CB4
	.incbin "baserom.gba", 0xAC2CB4, 0xD78

	.global gUnknown_08AC3A2C
gUnknown_08AC3A2C:  @ 0x08AC3A2C
	.incbin "baserom.gba", 0xAC3A2C, 0x19C

	.global gUnknown_08AC3BC8
gUnknown_08AC3BC8:  @ 0x08AC3BC8
	.incbin "baserom.gba", 0xAC3BC8, 0xB98

	.global gUnknown_08AC4760
gUnknown_08AC4760:  @ 0x08AC4760
	.incbin "baserom.gba", 0xAC4760, 0x1C8

	.global gUnknown_08AC4928
gUnknown_08AC4928:  @ 0x08AC4928
	.incbin "baserom.gba", 0xAC4928, 0xAF8

	.global gUnknown_08AC5420
gUnknown_08AC5420:  @ 0x08AC5420
	.incbin "baserom.gba", 0xAC5420, 0x1F4

	.global gUnknown_08AC5614
gUnknown_08AC5614:  @ 0x08AC5614
	.incbin "baserom.gba", 0xAC5614, 0x1D60

	.global gUnknown_08AC7374
gUnknown_08AC7374:  @ 0x08AC7374
	.incbin "baserom.gba", 0xAC7374, 0x1A68

	.global gUnknown_08AC8DDC
gUnknown_08AC8DDC:  @ 0x08AC8DDC
	.incbin "baserom.gba", 0xAC8DDC, 0x41C

	.global gUnknown_08AC91F8
gUnknown_08AC91F8:  @ 0x08AC91F8
	.incbin "baserom.gba", 0xAC91F8, 0x144

	.global gUnknown_08AC933C
gUnknown_08AC933C:  @ 0x08AC933C
	.incbin "baserom.gba", 0xAC933C, 0x160

	.global gUnknown_08AC949C
gUnknown_08AC949C:  @ 0x08AC949C
	.incbin "baserom.gba", 0xAC949C, 0x1AD4

	.global gUnknown_08ACAF70
gUnknown_08ACAF70:  @ 0x08ACAF70
	.incbin "baserom.gba", 0xACAF70, 0xFE8

	.global gUnknown_08ACBF58
gUnknown_08ACBF58:  @ 0x08ACBF58
	.incbin "baserom.gba", 0xACBF58, 0x3E8

	.global gUnknown_08ACC340
gUnknown_08ACC340:  @ 0x08ACC340
	.incbin "baserom.gba", 0xACC340, 0xA0

	.global gUnknown_08ACC3E0
gUnknown_08ACC3E0:  @ 0x08ACC3E0
@ Replacing .incbin "baserom.gba", 0xACC3E0, 0x160
    .4byte DirectSoundData_mon_gog_attack4_13k + 0x1a13
    .4byte 0x2e9718c7
    .4byte 0x273f7fff
    .4byte 0x43df258e
    .4byte 0x5b3b4675
    .4byte 0x212c29f3
    .4byte 0x5fde3b3e
    .4byte 0x73df22bc
    .4byte DirectSoundData_mon_gog_attack4_13k + 0x1a13
    .4byte 0x5b5d18e8
    .4byte 0x22372550
    .4byte 0x5bff2edc
    .4byte 0x31f12d4a
    .4byte 0x7fff298b
    .4byte 0x3e734eb7
    .4byte 0x292a37df
    .4byte DirectSoundData_mon_gog_attack4_13k + 0x1a13
    .4byte 0x56d118e7
    .4byte 0x32762992
    .4byte 0x4fbf2dac
    .4byte 0x299b2abb
    .4byte 0x424d2f1d
    .4byte 0x252c679d
    .4byte 0x6bff4671
    .4byte DirectSoundData_mon_gog_attack4_13k + 0x1a13
    .4byte 0x29341d07
    .4byte 0x529035ab
    .4byte 0x2d4d2d5a
    .4byte 0x2ddf420d
    .4byte 0x2dd3675c
    .4byte 0x2549316f
    .4byte 0x2e3a466f
    .4byte DirectSoundData_mon_gog_attack4_13k + 0x1a13
    .4byte 0x253018e6
    .4byte 0x2d6b5691
    .4byte 0x56f92d59
    .4byte 0x423135cc
    .4byte 0x25297fff
    .4byte 0x420e2d9e
    .4byte 0x252b2934
    .4byte DirectSoundData_mon_gog_attack4_13k + 0x1a13
    .4byte 0x5af91d28
    .4byte 0x2937252f
    .4byte 0x2d902d6a
    .4byte 0x318b2d7d
    .4byte 0x2d2a7bff
    .4byte 0x3e0d424f
    .4byte 0x252b2952
    .4byte DirectSoundData_mon_gog_attack4_13k + 0x1a13
    .4byte 0x52b720e8
    .4byte 0x2d59254f
    .4byte 0x6fff252a
    .4byte 0x2d9f31cf
    .4byte 0x2953252c
    .4byte 0x2d6c2d4c
    .4byte 0x5f3b3e13
    .4byte DirectSoundData_mon_gog_attack4_13k + 0x1a13
    .4byte 0x5f3b2129
    .4byte 0x2d4f2d4c
    .4byte 0x46543175
    .4byte 0x39cc2549
    .4byte 0x314c3190
    .4byte 0x29597bff
    .4byte 0x52b739cf
    .4byte 0x18e67c1f
    .4byte 0x7fff2549
    .4byte 0x420c2daa
    .4byte 0x314b528e
    .4byte 0x294b5f3a
    .4byte 0x35ec31cb
    .4byte 0x2989464d
    .4byte 0x256b4654
    .4byte DirectSoundData_mon_gog_attack4_13k + 0x1a13
    .4byte 0x7fff216a
    .4byte 0x464d3a0c
    .4byte 0x528e4a6d
    .4byte 0x56d831cb
    .4byte 0x35ec422c
    .4byte 0x6fff3189
    .4byte 0x422d2dac
    .4byte DirectSoundData_mon_gog_attack4_13k + 0x1a13
    .4byte 0x7fff2d4b
    .4byte 0x3a113a2c
    .4byte 0x29ae5f3a
    .4byte 0x2dcd6fff
    .4byte 0x31cd464d
    .4byte 0x4a95296c
    .4byte 0x35ec7fff

	.global gUnknown_08ACC540
gUnknown_08ACC540:  @ 0x08ACC540
	.incbin "baserom.gba", 0xACC540, 0x1B78

	.global gUnknown_08ACE0B8
gUnknown_08ACE0B8:  @ 0x08ACE0B8
	.incbin "baserom.gba", 0xACE0B8, 0xE18

	.global gUnknown_08ACEED0
gUnknown_08ACEED0:  @ 0x08ACEED0
	.incbin "baserom.gba", 0xACEED0, 0x330

	.global gUnknown_08ACF200
gUnknown_08ACF200:  @ 0x08ACF200
	.incbin "baserom.gba", 0xACF200, 0x114

	.global gUnknown_08ACF314
gUnknown_08ACF314:  @ 0x08ACF314
	.incbin "baserom.gba", 0xACF314, 0x160

	.global gUnknown_08ACF474
gUnknown_08ACF474:  @ 0x08ACF474
	.incbin "baserom.gba", 0xACF474, 0x1BD4

	.global gUnknown_08AD1048
gUnknown_08AD1048:  @ 0x08AD1048
	.incbin "baserom.gba", 0xAD1048, 0x1024

	.global gUnknown_08AD206C
gUnknown_08AD206C:  @ 0x08AD206C
	.incbin "baserom.gba", 0xAD206C, 0x300

	.global gUnknown_08AD236C
gUnknown_08AD236C:  @ 0x08AD236C
	.incbin "baserom.gba", 0xAD236C, 0x148

	.global gUnknown_08AD24B4
gUnknown_08AD24B4:  @ 0x08AD24B4
	.incbin "baserom.gba", 0xAD24B4, 0x160

	.global gUnknown_08AD2614
gUnknown_08AD2614:  @ 0x08AD2614
	.incbin "baserom.gba", 0xAD2614, 0x1C28

	.global gUnknown_08AD423C
gUnknown_08AD423C:  @ 0x08AD423C
	.incbin "baserom.gba", 0xAD423C, 0xE58

	.global gUnknown_08AD5094
gUnknown_08AD5094:  @ 0x08AD5094
	.incbin "baserom.gba", 0xAD5094, 0x3A8

	.global gUnknown_08AD543C
gUnknown_08AD543C:  @ 0x08AD543C
	.incbin "baserom.gba", 0xAD543C, 0xA0

	.global gUnknown_08AD54DC
gUnknown_08AD54DC:  @ 0x08AD54DC
	.incbin "baserom.gba", 0xAD54DC, 0x160

	.global gUnknown_08AD563C
gUnknown_08AD563C:  @ 0x08AD563C
	.incbin "baserom.gba", 0xAD563C, 0x1CC0

	.global gUnknown_08AD72FC
gUnknown_08AD72FC:  @ 0x08AD72FC
	.incbin "baserom.gba", 0xAD72FC, 0x121C

	.global gUnknown_08AD8518
gUnknown_08AD8518:  @ 0x08AD8518
	.incbin "baserom.gba", 0xAD8518, 0x3BC

	.global gUnknown_08AD88D4
gUnknown_08AD88D4:  @ 0x08AD88D4
	.incbin "baserom.gba", 0xAD88D4, 0xD4

	.global gUnknown_08AD89A8
gUnknown_08AD89A8:  @ 0x08AD89A8
	.incbin "baserom.gba", 0xAD89A8, 0x160

	.global gUnknown_08AD8B08
gUnknown_08AD8B08:  @ 0x08AD8B08
	.incbin "baserom.gba", 0xAD8B08, 0x1814

	.global gUnknown_08ADA31C
gUnknown_08ADA31C:  @ 0x08ADA31C
	.incbin "baserom.gba", 0xADA31C, 0x14E8

	.global gUnknown_08ADB804
gUnknown_08ADB804:  @ 0x08ADB804
	.incbin "baserom.gba", 0xADB804, 0x408

	.global gUnknown_08ADBC0C
gUnknown_08ADBC0C:  @ 0x08ADBC0C
	.incbin "baserom.gba", 0xADBC0C, 0x10C

	.global gUnknown_08ADBD18
gUnknown_08ADBD18:  @ 0x08ADBD18
	.incbin "baserom.gba", 0xADBD18, 0x160

	.global gUnknown_08ADBE78
gUnknown_08ADBE78:  @ 0x08ADBE78
	.incbin "baserom.gba", 0xADBE78, 0x20

	.global gUnknown_08ADBE98
gUnknown_08ADBE98:  @ 0x08ADBE98
	.incbin "baserom.gba", 0xADBE98, 0x528

	.global gUnknown_08ADC3C0
gUnknown_08ADC3C0:  @ 0x08ADC3C0
	.incbin "baserom.gba", 0xADC3C0, 0x348

	.global gUnknown_08ADC708
gUnknown_08ADC708:  @ 0x08ADC708
	.incbin "baserom.gba", 0xADC708, 0x20

	.global gUnknown_08ADC728
gUnknown_08ADC728:  @ 0x08ADC728
	.incbin "baserom.gba", 0xADC728, 0x590

	.global gUnknown_08ADCCB8
gUnknown_08ADCCB8:  @ 0x08ADCCB8
	.incbin "baserom.gba", 0xADCCB8, 0x398

	.global gUnknown_08ADD050
gUnknown_08ADD050:  @ 0x08ADD050
	.incbin "baserom.gba", 0xADD050, 0x20

	.global gUnknown_08ADD070
gUnknown_08ADD070:  @ 0x08ADD070
	.incbin "baserom.gba", 0xADD070, 0x67C

	.global gUnknown_08ADD6EC
gUnknown_08ADD6EC:  @ 0x08ADD6EC
	.incbin "baserom.gba", 0xADD6EC, 0x368

	.global gUnknown_08ADDA54
gUnknown_08ADDA54:  @ 0x08ADDA54
@ Replacing .incbin "baserom.gba", 0xADDA54, 0x20
    .4byte 0x63ff4f34
    .4byte 0x2a7d3b5f
    .4byte 0x2d6e25d3
    .4byte 0x264b28c9
    .4byte 0x15071586
    .4byte gUnknown_08B1FE7C + 0x62342
    .4byte 0x27ff10f1
    .4byte 0x7ffe7353

	.global gUnknown_08ADDA74
gUnknown_08ADDA74:  @ 0x08ADDA74
	.incbin "baserom.gba", 0xADDA74, 0x60C

	.global gUnknown_08ADE080
gUnknown_08ADE080:  @ 0x08ADE080
	.incbin "baserom.gba", 0xADE080, 0x3FC

	.global gUnknown_08ADE47C
gUnknown_08ADE47C:  @ 0x08ADE47C
@ Replacing .incbin "baserom.gba", 0xADE47C, 0x20
    .4byte 0x63ff4f34
    .4byte 0x2a7d3b5f
    .4byte 0x2d6e25d3
    .4byte 0x153d24a8
    .4byte gUnknown_08AF47F0 + 0xc4c9
    .4byte 0x61627a08
    .4byte 0x6e4e7b35
    .4byte 0x7ffe3d8b

	.global gUnknown_08ADE49C
gUnknown_08ADE49C:  @ 0x08ADE49C
	.incbin "baserom.gba", 0xADE49C, 0x680

	.global gUnknown_08ADEB1C
gUnknown_08ADEB1C:  @ 0x08ADEB1C
	.incbin "baserom.gba", 0xADEB1C, 0x3B8

	.global gUnknown_08ADEED4
gUnknown_08ADEED4:  @ 0x08ADEED4
	.incbin "baserom.gba", 0xADEED4, 0x20

	.global gUnknown_08ADEEF4
gUnknown_08ADEEF4:  @ 0x08ADEEF4
	.incbin "baserom.gba", 0xADEEF4, 0x698

	.global gUnknown_08ADF58C
gUnknown_08ADF58C:  @ 0x08ADF58C
	.incbin "baserom.gba", 0xADF58C, 0x47C

	.global gUnknown_08ADFA08
gUnknown_08ADFA08:  @ 0x08ADFA08
@ Replacing .incbin "baserom.gba", 0xADFA08, 0x20
    .4byte 0x6fdf4f34
    .4byte 0x2e7d473f
    .4byte 0x2d6e25d3
    .4byte 0x14fd24a8
    .4byte gUnknown_088FD9D8 + 0x32a1
    .4byte 0x31ff52ff
    .4byte 0x20ac27ff
    .4byte 0x67354e73

	.global gUnknown_08ADFA28
gUnknown_08ADFA28:  @ 0x08ADFA28
	.incbin "baserom.gba", 0xADFA28, 0x6BC

	.global gUnknown_08AE00E4
gUnknown_08AE00E4:  @ 0x08AE00E4
	.incbin "baserom.gba", 0xAE00E4, 0x3F0

	.global gUnknown_08AE04D4
gUnknown_08AE04D4:  @ 0x08AE04D4
	.incbin "baserom.gba", 0xAE04D4, 0x20

	.global gUnknown_08AE04F4
gUnknown_08AE04F4:  @ 0x08AE04F4
	.incbin "baserom.gba", 0xAE04F4, 0x554

	.global gUnknown_08AE0A48
gUnknown_08AE0A48:  @ 0x08AE0A48
	.incbin "baserom.gba", 0xAE0A48, 0x32C

	.global gUnknown_08AE0D74
gUnknown_08AE0D74:  @ 0x08AE0D74
	.incbin "baserom.gba", 0xAE0D74, 0x20

	.global gUnknown_08AE0D94
gUnknown_08AE0D94:  @ 0x08AE0D94
	.incbin "baserom.gba", 0xAE0D94, 0x528

	.global gUnknown_08AE12BC
gUnknown_08AE12BC:  @ 0x08AE12BC
	.incbin "baserom.gba", 0xAE12BC, 0x378

	.global gUnknown_08AE1634
gUnknown_08AE1634:  @ 0x08AE1634
	.incbin "baserom.gba", 0xAE1634, 0x20

	.global gUnknown_08AE1654
gUnknown_08AE1654:  @ 0x08AE1654
	.incbin "baserom.gba", 0xAE1654, 0x6AC

	.global gUnknown_08AE1D00
gUnknown_08AE1D00:  @ 0x08AE1D00
	.incbin "baserom.gba", 0xAE1D00, 0x3C4

	.global gUnknown_08AE20C4
gUnknown_08AE20C4:  @ 0x08AE20C4
	.incbin "baserom.gba", 0xAE20C4, 0x20

	.global gUnknown_08AE20E4
gUnknown_08AE20E4:  @ 0x08AE20E4
	.incbin "baserom.gba", 0xAE20E4, 0x738

	.global gUnknown_08AE281C
gUnknown_08AE281C:  @ 0x08AE281C
	.incbin "baserom.gba", 0xAE281C, 0x3D8

	.global gUnknown_08AE2BF4
gUnknown_08AE2BF4:  @ 0x08AE2BF4
@ Replacing .incbin "baserom.gba", 0xAE2BF4, 0x20
    .4byte 0x6fff4f34
    .4byte 0x2e7d473f
    .4byte 0x2d6e25d3
    .4byte 0x5dab24a8
    .4byte 0x25044165
    .4byte DirectSoundData_horse3_f1_dart1_m1_13k8b + 0xbeb
    .4byte 0x462b27ff
    .4byte 0x7ffe7353

	.global gUnknown_08AE2C14
gUnknown_08AE2C14:  @ 0x08AE2C14
	.incbin "baserom.gba", 0xAE2C14, 0x7C0

	.global gUnknown_08AE33D4
gUnknown_08AE33D4:  @ 0x08AE33D4
	.incbin "baserom.gba", 0xAE33D4, 0x360

	.global gUnknown_08AE3734
gUnknown_08AE3734:  @ 0x08AE3734
	.incbin "baserom.gba", 0xAE3734, 0x20

	.global gUnknown_08AE3754
gUnknown_08AE3754:  @ 0x08AE3754
	.incbin "baserom.gba", 0xAE3754, 0x700

	.global gUnknown_08AE3E54
gUnknown_08AE3E54:  @ 0x08AE3E54
	.incbin "baserom.gba", 0xAE3E54, 0x390

	.global gUnknown_08AE41E4
gUnknown_08AE41E4:  @ 0x08AE41E4
	.incbin "baserom.gba", 0xAE41E4, 0x20

	.global gUnknown_08AE4204
gUnknown_08AE4204:  @ 0x08AE4204
	.incbin "baserom.gba", 0xAE4204, 0x73C

	.global gUnknown_08AE4940
gUnknown_08AE4940:  @ 0x08AE4940
	.incbin "baserom.gba", 0xAE4940, 0x3A8

	.global gUnknown_08AE4CE8
gUnknown_08AE4CE8:  @ 0x08AE4CE8
	.incbin "baserom.gba", 0xAE4CE8, 0x20

	.global gUnknown_08AE4D08
gUnknown_08AE4D08:  @ 0x08AE4D08
	.incbin "baserom.gba", 0xAE4D08, 0x6C0

	.global gUnknown_08AE53C8
gUnknown_08AE53C8:  @ 0x08AE53C8
	.incbin "baserom.gba", 0xAE53C8, 0x368

	.global gUnknown_08AE5730
gUnknown_08AE5730:  @ 0x08AE5730
	.incbin "baserom.gba", 0xAE5730, 0x20

	.global gUnknown_08AE5750
gUnknown_08AE5750:  @ 0x08AE5750
	.incbin "baserom.gba", 0xAE5750, 0x604

	.global gUnknown_08AE5D54
gUnknown_08AE5D54:  @ 0x08AE5D54
	.incbin "baserom.gba", 0xAE5D54, 0x35C

	.global gUnknown_08AE60B0
gUnknown_08AE60B0:  @ 0x08AE60B0
	.incbin "baserom.gba", 0xAE60B0, 0x20

	.global gUnknown_08AE60D0
gUnknown_08AE60D0:  @ 0x08AE60D0
	.incbin "baserom.gba", 0xAE60D0, 0x578

	.global gUnknown_08AE6648
gUnknown_08AE6648:  @ 0x08AE6648
	.incbin "baserom.gba", 0xAE6648, 0x3A4

	.global gUnknown_08AE69EC
gUnknown_08AE69EC:  @ 0x08AE69EC
	.incbin "baserom.gba", 0xAE69EC, 0x20

	.global gUnknown_08AE6A0C
gUnknown_08AE6A0C:  @ 0x08AE6A0C
	.incbin "baserom.gba", 0xAE6A0C, 0x59C

	.global gUnknown_08AE6FA8
gUnknown_08AE6FA8:  @ 0x08AE6FA8
	.incbin "baserom.gba", 0xAE6FA8, 0x320

	.global gUnknown_08AE72C8
gUnknown_08AE72C8:  @ 0x08AE72C8
	.incbin "baserom.gba", 0xAE72C8, 0x20

	.global gUnknown_08AE72E8
gUnknown_08AE72E8:  @ 0x08AE72E8
	.incbin "baserom.gba", 0xAE72E8, 0x5C8

	.global gUnknown_08AE78B0
gUnknown_08AE78B0:  @ 0x08AE78B0
	.incbin "baserom.gba", 0xAE78B0, 0x37C

	.global gUnknown_08AE7C2C
gUnknown_08AE7C2C:  @ 0x08AE7C2C
	.incbin "baserom.gba", 0xAE7C2C, 0x20

	.global gUnknown_08AE7C4C
gUnknown_08AE7C4C:  @ 0x08AE7C4C
	.incbin "baserom.gba", 0xAE7C4C, 0x550

	.global gUnknown_08AE819C
gUnknown_08AE819C:  @ 0x08AE819C
	.incbin "baserom.gba", 0xAE819C, 0x320

	.global gUnknown_08AE84BC
gUnknown_08AE84BC:  @ 0x08AE84BC
	.incbin "baserom.gba", 0xAE84BC, 0x20

	.global gUnknown_08AE84DC
gUnknown_08AE84DC:  @ 0x08AE84DC
	.incbin "baserom.gba", 0xAE84DC, 0x5DC

	.global gUnknown_08AE8AB8
gUnknown_08AE8AB8:  @ 0x08AE8AB8
	.incbin "baserom.gba", 0xAE8AB8, 0x2CC

	.global gUnknown_08AE8D84
gUnknown_08AE8D84:  @ 0x08AE8D84
	.incbin "baserom.gba", 0xAE8D84, 0x20

	.global gUnknown_08AE8DA4
gUnknown_08AE8DA4:  @ 0x08AE8DA4
	.incbin "baserom.gba", 0xAE8DA4, 0x5C0

	.global gUnknown_08AE9364
gUnknown_08AE9364:  @ 0x08AE9364
	.incbin "baserom.gba", 0xAE9364, 0x3BC

	.global gUnknown_08AE9720
gUnknown_08AE9720:  @ 0x08AE9720
	.incbin "baserom.gba", 0xAE9720, 0x20

	.global gUnknown_08AE9740
gUnknown_08AE9740:  @ 0x08AE9740
	.incbin "baserom.gba", 0xAE9740, 0x564

	.global gUnknown_08AE9CA4
gUnknown_08AE9CA4:  @ 0x08AE9CA4
	.incbin "baserom.gba", 0xAE9CA4, 0x388

	.global gUnknown_08AEA02C
gUnknown_08AEA02C:  @ 0x08AEA02C
@ Replacing .incbin "baserom.gba", 0xAEA02C, 0x20
    .4byte 0x63ff4f34
    .4byte 0x2a7d3b5f
    .4byte 0x2d6e25d3
    .4byte 0x121f24a8
    .4byte _banim_pal_end + 0x15e99
    .4byte 0x630c7fee
    .4byte 0x4e7139c7
    .4byte 0x7ffe6757

	.global gUnknown_08AEA04C
gUnknown_08AEA04C:  @ 0x08AEA04C
	.incbin "baserom.gba", 0xAEA04C, 0x75C

	.global gUnknown_08AEA7A8
gUnknown_08AEA7A8:  @ 0x08AEA7A8
	.incbin "baserom.gba", 0xAEA7A8, 0x3A8

	.global gUnknown_08AEAB50
gUnknown_08AEAB50:  @ 0x08AEAB50
	.incbin "baserom.gba", 0xAEAB50, 0x20

	.global gUnknown_08AEAB70
gUnknown_08AEAB70:  @ 0x08AEAB70
	.incbin "baserom.gba", 0xAEAB70, 0x648

	.global gUnknown_08AEB1B8
gUnknown_08AEB1B8:  @ 0x08AEB1B8
	.incbin "baserom.gba", 0xAEB1B8, 0x3B4

	.global gUnknown_08AEB56C
gUnknown_08AEB56C:  @ 0x08AEB56C
	.incbin "baserom.gba", 0xAEB56C, 0x20

	.global gUnknown_08AEB58C
gUnknown_08AEB58C:  @ 0x08AEB58C
	.incbin "baserom.gba", 0xAEB58C, 0x760

	.global gUnknown_08AEBCEC
gUnknown_08AEBCEC:  @ 0x08AEBCEC
	.incbin "baserom.gba", 0xAEBCEC, 0x35C

	.global gUnknown_08AEC048
gUnknown_08AEC048:  @ 0x08AEC048
@ Replacing .incbin "baserom.gba", 0xAEC048, 0x20
    .4byte 0x63ff4f34
    .4byte 0x2a7d3b5f
    .4byte 0x2d6e25d3
    .4byte 0x77d24a8
    .4byte 0x15f306d9
    .4byte gUnknown_08B1FE7C + 0x1169c
    .4byte 0x2f3108ad
    .4byte 0x7ffe0de8

	.global gUnknown_08AEC068
gUnknown_08AEC068:  @ 0x08AEC068
	.incbin "baserom.gba", 0xAEC068, 0x6BC

	.global gUnknown_08AEC724
gUnknown_08AEC724:  @ 0x08AEC724
	.incbin "baserom.gba", 0xAEC724, 0x39C

	.global gUnknown_08AECAC0
gUnknown_08AECAC0:  @ 0x08AECAC0
	.incbin "baserom.gba", 0xAECAC0, 0x20

	.global gUnknown_08AECAE0
gUnknown_08AECAE0:  @ 0x08AECAE0
	.incbin "baserom.gba", 0xAECAE0, 0x5C4

	.global gUnknown_08AED0A4
gUnknown_08AED0A4:  @ 0x08AED0A4
	.incbin "baserom.gba", 0xAED0A4, 0x344

	.global gUnknown_08AED3E8
gUnknown_08AED3E8:  @ 0x08AED3E8
	.incbin "baserom.gba", 0xAED3E8, 0x20

	.global gUnknown_08AED408
gUnknown_08AED408:  @ 0x08AED408
	.incbin "baserom.gba", 0xAED408, 0x554

	.global gUnknown_08AED95C
gUnknown_08AED95C:  @ 0x08AED95C
	.incbin "baserom.gba", 0xAED95C, 0x324

	.global gUnknown_08AEDC80
gUnknown_08AEDC80:  @ 0x08AEDC80
	.incbin "baserom.gba", 0xAEDC80, 0x20

	.global gUnknown_08AEDCA0
gUnknown_08AEDCA0:  @ 0x08AEDCA0
	.incbin "baserom.gba", 0xAEDCA0, 0x578

	.global gUnknown_08AEE218
gUnknown_08AEE218:  @ 0x08AEE218
	.incbin "baserom.gba", 0xAEE218, 0x34C

	.global gUnknown_08AEE564
gUnknown_08AEE564:  @ 0x08AEE564
	.incbin "baserom.gba", 0xAEE564, 0x20

	.global gUnknown_08AEE584
gUnknown_08AEE584:  @ 0x08AEE584
	.incbin "baserom.gba", 0xAEE584, 0x62C

	.global gUnknown_08AEEBB0
gUnknown_08AEEBB0:  @ 0x08AEEBB0
	.incbin "baserom.gba", 0xAEEBB0, 0x31C

	.global gUnknown_08AEEECC
gUnknown_08AEEECC:  @ 0x08AEEECC
	.incbin "baserom.gba", 0xAEEECC, 0x20

	.global gUnknown_08AEEEEC
gUnknown_08AEEEEC:  @ 0x08AEEEEC
	.incbin "baserom.gba", 0xAEEEEC, 0x694

	.global gUnknown_08AEF580
gUnknown_08AEF580:  @ 0x08AEF580
	.incbin "baserom.gba", 0xAEF580, 0x300

	.global gUnknown_08AEF880
gUnknown_08AEF880:  @ 0x08AEF880
	.incbin "baserom.gba", 0xAEF880, 0x20

	.global gUnknown_08AEF8A0
gUnknown_08AEF8A0:  @ 0x08AEF8A0
	.incbin "baserom.gba", 0xAEF8A0, 0x528

	.global gUnknown_08AEFDC8
gUnknown_08AEFDC8:  @ 0x08AEFDC8
	.incbin "baserom.gba", 0xAEFDC8, 0x368

	.global gUnknown_08AF0130
gUnknown_08AF0130:  @ 0x08AF0130
	.incbin "baserom.gba", 0xAF0130, 0x20

	.global gUnknown_08AF0150
gUnknown_08AF0150:  @ 0x08AF0150
	.incbin "baserom.gba", 0xAF0150, 0x894

	.global gUnknown_08AF09E4
gUnknown_08AF09E4:  @ 0x08AF09E4
	.incbin "baserom.gba", 0xAF09E4, 0x404

	.global gUnknown_08AF0DE8
gUnknown_08AF0DE8:  @ 0x08AF0DE8
	.incbin "baserom.gba", 0xAF0DE8, 0x20

	.global gUnknown_08AF0E08
gUnknown_08AF0E08:  @ 0x08AF0E08
	.incbin "baserom.gba", 0xAF0E08, 0x8C4

	.global gUnknown_08AF16CC
gUnknown_08AF16CC:  @ 0x08AF16CC
	.incbin "baserom.gba", 0xAF16CC, 0x3FC

	.global gUnknown_08AF1AC8
gUnknown_08AF1AC8:  @ 0x08AF1AC8
	.incbin "baserom.gba", 0xAF1AC8, 0x20

	.global gUnknown_08AF1AE8
gUnknown_08AF1AE8:  @ 0x08AF1AE8
	.incbin "baserom.gba", 0xAF1AE8, 0x30

	.global gUnknown_08AF1B18
gUnknown_08AF1B18:  @ 0x08AF1B18
	.incbin "baserom.gba", 0xAF1B18, 0x20

	.global gUnknown_08AF1B38
gUnknown_08AF1B38:  @ 0x08AF1B38
	.incbin "baserom.gba", 0xAF1B38, 0x478

	.global gUnknown_08AF1FB0
gUnknown_08AF1FB0:  @ 0x08AF1FB0
	.incbin "baserom.gba", 0xAF1FB0, 0x20

	.global gUnknown_08AF1FD0
gUnknown_08AF1FD0:  @ 0x08AF1FD0
	.incbin "baserom.gba", 0xAF1FD0, 0x664

	.global gUnknown_08AF2634
gUnknown_08AF2634:  @ 0x08AF2634
	.incbin "baserom.gba", 0xAF2634, 0x20

	.global gUnknown_08AF2654
gUnknown_08AF2654:  @ 0x08AF2654
	.incbin "baserom.gba", 0xAF2654, 0xAB8

	.global gUnknown_08AF310C
gUnknown_08AF310C:  @ 0x08AF310C
@ Replacing .incbin "baserom.gba", 0xAF310C, 0x20
    .4byte 0x1a5f0200
    .4byte 0xd7f15ff
    .4byte gUnknown_0895F5A5 + 0x41319
    .4byte 0x140876
    .4byte 0x44e0851
    .4byte 0x2a044c
    .4byte 0x50027
    .4byte 0x10003

	.global gUnknown_08AF312C
gUnknown_08AF312C:  @ 0x08AF312C
	.incbin "baserom.gba", 0xAF312C, 0xF20

	.global gUnknown_08AF404C
gUnknown_08AF404C:  @ 0x08AF404C
	.incbin "baserom.gba", 0xAF404C, 0x2E4

	.global gUnknown_08AF4330
gUnknown_08AF4330:  @ 0x08AF4330
	.incbin "baserom.gba", 0xAF4330, 0x4C0

	.global gUnknown_08AF47F0
gUnknown_08AF47F0:  @ 0x08AF47F0
	.incbin "baserom.gba", 0xAF47F0, 0x1BBE8

	.global gUnknown_08B103D8
gUnknown_08B103D8:  @ 0x08B103D8
	.incbin "baserom.gba", 0xB103D8, 0x100

	.global gUnknown_08B104D8
gUnknown_08B104D8:  @ 0x08B104D8
	.incbin "baserom.gba", 0xB104D8, 0x158

	.global gUnknown_08B10630
gUnknown_08B10630:  @ 0x08B10630
	.incbin "baserom.gba", 0xB10630, 0x48C

	.global gUnknown_08B10ABC
gUnknown_08B10ABC:  @ 0x08B10ABC
	.incbin "baserom.gba", 0xB10ABC, 0x20

	.global gUnknown_08B10ADC
gUnknown_08B10ADC:  @ 0x08B10ADC
	.incbin "baserom.gba", 0xB10ADC, 0x1C8

	.global gUnknown_08B10CA4
gUnknown_08B10CA4:  @ 0x08B10CA4
	.incbin "baserom.gba", 0xB10CA4, 0xBC0

	.global gUnknown_08B11864
gUnknown_08B11864:  @ 0x08B11864
	.incbin "baserom.gba", 0xB11864, 0x60

	.global gUnknown_08B118C4
gUnknown_08B118C4:  @ 0x08B118C4
	.incbin "baserom.gba", 0xB118C4, 0x348

	.global gUnknown_08B11C0C
gUnknown_08B11C0C:  @ 0x08B11C0C
	.incbin "baserom.gba", 0xB11C0C, 0x100

	.global gUnknown_08B11D0C
gUnknown_08B11D0C:  @ 0x08B11D0C
	.incbin "baserom.gba", 0xB11D0C, 0x8E8

	.global gUnknown_08B125F4
gUnknown_08B125F4:  @ 0x08B125F4
	.incbin "baserom.gba", 0xB125F4, 0x20
