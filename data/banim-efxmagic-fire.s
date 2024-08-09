	.section .data

	.global ProcScr_efxElfireBG
ProcScr_efxElfireBG:  @ 0x085D5608
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcdc8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxElfireBG_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxElfireBGCOL
ProcScr_efxElfireBGCOL:  @ 0x085D5620
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcdd4
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxElfireBGCOL_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxElfireOBJ
ProcScr_efxElfireOBJ:  @ 0x085D5640
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dce3c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxElfireObj_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
