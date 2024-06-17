    .section .data

	.global Img_PrepHelpButtonSprites
Img_PrepHelpButtonSprites:  @ 0x08A199C8
	.incbin "baserom.gba", 0xA199C8, 0x244

	.global Img_MenuScrollBar
Img_MenuScrollBar:  @ 0x08A19C0C
	.incbin "baserom.gba", 0xA19C0C, 0xA0

	.global Pal_MenuScrollBar
Pal_MenuScrollBar:  @ 0x08A19CAC
	.incbin "baserom.gba", 0xA19CAC, 0x20

	.global gUnknown_08A19CCC
gUnknown_08A19CCC:  @ 0x08A19CCC
	.incbin "baserom.gba", 0xA19CCC, 0x3B8

	.global Pal_SpinningArrow
Pal_SpinningArrow:  @ 0x08A1A084
	.incbin "baserom.gba", 0xA1A084, 0x20

	.global gUnknown_08A1A0A4
gUnknown_08A1A0A4:  @ 0x08A1A0A4
	.incbin "baserom.gba", 0xA1A0A4, 0x198

	.global gUnknown_08A1A23C
gUnknown_08A1A23C:  @ 0x08A1A23C
	.incbin "baserom.gba", 0xA1A23C, 0x1C0

	.global gUnknown_08A1A3FC
gUnknown_08A1A3FC:  @ 0x08A1A3FC
@ Replacing .incbin "baserom.gba", 0xA1A3FC, 0x20
    .4byte 0x5ab50000
    .4byte 0x2508462f
    .4byte 0x26b50000
    .4byte 0x8A708A7 + 0xa5
    .4byte 0x59400956
    .4byte 0x394e520e
    .4byte 0x32ca01a1
    .4byte 0x30a5

	.global Tsa_08A1A41C
Tsa_08A1A41C:  @ 0x08A1A41C
	.incbin "baserom.gba", 0xA1A41C, 0x18

	.global Tsa_08A1A434
Tsa_08A1A434:  @ 0x08A1A434
	.incbin "baserom.gba", 0xA1A434, 0x40

	.global Tsa_08A1A474
Tsa_08A1A474:  @ 0x08A1A474
	.incbin "baserom.gba", 0xA1A474, 0x54

	.global gUnknown_08A1A4C8
gUnknown_08A1A4C8:  @ 0x08A1A4C8
	.incbin "baserom.gba", 0xA1A4C8, 0x41C

	.global gGfx_SupportScreenBanner
gGfx_SupportScreenBanner:  @ 0x08A1A8E4
	.incbin "baserom.gba", 0xA1A8E4, 0x3A4

	.global gUnknown_08A1AC88
gUnknown_08A1AC88:  @ 0x08A1AC88
	.incbin "baserom.gba", 0xA1AC88, 0x450

	.global Img_SysBrownBox
Img_SysBrownBox:  @ 0x08A1B0D8
	.incbin "./graphics/sysutils/Img_SysBrownBox.4bpp.lz"

	.global Pal_SysBrownBox
Pal_SysBrownBox:  @ 0x08A1B154
	.incbin "./graphics/sysutils/Img_SysBrownBox.gbapal", 0x0, 0x20

	.global gPal_SupportScreenBanner
gPal_SupportScreenBanner:  @ 0x08A1B174
	.incbin "baserom.gba", 0xA1B174, 0x20

	.global gUnknown_08A1B194
gUnknown_08A1B194:  @ 0x08A1B194
	.incbin "baserom.gba", 0xA1B194, 0x68

	.global gUnknown_08A1B1FC
gUnknown_08A1B1FC:  @ 0x08A1B1FC
	.incbin "baserom.gba", 0xA1B1FC, 0x43C

	.global gUnknown_08A1B638
gUnknown_08A1B638:  @ 0x08A1B638
	.incbin "baserom.gba", 0xA1B638, 0x20

	.global gUnknown_08A1B658
gUnknown_08A1B658:  @ 0x08A1B658
	.incbin "baserom.gba", 0xA1B658, 0x40

	.global gUnknown_08A1B698
gUnknown_08A1B698:  @ 0x08A1B698
	.incbin "baserom.gba", 0xA1B698, 0x98

	.global gUnknown_08A1B730
gUnknown_08A1B730:  @ 0x08A1B730
	.incbin "baserom.gba", 0xA1B730, 0x98

	.global gUnknown_08A1B7C8
gUnknown_08A1B7C8:  @ 0x08A1B7C8
	.incbin "baserom.gba", 0xA1B7C8, 0xF0

	.global gUnknown_08A1B8B8
gUnknown_08A1B8B8:  @ 0x08A1B8B8
	.incbin "baserom.gba", 0xA1B8B8, 0xD8

	.global gUnknown_08A1B990
gUnknown_08A1B990:  @ 0x08A1B990
	.incbin "baserom.gba", 0xA1B990, 0x5C

	.global gUnknown_08A1B9EC
gUnknown_08A1B9EC:  @ 0x08A1B9EC
	.incbin "baserom.gba", 0xA1B9EC, 0xCC

	.global Img_PrepItemUseScreen
