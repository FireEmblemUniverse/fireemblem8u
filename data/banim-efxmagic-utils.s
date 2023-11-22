	.section .data

	.global ProcScr_efxALPHA
ProcScr_efxALPHA:  @ 0x085D5028
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8a0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxALPHAMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxCircleWIN
ProcScr_efxCircleWIN:  @ 0x085D5040
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8ac
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxCircleWINMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxMagicQUAKE
ProcScr_efxMagicQUAKE:  @ 0x085D5058
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxMagicQUAKE
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
