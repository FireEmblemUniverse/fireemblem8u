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
    .4byte gUnknown_086FFD3C + 0x2c4
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

	.global Img_GameIntroWorldMap
Img_GameIntroWorldMap:  @ 0x08AB21D8
	#.incbin "graphics/game_intro/world_map.4bpp.lz"
	.incbin "baserom.gba", 0xAB21D8, 0x3BB8

	.global img_08AB5D90
img_08AB5D90:  @ 0x08AB5D90
	.incbin "baserom.gba", 0xAB5D90, 0x57C

	.global pal_08AB630C
pal_08AB630C:  @ 0x08AB630C
    .incbin "baserom.gba", 0xAB630C, 0x20

	.global img_08AB632C
img_08AB632C:  @ 0x08AB632C
	.incbin "baserom.gba", 0xAB632C, 0x1794

	.global img_08AB7AC0
img_08AB7AC0:  @ 0x08AB7AC0
	.incbin "baserom.gba", 0xAB7AC0, 0x2F0

	.global pal_08AB7DB0
pal_08AB7DB0:  @ 0x08AB7DB0
	.incbin "baserom.gba", 0xAB7DB0, 0x20

	.global gUnknown_08AB7DD0
gUnknown_08AB7DD0:  @ 0x08AB7DD0
	.incbin "baserom.gba", 0xAB7DD0, 0xA10

	.global gUnknown_08AB87E0
gUnknown_08AB87E0:  @ 0x08AB87E0
	.incbin "baserom.gba", 0xAB87E0, 0x4CC

	.global gUnknown_08AB8CAC
gUnknown_08AB8CAC:  @ 0x08AB8CAC
	.incbin "baserom.gba", 0xAB8CAC, 0x20

	.global gUnknown_08AB8CCC
gUnknown_08AB8CCC:  @ 0x08AB8CCC
	.incbin "baserom.gba", 0xAB8CCC, 0x760

	.global gUnknown_08AB942C
gUnknown_08AB942C:  @ 0x08AB942C
	.incbin "baserom.gba", 0xAB942C, 0x1D20

	.global gUnknown_08ABB14C
gUnknown_08ABB14C:  @ 0x08ABB14C
	.incbin "baserom.gba", 0xABB14C, 0xF28

	.global gUnknown_08ABC074
gUnknown_08ABC074:  @ 0x08ABC074
	.incbin "baserom.gba", 0xABC074, 0x1B8

	.global gUnknown_08ABC22C
gUnknown_08ABC22C:  @ 0x08ABC22C
	.incbin "baserom.gba", 0xABC22C, 0xF48

	.global gUnknown_08ABD174
gUnknown_08ABD174:  @ 0x08ABD174
	.incbin "baserom.gba", 0xABD174, 0x1D4

	.global gUnknown_08ABD348
gUnknown_08ABD348:  @ 0x08ABD348
	.incbin "baserom.gba", 0xABD348, 0xDD8

	.global gUnknown_08ABE120
gUnknown_08ABE120:  @ 0x08ABE120
	.incbin "baserom.gba", 0xABE120, 0x1E4

	.global gUnknown_08ABE304
gUnknown_08ABE304:  @ 0x08ABE304
	.incbin "baserom.gba", 0xABE304, 0xC6C

	.global gUnknown_08ABEF70
gUnknown_08ABEF70:  @ 0x08ABEF70
	.incbin "baserom.gba", 0xABEF70, 0x1F8

	.global gUnknown_08ABF168
gUnknown_08ABF168:  @ 0x08ABF168
	.incbin "baserom.gba", 0xABF168, 0x1A70

	.global gUnknown_08AC0BD8
gUnknown_08AC0BD8:  @ 0x08AC0BD8
	.incbin "baserom.gba", 0xAC0BD8, 0xCA0

	.global gUnknown_08AC1878
gUnknown_08AC1878:  @ 0x08AC1878
	.incbin "baserom.gba", 0xAC1878, 0x320

	.global gUnknown_08AC1B98
gUnknown_08AC1B98:  @ 0x08AC1B98
	.incbin "baserom.gba", 0xAC1B98, 0xF4

	.global gUnknown_08AC1C8C
