	.section .data

	.global Img_LvupApfx
Img_LvupApfx:  @ 0x085BB0C8
	.incbin "./graphics/lvup/LvupAp.4bpp.lz"

	.global Pal_LvupApfx
Pal_LvupApfx:  @ 0x085BB2DC
	.incbin "./graphics/lvup/LvupAp.gbapal", 0x0, 0x20

    .incbin "baserom.gba", 0x5BB2FC, 0x5BC188 - 0x5BB2FC

	.global Img_ArenaBattleBg
Img_ArenaBattleBg:  @ 0x085BC188
	.incbin "baserom.gba", 0x5BC188, 0x266C

	.global Tsa_ArenaBattleBg
Tsa_ArenaBattleBg:  @ 0x085BE7F4
	.incbin "baserom.gba", 0x5BE7F4, 0x7A0

	.global Pal_ArenaBattleBg_A
Pal_ArenaBattleBg_A:  @ 0x085BEF94
	.incbin "baserom.gba", 0x5BEF94, 0x80

	.global Pal_ArenaBattleBg_B
Pal_ArenaBattleBg_B:  @ 0x085BF014
	.incbin "baserom.gba", 0x5BF014, 0x80

	.global Pal_ArenaBattleBg_C
Pal_ArenaBattleBg_C:  @ 0x085BF094
	.incbin "baserom.gba", 0x5BF094, 0x80

	.incbin "baserom.gba", 0x5BF114, 0x5F4

	.global Img1_EfxLvupBG
Img1_EfxLvupBG:
	.incbin "baserom.gba", 0x5BF708, 0x5C02E0 - 0x5BF708

	.global Img2_EfxLvupBG
Img2_EfxLvupBG:
	.incbin "baserom.gba", 0x5C02E0, 0x5C1110 - 0x5C02E0

	.global Img3_EfxLvupBG
Img3_EfxLvupBG:
	.incbin "baserom.gba", 0x5C1110, 0x5C1CD4 - 0x5C1110

	.global Img4_EfxLvupBG
Img4_EfxLvupBG:
	.incbin "baserom.gba", 0x5C1CD4, 0x5C2914 - 0x5C1CD4

	.global Img5_EfxLvupBG
Img5_EfxLvupBG:
	.incbin "baserom.gba", 0x5C2914, 0x5C3698 - 0x5C2914

	.global Img6_EfxLvupBG
Img6_EfxLvupBG:
	.incbin "baserom.gba", 0x5C3698, 0x5C439C - 0x5C3698

	.global Img7_EfxLvupBG
Img7_EfxLvupBG:
	.incbin "baserom.gba", 0x5C439C, 0x5C48AC - 0x5C439C

	.global Pal_EfxLvupBG
Pal_EfxLvupBG:  @ 0x085C48AC
	.incbin "baserom.gba", 0x5C48AC, 0x5C48CC - 0x5C48AC

    .global Tsa1_EfxLvupBG
Tsa1_EfxLvupBG:
    .incbin "baserom.gba", 0x5C48CC, 0x5C4A2C - 0x5C48CC

    .global Tsa2_EfxLvupBG
Tsa2_EfxLvupBG:
    .incbin "baserom.gba", 0x5C4A2C, 0x5C4BA0 - 0x5C4A2C

    .global Tsa3_EfxLvupBG
Tsa3_EfxLvupBG:
    .incbin "baserom.gba", 0x5C4BA0, 0x5C4D34 - 0x5C4BA0

    .global Tsa4_EfxLvupBG
Tsa4_EfxLvupBG:
    .incbin "baserom.gba", 0x5C4D34, 0x5C4EE8 - 0x5C4D34

    .global Tsa5_EfxLvupBG
Tsa5_EfxLvupBG:
    .incbin "baserom.gba", 0x5C4EE8, 0x5C50C0 - 0x5C4EE8

    .global Tsa6_EfxLvupBG
Tsa6_EfxLvupBG:
    .incbin "baserom.gba", 0x5C50C0, 0x5C52B8 - 0x5C50C0

    .global Tsa7_EfxLvupBG
Tsa7_EfxLvupBG:
    .incbin "baserom.gba", 0x5C52B8, 0x5C54D4 - 0x5C52B8

    .global Tsa8_EfxLvupBG
Tsa8_EfxLvupBG:
    .incbin "baserom.gba", 0x5C54D4, 0x5C56E8 - 0x5C54D4

    .global Tsa9_EfxLvupBG
Tsa9_EfxLvupBG:
    .incbin "baserom.gba", 0x5C56E8, 0x5C5818 - 0x5C56E8

    .global Tsa10_EfxLvupBG
