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

@ OTHER STUFF

	.global gUnknown_085B92C4
gUnknown_085B92C4:  @ 0x085B92C4
	.incbin "baserom.gba", 0x5B92C4, 0x90

	.global gUnknown_085B9354
gUnknown_085B9354:  @ 0x085B9354
	.incbin "baserom.gba", 0x5B9354, 0x4

	.global gUnknown_085B9358
gUnknown_085B9358:  @ 0x085B9358
	.incbin "baserom.gba", 0x5B9358, 0x20

	.global gUnknown_085B9378
gUnknown_085B9378:  @ 0x085B9378
	.incbin "baserom.gba", 0x5B9378, 0x28

	.global gUnknown_085B93A0
gUnknown_085B93A0:  @ 0x085B93A0
	.incbin "baserom.gba", 0x5B93A0, 0x18

	.global gUnknown_085B93B8
gUnknown_085B93B8:  @ 0x085B93B8
	.incbin "baserom.gba", 0x5B93B8, 0x18

	.global gUnknown_085B93D0
gUnknown_085B93D0:  @ 0x085B93D0
	.incbin "baserom.gba", 0x5B93D0, 0x3C

	.global gUnknown_085B940C
gUnknown_085B940C:  @ 0x085B940C
	.incbin "baserom.gba", 0x5B940C, 0x18

	.global gUnknown_085B9424
gUnknown_085B9424:  @ 0x085B9424
	.incbin "baserom.gba", 0x5B9424, 0x78

	.global gUnknown_085B949C
gUnknown_085B949C:  @ 0x085B949C
	.incbin "baserom.gba", 0x5B949C, 0x54

	.global gUnknown_085B94F0
gUnknown_085B94F0:  @ 0x085B94F0
	.incbin "baserom.gba", 0x5B94F0, 0x54

	.global gUnknown_085B9544
gUnknown_085B9544:  @ 0x085B9544
	.incbin "baserom.gba", 0x5B9544, 0x18

	.global gUnknown_085B955C
gUnknown_085B955C:  @ 0x085B955C
	.incbin "baserom.gba", 0x5B955C, 0x18

	.global gUnknown_085B9574
gUnknown_085B9574:  @ 0x085B9574
	.incbin "baserom.gba", 0x5B9574, 0x18

	.global gUnknown_085B958C
gUnknown_085B958C:  @ 0x085B958C
	.incbin "baserom.gba", 0x5B958C, 0x18

	.global gUnknown_085B95A4
gUnknown_085B95A4:  @ 0x085B95A4
	.incbin "baserom.gba", 0x5B95A4, 0x18

	.global gUnknown_085B95BC
gUnknown_085B95BC:  @ 0x085B95BC
	.incbin "baserom.gba", 0x5B95BC, 0x18

	.global gUnknown_085B95D4
gUnknown_085B95D4:  @ 0x085B95D4
	.incbin "baserom.gba", 0x5B95D4, 0x18

	.global gUnknown_085B95EC
gUnknown_085B95EC:  @ 0x085B95EC
	.incbin "baserom.gba", 0x5B95EC, 0x18

	.global gUnknown_085B9604
gUnknown_085B9604:  @ 0x085B9604
	.incbin "baserom.gba", 0x5B9604, 0x28

	.global gUnknown_085B962C
gUnknown_085B962C:  @ 0x085B962C
	.incbin "baserom.gba", 0x5B962C, 0x38

	.global gUnknown_085B9664
gUnknown_085B9664:  @ 0x085B9664
	.incbin "baserom.gba", 0x5B9664, 0x28

	.global gUnknown_085B968C
gUnknown_085B968C:  @ 0x085B968C
	.incbin "baserom.gba", 0x5B968C, 0x28

	.global gUnknown_085B96B4
gUnknown_085B96B4:  @ 0x085B96B4
	.incbin "baserom.gba", 0x5B96B4, 0x28

	.global gUnknown_085B96DC
gUnknown_085B96DC:  @ 0x085B96DC
	.incbin "baserom.gba", 0x5B96DC, 0x18

	.global gUnknown_085B96F4
gUnknown_085B96F4:  @ 0x085B96F4
	.incbin "baserom.gba", 0x5B96F4, 0x30

	.global gUnknown_085B9724
gUnknown_085B9724:  @ 0x085B9724
	.incbin "baserom.gba", 0x5B9724, 0x38

	.global gUnknown_085B975C
gUnknown_085B975C:  @ 0x085B975C
	.incbin "baserom.gba", 0x5B975C, 0x20

	.global gUnknown_085B977C
gUnknown_085B977C:  @ 0x085B977C
	.incbin "baserom.gba", 0x5B977C, 0x18

	.global gUnknown_085B9794
gUnknown_085B9794:  @ 0x085B9794
	.incbin "baserom.gba", 0x5B9794, 0x18

	.global gUnknown_085B97AC
gUnknown_085B97AC:  @ 0x085B97AC
	.incbin "baserom.gba", 0x5B97AC, 0x18

	.global gUnknown_085B97C4
gUnknown_085B97C4:  @ 0x085B97C4
	.incbin "baserom.gba", 0x5B97C4, 0x28

	.global gUnknown_085B97EC
gUnknown_085B97EC:  @ 0x085B97EC
	.incbin "baserom.gba", 0x5B97EC, 0x18

	.global gUnknown_085B9804
gUnknown_085B9804:  @ 0x085B9804
	.incbin "baserom.gba", 0x5B9804, 0x80

	.global gUnknown_085B9884
gUnknown_085B9884:  @ 0x085B9884
	.incbin "baserom.gba", 0x5B9884, 0x18

	.global gUnknown_085B989C
gUnknown_085B989C:  @ 0x085B989C
	.incbin "baserom.gba", 0x5B989C, 0x18

	.global gUnknown_085B98B4
gUnknown_085B98B4:  @ 0x085B98B4
	.incbin "baserom.gba", 0x5B98B4, 0x18

	.global gUnknown_085B98CC
gUnknown_085B98CC:  @ 0x085B98CC
	.incbin "baserom.gba", 0x5B98CC, 0x28

	.global gUnknown_085B98F4
gUnknown_085B98F4:  @ 0x085B98F4
	.incbin "baserom.gba", 0x5B98F4, 0x28

	.global gUnknown_085B991C
gUnknown_085B991C:  @ 0x085B991C
	.incbin "baserom.gba", 0x5B991C, 0x28

	.global gUnknown_085B9944
gUnknown_085B9944:  @ 0x085B9944
	.incbin "baserom.gba", 0x5B9944, 0x28

	.global gUnknown_085B996C
gUnknown_085B996C:  @ 0x085B996C
	.incbin "baserom.gba", 0x5B996C, 0x28

	.global gUnknown_085B9994
gUnknown_085B9994:  @ 0x085B9994
	.incbin "baserom.gba", 0x5B9994, 0x30

	.global gUnknown_085B99C4
gUnknown_085B99C4:  @ 0x085B99C4
	.incbin "baserom.gba", 0x5B99C4, 0x20

	.global gUnknown_085B99E4
gUnknown_085B99E4:  @ 0x085B99E4
	.incbin "baserom.gba", 0x5B99E4, 0x28

	.global gUnknown_085B9A0C
gUnknown_085B9A0C:  @ 0x085B9A0C
	.incbin "baserom.gba", 0x5B9A0C, 0x28

	.global gUnknown_085B9A34
gUnknown_085B9A34:  @ 0x085B9A34
	.incbin "baserom.gba", 0x5B9A34, 0x28

	.global gUnknown_085B9A5C
gUnknown_085B9A5C:  @ 0x085B9A5C
	.incbin "baserom.gba", 0x5B9A5C, 0x28

	.global gUnknown_085B9A84
gUnknown_085B9A84:  @ 0x085B9A84
	.incbin "baserom.gba", 0x5B9A84, 0x30

	.global gUnknown_085B9AB4
gUnknown_085B9AB4:  @ 0x085B9AB4
	.incbin "baserom.gba", 0x5B9AB4, 0x20

	.global gUnknown_085B9AD4
gUnknown_085B9AD4:  @ 0x085B9AD4
	.incbin "baserom.gba", 0x5B9AD4, 0x48

	.global gUnknown_085B9B1C
gUnknown_085B9B1C:  @ 0x085B9B1C
	.incbin "baserom.gba", 0x5B9B1C, 0x50

	.global gUnknown_085B9B6C
gUnknown_085B9B6C:  @ 0x085B9B6C
	.incbin "baserom.gba", 0x5B9B6C, 0x18

	.global gUnknown_085B9B84
gUnknown_085B9B84:  @ 0x085B9B84
	.incbin "baserom.gba", 0x5B9B84, 0x20

	.global gUnknown_085B9BA4
gUnknown_085B9BA4:  @ 0x085B9BA4
	.incbin "baserom.gba", 0x5B9BA4, 0x20

	.global gUnknown_085B9BC4
gUnknown_085B9BC4:  @ 0x085B9BC4
	.incbin "baserom.gba", 0x5B9BC4, 0x20

	.global gUnknown_085B9BE4
gUnknown_085B9BE4:  @ 0x085B9BE4
	.incbin "baserom.gba", 0x5B9BE4, 0x20

	.global gUnknown_085B9C04
gUnknown_085B9C04:  @ 0x085B9C04
	.incbin "baserom.gba", 0x5B9C04, 0x20

	.global gUnknown_085B9C24
gUnknown_085B9C24:  @ 0x085B9C24
	.incbin "baserom.gba", 0x5B9C24, 0x20

	.global gUnknown_085B9C44
gUnknown_085B9C44:  @ 0x085B9C44
	.incbin "baserom.gba", 0x5B9C44, 0x20

	.global gUnknown_085B9C64
gUnknown_085B9C64:  @ 0x085B9C64
	.incbin "baserom.gba", 0x5B9C64, 0x20

	.global gUnknown_085B9C84
gUnknown_085B9C84:  @ 0x085B9C84
	.incbin "baserom.gba", 0x5B9C84, 0x20

	.global gUnknown_085B9CA4
gUnknown_085B9CA4:  @ 0x085B9CA4
	.incbin "baserom.gba", 0x5B9CA4, 0x20

	.global gUnknown_085B9CC4
gUnknown_085B9CC4:  @ 0x085B9CC4
	.incbin "baserom.gba", 0x5B9CC4, 0x20

	.global gUnknown_085B9CE4
gUnknown_085B9CE4:  @ 0x085B9CE4
	.incbin "baserom.gba", 0x5B9CE4, 0x28

	.global gUnknown_085B9D0C
gUnknown_085B9D0C:  @ 0x085B9D0C
	.incbin "baserom.gba", 0x5B9D0C, 0x18

	.global gUnknown_085B9D24
gUnknown_085B9D24:  @ 0x085B9D24
	.incbin "baserom.gba", 0x5B9D24, 0x20

	.global gUnknown_085B9D44
gUnknown_085B9D44:  @ 0x085B9D44
	.incbin "baserom.gba", 0x5B9D44, 0x18

	.global gUnknown_085B9D5C
gUnknown_085B9D5C:  @ 0x085B9D5C
	.incbin "baserom.gba", 0x5B9D5C, 0x10

	.global gUnknown_085B9D6C
gUnknown_085B9D6C:  @ 0x085B9D6C
	.incbin "baserom.gba", 0x5B9D6C, 0x28

	.global gUnknown_085B9D94
gUnknown_085B9D94:  @ 0x085B9D94
	.incbin "baserom.gba", 0x5B9D94, 0x18

	.global gUnknown_085B9DAC
gUnknown_085B9DAC:  @ 0x085B9DAC
	.incbin "baserom.gba", 0x5B9DAC, 0x18

	.global gUnknown_085B9DC4
gUnknown_085B9DC4:  @ 0x085B9DC4
	.incbin "baserom.gba", 0x5B9DC4, 0x18

	.global gUnknown_085B9DDC
gUnknown_085B9DDC:  @ 0x085B9DDC
	.incbin "baserom.gba", 0x5B9DDC, 0x30

	.global gUnknown_085B9E0C
gUnknown_085B9E0C:  @ 0x085B9E0C
	.incbin "baserom.gba", 0x5B9E0C, 0x28

	.global gUnknown_085B9E34
gUnknown_085B9E34:  @ 0x085B9E34
	.incbin "baserom.gba", 0x5B9E34, 0x18

	.global gUnknown_085B9E4C
gUnknown_085B9E4C:  @ 0x085B9E4C
	.incbin "baserom.gba", 0x5B9E4C, 0x26C

	.global gUnknown_085BA0B8
gUnknown_085BA0B8:  @ 0x085BA0B8
	.incbin "baserom.gba", 0x5BA0B8, 0x228

	.global gUnknown_085BA2E0
gUnknown_085BA2E0:  @ 0x085BA2E0
	.incbin "baserom.gba", 0x5BA2E0, 0x20

	.global gUnknown_085BA300
gUnknown_085BA300:  @ 0x085BA300
	.incbin "baserom.gba", 0x5BA300, 0x20

	.global gUnknown_085BA320
gUnknown_085BA320:  @ 0x085BA320
	.incbin "baserom.gba", 0x5BA320, 0xDA8

	.global gUnknown_085BB0C8
gUnknown_085BB0C8:  @ 0x085BB0C8
	.incbin "baserom.gba", 0x5BB0C8, 0x214

	.global gUnknown_085BB2DC
gUnknown_085BB2DC:  @ 0x085BB2DC
	.incbin "baserom.gba", 0x5BB2DC, 0xEAC

	.global gUnknown_085BC188
gUnknown_085BC188:  @ 0x085BC188
	.incbin "baserom.gba", 0x5BC188, 0x266C

	.global gUnknown_085BE7F4
gUnknown_085BE7F4:  @ 0x085BE7F4
	.incbin "baserom.gba", 0x5BE7F4, 0x7A0

	.global gUnknown_085BEF94
gUnknown_085BEF94:  @ 0x085BEF94
	.incbin "baserom.gba", 0x5BEF94, 0x5918

	.global gUnknown_085C48AC
gUnknown_085C48AC:  @ 0x085C48AC
	.incbin "baserom.gba", 0x5C48AC, 0x10E8

	.global gUnknown_085C5994
gUnknown_085C5994:  @ 0x085C5994
	.incbin "baserom.gba", 0x5C5994, 0x6C0

	.global gUnknown_085C6054
gUnknown_085C6054:  @ 0x085C6054
	.incbin "baserom.gba", 0x5C6054, 0x80

	.global gUnknown_085C60D4
gUnknown_085C60D4:  @ 0x085C60D4
	.incbin "baserom.gba", 0x5C60D4, 0x65C

	.global gUnknown_085C6730
gUnknown_085C6730:  @ 0x085C6730
	.incbin "baserom.gba", 0x5C6730, 0xAB4

	.global gUnknown_085C71E4
gUnknown_085C71E4:  @ 0x085C71E4
	.incbin "baserom.gba", 0x5C71E4, 0xC8

	.global gUnknown_085C72AC
gUnknown_085C72AC:  @ 0x085C72AC
	.incbin "baserom.gba", 0x5C72AC, 0x8C

	.global gUnknown_085C7338
gUnknown_085C7338:  @ 0x085C7338
	.incbin "baserom.gba", 0x5C7338, 0x80

	.global gUnknown_085C73B8
gUnknown_085C73B8:  @ 0x085C73B8
	.incbin "baserom.gba", 0x5C73B8, 0x80

	.global gUnknown_085C7438
gUnknown_085C7438:  @ 0x085C7438
	.incbin "baserom.gba", 0x5C7438, 0xD6C

	.global gUnknown_085C81A4
gUnknown_085C81A4:  @ 0x085C81A4
	.incbin "baserom.gba", 0x5C81A4, 0x74

	.global gUnknown_085C8218
gUnknown_085C8218:  @ 0x085C8218
	.incbin "baserom.gba", 0x5C8218, 0x60

	.global gUnknown_085C8278
gUnknown_085C8278:  @ 0x085C8278
	.incbin "baserom.gba", 0x5C8278, 0xFF8

	.global gUnknown_085C9270
gUnknown_085C9270:  @ 0x085C9270
	.incbin "baserom.gba", 0x5C9270, 0x30

	.global gUnknown_085C92A0
gUnknown_085C92A0:  @ 0x085C92A0
	.incbin "baserom.gba", 0x5C92A0, 0x30

	.global gUnknown_085C92D0
gUnknown_085C92D0:  @ 0x085C92D0
	.incbin "baserom.gba", 0x5C92D0, 0x1C

	.global gUnknown_085C92EC
gUnknown_085C92EC:  @ 0x085C92EC
	.incbin "baserom.gba", 0x5C92EC, 0x3C

	.global gUnknown_085C9328
gUnknown_085C9328:  @ 0x085C9328
	.incbin "baserom.gba", 0x5C9328, 0x6848

	.global gUnknown_085CFB70
gUnknown_085CFB70:  @ 0x085CFB70
	.incbin "baserom.gba", 0x5CFB70, 0xCB0

	.global gUnknown_085D0820
gUnknown_085D0820:  @ 0x085D0820
	.incbin "baserom.gba", 0x5D0820, 0x200

	.global gUnknown_085D0A20
gUnknown_085D0A20:  @ 0x085D0A20
	.incbin "baserom.gba", 0x5D0A20, 0x2C0

	.global gUnknown_085D0CE0
gUnknown_085D0CE0:  @ 0x085D0CE0
	.incbin "baserom.gba", 0x5D0CE0, 0x2F0

	.global gUnknown_085D0FD0
gUnknown_085D0FD0:  @ 0x085D0FD0
	.incbin "baserom.gba", 0x5D0FD0, 0x4A0

	.global gUnknown_085D1470
gUnknown_085D1470:  @ 0x085D1470
	.incbin "baserom.gba", 0x5D1470, 0x39F0

	.global gUnknown_085D4E60
gUnknown_085D4E60:  @ 0x085D4E60
	.incbin "baserom.gba", 0x5D4E60, 0x130

	.global gUnknown_085D4F90
gUnknown_085D4F90:  @ 0x085D4F90
	.incbin "baserom.gba", 0x5D4F90, 0x8

	.global gUnknown_085D4F98
gUnknown_085D4F98:  @ 0x085D4F98
	.incbin "baserom.gba", 0x5D4F98, 0x20

	.global gUnknown_085D4FB8
gUnknown_085D4FB8:  @ 0x085D4FB8
	.incbin "baserom.gba", 0x5D4FB8, 0x18

	.global gUnknown_085D4FD0
gUnknown_085D4FD0:  @ 0x085D4FD0
	.incbin "baserom.gba", 0x5D4FD0, 0x20

	.global gUnknown_085D4FF0
gUnknown_085D4FF0:  @ 0x085D4FF0
	.incbin "baserom.gba", 0x5D4FF0, 0x18

	.global gUnknown_085D5008
gUnknown_085D5008:  @ 0x085D5008
	.incbin "baserom.gba", 0x5D5008, 0x20

	.global gUnknown_085D5028
gUnknown_085D5028:  @ 0x085D5028
	.incbin "baserom.gba", 0x5D5028, 0x18

	.global gUnknown_085D5040
gUnknown_085D5040:  @ 0x085D5040
	.incbin "baserom.gba", 0x5D5040, 0x18

	.global gUnknown_085D5058
gUnknown_085D5058:  @ 0x085D5058
	.incbin "baserom.gba", 0x5D5058, 0x18

	.global gUnknown_085D5070
gUnknown_085D5070:  @ 0x085D5070
	.incbin "baserom.gba", 0x5D5070, 0x18

	.global gUnknown_085D5088
gUnknown_085D5088:  @ 0x085D5088
	.incbin "baserom.gba", 0x5D5088, 0x18

	.global gUnknown_085D50A0
gUnknown_085D50A0:  @ 0x085D50A0
	.incbin "baserom.gba", 0x5D50A0, 0x20

	.global gUnknown_085D50C0
gUnknown_085D50C0:  @ 0x085D50C0
	.incbin "baserom.gba", 0x5D50C0, 0x18

	.global gUnknown_085D50D8
gUnknown_085D50D8:  @ 0x085D50D8
	.incbin "baserom.gba", 0x5D50D8, 0x20

	.global gUnknown_085D50F8
gUnknown_085D50F8:  @ 0x085D50F8
	.incbin "baserom.gba", 0x5D50F8, 0x18

	.global gUnknown_085D5110
gUnknown_085D5110:  @ 0x085D5110
	.incbin "baserom.gba", 0x5D5110, 0x18

	.global gUnknown_085D5128
gUnknown_085D5128:  @ 0x085D5128
	.incbin "baserom.gba", 0x5D5128, 0x18

	.global gUnknown_085D5140
gUnknown_085D5140:  @ 0x085D5140
	.incbin "baserom.gba", 0x5D5140, 0x18

	.global gUnknown_085D5158
gUnknown_085D5158:  @ 0x085D5158
	.incbin "baserom.gba", 0x5D5158, 0x18

	.global gUnknown_085D5170
gUnknown_085D5170:  @ 0x085D5170
	.incbin "baserom.gba", 0x5D5170, 0x18

	.global gUnknown_085D5188
gUnknown_085D5188:  @ 0x085D5188
	.incbin "baserom.gba", 0x5D5188, 0x6C

	.global gUnknown_085D51F4
gUnknown_085D51F4:  @ 0x085D51F4
	.incbin "baserom.gba", 0x5D51F4, 0x6C

	.global gUnknown_085D5260
gUnknown_085D5260:  @ 0x085D5260
	.incbin "baserom.gba", 0x5D5260, 0x18

	.global gUnknown_085D5278
gUnknown_085D5278:  @ 0x085D5278
	.incbin "baserom.gba", 0x5D5278, 0x18

	.global gUnknown_085D5290
gUnknown_085D5290:  @ 0x085D5290
	.incbin "baserom.gba", 0x5D5290, 0x18

	.global gUnknown_085D52A8
gUnknown_085D52A8:  @ 0x085D52A8
	.incbin "baserom.gba", 0x5D52A8, 0x18

	.global gUnknown_085D52C0
gUnknown_085D52C0:  @ 0x085D52C0
	.incbin "baserom.gba", 0x5D52C0, 0x18

	.global gUnknown_085D52D8
gUnknown_085D52D8:  @ 0x085D52D8
	.incbin "baserom.gba", 0x5D52D8, 0x18

	.global gUnknown_085D52F0
gUnknown_085D52F0:  @ 0x085D52F0
	.incbin "baserom.gba", 0x5D52F0, 0x18

	.global gUnknown_085D5308
gUnknown_085D5308:  @ 0x085D5308
	.incbin "baserom.gba", 0x5D5308, 0x18

	.global gUnknown_085D5320
gUnknown_085D5320:  @ 0x085D5320
	.incbin "baserom.gba", 0x5D5320, 0x18

	.global gUnknown_085D5338
gUnknown_085D5338:  @ 0x085D5338
	.incbin "baserom.gba", 0x5D5338, 0x20

	.global gUnknown_085D5358
gUnknown_085D5358:  @ 0x085D5358
	.incbin "baserom.gba", 0x5D5358, 0x18

	.global gUnknown_085D5370
