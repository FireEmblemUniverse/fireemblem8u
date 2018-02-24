    .section .rodata

	.global gUnknown_08C00008
gUnknown_08C00008:  @ 0x08C00008
	.incbin "baserom.gba", 0xC00008, 0x2E0000

	.global gUnknown_08EE0008
gUnknown_08EE0008:  @ 0x08EE0008
	.incbin "baserom.gba", 0xEE0008, 0x18000

	.global gUnknown_08EF8008
gUnknown_08EF8008:  @ 0x08EF8008
	.incbin "baserom.gba", 0xEF8008
