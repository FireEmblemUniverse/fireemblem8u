    .section .data

@ TODO remove padding FF

	.global gUnknown_08E47180
gUnknown_08E47180:  @ 0x08E47180
	.incbin "baserom.gba", 0xE47180, 0x98E88

	.global gUnknown_08EE0008
gUnknown_08EE0008:  @ 0x08EE0008
	.incbin "baserom.gba", 0xEE0008, 0x18000

	.global gUnknown_08EF8008
gUnknown_08EF8008:  @ 0x08EF8008
	.incbin "baserom.gba", 0xEF8008