gUnknown_085D5370:  @ 0x085D5370
	.incbin "baserom.gba", 0x5D5370, 0x20

	.global gUnknown_085D5390
gUnknown_085D5390:  @ 0x085D5390
	.incbin "baserom.gba", 0x5D5390, 0x18

	.global gUnknown_085D53A8
gUnknown_085D53A8:  @ 0x085D53A8
	.incbin "baserom.gba", 0x5D53A8, 0x18

	.global gUnknown_085D53C0
gUnknown_085D53C0:  @ 0x085D53C0
	.incbin "baserom.gba", 0x5D53C0, 0x30

	.global gUnknown_085D53F0
gUnknown_085D53F0:  @ 0x085D53F0
	.incbin "baserom.gba", 0x5D53F0, 0x20

	.global gUnknown_085D5410
gUnknown_085D5410:  @ 0x085D5410
	.incbin "baserom.gba", 0x5D5410, 0x18

	.global gUnknown_085D5428
gUnknown_085D5428:  @ 0x085D5428
	.incbin "baserom.gba", 0x5D5428, 0x18

	.global gUnknown_085D5440
gUnknown_085D5440:  @ 0x085D5440
	.incbin "baserom.gba", 0x5D5440, 0x18

	.global gUnknown_085D5458
gUnknown_085D5458:  @ 0x085D5458
	.incbin "baserom.gba", 0x5D5458, 0x8

	.global gUnknown_085D5460
gUnknown_085D5460:  @ 0x085D5460
	.incbin "baserom.gba", 0x5D5460, 0x8

	.global gUnknown_085D5468
gUnknown_085D5468:  @ 0x085D5468
	.incbin "baserom.gba", 0x5D5468, 0x20

	.global gUnknown_085D5488
gUnknown_085D5488:  @ 0x085D5488
	.incbin "baserom.gba", 0x5D5488, 0x18

	.global gUnknown_085D54A0
gUnknown_085D54A0:  @ 0x085D54A0
	.incbin "baserom.gba", 0x5D54A0, 0x18

	.global gUnknown_085D54B8
gUnknown_085D54B8:  @ 0x085D54B8
	.incbin "baserom.gba", 0x5D54B8, 0x18

	.global gUnknown_085D54D0
gUnknown_085D54D0:  @ 0x085D54D0
	.incbin "baserom.gba", 0x5D54D0, 0x30

	.global gUnknown_085D5500
gUnknown_085D5500:  @ 0x085D5500
	.incbin "baserom.gba", 0x5D5500, 0x30

	.global gUnknown_085D5530
gUnknown_085D5530:  @ 0x085D5530
	.incbin "baserom.gba", 0x5D5530, 0x18

	.global gUnknown_085D5548
gUnknown_085D5548:  @ 0x085D5548
	.incbin "baserom.gba", 0x5D5548, 0x18

	.global gUnknown_085D5560
gUnknown_085D5560:  @ 0x085D5560
	.incbin "baserom.gba", 0x5D5560, 0x54

	.global gUnknown_085D55B4
gUnknown_085D55B4:  @ 0x085D55B4
	.incbin "baserom.gba", 0x5D55B4, 0x54

	.global gUnknown_085D5608
gUnknown_085D5608:  @ 0x085D5608
	.incbin "baserom.gba", 0x5D5608, 0x18

	.global gUnknown_085D5620
gUnknown_085D5620:  @ 0x085D5620
	.incbin "baserom.gba", 0x5D5620, 0x20

	.global gUnknown_085D5640
gUnknown_085D5640:  @ 0x085D5640
	.incbin "baserom.gba", 0x5D5640, 0x18

	.global gUnknown_085D5658
gUnknown_085D5658:  @ 0x085D5658
	.incbin "baserom.gba", 0x5D5658, 0x18

	.global gUnknown_085D5670
gUnknown_085D5670:  @ 0x085D5670
	.incbin "baserom.gba", 0x5D5670, 0x18

	.global gUnknown_085D5688
gUnknown_085D5688:  @ 0x085D5688
	.incbin "baserom.gba", 0x5D5688, 0x18

	.global gUnknown_085D56A0
gUnknown_085D56A0:  @ 0x085D56A0
	.incbin "baserom.gba", 0x5D56A0, 0x18

	.global gUnknown_085D56B8
gUnknown_085D56B8:  @ 0x085D56B8
	.incbin "baserom.gba", 0x5D56B8, 0x18

	.global gUnknown_085D56D0
gUnknown_085D56D0:  @ 0x085D56D0
	.incbin "baserom.gba", 0x5D56D0, 0x2C

	.global gUnknown_085D56FC
gUnknown_085D56FC:  @ 0x085D56FC
	.incbin "baserom.gba", 0x5D56FC, 0x2C

	.global gUnknown_085D5728
gUnknown_085D5728:  @ 0x085D5728
	.incbin "baserom.gba", 0x5D5728, 0x18

	.global gUnknown_085D5740
gUnknown_085D5740:  @ 0x085D5740
	.incbin "baserom.gba", 0x5D5740, 0x18

	.global gUnknown_085D5758
gUnknown_085D5758:  @ 0x085D5758
	.incbin "baserom.gba", 0x5D5758, 0x18

	.global gUnknown_085D5770
gUnknown_085D5770:  @ 0x085D5770
	.incbin "baserom.gba", 0x5D5770, 0x18

	.global gUnknown_085D5788
gUnknown_085D5788:  @ 0x085D5788
	.incbin "baserom.gba", 0x5D5788, 0x18

	.global gUnknown_085D57A0
gUnknown_085D57A0:  @ 0x085D57A0
	.incbin "baserom.gba", 0x5D57A0, 0x2C

	.global gUnknown_085D57CC
gUnknown_085D57CC:  @ 0x085D57CC
	.incbin "baserom.gba", 0x5D57CC, 0x2C

	.global gUnknown_085D57F8
gUnknown_085D57F8:  @ 0x085D57F8
	.incbin "baserom.gba", 0x5D57F8, 0x28

	.global gUnknown_085D5820
gUnknown_085D5820:  @ 0x085D5820
	.incbin "baserom.gba", 0x5D5820, 0x40

	.global gUnknown_085D5860
gUnknown_085D5860:  @ 0x085D5860
	.incbin "baserom.gba", 0x5D5860, 0x20

	.global gUnknown_085D5880
gUnknown_085D5880:  @ 0x085D5880
	.incbin "baserom.gba", 0x5D5880, 0x18

	.global gUnknown_085D5898
gUnknown_085D5898:  @ 0x085D5898
	.incbin "baserom.gba", 0x5D5898, 0x18

	.global gUnknown_085D58B0
gUnknown_085D58B0:  @ 0x085D58B0
	.incbin "baserom.gba", 0x5D58B0, 0x8

	.global gUnknown_085D58B8
gUnknown_085D58B8:  @ 0x085D58B8
	.incbin "baserom.gba", 0x5D58B8, 0x20

	.global gUnknown_085D58D8
gUnknown_085D58D8:  @ 0x085D58D8
	.incbin "baserom.gba", 0x5D58D8, 0x18

	.global gUnknown_085D58F0
gUnknown_085D58F0:  @ 0x085D58F0
	.incbin "baserom.gba", 0x5D58F0, 0x18

	.global gUnknown_085D5908
gUnknown_085D5908:  @ 0x085D5908
	.incbin "baserom.gba", 0x5D5908, 0x18

	.global gUnknown_085D5920
gUnknown_085D5920:  @ 0x085D5920
	.incbin "baserom.gba", 0x5D5920, 0xA4

	.global gUnknown_085D59C4
gUnknown_085D59C4:  @ 0x085D59C4
	.incbin "baserom.gba", 0x5D59C4, 0xA4

	.global gUnknown_085D5A68
gUnknown_085D5A68:  @ 0x085D5A68
	.incbin "baserom.gba", 0x5D5A68, 0x48

	.global gUnknown_085D5AB0
gUnknown_085D5AB0:  @ 0x085D5AB0
	.incbin "baserom.gba", 0x5D5AB0, 0x30

	.global gUnknown_085D5AE0
gUnknown_085D5AE0:  @ 0x085D5AE0
	.incbin "baserom.gba", 0x5D5AE0, 0x18

	.global gUnknown_085D5AF8
gUnknown_085D5AF8:  @ 0x085D5AF8
	.incbin "baserom.gba", 0x5D5AF8, 0x30

	.global gUnknown_085D5B28
gUnknown_085D5B28:  @ 0x085D5B28
	.incbin "baserom.gba", 0x5D5B28, 0x18

	.global gUnknown_085D5B40
gUnknown_085D5B40:  @ 0x085D5B40
	.incbin "baserom.gba", 0x5D5B40, 0xCC

	.global gUnknown_085D5C0C
gUnknown_085D5C0C:  @ 0x085D5C0C
	.incbin "baserom.gba", 0x5D5C0C, 0xCC

	.global gUnknown_085D5CD8
gUnknown_085D5CD8:  @ 0x085D5CD8
	.incbin "baserom.gba", 0x5D5CD8, 0x18

	.global gUnknown_085D5CF0
gUnknown_085D5CF0:  @ 0x085D5CF0
	.incbin "baserom.gba", 0x5D5CF0, 0x18

	.global gUnknown_085D5D08
gUnknown_085D5D08:  @ 0x085D5D08
	.incbin "baserom.gba", 0x5D5D08, 0x18

	.global gUnknown_085D5D20
gUnknown_085D5D20:  @ 0x085D5D20
	.incbin "baserom.gba", 0x5D5D20, 0x84

	.global gUnknown_085D5DA4
gUnknown_085D5DA4:  @ 0x085D5DA4
	.incbin "baserom.gba", 0x5D5DA4, 0x84

	.global gUnknown_085D5E28
gUnknown_085D5E28:  @ 0x085D5E28
	.incbin "baserom.gba", 0x5D5E28, 0x84

	.global gUnknown_085D5EAC
gUnknown_085D5EAC:  @ 0x085D5EAC
	.incbin "baserom.gba", 0x5D5EAC, 0x18

	.global gUnknown_085D5EC4
gUnknown_085D5EC4:  @ 0x085D5EC4
	.incbin "baserom.gba", 0x5D5EC4, 0x18

	.global gUnknown_085D5EDC
gUnknown_085D5EDC:  @ 0x085D5EDC
	.incbin "baserom.gba", 0x5D5EDC, 0x138

	.global gUnknown_085D6014
gUnknown_085D6014:  @ 0x085D6014
	.incbin "baserom.gba", 0x5D6014, 0x138

	.global gUnknown_085D614C
gUnknown_085D614C:  @ 0x085D614C
	.incbin "baserom.gba", 0x5D614C, 0x138

	.global gUnknown_085D6284
gUnknown_085D6284:  @ 0x085D6284
	.incbin "baserom.gba", 0x5D6284, 0x20

	.global gUnknown_085D62A4
gUnknown_085D62A4:  @ 0x085D62A4
	.incbin "baserom.gba", 0x5D62A4, 0x38

	.global gUnknown_085D62DC
gUnknown_085D62DC:  @ 0x085D62DC
	.incbin "baserom.gba", 0x5D62DC, 0x20

	.global gUnknown_085D62FC
gUnknown_085D62FC:  @ 0x085D62FC
	.incbin "baserom.gba", 0x5D62FC, 0x18

	.global gUnknown_085D6314
gUnknown_085D6314:  @ 0x085D6314
	.incbin "baserom.gba", 0x5D6314, 0x18

	.global gUnknown_085D632C
gUnknown_085D632C:  @ 0x085D632C
	.incbin "baserom.gba", 0x5D632C, 0x50

	.global gUnknown_085D637C
gUnknown_085D637C:  @ 0x085D637C
	.incbin "baserom.gba", 0x5D637C, 0x50

	.global gUnknown_085D63CC
gUnknown_085D63CC:  @ 0x085D63CC
	.incbin "baserom.gba", 0x5D63CC, 0xC

	.global gUnknown_085D63D8
gUnknown_085D63D8:  @ 0x085D63D8
	.incbin "baserom.gba", 0x5D63D8, 0xC

	.global gUnknown_085D63E4
gUnknown_085D63E4:  @ 0x085D63E4
	.incbin "baserom.gba", 0x5D63E4, 0x54

	.global gUnknown_085D6438
gUnknown_085D6438:  @ 0x085D6438
	.incbin "baserom.gba", 0x5D6438, 0x54

	.global gUnknown_085D648C
gUnknown_085D648C:  @ 0x085D648C
	.incbin "baserom.gba", 0x5D648C, 0x18

	.global gUnknown_085D64A4
gUnknown_085D64A4:  @ 0x085D64A4
	.incbin "baserom.gba", 0x5D64A4, 0x18

	.global gUnknown_085D64BC
gUnknown_085D64BC:  @ 0x085D64BC
	.incbin "baserom.gba", 0x5D64BC, 0x18

	.global gUnknown_085D64D4
gUnknown_085D64D4:  @ 0x085D64D4
	.incbin "baserom.gba", 0x5D64D4, 0x6C

	.global gUnknown_085D6540
gUnknown_085D6540:  @ 0x085D6540
	.incbin "baserom.gba", 0x5D6540, 0x6C

	.global gUnknown_085D65AC
gUnknown_085D65AC:  @ 0x085D65AC
	.incbin "baserom.gba", 0x5D65AC, 0x48

	.global gUnknown_085D65F4
gUnknown_085D65F4:  @ 0x085D65F4
	.incbin "baserom.gba", 0x5D65F4, 0x18

	.global gUnknown_085D660C
gUnknown_085D660C:  @ 0x085D660C
	.incbin "baserom.gba", 0x5D660C, 0x18

	.global gUnknown_085D6624
gUnknown_085D6624:  @ 0x085D6624
	.incbin "baserom.gba", 0x5D6624, 0x20

	.global gUnknown_085D6644
gUnknown_085D6644:  @ 0x085D6644
	.incbin "baserom.gba", 0x5D6644, 0x18

	.global gUnknown_085D665C
gUnknown_085D665C:  @ 0x085D665C
	.incbin "baserom.gba", 0x5D665C, 0x20

	.global gUnknown_085D667C
gUnknown_085D667C:  @ 0x085D667C
	.incbin "baserom.gba", 0x5D667C, 0x28

	.global gUnknown_085D66A4
gUnknown_085D66A4:  @ 0x085D66A4
	.incbin "baserom.gba", 0x5D66A4, 0x18

	.global gUnknown_085D66BC
gUnknown_085D66BC:  @ 0x085D66BC
	.incbin "baserom.gba", 0x5D66BC, 0x18

	.global gUnknown_085D66D4
gUnknown_085D66D4:  @ 0x085D66D4
	.incbin "baserom.gba", 0x5D66D4, 0xCC

	.global gUnknown_085D67A0
gUnknown_085D67A0:  @ 0x085D67A0
	.incbin "baserom.gba", 0x5D67A0, 0xCC

	.global gUnknown_085D686C
gUnknown_085D686C:  @ 0x085D686C
	.incbin "baserom.gba", 0x5D686C, 0x18

	.global gUnknown_085D6884
gUnknown_085D6884:  @ 0x085D6884
	.incbin "baserom.gba", 0x5D6884, 0x18

	.global gUnknown_085D689C
gUnknown_085D689C:  @ 0x085D689C
	.incbin "baserom.gba", 0x5D689C, 0x20

	.global gUnknown_085D68BC
gUnknown_085D68BC:  @ 0x085D68BC
	.incbin "baserom.gba", 0x5D68BC, 0x18

	.global gUnknown_085D68D4
gUnknown_085D68D4:  @ 0x085D68D4
	.incbin "baserom.gba", 0x5D68D4, 0x18

	.global gUnknown_085D68EC
gUnknown_085D68EC:  @ 0x085D68EC
	.incbin "baserom.gba", 0x5D68EC, 0x18

	.global gUnknown_085D6904
gUnknown_085D6904:  @ 0x085D6904
	.incbin "baserom.gba", 0x5D6904, 0x18

	.global gUnknown_085D691C
gUnknown_085D691C:  @ 0x085D691C
	.incbin "baserom.gba", 0x5D691C, 0x18

	.global gUnknown_085D6934
gUnknown_085D6934:  @ 0x085D6934
	.incbin "baserom.gba", 0x5D6934, 0x20

	.global gUnknown_085D6954
gUnknown_085D6954:  @ 0x085D6954
	.incbin "baserom.gba", 0x5D6954, 0x20

	.global gUnknown_085D6974
gUnknown_085D6974:  @ 0x085D6974
	.incbin "baserom.gba", 0x5D6974, 0x18

	.global gUnknown_085D698C
gUnknown_085D698C:  @ 0x085D698C
	.incbin "baserom.gba", 0x5D698C, 0x20

	.global gUnknown_085D69AC
gUnknown_085D69AC:  @ 0x085D69AC
	.incbin "baserom.gba", 0x5D69AC, 0x20

	.global gUnknown_085D69CC
gUnknown_085D69CC:  @ 0x085D69CC
	.incbin "baserom.gba", 0x5D69CC, 0x18

	.global gUnknown_085D69E4
gUnknown_085D69E4:  @ 0x085D69E4
	.incbin "baserom.gba", 0x5D69E4, 0x18

	.global gUnknown_085D69FC
gUnknown_085D69FC:  @ 0x085D69FC
	.incbin "baserom.gba", 0x5D69FC, 0x10

	.global gUnknown_085D6A0C
gUnknown_085D6A0C:  @ 0x085D6A0C
	.incbin "baserom.gba", 0x5D6A0C, 0x20

	.global gUnknown_085D6A2C
gUnknown_085D6A2C:  @ 0x085D6A2C
	.incbin "baserom.gba", 0x5D6A2C, 0x18

	.global gUnknown_085D6A44
gUnknown_085D6A44:  @ 0x085D6A44
	.incbin "baserom.gba", 0x5D6A44, 0x4

	.global gUnknown_085D6A48
gUnknown_085D6A48:  @ 0x085D6A48
	.incbin "baserom.gba", 0x5D6A48, 0x20

	.global gUnknown_085D6A68
gUnknown_085D6A68:  @ 0x085D6A68
	.incbin "baserom.gba", 0x5D6A68, 0x18

	.global gUnknown_085D6A80
gUnknown_085D6A80:  @ 0x085D6A80
	.incbin "baserom.gba", 0x5D6A80, 0x18

	.global gUnknown_085D6A98
gUnknown_085D6A98:  @ 0x085D6A98
	.incbin "baserom.gba", 0x5D6A98, 0x34

	.global gUnknown_085D6ACC
gUnknown_085D6ACC:  @ 0x085D6ACC
	.incbin "baserom.gba", 0x5D6ACC, 0x34

	.global gUnknown_085D6B00
gUnknown_085D6B00:  @ 0x085D6B00
	.incbin "baserom.gba", 0x5D6B00, 0x20

	.global gUnknown_085D6B20
gUnknown_085D6B20:  @ 0x085D6B20
	.incbin "baserom.gba", 0x5D6B20, 0x18

	.global gUnknown_085D6B38
gUnknown_085D6B38:  @ 0x085D6B38
	.incbin "baserom.gba", 0x5D6B38, 0x18

	.global gUnknown_085D6B50
gUnknown_085D6B50:  @ 0x085D6B50
	.incbin "baserom.gba", 0x5D6B50, 0x48

	.global gUnknown_085D6B98
gUnknown_085D6B98:  @ 0x085D6B98
	.incbin "baserom.gba", 0x5D6B98, 0x20

	.global gUnknown_085D6BB8
gUnknown_085D6BB8:  @ 0x085D6BB8
	.incbin "baserom.gba", 0x5D6BB8, 0x18

	.global gUnknown_085D6BD0
gUnknown_085D6BD0:  @ 0x085D6BD0
	.incbin "baserom.gba", 0x5D6BD0, 0x18

	.global gUnknown_085D6BE8
gUnknown_085D6BE8:  @ 0x085D6BE8
	.incbin "baserom.gba", 0x5D6BE8, 0x40

	.global gUnknown_085D6C28
gUnknown_085D6C28:  @ 0x085D6C28
	.incbin "baserom.gba", 0x5D6C28, 0x20

	.global gUnknown_085D6C48
gUnknown_085D6C48:  @ 0x085D6C48
	.incbin "baserom.gba", 0x5D6C48, 0x20

	.global gUnknown_085D6C68
gUnknown_085D6C68:  @ 0x085D6C68
	.incbin "baserom.gba", 0x5D6C68, 0x48

	.global gUnknown_085D6CB0
gUnknown_085D6CB0:  @ 0x085D6CB0
	.incbin "baserom.gba", 0x5D6CB0, 0x18

	.global gUnknown_085D6CC8
gUnknown_085D6CC8:  @ 0x085D6CC8
	.incbin "baserom.gba", 0x5D6CC8, 0x18

	.global gUnknown_085D6CE0
gUnknown_085D6CE0:  @ 0x085D6CE0
	.incbin "baserom.gba", 0x5D6CE0, 0x34

	.global gUnknown_085D6D14
gUnknown_085D6D14:  @ 0x085D6D14
	.incbin "baserom.gba", 0x5D6D14, 0x34

	.global gUnknown_085D6D48
gUnknown_085D6D48:  @ 0x085D6D48
	.incbin "baserom.gba", 0x5D6D48, 0x20

	.global gUnknown_085D6D68
gUnknown_085D6D68:  @ 0x085D6D68
	.incbin "baserom.gba", 0x5D6D68, 0x18

	.global gUnknown_085D6D80
gUnknown_085D6D80:  @ 0x085D6D80
	.incbin "baserom.gba", 0x5D6D80, 0x18

	.global gUnknown_085D6D98
gUnknown_085D6D98:  @ 0x085D6D98
	.incbin "baserom.gba", 0x5D6D98, 0x20

	.global gUnknown_085D6DB8
gUnknown_085D6DB8:  @ 0x085D6DB8
	.incbin "baserom.gba", 0x5D6DB8, 0xB8

	.global gUnknown_085D6E70
gUnknown_085D6E70:  @ 0x085D6E70
	.incbin "baserom.gba", 0x5D6E70, 0x18

	.global gUnknown_085D6E88
gUnknown_085D6E88:  @ 0x085D6E88
	.incbin "baserom.gba", 0x5D6E88, 0x18

	.global gUnknown_085D6EA0
gUnknown_085D6EA0:  @ 0x085D6EA0
	.incbin "baserom.gba", 0x5D6EA0, 0x14

	.global gUnknown_085D6EB4
gUnknown_085D6EB4:  @ 0x085D6EB4
	.incbin "baserom.gba", 0x5D6EB4, 0x20

	.global gUnknown_085D6ED4
gUnknown_085D6ED4:  @ 0x085D6ED4
	.incbin "baserom.gba", 0x5D6ED4, 0x20

	.global gUnknown_085D6EF4
gUnknown_085D6EF4:  @ 0x085D6EF4
	.incbin "baserom.gba", 0x5D6EF4, 0x18

	.global gUnknown_085D6F0C
