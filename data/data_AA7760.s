	.section .data

	.global gGfx_TitleMainBackground_1
gGfx_TitleMainBackground_1:  @ 0x08AA7760
	.incbin "baserom.gba", 0xAA7760, 0x1FA8

	.global gGfx_TitleMainBackground_2
gGfx_TitleMainBackground_2:  @ 0x08AA9708
	.incbin "baserom.gba", 0xAA9708, 0x1788

	.global gTsa_TitleMainBackground
gTsa_TitleMainBackground:  @ 0x08AAAE90
	.incbin "baserom.gba", 0xAAAE90, 0x564

	.global gPal_TitleMainBackground
gPal_TitleMainBackground:  @ 0x08AAB3F4
	.incbin "baserom.gba", 0xAAB3F4, 0x20

	.global gGfx_TitleDragonForeground
gGfx_TitleDragonForeground:  @ 0x08AAB414
	.incbin "baserom.gba", 0xAAB414, 0xE90

	.global gTsa_TitleDragonForeground
gTsa_TitleDragonForeground:  @ 0x08AAC2A4
	.incbin "baserom.gba", 0xAAC2A4, 0x2E8

	.global gPal_TitleDragonForeground
gPal_TitleDragonForeground:  @ 0x08AAC58C
	.incbin "baserom.gba", 0xAAC58C, 0x20

	.global gGfx_FireEmblemLogo
gGfx_FireEmblemLogo:  @ 0x08AAC5AC
	.incbin "baserom.gba", 0xAAC5AC, 0x930

	.global gGfx_SubtitlePressStart
gGfx_SubtitlePressStart:  @ 0x08AACEDC
	.incbin "baserom.gba", 0xAACEDC, 0xC8C

	.global gPal_PressStart
gPal_PressStart:  @ 0x08AADB68
	.incbin "baserom.gba", 0xAADB68, 0x80

	.global gPal_08AADBE8
gPal_08AADBE8:  @ 0x08AADBE8
	.incbin "baserom.gba", 0xAADBE8, 0x20

	.global gGfx_08AADC08
gGfx_08AADC08:  @ 0x08AADC08
	.incbin "baserom.gba", 0xAADC08, 0xA14

	.global gTsa_08AAE61C
gTsa_08AAE61C:  @ 0x08AAE61C
	.incbin "baserom.gba", 0xAAE61C, 0x2B0

	.global gPal_08AAE8CC
gPal_08AAE8CC:  @ 0x08AAE8CC
	.incbin "baserom.gba", 0xAAE8CC, 0x20

	.global gGfx_08AAE8EC
gGfx_08AAE8EC:  @ 0x08AAE8EC
	.incbin "baserom.gba", 0xAAE8EC, 0x103C

	.global gTsa_08AAF928
gTsa_08AAF928:  @ 0x08AAF928
	.incbin "baserom.gba", 0xAAF928, 0x3CC

	.global gPal_08AAFCF4
gPal_08AAFCF4:  @ 0x08AAFCF4
	.incbin "baserom.gba", 0xAAFCF4, 0x20

	.global gGfx_08AAFD14
gGfx_08AAFD14:  @ 0x08AAFD14
	.incbin "baserom.gba", 0xAAFD14, 0x1FC

	.global gTsa_08AAFF10
gTsa_08AAFF10:  @ 0x08AAFF10
	.incbin "baserom.gba", 0xAAFF10, 0x204

	.global gPal_08AB0114
gPal_08AB0114:  @ 0x08AB0114
	.incbin "baserom.gba", 0xAB0114, 0x20

	.global gGfx_08AB0134
gGfx_08AB0134:  @ 0x08AB0134
	.incbin "baserom.gba", 0xAB0134, 0x8EC

	.global gTsa_08AB0A20
gTsa_08AB0A20:  @ 0x08AB0A20
	.incbin "baserom.gba", 0xAB0A20, 0x104

	.global gPal_08AB0B24
gPal_08AB0B24:  @ 0x08AB0B24
@ Replacing .incbin "baserom.gba", 0xAB0B24, 0x20
    .4byte 0x4414290
    .4byte 0x1f3e571d
    .4byte 0x33bf277f
    .4byte 0x6bff47bf
    .4byte 0x45ee21ba
    .4byte Pal_NaglfarSprites_B + 0x2c4
    .4byte 0xcd2467b
    .4byte 0x7fff044a

	.global gGfx_TitleDemonKing
gGfx_TitleDemonKing:  @ 0x08AB0B44
	.incbin "baserom.gba", 0xAB0B44, 0xD4C

	.global gTsa_TitleDemonKing
gTsa_TitleDemonKing:  @ 0x08AB1890
	.incbin "baserom.gba", 0xAB1890, 0x374

	.global gPal_TitleDemonKing
gPal_TitleDemonKing:  @ 0x08AB1C04
	.incbin "baserom.gba", 0xAB1C04, 0x20

	.global gGfx_TitleLargeGlowingOrb
gGfx_TitleLargeGlowingOrb:  @ 0x08AB1C24
	.incbin "baserom.gba", 0xAB1C24, 0x4E8

	.global gPal_TitleLargeGlowingOrb
gPal_TitleLargeGlowingOrb:  @ 0x08AB210C
	.incbin "baserom.gba", 0xAB210C, 0x60

	.global gGfx_TitleSmallLightBubbles
gGfx_TitleSmallLightBubbles:  @ 0x08AB216C
	.incbin "baserom.gba", 0xAB216C, 0x4C

	.global gPal_TitleSmallLightBubbles
gPal_TitleSmallLightBubbles:  @ 0x08AB21B8
	.incbin "baserom.gba", 0xAB21B8, 0x20
