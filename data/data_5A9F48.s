    .section .data

	.global gUnknown_085AA158
gUnknown_085AA158:  @ 0x085AA158
	.incbin "baserom.gba", 0x5AA158, 0x4

	.global gUnknown_085AA15C
gUnknown_085AA15C:  @ 0x085AA15C
    .incbin "baserom.gba", 0x5AA15C, 0x50

	.global gUnknown_085AA1AC
gUnknown_085AA1AC:  @ 0x085AA1AC
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gProcScr_BKSEL
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A108
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A158
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A1D0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A298
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A3A8
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA1FC
gUnknown_085AA1FC:  @ 0x085AA1FC
	.incbin "baserom.gba", 0x5AA1FC, 0x20

	.global gUnknown_085AA21C
gUnknown_085AA21C:  @ 0x085AA21C
	.incbin "baserom.gba", 0x5AA21C, 0x10

	.global gUnknown_085AA22C
gUnknown_085AA22C:  @ 0x085AA22C
	.incbin "baserom.gba", 0x5AA22C, 0x20

	.global gUnknown_085AA24C
gUnknown_085AA24C:  @ 0x085AA24C
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_MARK
        .short 0xf, 0x1
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804B278
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B604
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B624
        @ PROC_SLEEP
        .short 0xe, 0x20
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B6AC
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B6B8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA2B4
gUnknown_085AA2B4:  @ 0x085AA2B4
@ Replacing .incbin "baserom.gba", 0x5AA2B4, 0x24
    .4byte 0x10e20
    .4byte 0x70228
    .4byte 0x41020
    .4byte Events_WM_ChapterIntro + 0xe048
    .4byte 0x1d20
    .4byte 0x1b22
    .4byte 0xd40
    .4byte sub_804B6CC
    .4byte 0x120

	.global gUnknown_085AA2D8
gUnknown_085AA2D8:  @ 0x085AA2D8
@ Replacing .incbin "baserom.gba", 0x5AA2D8, 0x24
    .4byte 0x10e20
    .4byte 0x70228
    .4byte 0x41020
    .4byte Events_WM_ChapterIntro + 0x1e048
    .4byte 0x1d20
    .4byte 0x1b22
    .4byte 0xd40
    .4byte sub_804B6CC
    .4byte 0x120

	.global gUnknown_085AA2FC
gUnknown_085AA2FC:  @ 0x085AA2FC
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8049CD4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049F38
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8049D0C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8049D24
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndLinkArenaPointsBox
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B3B0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80497A0
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshBMapGraphics
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B6F4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B3D0
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word gUnknown_085AA24C + 0x20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B480
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B708
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B408
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B518
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8049D0C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8049F44
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndLinkArenaPointsBox
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B3B0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80497A0
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshBMapGraphics
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049F38
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80498F4
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A430
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndLinkArenaPointsBox
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A44C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A51C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A5A4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A614
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A6A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049238
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndLinkArenaPointsBox
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A7C0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A9A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804AA88
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA4CC
gUnknown_085AA4CC:  @ 0x085AA4CC
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049F38
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804AAFC
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804ABCC
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word gUnknown_085AA24C + 0x20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word ProcScr_Popup
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B554
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word ProcScr_Popup
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B5E0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804ACC4
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndLinkArenaPointsBox
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A51C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A5A4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A614
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A6A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049238
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndLinkArenaPointsBox
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A7C0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A9A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804AA88
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA5BC
gUnknown_085AA5BC:  @ 0x085AA5BC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049F38
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804AEC4
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804AF5C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B190
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B1C0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804B250
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndLinkArenaPointsBox
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B6F4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B43C
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A51C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A5A4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A614
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A6A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049238
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndLinkArenaPointsBox
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A7C0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A9A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804AA88
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_SIOMAIN2
ProcScr_SIOMAIN2:  @ 0x085AA6BC
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d9fbc
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049828
        @ PROC_CALL
        .short 0x2, 0x0
        .word FadeInBlackSpeed20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Clear_0203DDDC
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80499D0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word gUnknown_085AAB68
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8049964
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B71C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804B76C
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049B04
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA75C
gUnknown_085AA75C:  @ 0x085AA75C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B800
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word BattleApplyGameStateUpdates
        @ PROC_WHILE
        .short 0x14, 0x0
        .word DoesBMXFADEExist
        @ PROC_CALL
        .short 0x2, 0x0
        .word BATTLE_GOTO1_IfNobodyIsDead
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B850
        @ PROC_SLEEP
        .short 0xe, 0x20
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word BATTLE_DeleteLinkedMOVEUNIT
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B8D0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA7B4
gUnknown_085AA7B4:  @ 0x085AA7B4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804BB54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804BBA0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804BC3C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA7EC
gUnknown_085AA7EC:  @ 0x085AA7EC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804BB54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804BD3C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804BDD8
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA824
gUnknown_085AA824:  @ 0x085AA824
@ replacing .incbin "baserom.gba", 0x005aa824, 0x18
.4byte Pal_AllWhite
.4byte Pal_AllBlack
.4byte Pal_AllRed
.4byte Pal_AllGreen
.4byte Pal_AllBlue
.4byte Pal_AllYellow

	.global gUnknown_085AA83C