gUnknown_085D6F0C:  @ 0x085D6F0C
	.incbin "baserom.gba", 0x5D6F0C, 0x18

	.global gUnknown_085D6F24
gUnknown_085D6F24:  @ 0x085D6F24
	.incbin "baserom.gba", 0x5D6F24, 0x4

	.global gUnknown_085D6F28
gUnknown_085D6F28:  @ 0x085D6F28
	.incbin "baserom.gba", 0x5D6F28, 0x4

	.global gUnknown_085D6F2C
gUnknown_085D6F2C:  @ 0x085D6F2C
	.incbin "baserom.gba", 0x5D6F2C, 0x4

	.global gUnknown_085D6F30
gUnknown_085D6F30:  @ 0x085D6F30
	.incbin "baserom.gba", 0x5D6F30, 0x18

	.global gUnknown_085D6F48
gUnknown_085D6F48:  @ 0x085D6F48
	.incbin "baserom.gba", 0x5D6F48, 0x24

	.global gUnknown_085D6F6C
gUnknown_085D6F6C:  @ 0x085D6F6C
	.incbin "baserom.gba", 0x5D6F6C, 0x20

	.global gUnknown_085D6F8C
gUnknown_085D6F8C:  @ 0x085D6F8C
	.incbin "baserom.gba", 0x5D6F8C, 0x18

	.global gUnknown_085D6FA4
gUnknown_085D6FA4:  @ 0x085D6FA4
	.incbin "baserom.gba", 0x5D6FA4, 0x10

	.global gUnknown_085D6FB4
gUnknown_085D6FB4:  @ 0x085D6FB4
	.incbin "baserom.gba", 0x5D6FB4, 0x18

	.global gUnknown_085D6FCC
gUnknown_085D6FCC:  @ 0x085D6FCC
	.incbin "baserom.gba", 0x5D6FCC, 0x18

	.global gUnknown_085D6FE4
gUnknown_085D6FE4:  @ 0x085D6FE4
	.incbin "baserom.gba", 0x5D6FE4, 0x18

	.global gUnknown_085D6FFC
gUnknown_085D6FFC:  @ 0x085D6FFC
	.incbin "baserom.gba", 0x5D6FFC, 0x4

	.global gUnknown_085D7000
gUnknown_085D7000:  @ 0x085D7000
	.incbin "baserom.gba", 0x5D7000, 0x18

	.global gUnknown_085D7018
gUnknown_085D7018:  @ 0x085D7018
	.incbin "baserom.gba", 0x5D7018, 0x18

	.global gUnknown_085D7030
gUnknown_085D7030:  @ 0x085D7030
	.incbin "baserom.gba", 0x5D7030, 0xC0

	.global gUnknown_085D70F0
gUnknown_085D70F0:  @ 0x085D70F0
	.incbin "baserom.gba", 0x5D70F0, 0x20

	.global gUnknown_085D7110
gUnknown_085D7110:  @ 0x085D7110
	.incbin "baserom.gba", 0x5D7110, 0x28

	.global gUnknown_085D7138
gUnknown_085D7138:  @ 0x085D7138
	.incbin "baserom.gba", 0x5D7138, 0x18

	.global gUnknown_085D7150
gUnknown_085D7150:  @ 0x085D7150
	.incbin "baserom.gba", 0x5D7150, 0x30

	.global gUnknown_085D7180
gUnknown_085D7180:  @ 0x085D7180
	.incbin "baserom.gba", 0x5D7180, 0x30

	.global gUnknown_085D71B0
gUnknown_085D71B0:  @ 0x085D71B0
	.incbin "baserom.gba", 0x5D71B0, 0x30

	.global gUnknown_085D71E0
gUnknown_085D71E0:  @ 0x085D71E0
	.incbin "baserom.gba", 0x5D71E0, 0x18

	.global gUnknown_085D71F8
gUnknown_085D71F8:  @ 0x085D71F8
	.incbin "baserom.gba", 0x5D71F8, 0x18

	.global gUnknown_085D7210
gUnknown_085D7210:  @ 0x085D7210
	.incbin "baserom.gba", 0x5D7210, 0x30

	.global gUnknown_085D7240
gUnknown_085D7240:  @ 0x085D7240
	.incbin "baserom.gba", 0x5D7240, 0x28

	.global gUnknown_085D7268
gUnknown_085D7268:  @ 0x085D7268
	.incbin "baserom.gba", 0x5D7268, 0x18

	.global gUnknown_085D7280
gUnknown_085D7280:  @ 0x085D7280
	.incbin "baserom.gba", 0x5D7280, 0x18

	.global gUnknown_085D7298
gUnknown_085D7298:  @ 0x085D7298
	.incbin "baserom.gba", 0x5D7298, 0x100

	.global gUnknown_085D7398
gUnknown_085D7398:  @ 0x085D7398
	.incbin "baserom.gba", 0x5D7398, 0x20

	.global gUnknown_085D73B8
gUnknown_085D73B8:  @ 0x085D73B8
	.incbin "baserom.gba", 0x5D73B8, 0x20

	.global gUnknown_085D73D8
gUnknown_085D73D8:  @ 0x085D73D8
	.incbin "baserom.gba", 0x5D73D8, 0x20

	.global gUnknown_085D73F8
gUnknown_085D73F8:  @ 0x085D73F8
	.incbin "baserom.gba", 0x5D73F8, 0x20

	.global gUnknown_085D7418
gUnknown_085D7418:  @ 0x085D7418
	.incbin "baserom.gba", 0x5D7418, 0x18

	.global gUnknown_085D7430
gUnknown_085D7430:  @ 0x085D7430
	.incbin "baserom.gba", 0x5D7430, 0x18

	.global gUnknown_085D7448
gUnknown_085D7448:  @ 0x085D7448
	.incbin "baserom.gba", 0x5D7448, 0x4

	.global gUnknown_085D744C
gUnknown_085D744C:  @ 0x085D744C
	.incbin "baserom.gba", 0x5D744C, 0x4

	.global gUnknown_085D7450
gUnknown_085D7450:  @ 0x085D7450
	.incbin "baserom.gba", 0x5D7450, 0x20

	.global gUnknown_085D7470
gUnknown_085D7470:  @ 0x085D7470
	.incbin "baserom.gba", 0x5D7470, 0x20

	.global gUnknown_085D7490
gUnknown_085D7490:  @ 0x085D7490
	.incbin "baserom.gba", 0x5D7490, 0x18

	.global gUnknown_085D74A8
gUnknown_085D74A8:  @ 0x085D74A8
	.incbin "baserom.gba", 0x5D74A8, 0x18

	.global gUnknown_085D74C0
gUnknown_085D74C0:  @ 0x085D74C0
	.incbin "baserom.gba", 0x5D74C0, 0x70

	.global gUnknown_085D7530
gUnknown_085D7530:  @ 0x085D7530
	.incbin "baserom.gba", 0x5D7530, 0x20

	.global gUnknown_085D7550
gUnknown_085D7550:  @ 0x085D7550
	.incbin "baserom.gba", 0x5D7550, 0x20

	.global gUnknown_085D7570
gUnknown_085D7570:  @ 0x085D7570
	.incbin "baserom.gba", 0x5D7570, 0x18

	.global gUnknown_085D7588
gUnknown_085D7588:  @ 0x085D7588
	.incbin "baserom.gba", 0x5D7588, 0x30

	.global gUnknown_085D75B8
gUnknown_085D75B8:  @ 0x085D75B8
	.incbin "baserom.gba", 0x5D75B8, 0x30

	.global gUnknown_085D75E8
gUnknown_085D75E8:  @ 0x085D75E8
	.incbin "baserom.gba", 0x5D75E8, 0x18

	.global gUnknown_085D7600
gUnknown_085D7600:  @ 0x085D7600
	.incbin "baserom.gba", 0x5D7600, 0x28

	.global gUnknown_085D7628
gUnknown_085D7628:  @ 0x085D7628
	.incbin "baserom.gba", 0x5D7628, 0x28

	.global gUnknown_085D7650
gUnknown_085D7650:  @ 0x085D7650
	.incbin "baserom.gba", 0x5D7650, 0x20

	.global gUnknown_085D7670
gUnknown_085D7670:  @ 0x085D7670
	.incbin "baserom.gba", 0x5D7670, 0x18

	.global gUnknown_085D7688
gUnknown_085D7688:  @ 0x085D7688
	.incbin "baserom.gba", 0x5D7688, 0x18

	.global gUnknown_085D76A0
gUnknown_085D76A0:  @ 0x085D76A0
	.incbin "baserom.gba", 0x5D76A0, 0x18

	.global gUnknown_085D76B8
gUnknown_085D76B8:  @ 0x085D76B8
	.incbin "baserom.gba", 0x5D76B8, 0x30

	.global gUnknown_085D76E8
gUnknown_085D76E8:  @ 0x085D76E8
	.incbin "baserom.gba", 0x5D76E8, 0x18

	.global gUnknown_085D7700
gUnknown_085D7700:  @ 0x085D7700
	.incbin "baserom.gba", 0x5D7700, 0x14

	.global gUnknown_085D7714
gUnknown_085D7714:  @ 0x085D7714
	.incbin "baserom.gba", 0x5D7714, 0x18

	.global gUnknown_085D772C
gUnknown_085D772C:  @ 0x085D772C
	.incbin "baserom.gba", 0x5D772C, 0x2C

	.global gUnknown_085D7758
gUnknown_085D7758:  @ 0x085D7758
	.incbin "baserom.gba", 0x5D7758, 0x2C

	.global gUnknown_085D7784
gUnknown_085D7784:  @ 0x085D7784
	.incbin "baserom.gba", 0x5D7784, 0x2C

	.global gUnknown_085D77B0
gUnknown_085D77B0:  @ 0x085D77B0
	.incbin "baserom.gba", 0x5D77B0, 0x18

	.global gUnknown_085D77C8
gUnknown_085D77C8:  @ 0x085D77C8
	.incbin "baserom.gba", 0x5D77C8, 0x4

	.global gUnknown_085D77CC
gUnknown_085D77CC:  @ 0x085D77CC
	.incbin "baserom.gba", 0x5D77CC, 0x18

	.global gUnknown_085D77E4
gUnknown_085D77E4:  @ 0x085D77E4
	.incbin "baserom.gba", 0x5D77E4, 0x18

	.global gUnknown_085D77FC
gUnknown_085D77FC:  @ 0x085D77FC
	.incbin "baserom.gba", 0x5D77FC, 0x18

	.global gUnknown_085D7814
gUnknown_085D7814:  @ 0x085D7814
	.incbin "baserom.gba", 0x5D7814, 0x18

	.global gUnknown_085D782C
gUnknown_085D782C:  @ 0x085D782C
	.incbin "baserom.gba", 0x5D782C, 0x18

	.global gUnknown_085D7844
gUnknown_085D7844:  @ 0x085D7844
	.incbin "baserom.gba", 0x5D7844, 0x18

	.global gUnknown_085D785C
gUnknown_085D785C:  @ 0x085D785C
	.incbin "baserom.gba", 0x5D785C, 0x18

	.global gUnknown_085D7874
gUnknown_085D7874:  @ 0x085D7874
	.incbin "baserom.gba", 0x5D7874, 0x18

	.global gUnknown_085D788C
gUnknown_085D788C:  @ 0x085D788C
	.incbin "baserom.gba", 0x5D788C, 0x80

	.global gUnknown_085D790C
gUnknown_085D790C:  @ 0x085D790C
	.incbin "baserom.gba", 0x5D790C, 0x80

	.global gUnknown_085D798C
gUnknown_085D798C:  @ 0x085D798C
	.incbin "baserom.gba", 0x5D798C, 0x80

	.global gUnknown_085D7A0C
gUnknown_085D7A0C:  @ 0x085D7A0C
	.incbin "baserom.gba", 0x5D7A0C, 0x80

	.global gUnknown_085D7A8C
gUnknown_085D7A8C:  @ 0x085D7A8C
	.incbin "baserom.gba", 0x5D7A8C, 0x80

	.global gUnknown_085D7B0C
gUnknown_085D7B0C:  @ 0x085D7B0C
	.incbin "baserom.gba", 0x5D7B0C, 0x80

	.global gUnknown_085D7B8C
gUnknown_085D7B8C:  @ 0x085D7B8C
	.incbin "baserom.gba", 0x5D7B8C, 0x18

	.global gUnknown_085D7BA4
gUnknown_085D7BA4:  @ 0x085D7BA4
	.incbin "baserom.gba", 0x5D7BA4, 0xC

	.global gUnknown_085D7BB0
gUnknown_085D7BB0:  @ 0x085D7BB0
	.incbin "baserom.gba", 0x5D7BB0, 0xC

	.global gUnknown_085D7BBC
gUnknown_085D7BBC:  @ 0x085D7BBC
	.incbin "baserom.gba", 0x5D7BBC, 0xC

	.global gUnknown_085D7BC8
gUnknown_085D7BC8:  @ 0x085D7BC8
	.incbin "baserom.gba", 0x5D7BC8, 0x18

	.global gUnknown_085D7BE0
gUnknown_085D7BE0:  @ 0x085D7BE0
	.incbin "baserom.gba", 0x5D7BE0, 0x14

	.global gUnknown_085D7BF4
gUnknown_085D7BF4:  @ 0x085D7BF4
	.incbin "baserom.gba", 0x5D7BF4, 0x14

	.global gUnknown_085D7C08
gUnknown_085D7C08:  @ 0x085D7C08
	.incbin "baserom.gba", 0x5D7C08, 0x14

	.global gUnknown_085D7C1C
gUnknown_085D7C1C:  @ 0x085D7C1C
	.incbin "baserom.gba", 0x5D7C1C, 0x14

	.global gUnknown_085D7C30
gUnknown_085D7C30:  @ 0x085D7C30
	.incbin "baserom.gba", 0x5D7C30, 0x14

	.global gUnknown_085D7C44
gUnknown_085D7C44:  @ 0x085D7C44
	.incbin "baserom.gba", 0x5D7C44, 0x14

	.global gUnknown_085D7C58
gUnknown_085D7C58:  @ 0x085D7C58
	.incbin "baserom.gba", 0x5D7C58, 0x18

	.global gUnknown_085D7C70
gUnknown_085D7C70:  @ 0x085D7C70
	.incbin "baserom.gba", 0x5D7C70, 0x20

	.global gUnknown_085D7C90
gUnknown_085D7C90:  @ 0x085D7C90
	.incbin "baserom.gba", 0x5D7C90, 0x20

	.global gUnknown_085D7CB0
gUnknown_085D7CB0:  @ 0x085D7CB0
	.incbin "baserom.gba", 0x5D7CB0, 0x20

	.global gUnknown_085D7CD0
gUnknown_085D7CD0:  @ 0x085D7CD0
	.incbin "baserom.gba", 0x5D7CD0, 0x20

	.global gUnknown_085D7CF0
gUnknown_085D7CF0:  @ 0x085D7CF0
	.incbin "baserom.gba", 0x5D7CF0, 0x20

	.global gUnknown_085D7D10
gUnknown_085D7D10:  @ 0x085D7D10
	.incbin "baserom.gba", 0x5D7D10, 0x20

	.global gUnknown_085D7D30
gUnknown_085D7D30:  @ 0x085D7D30
	.incbin "baserom.gba", 0x5D7D30, 0x28

	.global gUnknown_085D7D58
gUnknown_085D7D58:  @ 0x085D7D58
	.incbin "baserom.gba", 0x5D7D58, 0x20

	.global gUnknown_085D7D78
gUnknown_085D7D78:  @ 0x085D7D78
	.incbin "baserom.gba", 0x5D7D78, 0x18

	.global gUnknown_085D7D90
gUnknown_085D7D90:  @ 0x085D7D90
	.incbin "baserom.gba", 0x5D7D90, 0x18

	.global gUnknown_085D7DA8
gUnknown_085D7DA8:  @ 0x085D7DA8
	.incbin "baserom.gba", 0x5D7DA8, 0x18

	.global gUnknown_085D7DC0
gUnknown_085D7DC0:  @ 0x085D7DC0
	.incbin "baserom.gba", 0x5D7DC0, 0x18

	.global gUnknown_085D7DD8
gUnknown_085D7DD8:  @ 0x085D7DD8
	.incbin "baserom.gba", 0x5D7DD8, 0x18

	.global gUnknown_085D7DF0
gUnknown_085D7DF0:  @ 0x085D7DF0
	.incbin "baserom.gba", 0x5D7DF0, 0x18

	.global gUnknown_085D7E08
gUnknown_085D7E08:  @ 0x085D7E08
	.incbin "baserom.gba", 0x5D7E08, 0x18

	.global gUnknown_085D7E20
gUnknown_085D7E20:  @ 0x085D7E20
	.incbin "baserom.gba", 0x5D7E20, 0x18

	.global gUnknown_085D7E38
gUnknown_085D7E38:  @ 0x085D7E38
	.incbin "baserom.gba", 0x5D7E38, 0x18

	.global gUnknown_085D7E50
gUnknown_085D7E50:  @ 0x085D7E50
	.incbin "baserom.gba", 0x5D7E50, 0x4C

	.global gUnknown_085D7E9C
gUnknown_085D7E9C:  @ 0x085D7E9C
	.incbin "baserom.gba", 0x5D7E9C, 0x4C

	.global gUnknown_085D7EE8
gUnknown_085D7EE8:  @ 0x085D7EE8
	.incbin "baserom.gba", 0x5D7EE8, 0x18

	.global gUnknown_085D7F00
gUnknown_085D7F00:  @ 0x085D7F00
	.incbin "baserom.gba", 0x5D7F00, 0x18

	.global gUnknown_085D7F18
gUnknown_085D7F18:  @ 0x085D7F18
	.incbin "baserom.gba", 0x5D7F18, 0x18

	.global gUnknown_085D7F30
gUnknown_085D7F30:  @ 0x085D7F30
	.incbin "baserom.gba", 0x5D7F30, 0x50

	.global gUnknown_085D7F80
gUnknown_085D7F80:  @ 0x085D7F80
	.incbin "baserom.gba", 0x5D7F80, 0x50

	.global gUnknown_085D7FD0
gUnknown_085D7FD0:  @ 0x085D7FD0
	.incbin "baserom.gba", 0x5D7FD0, 0x50

	.global gUnknown_085D8020
gUnknown_085D8020:  @ 0x085D8020
	.incbin "baserom.gba", 0x5D8020, 0x18

	.global gUnknown_085D8038
gUnknown_085D8038:  @ 0x085D8038
	.incbin "baserom.gba", 0x5D8038, 0x18

	.global gUnknown_085D8050
gUnknown_085D8050:  @ 0x085D8050
	.incbin "baserom.gba", 0x5D8050, 0x18

	.global gUnknown_085D8068
gUnknown_085D8068:  @ 0x085D8068
	.incbin "baserom.gba", 0x5D8068, 0x18

	.global gUnknown_085D8080
gUnknown_085D8080:  @ 0x085D8080
	.incbin "baserom.gba", 0x5D8080, 0x18

	.global gUnknown_085D8098
gUnknown_085D8098:  @ 0x085D8098
	.incbin "baserom.gba", 0x5D8098, 0x18

	.global gUnknown_085D80B0
gUnknown_085D80B0:  @ 0x085D80B0
	.incbin "baserom.gba", 0x5D80B0, 0x18

	.global gUnknown_085D80C8
gUnknown_085D80C8:  @ 0x085D80C8
	.incbin "baserom.gba", 0x5D80C8, 0x18

	.global gUnknown_085D80E0
gUnknown_085D80E0:  @ 0x085D80E0
	.incbin "baserom.gba", 0x5D80E0, 0x4

	.global gUnknown_085D80E4
gUnknown_085D80E4:  @ 0x085D80E4
	.incbin "baserom.gba", 0x5D80E4, 0x4

	.global gUnknown_085D80E8
gUnknown_085D80E8:  @ 0x085D80E8
	.incbin "baserom.gba", 0x5D80E8, 0x18

	.global gUnknown_085D8100
gUnknown_085D8100:  @ 0x085D8100
	.incbin "baserom.gba", 0x5D8100, 0x40

	.global gUnknown_085D8140
gUnknown_085D8140:  @ 0x085D8140
	.incbin "baserom.gba", 0x5D8140, 0x40

	.global gUnknown_085D8180
gUnknown_085D8180:  @ 0x085D8180
	.incbin "baserom.gba", 0x5D8180, 0x40

	.global gUnknown_085D81C0
gUnknown_085D81C0:  @ 0x085D81C0
	.incbin "baserom.gba", 0x5D81C0, 0x18

	.global gUnknown_085D81D8
gUnknown_085D81D8:  @ 0x085D81D8
	.incbin "baserom.gba", 0x5D81D8, 0x10

	.global gUnknown_085D81E8
gUnknown_085D81E8:  @ 0x085D81E8
	.incbin "baserom.gba", 0x5D81E8, 0x10

	.global gUnknown_085D81F8
gUnknown_085D81F8:  @ 0x085D81F8
	.incbin "baserom.gba", 0x5D81F8, 0x18

	.global gUnknown_085D8210
gUnknown_085D8210:  @ 0x085D8210
	.incbin "baserom.gba", 0x5D8210, 0x14

	.global gUnknown_085D8224
gUnknown_085D8224:  @ 0x085D8224
	.incbin "baserom.gba", 0x5D8224, 0x14

	.global gUnknown_085D8238
gUnknown_085D8238:  @ 0x085D8238
	.incbin "baserom.gba", 0x5D8238, 0x18

	.global gUnknown_085D8250
gUnknown_085D8250:  @ 0x085D8250
	.incbin "baserom.gba", 0x5D8250, 0x18

	.global gUnknown_085D8268
gUnknown_085D8268:  @ 0x085D8268
	.incbin "baserom.gba", 0x5D8268, 0x18

	.global gUnknown_085D8280
gUnknown_085D8280:  @ 0x085D8280
	.incbin "baserom.gba", 0x5D8280, 0x30

	.global gUnknown_085D82B0
gUnknown_085D82B0:  @ 0x085D82B0
	.incbin "baserom.gba", 0x5D82B0, 0x18

	.global gUnknown_085D82C8
gUnknown_085D82C8:  @ 0x085D82C8
	.incbin "baserom.gba", 0x5D82C8, 0x18

	.global gUnknown_085D82E0
gUnknown_085D82E0:  @ 0x085D82E0
	.incbin "baserom.gba", 0x5D82E0, 0x18

	.global gUnknown_085D82F8
gUnknown_085D82F8:  @ 0x085D82F8
	.incbin "baserom.gba", 0x5D82F8, 0x20

	.global gUnknown_085D8318
gUnknown_085D8318:  @ 0x085D8318
	.incbin "baserom.gba", 0x5D8318, 0x18

	.global gUnknown_085D8330
gUnknown_085D8330:  @ 0x085D8330
	.incbin "baserom.gba", 0x5D8330, 0x18

	.global gUnknown_085D8348
gUnknown_085D8348:  @ 0x085D8348
	.incbin "baserom.gba", 0x5D8348, 0x2C

	.global gUnknown_085D8374
