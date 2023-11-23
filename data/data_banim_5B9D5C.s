	.section .data
    .include "animscr.inc"

	.global Img_EkrLvupNumBig
Img_EkrLvupNumBig:  @ 0x085C8278
    .incbin "baserom.gba", 0x5C8278, 0x5c8a78 - 0x5C8278
	@.incbin "./graphics/lvup/EkrLvupNumBig.4bpp"

    .incbin "baserom.gba", 0x5c8a78, 0x5C9270 - 0x5c8a78

	.global gUnknown_085C9270
gUnknown_085C9270:  @ 0x085C9270
@ Replacing .incbin "baserom.gba", 0x5C9270, 0x30
    .4byte Img_EkrLvupNumBig + 0x802
    .4byte Img_EkrLvupNumBig + 0x832
    .4byte Img_EkrLvupNumBig + 0x87a
    .4byte Img_EkrLvupNumBig + 0x8ce
    .4byte Img_EkrLvupNumBig + 0x922
    .4byte Img_EkrLvupNumBig + 0x976
    .4byte Img_EkrLvupNumBig + 0x9ca
    .4byte Img_EkrLvupNumBig + 0xa1e
    .4byte Img_EkrLvupNumBig + 0xa72
    .4byte Img_EkrLvupNumBig + 0xac6
    .4byte Img_EkrLvupNumBig + 0xb1a
    .4byte 0x80000000

	.global gUnknown_085C92A0
gUnknown_085C92A0:  @ 0x085C92A0
@ Replacing .incbin "baserom.gba", 0x5C92A0, 0x30
    .4byte Img_EkrLvupNumBig + 0xb6d
    .4byte Img_EkrLvupNumBig + 0xb91
    .4byte Img_EkrLvupNumBig + 0xbc1
    .4byte Img_EkrLvupNumBig + 0xbf2
    .4byte Img_EkrLvupNumBig + 0xc22
    .4byte Img_EkrLvupNumBig + 0xc53
    .4byte Img_EkrLvupNumBig + 0xc22
    .4byte Img_EkrLvupNumBig + 0xc82
    .4byte Img_EkrLvupNumBig + 0xcb1
    .4byte 0x60000000 + Img_EkrLvupNumBig + 0xce0
    .4byte 0x20000000 + Img_EkrLvupNumBig + 0xd10
    .4byte 0x80000000

	.global gUnknown_085C92D0
gUnknown_085C92D0:  @ 0x085C92D0
	.incbin "baserom.gba", 0x5C92D0, 0x1C

	.global gUnknown_085C92EC
gUnknown_085C92EC:  @ 0x085C92EC
@ Replacing .incbin "baserom.gba", 0x5C92EC, 0x3C
    .4byte Img_EkrLvupNumBig + 0xe91
    .4byte 0x10000000 + Img_EkrLvupNumBig + 0xd88
    .4byte 0x80000000
    .4byte Img_EkrLvupNumBig + 0xda1
    .4byte Img_EkrLvupNumBig + 0xdb9
    .4byte Img_EkrLvupNumBig + 0xdd1
    .4byte Img_EkrLvupNumBig + 0xdea
    .4byte Img_EkrLvupNumBig + 0xe02
    .4byte Img_EkrLvupNumBig + 0xe1b
    .4byte Img_EkrLvupNumBig + 0xe02
    .4byte Img_EkrLvupNumBig + 0xe32
    .4byte Img_EkrLvupNumBig + 0xe49
    .4byte 0x60000000 + Img_EkrLvupNumBig + 0xe60
    .4byte 0x20000000 + Img_EkrLvupNumBig + 0xe78
    .4byte 0x80000000

	.global gUnknown_085C9328
gUnknown_085C9328:  @ 0x085C9328
@ Replacing .incbin "baserom.gba", 0x5C9328, 0x6848
    .4byte 0x10000000 + Img_EkrLvupNumBig + 0xe9c
    .4byte Img_EkrLvupNumBig + 0xec2
    .4byte Img_EkrLvupNumBig + 0xee5
    .4byte Img_EkrLvupNumBig + 0xf09
    .4byte Img_EkrLvupNumBig + 0xf2d
    .4byte Img_EkrLvupNumBig + 0xf51
    .4byte Img_EkrLvupNumBig + 0xf69
    .4byte Img_EkrLvupNumBig + 0xf8d
    .4byte Img_EkrLvupNumBig + 0xfb1
    .4byte Img_EkrLvupNumBig + 0xfd5
    .4byte Img_EkrLvupNumBig + 0xe91
    .4byte 0x10000000 + Img_EkrLvupNumBig + 0xd88
    .4byte 0x80000000

	.global Img_EfxSkill1
Img_EfxSkill1:  @ 0x085C935C
    .incbin "baserom.gba", 0x5C935C, 0x5C9740 - 0x5C935C

	.global Img_EfxSkill2
Img_EfxSkill2:
    .incbin "baserom.gba", 0x5C9740, 0x5C9B38 - 0x5C9740

	.global Img_EfxSkill3
Img_EfxSkill3:
    .incbin "baserom.gba", 0x5C9B38, 0x5C9F48 - 0x5C9B38

	.global Img_EfxSkill4
Img_EfxSkill4:
    .incbin "baserom.gba", 0x5C9F48, 0x5CA380 - 0x5C9F48

	.global Img_EfxSkill5
Img_EfxSkill5:
    .incbin "baserom.gba", 0x5CA380, 0x5CA7FC - 0x5CA380

	.global Img_EfxSkill6
Img_EfxSkill6:
    .incbin "baserom.gba", 0x5CA7FC, 0x5CACF4 - 0x5CA7FC

	.global Img_EfxSkill7
Img_EfxSkill7:
    .incbin "baserom.gba", 0x5CACF4, 0x5CB2CC - 0x5CACF4

	.global Img_EfxSkill8
Img_EfxSkill8:
    .incbin "baserom.gba", 0x5CB2CC, 0x5CB9AC - 0x5CB2CC

	.global Img_EfxSkill9
Img_EfxSkill9:
    .incbin "baserom.gba", 0x5CB9AC, 0x5CC0E8 - 0x5CB9AC

	.global Img_EfxSkillA
Img_EfxSkillA:
    .incbin "baserom.gba", 0x5CC0E8, 0x5CC820 - 0x5CC0E8

	.global Img_EfxSkillB
Img_EfxSkillB:
    .incbin "baserom.gba", 0x5CC820, 0x5CCF14 - 0x5CC820

	.global Img_EfxSkillC
Img_EfxSkillC:
    .incbin "baserom.gba", 0x5CCF14, 0x5CD5A0 - 0x5CCF14

	.global Img_EfxSkillD
Img_EfxSkillD:
    .incbin "baserom.gba", 0x5CD5A0, 0x5CDC00 - 0x5CD5A0

	.global Img_EfxSkillE
Img_EfxSkillE:
    .incbin "baserom.gba", 0x5CDC00, 0x5CE200 - 0x5CDC00

	.global Img_EfxSkillF
Img_EfxSkillF:
    .incbin "baserom.gba", 0x5CE200, 0x5CE7C4 - 0x5CE200

	.global Img_EfxSkill10
Img_EfxSkill10:
    .incbin "baserom.gba", 0x5CE7C4, 0x5CEC6C - 0x5CE7C4

	.global Pal_EfxSkill1
Pal_EfxSkill1:
    .incbin "baserom.gba", 0x5CEC6C, 0x5CEC8C - 0x5CEC6C

	.global Pal_EfxSkill2
Pal_EfxSkill2:
    .incbin "baserom.gba", 0x5CEC8C, 0x5CECAC - 0x5CEC8C

	.global Pal_EfxSkill3
Pal_EfxSkill3:
    .incbin "baserom.gba", 0x5CECAC, 0x5CECCC - 0x5CECAC

	.global Pal_EfxSkill4
Pal_EfxSkill4:
    .incbin "baserom.gba", 0x5CECCC, 0x5CECEC - 0x5CECCC

	.global Pal_EfxSkill5
Pal_EfxSkill5:
    .incbin "baserom.gba", 0x5CECEC, 0x5CED0C - 0x5CECEC

	.global Pal_EfxSkill6
Pal_EfxSkill6:
    .incbin "baserom.gba", 0x5CED0C, 0x5CED2C - 0x5CED0C

	.global Pal_EfxSkill7
Pal_EfxSkill7:
    .incbin "baserom.gba", 0x5CED2C, 0x5CED4C - 0x5CED2C

	.global Pal_EfxSkill8
Pal_EfxSkill8:
    .incbin "baserom.gba", 0x5CED4C, 0x5CED6C - 0x5CED4C

	.global Pal_EfxSkill9
Pal_EfxSkill9:
    .incbin "baserom.gba", 0x5CED6C, 0x5CED8C - 0x5CED6C

	.global Pal_EfxSkillA
Pal_EfxSkillA:
    .incbin "baserom.gba", 0x5CED8C, 0x5CEDAC - 0x5CED8C

	.global Pal_EfxSkillB
Pal_EfxSkillB:
    .incbin "baserom.gba", 0x5CEDAC, 0x5CEDCC - 0x5CEDAC

	.global Pal_EfxSkillC
Pal_EfxSkillC:
    .incbin "baserom.gba", 0x5CEDCC, 0x5CEDEC - 0x5CEDCC

	.global Pal_EfxSkillD
Pal_EfxSkillD:
    .incbin "baserom.gba", 0x5CEDEC, 0x5CEE0C - 0x5CEDEC

	.global Pal_EfxSkillE
Pal_EfxSkillE:
    .incbin "baserom.gba", 0x5CEE0C, 0x5CEE2C - 0x5CEE0C

	.global Pal_EfxSkillF
Pal_EfxSkillF:
    .incbin "baserom.gba", 0x5CEE2C, 0x5CEE4C - 0x5CEE2C

	.global Pal_EfxSkill10
Pal_EfxSkill10:
    .incbin "baserom.gba", 0x5CEE4C, 0x5CEE6C - 0x5CEE4C

	.global Tsa_EfxSkill1
Tsa_EfxSkill1:
    .incbin "baserom.gba", 0x5CEE6C, 0x5CEF04 - 0x5CEE6C

	.global Tsa_EfxSkill2
Tsa_EfxSkill2:
    .incbin "baserom.gba", 0x5CEF04, 0x5CEFA4 - 0x5CEF04

	.global Tsa_EfxSkill3
Tsa_EfxSkill3:
    .incbin "baserom.gba", 0x5CEFA4, 0x5CF044 - 0x5CEFA4

	.global Tsa_EfxSkill4
Tsa_EfxSkill4:
    .incbin "baserom.gba", 0x5CF044, 0x5CF0E8 - 0x5CF044

	.global Tsa_EfxSkill5
Tsa_EfxSkill5:
    .incbin "baserom.gba", 0x5CF0E8, 0x5CF1A0 - 0x5CF0E8

	.global Tsa_EfxSkill6
Tsa_EfxSkill6:
    .incbin "baserom.gba", 0x5CF1A0, 0x5CF264 - 0x5CF1A0

	.global Tsa_EfxSkill7
Tsa_EfxSkill7:
    .incbin "baserom.gba", 0x5CF264, 0x5CF33C - 0x5CF264

	.global Tsa_EfxSkill8
Tsa_EfxSkill8:
    .incbin "baserom.gba", 0x5CF33C, 0x5CF440 - 0x5CF33C

	.global Tsa_EfxSkill9