gUnknown_085AA83C:  @ 0x085AA83C
        @ PROC_SLEEP
        .short 0xe, 0x11
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804BF30
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA854
gUnknown_085AA854:  @ 0x085AA854
    .incbin "baserom.gba", 0x5AA854, 0x18

	.global ProcScr_SIOWARP
ProcScr_SIOWARP:  @ 0x085AA86C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d9fc4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C02C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804C078
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C12C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_SIOWARPFX
ProcScr_SIOWARPFX:  @ 0x085AA89C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d9fcc
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C148
        @ PROC_SLEEP
        .short 0xe, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C178
        @ PROC_SLEEP
        .short 0xe, 0xf
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C188
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C194
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C148
        @ PROC_SLEEP
        .short 0xe, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C1B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C1D8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804C1E4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA914
gUnknown_085AA914:  @ 0x085AA914
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C188
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C194
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C148
        @ PROC_SLEEP
        .short 0xe, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C1B8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA954
gUnknown_085AA954:  @ 0x085AA954
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804C2DC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA96C
gUnknown_085AA96C:  @ 0x085AA96C
	.incbin "baserom.gba", 0x5AA96C, 0x14

	.global ProcScr_085AA980
ProcScr_085AA980:  @ 0x085AA980
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C3EC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804C47C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA9A0
gUnknown_085AA9A0:  @ 0x085AA9A0
@ replacing .incbin "baserom.gba", 0x005aa9a0, 0x14
.4byte SioDefaultBgConfig + 0x18
.4byte SioDefaultBgConfig + 0x38
.4byte SioDefaultBgConfig + 0x58
.4byte SioDefaultBgConfig + 0x78
.4byte SioDefaultBgConfig + 0x98

	.global gUnknown_085AA9B4
gUnknown_085AA9B4:  @ 0x085AA9B4
@ replacing .incbin "baserom.gba", 0x005aa9b4, 0xc
.4byte gUnknown_080DA09C + 0x8
.4byte gUnknown_080DA09C + 0x16
.4byte gUnknown_080DA09C + 0x2a

	.global gUnknown_085AA9C0
gUnknown_085AA9C0:  @ 0x085AA9C0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804C5F8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA9D8
gUnknown_085AA9D8:  @ 0x085AA9D8
	.incbin "baserom.gba", 0x5AA9D8, 0x36

	.global gUnknown_085AAA0E
gUnknown_085AAA0E:  @ 0x085AAA0E
	.incbin "baserom.gba", 0x5AAA0E, 0x3A

	.global gUnknown_085AAA48
gUnknown_085AAA48:  @ 0x085AAA48
@ replacing .incbin "baserom.gba", 0x005aaa48, 0x8
.4byte gUnknown_085AA9D8 + 0xe
.4byte gUnknown_085AA9D8 + 0x22

	.global Sprite_085AAA50
Sprite_085AAA50:  @ 0x085AAA50
	.incbin "baserom.gba", 0x5AAA50, 0xE

	.global gUnknown_085AAA5E
gUnknown_085AAA5E:  @ 0x085AAA5E
	.incbin "baserom.gba", 0x5AAA5E, 0x1A

	.global gUnknown_085AAA78
gUnknown_085AAA78:  @ 0x085AAA78
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804C894
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AAA90
gUnknown_085AAA90:  @ 0x085AAA90
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804CB94
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AAAA8
gUnknown_085AAAA8:  @ 0x085AAAA8
@ replacing .incbin "baserom.gba", 0x005aaaa8, 0x8
.4byte gUnknown_080DA102 + 0x20
.4byte gUnknown_080DA102 + 0x28

	.global gUnknown_085AAAB0
gUnknown_085AAAB0:  @ 0x085AAAB0
@ replacing .incbin "baserom.gba", 0x005aaab0, 0x14
.4byte gUnknown_080DA132 + 0x20
.4byte gUnknown_080DA132 + 0x18
.4byte gUnknown_080DA132 + 0x28
.4byte gUnknown_080DA132 + 0x10
.4byte gUnknown_080DA132 + 0x8

	.global Proc_085AAAC4