gUnknown_085D8374:  @ 0x085D8374
	.incbin "baserom.gba", 0x5D8374, 0x2C

	.global gUnknown_085D83A0
gUnknown_085D83A0:  @ 0x085D83A0
	.incbin "baserom.gba", 0x5D83A0, 0x18

	.global gUnknown_085D83B8
gUnknown_085D83B8:  @ 0x085D83B8
	.incbin "baserom.gba", 0x5D83B8, 0x40

	.global gUnknown_085D83F8
gUnknown_085D83F8:  @ 0x085D83F8
	.incbin "baserom.gba", 0x5D83F8, 0x40

	.global gUnknown_085D8438
gUnknown_085D8438:  @ 0x085D8438
	.incbin "baserom.gba", 0x5D8438, 0x40

	.global gUnknown_085D8478
gUnknown_085D8478:  @ 0x085D8478
	.incbin "baserom.gba", 0x5D8478, 0x4

	.global gUnknown_085D847C
gUnknown_085D847C:  @ 0x085D847C
	.incbin "baserom.gba", 0x5D847C, 0x8

	.global gUnknown_085D8484
gUnknown_085D8484:  @ 0x085D8484
	.incbin "baserom.gba", 0x5D8484, 0x30

	.global gUnknown_085D84B4
gUnknown_085D84B4:  @ 0x085D84B4
	.incbin "baserom.gba", 0x5D84B4, 0x20

	.global gUnknown_085D84D4
gUnknown_085D84D4:  @ 0x085D84D4
	.incbin "baserom.gba", 0x5D84D4, 0x50

	.global gUnknown_085D8524
gUnknown_085D8524:  @ 0x085D8524
	.incbin "baserom.gba", 0x5D8524, 0x50

	.global gUnknown_085D8574
gUnknown_085D8574:  @ 0x085D8574
	.incbin "baserom.gba", 0x5D8574, 0x50

	.global gUnknown_085D85C4
gUnknown_085D85C4:  @ 0x085D85C4
	.incbin "baserom.gba", 0x5D85C4, 0x50

	.global gUnknown_085D8614
gUnknown_085D8614:  @ 0x085D8614
	.incbin "baserom.gba", 0x5D8614, 0x50

	.global gUnknown_085D8664
gUnknown_085D8664:  @ 0x085D8664
	.incbin "baserom.gba", 0x5D8664, 0x50

	.global gUnknown_085D86B4
gUnknown_085D86B4:  @ 0x085D86B4
	.incbin "baserom.gba", 0x5D86B4, 0x50

	.global gUnknown_085D8704
gUnknown_085D8704:  @ 0x085D8704
	.incbin "baserom.gba", 0x5D8704, 0x18

	.global gUnknown_085D871C
gUnknown_085D871C:  @ 0x085D871C
	.incbin "baserom.gba", 0x5D871C, 0x18

	.global gUnknown_085D8734
gUnknown_085D8734:  @ 0x085D8734
	.incbin "baserom.gba", 0x5D8734, 0x18

	.global gUnknown_085D874C
gUnknown_085D874C:  @ 0x085D874C
	.incbin "baserom.gba", 0x5D874C, 0x18

	.global gUnknown_085D8764
gUnknown_085D8764:  @ 0x085D8764
	.incbin "baserom.gba", 0x5D8764, 0x18

	.global gUnknown_085D877C
gUnknown_085D877C:  @ 0x085D877C
	.incbin "baserom.gba", 0x5D877C, 0x10

	.global gUnknown_085D878C
gUnknown_085D878C:  @ 0x085D878C
	.incbin "baserom.gba", 0x5D878C, 0x20

	.global gUnknown_085D87AC
gUnknown_085D87AC:  @ 0x085D87AC
	.incbin "baserom.gba", 0x5D87AC, 0x18

	.global gUnknown_085D87C4
gUnknown_085D87C4:  @ 0x085D87C4
	.incbin "baserom.gba", 0x5D87C4, 0x18

	.global gUnknown_085D87DC
gUnknown_085D87DC:  @ 0x085D87DC
	.incbin "baserom.gba", 0x5D87DC, 0x80

	.global gUnknown_085D885C
gUnknown_085D885C:  @ 0x085D885C
	.incbin "baserom.gba", 0x5D885C, 0x18

	.global gUnknown_085D8874
gUnknown_085D8874:  @ 0x085D8874
	.incbin "baserom.gba", 0x5D8874, 0x20

	.global gUnknown_085D8894
gUnknown_085D8894:  @ 0x085D8894
	.incbin "baserom.gba", 0x5D8894, 0x18

	.global gUnknown_085D88AC
gUnknown_085D88AC:  @ 0x085D88AC
	.incbin "baserom.gba", 0x5D88AC, 0xB4

	.global gUnknown_085D8960
gUnknown_085D8960:  @ 0x085D8960
	.incbin "baserom.gba", 0x5D8960, 0x40

	.global gUnknown_085D89A0
gUnknown_085D89A0:  @ 0x085D89A0
	.incbin "baserom.gba", 0x5D89A0, 0x18

	.global gUnknown_085D89B8
gUnknown_085D89B8:  @ 0x085D89B8
	.incbin "baserom.gba", 0x5D89B8, 0x40

	.global gUnknown_085D89F8
gUnknown_085D89F8:  @ 0x085D89F8
	.incbin "baserom.gba", 0x5D89F8, 0x40

	.global gUnknown_085D8A38
gUnknown_085D8A38:  @ 0x085D8A38
	.incbin "baserom.gba", 0x5D8A38, 0x40

	.global gUnknown_085D8A78
gUnknown_085D8A78:  @ 0x085D8A78
	.incbin "baserom.gba", 0x5D8A78, 0x20

	.global gUnknown_085D8A98
gUnknown_085D8A98:  @ 0x085D8A98
	.incbin "baserom.gba", 0x5D8A98, 0x24

	.global gUnknown_085D8ABC
gUnknown_085D8ABC:  @ 0x085D8ABC
	.incbin "baserom.gba", 0x5D8ABC, 0x18

	.global gUnknown_085D8AD4
gUnknown_085D8AD4:  @ 0x085D8AD4
	.incbin "baserom.gba", 0x5D8AD4, 0x18

	.global gUnknown_085D8AEC
gUnknown_085D8AEC:  @ 0x085D8AEC
	.incbin "baserom.gba", 0x5D8AEC, 0x20

	.global gUnknown_085D8B0C
gUnknown_085D8B0C:  @ 0x085D8B0C
	.incbin "baserom.gba", 0x5D8B0C, 0x18

	.global gUnknown_085D8B24
gUnknown_085D8B24:  @ 0x085D8B24
	.incbin "baserom.gba", 0x5D8B24, 0x28

	.global gUnknown_085D8B4C
gUnknown_085D8B4C:  @ 0x085D8B4C
	.incbin "baserom.gba", 0x5D8B4C, 0x2C

	.global gUnknown_085D8B78
gUnknown_085D8B78:  @ 0x085D8B78
	.incbin "baserom.gba", 0x5D8B78, 0x2C

	.global gUnknown_085D8BA4
gUnknown_085D8BA4:  @ 0x085D8BA4
	.incbin "baserom.gba", 0x5D8BA4, 0x2C

	.global gUnknown_085D8BD0
gUnknown_085D8BD0:  @ 0x085D8BD0
	.incbin "baserom.gba", 0x5D8BD0, 0x18

	.global gUnknown_085D8BE8
gUnknown_085D8BE8:  @ 0x085D8BE8
	.incbin "baserom.gba", 0x5D8BE8, 0xC

	.global gUnknown_085D8BF4
gUnknown_085D8BF4:  @ 0x085D8BF4
	.incbin "baserom.gba", 0x5D8BF4, 0xC

	.global gUnknown_085D8C00
gUnknown_085D8C00:  @ 0x085D8C00
	.incbin "baserom.gba", 0x5D8C00, 0xC

	.global gUnknown_085D8C0C
gUnknown_085D8C0C:  @ 0x085D8C0C
	.incbin "baserom.gba", 0x5D8C0C, 0x18

	.global gUnknown_085D8C24
gUnknown_085D8C24:  @ 0x085D8C24
	.incbin "baserom.gba", 0x5D8C24, 0x28

	.global gUnknown_085D8C4C
gUnknown_085D8C4C:  @ 0x085D8C4C
	.incbin "baserom.gba", 0x5D8C4C, 0x18

	.global gUnknown_085D8C64
gUnknown_085D8C64:  @ 0x085D8C64
	.incbin "baserom.gba", 0x5D8C64, 0x18

	.global gUnknown_085D8C7C
gUnknown_085D8C7C:  @ 0x085D8C7C
	.incbin "baserom.gba", 0x5D8C7C, 0x24

	.global gUnknown_085D8CA0
gUnknown_085D8CA0:  @ 0x085D8CA0
	.incbin "baserom.gba", 0x5D8CA0, 0x24

	.global gUnknown_085D8CC4
gUnknown_085D8CC4:  @ 0x085D8CC4
	.incbin "baserom.gba", 0x5D8CC4, 0x20

	.global gUnknown_085D8CE4
gUnknown_085D8CE4:  @ 0x085D8CE4
	.incbin "baserom.gba", 0x5D8CE4, 0x30

	.global gUnknown_085D8D14
gUnknown_085D8D14:  @ 0x085D8D14
	.incbin "baserom.gba", 0x5D8D14, 0x30

	.global gUnknown_085D8D44
gUnknown_085D8D44:  @ 0x085D8D44
	.incbin "baserom.gba", 0x5D8D44, 0x18

	.global gUnknown_085D8D5C
gUnknown_085D8D5C:  @ 0x085D8D5C
	.incbin "baserom.gba", 0x5D8D5C, 0x18

	.global gUnknown_085D8D74
gUnknown_085D8D74:  @ 0x085D8D74
	.incbin "baserom.gba", 0x5D8D74, 0x18

	.global gUnknown_085D8D8C
gUnknown_085D8D8C:  @ 0x085D8D8C
	.incbin "baserom.gba", 0x5D8D8C, 0x18

	.global gUnknown_085D8DA4
gUnknown_085D8DA4:  @ 0x085D8DA4
	.incbin "baserom.gba", 0x5D8DA4, 0x20

	.global gUnknown_085D8DC4
gUnknown_085D8DC4:  @ 0x085D8DC4
	.incbin "baserom.gba", 0x5D8DC4, 0x18

	.global gUnknown_085D8DDC
gUnknown_085D8DDC:  @ 0x085D8DDC
	.incbin "baserom.gba", 0x5D8DDC, 0x18

	.global gUnknown_085D8DF4
gUnknown_085D8DF4:  @ 0x085D8DF4
	.incbin "baserom.gba", 0x5D8DF4, 0x28

	.global gUnknown_085D8E1C
gUnknown_085D8E1C:  @ 0x085D8E1C
	.incbin "baserom.gba", 0x5D8E1C, 0x18

	.global gUnknown_085D8E34
gUnknown_085D8E34:  @ 0x085D8E34
	.incbin "baserom.gba", 0x5D8E34, 0x18

	.global gUnknown_085D8E4C
gUnknown_085D8E4C:  @ 0x085D8E4C
	.incbin "baserom.gba", 0x5D8E4C, 0x20

	.global gUnknown_085D8E6C
gUnknown_085D8E6C:  @ 0x085D8E6C
	.incbin "baserom.gba", 0x5D8E6C, 0x18

	.global gUnknown_085D8E84
gUnknown_085D8E84:  @ 0x085D8E84
	.incbin "baserom.gba", 0x5D8E84, 0x18

	.global gUnknown_085D8E9C
gUnknown_085D8E9C:  @ 0x085D8E9C
	.incbin "baserom.gba", 0x5D8E9C, 0x28

	.global gUnknown_085D8EC4
gUnknown_085D8EC4:  @ 0x085D8EC4
	.incbin "baserom.gba", 0x5D8EC4, 0x18

	.global gUnknown_085D8EDC
gUnknown_085D8EDC:  @ 0x085D8EDC
	.incbin "baserom.gba", 0x5D8EDC, 0x30

	.global gUnknown_085D8F0C
gUnknown_085D8F0C:  @ 0x085D8F0C
	.incbin "baserom.gba", 0x5D8F0C, 0x18

	.global gUnknown_085D8F24
gUnknown_085D8F24:  @ 0x085D8F24
	.incbin "baserom.gba", 0x5D8F24, 0x38

	.global gUnknown_085D8F5C
gUnknown_085D8F5C:  @ 0x085D8F5C
	.incbin "baserom.gba", 0x5D8F5C, 0x38

	.global gUnknown_085D8F94
gUnknown_085D8F94:  @ 0x085D8F94
	.incbin "baserom.gba", 0x5D8F94, 0x18

	.global gUnknown_085D8FAC
gUnknown_085D8FAC:  @ 0x085D8FAC
	.incbin "baserom.gba", 0x5D8FAC, 0x18

	.global gUnknown_085D8FC4
gUnknown_085D8FC4:  @ 0x085D8FC4
	.incbin "baserom.gba", 0x5D8FC4, 0x18

	.global gUnknown_085D8FDC
gUnknown_085D8FDC:  @ 0x085D8FDC
	.incbin "baserom.gba", 0x5D8FDC, 0x40

	.global gUnknown_085D901C
gUnknown_085D901C:  @ 0x085D901C
	.incbin "baserom.gba", 0x5D901C, 0x18

	.global gUnknown_085D9034
gUnknown_085D9034:  @ 0x085D9034
	.incbin "baserom.gba", 0x5D9034, 0x18

	.global gUnknown_085D904C
gUnknown_085D904C:  @ 0x085D904C
	.incbin "baserom.gba", 0x5D904C, 0x18

	.global gUnknown_085D9064
gUnknown_085D9064:  @ 0x085D9064
	.incbin "baserom.gba", 0x5D9064, 0x18

	.global gUnknown_085D907C
gUnknown_085D907C:  @ 0x085D907C
	.incbin "baserom.gba", 0x5D907C, 0x18

	.global gUnknown_085D9094
gUnknown_085D9094:  @ 0x085D9094
	.incbin "baserom.gba", 0x5D9094, 0x18

	.global gUnknown_085D90AC
gUnknown_085D90AC:  @ 0x085D90AC
	.incbin "baserom.gba", 0x5D90AC, 0x18

	.global gUnknown_085D90C4
gUnknown_085D90C4:  @ 0x085D90C4
	.incbin "baserom.gba", 0x5D90C4, 0x18

	.global gUnknown_085D90DC
gUnknown_085D90DC:  @ 0x085D90DC
	.incbin "baserom.gba", 0x5D90DC, 0x18

	.global gUnknown_085D90F4
gUnknown_085D90F4:  @ 0x085D90F4
	.incbin "baserom.gba", 0x5D90F4, 0x18

	.global gUnknown_085D910C
gUnknown_085D910C:  @ 0x085D910C
	.incbin "baserom.gba", 0x5D910C, 0x18

	.global gUnknown_085D9124
gUnknown_085D9124:  @ 0x085D9124
	.incbin "baserom.gba", 0x5D9124, 0x18

	.global gUnknown_085D913C
gUnknown_085D913C:  @ 0x085D913C
	.incbin "baserom.gba", 0x5D913C, 0x18

	.global gUnknown_085D9154
gUnknown_085D9154:  @ 0x085D9154
	.incbin "baserom.gba", 0x5D9154, 0xF0

	.global gUnknown_085D9244
gUnknown_085D9244:  @ 0x085D9244
	.incbin "baserom.gba", 0x5D9244, 0x18

	.global gUnknown_085D925C
gUnknown_085D925C:  @ 0x085D925C
	.incbin "baserom.gba", 0x5D925C, 0x18

	.global gUnknown_085D9274
gUnknown_085D9274:  @ 0x085D9274
	.incbin "baserom.gba", 0x5D9274, 0x10

	.global gUnknown_085D9284
gUnknown_085D9284:  @ 0x085D9284
	.incbin "baserom.gba", 0x5D9284, 0x20

	.global gUnknown_085D92A4
gUnknown_085D92A4:  @ 0x085D92A4
	.incbin "baserom.gba", 0x5D92A4, 0x18

	.global gUnknown_085D92BC
gUnknown_085D92BC:  @ 0x085D92BC
	.incbin "baserom.gba", 0x5D92BC, 0x18

	.global gUnknown_085D92D4
gUnknown_085D92D4:  @ 0x085D92D4
	.incbin "baserom.gba", 0x5D92D4, 0xC

	.global gUnknown_085D92E0
gUnknown_085D92E0:  @ 0x085D92E0
	.incbin "baserom.gba", 0x5D92E0, 0x20

	.global gUnknown_085D9300
gUnknown_085D9300:  @ 0x085D9300
	.incbin "baserom.gba", 0x5D9300, 0x18

	.global gUnknown_085D9318
gUnknown_085D9318:  @ 0x085D9318
	.incbin "baserom.gba", 0x5D9318, 0x18

	.global gUnknown_085D9330
gUnknown_085D9330:  @ 0x085D9330
	.incbin "baserom.gba", 0x5D9330, 0x40

	.global gUnknown_085D9370
gUnknown_085D9370:  @ 0x085D9370
	.incbin "baserom.gba", 0x5D9370, 0x40

	.global gUnknown_085D93B0
gUnknown_085D93B0:  @ 0x085D93B0
	.incbin "baserom.gba", 0x5D93B0, 0x40

	.global gUnknown_085D93F0
gUnknown_085D93F0:  @ 0x085D93F0
	.incbin "baserom.gba", 0x5D93F0, 0x40

	.global gUnknown_085D9430
gUnknown_085D9430:  @ 0x085D9430
	.incbin "baserom.gba", 0x5D9430, 0x24

	.global gUnknown_085D9454
gUnknown_085D9454:  @ 0x085D9454
	.incbin "baserom.gba", 0x5D9454, 0x28

	.global gUnknown_085D947C
gUnknown_085D947C:  @ 0x085D947C
	.incbin "baserom.gba", 0x5D947C, 0x18

	.global gUnknown_085D9494
gUnknown_085D9494:  @ 0x085D9494
	.incbin "baserom.gba", 0x5D9494, 0x30

	.global gUnknown_085D94C4
gUnknown_085D94C4:  @ 0x085D94C4
	.incbin "baserom.gba", 0x5D94C4, 0x18

	.global gUnknown_085D94DC
gUnknown_085D94DC:  @ 0x085D94DC
	.incbin "baserom.gba", 0x5D94DC, 0x28

	.global gUnknown_085D9504
gUnknown_085D9504:  @ 0x085D9504
	.incbin "baserom.gba", 0x5D9504, 0x18

	.global gUnknown_085D951C
gUnknown_085D951C:  @ 0x085D951C
	.incbin "baserom.gba", 0x5D951C, 0x8

	.global gUnknown_085D9524
gUnknown_085D9524:  @ 0x085D9524
	.incbin "baserom.gba", 0x5D9524, 0x20

	.global gUnknown_085D9544
gUnknown_085D9544:  @ 0x085D9544
	.incbin "baserom.gba", 0x5D9544, 0x18

	.global gUnknown_085D955C
gUnknown_085D955C:  @ 0x085D955C
	.incbin "baserom.gba", 0x5D955C, 0x28

	.global gUnknown_085D9584
gUnknown_085D9584:  @ 0x085D9584
	.incbin "baserom.gba", 0x5D9584, 0x18

	.global gUnknown_085D959C
gUnknown_085D959C:  @ 0x085D959C
	.incbin "baserom.gba", 0x5D959C, 0x4

	.global gUnknown_085D95A0
gUnknown_085D95A0:  @ 0x085D95A0
	.incbin "baserom.gba", 0x5D95A0, 0x20

	.global gUnknown_085D95C0
gUnknown_085D95C0:  @ 0x085D95C0
	.incbin "baserom.gba", 0x5D95C0, 0x20

	.global gUnknown_085D95E0
gUnknown_085D95E0:  @ 0x085D95E0
	.incbin "baserom.gba", 0x5D95E0, 0x18

	.global gUnknown_085D95F8
gUnknown_085D95F8:  @ 0x085D95F8
	.incbin "baserom.gba", 0x5D95F8, 0x28

	.global gUnknown_085D9620
gUnknown_085D9620:  @ 0x085D9620
	.incbin "baserom.gba", 0x5D9620, 0x18

	.global gUnknown_085D9638
gUnknown_085D9638:  @ 0x085D9638
	.incbin "baserom.gba", 0x5D9638, 0x84

	.global gUnknown_085D96BC
gUnknown_085D96BC:  @ 0x085D96BC
	.incbin "baserom.gba", 0x5D96BC, 0x84

	.global gUnknown_085D9740
gUnknown_085D9740:  @ 0x085D9740
	.incbin "baserom.gba", 0x5D9740, 0x84

	.global gUnknown_085D97C4
gUnknown_085D97C4:  @ 0x085D97C4
	.incbin "baserom.gba", 0x5D97C4, 0x18

	.global gUnknown_085D97DC
gUnknown_085D97DC:  @ 0x085D97DC
	.incbin "baserom.gba", 0x5D97DC, 0xA4

	.global gUnknown_085D9880
gUnknown_085D9880:  @ 0x085D9880
	.incbin "baserom.gba", 0x5D9880, 0xA4

	.global gUnknown_085D9924
gUnknown_085D9924:  @ 0x085D9924
	.incbin "baserom.gba", 0x5D9924, 0x48

	.global gUnknown_085D996C
gUnknown_085D996C:  @ 0x085D996C
	.incbin "baserom.gba", 0x5D996C, 0x30

	.global gUnknown_085D999C
gUnknown_085D999C:  @ 0x085D999C
	.incbin "baserom.gba", 0x5D999C, 0x28

	.global gUnknown_085D99C4
gUnknown_085D99C4:  @ 0x085D99C4
	.incbin "baserom.gba", 0x5D99C4, 0x28

	.global gUnknown_085D99EC
gUnknown_085D99EC:  @ 0x085D99EC
	.incbin "baserom.gba", 0x5D99EC, 0x30

	.global gUnknown_085D9A1C
gUnknown_085D9A1C:  @ 0x085D9A1C
	.incbin "baserom.gba", 0x5D9A1C, 0x10

	.global gUnknown_085D9A2C
gUnknown_085D9A2C:  @ 0x085D9A2C
	.incbin "baserom.gba", 0x5D9A2C, 0x68

	.global gUnknown_085D9A94
gUnknown_085D9A94:  @ 0x085D9A94
	.incbin "baserom.gba", 0x5D9A94, 0x68

	.global gUnknown_085D9AFC
gUnknown_085D9AFC:  @ 0x085D9AFC
	.incbin "baserom.gba", 0x5D9AFC, 0x68

	.global gUnknown_085D9B64
gUnknown_085D9B64:  @ 0x085D9B64
	.incbin "baserom.gba", 0x5D9B64, 0x10

	.global gUnknown_085D9B74
gUnknown_085D9B74:  @ 0x085D9B74
	.incbin "baserom.gba", 0x5D9B74, 0x30

	.global gUnknown_085D9BA4
