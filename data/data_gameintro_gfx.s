	.section .data

	.global pal_08AF47F0
pal_08AF47F0:  @ 0x08AF47F0
	.incbin "baserom.gba", 0xAF47F0, 0x80

	.global img_gameintro1
img_gameintro1:
	.incbin "baserom.gba", 0xAF4870, 0xAF4C9C - 0xAF4870

	.global tsa_gameintro1
tsa_gameintro1:
	.incbin "baserom.gba", 0xAF4C9C, 0xAF4CD8 - 0xAF4C9C

	.global img_gameintro2
img_gameintro2:
	.incbin "baserom.gba", 0xAF4CD8, 0xAF5100 - 0xAF4CD8

	.global tsa_gameintro2
tsa_gameintro2:
	.incbin "baserom.gba", 0xAF5100, 0xAF513C - 0xAF5100

	.global img_gameintro3
img_gameintro3:
	.incbin "baserom.gba", 0xAF513C, 0xAF5578 - 0xAF513C

	.global tsa_gameintro3
tsa_gameintro3:
	.incbin "baserom.gba", 0xAF5578, 0xAF55B4 - 0xAF5578

	.global img_gameintro4
img_gameintro4:
	.incbin "baserom.gba", 0xAF55B4, 0xAF59EC - 0xAF55B4

	.global tsa_gameintro4
tsa_gameintro4:
	.incbin "baserom.gba", 0xAF59EC, 0xAF5A28 - 0xAF59EC

	.global img_gameintro5
img_gameintro5:
	.incbin "baserom.gba", 0xAF5A28, 0xAF5E5C - 0xAF5A28

	.global tsa_gameintro5
tsa_gameintro5:
	.incbin "baserom.gba", 0xAF5E5C, 0xAF5E98 - 0xAF5E5C

	.global img_gameintro6
img_gameintro6:
	.incbin "baserom.gba", 0xAF5E98, 0xAF62CC - 0xAF5E98

	.global tsa_gameintro6
tsa_gameintro6:
	.incbin "baserom.gba", 0xAF62CC, 0xAF6308 - 0xAF62CC

	.global img_gameintro7
img_gameintro7:
	.incbin "baserom.gba", 0xAF6308, 0xAF6744 - 0xAF6308

	.global tsa_gameintro7
tsa_gameintro7:
	.incbin "baserom.gba", 0xAF6744, 0xAF6780 - 0xAF6744

	.global img_gameintro8
img_gameintro8:
	.incbin "baserom.gba", 0xAF6780, 0xAF6BBC - 0xAF6780

	.global tsa_gameintro8
tsa_gameintro8:
	.incbin "baserom.gba", 0xAF6BBC, 0xAF6BF8 - 0xAF6BBC

	.global img_gameintro9
img_gameintro9:
	.incbin "baserom.gba", 0xAF6BF8, 0xAF7034 - 0xAF6BF8

	.global tsa_gameintro9
tsa_gameintro9:
	.incbin "baserom.gba", 0xAF7034, 0xAF7070 - 0xAF7034

	.global img_gameintro10
img_gameintro10:
	.incbin "baserom.gba", 0xAF7070, 0xAF74AC - 0xAF7070

	.global tsa_gameintro10
tsa_gameintro10:
	.incbin "baserom.gba", 0xAF74AC, 0xAF74E8 - 0xAF74AC

	.global img_gameintro11
img_gameintro11:
	.incbin "baserom.gba", 0xAF74E8, 0xAF7960 - 0xAF74E8

	.global img_gameintro12
img_gameintro12:
	.incbin "baserom.gba", 0xAF7960, 0xAF7DD4 - 0xAF7960

	.global img_gameintro13
img_gameintro13:
	.incbin "baserom.gba", 0xAF7DD4, 0xAF824C - 0xAF7DD4

	.global img_gameintro14
img_gameintro14:
	.incbin "baserom.gba", 0xAF824C, 0xAF86C4 - 0xAF824C

	.global img_gameintro15
img_gameintro15:
	.incbin "baserom.gba", 0xAF86C4, 0xAF8B38 - 0xAF86C4

	.global img_gameintro16
img_gameintro16:
	.incbin "baserom.gba", 0xAF8B38, 0xAF8FB0 - 0xAF8B38

	.global img_gameintro17
img_gameintro17:
	.incbin "baserom.gba", 0xAF8FB0, 0xAF9428 - 0xAF8FB0

	.global img_gameintro18
img_gameintro18:
	.incbin "baserom.gba", 0xAF9428, 0xAF98A0 - 0xAF9428

	.global img_gameintro19
img_gameintro19:
	.incbin "baserom.gba", 0xAF98A0, 0xAF9D18 - 0xAF98A0

	.global img_gameintro20
