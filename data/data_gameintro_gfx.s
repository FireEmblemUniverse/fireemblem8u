	.section .data

	.global pal_08AF47F0
pal_08AF47F0:  @ 0x08AF47F0
	.incbin "baserom.gba", 0xAF47F0, 0x80

	.global img_gameintro1
img_gameintro1:
	.incbin "baserom.gba", 0xAF4870, 0xAF4CD8 - 0xAF4870

	.global img_gameintro2
img_gameintro2:
	.incbin "baserom.gba", 0xAF4CD8, 0xAF513C - 0xAF4CD8

	.global img_gameintro3
img_gameintro3:
	.incbin "baserom.gba", 0xAF513C, 0xAF55B4 - 0xAF513C

	.global img_gameintro4
img_gameintro4:
	.incbin "baserom.gba", 0xAF55B4, 0xAF5A28 - 0xAF55B4

	.global img_gameintro5
img_gameintro5:
	.incbin "baserom.gba", 0xAF5A28, 0xAF5E98 - 0xAF5A28

	.global img_gameintro6
img_gameintro6:
	.incbin "baserom.gba", 0xAF5E98, 0xAF6308 - 0xAF5E98

	.global img_gameintro7
img_gameintro7:
	.incbin "baserom.gba", 0xAF6308, 0xAF6780 - 0xAF6308

	.global img_gameintro8
img_gameintro8:
	.incbin "baserom.gba", 0xAF6780, 0xAF6BF8 - 0xAF6780

	.global img_gameintro9
img_gameintro9:
	.incbin "baserom.gba", 0xAF6BF8, 0xAF7070 - 0xAF6BF8

	.global img_gameintro10
img_gameintro10:
	.incbin "baserom.gba", 0xAF7070, 0xAF74E8 - 0xAF7070

	.global img_gameintro11
img_gameintro11:
	.incbin "baserom.gba", 0xAF74E8, 0xAF7960 - 0xAF74E8

	.global img_gameintro12
img_gameintro12:
	.incbin "baserom.gba", 0xAF7960, 0xAF7DD4 - 0xAF7960

	.global img_gameintro13
img_gameintro13:
	.incbin "baserom.gba", 0xAF7DD4, 0xB103D8 - 0xAF7DD4

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
