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

	.global ProcScr_PrepUnitScreen
ProcScr_PrepUnitScreen:  @ 0x08A18E8C
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


	.global ProcScr_PrepItemTradeScreen
ProcScr_PrepItemTradeScreen:  @ 0x08A1901C
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


	.global PrepScr_PrepItemUseScreen
PrepScr_PrepItemUseScreen:  @ 0x08A19064
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word PrepItemUse_OnInit
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
        .word PrepItemUse_CtrlLoop
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word PrepItemUse_AreUSureBoxInit
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word PrepItemUse_AreUSureBoxLoop
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
        .word ProcScr_PrepItemStatBoosterEffect
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word ProcScr_PrepItemJunaFruitEffect
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
        .word StartFadeInBlackMedium
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartPrepScreenPromotion
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
        .word MusicProc4Exists
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
        .word ProcPrepItemUse_OnEnd
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_PrepItemStatBoosterEffect
ProcScr_PrepItemStatBoosterEffect:  @ 0x08A191A4
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

	.global ProcScr_PrepItemJunaFruitEffect
ProcScr_PrepItemJunaFruitEffect:  @ 0x08A191C4
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

	.global ProcScr_PrepItemSupplyScreen
ProcScr_PrepItemSupplyScreen:  @ 0x08A1920C
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


	.global ProcScr_BmSupplyScreen
ProcScr_BmSupplyScreen:  @ 0x08A192EC
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
        .word WaitForFade
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_PrepItemListScreen
ProcScr_PrepItemListScreen:  @ 0x08A19424
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