Tsa_EfxSkill9:
    .incbin "baserom.gba", 0x5CF440, 0x5CF544 - 0x5CF440

	.global Tsa_EfxSkillA
Tsa_EfxSkillA:
    .incbin "baserom.gba", 0x5CF544, 0x5CF648 - 0x5CF544

	.global Tsa_EfxSkillB
Tsa_EfxSkillB:
    .incbin "baserom.gba", 0x5CF648, 0x5CF750 - 0x5CF648

	.global Tsa_EfxSkillC
Tsa_EfxSkillC:
    .incbin "baserom.gba", 0x5CF750, 0x5CF83C - 0x5CF750

	.global Tsa_EfxSkillD
Tsa_EfxSkillD:
    .incbin "baserom.gba", 0x5CF83C, 0x5CF91C - 0x5CF83C

	.global Tsa_EfxSkillE
Tsa_EfxSkillE:
    .incbin "baserom.gba", 0x5CF91C, 0x5CF9F4 - 0x5CF91C

	.global Tsa_EfxSkillF
Tsa_EfxSkillF:
    .incbin "baserom.gba", 0x5CF9F4, 0x5CFAC0 - 0x5CF9F4

	.global Tsa_EfxSkill10
Tsa_EfxSkill10:
    .incbin "baserom.gba", 0x5CFAC0, 0x5CFB70 - 0x5CFAC0

	.global Img_EfxPierceCriticalEffectBG
Img_EfxPierceCriticalEffectBG:  @ 0x085CFB70
	.incbin "baserom.gba", 0x5CFB70, 0xCB0

	.global Pal_EfxPierceCriticalEffectBG
Pal_EfxPierceCriticalEffectBG:  @ 0x085D0820
	.incbin "baserom.gba", 0x5D0820, 0x200

	.global TsaL_EfxPierceCriticalEffectBG
TsaL_EfxPierceCriticalEffectBG:  @ 0x085D0A20
	.incbin "baserom.gba", 0x5D0A20, 0x2C0

	.global TsaR_EfxPierceCriticalEffectBG
TsaR_EfxPierceCriticalEffectBG:  @ 0x085D0CE0
	.incbin "baserom.gba", 0x5D0CE0, 0x2F0

	.global Img_EfxPierceNormalEffectBG
Img_EfxPierceNormalEffectBG:  @ 0x085D0FD0
	.incbin "baserom.gba", 0x5D0FD0, 0x4A0

	.global Pal_EfxPierceNormalEffectBG
Pal_EfxPierceNormalEffectBG:  @ 0x085D1470
    .incbin "baserom.gba", 0x5D1470, 0x20

	.global Tsa1_EfxPierceNormalEffectBG
Tsa1_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1490, 0x5D155C - 0x5D1490

	.global Tsa2_EfxPierceNormalEffectBG
Tsa2_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D155C, 0x5D1668 - 0x5D155C

	.global Tsa3_EfxPierceNormalEffectBG
Tsa3_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1668, 0x5D1790 - 0x5D1668

	.global Tsa4_EfxPierceNormalEffectBG
Tsa4_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1790, 0x5D18B4 - 0x5D1790

	.global Tsa5_EfxPierceNormalEffectBG
Tsa5_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D18B4, 0x5D19DC - 0x5D18B4

	.global Tsa6_EfxPierceNormalEffectBG
Tsa6_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D19DC, 0x5D1AFC - 0x5D19DC

	.global Tsa7_EfxPierceNormalEffectBG
Tsa7_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1AFC, 0x5D1BFC - 0x5D1AFC

	.global Tsa8_EfxPierceNormalEffectBG
Tsa8_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1BFC, 0x5D1CDC - 0x5D1BFC

	.global Tsa9_EfxPierceNormalEffectBG
Tsa9_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1CDC, 0x5D1DA0 - 0x5D1CDC

	.global TsaA_EfxPierceNormalEffectBG
TsaA_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1DA0, 0x5D1E38 - 0x5D1DA0

    .global AnimSprite1_EkrBaseKaiten
AnimSprite1_EkrBaseKaiten:
    .4byte 0x40000000
    .4byte 0xfff00000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffe60009
    .4byte 0x00000001
    .4byte 0x00004000
    .4byte 0x00060002
    .4byte 0x00000001
    .4byte 0x00004000
    .4byte 0xffe60022
    .4byte 0x0000fff9
    .4byte 0x80004000
    .4byte 0xfff60004
    .4byte 0x0000fff1
    .4byte 0x00008000
    .4byte 0x00160008
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0x00010010
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xfff10010
    .4byte 0x00000000
    .4byte 0x60000000
    .4byte 0x00110012
    .4byte 0x0000ffe0
    .4byte 0x70000000
    .4byte 0xfff10012
    .4byte 0x0000fff0
    .4byte 0x70000000
    .4byte 0x00010012
    .4byte 0x0000ffe0
    .4byte 0x40000000
    .4byte 0xfff10012
    .4byte 0x00000010
    .4byte 0x50000000
    .4byte 0xffe10012
    .4byte 0x00000010
    .4byte 0x70000000
    .4byte 0xffe10012
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xfff80014
    .4byte 0x0000ffdb
    .4byte 0x80004000
    .4byte 0xfff80018
    .4byte 0x0000ffeb
    .4byte 0x80004000
    .4byte 0xffe9001c
    .4byte 0x0000000b
    .4byte 0x00004000
    .4byte 0xffe90040
    .4byte 0x0000001b
    .4byte 0x00000000
    .4byte 0xfff90042
    .4byte 0x0000001b
    .4byte 0x80004000
    .4byte 0xfff0001c
    .4byte 0x0000fffb
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff50000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0xfff50000
    .4byte 0x0000ffe8
    .4byte 0x40000000
    .4byte 0xfff50000
    .4byte 0x0000ffd8
    .4byte 0x40000000
    .4byte 0xfff50000
    .4byte 0x00000008
    .4byte 0x00004000
    .4byte 0xfff5000d
    .4byte 0x0000ffd0
    .4byte 0x00008000
    .4byte 0x0005000f
    .4byte 0x0000ffd8
    .4byte 0x00008000
    .4byte 0x0005000f
    .4byte 0x0000ffe8
    .4byte 0x00008000
    .4byte 0x0005000f
    .4byte 0x0000fff8
    .4byte 0x00008000
    .4byte 0x0005000f
    .4byte 0x00000008
    .4byte 0x00008000
    .4byte 0x0005000f
    .4byte 0x00000018
    .4byte 0x40000000
    .4byte 0xfff50000
    .4byte 0x00000018
    .4byte 0x20004000
    .4byte 0xfff5000d
    .4byte 0x00000028
    .4byte 0x20000000
    .4byte 0x0005002d
    .4byte 0x00000028
    .4byte 0x00000000
    .4byte 0x0005002d
    .4byte 0x0000ffd0
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffdf008a
    .4byte 0x0000ffd0
    .4byte 0x80004000
    .4byte 0xffe7008e
    .4byte 0x0000ffe0
    .4byte 0x80004000
    .4byte 0xffee008e
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xfff5008e
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xfffc008e
    .4byte 0x00000010
    .4byte 0x80004000
    .4byte 0x00030092
    .4byte 0x00000020
    .4byte 0x40000000
    .4byte 0x000b0096
    .4byte 0x00000030
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffd00045
    .4byte 0x0000ffe0
    .4byte 0x80004000
    .4byte 0xffe00045
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xfff00045
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0x00000045
    .4byte 0x00000010
    .4byte 0x00004000
    .4byte 0xffc90060
    .4byte 0x0000ffd8
    .4byte 0x00000000
    .4byte 0xffd90062
    .4byte 0x0000ffd8
    .4byte 0x40000000
    .4byte 0xfff00043
    .4byte 0x0000ffe0
    .4byte 0x00004000
    .4byte 0xffe10049
    .4byte 0x0000ffd8
    .4byte 0x40000000
    .4byte 0x00000043
    .4byte 0x0000fff0
    .4byte 0x40000000
    .4byte 0x00100043
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x0020004b
    .4byte 0x00000010
    .4byte 0x40000000
    .4byte 0x0020004d
    .4byte 0x00000028
    .4byte 0x40000000
    .4byte 0x00100045
    .4byte 0x00000020
    .4byte 0x00004000
    .4byte 0x00200069
    .4byte 0x00000020
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffc8004f
    .4byte 0x0000ffef
    .4byte 0x80004000
    .4byte 0xffe80053
    .4byte 0x0000ffef
    .4byte 0x40000000
    .4byte 0x00080057
    .4byte 0x0000ffef
    .4byte 0x80004000
    .4byte 0x0000004f
    .4byte 0x0000ffff
    .4byte 0x40004000
    .4byte 0xffc20085
    .4byte 0x0000ffe7
    .4byte 0x00000000
    .4byte 0xffe20089
    .4byte 0x0000ffe7
    .4byte 0x40000000
    .4byte 0xffb80083
    .4byte 0x0000ffef
    .4byte 0x80004000
    .4byte 0xffd8005a
    .4byte 0x0000ffff
    .4byte 0x00008000
    .4byte 0xfff8005e
    .4byte 0x0000ffff
    .4byte 0x80004000
    .4byte 0x0010005a
    .4byte 0x0000000f
    .4byte 0x00008000
    .4byte 0x0030005e
    .4byte 0x0000000f
    .4byte 0x40000000
    .4byte 0x00380081
    .4byte 0x0000000f
    .4byte 0x40000000
    .4byte 0x00200053
    .4byte 0x0000ffff
    .4byte 0x00008000
    .4byte 0x00300055
    .4byte 0x0000ffff
    .4byte 0x00008000
    .4byte 0x00380080
    .4byte 0x0000ffff
    .4byte 0x00000000
    .4byte 0x00080059
    .4byte 0x0000000f
    .4byte 0x00000000
    .4byte 0xffd00059
    .4byte 0x0000ffff
    .4byte 0x00000000
    .4byte 0x00180079
    .4byte 0x0000fff7
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000005f
    .4byte 0x00000003
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

	.global AnimScr_EkrBaseKaiten1