gUnknown_08AC1C8C:  @ 0x08AC1C8C
	.incbin "baserom.gba", 0xAC1C8C, 0x160

	.global gUnknown_08AC1DEC
gUnknown_08AC1DEC:  @ 0x08AC1DEC
	.incbin "baserom.gba", 0xAC1DEC, 0xD38

	.global gUnknown_08AC2B24
gUnknown_08AC2B24:  @ 0x08AC2B24
	.incbin "baserom.gba", 0xAC2B24, 0x190

	.global gUnknown_08AC2CB4
gUnknown_08AC2CB4:  @ 0x08AC2CB4
	.incbin "baserom.gba", 0xAC2CB4, 0xD78

	.global gUnknown_08AC3A2C
gUnknown_08AC3A2C:  @ 0x08AC3A2C
	.incbin "baserom.gba", 0xAC3A2C, 0x19C

	.global gUnknown_08AC3BC8
gUnknown_08AC3BC8:  @ 0x08AC3BC8
	.incbin "baserom.gba", 0xAC3BC8, 0xB98

	.global gUnknown_08AC4760
gUnknown_08AC4760:  @ 0x08AC4760
	.incbin "baserom.gba", 0xAC4760, 0x1C8

	.global gUnknown_08AC4928
gUnknown_08AC4928:  @ 0x08AC4928
	.incbin "baserom.gba", 0xAC4928, 0xAF8

	.global gUnknown_08AC5420
gUnknown_08AC5420:  @ 0x08AC5420
	.incbin "baserom.gba", 0xAC5420, 0x1F4

	.global gUnknown_08AC5614
gUnknown_08AC5614:  @ 0x08AC5614
	.incbin "baserom.gba", 0xAC5614, 0x1D60

	.global gUnknown_08AC7374
gUnknown_08AC7374:  @ 0x08AC7374
	.incbin "baserom.gba", 0xAC7374, 0x1A68

	.global gUnknown_08AC8DDC
gUnknown_08AC8DDC:  @ 0x08AC8DDC
	.incbin "baserom.gba", 0xAC8DDC, 0x41C

	.global gUnknown_08AC91F8
gUnknown_08AC91F8:  @ 0x08AC91F8
	.incbin "baserom.gba", 0xAC91F8, 0x144

	.global gUnknown_08AC933C
gUnknown_08AC933C:  @ 0x08AC933C
	.incbin "baserom.gba", 0xAC933C, 0x160

	.global gUnknown_08AC949C
gUnknown_08AC949C:  @ 0x08AC949C
	.incbin "baserom.gba", 0xAC949C, 0x1AD4

	.global gUnknown_08ACAF70
gUnknown_08ACAF70:  @ 0x08ACAF70
	.incbin "baserom.gba", 0xACAF70, 0xFE8

	.global gUnknown_08ACBF58
gUnknown_08ACBF58:  @ 0x08ACBF58
	.incbin "baserom.gba", 0xACBF58, 0x3E8

	.global gUnknown_08ACC340
gUnknown_08ACC340:  @ 0x08ACC340
	.incbin "baserom.gba", 0xACC340, 0xA0

	.global gUnknown_08ACC3E0
gUnknown_08ACC3E0:  @ 0x08ACC3E0
    .incbin "baserom.gba", 0xACC3E0, 0x160

	.global gUnknown_08ACC540
gUnknown_08ACC540:  @ 0x08ACC540
	.incbin "baserom.gba", 0xACC540, 0x1B78

	.global gUnknown_08ACE0B8
gUnknown_08ACE0B8:  @ 0x08ACE0B8
	.incbin "baserom.gba", 0xACE0B8, 0xE18

	.global gUnknown_08ACEED0
gUnknown_08ACEED0:  @ 0x08ACEED0
	.incbin "baserom.gba", 0xACEED0, 0x330

	.global gUnknown_08ACF200
gUnknown_08ACF200:  @ 0x08ACF200
	.incbin "baserom.gba", 0xACF200, 0x114

	.global gUnknown_08ACF314
gUnknown_08ACF314:  @ 0x08ACF314
	.incbin "baserom.gba", 0xACF314, 0x160

	.global gUnknown_08ACF474