Img_PrepItemUseScreen:  @ 0x08A1BAB8
	.incbin "baserom.gba", 0xA1BAB8, 0x2C

	.global Tsa_PrepItemUseScreen
Tsa_PrepItemUseScreen:  @ 0x08A1BAE4
	.incbin "baserom.gba", 0xA1BAE4, 0xEC

	.global gUnknown_08A1BBD0
gUnknown_08A1BBD0:  @ 0x08A1BBD0
	.incbin "baserom.gba", 0xA1BBD0, 0xF0

	.global gUnknown_08A1BCC0
gUnknown_08A1BCC0:  @ 0x08A1BCC0
	.incbin "baserom.gba", 0xA1BCC0, 0x40

	.global gUnknown_08A1BD00
gUnknown_08A1BD00:  @ 0x08A1BD00
	.incbin "baserom.gba", 0xA1BD00, 0x40

	.global gUnknown_08A1BD40
gUnknown_08A1BD40:  @ 0x08A1BD40
	.incbin "baserom.gba", 0xA1BD40, 0x20

	.global gUnknown_08A1BD60
gUnknown_08A1BD60:  @ 0x08A1BD60
	.incbin "baserom.gba", 0xA1BD60, 0x9A4

	.global Img_SpinningArrow
Img_SpinningArrow:  @ 0x08A1C704
	.incbin "baserom.gba", 0xA1C704, 0xD4

	.global gImg_UiSpinningArrow_Horizontal
gImg_UiSpinningArrow_Horizontal:  @ 0x08A1C7D8
	.incbin "baserom.gba", 0xA1C7D8, 0xDC

	.global gUnknown_08A1C8B4
gUnknown_08A1C8B4:  @ 0x08A1C8B4
	.incbin "baserom.gba", 0xA1C8B4, 0x4B4

	.global Img_08A1CD68
Img_08A1CD68:  @ 0x08A1CD68
	.incbin "baserom.gba", 0xA1CD68, 0x5C

	.global Img_UnitListBanners
Img_UnitListBanners:  @ 0x08A1CDC4
	.incbin "baserom.gba", 0xA1CDC4, 0x4C4

	.global Img_UnitListBanner_Animation
Img_UnitListBanner_Animation:  @ 0x08A1D288
	.incbin "baserom.gba", 0xA1D288, 0x1C0

	.global Pal_08A1D448
Pal_08A1D448:  @ 0x08A1D448
	.incbin "baserom.gba", 0xA1D448, 0x80

	.global gUnknown_08A1D4C8
gUnknown_08A1D4C8:  @ 0x08A1D4C8
	.incbin "baserom.gba", 0xA1D4C8, 0x20

	.global Img_PrepTextShadow
Img_PrepTextShadow:  @ 0x08A1D4E8
	.incbin "baserom.gba", 0xA1D4E8, 0x28

	.global gUnknown_08A1D510
gUnknown_08A1D510:  @ 0x08A1D510
	.incbin "baserom.gba", 0xA1D510, 0x28C

	.global Pal_MapBattleInfoNum
Pal_MapBattleInfoNum:  @ 0x08A1D79C
	.incbin "baserom.gba", 0xA1D79C, 0x40

	.global Img_PrepPopupWindow
Img_PrepPopupWindow:  @ 0x08A1D7DC
	.incbin "baserom.gba", 0xA1D7DC, 0x74

	.global Pal_08A1D850
Pal_08A1D850:  @ 0x08A1D850
	.incbin "baserom.gba", 0xA1D850, 0x20

	.global Pal_08A1D870
Pal_08A1D870:  @ 0x08A1D870
	.incbin "baserom.gba", 0xA1D870, 0x20

	.global Pal_08A1D890
Pal_08A1D890:  @ 0x08A1D890
	.incbin "baserom.gba", 0xA1D890, 0x20

	.global Pal_08A1D8B0
Pal_08A1D8B0:  @ 0x08A1D8B0
	.incbin "baserom.gba", 0xA1D8B0, 0x20

	.global Img_PrepWindow
Img_PrepWindow:  @ 0x08A1D8D0
	.incbin "baserom.gba", 0xA1D8D0, 0x2B0

	.global gUnknown_08A1DB80
gUnknown_08A1DB80:  @ 0x08A1DB80
	.incbin "baserom.gba", 0xA1DB80, 0x9C

	.global gTsa_SupportSubScreen
gTsa_SupportSubScreen:  @ 0x08A1DC1C
	.incbin "baserom.gba", 0xA1DC1C, 0xF0

	.global gGfx_SupportMenu
gGfx_SupportMenu:  @ 0x08A1DD0C
	.incbin "baserom.gba", 0xA1DD0C, 0x3CC

	.global gPal_SupportMenu
gPal_SupportMenu:  @ 0x08A1E0D8
@ Replacing .incbin "baserom.gba", 0xA1E0D8, 0x1A1C
    .4byte 0x14c7520e
    .4byte 0x2d2628e4
    .4byte 0x3d8a3548
    .4byte 0x4a0e41cc
    .4byte 0x56925250
    .4byte 0x7fff14c7
    .4byte 0x52d7677d
    .4byte 0x3e11