Tsa10_EfxLvupBG:
    .incbin "baserom.gba", 0x5C5818, 0x5C58E0 - 0x5C5818

    .global Tsa11_EfxLvupBG
Tsa11_EfxLvupBG:
    .incbin "baserom.gba", 0x5C58E0, 0x5C5994 - 0x5C58E0

	.global Img_EfxLvupBG2
Img_EfxLvupBG2:  @ 0x085C5994
	.incbin "baserom.gba", 0x5C5994, 0x6C0

	.global Pal_EfxLvupBG2
Pal_EfxLvupBG2:  @ 0x085C6054
	.incbin "baserom.gba", 0x5C6054, 0x80

	.global Pal_EfxLvupBGCOL
Pal_EfxLvupBGCOL:  @ 0x085C60D4
	.incbin "baserom.gba", 0x5C60D4, 0x20

    .global Tsa1_EfxLvupBG2
Tsa1_EfxLvupBG2:
    .incbin "baserom.gba", 0x5C60F4, 0x5C61D8 - 0x5C60F4

    .global Tsa2_EfxLvupBG2
Tsa2_EfxLvupBG2:
    .incbin "baserom.gba", 0x5C61D8, 0x5C62BC - 0x5C61D8

    .global Tsa3_EfxLvupBG2
Tsa3_EfxLvupBG2:
    .incbin "baserom.gba", 0x5C62BC, 0x5C63DC - 0x5C62BC

    .global Tsa4_EfxLvupBG2
Tsa4_EfxLvupBG2:
    .incbin "baserom.gba", 0x5C63DC, 0x5C64FC - 0x5C63DC

    .global Tsa5_EfxLvupBG2
Tsa5_EfxLvupBG2:
    .incbin "baserom.gba", 0x5C64FC, 0x5C6618 - 0x5C64FC

    .global Tsa6_EfxLvupBG2
Tsa6_EfxLvupBG2:
    .incbin "baserom.gba", 0x5C6618, 0x5C6730 - 0x5C6618

	.global Img_EfxLvupOBJ2
Img_EfxLvupOBJ2:  @ 0x085C6730
	.incbin "baserom.gba", 0x5C6730, 0xAB4

@ Following are some animation scripts. these contain pointers, sometimes
@ packed with other data into one word. Ideally there'd be some macros here
@ based on the decoding in animedrv.c - but I think the alignment guarantees
@ that shifting the objects referenced here doesn't affect the other data.

	.global AnimScr_EfxLvupOBJ2
AnimScr_EfxLvupOBJ2:  @ 0x085C71E4
@ Replacing .incbin "baserom.gba", 0x5C71E4, 0xC8
    .4byte Img_EfxLvupOBJ2 + 0x299
    .4byte Img_EfxLvupOBJ2 + 0x2d5
    .4byte Img_EfxLvupOBJ2 + 0x329
    .4byte Img_EfxLvupOBJ2 + 0x395
    .4byte Img_EfxLvupOBJ2 + 0x419
    .4byte Img_EfxLvupOBJ2 + 0x49d
    .4byte Img_EfxLvupOBJ2 + 0x52d
    .4byte Img_EfxLvupOBJ2 + 0x5bd
    .4byte Img_EfxLvupOBJ2 + 0x641
    .4byte Img_EfxLvupOBJ2 + 0x6c5
    .4byte Img_EfxLvupOBJ2 + 0x755
    .4byte Img_EfxLvupOBJ2 + 0x7e5
    .4byte Img_EfxLvupOBJ2 + 0x881
    .4byte Img_EfxLvupOBJ2 + 0x91d
    .4byte Img_EfxLvupOBJ2 + 0x9b9
    .4byte 0x20000000 + Img_EfxLvupOBJ2 + 0xa4a
    .4byte 0x80000000
    .4byte 0x80004000
    .4byte 0xffd00000
    .4byte 0x00000008
    .4byte 0x80004000
    .4byte 0xfff00004
    .4byte 0x00000008
    .4byte 0x80004000
    .4byte 0x00100008
    .4byte 0x00000008
    .4byte 0x00008000
    .4byte 0x0030000c
    .4byte 0x00000008
    .4byte 0x80004000
    .4byte 0xffd0000d
    .4byte 0x0000fff8
    .4byte 0x80004000
    .4byte 0xfff00011
    .4byte 0x0000fff8
    .4byte 0x80004000
    .4byte 0x00100015
    .4byte 0x0000fff8
    .4byte 0x40004000
    .4byte 0xffd00019
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0xfff0001d
    .4byte 0x0000fff0
    .4byte 0x40004000
    .4byte 0x00000039
    .4byte 0x0000fff0
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