gUnknown_08ACF474:  @ 0x08ACF474
	.incbin "baserom.gba", 0xACF474, 0x1BD4

	.global gUnknown_08AD1048
gUnknown_08AD1048:  @ 0x08AD1048
	.incbin "baserom.gba", 0xAD1048, 0x1024

	.global gUnknown_08AD206C
gUnknown_08AD206C:  @ 0x08AD206C
	.incbin "baserom.gba", 0xAD206C, 0x300

	.global gUnknown_08AD236C
gUnknown_08AD236C:  @ 0x08AD236C
	.incbin "baserom.gba", 0xAD236C, 0x148

	.global gUnknown_08AD24B4
gUnknown_08AD24B4:  @ 0x08AD24B4
	.incbin "baserom.gba", 0xAD24B4, 0x160

	.global gUnknown_08AD2614
gUnknown_08AD2614:  @ 0x08AD2614
	.incbin "baserom.gba", 0xAD2614, 0x1C28

	.global gUnknown_08AD423C
gUnknown_08AD423C:  @ 0x08AD423C
	.incbin "baserom.gba", 0xAD423C, 0xE58

	.global gUnknown_08AD5094
gUnknown_08AD5094:  @ 0x08AD5094
	.incbin "baserom.gba", 0xAD5094, 0x3A8

	.global gUnknown_08AD543C
gUnknown_08AD543C:  @ 0x08AD543C
	.incbin "baserom.gba", 0xAD543C, 0xA0

	.global gUnknown_08AD54DC
gUnknown_08AD54DC:  @ 0x08AD54DC
	.incbin "baserom.gba", 0xAD54DC, 0x160

	.global gUnknown_08AD563C
gUnknown_08AD563C:  @ 0x08AD563C
	.incbin "baserom.gba", 0xAD563C, 0x1CC0

	.global gUnknown_08AD72FC
gUnknown_08AD72FC:  @ 0x08AD72FC
	.incbin "baserom.gba", 0xAD72FC, 0x121C

	.global gUnknown_08AD8518
gUnknown_08AD8518:  @ 0x08AD8518
	.incbin "baserom.gba", 0xAD8518, 0x3BC

	.global gUnknown_08AD88D4
gUnknown_08AD88D4:  @ 0x08AD88D4
	.incbin "baserom.gba", 0xAD88D4, 0xD4

	.global gUnknown_08AD89A8
gUnknown_08AD89A8:  @ 0x08AD89A8
	.incbin "baserom.gba", 0xAD89A8, 0x160

	.global gUnknown_08AD8B08
gUnknown_08AD8B08:  @ 0x08AD8B08
	.incbin "baserom.gba", 0xAD8B08, 0x1814

	.global gUnknown_08ADA31C
gUnknown_08ADA31C:  @ 0x08ADA31C
	.incbin "baserom.gba", 0xADA31C, 0x14E8

	.global gUnknown_08ADB804
gUnknown_08ADB804:  @ 0x08ADB804
	.incbin "baserom.gba", 0xADB804, 0x408

	.global gUnknown_08ADBC0C
gUnknown_08ADBC0C:  @ 0x08ADBC0C
	.incbin "baserom.gba", 0xADBC0C, 0x10C

	.global gUnknown_08ADBD18
gUnknown_08ADBD18:  @ 0x08ADBD18
	.incbin "baserom.gba", 0xADBD18, 0x160

	.global gUnknown_08ADBE78
gUnknown_08ADBE78:  @ 0x08ADBE78
	.incbin "baserom.gba", 0xADBE78, 0x20

	.global gUnknown_08ADBE98
gUnknown_08ADBE98:  @ 0x08ADBE98
	.incbin "baserom.gba", 0xADBE98, 0x528

	.global gUnknown_08ADC3C0
gUnknown_08ADC3C0:  @ 0x08ADC3C0
	.incbin "baserom.gba", 0xADC3C0, 0x348

	.global gUnknown_08ADC708
gUnknown_08ADC708:  @ 0x08ADC708
	.incbin "baserom.gba", 0xADC708, 0x20

	.global gUnknown_08ADC728
gUnknown_08ADC728:  @ 0x08ADC728
	.incbin "baserom.gba", 0xADC728, 0x590

	.global gUnknown_08ADCCB8