Proc_085AAAC4:  @ 0x085AAAC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804CCCC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AAADC
gUnknown_085AAADC:  @ 0x085AAADC
@ replacing .incbin "baserom.gba", 0x005aaadc, 0xc
.4byte gUnknown_080DA132 + 0x30
.4byte gUnknown_080DA132 + 0x38
.4byte gUnknown_080DA132 + 0x40

	.global gUnknown_085AAAE8
gUnknown_085AAAE8:  @ 0x085AAAE8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804CDE8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AAB00
gUnknown_085AAB00:  @ 0x085AAB00
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804CE5C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AAB18
gUnknown_085AAB18:  @ 0x085AAB18
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804CF04
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AAB30
gUnknown_085AAB30:  @ 0x085AAB30
	.incbin "baserom.gba", 0x5AAB30, 0x8

	.global gUnknown_085AAB38
gUnknown_085AAB38:  @ 0x085AAB38
	.incbin "baserom.gba", 0x5AAB38, 0x8

	.global gUnknown_085AAB40
gUnknown_085AAB40:  @ 0x085AAB40
	.incbin "baserom.gba", 0x5AAB40, 0x8

	.global gUnknown_085AAB48
gUnknown_085AAB48:  @ 0x085AAB48
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804CFE0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804D01C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085AAB68
gUnknown_085AAB68:  @ 0x085AAB68
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804D2A4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gProcScr_PhaseIntroText
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gProcScr_PhaseIntroSquares
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gProcScr_PhaseIntroBlendBox
        @ PROC_CALL
        .short 0x2, 0x0
        .word PhaseIntro_InitDisp
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word PhaseIntro_WaitForEnd
        @ PROC_CALL
        .short 0x2, 0x0
        .word StopBGM2
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804D37C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085AABB8
gUnknown_085AABB8:  @ 0x085AABB8
@ replacing .incbin "baserom.gba", 0x005aabb8, 0x10
.4byte gUnknown_080DA22C + 0x10
.4byte gUnknown_080DA22C + 0x18
.4byte gUnknown_080DA22C + 0x20
.4byte gUnknown_080DA22C + 0x28

	.global gUnknown_085AABC8
gUnknown_085AABC8:  @ 0x085AABC8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804D47C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AABD8
gUnknown_085AABD8:  @ 0x085AABD8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804D7B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
@ Replacing .incbin "baserom.gba", 0x5AABD8 + 0x18, 0x1C8 - 0x18
    .4byte 0x80da2e4
    .4byte 0x0
    .4byte 0x100
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_804D8C8
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2d8
    .4byte 0x0
    .4byte 0x200
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_804D8C8
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
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x300
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x400
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x500
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x600
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x700
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
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
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80210
    .4byte 0x0
    .4byte 0x85aabf0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte sub_804D940
    .4byte 0x0
    .4byte 0x0

	.global gUnknown_085AADA0
gUnknown_085AADA0:  @ 0x085AADA0
@ Replacing .incbin "baserom.gba", 0x5AADA0, 0x6C
    .4byte 0xe0101
    .4byte 0x0
    .4byte 0x85aac5c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte sub_804D940
    .4byte 0x0
    .4byte 0x0
    .4byte 0xc0201
    .4byte 0x0
    .4byte 0x85aad34
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte MenuCancelSelect
    .4byte 0x0
    .4byte 0x0
    .4byte 0x160201
    .4byte 0x0
    .4byte 0x85aad58
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte MenuCancelSelect
    .4byte 0x0
    .4byte 0x0

	.global gUnknown_085AAE0C
gUnknown_085AAE0C:  @ 0x085AAE0C
    .incbin "baserom.gba", 0x5AAE0C, 0x54C

	.global Img_LinkArenaMenu
Img_LinkArenaMenu:  @ 0x085AB358
    .incbin "baserom.gba", 0x5AB358, 0xA10

	.global Img_TacticianSelObj
Img_TacticianSelObj:  @ 0x085ABD68
    .incbin "baserom.gba", 0x5ABD68, 0x89C

	.global gUnknown_085AC604
gUnknown_085AC604:  @ 0x085AC604
	.incbin "baserom.gba", 0x5AC604, 0x3D8

	.global Img_LinkArenaRankIcons
Img_LinkArenaRankIcons:  @ 0x085AC9DC
	.incbin "baserom.gba", 0x5AC9DC, 0x344

	.global Img_LinkArenaActiveBannerFx
Img_LinkArenaActiveBannerFx:  @ 0x085ACD20
	.incbin "baserom.gba", 0x5ACD20, 0x1DC

	.global gUnknown_085ACEFC
