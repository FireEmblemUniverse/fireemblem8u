	.section .data

	.global ProcScr_EfxPartsofScroll
ProcScr_EfxPartsofScroll:  @ 0x087593DC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e15e8
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_62
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074610
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_EfxPartsofScroll2
ProcScr_EfxPartsofScroll2:  @ 0x087593FC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e15fc
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8074634
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074638
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875941C
gUnknown_0875941C:  @ 0x0875941C
	.incbin "baserom.gba", 0x75941C, 0x40

	.global ProcScr_Efxleveluphb
ProcScr_Efxleveluphb:  @ 0x0875945C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1610
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_807478C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074798
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80747A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_Efxlvupbg
ProcScr_Efxlvupbg:  @ 0x08759484
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1620
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807490C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875949C
gUnknown_0875949C:  @ 0x0875949C
    .4byte gUnknown_085C48AC + 0x20
    .4byte gUnknown_085C48AC + 0x180
    .4byte gUnknown_085C48AC + 0x2f4
    .4byte gUnknown_085C48AC + 0x488
    .4byte gUnknown_085C48AC + 0x63c
    .4byte gUnknown_085C48AC + 0x814
    .4byte gUnknown_085C48AC + 0xa0c
    .4byte gUnknown_085C48AC + 0xc28
    .4byte gUnknown_085C48AC + 0xe3c
    .4byte gUnknown_085C48AC + 0xf6c
    .4byte gUnknown_085C48AC + 0x1034

	.global gUnknown_087594C8
gUnknown_087594C8:  @ 0x087594C8
    .4byte gUnknown_085BEF94 + 0x774
    .4byte gUnknown_085BEF94 + 0x774
    .4byte gUnknown_085BEF94 + 0x134c
    .4byte gUnknown_085BEF94 + 0x134c
    .4byte gUnknown_085BEF94 + 0x217c
    .4byte gUnknown_085BEF94 + 0x2d40
    .4byte gUnknown_085BEF94 + 0x3980
    .4byte gUnknown_085BEF94 + 0x4704
    .4byte gUnknown_085BEF94 + 0x5408
    .4byte gUnknown_085BEF94 + 0x5408
    .4byte gUnknown_085BEF94 + 0x5408

	.global ProcScr_efxLvupBG2
ProcScr_efxLvupBG2:  @ 0x087594F4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1658
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80749B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875950C
gUnknown_0875950C:  @ 0x0875950C
    .4byte gUnknown_085C60D4 + 0x20
    .4byte gUnknown_085C60D4 + 0x104
    .4byte gUnknown_085C60D4 + 0x1e8
    .4byte gUnknown_085C60D4 + 0x308
    .4byte gUnknown_085C60D4 + 0x428
    .4byte gUnknown_085C60D4 + 0x544

	.global ProcScr_efxLvupOBJ2
ProcScr_efxLvupOBJ2:  @ 0x08759524
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1680
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8074A54
        @ PROC_SLEEP
        .short 0xe, 0x18
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxLvupBGCOL
ProcScr_efxLvupBGCOL:  @ 0x08759544
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e168c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074A94
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074AFC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_EkrLvupApfx
ProcScr_EkrLvupApfx:  @ 0x08759564
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8074B38
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074B40
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875957C
gUnknown_0875957C:  @ 0x0875957C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e16f0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074E6C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074EDC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074F14
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