gUnknown_08ADCCB8:  @ 0x08ADCCB8
	.incbin "baserom.gba", 0xADCCB8, 0x398

	.global gUnknown_08ADD050
gUnknown_08ADD050:  @ 0x08ADD050
	.incbin "baserom.gba", 0xADD050, 0x20

	.global gUnknown_08ADD070
gUnknown_08ADD070:  @ 0x08ADD070
	.incbin "baserom.gba", 0xADD070, 0x67C

	.global gUnknown_08ADD6EC
gUnknown_08ADD6EC:  @ 0x08ADD6EC
	.incbin "baserom.gba", 0xADD6EC, 0x368

	.global gUnknown_08ADDA54
gUnknown_08ADDA54:  @ 0x08ADDA54
@ Replacing .incbin "baserom.gba", 0xADDA54, 0x20
    .4byte 0x63ff4f34
    .4byte 0x2a7d3b5f
    .4byte 0x2d6e25d3
    .4byte 0x264b28c9
    .4byte 0x15071586
    .4byte gUnknown_08B1FE7C + 0x62342
    .4byte 0x27ff10f1
    .4byte 0x7ffe7353

	.global gUnknown_08ADDA74
gUnknown_08ADDA74:  @ 0x08ADDA74
	.incbin "baserom.gba", 0xADDA74, 0x60C

	.global gUnknown_08ADE080
gUnknown_08ADE080:  @ 0x08ADE080
	.incbin "baserom.gba", 0xADE080, 0x3FC

	.global gUnknown_08ADE47C
gUnknown_08ADE47C:  @ 0x08ADE47C
@ Replacing .incbin "baserom.gba", 0xADE47C, 0x20
    .4byte 0x63ff4f34
    .4byte 0x2a7d3b5f
    .4byte 0x2d6e25d3
    .4byte 0x153d24a8
    .4byte pal_08AF47F0 + 0xc4c9
    .4byte 0x61627a08
    .4byte 0x6e4e7b35
    .4byte 0x7ffe3d8b

	.global gUnknown_08ADE49C
gUnknown_08ADE49C:  @ 0x08ADE49C
	.incbin "baserom.gba", 0xADE49C, 0x680

	.global gUnknown_08ADEB1C
gUnknown_08ADEB1C:  @ 0x08ADEB1C
	.incbin "baserom.gba", 0xADEB1C, 0x3B8

	.global gUnknown_08ADEED4
gUnknown_08ADEED4:  @ 0x08ADEED4
	.incbin "baserom.gba", 0xADEED4, 0x20

	.global gUnknown_08ADEEF4
gUnknown_08ADEEF4:  @ 0x08ADEEF4
	.incbin "baserom.gba", 0xADEEF4, 0x698

	.global gUnknown_08ADF58C
gUnknown_08ADF58C:  @ 0x08ADF58C
	.incbin "baserom.gba", 0xADF58C, 0x47C

	.global gUnknown_08ADFA08
gUnknown_08ADFA08:  @ 0x08ADFA08
@ Replacing .incbin "baserom.gba", 0xADFA08, 0x20
    .4byte 0x6fdf4f34
    .4byte 0x2e7d473f
    .4byte 0x2d6e25d3
    .4byte 0x14fd24a8
    .4byte 0x08900c79
    .4byte 0x31ff52ff
    .4byte 0x20ac27ff
    .4byte 0x67354e73

	.global gUnknown_08ADFA28
gUnknown_08ADFA28:  @ 0x08ADFA28
	.incbin "baserom.gba", 0xADFA28, 0x6BC

	.global gUnknown_08AE00E4
gUnknown_08AE00E4:  @ 0x08AE00E4
	.incbin "baserom.gba", 0xAE00E4, 0x3F0

	.global gUnknown_08AE04D4
gUnknown_08AE04D4:  @ 0x08AE04D4
	.incbin "baserom.gba", 0xAE04D4, 0x20

	.global gUnknown_08AE04F4
gUnknown_08AE04F4:  @ 0x08AE04F4
	.incbin "baserom.gba", 0xAE04F4, 0x554

	.global gUnknown_08AE0A48
gUnknown_08AE0A48:  @ 0x08AE0A48
	.incbin "baserom.gba", 0xAE0A48, 0x32C

	.global gUnknown_08AE0D74
