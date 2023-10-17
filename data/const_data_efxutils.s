    .section .rodata

	.global gUnknown_080E13D4
gUnknown_080E13D4:  @ 0x080E13D4
	.incbin "baserom.gba", 0xE13D4, 0x20

	.global gUnknown_080E13F4
gUnknown_080E13F4:  @ 0x080E13F4
	.incbin "baserom.gba", 0xE13F4, 0xE1420 - 0xE13F4
