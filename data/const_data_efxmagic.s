    .section .rodata

	.asciz "efxDarkLongMons"

	.global gUnknown_080DEF78
gUnknown_080DEF78:  @ 0x080DEF78
	.incbin "baserom.gba", 0xDEF78, 0x58

	.global gUnknown_080DEFD0
gUnknown_080DEFD0:  @ 0x080DEFD0
	.incbin "baserom.gba", 0xDEFD0, 0x72

	.global gUnknown_080DF042
gUnknown_080DF042:  @ 0x080DF042
	.incbin "baserom.gba", 0xDF042, 0x3E

	.global gUnknown_080DF080
gUnknown_080DF080:  @ 0x080DF080
	.incbin "baserom.gba", 0xDF080, 0x60

	.global gUnknown_080DF0E0
gUnknown_080DF0E0:  @ 0x080DF0E0
	.incbin "baserom.gba", 0xDF0E0, 0xDF11C - 0xDF0E0