AnimScr_EkrBaseKaiten1:
    ANIMSCR_FORCE_SPRITE AnimSprite1_EkrBaseKaiten, 1
    .4byte Pal_EfxPierceNormalEffectBG + 0x9ed
    .4byte Pal_EfxPierceNormalEffectBG + 0xa35
    .4byte Pal_EfxPierceNormalEffectBG + 0xaa1
    .4byte Pal_EfxPierceNormalEffectBG + 0xaf5
    .4byte Pal_EfxPierceNormalEffectBG + 0xba9
    .4byte Pal_EfxPierceNormalEffectBG + 0xc09
    .4byte Pal_EfxPierceNormalEffectBG + 0xcbd
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten2
AnimScr_EkrBaseKaiten2:
    .4byte Pal_EfxPierceNormalEffectBG + 0xcbd
    .4byte Pal_EfxPierceNormalEffectBG + 0xc09
    .4byte Pal_EfxPierceNormalEffectBG + 0xba9
    .4byte Pal_EfxPierceNormalEffectBG + 0xaf5
    .4byte Pal_EfxPierceNormalEffectBG + 0xaa1
    .4byte Pal_EfxPierceNormalEffectBG + 0xa35
    .4byte Pal_EfxPierceNormalEffectBG + 0x9ed
    .4byte Pal_EfxPierceNormalEffectBG + 0x9c9
    .4byte 0x80000000
    .4byte 0x40000000
    .4byte 0xfff00000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff7
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff7
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xffe80022
    .4byte 0x00000007
    .4byte 0x00004000
    .4byte 0xfff80022
    .4byte 0x00000007
    .4byte 0x00004000
    .4byte 0x00080022
    .4byte 0x00000007
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff7
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff7
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff7
    .4byte 0x40000000
    .4byte 0xffd80004
    .4byte 0x0000fff7
    .4byte 0x50000000
    .4byte 0x00180004
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xffd80006
    .4byte 0x00000007
    .4byte 0x00004000
    .4byte 0xffe80026
    .4byte 0x00000007
    .4byte 0x00004000
    .4byte 0xfff80026
    .4byte 0x00000007
    .4byte 0x00004000
    .4byte 0x00080026
    .4byte 0x00000007
    .4byte 0x10004000
    .4byte 0x00180006
    .4byte 0x00000007
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff00000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffe00000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0x00100000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffd00008
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0x00200008
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0xffd00006
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0x00200006
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffe00026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xfff00026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x00000026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x00100026
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0x00180000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffd80000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffc8000a
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0x0028000a
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0xffc8002c
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0x0028002c
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffd80026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffe80026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xfff80026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x00080026
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x00180026
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0x00180000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffd80000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffc8000f
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0x0028000f
    .4byte 0x0000fff6
    .4byte 0x10000000
    .4byte 0x0038002e
    .4byte 0x0000fffe
    .4byte 0x00000000
    .4byte 0xffc0002e
    .4byte 0x0000fffe
    .4byte 0x00004000
    .4byte 0xffc0000c
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffd0000d
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffe0000d
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xfff0000d
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x0000000d
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x0010000d
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x0020000d
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0x0030000c
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff00000
    .4byte 0x0000fff5
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x0000fff5
    .4byte 0x40000000
    .4byte 0x00100000
    .4byte 0x0000fff5
    .4byte 0x40000000
    .4byte 0x00200000
    .4byte 0x0000fff5
    .4byte 0x40000000
    .4byte 0xffe00000
    .4byte 0x0000fff5
    .4byte 0x40000000
    .4byte 0xffd00000
    .4byte 0x0000fff5
    .4byte 0x40000000
    .4byte 0xffb80011
    .4byte 0x0000fff5
    .4byte 0x00008000
    .4byte 0xffc80013
    .4byte 0x0000fff5
    .4byte 0x50000000
    .4byte 0x00380011
    .4byte 0x0000fff5
    .4byte 0x10008000
    .4byte 0x00300013
    .4byte 0x0000fff5
    .4byte 0x00004000
    .4byte 0xffb80014
    .4byte 0x00000005
    .4byte 0x10004000
    .4byte 0x00380014
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0xffc80015
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0xffd80015
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0xffe80015
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0xfff80015
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0x00080015
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0x00180015
    .4byte 0x00000005
    .4byte 0x00004000
    .4byte 0x00280015
    .4byte 0x00000005
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000011
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff0
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0xfff80034
    .4byte 0x0000fffc
    .4byte 0x40000000
    .4byte 0xfff80017
    .4byte 0x00000004
    .4byte 0x70000000
    .4byte 0xfff90017
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff10040
    .4byte 0x0000fff0
    .4byte 0x00008000
    .4byte 0x00010042
    .4byte 0x0000fff0
    .4byte 0x30004000
    .4byte 0xfff90043
    .4byte 0x0000ffe8
    .4byte 0x30000000
    .4byte 0xfff10045
    .4byte 0x0000ffe8
    .4byte 0x40000000
    .4byte 0xfff60040
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00060042
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0xfff60043
    .4byte 0x00000010
    .4byte 0x00000000
    .4byte 0x00060045
    .4byte 0x00000010
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff20049
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x0002004b
    .4byte 0x0000fff4
    .4byte 0x40000000
    .4byte 0xffea0046
    .4byte 0x0000ffe4
    .4byte 0x00008000
    .4byte 0xfffa0048
    .4byte 0x0000ffe4
    .4byte 0x70000000
    .4byte 0x00060046
    .4byte 0x0000000c
    .4byte 0x30008000
    .4byte 0xfffe0048
    .4byte 0x0000000c
    .4byte 0x70000000
    .4byte 0xfffe0049
    .4byte 0x0000fffc
    .4byte 0x30008000
    .4byte 0xfff6004b
    .4byte 0x0000fffc
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff0004d
    .4byte 0x0000fff0
    .4byte 0x40000000
    .4byte 0x0000004d
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xfff8006d
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000004e
    .4byte 0x0000fff8
    .4byte 0x00000000
    .4byte 0xfff0006f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xfff8006f
    .4byte 0x00000008
    .4byte 0x00004000
    .4byte 0xffe0004f
    .4byte 0x0000ffe8
    .4byte 0x00000000
    .4byte 0xffe8006d
    .4byte 0x0000fff0
    .4byte 0x00000000
    .4byte 0xffe8006f
    .4byte 0x0000fff8
    .4byte 0x00000000
    .4byte 0xffe0006f
    .4byte 0x0000fff0
    .4byte 0x00008000
    .4byte 0x0010004c
    .4byte 0x00000010
    .4byte 0x00000000
    .4byte 0x0010004e
    .4byte 0x00000008
    .4byte 0x00000000
    .4byte 0xfff0004e
    .4byte 0x0000ffe8
    .4byte 0x00000000
    .4byte 0x0008006d
    .4byte 0x00000010
    .4byte 0x00000000
    .4byte 0x0008006f
    .4byte 0x00000018
    .4byte 0x00000000
    .4byte 0x0000006f
    .4byte 0x00000010
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffc80087
    .4byte 0x0000ffe8
    .4byte 0x00008000
    .4byte 0xffe8008b
    .4byte 0x0000ffe8
    .4byte 0x00004000
    .4byte 0xffd0008c
    .4byte 0x0000fff8
    .4byte 0x00000000
    .4byte 0xffe0008e
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0xffe8008f
    .4byte 0x0000fff8
    .4byte 0x00004000
    .4byte 0xfff000a2
    .4byte 0x0000fff0
    .4byte 0x00008000
    .4byte 0xfff80091
    .4byte 0x0000fff8
    .4byte 0x00008000
    .4byte 0x0000008b
    .4byte 0x0000fff1
    .4byte 0x40000000
    .4byte 0x0000008f
    .4byte 0x00000001
    .4byte 0x00004000
    .4byte 0x000800a2
    .4byte 0x0000fff9
    .4byte 0x00008000
    .4byte 0x00100091
    .4byte 0x00000001
    .4byte 0x40000000
    .4byte 0x00180090
    .4byte 0x00000007
    .4byte 0x00008000
    .4byte 0x00280092
    .4byte 0x00000007
    .4byte 0x00000000
    .4byte 0x00280093
    .4byte 0x00000017
    .4byte 0x00004000
    .4byte 0x001800a2
    .4byte 0x0000ffff
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffc40094
    .4byte 0x0000ffea
    .4byte 0x40000000
    .4byte 0xffe40098
    .4byte 0x0000ffea
    .4byte 0x80004000
    .4byte 0xffe4009a
    .4byte 0x0000fffa
    .4byte 0x40000000
    .4byte 0x002c005e
    .4byte 0x00000002
    .4byte 0x00004000
    .4byte 0x002c009e
    .4byte 0x00000012
    .4byte 0x00004000
    .4byte 0xfff400be
    .4byte 0x0000fff2
    .4byte 0x00004000
    .4byte 0xffcc00ac
    .4byte 0x0000fffa
    .4byte 0x00000000
    .4byte 0xffdc00ae
    .4byte 0x0000fffa
    .4byte 0x40000000
    .4byte 0x00040098
    .4byte 0x0000fff3
    .4byte 0x80004000
    .4byte 0x0004009a
    .4byte 0x00000003
    .4byte 0x00004000
    .4byte 0x001400be
    .4byte 0x0000fffb
    .4byte 0x00008000
    .4byte 0x0024009d
    .4byte 0x00000005
    .4byte 0x00000000
    .4byte 0x002400bf
    .4byte 0x0000fffd
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffbc0055
    .4byte 0x0000ffee
    .4byte 0x00008000
    .4byte 0xffdc0059
    .4byte 0x0000ffee
    .4byte 0x80004000
    .4byte 0x0024005a
    .4byte 0x00000005
    .4byte 0x40004000
    .4byte 0xffe40051
    .4byte 0x0000ffee
    .4byte 0x40004000
    .4byte 0xffe40071
    .4byte 0x00000006
    .4byte 0x40000000
    .4byte 0xffe40000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xfff40000
    .4byte 0x0000fff6
    .4byte 0x40004000
    .4byte 0xffbc0080
    .4byte 0x0000fffe
    .4byte 0x00000000
    .4byte 0xffdc0084
    .4byte 0x0000fffe
    .4byte 0x70004000
    .4byte 0x00040051
    .4byte 0x0000000a
    .4byte 0x70004000
    .4byte 0x00040071
    .4byte 0x0000fff2
    .4byte 0x70000000
    .4byte 0x00140000
    .4byte 0x0000fffa
    .4byte 0x70000000
    .4byte 0x00040000
    .4byte 0x0000fffa
    .4byte 0x40000000
    .4byte 0x00240085
    .4byte 0x0000fff5
    .4byte 0x00000000
    .4byte 0x003400a1
    .4byte 0x0000fffd
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xfff90034
    .4byte 0x0000fffc
    .4byte 0x50000000
    .4byte 0xfff90017
    .4byte 0x00000004
    .4byte 0x60000000
    .4byte 0xfff80017
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xffff0040
    .4byte 0x0000fff0
    .4byte 0x10008000
    .4byte 0xfff70042
    .4byte 0x0000fff0
    .4byte 0x20004000
    .4byte 0xfff70043
    .4byte 0x0000ffe8
    .4byte 0x20000000
    .4byte 0x00070045
    .4byte 0x0000ffe8
    .4byte 0x50000000
    .4byte 0xfffa0040
    .4byte 0x00000000
    .4byte 0x10008000
    .4byte 0xfff20042
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xfffa0043
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xfff20045
    .4byte 0x00000010
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xffff0049
    .4byte 0x0000fff4
    .4byte 0x10008000
    .4byte 0xfff7004b
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0x00070046
    .4byte 0x0000ffe4
    .4byte 0x10008000
    .4byte 0xffff0048
    .4byte 0x0000ffe4
    .4byte 0x60000000
    .4byte 0xffeb0046
    .4byte 0x0000000c
    .4byte 0x20008000
    .4byte 0xfffb0048
    .4byte 0x0000000c
    .4byte 0x60000000
    .4byte 0xfff30049
    .4byte 0x0000fffc
    .4byte 0x20008000
    .4byte 0x0003004b
    .4byte 0x0000fffc
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xffff004d
    .4byte 0x0000fff0
    .4byte 0x50000000
    .4byte 0xffef004d
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffff006d
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xfff7004e
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0x0007006f
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffff006f
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0x000f004f
    .4byte 0x0000ffe8
    .4byte 0x10000000
    .4byte 0x000f006d
    .4byte 0x0000fff0
    .4byte 0x10000000
    .4byte 0x000f006f
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0x0017006f
    .4byte 0x0000fff0
    .4byte 0x10008000
    .4byte 0xffe7004c
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xffe7004e
    .4byte 0x00000008
    .4byte 0x10000000
    .4byte 0x0007004e
    .4byte 0x0000ffe8
    .4byte 0x10000000
    .4byte 0xffef006d
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xffef006f
    .4byte 0x00000018
    .4byte 0x10000000
    .4byte 0xfff7006f
    .4byte 0x00000010
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0x00160087
    .4byte 0x0000ffe8
    .4byte 0x10008000
    .4byte 0x000e008b
    .4byte 0x0000ffe8
    .4byte 0x10004000
    .4byte 0x001e008c
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0x0016008e
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0x0006008f
    .4byte 0x0000fff8
    .4byte 0x10004000
    .4byte 0xfffe00a2
    .4byte 0x0000fff0
    .4byte 0x10008000
    .4byte 0xfffe0091
    .4byte 0x0000fff8
    .4byte 0x10008000
    .4byte 0xfff6008b
    .4byte 0x0000fff1
    .4byte 0x50000000
    .4byte 0xffee008f
    .4byte 0x00000001
    .4byte 0x10004000
    .4byte 0xffe600a2
    .4byte 0x0000fff9
    .4byte 0x10008000
    .4byte 0xffe60091
    .4byte 0x00000001
    .4byte 0x50000000
    .4byte 0xffd60090
    .4byte 0x00000007
    .4byte 0x10008000
    .4byte 0xffce0092
    .4byte 0x00000007
    .4byte 0x10000000
    .4byte 0xffce0093
    .4byte 0x00000017
    .4byte 0x10004000
    .4byte 0xffd600a2
    .4byte 0x0000ffff
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0x001d0094
    .4byte 0x0000ffea
    .4byte 0x50000000
    .4byte 0x000d0098
    .4byte 0x0000ffea
    .4byte 0x90004000
    .4byte 0xfffd009a
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0xffc5005e
    .4byte 0x00000002
    .4byte 0x10004000
    .4byte 0xffc5009e
    .4byte 0x00000012
    .4byte 0x10004000
    .4byte 0xfffd00be
    .4byte 0x0000fff2
    .4byte 0x10004000
    .4byte 0x002500ac
    .4byte 0x0000fffa
    .4byte 0x10000000
    .4byte 0x001d00ae
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0xffed0098
    .4byte 0x0000fff3
    .4byte 0x90004000
    .4byte 0xffdd009a
    .4byte 0x00000003
    .4byte 0x10004000
    .4byte 0xffdd00be
    .4byte 0x0000fffb
    .4byte 0x10008000
    .4byte 0xffd5009d
    .4byte 0x00000005
    .4byte 0x10000000
    .4byte 0xffd500bf
    .4byte 0x0000fffd
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0x00240055
    .4byte 0x0000ffee
    .4byte 0x10008000
    .4byte 0x001c0059
    .4byte 0x0000ffee
    .4byte 0x90004000
    .4byte 0xffbc005a
    .4byte 0x00000005
    .4byte 0x50004000
    .4byte 0xfffc0051
    .4byte 0x0000ffee
    .4byte 0x50004000
    .4byte 0xfffc0071
    .4byte 0x00000006
    .4byte 0x50000000
    .4byte 0x000c0000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0xfffc0000
    .4byte 0x0000fff6
    .4byte 0x50004000
    .4byte 0x00240080
    .4byte 0x0000fffe
    .4byte 0x10000000
    .4byte 0x001c0084
    .4byte 0x0000fffe
    .4byte 0x60004000
    .4byte 0xffdc0051
    .4byte 0x0000000a
    .4byte 0x60004000
    .4byte 0xffdc0071
    .4byte 0x0000fff2
    .4byte 0x60000000
    .4byte 0xffdc0000
    .4byte 0x0000fffa
    .4byte 0x60000000
    .4byte 0xffec0000
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0xffcc0085
    .4byte 0x0000fff5
    .4byte 0x10000000
    .4byte 0xffc400a1
    .4byte 0x0000fffd
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

	.global AnimScr_EkrBaseKaiten3
