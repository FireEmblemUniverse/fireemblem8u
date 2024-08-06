    .section .rodata

	.incbin "baserom.gba", 0xDCD04, 0xDCD26 - 0xDCD04

	.global gUnknown_080DCD26
gUnknown_080DCD26:  @ 0x080DCD26
	.incbin "baserom.gba", 0xDCD26, 0x4C

	.global gUnknown_080DCD72
gUnknown_080DCD72:  @ 0x080DCD72
	.incbin "baserom.gba", 0xDCD72, 0x72

	.global gUnknown_080DCDE4
gUnknown_080DCDE4:  @ 0x080DCDE4
	.incbin "baserom.gba", 0xDCDE4, 0x58

	.global gAsciiStr_efxElfireOBJ
gAsciiStr_efxElfireOBJ:
	.asciz "efxElfireOBJ"
	.align 2, 0
