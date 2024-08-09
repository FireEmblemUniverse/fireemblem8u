    .section .rodata

	.incbin "baserom.gba", 0xDCDC8, 0xDCDE4 - 0xDCDC8

	.global gUnknown_080DCDE4
gUnknown_080DCDE4:  @ 0x080DCDE4
	.incbin "baserom.gba", 0xDCDE4, 0x58

	.global gAsciiStr_efxElfireOBJ
gAsciiStr_efxElfireOBJ:
	.asciz "efxElfireOBJ"
	.align 2, 0