AnimScr_EkrBaseKaiten3:
    .4byte Pal_EfxPierceNormalEffectBG + 0xe01
    .4byte Pal_EfxPierceNormalEffectBG + 0xe25
    .4byte Pal_EfxPierceNormalEffectBG + 0xe79
    .4byte Pal_EfxPierceNormalEffectBG + 0xefd
    .4byte Pal_EfxPierceNormalEffectBG + 0xf99
    .4byte Pal_EfxPierceNormalEffectBG + 0x104d
    .4byte Pal_EfxPierceNormalEffectBG + 0x1125
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten4
AnimScr_EkrBaseKaiten4:
    .4byte Pal_EfxPierceNormalEffectBG + 0x122d
    .4byte Pal_EfxPierceNormalEffectBG + 0x1251
    .4byte Pal_EfxPierceNormalEffectBG + 0x1281
    .4byte Pal_EfxPierceNormalEffectBG + 0x12ed
    .4byte Pal_EfxPierceNormalEffectBG + 0x1359
    .4byte Pal_EfxPierceNormalEffectBG + 0x1425
    .4byte Pal_EfxPierceNormalEffectBG + 0x14e5
    .4byte Pal_EfxPierceNormalEffectBG + 0x158d
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten5
AnimScr_EkrBaseKaiten5:
    .4byte Pal_EfxPierceNormalEffectBG + 0x122d
    .4byte Pal_EfxPierceNormalEffectBG + 0x164d
    .4byte Pal_EfxPierceNormalEffectBG + 0x167d
    .4byte Pal_EfxPierceNormalEffectBG + 0x16e9
    .4byte Pal_EfxPierceNormalEffectBG + 0x1755
    .4byte Pal_EfxPierceNormalEffectBG + 0x1821
    .4byte Pal_EfxPierceNormalEffectBG + 0x18e1
    .4byte Pal_EfxPierceNormalEffectBG + 0x1989
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten6
AnimScr_EkrBaseKaiten6:
    .4byte Pal_EfxPierceNormalEffectBG + 0x1125
    .4byte Pal_EfxPierceNormalEffectBG + 0x104d
    .4byte Pal_EfxPierceNormalEffectBG + 0xf99
    .4byte Pal_EfxPierceNormalEffectBG + 0xefd
    .4byte Pal_EfxPierceNormalEffectBG + 0xe79
    .4byte Pal_EfxPierceNormalEffectBG + 0xe25
    .4byte Pal_EfxPierceNormalEffectBG + 0xe01
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten7
AnimScr_EkrBaseKaiten7:
    .4byte Pal_EfxPierceNormalEffectBG + 0x158d
    .4byte Pal_EfxPierceNormalEffectBG + 0x14e5
    .4byte Pal_EfxPierceNormalEffectBG + 0x1425
    .4byte Pal_EfxPierceNormalEffectBG + 0x1359
    .4byte Pal_EfxPierceNormalEffectBG + 0x12ed
    .4byte Pal_EfxPierceNormalEffectBG + 0x1281
    .4byte Pal_EfxPierceNormalEffectBG + 0x1251
    .4byte Pal_EfxPierceNormalEffectBG + 0x122d
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten8
AnimScr_EkrBaseKaiten8:
    .4byte Pal_EfxPierceNormalEffectBG + 0x1989
    .4byte Pal_EfxPierceNormalEffectBG + 0x18e1
    .4byte Pal_EfxPierceNormalEffectBG + 0x1821
    .4byte Pal_EfxPierceNormalEffectBG + 0x1755
    .4byte Pal_EfxPierceNormalEffectBG + 0x16e9
    .4byte Pal_EfxPierceNormalEffectBG + 0x167d
    .4byte Pal_EfxPierceNormalEffectBG + 0x164d
    .4byte Pal_EfxPierceNormalEffectBG + 0x122d
    .4byte 0x80000000
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff50000
    .4byte 0x0000fff7
    .4byte 0x00008000
    .4byte 0xffed0002
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xffed0003
    .4byte 0x00000007
    .4byte 0x00008000
    .4byte 0x00050000
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xfffd0004
    .4byte 0x00000007
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x0017000b
    .4byte 0x0000fff7
    .4byte 0x10008000
    .4byte 0x000f000d
    .4byte 0x0000fff7
    .4byte 0x10004000
    .4byte 0x0017000e
    .4byte 0x00000007
    .4byte 0x10000000
    .4byte 0x000f0010
    .4byte 0x00000007
    .4byte 0x50000000
    .4byte 0xffff0000
    .4byte 0x0000fff7
    .4byte 0x50000000
    .4byte 0xffe70011
    .4byte 0x0000fff7
    .4byte 0x10008000
    .4byte 0xfff70000
    .4byte 0x0000fff7
    .4byte 0x10004000
    .4byte 0xffff000f
    .4byte 0x00000007
    .4byte 0x10000000
    .4byte 0xfff70010
    .4byte 0x00000007
    .4byte 0x10000000
    .4byte 0xffef002e
    .4byte 0x00000007
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x00040000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0xffef0000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0x001c0006
    .4byte 0x0000fff6
    .4byte 0x10008000
    .4byte 0x00140008
    .4byte 0x0000fff6
    .4byte 0x10008000
    .4byte 0xffe70009
    .4byte 0x0000fff6
    .4byte 0x10004000
    .4byte 0x001c0023
    .4byte 0x00000006
    .4byte 0x10000000
    .4byte 0x00140025
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0x00040024
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0xffef0024
    .4byte 0x00000006
    .4byte 0x10000000
    .4byte 0xffe7000a
    .4byte 0x00000006
    .4byte 0x00008000
    .4byte 0xfffd0000
    .4byte 0x0000fff6
    .4byte 0x00000000
    .4byte 0xfffd0020
    .4byte 0x00000001
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x00120013
    .4byte 0x0000fff6
    .4byte 0x10004000
    .4byte 0x00220036
    .4byte 0x0000fffe
    .4byte 0x10004000
    .4byte 0x00220015
    .4byte 0x00000006
    .4byte 0x10000000
    .4byte 0x001a0017
    .4byte 0x00000006
    .4byte 0x50000000
    .4byte 0x00020000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0xfff20000
    .4byte 0x0000fff6
    .4byte 0x10008000
    .4byte 0xffe20018
    .4byte 0x0000fff6
    .4byte 0x10004000
    .4byte 0x000a0016
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0xfffa0016
    .4byte 0x00000006
    .4byte 0x10000000
    .4byte 0xffe20035
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0xffea0016
    .4byte 0x00000006
    .4byte 0x10008000
    .4byte 0xffea0001
    .4byte 0x0000fff6
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x00180042
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0x00280040
    .4byte 0x0000fffc
    .4byte 0x10004000
    .4byte 0x00180044
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0x00080044
    .4byte 0x00000004
    .4byte 0x50000000
    .4byte 0x00080000
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0xfff80000
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0xffe80000
    .4byte 0x0000fff4
    .4byte 0x10004000
    .4byte 0xfff80044
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0xffe80044
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xffd80046
    .4byte 0x0000fff4
    .4byte 0x10008000
    .4byte 0xffe00000
    .4byte 0x0000fff4
    .4byte 0x10000000
    .4byte 0xffe00064
    .4byte 0x00000004
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x00270019
    .4byte 0x0000fffe
    .4byte 0x50000000
    .4byte 0x0017001b
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0x00070000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0xfff70000
    .4byte 0x0000fff6
    .4byte 0x10004000
    .4byte 0x0017002f
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0x0007002f
    .4byte 0x00000006
    .4byte 0x10004000
    .4byte 0xfff7002f
    .4byte 0x00000006
    .4byte 0x50000000
    .4byte 0xffd7001d
    .4byte 0x0000fff6
    .4byte 0x10000000
    .4byte 0xffdf003f
    .4byte 0x00000006
    .4byte 0x50000000
    .4byte 0xffe70000
    .4byte 0x0000fff6
    .4byte 0x10004000
    .4byte 0xffe7002f
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffdc0047
    .4byte 0x0000ffee
    .4byte 0x00004000
    .4byte 0xffec0047
    .4byte 0x0000ffee
    .4byte 0x00004000
    .4byte 0xfffc0047
    .4byte 0x0000ffee
    .4byte 0x00000000
    .4byte 0x000c0047
    .4byte 0x0000ffee
    .4byte 0x00000000
    .4byte 0x000f0048
    .4byte 0x0000ffee
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfffb0000
    .4byte 0x0000fff7
    .4byte 0x10008000
    .4byte 0x000b0002
    .4byte 0x0000fff7
    .4byte 0x10004000
    .4byte 0x00030003
    .4byte 0x00000007
    .4byte 0x10008000
    .4byte 0xfff30000
    .4byte 0x0000fff7
    .4byte 0x10004000
    .4byte 0xfff30004
    .4byte 0x00000007
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffd9000b
    .4byte 0x0000fff7
    .4byte 0x00008000
    .4byte 0xffe9000d
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xffd9000e
    .4byte 0x00000007
    .4byte 0x00000000
    .4byte 0xffe90010
    .4byte 0x00000007
    .4byte 0x40000000
    .4byte 0xfff10000
    .4byte 0x0000fff7
    .4byte 0x40000000
    .4byte 0x00090011
    .4byte 0x0000fff7
    .4byte 0x00008000
    .4byte 0x00010000
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xfff1000f
    .4byte 0x00000007
    .4byte 0x00000000
    .4byte 0x00010010
    .4byte 0x00000007
    .4byte 0x00000000
    .4byte 0x0009002e
    .4byte 0x00000007
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffef0000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffff0000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffd70006
    .4byte 0x0000fff6
    .4byte 0x00008000
    .4byte 0xffe70008
    .4byte 0x0000fff6
    .4byte 0x00008000
    .4byte 0x000f0009
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0xffd70023
    .4byte 0x00000006
    .4byte 0x00000000
    .4byte 0xffe70025
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffef0024
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffff0024
    .4byte 0x00000006
    .4byte 0x00000000
    .4byte 0x000f000a
    .4byte 0x00000006
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffde0013
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0xffce0036
    .4byte 0x0000fffe
    .4byte 0x00004000
    .4byte 0xffce0015
    .4byte 0x00000006
    .4byte 0x00000000
    .4byte 0xffde0017
    .4byte 0x00000006
    .4byte 0x40000000
    .4byte 0xffee0000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xfffe0000
    .4byte 0x0000fff6
    .4byte 0x00008000
    .4byte 0x00160018
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0xffe60016
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xfff60016
    .4byte 0x00000006
    .4byte 0x00000000
    .4byte 0x00160035
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x00060016
    .4byte 0x00000006
    .4byte 0x00008000
    .4byte 0x000e0001
    .4byte 0x0000fff6
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffd80042
    .4byte 0x0000fff4
    .4byte 0x40000000
    .4byte 0xffc80040
    .4byte 0x0000fffc
    .4byte 0x00004000
    .4byte 0xffd80044
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0xffe80044
    .4byte 0x00000004
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff4
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff4
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff4
    .4byte 0x00004000
    .4byte 0xfff80044
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0x00080044
    .4byte 0x00000004
    .4byte 0x00008000
    .4byte 0x00200046
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x00180000
    .4byte 0x0000fff4
    .4byte 0x00000000
    .4byte 0x00180064
    .4byte 0x00000004
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffc90019
    .4byte 0x0000fffe
    .4byte 0x40000000
    .4byte 0xffd9001b
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xffe90000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xfff90000
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0xffd9002f
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xffe9002f
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0xfff9002f
    .4byte 0x00000006
    .4byte 0x40000000
    .4byte 0x0019001d
    .4byte 0x0000fff6
    .4byte 0x00000000
    .4byte 0x0019003f
    .4byte 0x00000006
    .4byte 0x40000000
    .4byte 0x00090000
    .4byte 0x0000fff6
    .4byte 0x00004000
    .4byte 0x0009002f
    .4byte 0x00000006
    .4byte 0x00004000
    .4byte 0x00140047
    .4byte 0x0000ffee
    .4byte 0x00004000
    .4byte 0x00040047
    .4byte 0x0000ffee
    .4byte 0x00004000
    .4byte 0xfff40047
    .4byte 0x0000ffee
    .4byte 0x00000000
    .4byte 0xffec0048
    .4byte 0x0000ffee
    .4byte 0x00000000
    .4byte 0xffe90047
    .4byte 0x0000ffee
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff20000
    .4byte 0x0000fff7
    .4byte 0x00008000
    .4byte 0xffea0002
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xffea0003
    .4byte 0x00000007
    .4byte 0x00008000
    .4byte 0x00020000
    .4byte 0x0000fff7
    .4byte 0x00004000
    .4byte 0xfffa0004
    .4byte 0x00000007
    .4byte 0x00008000
    .4byte 0xffe80049
    .4byte 0x0000fff7
    .4byte 0x20008000
    .4byte 0x000e0046
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0x000a002a
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0x000a002a
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x000a0067
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfffc0000
    .4byte 0x0000fff7
    .4byte 0x10008000
    .4byte 0x000c0002
    .4byte 0x0000fff7
    .4byte 0x10004000
    .4byte 0x00040003
    .4byte 0x00000007
    .4byte 0x10008000
    .4byte 0xfff40000
    .4byte 0x0000fff7
    .4byte 0x10004000
    .4byte 0xfff40004
    .4byte 0x00000007
    .4byte 0x10008000
    .4byte 0x000e0049
    .4byte 0x0000fff7
    .4byte 0x30008000
    .4byte 0xffe80046
    .4byte 0x0000fff9
    .4byte 0x10000000
    .4byte 0xffec002a
    .4byte 0x0000fff9
    .4byte 0x10000000
    .4byte 0xffec002a
    .4byte 0x00000001
    .4byte 0x10000000
    .4byte 0xffec0067
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

	.global AnimScr_EkrBaseKaiten9