gUnknown_085D9BA4:  @ 0x085D9BA4
	.incbin "baserom.gba", 0x5D9BA4, 0x10

	.global gUnknown_085D9BB4
gUnknown_085D9BB4:  @ 0x085D9BB4
	.incbin "baserom.gba", 0x5D9BB4, 0x4C

	.global gUnknown_085D9C00
gUnknown_085D9C00:  @ 0x085D9C00
	.incbin "baserom.gba", 0x5D9C00, 0x4C

	.global gUnknown_085D9C4C
gUnknown_085D9C4C:  @ 0x085D9C4C
	.incbin "baserom.gba", 0x5D9C4C, 0x10

	.global gUnknown_085D9C5C
gUnknown_085D9C5C:  @ 0x085D9C5C
	.incbin "baserom.gba", 0x5D9C5C, 0x400

	.global gUnknown_085DA05C
gUnknown_085DA05C:  @ 0x085DA05C
	.incbin "baserom.gba", 0x5DA05C, 0x308

	.global gUnknown_085DA364
gUnknown_085DA364:  @ 0x085DA364
	.incbin "baserom.gba", 0x5DA364, 0x5C

	.global gUnknown_085DA3C0
gUnknown_085DA3C0:  @ 0x085DA3C0
	.incbin "baserom.gba", 0x5DA3C0, 0x20

	.global gUnknown_085DA3E0
gUnknown_085DA3E0:  @ 0x085DA3E0
	.incbin "baserom.gba", 0x5DA3E0, 0x31C

	.global gUnknown_085DA6FC
gUnknown_085DA6FC:  @ 0x085DA6FC
	.incbin "baserom.gba", 0x5DA6FC, 0x5C

	.global gUnknown_085DA758
gUnknown_085DA758:  @ 0x085DA758
	.incbin "baserom.gba", 0x5DA758, 0x20

	.global gUnknown_085DA778
gUnknown_085DA778:  @ 0x085DA778
	.incbin "baserom.gba", 0x5DA778, 0x34

	.global gUnknown_085DA7AC
gUnknown_085DA7AC:  @ 0x085DA7AC
	.incbin "baserom.gba", 0x5DA7AC, 0xA8

	.global gUnknown_085DA854
gUnknown_085DA854:  @ 0x085DA854
	.incbin "baserom.gba", 0x5DA854, 0x10

	.global gUnknown_085DA864
gUnknown_085DA864:  @ 0x085DA864
	.incbin "baserom.gba", 0x5DA864, 0x7C

	.global gUnknown_085DA8E0
gUnknown_085DA8E0:  @ 0x085DA8E0
	.incbin "baserom.gba", 0x5DA8E0, 0x10

	.global gUnknown_085DA8F0
gUnknown_085DA8F0:  @ 0x085DA8F0
	.incbin "baserom.gba", 0x5DA8F0, 0x10

	.global gUnknown_085DA900
gUnknown_085DA900:  @ 0x085DA900
	.incbin "baserom.gba", 0x5DA900, 0x230

	.global gUnknown_085DAB30
gUnknown_085DAB30:  @ 0x085DAB30
	.incbin "baserom.gba", 0x5DAB30, 0x20

	.global gUnknown_085DAB50
gUnknown_085DAB50:  @ 0x085DAB50
	.incbin "baserom.gba", 0x5DAB50, 0x21C

	.global gUnknown_085DAD6C
gUnknown_085DAD6C:  @ 0x085DAD6C
	.incbin "baserom.gba", 0x5DAD6C, 0x20

	.global gUnknown_085DAD8C
gUnknown_085DAD8C:  @ 0x085DAD8C
	.incbin "baserom.gba", 0x5DAD8C, 0x218

	.global gUnknown_085DAFA4
gUnknown_085DAFA4:  @ 0x085DAFA4
	.incbin "baserom.gba", 0x5DAFA4, 0x20

	.global gUnknown_085DAFC4
gUnknown_085DAFC4:  @ 0x085DAFC4
	.incbin "baserom.gba", 0x5DAFC4, 0x21C

	.global gUnknown_085DB1E0
gUnknown_085DB1E0:  @ 0x085DB1E0
	.incbin "baserom.gba", 0x5DB1E0, 0x20

	.global gUnknown_085DB200
gUnknown_085DB200:  @ 0x085DB200
	.incbin "baserom.gba", 0x5DB200, 0x22C

	.global gUnknown_085DB42C
gUnknown_085DB42C:  @ 0x085DB42C
	.incbin "baserom.gba", 0x5DB42C, 0x20

	.global gUnknown_085DB44C
gUnknown_085DB44C:  @ 0x085DB44C
	.incbin "baserom.gba", 0x5DB44C, 0x248

	.global gUnknown_085DB694
gUnknown_085DB694:  @ 0x085DB694
	.incbin "baserom.gba", 0x5DB694, 0x20

	.global gUnknown_085DB6B4
gUnknown_085DB6B4:  @ 0x085DB6B4
	.incbin "baserom.gba", 0x5DB6B4, 0x238

	.global gUnknown_085DB8EC
gUnknown_085DB8EC:  @ 0x085DB8EC
	.incbin "baserom.gba", 0x5DB8EC, 0x20

	.global gUnknown_085DB90C
gUnknown_085DB90C:  @ 0x085DB90C
	.incbin "baserom.gba", 0x5DB90C, 0x264

	.global gUnknown_085DBB70
gUnknown_085DBB70:  @ 0x085DBB70
	.incbin "baserom.gba", 0x5DBB70, 0x20

	.global gUnknown_085DBB90
gUnknown_085DBB90:  @ 0x085DBB90
	.incbin "baserom.gba", 0x5DBB90, 0x270

	.global gUnknown_085DBE00
gUnknown_085DBE00:  @ 0x085DBE00
	.incbin "baserom.gba", 0x5DBE00, 0x20

	.global gUnknown_085DBE20
gUnknown_085DBE20:  @ 0x085DBE20
	.incbin "baserom.gba", 0x5DBE20, 0x230

	.global gUnknown_085DC050
gUnknown_085DC050:  @ 0x085DC050
	.incbin "baserom.gba", 0x5DC050, 0x1F4

	.global gUnknown_085DC244
gUnknown_085DC244:  @ 0x085DC244
	.incbin "baserom.gba", 0x5DC244, 0x254

	.global gUnknown_085DC498
gUnknown_085DC498:  @ 0x085DC498
	.incbin "baserom.gba", 0x5DC498, 0x260

	.global gUnknown_085DC6F8
gUnknown_085DC6F8:  @ 0x085DC6F8
	.incbin "baserom.gba", 0x5DC6F8, 0x260

	.global gUnknown_085DC958
gUnknown_085DC958:  @ 0x085DC958
	.incbin "baserom.gba", 0x5DC958, 0x104

	.global gUnknown_085DCA5C
gUnknown_085DCA5C:  @ 0x085DCA5C
	.incbin "baserom.gba", 0x5DCA5C, 0x9C

	.global gUnknown_085DCAF8
gUnknown_085DCAF8:  @ 0x085DCAF8
	.incbin "baserom.gba", 0x5DCAF8, 0x18

	.global gUnknown_085DCB10
gUnknown_085DCB10:  @ 0x085DCB10
	.incbin "baserom.gba", 0x5DCB10, 0x174

	.global gUnknown_085DCC84
gUnknown_085DCC84:  @ 0x085DCC84
	.incbin "baserom.gba", 0x5DCC84, 0x800

	.global gUnknown_085DD484
gUnknown_085DD484:  @ 0x085DD484
	.incbin "baserom.gba", 0x5DD484, 0x30

	.global gUnknown_085DD4B4
gUnknown_085DD4B4:  @ 0x085DD4B4
	.incbin "baserom.gba", 0x5DD4B4, 0x7B0

	.global gUnknown_085DDC64
gUnknown_085DDC64:  @ 0x085DDC64
	.incbin "baserom.gba", 0x5DDC64, 0xD00

	.global gUnknown_085DE964
gUnknown_085DE964:  @ 0x085DE964
	.incbin "baserom.gba", 0x5DE964, 0x20

	.global gUnknown_085DE984
gUnknown_085DE984:  @ 0x085DE984
	.incbin "baserom.gba", 0x5DE984, 0x8A0

	.global gUnknown_085DF224
gUnknown_085DF224:  @ 0x085DF224
	.incbin "baserom.gba", 0x5DF224, 0x7E4

	.global gUnknown_085DFA08
gUnknown_085DFA08:  @ 0x085DFA08
	.incbin "baserom.gba", 0x5DFA08, 0x20

	.global gUnknown_085DFA28
gUnknown_085DFA28:  @ 0x085DFA28
	.incbin "baserom.gba", 0x5DFA28, 0x20

	.global gUnknown_085DFA48
gUnknown_085DFA48:  @ 0x085DFA48
	.incbin "baserom.gba", 0x5DFA48, 0x20

	.global gUnknown_085DFA68
gUnknown_085DFA68:  @ 0x085DFA68
	.incbin "baserom.gba", 0x5DFA68, 0xC14

	.global gUnknown_085E067C
gUnknown_085E067C:  @ 0x085E067C
	.incbin "baserom.gba", 0x5E067C, 0xC60

	.global gUnknown_085E12DC
gUnknown_085E12DC:  @ 0x085E12DC
	.incbin "baserom.gba", 0x5E12DC, 0x318

	.global gUnknown_085E15F4
gUnknown_085E15F4:  @ 0x085E15F4
	.incbin "baserom.gba", 0x5E15F4, 0x48

	.global gUnknown_085E163C
gUnknown_085E163C:  @ 0x085E163C
	.incbin "baserom.gba", 0x5E163C, 0x324

	.global gUnknown_085E1960
gUnknown_085E1960:  @ 0x085E1960
	.incbin "baserom.gba", 0x5E1960, 0x48

	.global gUnknown_085E19A8
gUnknown_085E19A8:  @ 0x085E19A8
	.incbin "baserom.gba", 0x5E19A8, 0x2A0

	.global gUnknown_085E1C48
gUnknown_085E1C48:  @ 0x085E1C48
	.incbin "baserom.gba", 0x5E1C48, 0x10

	.global gUnknown_085E1C58
gUnknown_085E1C58:  @ 0x085E1C58
	.incbin "baserom.gba", 0x5E1C58, 0x24C

	.global gUnknown_085E1EA4
gUnknown_085E1EA4:  @ 0x085E1EA4
	.incbin "baserom.gba", 0x5E1EA4, 0x10

	.global gUnknown_085E1EB4
gUnknown_085E1EB4:  @ 0x085E1EB4
	.incbin "baserom.gba", 0x5E1EB4, 0xB70

	.global gUnknown_085E2A24
gUnknown_085E2A24:  @ 0x085E2A24
	.incbin "baserom.gba", 0x5E2A24, 0xBB8

	.global gUnknown_085E35DC
gUnknown_085E35DC:  @ 0x085E35DC
	.incbin "baserom.gba", 0x5E35DC, 0xC30

	.global gUnknown_085E420C
gUnknown_085E420C:  @ 0x085E420C
	.incbin "baserom.gba", 0x5E420C, 0xC30

	.global gUnknown_085E4E3C
gUnknown_085E4E3C:  @ 0x085E4E3C
	.incbin "baserom.gba", 0x5E4E3C, 0xC3C

	.global gUnknown_085E5A78
gUnknown_085E5A78:  @ 0x085E5A78
	.incbin "baserom.gba", 0x5E5A78, 0x6C

	.global gUnknown_085E5AE4
gUnknown_085E5AE4:  @ 0x085E5AE4
	.incbin "baserom.gba", 0x5E5AE4, 0x1544

	.global gUnknown_085E7028
gUnknown_085E7028:  @ 0x085E7028
	.incbin "baserom.gba", 0x5E7028, 0x10E0

	.global gUnknown_085E8108
gUnknown_085E8108:  @ 0x085E8108
	.incbin "baserom.gba", 0x5E8108, 0x200

	.global gUnknown_085E8308
gUnknown_085E8308:  @ 0x085E8308
	.incbin "baserom.gba", 0x5E8308, 0x4A0

	.global gUnknown_085E87A8
gUnknown_085E87A8:  @ 0x085E87A8
	.incbin "baserom.gba", 0x5E87A8, 0x45C

	.global gUnknown_085E8C04
gUnknown_085E8C04:  @ 0x085E8C04
	.incbin "baserom.gba", 0x5E8C04, 0xC0

	.global gUnknown_085E8CC4
gUnknown_085E8CC4:  @ 0x085E8CC4
	.incbin "baserom.gba", 0x5E8CC4, 0x20

	.global gUnknown_085E8CE4
gUnknown_085E8CE4:  @ 0x085E8CE4
	.incbin "baserom.gba", 0x5E8CE4, 0xA4

	.global gUnknown_085E8D88
gUnknown_085E8D88:  @ 0x085E8D88
	.incbin "baserom.gba", 0x5E8D88, 0x3C8

	.global gUnknown_085E9150
gUnknown_085E9150:  @ 0x085E9150
	.incbin "baserom.gba", 0x5E9150, 0x1A08

	.global gUnknown_085EAB58
gUnknown_085EAB58:  @ 0x085EAB58
	.incbin "baserom.gba", 0x5EAB58, 0x104

	.global gUnknown_085EAC5C
gUnknown_085EAC5C:  @ 0x085EAC5C
	.incbin "baserom.gba", 0x5EAC5C, 0x28

	.global gUnknown_085EAC84
gUnknown_085EAC84:  @ 0x085EAC84
	.incbin "baserom.gba", 0x5EAC84, 0x1174

	.global gUnknown_085EBDF8
gUnknown_085EBDF8:  @ 0x085EBDF8
	.incbin "baserom.gba", 0x5EBDF8, 0x104

	.global gUnknown_085EBEFC
gUnknown_085EBEFC:  @ 0x085EBEFC
	.incbin "baserom.gba", 0x5EBEFC, 0x28

	.global gUnknown_085EBF24
gUnknown_085EBF24:  @ 0x085EBF24
	.incbin "baserom.gba", 0x5EBF24, 0x11A4

	.global gUnknown_085ED0C8
gUnknown_085ED0C8:  @ 0x085ED0C8
	.incbin "baserom.gba", 0x5ED0C8, 0x104

	.global gUnknown_085ED1CC
gUnknown_085ED1CC:  @ 0x085ED1CC
	.incbin "baserom.gba", 0x5ED1CC, 0x28

	.global gUnknown_085ED1F4
gUnknown_085ED1F4:  @ 0x085ED1F4
	.incbin "baserom.gba", 0x5ED1F4, 0x11A4

	.global gUnknown_085EE398
gUnknown_085EE398:  @ 0x085EE398
	.incbin "baserom.gba", 0x5EE398, 0x104

	.global gUnknown_085EE49C
gUnknown_085EE49C:  @ 0x085EE49C
	.incbin "baserom.gba", 0x5EE49C, 0x28

	.global gUnknown_085EE4C4
gUnknown_085EE4C4:  @ 0x085EE4C4
	.incbin "baserom.gba", 0x5EE4C4, 0x34

	.global gUnknown_085EE4F8
gUnknown_085EE4F8:  @ 0x085EE4F8
	.incbin "baserom.gba", 0x5EE4F8, 0xD54

	.global gUnknown_085EF24C
gUnknown_085EF24C:  @ 0x085EF24C
	.incbin "baserom.gba", 0x5EF24C, 0xF44

	.global gUnknown_085F0190
gUnknown_085F0190:  @ 0x085F0190
	.incbin "baserom.gba", 0x5F0190, 0xC74

	.global gUnknown_085F0E04
gUnknown_085F0E04:  @ 0x085F0E04
	.incbin "baserom.gba", 0x5F0E04, 0x3AC

	.global gUnknown_085F11B0
gUnknown_085F11B0:  @ 0x085F11B0
	.incbin "baserom.gba", 0x5F11B0, 0x470

	.global gUnknown_085F1620
gUnknown_085F1620:  @ 0x085F1620
	.incbin "baserom.gba", 0x5F1620, 0x20

	.global gUnknown_085F1640
gUnknown_085F1640:  @ 0x085F1640
	.incbin "baserom.gba", 0x5F1640, 0x20

	.global gUnknown_085F1660
gUnknown_085F1660:  @ 0x085F1660
	.incbin "baserom.gba", 0x5F1660, 0xB0

	.global gUnknown_085F1710
gUnknown_085F1710:  @ 0x085F1710
	.incbin "baserom.gba", 0x5F1710, 0xA4

	.global gUnknown_085F17B4
gUnknown_085F17B4:  @ 0x085F17B4
	.incbin "baserom.gba", 0x5F17B4, 0xA4

	.global gUnknown_085F1858
gUnknown_085F1858:  @ 0x085F1858
	.incbin "baserom.gba", 0x5F1858, 0xA4

	.global gUnknown_085F18FC
gUnknown_085F18FC:  @ 0x085F18FC
	.incbin "baserom.gba", 0x5F18FC, 0xA4

	.global gUnknown_085F19A0
gUnknown_085F19A0:  @ 0x085F19A0
	.incbin "baserom.gba", 0x5F19A0, 0xA4

	.global gUnknown_085F1A44
gUnknown_085F1A44:  @ 0x085F1A44
	.incbin "baserom.gba", 0x5F1A44, 0x194

	.global gUnknown_085F1BD8
gUnknown_085F1BD8:  @ 0x085F1BD8
	.incbin "baserom.gba", 0x5F1BD8, 0x194

	.global gUnknown_085F1D6C
gUnknown_085F1D6C:  @ 0x085F1D6C
	.incbin "baserom.gba", 0x5F1D6C, 0x1AC

	.global gUnknown_085F1F18
gUnknown_085F1F18:  @ 0x085F1F18
	.incbin "baserom.gba", 0x5F1F18, 0x1AC

	.global gUnknown_085F20C4
gUnknown_085F20C4:  @ 0x085F20C4
	.incbin "baserom.gba", 0x5F20C4, 0x1AC

	.global gUnknown_085F2270
gUnknown_085F2270:  @ 0x085F2270
	.incbin "baserom.gba", 0x5F2270, 0x1A8

	.global gUnknown_085F2418
gUnknown_085F2418:  @ 0x085F2418
	.incbin "baserom.gba", 0x5F2418, 0xDC

	.global gUnknown_085F24F4
gUnknown_085F24F4:  @ 0x085F24F4
	.incbin "baserom.gba", 0x5F24F4, 0xE4

	.global gUnknown_085F25D8
gUnknown_085F25D8:  @ 0x085F25D8
	.incbin "baserom.gba", 0x5F25D8, 0x108

	.global gUnknown_085F26E0
gUnknown_085F26E0:  @ 0x085F26E0
	.incbin "baserom.gba", 0x5F26E0, 0x104

	.global gUnknown_085F27E4
gUnknown_085F27E4:  @ 0x085F27E4
	.incbin "baserom.gba", 0x5F27E4, 0x1DC

	.global gUnknown_085F29C0
gUnknown_085F29C0:  @ 0x085F29C0
	.incbin "baserom.gba", 0x5F29C0, 0x27C

	.global gUnknown_085F2C3C
gUnknown_085F2C3C:  @ 0x085F2C3C
	.incbin "baserom.gba", 0x5F2C3C, 0x108

	.global gUnknown_085F2D44
gUnknown_085F2D44:  @ 0x085F2D44
	.incbin "baserom.gba", 0x5F2D44, 0x68

	.global gUnknown_085F2DAC
gUnknown_085F2DAC:  @ 0x085F2DAC
	.incbin "baserom.gba", 0x5F2DAC, 0x14

	.global gUnknown_085F2DC0
gUnknown_085F2DC0:  @ 0x085F2DC0
	.incbin "baserom.gba", 0x5F2DC0, 0x8BC

	.global gUnknown_085F367C
gUnknown_085F367C:  @ 0x085F367C
	.incbin "baserom.gba", 0x5F367C, 0x42C

	.global gUnknown_085F3AA8
gUnknown_085F3AA8:  @ 0x085F3AA8
	.incbin "baserom.gba", 0x5F3AA8, 0x498

	.global gUnknown_085F3F40
gUnknown_085F3F40:  @ 0x085F3F40
	.incbin "baserom.gba", 0x5F3F40, 0xAE4

	.global gUnknown_085F4A24
gUnknown_085F4A24:  @ 0x085F4A24
	.incbin "baserom.gba", 0x5F4A24, 0xB2C

	.global gUnknown_085F5550
gUnknown_085F5550:  @ 0x085F5550
	.incbin "baserom.gba", 0x5F5550, 0xE8

	.global gUnknown_085F5638
gUnknown_085F5638:  @ 0x085F5638
	.incbin "baserom.gba", 0x5F5638, 0xBF8

	.global gUnknown_085F6230
gUnknown_085F6230:  @ 0x085F6230
	.incbin "baserom.gba", 0x5F6230, 0x1538

	.global gUnknown_085F7768
gUnknown_085F7768:  @ 0x085F7768
	.incbin "baserom.gba", 0x5F7768, 0x5FC

	.global gUnknown_085F7D64
gUnknown_085F7D64:  @ 0x085F7D64
	.incbin "baserom.gba", 0x5F7D64, 0x350

	.global gUnknown_085F80B4
gUnknown_085F80B4:  @ 0x085F80B4
	.incbin "baserom.gba", 0x5F80B4, 0x2C

	.global gUnknown_085F80E0
gUnknown_085F80E0:  @ 0x085F80E0
	.incbin "baserom.gba", 0x5F80E0, 0x35C

	.global gUnknown_085F843C
gUnknown_085F843C:  @ 0x085F843C
	.incbin "baserom.gba", 0x5F843C, 0x2C

	.global gUnknown_085F8468
gUnknown_085F8468:  @ 0x085F8468
	.incbin "baserom.gba", 0x5F8468, 0x8C24

	.global gUnknown_0860108C
gUnknown_0860108C:  @ 0x0860108C
	.incbin "baserom.gba", 0x60108C, 0x1B08

	.global gUnknown_08602B94
gUnknown_08602B94:  @ 0x08602B94
	.incbin "baserom.gba", 0x602B94, 0xFBC

	.global gUnknown_08603B50
gUnknown_08603B50:  @ 0x08603B50
	.incbin "baserom.gba", 0x603B50, 0x200

	.global gUnknown_08603D50
gUnknown_08603D50:  @ 0x08603D50
	.incbin "baserom.gba", 0x603D50, 0x248

	.global gUnknown_08603F98
gUnknown_08603F98:  @ 0x08603F98
	.incbin "baserom.gba", 0x603F98, 0x278

	.global gUnknown_08604210
gUnknown_08604210:  @ 0x08604210
	.incbin "baserom.gba", 0x604210, 0xDC4

	.global gUnknown_08604FD4
gUnknown_08604FD4:  @ 0x08604FD4
	.incbin "baserom.gba", 0x604FD4, 0xE20

	.global gUnknown_08605DF4
gUnknown_08605DF4:  @ 0x08605DF4
	.incbin "baserom.gba", 0x605DF4, 0x2A44

	.global gUnknown_08608838