gUnknown_08AE0D74:  @ 0x08AE0D74
	.incbin "baserom.gba", 0xAE0D74, 0x20

	.global gUnknown_08AE0D94
gUnknown_08AE0D94:  @ 0x08AE0D94
	.incbin "baserom.gba", 0xAE0D94, 0x528

	.global gUnknown_08AE12BC
gUnknown_08AE12BC:  @ 0x08AE12BC
	.incbin "baserom.gba", 0xAE12BC, 0x378

	.global gUnknown_08AE1634
gUnknown_08AE1634:  @ 0x08AE1634
	.incbin "baserom.gba", 0xAE1634, 0x20

	.global gUnknown_08AE1654
gUnknown_08AE1654:  @ 0x08AE1654
	.incbin "baserom.gba", 0xAE1654, 0x6AC

	.global gUnknown_08AE1D00
gUnknown_08AE1D00:  @ 0x08AE1D00
	.incbin "baserom.gba", 0xAE1D00, 0x3C4

	.global gUnknown_08AE20C4
gUnknown_08AE20C4:  @ 0x08AE20C4
	.incbin "baserom.gba", 0xAE20C4, 0x20

	.global gUnknown_08AE20E4
gUnknown_08AE20E4:  @ 0x08AE20E4
	.incbin "baserom.gba", 0xAE20E4, 0x738

	.global gUnknown_08AE281C
gUnknown_08AE281C:  @ 0x08AE281C
	.incbin "baserom.gba", 0xAE281C, 0x3D8

	.global gUnknown_08AE2BF4
gUnknown_08AE2BF4:  @ 0x08AE2BF4
    .incbin "baserom.gba", 0xAE2BF4, 0x20

	.global gUnknown_08AE2C14
gUnknown_08AE2C14:  @ 0x08AE2C14
	.incbin "baserom.gba", 0xAE2C14, 0x7C0

	.global gUnknown_08AE33D4
gUnknown_08AE33D4:  @ 0x08AE33D4
	.incbin "baserom.gba", 0xAE33D4, 0x360

	.global gUnknown_08AE3734
gUnknown_08AE3734:  @ 0x08AE3734
	.incbin "baserom.gba", 0xAE3734, 0x20

	.global gUnknown_08AE3754
gUnknown_08AE3754:  @ 0x08AE3754
	.incbin "baserom.gba", 0xAE3754, 0x700

	.global gUnknown_08AE3E54
gUnknown_08AE3E54:  @ 0x08AE3E54
	.incbin "baserom.gba", 0xAE3E54, 0x390

	.global gUnknown_08AE41E4
gUnknown_08AE41E4:  @ 0x08AE41E4
	.incbin "baserom.gba", 0xAE41E4, 0x20

	.global gUnknown_08AE4204
gUnknown_08AE4204:  @ 0x08AE4204
	.incbin "baserom.gba", 0xAE4204, 0x73C

	.global gUnknown_08AE4940
gUnknown_08AE4940:  @ 0x08AE4940
	.incbin "baserom.gba", 0xAE4940, 0x3A8

	.global gUnknown_08AE4CE8
gUnknown_08AE4CE8:  @ 0x08AE4CE8
	.incbin "baserom.gba", 0xAE4CE8, 0x20

	.global gUnknown_08AE4D08
gUnknown_08AE4D08:  @ 0x08AE4D08
	.incbin "baserom.gba", 0xAE4D08, 0x6C0

	.global gUnknown_08AE53C8
gUnknown_08AE53C8:  @ 0x08AE53C8
	.incbin "baserom.gba", 0xAE53C8, 0x368

	.global gUnknown_08AE5730
gUnknown_08AE5730:  @ 0x08AE5730
	.incbin "baserom.gba", 0xAE5730, 0x20

	.global gUnknown_08AE5750
gUnknown_08AE5750:  @ 0x08AE5750
	.incbin "baserom.gba", 0xAE5750, 0x604

	.global gUnknown_08AE5D54
gUnknown_08AE5D54:  @ 0x08AE5D54
	.incbin "baserom.gba", 0xAE5D54, 0x35C

	.global gUnknown_08AE60B0
