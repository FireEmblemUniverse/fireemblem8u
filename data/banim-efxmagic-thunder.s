	.section .data

	.global ProcScr_efxThunder
ProcScr_efxThunder:  @ 0x085D5428
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcc8c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxThunder
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxThunderBG
ProcScr_efxThunderBG:  @ 0x085D5440
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcc98
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxThunderBGMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5458
gUnknown_085D5458:  @ 0x085D5458
    .4byte Pal_ThunderSpellBg + 0x200
    .4byte Pal_ThunderSpellBg + 0x2cc

	.global gUnknown_085D5460
gUnknown_085D5460:  @ 0x085D5460
    .4byte Pal_ThunderSpellBg + 0x200
    .4byte Pal_ThunderSpellBg + 0x2cc

	.global ProcScr_efxThunderBGCOL
ProcScr_efxThunderBGCOL:  @ 0x085D5468
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dccb0
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D9F8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxThunderOBJ
ProcScr_efxThunderOBJ:  @ 0x085D5488
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcd04
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxThunderOBJMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
