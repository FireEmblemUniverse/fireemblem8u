    .section .rodata

	.asciz "efxDarkGrado"
	.align 2, 0

	.asciz "efxDarkGradoMapFadeOut"
	.align 2, 0

	.global gUnknown_080DEDBC
gUnknown_080DEDBC:  @ 0x080DEDBC
	.incbin "baserom.gba", 0xDEDBC, 0x3E

	.global gUnknown_080DEDFA
gUnknown_080DEDFA:  @ 0x080DEDFA
	.incbin "baserom.gba", 0xDEDFA, 0x46

	.global gUnknown_080DEE40
gUnknown_080DEE40:  @ 0x080DEE40
	.incbin "baserom.gba", 0xDEE40, 0x82

	.global gUnknown_080DEEC2
gUnknown_080DEEC2:  @ 0x080DEEC2
	.incbin "baserom.gba", 0xDEEC2, 0x5E

	.global gUnknown_080DEF20
gUnknown_080DEF20:  @ 0x080DEF20
	.incbin "baserom.gba", 0xDEF20, 0x58

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