AnimScr_EkrBaseKaiten9:
    .4byte Pal_EfxPierceNormalEffectBG + 0x1b1a
    .4byte Pal_EfxPierceNormalEffectBG + 0x1b32
    .4byte Pal_EfxPierceNormalEffectBG + 0x21f2
    .4byte Pal_EfxPierceNormalEffectBG + 0x1b79
    .4byte Pal_EfxPierceNormalEffectBG + 0x1bfd
    .4byte Pal_EfxPierceNormalEffectBG + 0x1c99
    .4byte Pal_EfxPierceNormalEffectBG + 0x1dd1
    .4byte Pal_EfxPierceNormalEffectBG + 0x1d35
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten10
AnimScr_EkrBaseKaiten10:
    .4byte Pal_EfxPierceNormalEffectBG + 0x1b1a
    .4byte Pal_EfxPierceNormalEffectBG + 0x1e9e
    .4byte Pal_EfxPierceNormalEffectBG + 0x2276
    .4byte Pal_EfxPierceNormalEffectBG + 0x1ee5
    .4byte Pal_EfxPierceNormalEffectBG + 0x1f69
    .4byte Pal_EfxPierceNormalEffectBG + 0x1fed
    .4byte Pal_EfxPierceNormalEffectBG + 0x2125
    .4byte Pal_EfxPierceNormalEffectBG + 0x2089
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten11
AnimScr_EkrBaseKaiten11:
    .4byte Pal_EfxPierceNormalEffectBG + 0x1d35
    .4byte Pal_EfxPierceNormalEffectBG + 0x1dd1
    .4byte Pal_EfxPierceNormalEffectBG + 0x1c99
    .4byte Pal_EfxPierceNormalEffectBG + 0x1bfd
    .4byte Pal_EfxPierceNormalEffectBG + 0x1b79
    .4byte Pal_EfxPierceNormalEffectBG + 0x21f2
    .4byte Pal_EfxPierceNormalEffectBG + 0x1b32
    .4byte Pal_EfxPierceNormalEffectBG + 0x1b1a
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten12
AnimScr_EkrBaseKaiten12:
    .4byte Pal_EfxPierceNormalEffectBG + 0x2089
    .4byte Pal_EfxPierceNormalEffectBG + 0x2125
    .4byte Pal_EfxPierceNormalEffectBG + 0x1fed
    .4byte Pal_EfxPierceNormalEffectBG + 0x1f69
    .4byte Pal_EfxPierceNormalEffectBG + 0x1ee5
    .4byte Pal_EfxPierceNormalEffectBG + 0x2276
    .4byte Pal_EfxPierceNormalEffectBG + 0x1e9e
    .4byte Pal_EfxPierceNormalEffectBG + 0x1b1a
    .4byte 0x80000000
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff90000
    .4byte 0x0000fff4
    .4byte 0x00004000
    .4byte 0xfff90000
    .4byte 0x00000004
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff70008
    .4byte 0x0000ffec
    .4byte 0x40000000
    .4byte 0xfff9000a
    .4byte 0x0000fffc
    .4byte 0x00008000
    .4byte 0xffff000c
    .4byte 0x0000000c
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff00015
    .4byte 0x0000ffeb
    .4byte 0x00008000
    .4byte 0x00000017
    .4byte 0x0000ffeb
    .4byte 0x80004000
    .4byte 0xfff10019
    .4byte 0x0000fffb
    .4byte 0x40000000
    .4byte 0x0000001d
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0xfff80034
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0x00020038
    .4byte 0x0000001b
    .4byte 0x20000000
    .4byte 0xfff5003f
    .4byte 0x0000ffe8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000d0068
    .4byte 0x0000fffd
    .4byte 0x40000000
    .4byte 0xffed0049
    .4byte 0x0000ffe5
    .4byte 0x80004000
    .4byte 0xffed0044
    .4byte 0x0000fff5
    .4byte 0x00000000
    .4byte 0xfffd0047
    .4byte 0x0000ffed
    .4byte 0x00000000
    .4byte 0xffe5004b
    .4byte 0x0000fff5
    .4byte 0x00000000
    .4byte 0xffe50048
    .4byte 0x0000ffed
    .4byte 0x00008000
    .4byte 0x000d004d
    .4byte 0x00000005
    .4byte 0x00008000
    .4byte 0x000d004e
    .4byte 0x00000015
    .4byte 0x40000000
    .4byte 0xfff50043
    .4byte 0x00000005
    .4byte 0x00008000
    .4byte 0x00050045
    .4byte 0x00000005
    .4byte 0x00000000
    .4byte 0x00050043
    .4byte 0x00000015
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x0008005e
    .4byte 0x0000fff5
    .4byte 0x00004000
    .4byte 0x0008007e
    .4byte 0x0000000d
    .4byte 0x00004000
    .4byte 0xffe80059
    .4byte 0x0000ffec
    .4byte 0x00004000
    .4byte 0xffe80079
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0xfff8005b
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0xfff8007b
    .4byte 0x00000008
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff4
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fffd
    .4byte 0x40000000
    .4byte 0x00180080
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x002800a2
    .4byte 0x0000000c
    .4byte 0x00000000
    .4byte 0x00180082
    .4byte 0x0000fffc
    .4byte 0x00008000
    .4byte 0xffe00058
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0xffe80091
    .4byte 0x0000fff1
    .4byte 0x00004000
    .4byte 0xfff80093
    .4byte 0x0000fff1
    .4byte 0x00004000
    .4byte 0x00080095
    .4byte 0x0000fff1
    .4byte 0x00004000
    .4byte 0xffe800b1
    .4byte 0x00000009
    .4byte 0x00004000
    .4byte 0xfff800b3
    .4byte 0x00000009
    .4byte 0x00004000
    .4byte 0x000800b5
    .4byte 0x00000009
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0x00180097
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0x002800b9
    .4byte 0x00000001
    .4byte 0x00004000
    .4byte 0x0018009a
    .4byte 0x00000009
    .4byte 0x00004000
    .4byte 0x002800ba
    .4byte 0x00000009
    .4byte 0x00008000
    .4byte 0xffe00090
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0xffe00099
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfff90000
    .4byte 0x0000fffc
    .4byte 0x10004000
    .4byte 0xfff90000
    .4byte 0x0000fff4
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfffb0004
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0xfff60006
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0xfffc0022
    .4byte 0x0000ffec
    .4byte 0x20000000
    .4byte 0xfff80004
    .4byte 0x0000ffff
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x0005000d
    .4byte 0x0000ffeb
    .4byte 0x10008000
    .4byte 0xfffd000f
    .4byte 0x0000ffeb
    .4byte 0x50000000
    .4byte 0xfffd0010
    .4byte 0x0000fffb
    .4byte 0x10008000
    .4byte 0xfff50012
    .4byte 0x0000fffb
    .4byte 0x10004000
    .4byte 0xfff50013
    .4byte 0x0000000b
    .4byte 0x10000000
    .4byte 0xffed0033
    .4byte 0x0000000b
    .4byte 0x10000000
    .4byte 0xfffb00ae
    .4byte 0x00000013
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0x00000043
    .4byte 0x0000fff0
    .4byte 0x10008000
    .4byte 0xfff80047
    .4byte 0x0000fff0
    .4byte 0x10000000
    .4byte 0xfff00068
    .4byte 0x0000fff8
    .4byte 0x90004000
    .4byte 0xfff00043
    .4byte 0x00000000
    .4byte 0x10008000
    .4byte 0xffe80047
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffe00068
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffe80060
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xffe00062
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xfff80064
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0x0018001f
    .4byte 0x0000ffe8
    .4byte 0x10004000
    .4byte 0x00080040
    .4byte 0x0000ffe8
    .4byte 0x10000000
    .4byte 0x00000042
    .4byte 0x0000ffe8
    .4byte 0x10000000
    .4byte 0x00200018
    .4byte 0x0000ffe8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0x00090051
    .4byte 0x0000ffee
    .4byte 0x10004000
    .4byte 0x00090071
    .4byte 0x00000006
    .4byte 0x50000000
    .4byte 0x00090000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0xfff90000
    .4byte 0x0000fff9
    .4byte 0x50000000
    .4byte 0xffe90000
    .4byte 0x0000fffb
    .4byte 0x10004000
    .4byte 0xfff90053
    .4byte 0x0000fff1
    .4byte 0x10004000
    .4byte 0xfff90073
    .4byte 0x00000009
    .4byte 0x10004000
    .4byte 0xffe90055
    .4byte 0x0000fff3
    .4byte 0x10004000
    .4byte 0xffe90075
    .4byte 0x0000000b
    .4byte 0x10008000
    .4byte 0xffe10057
    .4byte 0x0000fff9
    .4byte 0x10000000
    .4byte 0xffe1005d
    .4byte 0x00000009
    .4byte 0x50000000
    .4byte 0x0019004f
    .4byte 0x0000fff9
    .4byte 0x10000000
    .4byte 0x0029006b
    .4byte 0x0000fffb
    .4byte 0x10000000
    .4byte 0x0019007d
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0x000c0086
    .4byte 0x0000fff2
    .4byte 0x10004000
    .4byte 0xfffc0088
    .4byte 0x0000fff2
    .4byte 0x10004000
    .4byte 0xffec008a
    .4byte 0x0000fff2
    .4byte 0x10004000
    .4byte 0x000c00a6
    .4byte 0x0000000a
    .4byte 0x10004000
    .4byte 0xfffc00a8
    .4byte 0x0000000a
    .4byte 0x10004000
    .4byte 0xffec00aa
    .4byte 0x0000000a
    .4byte 0x10008000
    .4byte 0xffe4008c
    .4byte 0x0000fffa
    .4byte 0x10000000
    .4byte 0xffdc00ad
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0x000c0000
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0xfffc0000
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0xffec0000
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0x00240083
    .4byte 0x0000fffa
    .4byte 0x10008000
    .4byte 0x001c0085
    .4byte 0x0000fffa
    .4byte 0x10004000
    .4byte 0xffdc008e
    .4byte 0x0000fff2
    .4byte 0x10000000
    .4byte 0x001c00ae
    .4byte 0x0000000a
    .4byte 0x10000000
    .4byte 0xffe400af
    .4byte 0x0000000a
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff70000
    .4byte 0x0000fffb
    .4byte 0x00004000
    .4byte 0xfff70000
    .4byte 0x0000fff3
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff60004
    .4byte 0x0000fff4
    .4byte 0x40000000
    .4byte 0xfffb0006
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0xfff50022
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xffed000d
    .4byte 0x0000ffeb
    .4byte 0x00008000
    .4byte 0xfffd000f
    .4byte 0x0000ffeb
    .4byte 0x40000000
    .4byte 0xfff50010
    .4byte 0x0000fffb
    .4byte 0x00008000
    .4byte 0x00050012
    .4byte 0x0000fffb
    .4byte 0x00004000
    .4byte 0xfffd0013
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0x000d0033
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0xffff00ae
    .4byte 0x00000013
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffe00043
    .4byte 0x0000ffef
    .4byte 0x00008000
    .4byte 0x00000047
    .4byte 0x0000ffef
    .4byte 0x00000000
    .4byte 0x00080068
    .4byte 0x0000fff7
    .4byte 0x80004000
    .4byte 0xfff00043
    .4byte 0x0000ffff
    .4byte 0x00008000
    .4byte 0x00100047
    .4byte 0x0000ffff
    .4byte 0x00000000
    .4byte 0x00180068
    .4byte 0x00000007
    .4byte 0x00004000
    .4byte 0x00080060
    .4byte 0x0000000f
    .4byte 0x00000000
    .4byte 0x00180062
    .4byte 0x0000000f
    .4byte 0x00000000
    .4byte 0x00000064
    .4byte 0x0000000f
    .4byte 0x00000000
    .4byte 0xffe0001f
    .4byte 0x0000ffe7
    .4byte 0x00004000
    .4byte 0xffe80040
    .4byte 0x0000ffe7
    .4byte 0x00000000
    .4byte 0xfff80042
    .4byte 0x0000ffe7
    .4byte 0x00000000
    .4byte 0xffd80018
    .4byte 0x0000ffe7
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0xffeb0051
    .4byte 0x0000ffee
    .4byte 0x00004000
    .4byte 0xffeb0071
    .4byte 0x00000006
    .4byte 0x40000000
    .4byte 0xffeb0000
    .4byte 0x0000fff6
    .4byte 0x40000000
    .4byte 0xfffb0000
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0x000b0000
    .4byte 0x0000fffb
    .4byte 0x00004000
    .4byte 0xfffb0053
    .4byte 0x0000fff1
    .4byte 0x00004000
    .4byte 0xfffb0073
    .4byte 0x00000009
    .4byte 0x00004000
    .4byte 0x000b0055
    .4byte 0x0000fff3
    .4byte 0x00004000
    .4byte 0x000b0075
    .4byte 0x0000000b
    .4byte 0x00008000
    .4byte 0x001b0057
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0x001b005d
    .4byte 0x00000009
    .4byte 0x40000000
    .4byte 0xffdb004f
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0xffd3006b
    .4byte 0x0000fffb
    .4byte 0x00000000
    .4byte 0xffe3007d
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0xffe80086
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0xfff80088
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0x0008008a
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0xffe800a6
    .4byte 0x00000008
    .4byte 0x00004000
    .4byte 0xfff800a8
    .4byte 0x00000008
    .4byte 0x00004000
    .4byte 0x000800aa
    .4byte 0x00000008
    .4byte 0x00008000
    .4byte 0x0018008c
    .4byte 0x0000fff8
    .4byte 0x00000000
    .4byte 0x002000ad
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0xffe80000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x0000fff8
    .4byte 0x40000000
    .4byte 0xffd00083
    .4byte 0x0000fff8
    .4byte 0x00008000
    .4byte 0xffe00085
    .4byte 0x0000fff8
    .4byte 0x00004000
    .4byte 0x0018008e
    .4byte 0x0000fff0
    .4byte 0x00000000
    .4byte 0xffe000ae
    .4byte 0x00000008
    .4byte 0x00000000
    .4byte 0x001800af
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfff70000
    .4byte 0x0000fff4
    .4byte 0x10004000
    .4byte 0xfff70000
    .4byte 0x00000004
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfffa0008
    .4byte 0x0000ffec
    .4byte 0x50000000
    .4byte 0xfff8000a
    .4byte 0x0000fffc
    .4byte 0x10008000
    .4byte 0xfffa000c
    .4byte 0x0000000c
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0x00010015
    .4byte 0x0000ffea
    .4byte 0x10008000
    .4byte 0xfff90017
    .4byte 0x0000ffea
    .4byte 0x90004000
    .4byte 0xfff00019
    .4byte 0x0000fffa
    .4byte 0x50000000
    .4byte 0xfff1001d
    .4byte 0x0000000a
    .4byte 0x10000000
    .4byte 0x00010034
    .4byte 0x0000000a
    .4byte 0x10000000
    .4byte 0xfff70038
    .4byte 0x0000001a
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffec0068
    .4byte 0x0000fffc
    .4byte 0x50000000
    .4byte 0x00040049
    .4byte 0x0000ffe4
    .4byte 0x90004000
    .4byte 0xfff40044
    .4byte 0x0000fff4
    .4byte 0x10000000
    .4byte 0xfffc0047
    .4byte 0x0000ffec
    .4byte 0x10000000
    .4byte 0x0014004b
    .4byte 0x0000fff4
    .4byte 0x10000000
    .4byte 0x00140048
    .4byte 0x0000ffec
    .4byte 0x10008000
    .4byte 0xffec004d
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xffec004e
    .4byte 0x00000014
    .4byte 0x50000000
    .4byte 0xfffc0043
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xfff40045
    .4byte 0x00000004
    .4byte 0x10000000
    .4byte 0xfff40043
    .4byte 0x00000014
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xffeb005e
    .4byte 0x0000fff5
    .4byte 0x10004000
    .4byte 0xffeb007e
    .4byte 0x0000000d
    .4byte 0x10004000
    .4byte 0x000b0059
    .4byte 0x0000ffec
    .4byte 0x10004000
    .4byte 0x000b0079
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0xfffb005b
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xfffb007b
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0x000b0000
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0xfffb0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffeb0000
    .4byte 0x0000fffd
    .4byte 0x50000000
    .4byte 0xffdb0080
    .4byte 0x00000004
    .4byte 0x10000000
    .4byte 0xffd300a2
    .4byte 0x0000000c
    .4byte 0x10000000
    .4byte 0xffe30082
    .4byte 0x0000fffc
    .4byte 0x10008000
    .4byte 0x001b0058
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0x000c0091
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xfffc0093
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xffec0095
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0x000c00b1
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xfffc00b3
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffec00b5
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0x000c0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xfffc0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffec0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffdc0097
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0xffd400b9
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xffdc009a
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffcc00ba
    .4byte 0x00000008
    .4byte 0x10008000
    .4byte 0x001c0090
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0x001c0099
    .4byte 0x0000fff0
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0xfff3009c
    .4byte 0x0000fff4
    .4byte 0x00000000
    .4byte 0xfff3009d
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0xfffb0000
    .4byte 0x0000ffff
    .4byte 0x00000000
    .4byte 0xfffb0020
    .4byte 0x00000006
    .4byte 0x30008000
    .4byte 0x0007009c
    .4byte 0x0000fffe
    .4byte 0x30000000
    .4byte 0x0007009d
    .4byte 0x0000fff7
    .4byte 0x00008000
    .4byte 0xffff0000
    .4byte 0x0000fffe
    .4byte 0x10000000
    .4byte 0xffff005b
    .4byte 0x0000ffee
    .4byte 0x10000000
    .4byte 0xfff8005c
    .4byte 0x0000ffee
    .4byte 0x00008000
    .4byte 0xfffa0000
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0xffff0001
    .4byte 0x0000fff4
    .4byte 0x00004000
    .4byte 0xfffb0060
    .4byte 0x0000000c
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x20008000
    .4byte 0xfff3009c
    .4byte 0x0000fffe
    .4byte 0x20000000
    .4byte 0xfff3009d
    .4byte 0x0000fff6
    .4byte 0x20000000
    .4byte 0xfffa0000
    .4byte 0x0000fffb
    .4byte 0x20000000
    .4byte 0xfffb0020
    .4byte 0x0000fff5
    .4byte 0x10008000
    .4byte 0x0005009c
    .4byte 0x0000fff4
    .4byte 0x10000000
    .4byte 0x0005009d
    .4byte 0x00000003
    .4byte 0x20008000
    .4byte 0xfffd0000
    .4byte 0x0000fff4
    .4byte 0x30000000
    .4byte 0xfffd005b
    .4byte 0x0000000c
    .4byte 0x30000000
    .4byte 0xfff7005c
    .4byte 0x0000000c
    .4byte 0x20008000
    .4byte 0xfff90000
    .4byte 0x0000fffe
    .4byte 0x20008000
    .4byte 0xfffd0001
    .4byte 0x0000fffe
    .4byte 0x10000000
    .4byte 0x0001005b
    .4byte 0x0000ffee
    .4byte 0x10000000
    .4byte 0xfffb005c
    .4byte 0x0000ffee
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x30008000
    .4byte 0x0005009c
    .4byte 0x0000fffe
    .4byte 0x30000000
    .4byte 0x0005009d
    .4byte 0x0000fff6
    .4byte 0x30000000
    .4byte 0xfffe0000
    .4byte 0x0000fffb
    .4byte 0x30000000
    .4byte 0xfffd0020
    .4byte 0x0000fff5
    .4byte 0x00008000
    .4byte 0xfff3009c
    .4byte 0x0000fff4
    .4byte 0x00000000
    .4byte 0xfff3009d
    .4byte 0x00000003
    .4byte 0x30008000
    .4byte 0xfffb0000
    .4byte 0x0000fff4
    .4byte 0x20000000
    .4byte 0xfffb005b
    .4byte 0x0000000c
    .4byte 0x20000000
    .4byte 0x0001005c
    .4byte 0x0000000c
    .4byte 0x30008000
    .4byte 0xffff0000
    .4byte 0x0000fffe
    .4byte 0x30008000
    .4byte 0xfffb0001
    .4byte 0x0000fffe
    .4byte 0x00000000
    .4byte 0xfff7005b
    .4byte 0x0000ffee
    .4byte 0x00000000
    .4byte 0xfffd005c
    .4byte 0x0000ffee
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10008000
    .4byte 0x0006009c
    .4byte 0x0000fff3
    .4byte 0x10000000
    .4byte 0x0006009d
    .4byte 0x00000003
    .4byte 0x10000000
    .4byte 0xfffe0000
    .4byte 0x0000fffe
    .4byte 0x10000000
    .4byte 0xfffe0020
    .4byte 0x00000005
    .4byte 0x20008000
    .4byte 0xfff2009c
    .4byte 0x0000fffd
    .4byte 0x20000000
    .4byte 0xfff2009d
    .4byte 0x0000fff6
    .4byte 0x10008000
    .4byte 0xfffa0000
    .4byte 0x0000fffd
    .4byte 0x00000000
    .4byte 0xfffa005b
    .4byte 0x0000ffed
    .4byte 0x00000000
    .4byte 0x0001005c
    .4byte 0x0000ffed
    .4byte 0x10008000
    .4byte 0xffff0000
    .4byte 0x0000fff3
    .4byte 0x10008000
    .4byte 0xfffa0001
    .4byte 0x0000fff3
    .4byte 0x10004000
    .4byte 0xfff60060
    .4byte 0x0000000b
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

	.global AnimScr_EkrBaseKaiten13
