    .section .data

@ UI GRAPHICS DATA

	.global gUiFrameImage
gUiFrameImage:  @ 0x085B65C0
	.incbin "baserom.gba", 0x5B65C0, 0x5F4

	.global gUiFramePaletteA
gUiFramePaletteA:  @ 0x085B6BB4
	.incbin "baserom.gba", 0x5B6BB4, 0x20

	.global gUiFramePaletteB
gUiFramePaletteB:  @ 0x085B6BD4
	.incbin "baserom.gba", 0x5B6BD4, 0x20

	.global gUiFramePaletteC
gUiFramePaletteC:  @ 0x085B6BF4
	.incbin "baserom.gba", 0x5B6BF4, 0x20

	.global gUiFramePaletteD
gUiFramePaletteD:  @ 0x085B6C14
	.incbin "baserom.gba", 0x5B6C14, 0xA0

	.global gLegacyUiFrameAImage
gLegacyUiFrameAImage:  @ 0x085B6CB4
	.incbin "baserom.gba", 0x5B6CB4, 0x8AC

	.global gLegacyUiFrameAPalette
gLegacyUiFrameAPalette:  @ 0x085B7560
	.incbin "baserom.gba", 0x5B7560, 0x20

	.global gUiBarPaletteA
gUiBarPaletteA:  @ 0x085B7580
	.incbin "baserom.gba", 0x5B7580, 0x20

	.global gLegacyUiFrameBImage
gLegacyUiFrameBImage:  @ 0x085B75A0
	.incbin "baserom.gba", 0x5B75A0, 0x8B4

	.global gLegacyUiFrameBPalette
gLegacyUiFrameBPalette:  @ 0x085B7E54
	.incbin "baserom.gba", 0x5B7E54, 0x20

	.global gUiBarPaletteB
gUiBarPaletteB:  @ 0x085B7E74
	.incbin "baserom.gba", 0x5B7E74, 0x20

	.global gLegacyUiFrameCImage
gLegacyUiFrameCImage:  @ 0x085B7E94
	.incbin "baserom.gba", 0x5B7E94, 0x880

	.global gLegacyUiFrameCPalette
gLegacyUiFrameCPalette:
	.incbin "baserom.gba", 0x5B8714, 0x20

	.global gUiBarPaletteC
gUiBarPaletteC:
	.incbin "baserom.gba", 0x5B8734, 0x20

	.global gLegacyUiFrameDImage
gLegacyUiFrameDImage:
	.incbin "baserom.gba", 0x5B8754, 0x83C

	.global gLegacyUiFrameDPalette
gLegacyUiFrameDPalette:
	.incbin "baserom.gba", 0x5B8F90, 0x20

	.global gUiBarPaletteD
gUiBarPaletteD:
	.incbin "baserom.gba", 0x5B8FB0, 0x40

	.global gUnkUiFrameImage
gUnkUiFrameImage:  @ 0x085B8FF0
	.incbin "baserom.gba", 0x5B8FF0, 0x254

	.global gUnkUiFramePalettes
gUnkUiFramePalettes:  @ 0x085B9244
	.incbin "baserom.gba", 0x5B9244, 0x80

	.global Img_SysGrayBox
Img_SysGrayBox:  @ 0x085B92C4
	.incbin "./graphics/sysutils/Img_SysGrayBox.4bpp.lz"
