	.section .rodata

	.align 2, 0

	.global gUnknown_080D77FC
gUnknown_080D77FC:  @ 0x080D77FC
	.incbin "baserom.gba", 0xD77FC, 0xF0

	.global gUnknown_080D78EC
gUnknown_080D78EC:  @ 0x080D78EC
	.incbin "baserom.gba", 0xD78EC, 0x1C

	.global gUnknown_080D7908
gUnknown_080D7908:  @ 0x080D7908
	.incbin "baserom.gba", 0xD7908, 0x24-0x10
