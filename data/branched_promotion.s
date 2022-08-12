    .section .data

	.global gUnknown_08B12A08
gUnknown_08B12A08:  @ 0x08B12A08
        @ PROC_SLEEP
        .short 0xe, 0x6
        .word 0x0
        @ PROC_NAME("CCRamifyMenuSelect")
        .short 0x1, 0x0
        .word 0x82070f0
        @ PROC_CALL
        .short 0x2, 0x0
        .word BuildPromotionMenu
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CDDD4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_61
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

    .section .rodata

	.global gUnknown_08207044
gUnknown_08207044:  @ 0x08207044
	.incbin "baserom.gba", 0x207044, 0xC

	.incbin "baserom.gba", 0x207050, 0x2C

	.global gUnknown_0820707C
gUnknown_0820707C:  @ 0x0820707C
	.incbin "baserom.gba", 0x20707C, 0xC

	.global gUnknown_08207088
gUnknown_08207088:  @ 0x08207088
	.incbin "baserom.gba", 0x207088, 0xC

	.global gUnknown_08207094
gUnknown_08207094:  @ 0x08207094
	.incbin "baserom.gba", 0x207094, 0xC

	.global gUnknown_082070A0
gUnknown_082070A0:  @ 0x082070A0
	.incbin "baserom.gba", 0x2070A0, 0xC

	.global gUnknown_082070AC
gUnknown_082070AC:  @ 0x082070AC
	.incbin "baserom.gba", 0x2070AC, 0xC

	.global gUnknown_082070B8
gUnknown_082070B8:  @ 0x082070B8
	.incbin "baserom.gba", 0x2070B8, 0xD8
