    .section .rodata

	.incbin "baserom.gba", 0xDC944, 0xDC956 - 0xDC944

	.global gUnknown_080DC956
gUnknown_080DC956:  @ 0x080DC956
	.incbin "baserom.gba", 0xDC956, 0x106

	.global gUnknown_080DCA5C
gUnknown_080DCA5C:  @ 0x080DCA5C
	.incbin "baserom.gba", 0xDCA5C, 0x11C

	.global gUnknown_080DCB78
gUnknown_080DCB78:  @ 0x080DCB78
	.incbin "baserom.gba", 0xDCB78, 0x5C

	.global gUnknown_080DCBD4
gUnknown_080DCBD4:  @ 0x080DCBD4
	.incbin "baserom.gba", 0xDCBD4, 0xD2

	.global gUnknown_080DCCA6
gUnknown_080DCCA6:  @ 0x080DCCA6
	.incbin "baserom.gba", 0xDCCA6, 0x1A

	.global gUnknown_080DCCC0
gUnknown_080DCCC0:  @ 0x080DCCC0
	.incbin "baserom.gba", 0xDCCC0, 0x66

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
