    .section .data

	.global gUnknown_0859AA7C
gUnknown_0859AA7C:  @ 0x0859AA7C
	.incbin "baserom.gba", 0x59AA7C, 0x8

	.global gUnknown_0859AA84
gUnknown_0859AA84:  @ 0x0859AA84
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048260
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859AA9C
gUnknown_0859AA9C:  @ 0x0859AA9C
	.incbin "baserom.gba", 0x59AA9C, 0x3C