img_gameintro20:
	.incbin "baserom.gba", 0xAF9D18, 0xAFA190 - 0xAF9D18

	.global img_gameintro21
img_gameintro21:
	.incbin "baserom.gba", 0xAFA190, 0xAFA608 - 0xAFA190

	.global img_gameintro22
img_gameintro22:
	.incbin "baserom.gba", 0xAFA608, 0xAFAA80 - 0xAFA608

	.global img_gameintro23
img_gameintro23:
	.incbin "baserom.gba", 0xAFAA80, 0xAFAEF8 - 0xAFAA80

	.global img_gameintro24
img_gameintro24:
	.incbin "baserom.gba", 0xAFAEF8, 0xAFB370 - 0xAFAEF8

	.global img_gameintro25
img_gameintro25:
	.incbin "baserom.gba", 0xAFB370, 0xAFB7E8 - 0xAFB370

	.global img_gameintro26
img_gameintro26:
	.incbin "baserom.gba", 0xAFB7E8, 0xAFBC60 - 0xAFB7E8

	.global img_gameintro27
img_gameintro27:
	.incbin "baserom.gba", 0xAFBC60, 0xAFC0D4 - 0xAFBC60

	.global img_gameintro28
img_gameintro28:
	.incbin "baserom.gba", 0xAFC0D4, 0xAFC548 - 0xAFC0D4

	.global img_gameintro29
img_gameintro29:
	.incbin "baserom.gba", 0xAFC548, 0xAFC9B4 - 0xAFC548

	.global img_gameintro30
img_gameintro30:
	.incbin "baserom.gba", 0xAFC9B4, 0xAFCE28 - 0xAFC9B4

	.global img_gameintro31
img_gameintro31:
	.incbin "baserom.gba", 0xAFCE28, 0xAFD29C - 0xAFCE28

	.global img_gameintro32
img_gameintro32:
	.incbin "baserom.gba", 0xAFD29C, 0xAFD700 - 0xAFD29C

	.global img_gameintro33
img_gameintro33:
	.incbin "baserom.gba", 0xAFD700, 0xAFDB64 - 0xAFD700

	.global img_gameintro34
img_gameintro34:
	.incbin "baserom.gba", 0xAFDB64, 0xAFDFD4 - 0xAFDB64

	.global img_gameintro35
img_gameintro35:
	.incbin "baserom.gba", 0xAFDFD4, 0xAFE448 - 0xAFDFD4

	.global img_gameintro36
img_gameintro36:
	.incbin "baserom.gba", 0xAFE448, 0xAFE8BC - 0xAFE448

	.global img_gameintro37
img_gameintro37:
	.incbin "baserom.gba", 0xAFE8BC, 0xAFED30 - 0xAFE8BC

	.global img_gameintro38
img_gameintro38:
	.incbin "baserom.gba", 0xAFED30, 0xAFF1A8 - 0xAFED30

	.global img_gameintro39
img_gameintro39:
	.incbin "baserom.gba", 0xAFF1A8, 0xAFF618 - 0xAFF1A8

	.global img_gameintro40
img_gameintro40:
	.incbin "baserom.gba", 0xAFF618, 0xAFFA80 - 0xAFF618

	.global img_gameintro41
img_gameintro41:
	.incbin "baserom.gba", 0xAFFA80, 0xAFFEE8 - 0xAFFA80

	.global img_gameintro42
img_gameintro42:
	.incbin "baserom.gba", 0xAFFEE8, 0xB00358 - 0xAFFEE8

	.global img_gameintro43
img_gameintro43:
	.incbin "baserom.gba", 0xB00358, 0xB007D0 - 0xB00358

	.global img_gameintro44
img_gameintro44:
	.incbin "baserom.gba", 0xB007D0, 0xB00C48 - 0xB007D0

	.global img_gameintro45
img_gameintro45:
	.incbin "baserom.gba", 0xB00C48, 0xB010B8 - 0xB00C48

	.global img_gameintro46
img_gameintro46:
	.incbin "baserom.gba", 0xB010B8, 0xB0152C - 0xB010B8

	.global img_gameintro47
img_gameintro47:
	.incbin "baserom.gba", 0xB0152C, 0xB019A4 - 0xB0152C

	.global img_gameintro48
img_gameintro48:
	.incbin "baserom.gba", 0xB019A4, 0xB01E18 - 0xB019A4

	.global img_gameintro49
img_gameintro49:
	.incbin "baserom.gba", 0xB01E18, 0xB02280 - 0xB01E18

	.global img_gameintro50
