    .include "animscr.inc"
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
	.incbin "baserom.gba", 0x5C6730, 0x5C69C8 - 0x5C6730

	.global AnimSprite_EfxLvupOBJ2_085C69C8
AnimSprite_EfxLvupOBJ2_085C69C8:	@ 0x085C69C8
	.incbin "baserom.gba", 0x5C69C8, 0x5C6A04 - 0x5C69C8

	.global AnimSprite_EfxLvupOBJ2_085C6A04
AnimSprite_EfxLvupOBJ2_085C6A04:	@ 0x085C6A04
	.incbin "baserom.gba", 0x5C6A04, 0x5C6A58 - 0x5C6A04

	.global AnimSprite_EfxLvupOBJ2_085C6A58
AnimSprite_EfxLvupOBJ2_085C6A58:	@ 0x085C6A58
	.incbin "baserom.gba", 0x5C6A58, 0x5C6AC4 - 0x5C6A58

	.global AnimSprite_EfxLvupOBJ2_085C6AC4
AnimSprite_EfxLvupOBJ2_085C6AC4:	@ 0x085C6AC4
	.incbin "baserom.gba", 0x5C6AC4, 0x5C6B48 - 0x5C6AC4

	.global AnimSprite_EfxLvupOBJ2_085C6B48
AnimSprite_EfxLvupOBJ2_085C6B48:	@ 0x085C6B48
	.incbin "baserom.gba", 0x5C6B48, 0x5C6BCC - 0x5C6B48

	.global AnimSprite_EfxLvupOBJ2_085C6BCC
AnimSprite_EfxLvupOBJ2_085C6BCC:	@ 0x085C6BCC
	.incbin "baserom.gba", 0x5C6BCC, 0x5C6C5C - 0x5C6BCC

	.global AnimSprite_EfxLvupOBJ2_085C6C5C
AnimSprite_EfxLvupOBJ2_085C6C5C:	@ 0x085C6C5C
	.incbin "baserom.gba", 0x5C6C5C, 0x5C6CEC - 0x5C6C5C

	.global AnimSprite_EfxLvupOBJ2_085C6CEC
AnimSprite_EfxLvupOBJ2_085C6CEC:	@ 0x085C6CEC
	.incbin "baserom.gba", 0x5C6CEC, 0x5C6D70 - 0x5C6CEC

	.global AnimSprite_EfxLvupOBJ2_085C6D70
AnimSprite_EfxLvupOBJ2_085C6D70:	@ 0x085C6D70
	.incbin "baserom.gba", 0x5C6D70, 0x5C6DF4 - 0x5C6D70

	.global AnimSprite_EfxLvupOBJ2_085C6DF4
AnimSprite_EfxLvupOBJ2_085C6DF4:	@ 0x085C6DF4
	.incbin "baserom.gba", 0x5C6DF4, 0x5C6E84 - 0x5C6DF4

	.global AnimSprite_EfxLvupOBJ2_085C6E84
AnimSprite_EfxLvupOBJ2_085C6E84:	@ 0x085C6E84
	.incbin "baserom.gba", 0x5C6E84, 0x5C6F14 - 0x5C6E84

	.global AnimSprite_EfxLvupOBJ2_085C6F14
AnimSprite_EfxLvupOBJ2_085C6F14:	@ 0x085C6F14
	.incbin "baserom.gba", 0x5C6F14, 0x5C6FB0 - 0x5C6F14

	.global AnimSprite_EfxLvupOBJ2_085C6FB0
AnimSprite_EfxLvupOBJ2_085C6FB0:	@ 0x085C6FB0
	.incbin "baserom.gba", 0x5C6FB0, 0x5C704C - 0x5C6FB0

	.global AnimSprite_EfxLvupOBJ2_085C704C
AnimSprite_EfxLvupOBJ2_085C704C:	@ 0x085C704C
	.incbin "baserom.gba", 0x5C704C, 0x5C70E8 - 0x5C704C

	.global AnimSprite_EfxLvupOBJ2_085C70E8
AnimSprite_EfxLvupOBJ2_085C70E8:	@ 0x085C70E8
	.incbin "baserom.gba", 0x5C70E8, 0x5C7178 - 0x5C70E8

	.global AnimSprite_EfxLvupOBJ2_085C7178
AnimSprite_EfxLvupOBJ2_085C7178:	@ 0x085C7178
	.incbin "baserom.gba", 0x5C7178, 0x5C71E4 - 0x5C7178

	.global AnimScr_EfxLvupOBJ2
AnimScr_EfxLvupOBJ2:  @ 0x085C71E4
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C69C8, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C6A04, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C6A58, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C6AC4, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C6B48, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C6BCC, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C6C5C, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C6CEC, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C6D70, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C6DF4, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C6E84, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C6F14, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C6FB0, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C704C, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C70E8, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_EfxLvupOBJ2_085C7178, 10
    ANIMSCR_BLOCKED