AnimScr_EkrBaseKaiten13:
    .4byte Pal_EfxPierceNormalEffectBG + 0x238a
    .4byte Pal_EfxPierceNormalEffectBG + 0x23a2
    .4byte Pal_EfxPierceNormalEffectBG + 0x2eb2
    .4byte Pal_EfxPierceNormalEffectBG + 0x23c5
    .4byte Pal_EfxPierceNormalEffectBG + 0x23f5
    .4byte Pal_EfxPierceNormalEffectBG + 0x2455
    .4byte Pal_EfxPierceNormalEffectBG + 0x24e5
    .4byte Pal_EfxPierceNormalEffectBG + 0x258d
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten14
AnimScr_EkrBaseKaiten14:
    .4byte Pal_EfxPierceNormalEffectBG + 0x238a
    .4byte Pal_EfxPierceNormalEffectBG + 0x264e
    .4byte Pal_EfxPierceNormalEffectBG + 0x2f4e
    .4byte Pal_EfxPierceNormalEffectBG + 0x2671
    .4byte Pal_EfxPierceNormalEffectBG + 0x26ad
    .4byte Pal_EfxPierceNormalEffectBG + 0x270d
    .4byte Pal_EfxPierceNormalEffectBG + 0x27b5
    .4byte Pal_EfxPierceNormalEffectBG + 0x2869
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten15
AnimScr_EkrBaseKaiten15:
    .4byte Pal_EfxPierceNormalEffectBG + 0x238a
    .4byte Pal_EfxPierceNormalEffectBG + 0x2936
    .4byte Pal_EfxPierceNormalEffectBG + 0x2ff6
    .4byte Pal_EfxPierceNormalEffectBG + 0x2959
    .4byte Pal_EfxPierceNormalEffectBG + 0x2989
    .4byte Pal_EfxPierceNormalEffectBG + 0x29e9
    .4byte Pal_EfxPierceNormalEffectBG + 0x2a91
    .4byte Pal_EfxPierceNormalEffectBG + 0x2b45
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten16
AnimScr_EkrBaseKaiten16:
    .4byte Pal_EfxPierceNormalEffectBG + 0x238a
    .4byte Pal_EfxPierceNormalEffectBG + 0x2c12
    .4byte Pal_EfxPierceNormalEffectBG + 0x309e
    .4byte Pal_EfxPierceNormalEffectBG + 0x2c35
    .4byte Pal_EfxPierceNormalEffectBG + 0x2c65
    .4byte Pal_EfxPierceNormalEffectBG + 0x2cb9
    .4byte Pal_EfxPierceNormalEffectBG + 0x2d49
    .4byte Pal_EfxPierceNormalEffectBG + 0x2df1
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten17
AnimScr_EkrBaseKaiten17:
    .4byte Pal_EfxPierceNormalEffectBG + 0x258d
    .4byte Pal_EfxPierceNormalEffectBG + 0x24e5
    .4byte Pal_EfxPierceNormalEffectBG + 0x2455
    .4byte Pal_EfxPierceNormalEffectBG + 0x23f5
    .4byte Pal_EfxPierceNormalEffectBG + 0x23c5
    .4byte Pal_EfxPierceNormalEffectBG + 0x2eb2
    .4byte Pal_EfxPierceNormalEffectBG + 0x23a2
    .4byte Pal_EfxPierceNormalEffectBG + 0x238a
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten18
AnimScr_EkrBaseKaiten18:
    .4byte Pal_EfxPierceNormalEffectBG + 0x2869
    .4byte Pal_EfxPierceNormalEffectBG + 0x27b5
    .4byte Pal_EfxPierceNormalEffectBG + 0x270d
    .4byte Pal_EfxPierceNormalEffectBG + 0x26ad
    .4byte Pal_EfxPierceNormalEffectBG + 0x2671
    .4byte Pal_EfxPierceNormalEffectBG + 0x2f4e
    .4byte Pal_EfxPierceNormalEffectBG + 0x264e
    .4byte Pal_EfxPierceNormalEffectBG + 0x238a
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten19
AnimScr_EkrBaseKaiten19:
    .4byte Pal_EfxPierceNormalEffectBG + 0x2b45
    .4byte Pal_EfxPierceNormalEffectBG + 0x2a91
    .4byte Pal_EfxPierceNormalEffectBG + 0x29e9
    .4byte Pal_EfxPierceNormalEffectBG + 0x2989
    .4byte Pal_EfxPierceNormalEffectBG + 0x2959
    .4byte Pal_EfxPierceNormalEffectBG + 0x2ff6
    .4byte Pal_EfxPierceNormalEffectBG + 0x2936
    .4byte Pal_EfxPierceNormalEffectBG + 0x238a
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten20
AnimScr_EkrBaseKaiten20:
    .4byte Pal_EfxPierceNormalEffectBG + 0x2df1
    .4byte Pal_EfxPierceNormalEffectBG + 0x2d49
    .4byte Pal_EfxPierceNormalEffectBG + 0x2cb9
    .4byte Pal_EfxPierceNormalEffectBG + 0x2c65
    .4byte Pal_EfxPierceNormalEffectBG + 0x2c35
    .4byte Pal_EfxPierceNormalEffectBG + 0x309e
    .4byte Pal_EfxPierceNormalEffectBG + 0x2c12
    .4byte Pal_EfxPierceNormalEffectBG + 0x238a
    .4byte 0x80000000
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x70000000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x70000000
    .4byte 0xfff00004
    .4byte 0x0000fff0
    .4byte 0x70000000
    .4byte 0x00000006
    .4byte 0x0000fff0
    .4byte 0x70000000
    .4byte 0xfff00008
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x00000004
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x0008000a
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x0008000a
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xfff0000a
    .4byte 0x0000fff4
    .4byte 0x10008000
    .4byte 0xfff0000a
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0xfff80000
    .4byte 0x0000ffec
    .4byte 0x00000000
    .4byte 0x0008002a
    .4byte 0x0000ffec
    .4byte 0x10000000
    .4byte 0xfff0002a
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0x00000043
    .4byte 0x0000fff0
    .4byte 0x10008000
    .4byte 0xfff80047
    .4byte 0x0000fff0
    .4byte 0x10000000
    .4byte 0xfff00068
    .4byte 0x0000fff8
    .4byte 0x90004000
    .4byte 0xfff00043
    .4byte 0x00000000
    .4byte 0x10008000
    .4byte 0xffe80047
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffe00068
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffe80060
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xffe00062
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xfff80064
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0x0018001f
    .4byte 0x0000ffe8
    .4byte 0x10004000
    .4byte 0x00080040
    .4byte 0x0000ffe8
    .4byte 0x10000000
    .4byte 0x00000042
    .4byte 0x0000ffe8
    .4byte 0x10000000
    .4byte 0x00200018
    .4byte 0x0000ffe8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0x00080051
    .4byte 0x0000ffee
    .4byte 0x10004000
    .4byte 0x00080071
    .4byte 0x00000006
    .4byte 0x50000000
    .4byte 0x00080000
    .4byte 0x0000fff6
    .4byte 0x50000000
    .4byte 0xfff80000
    .4byte 0x0000fff9
    .4byte 0x50000000
    .4byte 0xffe80000
    .4byte 0x0000fffb
    .4byte 0x10004000
    .4byte 0xfff80053
    .4byte 0x0000fff1
    .4byte 0x10004000
    .4byte 0xfff80073
    .4byte 0x00000009
    .4byte 0x10004000
    .4byte 0xffe80055
    .4byte 0x0000fff3
    .4byte 0x10004000
    .4byte 0xffe80075
    .4byte 0x0000000b
    .4byte 0x10008000
    .4byte 0xffe00057
    .4byte 0x0000fff9
    .4byte 0x10000000
    .4byte 0xffe0005d
    .4byte 0x00000009
    .4byte 0x50000000
    .4byte 0x0018004f
    .4byte 0x0000fff9
    .4byte 0x10000000
    .4byte 0x0028006b
    .4byte 0x0000fffb
    .4byte 0x10000000
    .4byte 0x0018007d
    .4byte 0x0000fff1
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0x000a0086
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xfffa0088
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xffea008a
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0x000a00a6
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xfffa00a8
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffea00aa
    .4byte 0x00000008
    .4byte 0x10008000
    .4byte 0xffe2008c
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0xffda00ad
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0x000a0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xfffa0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffea0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0x00220083
    .4byte 0x0000fff8
    .4byte 0x10008000
    .4byte 0x001a0085
    .4byte 0x0000fff8
    .4byte 0x10004000
    .4byte 0xffda008e
    .4byte 0x0000fff0
    .4byte 0x10000000
    .4byte 0x001a00ae
    .4byte 0x00000008
    .4byte 0x10000000
    .4byte 0xffe200af
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff00002
    .4byte 0x0000fff0
    .4byte 0x40000000
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff00006
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000008
    .4byte 0x0000fff0
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x00000004
    .4byte 0x40000000
    .4byte 0xfff80000
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x0008000a
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x0008000a
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xfff0000a
    .4byte 0x0000fff4
    .4byte 0x10008000
    .4byte 0xfff0000a
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0xfff80000
    .4byte 0x0000ffec
    .4byte 0x00000000
    .4byte 0x0008002a
    .4byte 0x0000ffec
    .4byte 0x10000000
    .4byte 0xfff0002a
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffec0068
    .4byte 0x0000fffc
    .4byte 0x50000000
    .4byte 0x00040049
    .4byte 0x0000ffe4
    .4byte 0x90004000
    .4byte 0xfff40044
    .4byte 0x0000fff4
    .4byte 0x10000000
    .4byte 0xfffc0047
    .4byte 0x0000ffec
    .4byte 0x10000000
    .4byte 0x0014004b
    .4byte 0x0000fff4
    .4byte 0x10000000
    .4byte 0x00140048
    .4byte 0x0000ffec
    .4byte 0x10008000
    .4byte 0xffec004d
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xffec004e
    .4byte 0x00000014
    .4byte 0x50000000
    .4byte 0xfffc0043
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xfff40045
    .4byte 0x00000004
    .4byte 0x10000000
    .4byte 0xfff40043
    .4byte 0x00000014
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xffec005e
    .4byte 0x0000fff5
    .4byte 0x10004000
    .4byte 0xffec007e
    .4byte 0x0000000d
    .4byte 0x10004000
    .4byte 0x000c0059
    .4byte 0x0000ffec
    .4byte 0x10004000
    .4byte 0x000c0079
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0xfffc005b
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xfffc007b
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0x000c0000
    .4byte 0x0000fff4
    .4byte 0x50000000
    .4byte 0xfffc0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffec0000
    .4byte 0x0000fffd
    .4byte 0x50000000
    .4byte 0xffdc0080
    .4byte 0x00000004
    .4byte 0x10000000
    .4byte 0xffd400a2
    .4byte 0x0000000c
    .4byte 0x10000000
    .4byte 0xffe40082
    .4byte 0x0000fffc
    .4byte 0x10008000
    .4byte 0x001c0058
    .4byte 0x0000ffec
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0x000c0091
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xfffc0093
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0xffec0095
    .4byte 0x0000fff0
    .4byte 0x10004000
    .4byte 0x000c00b1
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xfffc00b3
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffec00b5
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0x000c0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xfffc0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffec0000
    .4byte 0x0000fff8
    .4byte 0x50000000
    .4byte 0xffdc0097
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0xffd400b9
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xffdc009a
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffcc00ba
    .4byte 0x00000008
    .4byte 0x10008000
    .4byte 0x001c0090
    .4byte 0x0000fff8
    .4byte 0x10000000
    .4byte 0x001c0099
    .4byte 0x0000fff0
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff4000b
    .4byte 0x0000fff4
    .4byte 0x00008000
    .4byte 0x0004000d
    .4byte 0x0000fff4
    .4byte 0x00004000
    .4byte 0xfff4000e
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00040010
    .4byte 0x00000004
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff90000
    .4byte 0x0000ffee
    .4byte 0x40000000
    .4byte 0xfff90000
    .4byte 0x0000fffe
    .4byte 0x00008000
    .4byte 0xfff1009c
    .4byte 0x0000fff2
    .4byte 0x00008000
    .4byte 0xfff1009d
    .4byte 0x00000002
    .4byte 0x00004000
    .4byte 0xfff90011
    .4byte 0x00000012
    .4byte 0x00000000
    .4byte 0xfff100bf
    .4byte 0x00000012
    .4byte 0x00004000
    .4byte 0xfff9009e
    .4byte 0x0000ffe6
    .4byte 0x00000000
    .4byte 0x000900be
    .4byte 0x0000ffe6
    .4byte 0x30008000
    .4byte 0x0009009d
    .4byte 0x0000ffee
    .4byte 0x30008000
    .4byte 0x0009009c
    .4byte 0x0000fffe
    .4byte 0x00004000
    .4byte 0xfff90000
    .4byte 0x0000000a
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfff90000
    .4byte 0x0000ffee
    .4byte 0x40000000
    .4byte 0xfff90000
    .4byte 0x0000fffe
    .4byte 0x00008000
    .4byte 0xfff1009c
    .4byte 0x0000fff2
    .4byte 0x00008000
    .4byte 0xfff1009d
    .4byte 0x00000002
    .4byte 0x30004000
    .4byte 0xfff90011
    .4byte 0x0000ffe6
    .4byte 0x30000000
    .4byte 0x000900bf
    .4byte 0x0000ffe6
    .4byte 0x30008000
    .4byte 0x0009009d
    .4byte 0x0000ffee
    .4byte 0x30008000
    .4byte 0x0009009c
    .4byte 0x0000fffe
    .4byte 0x00004000
    .4byte 0xfff90000
    .4byte 0x0000000a
    .4byte 0x00004000
    .4byte 0xfff20013
    .4byte 0x00000012
    .4byte 0x00000000
    .4byte 0x00020015
    .4byte 0x00000012
    .4byte 0x00000000
    .4byte 0x00020016
    .4byte 0x0000001a
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

	.global AnimScr_EkrBaseKaiten21