img_gameintro50:
	.incbin "baserom.gba", 0xB02280, 0xB026F4 - 0xB02280

	.global img_gameintro51
img_gameintro51:
	.incbin "baserom.gba", 0xB026F4, 0xB02B5C - 0xB026F4

	.global img_gameintro52
img_gameintro52:
	.incbin "baserom.gba", 0xB02B5C, 0xB02FCC - 0xB02B5C

	.global img_gameintro53
img_gameintro53:
	.incbin "baserom.gba", 0xB02FCC, 0xB03438 - 0xB02FCC

	.global img_gameintro54
img_gameintro54:
	.incbin "baserom.gba", 0xB03438, 0xB038AC - 0xB03438

	.global img_gameintro55
img_gameintro55:
	.incbin "baserom.gba", 0xB038AC, 0xB03D1C - 0xB038AC

	.global img_gameintro56
img_gameintro56:
	.incbin "baserom.gba", 0xB03D1C, 0xB04194 - 0xB03D1C

	.global img_gameintro57
img_gameintro57:
	.incbin "baserom.gba", 0xB04194, 0xB0460C - 0xB04194

	.global img_gameintro58
img_gameintro58:
	.incbin "baserom.gba", 0xB0460C, 0xB04A84 - 0xB0460C

	.global img_gameintro59
img_gameintro59:
	.incbin "baserom.gba", 0xB04A84, 0xB04EF0 - 0xB04A84

	.global img_gameintro60
img_gameintro60:
	.incbin "baserom.gba", 0xB04EF0, 0xB05364 - 0xB04EF0

	.global img_gameintro61
img_gameintro61:
	.incbin "baserom.gba", 0xB05364, 0xB057D0 - 0xB05364

	.global img_gameintro62
img_gameintro62:
	.incbin "baserom.gba", 0xB057D0, 0xB05C38 - 0xB057D0

	.global img_gameintro63
img_gameintro63:
	.incbin "baserom.gba", 0xB05C38, 0xB060AC - 0xB05C38

	.global img_gameintro64
img_gameintro64:
	.incbin "baserom.gba", 0xB060AC, 0xB06524 - 0xB060AC

	.global img_gameintro65
img_gameintro65:
	.incbin "baserom.gba", 0xB06524, 0xB0699C - 0xB06524

	.global img_gameintro66
img_gameintro66:
	.incbin "baserom.gba", 0xB0699C, 0xB06E10 - 0xB0699C

	.global img_gameintro67
img_gameintro67:
	.incbin "baserom.gba", 0xB06E10, 0xB07280 - 0xB06E10

	.global img_gameintro68
img_gameintro68:
	.incbin "baserom.gba", 0xB07280, 0xB076F0 - 0xB07280

	.global img_gameintro69
img_gameintro69:
	.incbin "baserom.gba", 0xB076F0, 0xB07B68 - 0xB076F0

	.global img_gameintro70
img_gameintro70:
	.incbin "baserom.gba", 0xB07B68, 0xB07FD0 - 0xB07B68

	.global img_gameintro71
img_gameintro71:
	.incbin "baserom.gba", 0xB07FD0, 0xB08440 - 0xB07FD0

	.global img_gameintro72
img_gameintro72:
	.incbin "baserom.gba", 0xB08440, 0xB088B8 - 0xB08440

	.global img_gameintro73
img_gameintro73:
	.incbin "baserom.gba", 0xB088B8, 0xB08D30 - 0xB088B8

	.global img_gameintro74
img_gameintro74:
	.incbin "baserom.gba", 0xB08D30, 0xB0919C - 0xB08D30

	.global img_gameintro75
img_gameintro75:
	.incbin "baserom.gba", 0xB0919C, 0xB0960C - 0xB0919C

	.global img_gameintro76
img_gameintro76:
	.incbin "baserom.gba", 0xB0960C, 0xB09A84 - 0xB0960C

	.global img_gameintro77
img_gameintro77:
	.incbin "baserom.gba", 0xB09A84, 0xB09EF8 - 0xB09A84

	.global img_gameintro78
img_gameintro78:
	.incbin "baserom.gba", 0xB09EF8, 0xB0A370 - 0xB09EF8

	.global img_gameintro79
img_gameintro79:
	.incbin "baserom.gba", 0xB0A370, 0xB0A7E4 - 0xB0A370

	.global img_gameintro80
img_gameintro80:
	.incbin "baserom.gba", 0xB0A7E4, 0xB0AC5C - 0xB0A7E4

	.global img_gameintro81
img_gameintro81:
	.incbin "baserom.gba", 0xB0AC5C, 0xB0B0D4 - 0xB0AC5C

	.global img_gameintro82
