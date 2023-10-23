	.section .data

	.global ProcScr_EkrLvupApfx
ProcScr_EkrLvupApfx:  @ 0x08759564
        @ PROC_CALL
        .short 0x2, 0x0
        .word EkrLvupApfxInit
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EkrLvupApfxMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_eobjLvup
ProcScr_eobjLvup:  @ 0x0875957C
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