gUnknown_08AE60B0:  @ 0x08AE60B0
	.incbin "baserom.gba", 0xAE60B0, 0x20

	.global gUnknown_08AE60D0
gUnknown_08AE60D0:  @ 0x08AE60D0
	.incbin "baserom.gba", 0xAE60D0, 0x578

	.global gUnknown_08AE6648
gUnknown_08AE6648:  @ 0x08AE6648
	.incbin "baserom.gba", 0xAE6648, 0x3A4

	.global gUnknown_08AE69EC
gUnknown_08AE69EC:  @ 0x08AE69EC
	.incbin "baserom.gba", 0xAE69EC, 0x20

	.global gUnknown_08AE6A0C
gUnknown_08AE6A0C:  @ 0x08AE6A0C
	.incbin "baserom.gba", 0xAE6A0C, 0x59C

	.global gUnknown_08AE6FA8
gUnknown_08AE6FA8:  @ 0x08AE6FA8
	.incbin "baserom.gba", 0xAE6FA8, 0x320

	.global gUnknown_08AE72C8
gUnknown_08AE72C8:  @ 0x08AE72C8
	.incbin "baserom.gba", 0xAE72C8, 0x20

	.global gUnknown_08AE72E8
gUnknown_08AE72E8:  @ 0x08AE72E8
	.incbin "baserom.gba", 0xAE72E8, 0x5C8

	.global gUnknown_08AE78B0
gUnknown_08AE78B0:  @ 0x08AE78B0
	.incbin "baserom.gba", 0xAE78B0, 0x37C

	.global gUnknown_08AE7C2C
gUnknown_08AE7C2C:  @ 0x08AE7C2C
	.incbin "baserom.gba", 0xAE7C2C, 0x20

	.global gUnknown_08AE7C4C
gUnknown_08AE7C4C:  @ 0x08AE7C4C
	.incbin "baserom.gba", 0xAE7C4C, 0x550

	.global gUnknown_08AE819C
gUnknown_08AE819C:  @ 0x08AE819C
	.incbin "baserom.gba", 0xAE819C, 0x320

	.global gUnknown_08AE84BC
gUnknown_08AE84BC:  @ 0x08AE84BC
	.incbin "baserom.gba", 0xAE84BC, 0x20

	.global gUnknown_08AE84DC
gUnknown_08AE84DC:  @ 0x08AE84DC
	.incbin "baserom.gba", 0xAE84DC, 0x5DC

	.global gUnknown_08AE8AB8
gUnknown_08AE8AB8:  @ 0x08AE8AB8
	.incbin "baserom.gba", 0xAE8AB8, 0x2CC

	.global gUnknown_08AE8D84
gUnknown_08AE8D84:  @ 0x08AE8D84
	.incbin "baserom.gba", 0xAE8D84, 0x20

	.global gUnknown_08AE8DA4
gUnknown_08AE8DA4:  @ 0x08AE8DA4
	.incbin "baserom.gba", 0xAE8DA4, 0x5C0

	.global gUnknown_08AE9364
gUnknown_08AE9364:  @ 0x08AE9364
	.incbin "baserom.gba", 0xAE9364, 0x3BC

	.global gUnknown_08AE9720
gUnknown_08AE9720:  @ 0x08AE9720
	.incbin "baserom.gba", 0xAE9720, 0x20

	.global gUnknown_08AE9740
gUnknown_08AE9740:  @ 0x08AE9740
	.incbin "baserom.gba", 0xAE9740, 0x564

	.global gUnknown_08AE9CA4
gUnknown_08AE9CA4:  @ 0x08AE9CA4
	.incbin "baserom.gba", 0xAE9CA4, 0x388

	.global gUnknown_08AEA02C
gUnknown_08AEA02C:  @ 0x08AEA02C
    .incbin "baserom.gba", 0xAEA02C, 0x20

	.global gUnknown_08AEA04C
gUnknown_08AEA04C:  @ 0x08AEA04C
	.incbin "baserom.gba", 0xAEA04C, 0x75C

	.global gUnknown_08AEA7A8
gUnknown_08AEA7A8:  @ 0x08AEA7A8
	.incbin "baserom.gba", 0xAEA7A8, 0x3A8

	.global gUnknown_08AEAB50
