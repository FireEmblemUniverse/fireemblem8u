    .section .rodata

	.asciz "efxIvaldi"
	.align 2, 0

	.asciz "efxIvaldiBG1"
	.byte 0

	.global gUnknown_080DE4E6
gUnknown_080DE4E6:  @ 0x080DE4E6
	.incbin "baserom.gba", 0xDE4E6, 0x40

	.global gUnknown_080DE526
gUnknown_080DE526:  @ 0x080DE526
	.incbin "baserom.gba", 0xDE526, 0x2C

	.global gUnknown_080DE552
gUnknown_080DE552:  @ 0x080DE552
	.incbin "baserom.gba", 0xDE552, 0x3C

	.global gUnknown_080DE58E
gUnknown_080DE58E:  @ 0x080DE58E
	.incbin "baserom.gba", 0xDE58E, 0x56

	.global gUnknown_080DE5E4
gUnknown_080DE5E4:  @ 0x080DE5E4
	.incbin "baserom.gba", 0xDE5E4, 0x40

	.global gUnknown_080DE624
gUnknown_080DE624:  @ 0x080DE624
	.incbin "baserom.gba", 0xDE624, 0x38

	.global gUnknown_080DE65C
gUnknown_080DE65C:  @ 0x080DE65C
	.incbin "baserom.gba", 0xDE65C, 0x94

	.global gUnknown_080DE6F0
gUnknown_080DE6F0:  @ 0x080DE6F0
	.incbin "baserom.gba", 0xDE6F0, 0x20

	.global gUnknown_080DE710
gUnknown_080DE710:  @ 0x080DE710
	.incbin "baserom.gba", 0xDE710, 0x38

	.global gUnknown_080DE748
gUnknown_080DE748:  @ 0x080DE748
	.incbin "baserom.gba", 0xDE748, 0x4A

	.global gUnknown_080DE792
gUnknown_080DE792:  @ 0x080DE792
	.incbin "baserom.gba", 0xDE792, 0x10E

	.global gUnknown_080DE8A0
gUnknown_080DE8A0:  @ 0x080DE8A0
@ Replacing .incbin "baserom.gba", 0xDE8A0, 0x20
    .4byte gUnknown_087A5B5C + 0x18
    .4byte gUnknown_087A574C + 0x20c

	.global gUnknown_080DE8A8
gUnknown_080DE8A8:  @ 0x080DE8A8
	.incbin "baserom.gba", 0xDE8A8, 0x18

	.global gUnknown_080DE8C0
gUnknown_080DE8C0:  @ 0x080DE8C0
    .4byte gUnknown_087A5B5C + 0x30
    .4byte gUnknown_087A5940 + 0x30

	.global gUnknown_080DE8C8
gUnknown_080DE8C8:  @ 0x080DE8C8
	.incbin "baserom.gba", 0xDE8C8, 0x14

	.global gUnknown_080DE8DC
gUnknown_080DE8DC:  @ 0x080DE8DC
    .4byte 0x087a536c
    .4byte 0x087a5240

	.global gUnknown_080DE8E4
gUnknown_080DE8E4:  @ 0x080DE8E4
	.incbin "baserom.gba", 0xDE8E4, 0x1C

	.global gUnknown_080DE900
gUnknown_080DE900:  @ 0x080DE900
	.incbin "baserom.gba", 0xDE900, 0x24

	.global gUnknown_080DE924
gUnknown_080DE924:  @ 0x080DE924
    .4byte gUnknown_087A61EC + 0x11f4
    .4byte gUnknown_087A61EC + 0xd78

	.global gUnknown_080DE92C
gUnknown_080DE92C:  @ 0x080DE92C
	.incbin "baserom.gba", 0xDE92C, 0x48

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