img_gameintro82:
	.incbin "baserom.gba", 0xB0B0D4, 0xB0B544 - 0xB0B0D4

	.global img_gameintro83
img_gameintro83:
	.incbin "baserom.gba", 0xB0B544, 0xB0B9B8 - 0xB0B544

	.global img_gameintro84
img_gameintro84:
	.incbin "baserom.gba", 0xB0B9B8, 0xB0BE30 - 0xB0B9B8

	.global img_gameintro85
img_gameintro85:
	.incbin "baserom.gba", 0xB0BE30, 0xB0C2A4 - 0xB0BE30

	.global img_gameintro86
img_gameintro86:
	.incbin "baserom.gba", 0xB0C2A4, 0xB0C718 - 0xB0C2A4

	.global img_gameintro87
img_gameintro87:
	.incbin "baserom.gba", 0xB0C718, 0xB0CB88 - 0xB0C718

	.global img_gameintro88
img_gameintro88:
	.incbin "baserom.gba", 0xB0CB88, 0xB0CFFC - 0xB0CB88

	.global img_gameintro89
img_gameintro89:
	.incbin "baserom.gba", 0xB0CFFC, 0xB0D434 - 0xB0CFFC

	.global img_gameintro90
img_gameintro90:
	.incbin "baserom.gba", 0xB0D434, 0xB0D89C - 0xB0D434

	.global img_gameintro91
img_gameintro91:
	.incbin "baserom.gba", 0xB0D89C, 0xB0DCE4 - 0xB0D89C

	.global img_gameintro92
img_gameintro92:
	.incbin "baserom.gba", 0xB0DCE4, 0xB0E110 - 0xB0DCE4

	.global img_gameintro93
img_gameintro93:
	.incbin "baserom.gba", 0xB0E110, 0xB0E584 - 0xB0E110

	.global img_gameintro94
img_gameintro94:
	.incbin "baserom.gba", 0xB0E584, 0xB0E9E0 - 0xB0E584

	.global img_gameintro95
img_gameintro95:
	.incbin "baserom.gba", 0xB0E9E0, 0xB0EE54 - 0xB0E9E0

	.global img_gameintro96
img_gameintro96:
	.incbin "baserom.gba", 0xB0EE54, 0xB0F2A0 - 0xB0EE54

	.global img_gameintro97
img_gameintro97:
	.incbin "baserom.gba", 0xB0F2A0, 0xB0F718 - 0xB0F2A0

	.global img_gameintro98
img_gameintro98:
	.incbin "baserom.gba", 0xB0F718, 0xB0FB1C - 0xB0F718

	.global img_gameintro99
img_gameintro99:
	.incbin "baserom.gba", 0xB0FB1C, 0xB0FF6C - 0xB0FB1C

	.global img_gameintro100
img_gameintro100:
	.incbin "baserom.gba", 0xB0FF6C, 0xB103D8 - 0xB0FF6C

	.global gUnknown_08B103D8
gUnknown_08B103D8:  @ 0x08B103D8
	.incbin "baserom.gba", 0xB103D8, 0x100

	.global gUnknown_08B104D8
gUnknown_08B104D8:  @ 0x08B104D8
	.incbin "baserom.gba", 0xB104D8, 0x158

	.global gUnknown_08B10630
gUnknown_08B10630:  @ 0x08B10630
	.incbin "baserom.gba", 0xB10630, 0x48C

	.global gUnknown_08B10ABC
gUnknown_08B10ABC:  @ 0x08B10ABC
	.incbin "baserom.gba", 0xB10ABC, 0x20

	.global gUnknown_08B10ADC
gUnknown_08B10ADC:  @ 0x08B10ADC
	.incbin "baserom.gba", 0xB10ADC, 0x1C8

	.global gUnknown_08B10CA4
gUnknown_08B10CA4:  @ 0x08B10CA4
	.incbin "baserom.gba", 0xB10CA4, 0xBC0

	.global gUnknown_08B11864
gUnknown_08B11864:  @ 0x08B11864
	.incbin "baserom.gba", 0xB11864, 0x60

	.global gUnknown_08B118C4
gUnknown_08B118C4:  @ 0x08B118C4
	.incbin "baserom.gba", 0xB118C4, 0x348

	.global gUnknown_08B11C0C
gUnknown_08B11C0C:  @ 0x08B11C0C
	.incbin "baserom.gba", 0xB11C0C, 0x100

	.global gUnknown_08B11D0C
gUnknown_08B11D0C:  @ 0x08B11D0C
	.incbin "baserom.gba", 0xB11D0C, 0x8E8

	.global gUnknown_08B125F4
gUnknown_08B125F4:  @ 0x08B125F4
	.incbin "baserom.gba", 0xB125F4, 0x20