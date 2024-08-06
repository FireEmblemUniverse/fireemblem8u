	.section .data

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
