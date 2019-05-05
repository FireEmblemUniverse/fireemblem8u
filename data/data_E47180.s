    .section .data

    .incbin "baserom.gba", 0xEE0000, 0x8

	.global gUnknown_08EE0008
gUnknown_08EE0008:  @ 0x08EE0008
	.incbin "baserom.gba", 0xEE0008, 0x18000

	.global gUnknown_08EF8008
gUnknown_08EF8008:  @ 0x08EF8008
	.incbin "baserom.gba", 0xEF8008, 0x32D8
