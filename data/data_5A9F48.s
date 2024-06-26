    .section .data

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
        .word ProcScr_LinkArenaPhaseIntro
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