gUnknown_085ACEFC:  @ 0x085ACEFC
	.incbin "baserom.gba", 0x5ACEFC, 0x1D0

	.global Img_LinkArenaPlacementRanks
Img_LinkArenaPlacementRanks:  @ 0x085AD0CC
    .incbin "baserom.gba", 0x5AD0CC, 0x740

	.global gUnknown_085AD80C
gUnknown_085AD80C:  @ 0x085AD80C
	.incbin "baserom.gba", 0x5AD80C, 0x1C0

	.global gUnknown_085AD9CC
gUnknown_085AD9CC:  @ 0x085AD9CC
	.incbin "baserom.gba", 0x5AD9CC, 0x6C

	.global Img_LinkArenaPlayerBanners
Img_LinkArenaPlayerBanners:  @ 0x085ADA38
	.incbin "baserom.gba", 0x5ADA38, 0x1B0

	.global Pal_LinkArenaMenu
Pal_LinkArenaMenu:  @ 0x085ADBE8
	.incbin "baserom.gba", 0x5ADBE8, 0x60

	.global Pal_TacticianSelObj
Pal_TacticianSelObj:  @ 0x085ADC48
	.incbin "baserom.gba", 0x5ADC48, 0x80

	.global Pal_LinkArenaRankIcons
Pal_LinkArenaRankIcons:  @ 0x085ADCC8
	.incbin "baserom.gba", 0x5ADCC8, 0xE0

	.global gUnknown_085ADDA8
gUnknown_085ADDA8:  @ 0x085ADDA8
	.incbin "baserom.gba", 0x5ADDA8, 0x20

	.global Pal_LinkArenaPlacementRanks
Pal_LinkArenaPlacementRanks:  @ 0x085ADDC8
	.incbin "baserom.gba", 0x5ADDC8, 0x20

	.global gUnknown_085ADDE8
gUnknown_085ADDE8:  @ 0x085ADDE8
	.incbin "baserom.gba", 0x5ADDE8, 0x20

	.global Pal_LinkArenaActiveBannerFx
Pal_LinkArenaActiveBannerFx:  @ 0x085ADE08
	.incbin "baserom.gba", 0x5ADE08, 0x20

	.global gUnknown_085ADE28
gUnknown_085ADE28:  @ 0x085ADE28
	.incbin "baserom.gba", 0x5ADE28, 0x20

	.global gUnknown_085ADE48
gUnknown_085ADE48:  @ 0x085ADE48
	.incbin "baserom.gba", 0x5ADE48, 0x20

	.global Pal_085ADE68
Pal_085ADE68:  @ 0x085ADE68
	.incbin "baserom.gba", 0x5ADE68, 0x20

	.global gUnknown_085ADE88
gUnknown_085ADE88:  @ 0x085ADE88
	.incbin "baserom.gba", 0x5ADE88, 0xB8

	.global gUnknown_085ADF40
gUnknown_085ADF40:  @ 0x085ADF40
	.incbin "baserom.gba", 0x5ADF40, 0x250

	.global Tsa_085AE190
Tsa_085AE190:  @ 0x085AE190
	.incbin "baserom.gba", 0x5AE190, 0x2D4

	.global Tsa_SioResultRankings
Tsa_SioResultRankings:  @ 0x085AE464
	.incbin "baserom.gba", 0x5AE464, 0x314

	.global gUnknown_085AE778
gUnknown_085AE778:  @ 0x085AE778
	.incbin "baserom.gba", 0x5AE778, 0x74

	.global gUnknown_085AE7EC
gUnknown_085AE7EC:  @ 0x085AE7EC
    .incbin "baserom.gba", 0x5AE7EC, 0x984

	.global Img_LinkArenaPostBattleBg
Img_LinkArenaPostBattleBg:  @ 0x085AF170
    .incbin "baserom.gba", 0x5AF170, 0x16AC

	.global Pal_LinkArenaPostBattleBg
Pal_LinkArenaPostBattleBg:  @ 0x085B081C
	.incbin "baserom.gba", 0x5B081C, 0x80

	.global Tsa_LinkArenaPostBattleBg
Tsa_LinkArenaPostBattleBg:  @ 0x085B089C
	.incbin "baserom.gba", 0x5B089C, 0x54C

	.global gUnknown_085B0DE8
gUnknown_085B0DE8:  @ 0x085B0DE8
	.incbin "baserom.gba", 0x5B0DE8, 0x144

	.global gUnknown_085B0F2C
gUnknown_085B0F2C:  @ 0x085B0F2C
    .incbin "baserom.gba", 0x5B0F2C, 0x5504
