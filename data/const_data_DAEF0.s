    .section .rodata

	.global gUnknown_080DAF34
gUnknown_080DAF34:  @ 0x080DAF34
	.incbin "baserom.gba", 0xDAF34, 0x2C

	.global gUnknown_080DAF60
gUnknown_080DAF60:  @ 0x080DAF60
	.incbin "baserom.gba", 0xDAF60, 0xC6

	.global gUnknown_080DB026
gUnknown_080DB026:  @ 0x080DB026
	.incbin "baserom.gba", 0xDB026, 0x1836

	.global gUnknown_080DC85C
gUnknown_080DC85C:  @ 0x080DC85C
	.incbin "baserom.gba", 0xDC85C, 0xDC860 - 0xDC85C
