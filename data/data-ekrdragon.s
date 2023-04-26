	.section .data

	.global ProcScr_ekrWhiteINOUT
ProcScr_ekrWhiteINOUT:  @ 0x087586F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dfa1c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80705A8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8070618
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8070670
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80706E0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08758720
gUnknown_08758720:  @ 0x08758720
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80707C0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80707FC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08758740
gUnknown_08758740:  @ 0x08758740
	.incbin "baserom.gba", 0x758740, 0x14
