    .section .data

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

	.global ProcScr_PrepSideBarHandler
ProcScr_PrepSideBarHandler:  @ 0x08A18808
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


	.global ProcScr_PrepItemScreen
ProcScr_PrepItemScreen:  @ 0x08A189A4
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
        .word StartPrepItemTradeScreen
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
        .word StartPrepItemListScreen
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
        .word StartPrepItemSupply
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
