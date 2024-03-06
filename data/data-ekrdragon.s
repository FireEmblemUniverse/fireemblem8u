	.section .data

	.global ProcScr_EkrDragon_08758720
ProcScr_EkrDragon_08758720:  @ 0x08758720
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