gUnknown_08608838:  @ 0x08608838
	.incbin "baserom.gba", 0x608838, 0x1D9C

	.global gUnknown_0860A5D4
gUnknown_0860A5D4:  @ 0x0860A5D4
	.incbin "baserom.gba", 0x60A5D4, 0x5C08

	.global gUnknown_086101DC
gUnknown_086101DC:  @ 0x086101DC
	.incbin "baserom.gba", 0x6101DC, 0x7D28

	.global gUnknown_08617F04
gUnknown_08617F04:  @ 0x08617F04
	.incbin "baserom.gba", 0x617F04, 0xCB8

	.global gUnknown_08618BBC
gUnknown_08618BBC:  @ 0x08618BBC
	.incbin "baserom.gba", 0x618BBC, 0x20FC

	.global gUnknown_0861ACB8
gUnknown_0861ACB8:  @ 0x0861ACB8
	.incbin "baserom.gba", 0x61ACB8, 0x6C

	.global gUnknown_0861AD24
gUnknown_0861AD24:  @ 0x0861AD24
	.incbin "baserom.gba", 0x61AD24, 0x60

	.global gUnknown_0861AD84
gUnknown_0861AD84:  @ 0x0861AD84
	.incbin "baserom.gba", 0x61AD84, 0x8

	.global gUnknown_0861AD8C
gUnknown_0861AD8C:  @ 0x0861AD8C
	.incbin "baserom.gba", 0x61AD8C, 0x6BD4

	.global gUnknown_08621960
gUnknown_08621960:  @ 0x08621960
	.incbin "baserom.gba", 0x621960, 0x15CC

	.global gUnknown_08622F2C
gUnknown_08622F2C:  @ 0x08622F2C
	.incbin "baserom.gba", 0x622F2C, 0x5AC

	.global gUnknown_086234D8
gUnknown_086234D8:  @ 0x086234D8
	.incbin "baserom.gba", 0x6234D8, 0x5C4

	.global gUnknown_08623A9C
gUnknown_08623A9C:  @ 0x08623A9C
	.incbin "baserom.gba", 0x623A9C, 0x15F8

	.global gUnknown_08625094
gUnknown_08625094:  @ 0x08625094
	.incbin "baserom.gba", 0x625094, 0xB4

	.global gUnknown_08625148
gUnknown_08625148:  @ 0x08625148
	.incbin "baserom.gba", 0x625148, 0x1690

	.global gUnknown_086267D8
gUnknown_086267D8:  @ 0x086267D8
	.incbin "baserom.gba", 0x6267D8, 0xB4

	.global gUnknown_0862688C
gUnknown_0862688C:  @ 0x0862688C
	.incbin "baserom.gba", 0x62688C, 0x3A44

	.global gUnknown_0862A2D0
gUnknown_0862A2D0:  @ 0x0862A2D0
	.incbin "baserom.gba", 0x62A2D0, 0x20

	.global gUnknown_0862A2F0
gUnknown_0862A2F0:  @ 0x0862A2F0
	.incbin "baserom.gba", 0x62A2F0, 0x253C

	.global gUnknown_0862C82C
gUnknown_0862C82C:  @ 0x0862C82C
	.incbin "baserom.gba", 0x62C82C, 0x400

	.global gUnknown_0862CC2C
gUnknown_0862CC2C:  @ 0x0862CC2C
	.incbin "baserom.gba", 0x62CC2C, 0x440

	.global gUnknown_0862D06C
gUnknown_0862D06C:  @ 0x0862D06C
	.incbin "baserom.gba", 0x62D06C, 0x3B8

	.global gUnknown_0862D424
gUnknown_0862D424:  @ 0x0862D424
	.incbin "baserom.gba", 0x62D424, 0x284

	.global gUnknown_0862D6A8
gUnknown_0862D6A8:  @ 0x0862D6A8
	.incbin "baserom.gba", 0x62D6A8, 0x38

	.global gUnknown_0862D6E0
gUnknown_0862D6E0:  @ 0x0862D6E0
	.incbin "baserom.gba", 0x62D6E0, 0x14C

	.global gUnknown_0862D82C
gUnknown_0862D82C:  @ 0x0862D82C
	.incbin "baserom.gba", 0x62D82C, 0x3F8

	.global gUnknown_0862DC24
gUnknown_0862DC24:  @ 0x0862DC24
	.incbin "baserom.gba", 0x62DC24, 0x34

	.global gUnknown_0862DC58
gUnknown_0862DC58:  @ 0x0862DC58
	.incbin "baserom.gba", 0x62DC58, 0x88

	.global gUnknown_0862DCE0
gUnknown_0862DCE0:  @ 0x0862DCE0
	.incbin "baserom.gba", 0x62DCE0, 0x8960

	.global gUnknown_08636640
gUnknown_08636640:  @ 0x08636640
	.incbin "baserom.gba", 0x636640, 0xB724

	.global gUnknown_08641D64
gUnknown_08641D64:  @ 0x08641D64
	.incbin "baserom.gba", 0x641D64, 0x20

	.global gUnknown_08641D84
gUnknown_08641D84:  @ 0x08641D84
	.incbin "baserom.gba", 0x641D84, 0x4054

	.global gUnknown_08645DD8
gUnknown_08645DD8:  @ 0x08645DD8
	.incbin "baserom.gba", 0x645DD8, 0x16C

	.global gUnknown_08645F44
gUnknown_08645F44:  @ 0x08645F44
	.incbin "baserom.gba", 0x645F44, 0x5CC

	.global gUnknown_08646510
gUnknown_08646510:  @ 0x08646510
	.incbin "baserom.gba", 0x646510, 0x8280

	.global gUnknown_0864E790
gUnknown_0864E790:  @ 0x0864E790
	.incbin "baserom.gba", 0x64E790, 0x20

	.global gUnknown_0864E7B0
gUnknown_0864E7B0:  @ 0x0864E7B0
	.incbin "baserom.gba", 0x64E7B0, 0x212C

	.global gUnknown_086508DC
gUnknown_086508DC:  @ 0x086508DC
	.incbin "baserom.gba", 0x6508DC, 0x4CC

	.global gUnknown_08650DA8
gUnknown_08650DA8:  @ 0x08650DA8
	.incbin "baserom.gba", 0x650DA8, 0x498

	.global gUnknown_08651240
gUnknown_08651240:  @ 0x08651240
	.incbin "baserom.gba", 0x651240, 0x3FC

	.global gUnknown_0865163C
gUnknown_0865163C:  @ 0x0865163C
	.incbin "baserom.gba", 0x65163C, 0x1A0

	.global gUnknown_086517DC
gUnknown_086517DC:  @ 0x086517DC
	.incbin "baserom.gba", 0x6517DC, 0x308

	.global gUnknown_08651AE4
gUnknown_08651AE4:  @ 0x08651AE4
	.incbin "baserom.gba", 0x651AE4, 0x2FC

	.global gUnknown_08651DE0
gUnknown_08651DE0:  @ 0x08651DE0
	.incbin "baserom.gba", 0x651DE0, 0x14

	.global gUnknown_08651DF4
gUnknown_08651DF4:  @ 0x08651DF4
	.incbin "baserom.gba", 0x651DF4, 0x760

	.global gUnknown_08652554
gUnknown_08652554:  @ 0x08652554
	.incbin "baserom.gba", 0x652554, 0x1E0

	.global gUnknown_08652734
gUnknown_08652734:  @ 0x08652734
	.incbin "baserom.gba", 0x652734, 0x41C0

	.global gUnknown_086568F4
gUnknown_086568F4:  @ 0x086568F4
	.incbin "baserom.gba", 0x6568F4, 0x20

	.global gUnknown_08656914
gUnknown_08656914:  @ 0x08656914
	.incbin "baserom.gba", 0x656914, 0x4628

	.global gUnknown_0865AF3C
gUnknown_0865AF3C:  @ 0x0865AF3C
	.incbin "baserom.gba", 0x65AF3C, 0xB7C

	.global gUnknown_0865BAB8
gUnknown_0865BAB8:  @ 0x0865BAB8
	.incbin "baserom.gba", 0x65BAB8, 0x20

	.global gUnknown_0865BAD8
gUnknown_0865BAD8:  @ 0x0865BAD8
	.incbin "baserom.gba", 0x65BAD8, 0xCA4

	.global gUnknown_0865C77C
gUnknown_0865C77C:  @ 0x0865C77C
	.incbin "baserom.gba", 0x65C77C, 0x2C

	.global gUnknown_0865C7A8
gUnknown_0865C7A8:  @ 0x0865C7A8
	.incbin "baserom.gba", 0x65C7A8, 0x2C

	.global gUnknown_0865C7D4
gUnknown_0865C7D4:  @ 0x0865C7D4
	.incbin "baserom.gba", 0x65C7D4, 0x1281C

	.global gUnknown_0866EFF0
gUnknown_0866EFF0:  @ 0x0866EFF0
	.incbin "baserom.gba", 0x66EFF0, 0x2C4

	.global gUnknown_0866F2B4
gUnknown_0866F2B4:  @ 0x0866F2B4
	.incbin "baserom.gba", 0x66F2B4, 0x2D8

	.global gUnknown_0866F58C
gUnknown_0866F58C:  @ 0x0866F58C
	.incbin "baserom.gba", 0x66F58C, 0x58

	.global gUnknown_0866F5E4
gUnknown_0866F5E4:  @ 0x0866F5E4
	.incbin "baserom.gba", 0x66F5E4, 0x190

	.global gUnknown_0866F774
gUnknown_0866F774:  @ 0x0866F774
	.incbin "baserom.gba", 0x66F774, 0x960

	.global gUnknown_086700D4
gUnknown_086700D4:  @ 0x086700D4
	.incbin "baserom.gba", 0x6700D4, 0x200

	.global gUnknown_086702D4
gUnknown_086702D4:  @ 0x086702D4
	.incbin "baserom.gba", 0x6702D4, 0x254

	.global gUnknown_08670528
gUnknown_08670528:  @ 0x08670528
	.incbin "baserom.gba", 0x670528, 0x20

	.global gUnknown_08670548
gUnknown_08670548:  @ 0x08670548
	.incbin "baserom.gba", 0x670548, 0x7F8

	.global gUnknown_08670D40
gUnknown_08670D40:  @ 0x08670D40
	.incbin "baserom.gba", 0x670D40, 0x960

	.global gUnknown_086716A0
gUnknown_086716A0:  @ 0x086716A0
	.incbin "baserom.gba", 0x6716A0, 0x960

	.global gUnknown_08672000
gUnknown_08672000:  @ 0x08672000
	.incbin "baserom.gba", 0x672000, 0x220

	.global gUnknown_08672220
gUnknown_08672220:  @ 0x08672220
	.incbin "baserom.gba", 0x672220, 0x2EF4

	.global gUnknown_08675114
gUnknown_08675114:  @ 0x08675114
	.incbin "baserom.gba", 0x675114, 0x90

	.global gUnknown_086751A4
gUnknown_086751A4:  @ 0x086751A4
	.incbin "baserom.gba", 0x6751A4, 0x151C

	.global gUnknown_086766C0
gUnknown_086766C0:  @ 0x086766C0
	.incbin "baserom.gba", 0x6766C0, 0x74

	.global gUnknown_08676734
gUnknown_08676734:  @ 0x08676734
	.incbin "baserom.gba", 0x676734, 0x158C

	.global gUnknown_08677CC0
gUnknown_08677CC0:  @ 0x08677CC0
	.incbin "baserom.gba", 0x677CC0, 0x74

	.global gUnknown_08677D34
gUnknown_08677D34:  @ 0x08677D34
	.incbin "baserom.gba", 0x677D34, 0x9EC

	.global gUnknown_08678720
gUnknown_08678720:  @ 0x08678720
	.incbin "baserom.gba", 0x678720, 0x200

	.global gUnknown_08678920
gUnknown_08678920:  @ 0x08678920
	.incbin "baserom.gba", 0x678920, 0x200

	.global gUnknown_08678B20
gUnknown_08678B20:  @ 0x08678B20
	.incbin "baserom.gba", 0x678B20, 0x2A84

	.global gUnknown_0867B5A4
gUnknown_0867B5A4:  @ 0x0867B5A4
	.incbin "baserom.gba", 0x67B5A4, 0x3860

	.global gUnknown_0867EE04
gUnknown_0867EE04:  @ 0x0867EE04
	.incbin "baserom.gba", 0x67EE04, 0xB0

	.global gUnknown_0867EEB4
gUnknown_0867EEB4:  @ 0x0867EEB4
	.incbin "baserom.gba", 0x67EEB4, 0x19EC

	.global gUnknown_086808A0
gUnknown_086808A0:  @ 0x086808A0
	.incbin "baserom.gba", 0x6808A0, 0x520

	.global gUnknown_08680DC0
gUnknown_08680DC0:  @ 0x08680DC0
	.incbin "baserom.gba", 0x680DC0, 0x23C

	.global gUnknown_08680FFC
gUnknown_08680FFC:  @ 0x08680FFC
	.incbin "baserom.gba", 0x680FFC, 0xBC

	.global gUnknown_086810B8
gUnknown_086810B8:  @ 0x086810B8
	.incbin "baserom.gba", 0x6810B8, 0x3850

	.global gUnknown_08684908
gUnknown_08684908:  @ 0x08684908
	.incbin "baserom.gba", 0x684908, 0xB0

	.global gUnknown_086849B8
gUnknown_086849B8:  @ 0x086849B8
	.incbin "baserom.gba", 0x6849B8, 0x100

	.global gUnknown_08684AB8
gUnknown_08684AB8:  @ 0x08684AB8
	.incbin "baserom.gba", 0x684AB8, 0x820

	.global gUnknown_086852D8
gUnknown_086852D8:  @ 0x086852D8
	.incbin "baserom.gba", 0x6852D8, 0xECC

	.global gUnknown_086861A4
gUnknown_086861A4:  @ 0x086861A4
	.incbin "baserom.gba", 0x6861A4, 0xDE0

	.global gUnknown_08686F84
gUnknown_08686F84:  @ 0x08686F84
	.incbin "baserom.gba", 0x686F84, 0x1E8

	.global gUnknown_0868716C
gUnknown_0868716C:  @ 0x0868716C
	.incbin "baserom.gba", 0x68716C, 0x20

	.global gUnknown_0868718C
gUnknown_0868718C:  @ 0x0868718C
	.incbin "baserom.gba", 0x68718C, 0x4FDC

	.global gUnknown_0868C168
gUnknown_0868C168:  @ 0x0868C168
	.incbin "baserom.gba", 0x68C168, 0x180

	.global gUnknown_0868C2E8
gUnknown_0868C2E8:  @ 0x0868C2E8
	.incbin "baserom.gba", 0x68C2E8, 0x50

	.global gUnknown_0868C338
gUnknown_0868C338:  @ 0x0868C338
	.incbin "baserom.gba", 0x68C338, 0x20

	.global gUnknown_0868C358
gUnknown_0868C358:  @ 0x0868C358
	.incbin "baserom.gba", 0x68C358, 0x498

	.global gUnknown_0868C7F0
gUnknown_0868C7F0:  @ 0x0868C7F0
	.incbin "baserom.gba", 0x68C7F0, 0x420

	.global gUnknown_0868CC10
gUnknown_0868CC10:  @ 0x0868CC10
	.incbin "baserom.gba", 0x68CC10, 0x6A4

	.global gUnknown_0868D2B4
gUnknown_0868D2B4:  @ 0x0868D2B4
	.incbin "baserom.gba", 0x68D2B4, 0x14

	.global gUnknown_0868D2C8
gUnknown_0868D2C8:  @ 0x0868D2C8
	.incbin "baserom.gba", 0x68D2C8, 0x14

	.global gUnknown_0868D2DC
gUnknown_0868D2DC:  @ 0x0868D2DC
	.incbin "baserom.gba", 0x68D2DC, 0x14

	.global gUnknown_0868D2F0
gUnknown_0868D2F0:  @ 0x0868D2F0
	.incbin "baserom.gba", 0x68D2F0, 0x14

	.global gUnknown_0868D304
gUnknown_0868D304:  @ 0x0868D304
	.incbin "baserom.gba", 0x68D304, 0x374

	.global gUnknown_0868D678
gUnknown_0868D678:  @ 0x0868D678
	.incbin "baserom.gba", 0x68D678, 0xC

	.global gUnknown_0868D684
gUnknown_0868D684:  @ 0x0868D684
	.incbin "baserom.gba", 0x68D684, 0xC

	.global gUnknown_0868D690
gUnknown_0868D690:  @ 0x0868D690
	.incbin "baserom.gba", 0x68D690, 0xC

	.global gUnknown_0868D69C
gUnknown_0868D69C:  @ 0x0868D69C
	.incbin "baserom.gba", 0x68D69C, 0xC

	.global gUnknown_0868D6A8
gUnknown_0868D6A8:  @ 0x0868D6A8
	.incbin "baserom.gba", 0x68D6A8, 0x28

	.global gUnknown_0868D6D0
gUnknown_0868D6D0:  @ 0x0868D6D0
	.incbin "baserom.gba", 0x68D6D0, 0x88C

	.global gUnknown_0868DF5C
gUnknown_0868DF5C:  @ 0x0868DF5C
	.incbin "baserom.gba", 0x68DF5C, 0x510

	.global gUnknown_0868E46C
gUnknown_0868E46C:  @ 0x0868E46C
	.incbin "baserom.gba", 0x68E46C, 0x40B8

	.global gUnknown_08692524
gUnknown_08692524:  @ 0x08692524
	.incbin "baserom.gba", 0x692524, 0x150

	.global gUnknown_08692674
gUnknown_08692674:  @ 0x08692674
	.incbin "baserom.gba", 0x692674, 0x6C

	.global gUnknown_086926E0
gUnknown_086926E0:  @ 0x086926E0
	.incbin "baserom.gba", 0x6926E0, 0x430

	.global gUnknown_08692B10
gUnknown_08692B10:  @ 0x08692B10
	.incbin "baserom.gba", 0x692B10, 0xCB0

	.global gUnknown_086937C0
gUnknown_086937C0:  @ 0x086937C0
	.incbin "baserom.gba", 0x6937C0, 0xE04

	.global gUnknown_086945C4
gUnknown_086945C4:  @ 0x086945C4
	.incbin "baserom.gba", 0x6945C4, 0x154C

	.global gUnknown_08695B10
gUnknown_08695B10:  @ 0x08695B10
	.incbin "baserom.gba", 0x695B10, 0xD30

	.global gUnknown_08696840
gUnknown_08696840:  @ 0x08696840
	.incbin "baserom.gba", 0x696840, 0x9E68

	.global gUnknown_086A06A8
gUnknown_086A06A8:  @ 0x086A06A8
	.incbin "baserom.gba", 0x6A06A8, 0x1638

	.global gUnknown_086A1CE0
gUnknown_086A1CE0:  @ 0x086A1CE0
	.incbin "baserom.gba", 0x6A1CE0, 0x514

	.global gUnknown_086A21F4
gUnknown_086A21F4:  @ 0x086A21F4
	.incbin "baserom.gba", 0x6A21F4, 0x420

	.global gUnknown_086A2614
gUnknown_086A2614:  @ 0x086A2614
	.incbin "baserom.gba", 0x6A2614, 0x110

	.global gUnknown_086A2724
gUnknown_086A2724:  @ 0x086A2724
	.incbin "baserom.gba", 0x6A2724, 0x18

	.global gUnknown_086A273C
gUnknown_086A273C:  @ 0x086A273C
	.incbin "baserom.gba", 0x6A273C, 0x108

	.global gUnknown_086A2844
gUnknown_086A2844:  @ 0x086A2844
	.incbin "baserom.gba", 0x6A2844, 0x18

	.global gUnknown_086A285C
gUnknown_086A285C:  @ 0x086A285C
	.incbin "baserom.gba", 0x6A285C, 0x18

	.global gUnknown_086A2874
gUnknown_086A2874:  @ 0x086A2874
	.incbin "baserom.gba", 0x6A2874, 0x474

	.global gUnknown_086A2CE8
gUnknown_086A2CE8:  @ 0x086A2CE8
	.incbin "baserom.gba", 0x6A2CE8, 0xD4

	.global gUnknown_086A2DBC
gUnknown_086A2DBC:  @ 0x086A2DBC
	.incbin "baserom.gba", 0x6A2DBC, 0x14

	.global gUnknown_086A2DD0
gUnknown_086A2DD0:  @ 0x086A2DD0
	.incbin "baserom.gba", 0x6A2DD0, 0xC8

	.global gUnknown_086A2E98
gUnknown_086A2E98:  @ 0x086A2E98
	.incbin "baserom.gba", 0x6A2E98, 0x14

	.global gUnknown_086A2EAC
gUnknown_086A2EAC:  @ 0x086A2EAC
	.incbin "baserom.gba", 0x6A2EAC, 0x382C

	.global gUnknown_086A66D8
gUnknown_086A66D8:  @ 0x086A66D8
	.incbin "baserom.gba", 0x6A66D8, 0xEBF4

	.global gUnknown_086B52CC
gUnknown_086B52CC:  @ 0x086B52CC
	.incbin "baserom.gba", 0x6B52CC, 0x2B4

	.global gUnknown_086B5580
gUnknown_086B5580:  @ 0x086B5580
	.incbin "baserom.gba", 0x6B5580, 0x35C

	.global gUnknown_086B58DC
gUnknown_086B58DC:  @ 0x086B58DC
	.incbin "baserom.gba", 0x6B58DC, 0x98

	.global gUnknown_086B5974
gUnknown_086B5974:  @ 0x086B5974
	.incbin "baserom.gba", 0x6B5974, 0x10

	.global gUnknown_086B5984
gUnknown_086B5984:  @ 0x086B5984
	.incbin "baserom.gba", 0x6B5984, 0x8

	.global gUnknown_086B598C
gUnknown_086B598C:  @ 0x086B598C
	.incbin "baserom.gba", 0x6B598C, 0xA0

	.global gUnknown_086B5A2C
gUnknown_086B5A2C:  @ 0x086B5A2C
	.incbin "baserom.gba", 0x6B5A2C, 0x20

	.global gUnknown_086B5A4C
gUnknown_086B5A4C:  @ 0x086B5A4C
	.incbin "baserom.gba", 0x6B5A4C, 0x460

	.global gUnknown_086B5EAC
gUnknown_086B5EAC:  @ 0x086B5EAC
	.incbin "baserom.gba", 0x6B5EAC, 0x6978

	.global gUnknown_086BC824
gUnknown_086BC824:  @ 0x086BC824
	.incbin "baserom.gba", 0x6BC824, 0xA3C

	.global gUnknown_086BD260
gUnknown_086BD260:  @ 0x086BD260
	.incbin "baserom.gba", 0x6BD260, 0x50C

	.global gUnknown_086BD76C
gUnknown_086BD76C:  @ 0x086BD76C
	.incbin "baserom.gba", 0x6BD76C, 0x2F0

	.global gUnknown_086BDA5C