AnimScr_EkrBaseKaiten21:
    .4byte Pal_EfxPierceNormalEffectBG + 0x325a
    .4byte Pal_EfxPierceNormalEffectBG + 0x37fa
    .4byte Pal_EfxPierceNormalEffectBG + 0x3272
    .4byte Pal_EfxPierceNormalEffectBG + 0x32ad
    .4byte Pal_EfxPierceNormalEffectBG + 0x3835
    .4byte Pal_EfxPierceNormalEffectBG + 0x3325
    .4byte Pal_EfxPierceNormalEffectBG + 0x33cd
    .4byte Pal_EfxPierceNormalEffectBG + 0x3481
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten22
AnimScr_EkrBaseKaiten22:
    .4byte Pal_EfxPierceNormalEffectBG + 0x325a
    .4byte Pal_EfxPierceNormalEffectBG + 0x37fa
    .4byte Pal_EfxPierceNormalEffectBG + 0x354e
    .4byte Pal_EfxPierceNormalEffectBG + 0x3589
    .4byte Pal_EfxPierceNormalEffectBG + 0x38c5
    .4byte Pal_EfxPierceNormalEffectBG + 0x3601
    .4byte Pal_EfxPierceNormalEffectBG + 0x3691
    .4byte Pal_EfxPierceNormalEffectBG + 0x3739
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten23
AnimScr_EkrBaseKaiten23:
    .4byte Pal_EfxPierceNormalEffectBG + 0x3481
    .4byte Pal_EfxPierceNormalEffectBG + 0x33cd
    .4byte Pal_EfxPierceNormalEffectBG + 0x3325
    .4byte Pal_EfxPierceNormalEffectBG + 0x3835
    .4byte Pal_EfxPierceNormalEffectBG + 0x32ad
    .4byte Pal_EfxPierceNormalEffectBG + 0x3272
    .4byte Pal_EfxPierceNormalEffectBG + 0x37fa
    .4byte Pal_EfxPierceNormalEffectBG + 0x325a
    .4byte 0x80000000

	.global AnimScr_EkrBaseKaiten24
AnimScr_EkrBaseKaiten24:
    .4byte Pal_EfxPierceNormalEffectBG + 0x3739
    .4byte Pal_EfxPierceNormalEffectBG + 0x3691
    .4byte Pal_EfxPierceNormalEffectBG + 0x3601
    .4byte Pal_EfxPierceNormalEffectBG + 0x38c5
    .4byte Pal_EfxPierceNormalEffectBG + 0x3589
    .4byte Pal_EfxPierceNormalEffectBG + 0x354e
    .4byte Pal_EfxPierceNormalEffectBG + 0x37fa
    .4byte Pal_EfxPierceNormalEffectBG + 0x325a
    .4byte 0x80000000