gUnknown_08AEAB50:  @ 0x08AEAB50
	.incbin "baserom.gba", 0xAEAB50, 0x20

	.global gUnknown_08AEAB70
gUnknown_08AEAB70:  @ 0x08AEAB70
	.incbin "baserom.gba", 0xAEAB70, 0x648

	.global gUnknown_08AEB1B8
gUnknown_08AEB1B8:  @ 0x08AEB1B8
	.incbin "baserom.gba", 0xAEB1B8, 0x3B4

	.global gUnknown_08AEB56C
gUnknown_08AEB56C:  @ 0x08AEB56C
	.incbin "baserom.gba", 0xAEB56C, 0x20

	.global gUnknown_08AEB58C
gUnknown_08AEB58C:  @ 0x08AEB58C
	.incbin "baserom.gba", 0xAEB58C, 0x760

	.global gUnknown_08AEBCEC
gUnknown_08AEBCEC:  @ 0x08AEBCEC
	.incbin "baserom.gba", 0xAEBCEC, 0x35C

	.global gUnknown_08AEC048
gUnknown_08AEC048:  @ 0x08AEC048
@ Replacing .incbin "baserom.gba", 0xAEC048, 0x20
    .4byte 0x63ff4f34
    .4byte 0x2a7d3b5f
    .4byte 0x2d6e25d3
    .4byte 0x77d24a8
    .4byte 0x15f306d9
    .4byte gUnknown_08B1FE7C + 0x1169c
    .4byte 0x2f3108ad
    .4byte 0x7ffe0de8

	.global gUnknown_08AEC068
gUnknown_08AEC068:  @ 0x08AEC068
	.incbin "baserom.gba", 0xAEC068, 0x6BC

	.global gUnknown_08AEC724
gUnknown_08AEC724:  @ 0x08AEC724
	.incbin "baserom.gba", 0xAEC724, 0x39C

	.global gUnknown_08AECAC0
gUnknown_08AECAC0:  @ 0x08AECAC0
	.incbin "baserom.gba", 0xAECAC0, 0x20

	.global gUnknown_08AECAE0
gUnknown_08AECAE0:  @ 0x08AECAE0
	.incbin "baserom.gba", 0xAECAE0, 0x5C4

	.global gUnknown_08AED0A4
gUnknown_08AED0A4:  @ 0x08AED0A4
	.incbin "baserom.gba", 0xAED0A4, 0x344

	.global gUnknown_08AED3E8
gUnknown_08AED3E8:  @ 0x08AED3E8
	.incbin "baserom.gba", 0xAED3E8, 0x20

	.global gUnknown_08AED408
gUnknown_08AED408:  @ 0x08AED408
	.incbin "baserom.gba", 0xAED408, 0x554

	.global gUnknown_08AED95C
gUnknown_08AED95C:  @ 0x08AED95C
	.incbin "baserom.gba", 0xAED95C, 0x324

	.global gUnknown_08AEDC80
gUnknown_08AEDC80:  @ 0x08AEDC80
	.incbin "baserom.gba", 0xAEDC80, 0x20

	.global gUnknown_08AEDCA0
gUnknown_08AEDCA0:  @ 0x08AEDCA0
	.incbin "baserom.gba", 0xAEDCA0, 0x578

	.global gUnknown_08AEE218
gUnknown_08AEE218:  @ 0x08AEE218
	.incbin "baserom.gba", 0xAEE218, 0x34C

	.global gUnknown_08AEE564
gUnknown_08AEE564:  @ 0x08AEE564
	.incbin "baserom.gba", 0xAEE564, 0x20

	.global gUnknown_08AEE584
gUnknown_08AEE584:  @ 0x08AEE584
	.incbin "baserom.gba", 0xAEE584, 0x62C

	.global gUnknown_08AEEBB0
gUnknown_08AEEBB0:  @ 0x08AEEBB0
	.incbin "baserom.gba", 0xAEEBB0, 0x31C

	.global gUnknown_08AEEECC
gUnknown_08AEEECC:  @ 0x08AEEECC
	.incbin "baserom.gba", 0xAEEECC, 0x20

	.global gUnknown_08AEEEEC