gUnknown_086BDA5C:  @ 0x086BDA5C
	.incbin "baserom.gba", 0x6BDA5C, 0x9EB0

	.global gUnknown_086C790C
gUnknown_086C790C:  @ 0x086C790C
	.incbin "baserom.gba", 0x6C790C, 0x20

	.global gUnknown_086C792C
gUnknown_086C792C:  @ 0x086C792C
	.incbin "baserom.gba", 0x6C792C, 0x20

	.global gUnknown_086C794C
gUnknown_086C794C:  @ 0x086C794C
	.incbin "baserom.gba", 0x6C794C, 0x1758

	.global gUnknown_086C90A4
gUnknown_086C90A4:  @ 0x086C90A4
	.incbin "baserom.gba", 0x6C90A4, 0x358

	.global gUnknown_086C93FC
gUnknown_086C93FC:  @ 0x086C93FC
	.incbin "baserom.gba", 0x6C93FC, 0x1C4

	.global gUnknown_086C95C0
gUnknown_086C95C0:  @ 0x086C95C0
	.incbin "baserom.gba", 0x6C95C0, 0x1CC

	.global gUnknown_086C978C
gUnknown_086C978C:  @ 0x086C978C
	.incbin "baserom.gba", 0x6C978C, 0xF308

	.global gUnknown_086D8A94
gUnknown_086D8A94:  @ 0x086D8A94
	.incbin "baserom.gba", 0x6D8A94, 0x11AC

	.global gUnknown_086D9C40
gUnknown_086D9C40:  @ 0x086D9C40
	.incbin "baserom.gba", 0x6D9C40, 0x6FC

	.global gUnknown_086DA33C
gUnknown_086DA33C:  @ 0x086DA33C
	.incbin "baserom.gba", 0x6DA33C, 0x5E4

	.global gUnknown_086DA920
gUnknown_086DA920:  @ 0x086DA920
	.incbin "baserom.gba", 0x6DA920, 0xD590

	.global gUnknown_086E7EB0
gUnknown_086E7EB0:  @ 0x086E7EB0
	.incbin "baserom.gba", 0x6E7EB0, 0x1308

	.global gUnknown_086E91B8
gUnknown_086E91B8:  @ 0x086E91B8
	.incbin "baserom.gba", 0x6E91B8, 0xB88

	.global gUnknown_086E9D40
gUnknown_086E9D40:  @ 0x086E9D40
	.incbin "baserom.gba", 0x6E9D40, 0x6AC

	.global gUnknown_086EA3EC
gUnknown_086EA3EC:  @ 0x086EA3EC
	.incbin "baserom.gba", 0x6EA3EC, 0xA28

	.global gUnknown_086EAE14
gUnknown_086EAE14:  @ 0x086EAE14
	.incbin "baserom.gba", 0x6EAE14, 0x10

	.global gUnknown_086EAE24
gUnknown_086EAE24:  @ 0x086EAE24
	.incbin "baserom.gba", 0x6EAE24, 0x12C20

	.global gUnknown_086FDA44
gUnknown_086FDA44:  @ 0x086FDA44
	.incbin "baserom.gba", 0x6FDA44, 0xEF4

	.global gUnknown_086FE938
gUnknown_086FE938:  @ 0x086FE938
	.incbin "baserom.gba", 0x6FE938, 0xA6C

	.global gUnknown_086FF3A4
gUnknown_086FF3A4:  @ 0x086FF3A4
	.incbin "baserom.gba", 0x6FF3A4, 0x248

	.global gUnknown_086FF5EC
gUnknown_086FF5EC:  @ 0x086FF5EC
	.incbin "baserom.gba", 0x6FF5EC, 0x750

	.global gUnknown_086FFD3C
gUnknown_086FFD3C:  @ 0x086FFD3C
	.incbin "baserom.gba", 0x6FFD3C, 0x1664

	.global gUnknown_087013A0
gUnknown_087013A0:  @ 0x087013A0
	.incbin "baserom.gba", 0x7013A0, 0x18444

	.global gUnknown_087197E4
gUnknown_087197E4:  @ 0x087197E4
	.incbin "baserom.gba", 0x7197E4, 0x75A0

	.global gUnknown_08720D84
gUnknown_08720D84:  @ 0x08720D84
	.incbin "baserom.gba", 0x720D84, 0x2484

	.global gUnknown_08723208
gUnknown_08723208:  @ 0x08723208
	.incbin "baserom.gba", 0x723208, 0x121C

	.global gUnknown_08724424
gUnknown_08724424:  @ 0x08724424
	.incbin "baserom.gba", 0x724424, 0x2B4

	.global gUnknown_087246D8
gUnknown_087246D8:  @ 0x087246D8
	.incbin "baserom.gba", 0x7246D8, 0x13F8

	.global gUnknown_08725AD0
gUnknown_08725AD0:  @ 0x08725AD0
	.incbin "baserom.gba", 0x725AD0, 0x20

	.global gUnknown_08725AF0
gUnknown_08725AF0:  @ 0x08725AF0
	.incbin "baserom.gba", 0x725AF0, 0x2BC

	.global gUnknown_08725DAC
gUnknown_08725DAC:  @ 0x08725DAC
	.incbin "baserom.gba", 0x725DAC, 0x20

	.global gUnknown_08725DCC
gUnknown_08725DCC:  @ 0x08725DCC
	.incbin "baserom.gba", 0x725DCC, 0x1228

	.global gUnknown_08726FF4
gUnknown_08726FF4:  @ 0x08726FF4
	.incbin "baserom.gba", 0x726FF4, 0xC0

	.global gUnknown_087270B4
gUnknown_087270B4:  @ 0x087270B4
	.incbin "baserom.gba", 0x7270B4, 0x45C

	.global gUnknown_08727510
gUnknown_08727510:  @ 0x08727510
	.incbin "baserom.gba", 0x727510, 0x45C

	.global gUnknown_0872796C
gUnknown_0872796C:  @ 0x0872796C
	.incbin "baserom.gba", 0x72796C, 0x2DC

	.global gUnknown_08727C48
gUnknown_08727C48:  @ 0x08727C48
	.incbin "baserom.gba", 0x727C48, 0xA14

	.global gUnknown_0872865C
gUnknown_0872865C:  @ 0x0872865C
	.incbin "baserom.gba", 0x72865C, 0x2C4

	.global gUnknown_08728920
gUnknown_08728920:  @ 0x08728920
	.incbin "baserom.gba", 0x728920, 0x2E4

	.global gUnknown_08728C04
gUnknown_08728C04:  @ 0x08728C04
	.incbin "baserom.gba", 0x728C04, 0x58

	.global gUnknown_08728C5C
gUnknown_08728C5C:  @ 0x08728C5C
	.incbin "baserom.gba", 0x728C5C, 0xAD0

	.global gUnknown_0872972C
gUnknown_0872972C:  @ 0x0872972C
	.incbin "baserom.gba", 0x72972C, 0x150

	.global gUnknown_0872987C
gUnknown_0872987C:  @ 0x0872987C
	.incbin "baserom.gba", 0x72987C, 0x760

	.global gUnknown_08729FDC
gUnknown_08729FDC:  @ 0x08729FDC
	.incbin "baserom.gba", 0x729FDC, 0x1E0

	.global gUnknown_0872A1BC
gUnknown_0872A1BC:  @ 0x0872A1BC
	.incbin "baserom.gba", 0x72A1BC, 0x2CA4

	.global gUnknown_0872CE60
gUnknown_0872CE60:  @ 0x0872CE60
	.incbin "baserom.gba", 0x72CE60, 0xBA4

	.global gUnknown_0872DA04
gUnknown_0872DA04:  @ 0x0872DA04
	.incbin "baserom.gba", 0x72DA04, 0x400

	.global gUnknown_0872DE04
gUnknown_0872DE04:  @ 0x0872DE04
	.incbin "baserom.gba", 0x72DE04, 0x1E8

	.global gUnknown_0872DFEC
gUnknown_0872DFEC:  @ 0x0872DFEC
	.incbin "baserom.gba", 0x72DFEC, 0x38

	.global gUnknown_0872E024
gUnknown_0872E024:  @ 0x0872E024
	.incbin "baserom.gba", 0x72E024, 0x228

	.global gUnknown_0872E24C
gUnknown_0872E24C:  @ 0x0872E24C
	.incbin "baserom.gba", 0x72E24C, 0x10

	.global gUnknown_0872E25C
gUnknown_0872E25C:  @ 0x0872E25C
	.incbin "baserom.gba", 0x72E25C, 0x3F0

	.global gUnknown_0872E64C
gUnknown_0872E64C:  @ 0x0872E64C
	.incbin "baserom.gba", 0x72E64C, 0x1A0

	.global gUnknown_0872E7EC
gUnknown_0872E7EC:  @ 0x0872E7EC
	.incbin "baserom.gba", 0x72E7EC, 0x1AC

	.global gUnknown_0872E998
gUnknown_0872E998:  @ 0x0872E998
	.incbin "baserom.gba", 0x72E998, 0x106C

	.global gUnknown_0872FA04
gUnknown_0872FA04:  @ 0x0872FA04
	.incbin "baserom.gba", 0x72FA04, 0x80

	.global gUnknown_0872FA84
gUnknown_0872FA84:  @ 0x0872FA84
	.incbin "baserom.gba", 0x72FA84, 0x434

	.global gUnknown_0872FEB8
gUnknown_0872FEB8:  @ 0x0872FEB8
	.incbin "baserom.gba", 0x72FEB8, 0x3EC

	.global gUnknown_087302A4
gUnknown_087302A4:  @ 0x087302A4
	.incbin "baserom.gba", 0x7302A4, 0x80

	.global gUnknown_08730324
gUnknown_08730324:  @ 0x08730324
	.incbin "baserom.gba", 0x730324, 0x45C

	.global gUnknown_08730780
gUnknown_08730780:  @ 0x08730780
	.incbin "baserom.gba", 0x730780, 0xB3C

	.global gUnknown_087312BC
gUnknown_087312BC:  @ 0x087312BC
	.incbin "baserom.gba", 0x7312BC, 0x8C

	.global gUnknown_08731348
gUnknown_08731348:  @ 0x08731348
	.incbin "baserom.gba", 0x731348, 0x80

	.global gUnknown_087313C8
gUnknown_087313C8:  @ 0x087313C8
	.incbin "baserom.gba", 0x7313C8, 0xE60

	.global gUnknown_08732228
gUnknown_08732228:  @ 0x08732228
	.incbin "baserom.gba", 0x732228, 0x140

	.global gUnknown_08732368
gUnknown_08732368:  @ 0x08732368
	.incbin "baserom.gba", 0x732368, 0x45C

	.global gUnknown_087327C4
gUnknown_087327C4:  @ 0x087327C4
	.incbin "baserom.gba", 0x7327C4, 0x978

	.global gUnknown_0873313C
gUnknown_0873313C:  @ 0x0873313C
	.incbin "baserom.gba", 0x73313C, 0x10810

	.global gUnknown_0874394C
gUnknown_0874394C:  @ 0x0874394C
	.incbin "baserom.gba", 0x74394C, 0x1D9C

	.global gUnknown_087456E8
gUnknown_087456E8:  @ 0x087456E8
	.incbin "baserom.gba", 0x7456E8, 0xE20

	.global gUnknown_08746508
gUnknown_08746508:  @ 0x08746508
	.incbin "baserom.gba", 0x746508, 0x204

	.global gUnknown_0874670C
gUnknown_0874670C:  @ 0x0874670C
	.incbin "baserom.gba", 0x74670C, 0x9B5C

	.global gUnknown_08750268
gUnknown_08750268:  @ 0x08750268
	.incbin "baserom.gba", 0x750268, 0x15A0

	.global gUnknown_08751808
gUnknown_08751808:  @ 0x08751808
	.incbin "baserom.gba", 0x751808, 0x5AC

	.global gUnknown_08751DB4
gUnknown_08751DB4:  @ 0x08751DB4
	.incbin "baserom.gba", 0x751DB4, 0x26C

	.global gUnknown_08752020
gUnknown_08752020:  @ 0x08752020
	.incbin "baserom.gba", 0x752020, 0x2850

	.global gUnknown_08754870
gUnknown_08754870:  @ 0x08754870
	.incbin "baserom.gba", 0x754870, 0x1764

	.global gUnknown_08755FD4
gUnknown_08755FD4:  @ 0x08755FD4
	.incbin "baserom.gba", 0x755FD4, 0x2160

	.global gUnknown_08758134
gUnknown_08758134:  @ 0x08758134
	.incbin "baserom.gba", 0x758134, 0xE4

	.global gUnknown_08758218
gUnknown_08758218:  @ 0x08758218
	.incbin "baserom.gba", 0x758218, 0x2A0

	.global gUnknown_087584B8
gUnknown_087584B8:  @ 0x087584B8
	.incbin "baserom.gba", 0x7584B8, 0x124

	.global gUnknown_087585DC
gUnknown_087585DC:  @ 0x087585DC
	.incbin "baserom.gba", 0x7585DC, 0x1C

	.global gUnknown_087585F8
gUnknown_087585F8:  @ 0x087585F8
	.incbin "baserom.gba", 0x7585F8, 0x78

	.global gUnknown_08758670
gUnknown_08758670:  @ 0x08758670
	.incbin "baserom.gba", 0x758670, 0x68

	.global gUnknown_087586D8
gUnknown_087586D8:  @ 0x087586D8
	.incbin "baserom.gba", 0x7586D8, 0x18

	.global gUnknown_087586F0
gUnknown_087586F0:  @ 0x087586F0
	.incbin "baserom.gba", 0x7586F0, 0x30

	.global gUnknown_08758720
gUnknown_08758720:  @ 0x08758720
	.incbin "baserom.gba", 0x758720, 0x20

	.global gUnknown_08758740
gUnknown_08758740:  @ 0x08758740
	.incbin "baserom.gba", 0x758740, 0x14

	.global gUnknown_08758754
gUnknown_08758754:  @ 0x08758754
	.incbin "baserom.gba", 0x758754, 0x48

	.global gUnknown_0875879C
gUnknown_0875879C:  @ 0x0875879C
	.incbin "baserom.gba", 0x75879C, 0x280

	.global gUnknown_08758A1C
gUnknown_08758A1C:  @ 0x08758A1C
	.incbin "baserom.gba", 0x758A1C, 0x14

	.global gUnknown_08758A30
gUnknown_08758A30:  @ 0x08758A30
	.incbin "baserom.gba", 0x758A30, 0x18

	.global gUnknown_08758A48
gUnknown_08758A48:  @ 0x08758A48
	.incbin "baserom.gba", 0x758A48, 0x18

	.global gUnknown_08758A60
gUnknown_08758A60:  @ 0x08758A60
	.incbin "baserom.gba", 0x758A60, 0x2C0

	.global gUnknown_08758D20
gUnknown_08758D20:  @ 0x08758D20
	.incbin "baserom.gba", 0x758D20, 0x1C

	.global gUnknown_08758D3C
gUnknown_08758D3C:  @ 0x08758D3C
	.incbin "baserom.gba", 0x758D3C, 0x1C

	.global gUnknown_08758D58
gUnknown_08758D58:  @ 0x08758D58
	.incbin "baserom.gba", 0x758D58, 0x1C

	.global gUnknown_08758D74
gUnknown_08758D74:  @ 0x08758D74
	.incbin "baserom.gba", 0x758D74, 0x8C

	.global gUnknown_08758E00
gUnknown_08758E00:  @ 0x08758E00
	.incbin "baserom.gba", 0x758E00, 0x8C

	.global gUnknown_08758E8C
gUnknown_08758E8C:  @ 0x08758E8C
	.incbin "baserom.gba", 0x758E8C, 0x8C

	.global gUnknown_08758F18
gUnknown_08758F18:  @ 0x08758F18
	.incbin "baserom.gba", 0x758F18, 0x8C

	.global gUnknown_08758FA4
gUnknown_08758FA4:  @ 0x08758FA4
	.incbin "baserom.gba", 0x758FA4, 0x1C

	.global gUnknown_08758FC0
gUnknown_08758FC0:  @ 0x08758FC0
	.incbin "baserom.gba", 0x758FC0, 0x28

	.global gUnknown_08758FE8
gUnknown_08758FE8:  @ 0x08758FE8
	.incbin "baserom.gba", 0x758FE8, 0x18

	.global gUnknown_08759000
gUnknown_08759000:  @ 0x08759000
	.incbin "baserom.gba", 0x759000, 0x94

	.global gUnknown_08759094
gUnknown_08759094:  @ 0x08759094
	.incbin "baserom.gba", 0x759094, 0x94

	.global gUnknown_08759128
gUnknown_08759128:  @ 0x08759128
	.incbin "baserom.gba", 0x759128, 0x94

	.global gUnknown_087591BC
gUnknown_087591BC:  @ 0x087591BC
	.incbin "baserom.gba", 0x7591BC, 0x18

	.global gUnknown_087591D4
gUnknown_087591D4:  @ 0x087591D4
	.incbin "baserom.gba", 0x7591D4, 0x18

	.global gUnknown_087591EC
gUnknown_087591EC:  @ 0x087591EC
	.incbin "baserom.gba", 0x7591EC, 0x20

	.global gUnknown_0875920C
gUnknown_0875920C:  @ 0x0875920C
	.incbin "baserom.gba", 0x75920C, 0x20

	.global gUnknown_0875922C
gUnknown_0875922C:  @ 0x0875922C
	.incbin "baserom.gba", 0x75922C, 0x20

	.global gUnknown_0875924C
gUnknown_0875924C:  @ 0x0875924C
	.incbin "baserom.gba", 0x75924C, 0x18

	.global gUnknown_08759264
gUnknown_08759264:  @ 0x08759264
	.incbin "baserom.gba", 0x759264, 0x20

	.global gUnknown_08759284
gUnknown_08759284:  @ 0x08759284
	.incbin "baserom.gba", 0x759284, 0x18

	.global gUnknown_0875929C
gUnknown_0875929C:  @ 0x0875929C
	.incbin "baserom.gba", 0x75929C, 0x18

	.global gUnknown_087592B4
gUnknown_087592B4:  @ 0x087592B4
	.incbin "baserom.gba", 0x7592B4, 0x18

	.global gUnknown_087592CC
gUnknown_087592CC:  @ 0x087592CC
	.incbin "baserom.gba", 0x7592CC, 0x20

	.global gUnknown_087592EC
gUnknown_087592EC:  @ 0x087592EC
	.incbin "baserom.gba", 0x7592EC, 0x20

	.global gUnknown_0875930C
gUnknown_0875930C:  @ 0x0875930C
	.incbin "baserom.gba", 0x75930C, 0x20

	.global gUnknown_0875932C
gUnknown_0875932C:  @ 0x0875932C
	.incbin "baserom.gba", 0x75932C, 0xB0

	.global gUnknown_087593DC
gUnknown_087593DC:  @ 0x087593DC
	.incbin "baserom.gba", 0x7593DC, 0x20

	.global gUnknown_087593FC
gUnknown_087593FC:  @ 0x087593FC
	.incbin "baserom.gba", 0x7593FC, 0x20

	.global gUnknown_0875941C
gUnknown_0875941C:  @ 0x0875941C
	.incbin "baserom.gba", 0x75941C, 0x40

	.global gUnknown_0875945C
gUnknown_0875945C:  @ 0x0875945C
	.incbin "baserom.gba", 0x75945C, 0x28

	.global gUnknown_08759484
gUnknown_08759484:  @ 0x08759484
	.incbin "baserom.gba", 0x759484, 0x18

	.global gUnknown_0875949C
gUnknown_0875949C:  @ 0x0875949C
	.incbin "baserom.gba", 0x75949C, 0x2C

	.global gUnknown_087594C8
gUnknown_087594C8:  @ 0x087594C8
	.incbin "baserom.gba", 0x7594C8, 0x2C

	.global gUnknown_087594F4
gUnknown_087594F4:  @ 0x087594F4
	.incbin "baserom.gba", 0x7594F4, 0x18

	.global gUnknown_0875950C
gUnknown_0875950C:  @ 0x0875950C
	.incbin "baserom.gba", 0x75950C, 0x18

	.global gUnknown_08759524
gUnknown_08759524:  @ 0x08759524
	.incbin "baserom.gba", 0x759524, 0x20

	.global gUnknown_08759544
gUnknown_08759544:  @ 0x08759544
	.incbin "baserom.gba", 0x759544, 0x20

	.global gUnknown_08759564
gUnknown_08759564:  @ 0x08759564
	.incbin "baserom.gba", 0x759564, 0x18

	.global gUnknown_0875957C
gUnknown_0875957C:  @ 0x0875957C
	.incbin "baserom.gba", 0x75957C, 0x28

	.global gUnknown_087595A4
gUnknown_087595A4:  @ 0x087595A4
	.incbin "baserom.gba", 0x7595A4, 0x18

	.global gUnknown_087595BC
gUnknown_087595BC:  @ 0x087595BC
	.incbin "baserom.gba", 0x7595BC, 0x18

	.global gUnknown_087595D4
gUnknown_087595D4:  @ 0x087595D4
	.incbin "baserom.gba", 0x7595D4, 0x18

	.global gUnknown_087595EC
gUnknown_087595EC:  @ 0x087595EC
	.incbin "baserom.gba", 0x7595EC, 0x18

	.global gUnknown_08759604
gUnknown_08759604:  @ 0x08759604
	.incbin "baserom.gba", 0x759604, 0x18

	.global gUnknown_0875961C
gUnknown_0875961C:  @ 0x0875961C
	.incbin "baserom.gba", 0x75961C, 0x18

	.global gUnknown_08759634
gUnknown_08759634:  @ 0x08759634
	.incbin "baserom.gba", 0x759634, 0x18

	.global gUnknown_0875964C
gUnknown_0875964C:  @ 0x0875964C
	.incbin "baserom.gba", 0x75964C, 0x20

	.global gUnknown_0875966C
gUnknown_0875966C:  @ 0x0875966C
	.incbin "baserom.gba", 0x75966C, 0x4C8

	.global gUnknown_08759B34
gUnknown_08759B34:  @ 0x08759B34
	.incbin "baserom.gba", 0x759B34, 0x334

	.global gUnknown_08759E68
gUnknown_08759E68:  @ 0x08759E68
	.incbin "baserom.gba", 0x759E68, 0x98

	.global gUnknown_08759F00
gUnknown_08759F00:  @ 0x08759F00
	.incbin "baserom.gba", 0x759F00, 0x90

	.global gUnknown_08759F90
gUnknown_08759F90:  @ 0x08759F90
	.incbin "baserom.gba", 0x759F90, 0x90

	.global gUnknown_0875A020
gUnknown_0875A020:  @ 0x0875A020
	.incbin "baserom.gba", 0x75A020, 0x8C

	.global gUnknown_0875A0AC
gUnknown_0875A0AC:  @ 0x0875A0AC
	.incbin "baserom.gba", 0x75A0AC, 0xF0

	.global gUnknown_0875A19C
gUnknown_0875A19C:  @ 0x0875A19C
	.incbin "baserom.gba", 0x75A19C, 0x178

	.global gUnknown_0875A314
