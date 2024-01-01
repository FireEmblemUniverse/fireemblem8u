    .section .rodata

	.asciz "efxStone"
	.align 2, 0

	.asciz "efxStoneBG"
	.align 2, 0

	.global gUnknown_080DE974
gUnknown_080DE974:  @ 0x080DE974
	.incbin "baserom.gba", 0xDE974, 0x76

	.global gUnknown_080DE9EA
gUnknown_080DE9EA:  @ 0x080DE9EA
	.incbin "baserom.gba", 0xDE9EA, 0x60

	.global gUnknown_080DEA4A
gUnknown_080DEA4A:  @ 0x080DEA4A
	.incbin "baserom.gba", 0xDEA4A, 0x2A

	.global gUnknown_080DEA74
gUnknown_080DEA74:  @ 0x080DEA74
	.incbin "baserom.gba", 0xDEA74, 0x22

	.global gUnknown_080DEA96
gUnknown_080DEA96:  @ 0x080DEA96
	.incbin "baserom.gba", 0xDEA96, 0x14

	.global gUnknown_080DEAAA
gUnknown_080DEAAA:  @ 0x080DEAAA
	.incbin "baserom.gba", 0xDEAAA, 0x50

	.global gUnknown_080DEAFA
gUnknown_080DEAFA:  @ 0x080DEAFA
	.incbin "baserom.gba", 0xDEAFA, 0x70

	.global gUnknown_080DEB6A
gUnknown_080DEB6A:  @ 0x080DEB6A
	.incbin "baserom.gba", 0xDEB6A, 0x5E

	.global gUnknown_080DEBC8
gUnknown_080DEBC8:  @ 0x080DEBC8
@ replacing .incbin "baserom.gba", 0x000debc8, 0x30
.4byte gUnknown_086FF3A4 + 0x104
.4byte gUnknown_086FF3A4 + 0x218
.4byte gUnknown_086FF3A4 + 0x10c
.4byte gUnknown_086FF3A4 + 0x220
.4byte gUnknown_086FF3A4 + 0x114
.4byte gUnknown_086FF3A4 + 0x228
.4byte gUnknown_086FF3A4 + 0x11c
.4byte gUnknown_086FF3A4 + 0x230
.4byte gUnknown_086FF3A4 + 0x124
.4byte gUnknown_086FF3A4 + 0x238
.4byte gUnknown_086FF3A4 + 0x12c
.4byte gUnknown_086FF3A4 + 0x240

	.global gUnknown_080DEBF8
gUnknown_080DEBF8:  @ 0x080DEBF8
	.incbin "baserom.gba", 0xDEBF8, 0x14

	.global gUnknown_080DEC0C
gUnknown_080DEC0C:  @ 0x080DEC0C
	.incbin "baserom.gba", 0xDEC0C, 0x24

	.global gUnknown_080DEC30
gUnknown_080DEC30:  @ 0x080DEC30
	.incbin "baserom.gba", 0xDEC30, 0x8A

	.global gUnknown_080DECBA
gUnknown_080DECBA:  @ 0x080DECBA
	.incbin "baserom.gba", 0xDECBA, 0x102

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