gUnknown_08AEEEEC:  @ 0x08AEEEEC
	.incbin "baserom.gba", 0xAEEEEC, 0x694

	.global gUnknown_08AEF580
gUnknown_08AEF580:  @ 0x08AEF580
	.incbin "baserom.gba", 0xAEF580, 0x300

	.global gUnknown_08AEF880
gUnknown_08AEF880:  @ 0x08AEF880
	.incbin "baserom.gba", 0xAEF880, 0x20

	.global gUnknown_08AEF8A0
gUnknown_08AEF8A0:  @ 0x08AEF8A0
	.incbin "baserom.gba", 0xAEF8A0, 0x528

	.global gUnknown_08AEFDC8
gUnknown_08AEFDC8:  @ 0x08AEFDC8
	.incbin "baserom.gba", 0xAEFDC8, 0x368

	.global gUnknown_08AF0130
gUnknown_08AF0130:  @ 0x08AF0130
	.incbin "baserom.gba", 0xAF0130, 0x20

	.global gUnknown_08AF0150
gUnknown_08AF0150:  @ 0x08AF0150
	.incbin "baserom.gba", 0xAF0150, 0x894

	.global gUnknown_08AF09E4
gUnknown_08AF09E4:  @ 0x08AF09E4
	.incbin "baserom.gba", 0xAF09E4, 0x404

	.global gUnknown_08AF0DE8
gUnknown_08AF0DE8:  @ 0x08AF0DE8
	.incbin "baserom.gba", 0xAF0DE8, 0x20

	.global gUnknown_08AF0E08
gUnknown_08AF0E08:  @ 0x08AF0E08
	.incbin "baserom.gba", 0xAF0E08, 0x8C4

	.global gUnknown_08AF16CC
gUnknown_08AF16CC:  @ 0x08AF16CC
	.incbin "baserom.gba", 0xAF16CC, 0x3FC

	.global gUnknown_08AF1AC8
gUnknown_08AF1AC8:  @ 0x08AF1AC8
	.incbin "baserom.gba", 0xAF1AC8, 0x20

	.global gUnknown_08AF1AE8
gUnknown_08AF1AE8:  @ 0x08AF1AE8
	.incbin "baserom.gba", 0xAF1AE8, 0x30

	.global gUnknown_08AF1B18
gUnknown_08AF1B18:  @ 0x08AF1B18
	.incbin "baserom.gba", 0xAF1B18, 0x20

	.global gUnknown_08AF1B38
gUnknown_08AF1B38:  @ 0x08AF1B38
	.incbin "baserom.gba", 0xAF1B38, 0x478

	.global gUnknown_08AF1FB0
gUnknown_08AF1FB0:  @ 0x08AF1FB0
	.incbin "baserom.gba", 0xAF1FB0, 0x20

	.global gUnknown_08AF1FD0
gUnknown_08AF1FD0:  @ 0x08AF1FD0
	.incbin "baserom.gba", 0xAF1FD0, 0x664

	.global gUnknown_08AF2634
gUnknown_08AF2634:  @ 0x08AF2634
	.incbin "baserom.gba", 0xAF2634, 0x20

	.global gUnknown_08AF2654
gUnknown_08AF2654:  @ 0x08AF2654
	.incbin "baserom.gba", 0xAF2654, 0xAB8

	.global gUnknown_08AF310C
gUnknown_08AF310C:  @ 0x08AF310C
@ Replacing .incbin "baserom.gba", 0xAF310C, 0x20
    .4byte 0x1a5f0200
    .4byte 0xd7f15ff
    .4byte gUnknown_0895F5A5 + 0x41319
    .4byte 0x140876
    .4byte 0x44e0851
    .4byte 0x2a044c
    .4byte 0x50027
    .4byte 0x10003

	.global gUnknown_08AF312C
gUnknown_08AF312C:  @ 0x08AF312C
	.incbin "baserom.gba", 0xAF312C, 0xF20

	.global gUnknown_08AF404C
gUnknown_08AF404C:  @ 0x08AF404C
	.incbin "baserom.gba", 0xAF404C, 0x2E4

	.global gUnknown_08AF4330
gUnknown_08AF4330:  @ 0x08AF4330
	.incbin "baserom.gba", 0xAF4330, 0x4C0