gUnknown_0875A314:  @ 0x0875A314
	.incbin "baserom.gba", 0x75A314, 0x154

	.global gUnknown_0875A468
gUnknown_0875A468:  @ 0x0875A468
	.incbin "baserom.gba", 0x75A468, 0x2C8

	.global gUnknown_0875A730
gUnknown_0875A730:  @ 0x0875A730
	.incbin "baserom.gba", 0x75A730, 0x64

	.global gUnknown_0875A794
gUnknown_0875A794:  @ 0x0875A794
	.incbin "baserom.gba", 0x75A794, 0x32D84

	.global gUnknown_0878D518
gUnknown_0878D518:  @ 0x0878D518
	.incbin "baserom.gba", 0x78D518, 0x8

	.global gUnknown_0878D520
gUnknown_0878D520:  @ 0x0878D520
	.incbin "baserom.gba", 0x78D520, 0x68

	.global gUnknown_0878D588
gUnknown_0878D588:  @ 0x0878D588
	.incbin "baserom.gba", 0x78D588, 0x68

	.global gUnknown_0878D5F0
gUnknown_0878D5F0:  @ 0x0878D5F0
	.incbin "baserom.gba", 0x78D5F0, 0x30

	.global gUnknown_0878D620
gUnknown_0878D620:  @ 0x0878D620
	.incbin "baserom.gba", 0x78D620, 0x28

	.global gUnknown_0878D648
gUnknown_0878D648:  @ 0x0878D648
	.incbin "baserom.gba", 0x78D648, 0x3940

	.global gUnknown_08790F88
gUnknown_08790F88:  @ 0x08790F88
	.incbin "baserom.gba", 0x790F88, 0x1D4

	.global gUnknown_0879115C
gUnknown_0879115C:  @ 0x0879115C
	.incbin "baserom.gba", 0x79115C, 0xC00

	.global gUnknown_08791D5C
gUnknown_08791D5C:  @ 0x08791D5C
	.incbin "baserom.gba", 0x791D5C, 0x20

	.global gUnknown_08791D7C
gUnknown_08791D7C:  @ 0x08791D7C
	.incbin "baserom.gba", 0x791D7C, 0x20

	.global gUnknown_08791D9C
gUnknown_08791D9C:  @ 0x08791D9C
	.incbin "baserom.gba", 0x791D9C, 0x3F8

	.global gUnknown_08792194
gUnknown_08792194:  @ 0x08792194
	.incbin "baserom.gba", 0x792194, 0x794

	.global gUnknown_08792928
gUnknown_08792928:  @ 0x08792928
	.incbin "baserom.gba", 0x792928, 0x30

	.global gUnknown_08792958
gUnknown_08792958:  @ 0x08792958
	.incbin "baserom.gba", 0x792958, 0x30

	.global gUnknown_08792988
gUnknown_08792988:  @ 0x08792988
	.incbin "baserom.gba", 0x792988, 0x12564

	.global gUnknown_087A4EEC
gUnknown_087A4EEC:  @ 0x087A4EEC
	.incbin "baserom.gba", 0x7A4EEC, 0x22C

	.global gUnknown_087A5118
gUnknown_087A5118:  @ 0x087A5118
	.incbin "baserom.gba", 0x7A5118, 0x278

	.global gUnknown_087A5390
gUnknown_087A5390:  @ 0x087A5390
	.incbin "baserom.gba", 0x7A5390, 0x3BC

	.global gUnknown_087A574C
gUnknown_087A574C:  @ 0x087A574C
	.incbin "baserom.gba", 0x7A574C, 0x410

	.global gUnknown_087A5B5C
gUnknown_087A5B5C:  @ 0x087A5B5C
	.incbin "baserom.gba", 0x7A5B5C, 0x48

	.global gUnknown_087A5BA4
gUnknown_087A5BA4:  @ 0x087A5BA4
	.incbin "baserom.gba", 0x7A5BA4, 0x2F8

	.global gUnknown_087A5E9C
gUnknown_087A5E9C:  @ 0x087A5E9C
	.incbin "baserom.gba", 0x7A5E9C, 0x350

	.global gUnknown_087A61EC
gUnknown_087A61EC:  @ 0x087A61EC
	.incbin "baserom.gba", 0x7A61EC, 0x4DA68

	.global gUnknown_087F3C54
gUnknown_087F3C54:  @ 0x087F3C54
	.incbin "baserom.gba", 0x7F3C54, 0x530

	.global gUnknown_087F4184
gUnknown_087F4184:  @ 0x087F4184
	.incbin "baserom.gba", 0x7F4184, 0x190

	.global gUnknown_087F4314
gUnknown_087F4314:  @ 0x087F4314
	.incbin "baserom.gba", 0x7F4314, 0x10

	.global gUnknown_087F4324
gUnknown_087F4324:  @ 0x087F4324
	.incbin "baserom.gba", 0x7F4324, 0x70

	.global gUnknown_087F4394
gUnknown_087F4394:  @ 0x087F4394
	.incbin "baserom.gba", 0x7F4394, 0x20

	.global gUnknown_087F43B4
gUnknown_087F43B4:  @ 0x087F43B4
	.incbin "baserom.gba", 0x7F43B4, 0x20

	.global gUnknown_087F43D4
gUnknown_087F43D4:  @ 0x087F43D4
	.incbin "baserom.gba", 0x7F43D4, 0x18

	.global gUnknown_087F43EC
gUnknown_087F43EC:  @ 0x087F43EC
	.incbin "baserom.gba", 0x7F43EC, 0xC

	.global gUnknown_087F43F8
gUnknown_087F43F8:  @ 0x087F43F8
	.incbin "baserom.gba", 0x7F43F8, 0x60

	.global gUnknown_087F4458
gUnknown_087F4458:  @ 0x087F4458
	.incbin "baserom.gba", 0x7F4458, 0x58

	.global gUnknown_087F44B0
gUnknown_087F44B0:  @ 0x087F44B0
	.incbin "baserom.gba", 0x7F44B0, 0x30

	.global gUnknown_087F44E0
gUnknown_087F44E0:  @ 0x087F44E0
	.incbin "baserom.gba", 0x7F44E0, 0x18

	.global gUnknown_087F44F8
gUnknown_087F44F8:  @ 0x087F44F8
	.incbin "baserom.gba", 0x7F44F8, 0x20

	.global gUnknown_087F4518
gUnknown_087F4518:  @ 0x087F4518
	.incbin "baserom.gba", 0x7F4518, 0x30

	.global gUnknown_087F4548
gUnknown_087F4548:  @ 0x087F4548
	.incbin "baserom.gba", 0x7F4548, 0x30

	.global gUnknown_087F4578
gUnknown_087F4578:  @ 0x087F4578
	.incbin "baserom.gba", 0x7F4578, 0x28

	.global gUnknown_087F45A0
gUnknown_087F45A0:  @ 0x087F45A0
	.incbin "baserom.gba", 0x7F45A0, 0x30

	.global gUnknown_087F45D0
gUnknown_087F45D0:  @ 0x087F45D0
	.incbin "baserom.gba", 0x7F45D0, 0x1C8

	.global gUnknown_087F4798
gUnknown_087F4798:  @ 0x087F4798
	.incbin "baserom.gba", 0x7F4798, 0x31F4

	.global gUnknown_087F798C
gUnknown_087F798C:  @ 0x087F798C
	.incbin "baserom.gba", 0x7F798C, 0x43C

	.global gUnknown_087F7DC8
gUnknown_087F7DC8:  @ 0x087F7DC8
	.incbin "baserom.gba", 0x7F7DC8, 0x814

	.global gUnknown_087F85DC
gUnknown_087F85DC:  @ 0x087F85DC
	.incbin "baserom.gba", 0x7F85DC, 0x6EAC

	.global gUnknown_087FF488
gUnknown_087FF488:  @ 0x087FF488
	.incbin "baserom.gba", 0x7FF488, 0x11C4

	.global gUnknown_0880064C
gUnknown_0880064C:  @ 0x0880064C
	.incbin "baserom.gba", 0x80064C, 0x1194

	.global gUnknown_088017E0
gUnknown_088017E0:  @ 0x088017E0
	.incbin "baserom.gba", 0x8017E0, 0x30

	.global gUnknown_08801810
gUnknown_08801810:  @ 0x08801810
	.incbin "baserom.gba", 0x801810, 0x30

	.global gUnknown_08801840
gUnknown_08801840:  @ 0x08801840
	.incbin "baserom.gba", 0x801840, 0x18

	.global gUnknown_08801858
gUnknown_08801858:  @ 0x08801858
	.incbin "baserom.gba", 0x801858, 0x8

	.global gUnknown_08801860
gUnknown_08801860:  @ 0x08801860
	.incbin "baserom.gba", 0x801860, 0x8

	.global gUnknown_08801868
gUnknown_08801868:  @ 0x08801868
	.incbin "baserom.gba", 0x801868, 0x18

	.global gUnknown_08801880
gUnknown_08801880:  @ 0x08801880
	.incbin "baserom.gba", 0x801880, 0x20

	.global gUnknown_088018A0
gUnknown_088018A0:  @ 0x088018A0
	.incbin "baserom.gba", 0x8018A0, 0x20C

	.global gUnknown_08801AAC
gUnknown_08801AAC:  @ 0x08801AAC
	.incbin "baserom.gba", 0x801AAC, 0x8

	.global gUnknown_08801AB4
gUnknown_08801AB4:  @ 0x08801AB4
	.incbin "baserom.gba", 0x801AB4, 0x160

	.global gUnknown_08801C14
gUnknown_08801C14:  @ 0x08801C14
	.incbin "baserom.gba", 0x801C14, 0x368

	.global gUnknown_08801F7C
gUnknown_08801F7C:  @ 0x08801F7C
	.incbin "baserom.gba", 0x801F7C, 0x78

	.global gUnknown_08801FF4
gUnknown_08801FF4:  @ 0x08801FF4
	.incbin "baserom.gba", 0x801FF4, 0x50

	.global gUnknown_08802044
gUnknown_08802044:  @ 0x08802044
	.incbin "baserom.gba", 0x802044, 0x78

	.global gUnknown_088020BC
gUnknown_088020BC:  @ 0x088020BC
	.incbin "baserom.gba", 0x8020BC, 0x50

	.global gUnknown_0880210C
gUnknown_0880210C:  @ 0x0880210C
	.incbin "baserom.gba", 0x80210C, 0xB4

	.global gUnknown_088021C0
gUnknown_088021C0:  @ 0x088021C0
	.incbin "baserom.gba", 0x8021C0, 0xB4

	.global gUnknown_08802274
gUnknown_08802274:  @ 0x08802274
	.incbin "baserom.gba", 0x802274, 0xD4

	.global gUnknown_08802348
gUnknown_08802348:  @ 0x08802348
	.incbin "baserom.gba", 0x802348, 0xE0

	.global gUnknown_08802428
gUnknown_08802428:  @ 0x08802428
	.incbin "baserom.gba", 0x802428, 0xE0

	.global gUnknown_08802508
gUnknown_08802508:  @ 0x08802508
	.incbin "baserom.gba", 0x802508, 0x50

	.global gUnknown_08802558
gUnknown_08802558:  @ 0x08802558
	.incbin "baserom.gba", 0x802558, 0x80

	.global gUnknown_088025D8
gUnknown_088025D8:  @ 0x088025D8
	.incbin "baserom.gba", 0x8025D8, 0x9C

	.global gUnknown_08802674
gUnknown_08802674:  @ 0x08802674
	.incbin "baserom.gba", 0x802674, 0x24

	.global gUnknown_08802698
gUnknown_08802698:  @ 0x08802698
	.incbin "baserom.gba", 0x802698, 0x4C

	.global gUnknown_088026E4
gUnknown_088026E4:  @ 0x088026E4
	.incbin "baserom.gba", 0x8026E4, 0x1A0

	.global gUnknown_08802884
gUnknown_08802884:  @ 0x08802884
	.incbin "baserom.gba", 0x802884, 0x80

	.global gUnknown_08802904
gUnknown_08802904:  @ 0x08802904
	.incbin "baserom.gba", 0x802904, 0x200

	.global gUnknown_08802B04
gUnknown_08802B04:  @ 0x08802B04
	.incbin "baserom.gba", 0x802B04, 0x80

	.global gUnknown_08802B84
gUnknown_08802B84:  @ 0x08802B84
	.incbin "baserom.gba", 0x802B84, 0x40

	.global gUnknown_08802BC4
gUnknown_08802BC4:  @ 0x08802BC4
	.incbin "baserom.gba", 0x802BC4, 0xC0

	.global gUnknown_08802C84
gUnknown_08802C84:  @ 0x08802C84
	.incbin "baserom.gba", 0x802C84, 0xA0

	.global gUnknown_08802D24
gUnknown_08802D24:  @ 0x08802D24
	.incbin "baserom.gba", 0x802D24, 0x20

	.global gUnknown_08802D44
gUnknown_08802D44:  @ 0x08802D44
	.incbin "baserom.gba", 0x802D44, 0x380

	.global gUnknown_088030C4
gUnknown_088030C4:  @ 0x088030C4
	.incbin "baserom.gba", 0x8030C4, 0x300

	.global gUnknown_088033C4
gUnknown_088033C4:  @ 0x088033C4
	.incbin "baserom.gba", 0x8033C4, 0x160

	.global gUnknown_08803524
gUnknown_08803524:  @ 0x08803524
	.incbin "baserom.gba", 0x803524, 0x6C

	.global gUnknown_08803590
gUnknown_08803590:  @ 0x08803590
	.incbin "baserom.gba", 0x803590, 0x20

	.global gUnknown_088035B0
gUnknown_088035B0:  @ 0x088035B0
	.incbin "baserom.gba", 0x8035B0, 0x438

	.global gUnknown_088039E8
gUnknown_088039E8:  @ 0x088039E8
	.incbin "baserom.gba", 0x8039E8, 0x128

	.global gUnknown_08803B10
gUnknown_08803B10:  @ 0x08803B10
	.incbin "baserom.gba", 0x803B10, 0x20

	.global gUnknown_08803B30
gUnknown_08803B30:  @ 0x08803B30
	.incbin "baserom.gba", 0x803B30, 0xA0

	.global gUnknown_08803BD0
gUnknown_08803BD0:  @ 0x08803BD0
	.incbin "baserom.gba", 0x803BD0, 0xE0

	.global gUnknown_08803CB0
gUnknown_08803CB0:  @ 0x08803CB0
	.incbin "baserom.gba", 0x803CB0, 0x20

	.global gUnknown_08803CD0
gUnknown_08803CD0:  @ 0x08803CD0
	.incbin "baserom.gba", 0x803CD0, 0x94

	.global gCharacterData
gCharacterData:  @ 0x08803D64
	.incbin "baserom.gba", 0x803D64, 0x3400

	.global gClassData
gClassData:  @ 0x08807164
	.incbin "baserom.gba", 0x807164, 0x29AC

	.global gItemData
gItemData:  @ 0x08809B10
	.incbin "baserom.gba", 0x809B10, 0x1DFC

	.global gUnknown_0880B90C
gUnknown_0880B90C:  @ 0x0880B90C
	.incbin "baserom.gba", 0x80B90C, 0x28A

	.global gUnknown_0880BB96
gUnknown_0880BB96:  @ 0x0880BB96
	.incbin "baserom.gba", 0x80BB96, 0x82

	.global gUnknown_0880BC18
gUnknown_0880BC18:  @ 0x0880BC18
	.incbin "baserom.gba", 0x80BC18, 0x861

	.global gUnknown_0880C479
gUnknown_0880C479:  @ 0x0880C479
	.incbin "baserom.gba", 0x80C479, 0x41

	.global gUnknown_0880C4BA
gUnknown_0880C4BA:  @ 0x0880C4BA
	.incbin "baserom.gba", 0x80C4BA, 0x28A

	.global gUnknown_0880C744
gUnknown_0880C744:  @ 0x0880C744
	.incbin "baserom.gba", 0x80C744, 0x41

	.global gUnknown_0880C785
gUnknown_0880C785:  @ 0x0880C785
	.incbin "baserom.gba", 0x80C785, 0x41

	.global gUnknown_0880C7C6
gUnknown_0880C7C6:  @ 0x0880C7C6
	.incbin "baserom.gba", 0x80C7C6, 0x41

	.global gUnknown_0880C807
gUnknown_0880C807:  @ 0x0880C807
	.incbin "baserom.gba", 0x80C807, 0x41

	.global gUnknown_0880C848
gUnknown_0880C848:  @ 0x0880C848
	.incbin "baserom.gba", 0x80C848, 0x41

	.global gUnknown_0880C889
gUnknown_0880C889:  @ 0x0880C889
	.incbin "baserom.gba", 0x80C889, 0x41

	.global gUnknown_0880C8CA
gUnknown_0880C8CA:  @ 0x0880C8CA
	.incbin "baserom.gba", 0x80C8CA, 0x41

	.global gUnknown_0880C90B
gUnknown_0880C90B:  @ 0x0880C90B
	.incbin "baserom.gba", 0x80C90B, 0x41

	.global gUnknown_0880C94C
gUnknown_0880C94C:  @ 0x0880C94C
	.incbin "baserom.gba", 0x80C94C, 0x41

	.global gUnknown_0880C98D
gUnknown_0880C98D:  @ 0x0880C98D
	.incbin "baserom.gba", 0x80C98D, 0x41

	.global gUnknown_0880C9CE
gUnknown_0880C9CE:  @ 0x0880C9CE
	.incbin "baserom.gba", 0x80C9CE, 0x41

	.global gUnknown_0880CA0F
gUnknown_0880CA0F:  @ 0x0880CA0F
	.incbin "baserom.gba", 0x80CA0F, 0x41

	.global gUnknown_0880CA50
gUnknown_0880CA50:  @ 0x0880CA50
	.incbin "baserom.gba", 0x80CA50, 0x41

	.global gUnknown_0880CA91
gUnknown_0880CA91:  @ 0x0880CA91
	.incbin "baserom.gba", 0x80CA91, 0x41

	.global gUnknown_0880CAD2
gUnknown_0880CAD2:  @ 0x0880CAD2
	.incbin "baserom.gba", 0x80CAD2, 0x41

	.global gUnknown_0880CB13
gUnknown_0880CB13:  @ 0x0880CB13
	.incbin "baserom.gba", 0x80CB13, 0x41

	.global gUnknown_0880CB54
gUnknown_0880CB54:  @ 0x0880CB54
	.incbin "baserom.gba", 0x80CB54, 0x41

	.global gUnknown_0880CB95
gUnknown_0880CB95:  @ 0x0880CB95
	.incbin "baserom.gba", 0x80CB95, 0x41

	.global gUnknown_0880CBD6
gUnknown_0880CBD6:  @ 0x0880CBD6
	.incbin "baserom.gba", 0x80CBD6, 0x41

	.global gUnknown_0880CC17
gUnknown_0880CC17:  @ 0x0880CC17
	.incbin "baserom.gba", 0x80CC17, 0x41

	.global gUnknown_0880CC58
gUnknown_0880CC58:  @ 0x0880CC58
	.incbin "baserom.gba", 0x80CC58, 0x41

	.global gUnknown_0880CC99
gUnknown_0880CC99:  @ 0x0880CC99
	.incbin "baserom.gba", 0x80CC99, 0x41

	.global gUnknown_0880CCDA
gUnknown_0880CCDA:  @ 0x0880CCDA
	.incbin "baserom.gba", 0x80CCDA, 0x41

	.global gUnknown_0880CD1B
gUnknown_0880CD1B:  @ 0x0880CD1B
	.incbin "baserom.gba", 0x80CD1B, 0x41

	.global gUnknown_0880CD5C
gUnknown_0880CD5C:  @ 0x0880CD5C
	.incbin "baserom.gba", 0x80CD5C, 0x41

	.global gUnknown_0880CD9D
gUnknown_0880CD9D:  @ 0x0880CD9D
	.incbin "baserom.gba", 0x80CD9D, 0x41

	.global gUnknown_0880CDDE
gUnknown_0880CDDE:  @ 0x0880CDDE
	.incbin "baserom.gba", 0x80CDDE, 0x41

	.global gUnknown_0880CE1F
gUnknown_0880CE1F:  @ 0x0880CE1F
	.incbin "baserom.gba", 0x80CE1F, 0x41

	.global gUnknown_0880CE60
gUnknown_0880CE60:  @ 0x0880CE60
	.incbin "baserom.gba", 0x80CE60, 0x41

	.global gUnknown_0880CEA1
gUnknown_0880CEA1:  @ 0x0880CEA1
	.incbin "baserom.gba", 0x80CEA1, 0x41

	.global gUnknown_0880CEE2
gUnknown_0880CEE2:  @ 0x0880CEE2
	.incbin "baserom.gba", 0x80CEE2, 0x41

	.global gUnknown_0880CF23
gUnknown_0880CF23:  @ 0x0880CF23
	.incbin "baserom.gba", 0x80CF23, 0x41

	.global gUnknown_0880CF64
gUnknown_0880CF64:  @ 0x0880CF64
	.incbin "baserom.gba", 0x80CF64, 0x41

	.global gUnknown_0880CFA5
gUnknown_0880CFA5:  @ 0x0880CFA5
	.incbin "baserom.gba", 0x80CFA5, 0x41

	.global gUnknown_0880CFE6
gUnknown_0880CFE6:  @ 0x0880CFE6
	.incbin "baserom.gba", 0x80CFE6, 0x41

	.global gUnknown_0880D027
gUnknown_0880D027:  @ 0x0880D027
	.incbin "baserom.gba", 0x80D027, 0x41

	.global gUnknown_0880D068
gUnknown_0880D068:  @ 0x0880D068
	.incbin "baserom.gba", 0x80D068, 0x41

	.global gUnknown_0880D0A9
gUnknown_0880D0A9:  @ 0x0880D0A9
	.incbin "baserom.gba", 0x80D0A9, 0x41

	.global gUnknown_0880D0EA
gUnknown_0880D0EA:  @ 0x0880D0EA
	.incbin "baserom.gba", 0x80D0EA, 0x41

	.global gUnknown_0880D12B
gUnknown_0880D12B:  @ 0x0880D12B
	.incbin "baserom.gba", 0x80D12B, 0x41

	.global gUnknown_0880D16C
gUnknown_0880D16C:  @ 0x0880D16C
	.incbin "baserom.gba", 0x80D16C, 0x41

	.global gUnknown_0880D1AD
gUnknown_0880D1AD:  @ 0x0880D1AD
	.incbin "baserom.gba", 0x80D1AD, 0x41

	.global gUnknown_0880D1EE
gUnknown_0880D1EE:  @ 0x0880D1EE
	.incbin "baserom.gba", 0x80D1EE, 0x41

	.global gUnknown_0880D22F
gUnknown_0880D22F:  @ 0x0880D22F
	.incbin "baserom.gba", 0x80D22F, 0x145

	.global gUnknown_0880D374
gUnknown_0880D374:  @ 0x0880D374
	.incbin "baserom.gba", 0x80D374, 0x84
 