	.section .data

	.global ProcScr_efxMantBatabata
ProcScr_efxMantBatabata:  @ 0x085D9284
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df514
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806DFA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806DFD0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
