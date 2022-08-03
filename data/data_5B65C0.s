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
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da3a4
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word ekrBattleDeamon_Destructor
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_35
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9378
gUnknown_085B9378:  @ 0x085B9378
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da3b4
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_36
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattle_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattle_8050000
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B93A0
gUnknown_085B93A0:  @ 0x085B93A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da3c0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8050E00
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B93B8
gUnknown_085B93B8:  @ 0x085B93B8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da3cc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrGauge_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


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
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da3d8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrDispUP_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9604
gUnknown_085B9604:  @ 0x085B9604
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da3e4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80523EC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052504
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80525A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B962C
gUnknown_085B962C:  @ 0x085B962C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da3f0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80526C8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052788
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805282C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052504
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80525A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9664
gUnknown_085B9664:  @ 0x085B9664
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da400
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80529F0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052504
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80525A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B968C
gUnknown_085B968C:  @ 0x085B968C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da40c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052AE4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052504
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80525A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B96B4
gUnknown_085B96B4:  @ 0x085B96B4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da41c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052C24
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052504
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80525A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B96DC
gUnknown_085B96DC:  @ 0x085B96DC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da428
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052CA0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B96F4
gUnknown_085B96F4:  @ 0x085B96F4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da454
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052DB8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052504
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80525A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9724
gUnknown_085B9724:  @ 0x085B9724
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da464
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052DFC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052E7C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052EAC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052F24
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052F84
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B975C
gUnknown_085B975C:  @ 0x085B975C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da474
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8052FEC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8053080
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B977C
gUnknown_085B977C:  @ 0x085B977C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da47c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8053144
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9794
gUnknown_085B9794:  @ 0x085B9794
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da488
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805320C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B97AC
gUnknown_085B97AC:  @ 0x085B97AC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da498
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8053368
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B97C4
gUnknown_085B97C4:  @ 0x085B97C4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da4ac
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80534E4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8053514
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8053584
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B97EC
gUnknown_085B97EC:  @ 0x085B97EC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dabc0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80536B8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9804
gUnknown_085B9804:  @ 0x085B9804
    .4byte gUnknown_080DA4BA
    .4byte 0
    .4byte gUnknown_080DA4DC
    .4byte 0
    .4byte gUnknown_080DA526
    .4byte 0
    .4byte gUnknown_080DA570
    .4byte 0
    .4byte gUnknown_080DA5BA
    .4byte 0
    .4byte gUnknown_080DA604
    .4byte 0
    .4byte gUnknown_080DA66E + 0xb2
    .4byte 0
    .4byte gUnknown_080DA66E + 0xc4
    .4byte 0
    .4byte gUnknown_080DA66E + 0xe6
    .4byte 0
    .4byte gUnknown_080DA66E + 0xf8
    .4byte 0
    .4byte gUnknown_080DA66E + 0x10a
    .4byte 0
    .4byte gUnknown_080DA66E + 0x11c
    .4byte 0
    .4byte gUnknown_080DA66E + 0x1d2
    .4byte 0
    .4byte gUnknown_080DA66E + 0x1e4
    .4byte 0
    .4byte gUnknown_080DA66E + 0x1f6
    .4byte 0
    .4byte gUnknown_080DA66E + 0x208
    .4byte 0

	.global gUnknown_085B9884
gUnknown_085B9884:  @ 0x085B9884
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dabd0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_56
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B989C
gUnknown_085B989C:  @ 0x085B989C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dabe0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805382C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B98B4
gUnknown_085B98B4:  @ 0x085B98B4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dabec
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8053BBC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B98CC
gUnknown_085B98CC:  @ 0x085B98CC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dabf8
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8053FE4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805401C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B98F4
gUnknown_085B98F4:  @ 0x085B98F4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dac04
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8054054
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80540B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8054120
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B991C
gUnknown_085B991C:  @ 0x085B991C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dac10
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8054158
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80541B4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8054224
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9944
gUnknown_085B9944:  @ 0x085B9944
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dac1c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805425C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80542B8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8054328
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B996C
gUnknown_085B996C:  @ 0x085B996C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dac28
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8054360
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80543BC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805442C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9994
gUnknown_085B9994:  @ 0x085B9994
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dac34
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8054478
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8054498
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805452C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B99C4
gUnknown_085B99C4:  @ 0x085B99C4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dac44
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80546E4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B99E4
gUnknown_085B99E4:  @ 0x085B99E4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80daca4
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8054818
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8054888
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9A0C
gUnknown_085B9A0C:  @ 0x085B9A0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dacb4
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8054930
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80549BC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9A34
gUnknown_085B9A34:  @ 0x085B9A34
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80daccc
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8054E4C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8054C94
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9A5C
gUnknown_085B9A5C:  @ 0x085B9A5C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dacfc
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8054F78
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8054F10
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9A84
gUnknown_085B9A84:  @ 0x085B9A84
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dad38
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8055038
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805509C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80550DC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9AB4
gUnknown_085B9AB4:  @ 0x085B9AB4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dad48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8055A64
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8055B38
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9AD4
gUnknown_085B9AD4:  @ 0x085B9AD4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dad54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleStarting_8055CF0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleStarting_8055DF4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleStarting_8055F00
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleStarting_8055FA0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleStarting_8055FE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleStarting_8056024
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleStarting_8056078
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9B1C
gUnknown_085B9B1C:  @ 0x085B9B1C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dad68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_80560F0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_8056170
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_80561C8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_8056228
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_8056288
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_8056310
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_8056390
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrBattleEnding_8056484
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9B6C
gUnknown_085B9B6C:  @ 0x085B9B6C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dad78
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8056864
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9B84
gUnknown_085B9B84:  @ 0x085B9B84
    .4byte gUnknown_080DB026 + 0x512
    .4byte 0
    .4byte gUnknown_080DB026 + 0x512
    .4byte 0
    .4byte gUnknown_080DB026 + 0xe
    .4byte 0
    .4byte gUnknown_080DB026 + 0x512
    .4byte 0

	.global gUnknown_085B9BA4
gUnknown_085B9BA4:  @ 0x085B9BA4
    .4byte gUnknown_080DB026 + 0x99e
    .4byte gUnknown_080DB026 + 0xdf6
    .4byte gUnknown_080DB026 + 0xdf6
    .4byte gUnknown_080DB026 + 0xdf6
    .4byte gUnknown_080DB026 + 0x132a
    .4byte gUnknown_080DB026 + 0xdf6
    .4byte gUnknown_080DB026 + 0xdf6
    .4byte gUnknown_080DB026 + 0xdf6

	.global gUnknown_085B9BC4
gUnknown_085B9BC4:  @ 0x085B9BC4
    .4byte gUnknown_085D1470 + 0x1a48
    .4byte 0
    .4byte gUnknown_085D1470 + 0x1a68
    .4byte 0
    .4byte gUnknown_085D1470 + 0xdb8
    .4byte 0
    .4byte gUnknown_085D1470 + 0x1a8c
    .4byte 0

	.global gUnknown_085B9BE4
gUnknown_085B9BE4:  @ 0x085B9BE4
    .4byte gUnknown_085D1470 + 0x231c
    .4byte gUnknown_085D1470 + 0x3180
    .4byte gUnknown_085D1470 + 0x3180
    .4byte gUnknown_085D1470 + 0x3180
    .4byte gUnknown_085D1470 + 0x3984
    .4byte gUnknown_085D1470 + 0x31a4
    .4byte gUnknown_085D1470 + 0x31a4
    .4byte gUnknown_085D1470 + 0x31a4

	.global gUnknown_085B9C04
gUnknown_085B9C04:  @ 0x085B9C04
    .4byte gUnknown_085D1470 + 0x22f8
    .4byte gUnknown_085D1470 + 0x3138
    .4byte gUnknown_085D1470 + 0x3138
    .4byte gUnknown_085D1470 + 0x3138
    .4byte gUnknown_085D1470 + 0x3960
    .4byte gUnknown_085D1470 + 0x315c
    .4byte gUnknown_085D1470 + 0x315c
    .4byte gUnknown_085D1470 + 0x315c

	.global gUnknown_085B9C24
gUnknown_085B9C24:  @ 0x085B9C24
    .4byte gUnknown_085D1470 + 0x1ab0
    .4byte 0
    .4byte gUnknown_085D1470 + 0x1ad0
    .4byte 0
    .4byte gUnknown_085D1470 + 0xddc
    .4byte 0
    .4byte gUnknown_085D1470 + 0x1af4
    .4byte 0

	.global gUnknown_085B9C44
gUnknown_085B9C44:  @ 0x085B9C44
    .4byte gUnknown_085D1470 + 0x2364
    .4byte gUnknown_085D1470 + 0x3210
    .4byte gUnknown_085D1470 + 0x3210
    .4byte gUnknown_085D1470 + 0x3210
    .4byte gUnknown_085D1470 + 0x39cc
    .4byte gUnknown_085D1470 + 0x3234
    .4byte gUnknown_085D1470 + 0x3234
    .4byte gUnknown_085D1470 + 0x3234

	.global gUnknown_085B9C64
gUnknown_085B9C64:  @ 0x085B9C64
    .4byte gUnknown_085D1470 + 0x2340
    .4byte gUnknown_085D1470 + 0x31c8
    .4byte gUnknown_085D1470 + 0x31c8
    .4byte gUnknown_085D1470 + 0x31c8
    .4byte gUnknown_085D1470 + 0x39a8
    .4byte gUnknown_085D1470 + 0x31ec
    .4byte gUnknown_085D1470 + 0x31ec
    .4byte gUnknown_085D1470 + 0x31ec

	.global gUnknown_085B9C84
gUnknown_085B9C84:  @ 0x085B9C84
    .4byte gUnknown_080DAD0A + 0x8c
    .4byte 0
    .4byte gUnknown_080DAD0A + 0x9c
    .4byte 0
    .4byte gUnknown_080DAD0A + 0x7c
    .4byte 0
    .4byte gUnknown_080DAD0A + 0xac
    .4byte 0

	.global gUnknown_085B9CA4
gUnknown_085B9CA4:  @ 0x085B9CA4
    .4byte gUnknown_080DAD0A + 0xcc
    .4byte gUnknown_080DAD0A + 0xfc
    .4byte gUnknown_080DAD0A + 0xfc
    .4byte gUnknown_080DAD0A + 0xfc
    .4byte gUnknown_080DAD0A + 0x12c
    .4byte gUnknown_080DAD0A + 0x10c
    .4byte gUnknown_080DAD0A + 0x10c
    .4byte gUnknown_080DAD0A + 0x10c

	.global gUnknown_085B9CC4
gUnknown_085B9CC4:  @ 0x085B9CC4
    .4byte gUnknown_080DAD0A + 0xbc
    .4byte gUnknown_080DAD0A + 0xdc
    .4byte gUnknown_080DAD0A + 0xdc
    .4byte gUnknown_080DAD0A + 0xdc
    .4byte gUnknown_080DAD0A + 0x11c
    .4byte gUnknown_080DAD0A + 0xec
    .4byte gUnknown_080DAD0A + 0xec
    .4byte gUnknown_080DAD0A + 0xec

	.global gUnknown_085B9CE4
gUnknown_085B9CE4:  @ 0x085B9CE4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dae48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8056974
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8056B70
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8056D18
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9D0C
gUnknown_085B9D0C:  @ 0x085B9D0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dae58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8056D90
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9D24
gUnknown_085B9D24:  @ 0x085B9D24
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dae68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8056E7C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8056EA4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9D44
gUnknown_085B9D44:  @ 0x085B9D44
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dae7c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8056F84
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9D5C
gUnknown_085B9D5C:  @ 0x085B9D5C
	.incbin "baserom.gba", 0x5B9D5C, 0x10

	.global gUnknown_085B9D6C
gUnknown_085B9D6C:  @ 0x085B9D6C
    .4byte gUnknown_085B9E4C + 0xc
    .4byte gUnknown_085B9E4C + 0xa4
    .4byte gUnknown_085B9E4C + 0x13c
    .4byte gUnknown_085B9E4C + 0x1d4
    .4byte gUnknown_085B9E4C + 0x13c
    .4byte gUnknown_085B9E4C + 0x1d4
    .4byte gUnknown_085B9E4C + 0x13c
    .4byte gUnknown_085B9E4C + 0x1d4
    .4byte gUnknown_085B9E4C + 0xc
    .4byte gUnknown_085B9E4C + 0xa4

	.global gUnknown_085B9D94
gUnknown_085B9D94:  @ 0x085B9D94
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80daf34
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8059924
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9DAC
gUnknown_085B9DAC:  @ 0x085B9DAC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80daf40
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ExecAllAIS
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9DC4
gUnknown_085B9DC4:  @ 0x085B9DC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80daf50
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805AA4C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9DDC
gUnknown_085B9DDC:  @ 0x085B9DDC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80daff8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B104
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B18C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B200
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B264
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9E0C
gUnknown_085B9E0C:  @ 0x085B9E0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80db008
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B290
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B2BC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B320
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9E34
gUnknown_085B9E34:  @ 0x085B9E34
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80db018
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B394
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


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
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc860
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_805B444
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B454
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D4FB8
gUnknown_085D4FB8:  @ 0x085D4FB8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc86c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B534
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D4FD0
gUnknown_085D4FD0:  @ 0x085D4FD0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc87c
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_805B584
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B594
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D4FF0
gUnknown_085D4FF0:  @ 0x085D4FF0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc888
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B670
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5008
gUnknown_085D5008:  @ 0x085D5008
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc894
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B94C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805B958
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5028
gUnknown_085D5028:  @ 0x085D5028
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8a0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805BA64
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5040
gUnknown_085D5040:  @ 0x085D5040
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8ac
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805BB84
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5058
gUnknown_085D5058:  @ 0x085D5058
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxMagicQUAKE
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5070
gUnknown_085D5070:  @ 0x085D5070
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8cc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxDummymagic
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5088
gUnknown_085D5088:  @ 0x085D5088
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8dc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805BF40
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D50A0
gUnknown_085D50A0:  @ 0x085D50A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8e8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C080
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C0DC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D50C0
gUnknown_085D50C0:  @ 0x085D50C0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8f4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C188
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D50D8
gUnknown_085D50D8:  @ 0x085D50D8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc904
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_805C20C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C21C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D50F8
gUnknown_085D50F8:  @ 0x085D50F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc910
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C29C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5110
gUnknown_085D5110:  @ 0x085D5110
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc91c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C3C0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5128
gUnknown_085D5128:  @ 0x085D5128
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc928
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C7E4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5140
gUnknown_085D5140:  @ 0x085D5140
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc934
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5158
gUnknown_085D5158:  @ 0x085D5158
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc944
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C96C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5170
gUnknown_085D5170:  @ 0x085D5170
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc94c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CAC4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5188
gUnknown_085D5188:  @ 0x085D5188
    .4byte gUnknown_08754870 + 0xa0
    .4byte gUnknown_08754870 + 0x148
    .4byte gUnknown_08754870 + 0x1f4
    .4byte gUnknown_08754870 + 0x2a4
    .4byte gUnknown_08754870 + 0x368
    .4byte gUnknown_08754870 + 0x434
    .4byte gUnknown_08754870 + 0x50c
    .4byte gUnknown_08754870 + 0x5ec
    .4byte gUnknown_08754870 + 0x6cc
    .4byte gUnknown_08754870 + 0x7b8
    .4byte gUnknown_08754870 + 0x8ac
    .4byte gUnknown_08754870 + 0x9a8
    .4byte gUnknown_08754870 + 0xaa0
    .4byte gUnknown_08754870 + 0xba0
    .4byte gUnknown_08754870 + 0xca0
    .4byte gUnknown_08754870 + 0xda0
    .4byte gUnknown_08754870 + 0xea4
    .4byte gUnknown_08754870 + 0xf94
    .4byte gUnknown_08754870 + 0x107c
    .4byte gUnknown_08754870 + 0x1160
    .4byte gUnknown_08754870 + 0x1248
    .4byte gUnknown_08754870 + 0x1324
    .4byte gUnknown_08754870 + 0x13f4
    .4byte gUnknown_08754870 + 0x14b0
    .4byte gUnknown_08754870 + 0x1570
    .4byte gUnknown_08754870 + 0x1624
    .4byte gUnknown_08754870 + 0x16cc

	.global gUnknown_085D51F4
gUnknown_085D51F4:  @ 0x085D51F4
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0xbf0
    .4byte gUnknown_08752020 + 0xbf0
    .4byte gUnknown_08752020 + 0xbf0
    .4byte gUnknown_08752020 + 0xbf0
    .4byte gUnknown_08752020 + 0xbf0
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x22fc
    .4byte gUnknown_08752020 + 0x22fc
    .4byte gUnknown_08752020 + 0x22fc
    .4byte gUnknown_08752020 + 0x22fc
    .4byte gUnknown_08752020 + 0x22fc

	.global gUnknown_085D5260
gUnknown_085D5260:  @ 0x085D5260
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9c4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CBA8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5278
gUnknown_085D5278:  @ 0x085D5278
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9d0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CC14
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5290
gUnknown_085D5290:  @ 0x085D5290
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9dc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CD5C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D52A8
gUnknown_085D52A8:  @ 0x085D52A8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9e8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CE94
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D52C0
gUnknown_085D52C0:  @ 0x085D52C0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9f8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CF04
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D52D8
gUnknown_085D52D8:  @ 0x085D52D8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca04
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D030
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D52F0
gUnknown_085D52F0:  @ 0x085D52F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca14
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D09C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5308
gUnknown_085D5308:  @ 0x085D5308
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca24
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D1FC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5320
gUnknown_085D5320:  @ 0x085D5320
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca38
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D2B4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5338
gUnknown_085D5338:  @ 0x085D5338
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca48
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D328
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5358
gUnknown_085D5358:  @ 0x085D5358
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcb38
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D3C4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5370
gUnknown_085D5370:  @ 0x085D5370
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcb48
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_805D4B8
        @ PROC_SLEEP
        .short 0xe, 0x34
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5390
gUnknown_085D5390:  @ 0x085D5390
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcb58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxDarkbreath
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D53A8
gUnknown_085D53A8:  @ 0x085D53A8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcb68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D5EC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D53C0
gUnknown_085D53C0:  @ 0x085D53C0
    .4byte gUnknown_085E5AE4 + 0x9f4
    .4byte gUnknown_085E5AE4 + 0xadc
    .4byte gUnknown_085E5AE4 + 0xb98
    .4byte gUnknown_085E5AE4 + 0xc94
    .4byte gUnknown_085E5AE4 + 0xd7c
    .4byte gUnknown_085E5AE4 + 0xe64
    .4byte gUnknown_085E5AE4 + 0xf60
    .4byte gUnknown_085E5AE4 + 0x108c
    .4byte gUnknown_085E5AE4 + 0x11c0
    .4byte gUnknown_085E5AE4 + 0x1284
    .4byte gUnknown_085E5AE4 + 0x13b0
    .4byte gUnknown_085E5AE4 + 0x14ac

	.global gUnknown_085D53F0
gUnknown_085D53F0:  @ 0x085D53F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcbc0
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D680
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5410
gUnknown_085D5410:  @ 0x085D5410
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcc78
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D774
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5428
gUnknown_085D5428:  @ 0x085D5428
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcc8c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxThunder
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5440
gUnknown_085D5440:  @ 0x085D5440
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcc98
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D938
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5458
gUnknown_085D5458:  @ 0x085D5458
    .4byte gUnknown_085F367C + 0x200
    .4byte gUnknown_085F367C + 0x2cc

	.global gUnknown_085D5460
gUnknown_085D5460:  @ 0x085D5460
    .4byte gUnknown_085F367C + 0x200
    .4byte gUnknown_085F367C + 0x2cc

	.global gUnknown_085D5468
gUnknown_085D5468:  @ 0x085D5468
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dccb0
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D9F8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5488
gUnknown_085D5488:  @ 0x085D5488
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcd04
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805DAA4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D54A0
gUnknown_085D54A0:  @ 0x085D54A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcd14
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxFire
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D54B8
gUnknown_085D54B8:  @ 0x085D54B8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcd1c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxFireBG
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D54D0
gUnknown_085D54D0:  @ 0x085D54D0
    .4byte gUnknown_085F6230 + 0x20
    .4byte gUnknown_085F6230 + 0xc8
    .4byte gUnknown_085F6230 + 0x170
    .4byte gUnknown_085F6230 + 0x228
    .4byte gUnknown_085F6230 + 0x2f0
    .4byte gUnknown_085F6230 + 0x3c0
    .4byte gUnknown_085F6230 + 0x4c0
    .4byte gUnknown_085F6230 + 0x5c8
    .4byte gUnknown_085F6230 + 0x6dc
    .4byte gUnknown_085F6230 + 0x814
    .4byte gUnknown_085F6230 + 0x918
    .4byte gUnknown_085F6230 + 0x9ec

	.global gUnknown_085D5500
gUnknown_085D5500:  @ 0x085D5500
    .4byte gUnknown_085F6230 + 0xaac
    .4byte gUnknown_085F6230 + 0xb54
    .4byte gUnknown_085F6230 + 0xbfc
    .4byte gUnknown_085F6230 + 0xcb4
    .4byte gUnknown_085F6230 + 0xd7c
    .4byte gUnknown_085F6230 + 0xe4c
    .4byte gUnknown_085F6230 + 0xf4c
    .4byte gUnknown_085F6230 + 0x1054
    .4byte gUnknown_085F6230 + 0x1168
    .4byte gUnknown_085F6230 + 0x12a0
    .4byte gUnknown_085F6230 + 0x13a4
    .4byte gUnknown_085F6230 + 0x1478

	.global gUnknown_085D5530
gUnknown_085D5530:  @ 0x085D5530
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcd58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805DDA8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5548
gUnknown_085D5548:  @ 0x085D5548
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcd64
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805DE74
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5560
gUnknown_085D5560:  @ 0x085D5560
    .4byte gUnknown_085F8468 + 0x2c
    .4byte gUnknown_085F8468 + 0x2c
    .4byte gUnknown_085F8468 + 0x2c
    .4byte gUnknown_085F8468 + 0x2c
    .4byte gUnknown_085F8468 + 0x2c
    .4byte gUnknown_085F8468 + 0x2c
    .4byte gUnknown_085F8468 + 0xd68
    .4byte gUnknown_085F8468 + 0xd68
    .4byte gUnknown_085F8468 + 0xd68
    .4byte gUnknown_085F8468 + 0x1a44
    .4byte gUnknown_085F8468 + 0x1a44
    .4byte gUnknown_085F8468 + 0x286c
    .4byte gUnknown_085F8468 + 0x286c
    .4byte gUnknown_085F8468 + 0x3860
    .4byte gUnknown_085F8468 + 0x3860
    .4byte gUnknown_085F8468 + 0x4afc
    .4byte gUnknown_085F8468 + 0x56c8
    .4byte gUnknown_085F8468 + 0x62c0
    .4byte gUnknown_085F8468 + 0x6e18
    .4byte gUnknown_085F8468 + 0x7914
    .4byte gUnknown_085F8468 + 0x831c

	.global gUnknown_085D55B4
gUnknown_085D55B4:  @ 0x085D55B4
    .4byte gUnknown_0860108C + 0x20
    .4byte gUnknown_0860108C + 0xcc
    .4byte gUnknown_0860108C + 0x184
    .4byte gUnknown_0860108C + 0x250
    .4byte gUnknown_0860108C + 0x330
    .4byte gUnknown_0860108C + 0x424
    .4byte gUnknown_0860108C + 0x53c
    .4byte gUnknown_0860108C + 0x668
    .4byte gUnknown_0860108C + 0x7a0
    .4byte gUnknown_0860108C + 0x8e4
    .4byte gUnknown_0860108C + 0xa38
    .4byte gUnknown_0860108C + 0xb90
    .4byte gUnknown_0860108C + 0xcf8
    .4byte gUnknown_0860108C + 0xe64
    .4byte gUnknown_0860108C + 0xfe0
    .4byte gUnknown_0860108C + 0x1174
    .4byte gUnknown_0860108C + 0x1314
    .4byte gUnknown_0860108C + 0x14b4
    .4byte gUnknown_0860108C + 0x1654
    .4byte gUnknown_0860108C + 0x17f4
    .4byte gUnknown_0860108C + 0x1984

	.global gUnknown_085D5608
gUnknown_085D5608:  @ 0x085D5608
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcdc8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805DF70
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5620
gUnknown_085D5620:  @ 0x085D5620
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcdd4
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805DFE8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5640
gUnknown_085D5640:  @ 0x085D5640
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dce3c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E0B4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5658
gUnknown_085D5658:  @ 0x085D5658
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dce4c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E120
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5670
gUnknown_085D5670:  @ 0x085D5670
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dce5c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E2B4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5688
gUnknown_085D5688:  @ 0x085D5688
    .4byte gUnknown_08617F04 + 0x20
    .4byte gUnknown_08617F04 + 0x20c
    .4byte gUnknown_08617F04 + 0x3e4
    .4byte gUnknown_08617F04 + 0x5ac
    .4byte gUnknown_08617F04 + 0x7e0
    .4byte gUnknown_08617F04 + 0xa28

	.global gUnknown_085D56A0
gUnknown_085D56A0:  @ 0x085D56A0
    .4byte gUnknown_086101DC + 0xf04
    .4byte gUnknown_086101DC + 0x210c
    .4byte gUnknown_086101DC + 0x3268
    .4byte gUnknown_086101DC + 0x42ec
    .4byte gUnknown_086101DC + 0x572c
    .4byte gUnknown_086101DC + 0x6ae4

	.global gUnknown_085D56B8
gUnknown_085D56B8:  @ 0x085D56B8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcedc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E39C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D56D0
gUnknown_085D56D0:  @ 0x085D56D0
    .4byte gUnknown_086101DC + 0x20
    .4byte gUnknown_086101DC + 0xc4
    .4byte gUnknown_086101DC + 0x16c
    .4byte gUnknown_086101DC + 0x228
    .4byte gUnknown_086101DC + 0x2fc
    .4byte gUnknown_086101DC + 0x3f8
    .4byte gUnknown_086101DC + 0x538
    .4byte gUnknown_086101DC + 0x6d0
    .4byte gUnknown_086101DC + 0x8a4
    .4byte gUnknown_086101DC + 0xab4
    .4byte gUnknown_086101DC + 0xcd4

	.global gUnknown_085D56FC
gUnknown_085D56FC:  @ 0x085D56FC
    .4byte gUnknown_0860A5D4 + 0x190
    .4byte gUnknown_0860A5D4 + 0x190
    .4byte gUnknown_0860A5D4 + 0x190
    .4byte gUnknown_0860A5D4 + 0x190
    .4byte gUnknown_0860A5D4 + 0x190
    .4byte gUnknown_0860A5D4 + 0x190
    .4byte gUnknown_0860A5D4 + 0x1460
    .4byte gUnknown_0860A5D4 + 0x1460
    .4byte gUnknown_0860A5D4 + 0x2d10
    .4byte gUnknown_0860A5D4 + 0x4154
    .4byte gUnknown_0860A5D4 + 0x4154

	.global gUnknown_085D5728
gUnknown_085D5728:  @ 0x085D5728
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcf1c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E494
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5740
gUnknown_085D5740:  @ 0x085D5740
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcf30
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E510
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5758
gUnknown_085D5758:  @ 0x085D5758
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcf44
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E694
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5770
gUnknown_085D5770:  @ 0x085D5770
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcf5c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E790
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5788
gUnknown_085D5788:  @ 0x085D5788
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcf6c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E8A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D57A0
gUnknown_085D57A0:  @ 0x085D57A0
    .4byte gUnknown_08605DF4 + 0x7c
    .4byte gUnknown_08605DF4 + 0x7c
    .4byte gUnknown_08605DF4 + 0x7c
    .4byte gUnknown_08605DF4 + 0x7c
    .4byte gUnknown_08605DF4 + 0xc4c
    .4byte gUnknown_08605DF4 + 0xc4c
    .4byte gUnknown_08605DF4 + 0xc4c
    .4byte gUnknown_08605DF4 + 0xc4c
    .4byte gUnknown_08605DF4 + 0xc4c
    .4byte gUnknown_08605DF4 + 0xc4c
    .4byte gUnknown_08605DF4 + 0x1cb8

	.global gUnknown_085D57CC
gUnknown_085D57CC:  @ 0x085D57CC
    .4byte gUnknown_08608838 + 0x60
    .4byte gUnknown_08608838 + 0x1f4
    .4byte gUnknown_08608838 + 0x3fc
    .4byte gUnknown_08608838 + 0x560
    .4byte gUnknown_08608838 + 0x640
    .4byte gUnknown_08608838 + 0x758
    .4byte gUnknown_08608838 + 0x904
    .4byte gUnknown_08608838 + 0xa24
    .4byte gUnknown_08608838 + 0xb10
    .4byte gUnknown_08608838 + 0xbf8
    .4byte gUnknown_08608838 + 0xc90

	.global gUnknown_085D57F8
gUnknown_085D57F8:  @ 0x085D57F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcfc4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E924
        @ PROC_SLEEP
        .short 0xe, 0x64
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E968
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5820
gUnknown_085D5820:  @ 0x085D5820
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcfd8
        @ PROC_SLEEP
        .short 0xe, 0x5e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E9B0
        @ PROC_SLEEP
        .short 0xe, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E9E4
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805EA4C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5860
gUnknown_085D5860:  @ 0x085D5860
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcff0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805EAF0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805EB54
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5880
gUnknown_085D5880:  @ 0x085D5880
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd004
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805EBD4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5898
gUnknown_085D5898:  @ 0x085D5898
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd014
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805ED44
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D58B0
gUnknown_085D58B0:  @ 0x085D58B0
    .4byte gUnknown_08622F2C + 0xc0
    .4byte gUnknown_08622F2C + 0x248

	.global gUnknown_085D58B8
gUnknown_085D58B8:  @ 0x085D58B8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd030
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805EDDC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D58D8
gUnknown_085D58D8:  @ 0x085D58D8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd060
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805EEAC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D58F0
gUnknown_085D58F0:  @ 0x085D58F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd074
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805EF14
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5908
gUnknown_085D5908:  @ 0x085D5908
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd084
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805F140
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5920
gUnknown_085D5920:  @ 0x085D5920
    .4byte gUnknown_0862A2F0 + 0x20
    .4byte gUnknown_0862A2F0 + 0x11c
    .4byte gUnknown_0862A2F0 + 0x21c
    .4byte gUnknown_0862A2F0 + 0x320
    .4byte gUnknown_0862A2F0 + 0x418
    .4byte gUnknown_0862A2F0 + 0x524
    .4byte gUnknown_0862A2F0 + 0x630
    .4byte gUnknown_0862A2F0 + 0x750
    .4byte gUnknown_0862A2F0 + 0x874
    .4byte gUnknown_0862A2F0 + 0x95c
    .4byte gUnknown_0862A2F0 + 0xa38
    .4byte gUnknown_0862A2F0 + 0xaf8
    .4byte gUnknown_0862A2F0 + 0xbb0
    .4byte gUnknown_0862A2F0 + 0xc58
    .4byte gUnknown_0862A2F0 + 0xd14
    .4byte gUnknown_0862A2F0 + 0xdec
    .4byte gUnknown_0862A2F0 + 0xecc
    .4byte gUnknown_0862A2F0 + 0xfbc
    .4byte gUnknown_0862A2F0 + 0x10b8
    .4byte gUnknown_0862A2F0 + 0x11ac
    .4byte gUnknown_0862A2F0 + 0x12a4
    .4byte gUnknown_0862A2F0 + 0x1390
    .4byte gUnknown_0862A2F0 + 0x1474
    .4byte gUnknown_0862A2F0 + 0x154c
    .4byte gUnknown_0862A2F0 + 0x161c
    .4byte gUnknown_0862A2F0 + 0x16e8
    .4byte gUnknown_0862A2F0 + 0x17b0
    .4byte gUnknown_0862A2F0 + 0x1864
    .4byte gUnknown_0862A2F0 + 0x1918
    .4byte gUnknown_0862A2F0 + 0x19b8
    .4byte gUnknown_0862A2F0 + 0x1a6c
    .4byte gUnknown_0862A2F0 + 0x1b28
    .4byte gUnknown_0862A2F0 + 0x1c04
    .4byte gUnknown_0862A2F0 + 0x1cec
    .4byte gUnknown_0862A2F0 + 0x1e10
    .4byte gUnknown_0862A2F0 + 0x1f30
    .4byte gUnknown_0862A2F0 + 0x203c
    .4byte gUnknown_0862A2F0 + 0x2148
    .4byte gUnknown_0862A2F0 + 0x2244
    .4byte gUnknown_0862A2F0 + 0x2344
    .4byte gUnknown_0862A2F0 + 0x2440

	.global gUnknown_085D59C4
gUnknown_085D59C4:  @ 0x085D59C4
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x3278
    .4byte gUnknown_0862688C + 0x3278
    .4byte gUnknown_0862688C + 0x3278
    .4byte gUnknown_0862688C + 0x3278
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xb8

	.global gUnknown_085D5A68
gUnknown_085D5A68:  @ 0x085D5A68
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd13c
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_805F234
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805F24C
        @ PROC_SLEEP
        .short 0xe, 0x20
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805F288
        @ PROC_SLEEP
        .short 0xe, 0xb
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805F2C4
        @ PROC_SLEEP
        .short 0xe, 0x16
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5AB0
gUnknown_085D5AB0:  @ 0x085D5AB0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd14c
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_805F234
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805F300
        @ PROC_SLEEP
        .short 0xe, 0xe
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805F32C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5AE0
gUnknown_085D5AE0:  @ 0x085D5AE0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd160
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxResire
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5AF8
gUnknown_085D5AF8:  @ 0x085D5AF8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd16c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805F5DC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805F660
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805F6FC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805F76C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5B28
gUnknown_085D5B28:  @ 0x085D5B28
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd178
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805F7D4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5B40
gUnknown_085D5B40:  @ 0x085D5B40
    .4byte gUnknown_0862DCE0 + 0x2c
    .4byte gUnknown_0862DCE0 + 0x2c
    .4byte gUnknown_0862DCE0 + 0x2c
    .4byte gUnknown_0862DCE0 + 0x2c
    .4byte gUnknown_0862DCE0 + 0x2c
    .4byte gUnknown_0862DCE0 + 0x2c
    .4byte gUnknown_0862DCE0 + 0x2c
    .4byte gUnknown_0862DCE0 + 0x2c
    .4byte gUnknown_0862DCE0 + 0xafc
    .4byte gUnknown_0862DCE0 + 0xafc
    .4byte gUnknown_0862DCE0 + 0xafc
    .4byte gUnknown_0862DCE0 + 0x16a4
    .4byte gUnknown_0862DCE0 + 0x16a4
    .4byte gUnknown_0862DCE0 + 0x21fc
    .4byte gUnknown_0862DCE0 + 0x21fc
    .4byte gUnknown_0862DCE0 + 0x2cb0
    .4byte gUnknown_0862DCE0 + 0x2cb0
    .4byte gUnknown_0862DCE0 + 0x3780
    .4byte gUnknown_0862DCE0 + 0x3780
    .4byte gUnknown_0862DCE0 + 0x3780
    .4byte gUnknown_0862DCE0 + 0x4444
    .4byte gUnknown_0862DCE0 + 0x4444
    .4byte gUnknown_0862DCE0 + 0x4444
    .4byte gUnknown_0862DCE0 + 0x4d48
    .4byte gUnknown_0862DCE0 + 0x4d48
    .4byte gUnknown_0862DCE0 + 0x4d48
    .4byte gUnknown_0862DCE0 + 0x4d48
    .4byte gUnknown_0862DCE0 + 0x4d48
    .4byte gUnknown_0862DCE0 + 0x529c
    .4byte gUnknown_0862DCE0 + 0x529c
    .4byte gUnknown_0862DCE0 + 0x529c
    .4byte gUnknown_0862DCE0 + 0x529c
    .4byte gUnknown_0862DCE0 + 0x529c
    .4byte gUnknown_0862DCE0 + 0x529c
    .4byte gUnknown_0862DCE0 + 0x529c
    .4byte gUnknown_0862DCE0 + 0x529c
    .4byte gUnknown_0862DCE0 + 0x5bb4
    .4byte gUnknown_0862DCE0 + 0x5bb4
    .4byte gUnknown_0862DCE0 + 0x5bb4
    .4byte gUnknown_0862DCE0 + 0x5bb4
    .4byte gUnknown_0862DCE0 + 0x67e8
    .4byte gUnknown_0862DCE0 + 0x67e8
    .4byte gUnknown_0862DCE0 + 0x67e8
    .4byte gUnknown_0862DCE0 + 0x748c
    .4byte gUnknown_0862DCE0 + 0x748c
    .4byte gUnknown_0862DCE0 + 0x748c
    .4byte gUnknown_0862DCE0 + 0x8080
    .4byte gUnknown_0862DCE0 + 0x8080
    .4byte gUnknown_0862DCE0 + 0x8080
    .4byte gUnknown_0862DCE0 + 0x8080
    .4byte gUnknown_0862DCE0 + 0x8080

	.global gUnknown_085D5C0C
gUnknown_085D5C0C:  @ 0x085D5C0C
    .4byte gUnknown_08636640 + 0x20
    .4byte gUnknown_08636640 + 0x150
    .4byte gUnknown_08636640 + 0x1fc
    .4byte gUnknown_08636640 + 0x2ac
    .4byte gUnknown_08636640 + 0x364
    .4byte gUnknown_08636640 + 0x424
    .4byte gUnknown_08636640 + 0x4f0
    .4byte gUnknown_08636640 + 0x5d0
    .4byte gUnknown_08636640 + 0x6b8
    .4byte gUnknown_08636640 + 0x7c0
    .4byte gUnknown_08636640 + 0x8dc
    .4byte gUnknown_08636640 + 0xa18
    .4byte gUnknown_08636640 + 0xb68
    .4byte gUnknown_08636640 + 0xcc0
    .4byte gUnknown_08636640 + 0xe18
    .4byte gUnknown_08636640 + 0xf6c
    .4byte gUnknown_08636640 + 0x10bc
    .4byte gUnknown_08636640 + 0x120c
    .4byte gUnknown_08636640 + 0x1344
    .4byte gUnknown_08636640 + 0x1470
    .4byte gUnknown_08636640 + 0x158c
    .4byte gUnknown_08636640 + 0x1698
    .4byte gUnknown_08636640 + 0x1790
    .4byte gUnknown_08636640 + 0x187c
    .4byte gUnknown_08636640 + 0x194c
    .4byte gUnknown_08636640 + 0x1a08
    .4byte gUnknown_08636640 + 0x1abc
    .4byte gUnknown_08636640 + 0x1b6c
    .4byte gUnknown_08636640 + 0x1c18
    .4byte gUnknown_08636640 + 0x1cc0
    .4byte gUnknown_08636640 + 0x1d74
    .4byte gUnknown_08636640 + 0x1e34
    .4byte gUnknown_08636640 + 0x1f00
    .4byte gUnknown_08636640 + 0x1fc8
    .4byte gUnknown_08636640 + 0x2090
    .4byte gUnknown_08636640 + 0x2164
    .4byte gUnknown_08636640 + 0x2240
    .4byte gUnknown_08636640 + 0x2328
    .4byte gUnknown_08636640 + 0x241c
    .4byte gUnknown_08636640 + 0x2524
    .4byte gUnknown_08636640 + 0x262c
    .4byte gUnknown_08636640 + 0x2750
    .4byte gUnknown_08636640 + 0x2870
    .4byte gUnknown_08636640 + 0x298c
    .4byte gUnknown_08636640 + 0x2a9c
    .4byte gUnknown_08636640 + 0x2ba8
    .4byte gUnknown_08636640 + 0x2ca8
    .4byte gUnknown_08636640 + 0x2d98
    .4byte gUnknown_08636640 + 0x2e74
    .4byte gUnknown_08636640 + 0x2f40
    .4byte gUnknown_08636640 + 0x2ff8

	.global gUnknown_085D5CD8
gUnknown_085D5CD8:  @ 0x085D5CD8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd258
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805F868
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5CF0
gUnknown_085D5CF0:  @ 0x085D5CF0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd268
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805F8F0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5D08
gUnknown_085D5D08:  @ 0x085D5D08
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd278
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805FA28
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5D20
gUnknown_085D5D20:  @ 0x085D5D20
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3358
    .4byte gUnknown_0861AD8C + 0x3358
    .4byte gUnknown_0861AD8C + 0x3358
    .4byte gUnknown_0861AD8C + 0x4008
    .4byte gUnknown_0861AD8C + 0x4008
    .4byte gUnknown_0861AD8C + 0x4008
    .4byte gUnknown_0861AD8C + 0x4008
    .4byte gUnknown_0861AD8C + 0x4008

	.global gUnknown_085D5DA4
gUnknown_085D5DA4:  @ 0x085D5DA4
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48

	.global gUnknown_085D5E28
gUnknown_085D5E28:  @ 0x085D5E28
    .4byte gUnknown_0861AD8C + 0x4a68
    .4byte gUnknown_0861AD8C + 0x4b8c
    .4byte gUnknown_0861AD8C + 0x4cac
    .4byte gUnknown_0861AD8C + 0x4db8
    .4byte gUnknown_0861AD8C + 0x4eb4
    .4byte gUnknown_0861AD8C + 0x4f9c
    .4byte gUnknown_0861AD8C + 0x5080
    .4byte gUnknown_0861AD8C + 0x5164
    .4byte gUnknown_0861AD8C + 0x5240
    .4byte gUnknown_0861AD8C + 0x5320
    .4byte gUnknown_0861AD8C + 0x5414
    .4byte gUnknown_0861AD8C + 0x5508
    .4byte gUnknown_0861AD8C + 0x560c
    .4byte gUnknown_0861AD8C + 0x5714
    .4byte gUnknown_0861AD8C + 0x582c
    .4byte gUnknown_0861AD8C + 0x5950
    .4byte gUnknown_0861AD8C + 0x5a64
    .4byte gUnknown_0861AD8C + 0x5b14
    .4byte gUnknown_0861AD8C + 0x5c1c
    .4byte gUnknown_0861AD8C + 0x5d58
    .4byte gUnknown_0861AD8C + 0x5ecc
    .4byte gUnknown_0861AD8C + 0x6064
    .4byte gUnknown_0861AD8C + 0x61d8
    .4byte gUnknown_0861AD8C + 0x62e4
    .4byte gUnknown_0861AD8C + 0x63b8
    .4byte gUnknown_0861AD8C + 0x6458
    .4byte gUnknown_0861AD8C + 0x6578
    .4byte gUnknown_0861AD8C + 0x6694
    .4byte gUnknown_0861AD8C + 0x67a8
    .4byte gUnknown_0861AD8C + 0x68a0
    .4byte gUnknown_0861AD8C + 0x6988
    .4byte gUnknown_0861AD8C + 0x6a58
    .4byte gUnknown_0861AD8C + 0x6b1c

	.global gUnknown_085D5EAC
gUnknown_085D5EAC:  @ 0x085D5EAC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd310
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805FB60
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5EC4
gUnknown_085D5EC4:  @ 0x085D5EC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd31c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805FCE0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5EDC
gUnknown_085D5EDC:  @ 0x085D5EDC
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0865C7D4 + 0xec
    .4byte gUnknown_0865C7D4 + 0xec
    .4byte gUnknown_0865C7D4 + 0x648
    .4byte gUnknown_0865C7D4 + 0x648
    .4byte gUnknown_0865C7D4 + 0xcc4
    .4byte gUnknown_0865C7D4 + 0xcc4
    .4byte gUnknown_0865C7D4 + 0x1310
    .4byte gUnknown_0865C7D4 + 0x1310
    .4byte gUnknown_0865C7D4 + 0x1ac4
    .4byte gUnknown_0865C7D4 + 0x1ac4
    .4byte 0
    .4byte 0
    .4byte 0
    .4byte 0
    .4byte 0
    .4byte gUnknown_0865C7D4 + 0x21cc
    .4byte gUnknown_0865C7D4 + 0x26e8
    .4byte gUnknown_0865C7D4 + 0x2fe8
    .4byte gUnknown_0865C7D4 + 0x399c
    .4byte gUnknown_0865C7D4 + 0x4310
    .4byte gUnknown_0865C7D4 + 0x4ce4
    .4byte gUnknown_0865C7D4 + 0x4ce4
    .4byte gUnknown_0865C7D4 + 0x5ce8
    .4byte gUnknown_0865C7D4 + 0x5ce8
    .4byte gUnknown_0865C7D4 + 0x6b38
    .4byte gUnknown_0865C7D4 + 0x761c
    .4byte gUnknown_0865C7D4 + 0x81c4
    .4byte gUnknown_0865C7D4 + 0x8d60
    .4byte gUnknown_0865C7D4 + 0x9820
    .4byte gUnknown_0865C7D4 + 0xa298

	.global gUnknown_085D6014
gUnknown_085D6014:  @ 0x085D6014
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0865C7D4 + 0xb59c
    .4byte gUnknown_0865C7D4 + 0xb59c
    .4byte gUnknown_0865C7D4 + 0xb59c
    .4byte gUnknown_0865C7D4 + 0xb59c
    .4byte gUnknown_0865C7D4 + 0xb59c
    .4byte gUnknown_0865C7D4 + 0xb59c
    .4byte gUnknown_0865C7D4 + 0xb59c
    .4byte gUnknown_0865C7D4 + 0xb59c
    .4byte gUnknown_0865C7D4 + 0xb59c
    .4byte gUnknown_0865C7D4 + 0xb59c
    .4byte 0
    .4byte 0
    .4byte 0
    .4byte 0
    .4byte 0
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc
    .4byte gUnknown_0865C7D4 + 0xb5bc

	.global gUnknown_085D614C
gUnknown_085D614C:  @ 0x085D614C
    .4byte gUnknown_0865C7D4 + 0xb5dc
    .4byte gUnknown_0865C7D4 + 0xb700
    .4byte gUnknown_0865C7D4 + 0xb820
    .4byte gUnknown_0865C7D4 + 0xb92c
    .4byte gUnknown_0865C7D4 + 0xba28
    .4byte gUnknown_0865C7D4 + 0xbb10
    .4byte gUnknown_0865C7D4 + 0xbbf8
    .4byte gUnknown_0865C7D4 + 0xbcd8
    .4byte gUnknown_0865C7D4 + 0xbdb4
    .4byte gUnknown_0865C7D4 + 0xbe94
    .4byte gUnknown_0865C7D4 + 0xbf88
    .4byte gUnknown_0865C7D4 + 0xc07c
    .4byte gUnknown_0865C7D4 + 0xc180
    .4byte gUnknown_0865C7D4 + 0xc288
    .4byte gUnknown_0865C7D4 + 0xc3a0
    .4byte gUnknown_0865C7D4 + 0xc4c4
    .4byte gUnknown_0865C7D4 + 0xc5d8
    .4byte gUnknown_0865C7D4 + 0xc6fc
    .4byte gUnknown_0865C7D4 + 0xc820
    .4byte gUnknown_0865C7D4 + 0xc930
    .4byte gUnknown_0865C7D4 + 0xca30
    .4byte gUnknown_0865C7D4 + 0xcb18
    .4byte gUnknown_0865C7D4 + 0xcbf8
    .4byte gUnknown_0865C7D4 + 0xccd4
    .4byte gUnknown_0865C7D4 + 0xcdb0
    .4byte gUnknown_0865C7D4 + 0xce94
    .4byte gUnknown_0865C7D4 + 0xcf88
    .4byte gUnknown_0865C7D4 + 0xd078
    .4byte gUnknown_0865C7D4 + 0xd17c
    .4byte gUnknown_0865C7D4 + 0xd284
    .4byte gUnknown_0865C7D4 + 0xd398
    .4byte gUnknown_0865C7D4 + 0xd4bc
    .4byte gUnknown_0865C7D4 + 0xd5d0
    .4byte gUnknown_0865C7D4 + 0xd6f4
    .4byte gUnknown_0865C7D4 + 0xd814
    .4byte gUnknown_0865C7D4 + 0xd920
    .4byte gUnknown_0865C7D4 + 0xda1c
    .4byte gUnknown_0865C7D4 + 0xdb04
    .4byte gUnknown_0865C7D4 + 0xdbec
    .4byte gUnknown_0865C7D4 + 0xdccc
    .4byte gUnknown_0865C7D4 + 0xdda8
    .4byte gUnknown_0865C7D4 + 0xde88
    .4byte gUnknown_0865C7D4 + 0xdf7c
    .4byte gUnknown_0865C7D4 + 0xe070
    .4byte gUnknown_0865C7D4 + 0xe174
    .4byte gUnknown_0865C7D4 + 0xe27c
    .4byte gUnknown_0865C7D4 + 0xe394
    .4byte gUnknown_0865C7D4 + 0xe4b8
    .4byte gUnknown_0865C7D4 + 0xe5c8
    .4byte gUnknown_0865C7D4 + 0xe7dc
    .4byte gUnknown_0865C7D4 + 0xe998
    .4byte gUnknown_0865C7D4 + 0xeb74
    .4byte gUnknown_0865C7D4 + 0xed78
    .4byte gUnknown_0865C7D4 + 0xef80
    .4byte gUnknown_0865C7D4 + 0xf194
    .4byte gUnknown_0865C7D4 + 0xf3f4
    .4byte gUnknown_0865C7D4 + 0xf628
    .4byte gUnknown_0865C7D4 + 0xf89c
    .4byte 0
    .4byte 0
    .4byte 0
    .4byte 0
    .4byte 0
    .4byte gUnknown_0865C7D4 + 0xfae4
    .4byte gUnknown_0865C7D4 + 0xfe44
    .4byte gUnknown_0865C7D4 + 0x10198
    .4byte gUnknown_0865C7D4 + 0x104a8
    .4byte gUnknown_0865C7D4 + 0x1078c
    .4byte gUnknown_0865C7D4 + 0x10a5c
    .4byte gUnknown_0865C7D4 + 0x10cf4
    .4byte gUnknown_0865C7D4 + 0x10f8c
    .4byte gUnknown_0865C7D4 + 0x111b8
    .4byte gUnknown_0865C7D4 + 0x1146c
    .4byte gUnknown_0865C7D4 + 0x1172c
    .4byte gUnknown_0865C7D4 + 0x11a5c
    .4byte gUnknown_0865C7D4 + 0x11dac
    .4byte gUnknown_0865C7D4 + 0x12124
    .4byte gUnknown_0865C7D4 + 0x124ac

	.global gUnknown_085D6284
gUnknown_085D6284:  @ 0x085D6284
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd4a0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805FD90
        @ PROC_SLEEP
        .short 0xe, 0x45
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D62A4
gUnknown_085D62A4:  @ 0x085D62A4
	.incbin "baserom.gba", 0x5D62A4, 0x38

	.global gUnknown_085D62DC
gUnknown_085D62DC:  @ 0x085D62DC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd4b0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_805FE68
        @ PROC_SLEEP
        .short 0xe, 0x45
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D62FC
gUnknown_085D62FC:  @ 0x085D62FC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd4bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word DivineSfxLoop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6314
gUnknown_085D6314:  @ 0x085D6314
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd4c8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806013C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D632C
gUnknown_085D632C:  @ 0x085D632C
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4

	.global gUnknown_085D637C
gUnknown_085D637C:  @ 0x085D637C
    .4byte gUnknown_08641D84 + 0x304c
    .4byte gUnknown_08641D84 + 0x30ec
    .4byte gUnknown_08641D84 + 0x3194
    .4byte gUnknown_08641D84 + 0x323c
    .4byte gUnknown_08641D84 + 0x32ec
    .4byte gUnknown_08641D84 + 0x33a4
    .4byte gUnknown_08641D84 + 0x3470
    .4byte gUnknown_08641D84 + 0x353c
    .4byte gUnknown_08641D84 + 0x3610
    .4byte gUnknown_08641D84 + 0x36e8
    .4byte gUnknown_08641D84 + 0x37c4
    .4byte gUnknown_08641D84 + 0x38a0
    .4byte gUnknown_08641D84 + 0x3984
    .4byte gUnknown_08641D84 + 0x3a38
    .4byte gUnknown_08641D84 + 0x3ad4
    .4byte gUnknown_08641D84 + 0x3b70
    .4byte gUnknown_08641D84 + 0x3c0c
    .4byte gUnknown_08641D84 + 0x3ca8
    .4byte gUnknown_08641D84 + 0x3d44
    .4byte gUnknown_08641D84 + 0x3de0

	.global gUnknown_085D63CC
gUnknown_085D63CC:  @ 0x085D63CC
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4
    .4byte gUnknown_08636640 + 0xafb4

	.global gUnknown_085D63D8
gUnknown_085D63D8:  @ 0x085D63D8
    .4byte gUnknown_08641D84 + 0x3e7c
    .4byte gUnknown_08641D84 + 0x3f18
    .4byte gUnknown_08641D84 + 0x3fb4

	.global gUnknown_085D63E4
gUnknown_085D63E4:  @ 0x085D63E4
    .4byte gUnknown_08636640 + 0x30a4
    .4byte gUnknown_08636640 + 0x30a4
    .4byte gUnknown_08636640 + 0x3658
    .4byte gUnknown_08636640 + 0x3d20
    .4byte gUnknown_08636640 + 0x4360
    .4byte gUnknown_08636640 + 0x4968
    .4byte gUnknown_08636640 + 0x4fc8
    .4byte gUnknown_08636640 + 0x5638
    .4byte gUnknown_08636640 + 0x5c74
    .4byte gUnknown_08636640 + 0x62bc
    .4byte gUnknown_08636640 + 0x69c0
    .4byte gUnknown_08636640 + 0x7178
    .4byte gUnknown_08636640 + 0x796c
    .4byte gUnknown_08636640 + 0x8144
    .4byte gUnknown_08636640 + 0x8960
    .4byte gUnknown_08636640 + 0x90e0
    .4byte gUnknown_08636640 + 0x9874
    .4byte gUnknown_08636640 + 0x9fa8
    .4byte gUnknown_08636640 + 0x9fa8
    .4byte gUnknown_08636640 + 0xaa54
    .4byte gUnknown_08636640 + 0xaa54

	.global gUnknown_085D6438
gUnknown_085D6438:  @ 0x085D6438
    .4byte gUnknown_08641D84 + 0x20
    .4byte gUnknown_08641D84 + 0x1b4
    .4byte gUnknown_08641D84 + 0x3b8
    .4byte gUnknown_08641D84 + 0x688
    .4byte gUnknown_08641D84 + 0x958
    .4byte gUnknown_08641D84 + 0xc08
    .4byte gUnknown_08641D84 + 0xebc
    .4byte gUnknown_08641D84 + 0x1148
    .4byte gUnknown_08641D84 + 0x13cc
    .4byte gUnknown_08641D84 + 0x1640
    .4byte gUnknown_08641D84 + 0x18d4
    .4byte gUnknown_08641D84 + 0x1b5c
    .4byte gUnknown_08641D84 + 0x1df8
    .4byte gUnknown_08641D84 + 0x2080
    .4byte gUnknown_08641D84 + 0x22fc
    .4byte gUnknown_08641D84 + 0x252c
    .4byte gUnknown_08641D84 + 0x277c
    .4byte gUnknown_08641D84 + 0x29ac
    .4byte gUnknown_08641D84 + 0x2ba4
    .4byte gUnknown_08641D84 + 0x2d88
    .4byte gUnknown_08641D84 + 0x2f24

	.global gUnknown_085D648C
gUnknown_085D648C:  @ 0x085D648C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd5a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8060254
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D64A4
gUnknown_085D64A4:  @ 0x085D64A4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd5b8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80602C8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D64BC
gUnknown_085D64BC:  @ 0x085D64BC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd5c4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806056C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D64D4
gUnknown_085D64D4:  @ 0x085D64D4
    .4byte gUnknown_0864E7B0 + 0x20
    .4byte gUnknown_0864E7B0 + 0x1c4
    .4byte gUnknown_0864E7B0 + 0x264
    .4byte gUnknown_0864E7B0 + 0x304
    .4byte gUnknown_0864E7B0 + 0x3b8
    .4byte gUnknown_0864E7B0 + 0x46c
    .4byte gUnknown_0864E7B0 + 0x520
    .4byte gUnknown_0864E7B0 + 0x5fc
    .4byte gUnknown_0864E7B0 + 0x6d8
    .4byte gUnknown_0864E7B0 + 0x7ec
    .4byte gUnknown_0864E7B0 + 0x900
    .4byte gUnknown_0864E7B0 + 0xa14
    .4byte gUnknown_0864E7B0 + 0xb28
    .4byte gUnknown_0864E7B0 + 0xc3c
    .4byte gUnknown_0864E7B0 + 0xd48
    .4byte gUnknown_0864E7B0 + 0xe20
    .4byte gUnknown_0864E7B0 + 0xf30
    .4byte gUnknown_0864E7B0 + 0x1098
    .4byte gUnknown_0864E7B0 + 0x125c
    .4byte gUnknown_0864E7B0 + 0x1420
    .4byte gUnknown_0864E7B0 + 0x15dc
    .4byte gUnknown_0864E7B0 + 0x178c
    .4byte gUnknown_0864E7B0 + 0x193c
    .4byte gUnknown_0864E7B0 + 0x1aec
    .4byte gUnknown_0864E7B0 + 0x1c90
    .4byte gUnknown_0864E7B0 + 0x1e28
    .4byte gUnknown_0864E7B0 + 0x1fb8

	.global gUnknown_085D6540
gUnknown_085D6540:  @ 0x085D6540
    .4byte gUnknown_08646510 + 0x40
    .4byte gUnknown_08646510 + 0x388
    .4byte gUnknown_08646510 + 0x388
    .4byte gUnknown_08646510 + 0x388
    .4byte gUnknown_08646510 + 0x388
    .4byte gUnknown_08646510 + 0x388
    .4byte gUnknown_08646510 + 0x388
    .4byte gUnknown_08646510 + 0x388
    .4byte gUnknown_08646510 + 0x388
    .4byte gUnknown_08646510 + 0x388
    .4byte gUnknown_08646510 + 0x388
    .4byte gUnknown_08646510 + 0x388
    .4byte gUnknown_08646510 + 0x388
    .4byte gUnknown_08646510 + 0x388
    .4byte gUnknown_08646510 + 0xc5c
    .4byte gUnknown_08646510 + 0xc5c
    .4byte gUnknown_08646510 + 0xc5c
    .4byte gUnknown_08646510 + 0x1c98
    .4byte gUnknown_08646510 + 0x2904
    .4byte gUnknown_08646510 + 0x3520
    .4byte gUnknown_08646510 + 0x4078
    .4byte gUnknown_08646510 + 0x4bcc
    .4byte gUnknown_08646510 + 0x567c
    .4byte gUnknown_08646510 + 0x60a4
    .4byte gUnknown_08646510 + 0x69a0
    .4byte gUnknown_08646510 + 0x726c
    .4byte gUnknown_08646510 + 0x7aec

	.global gUnknown_085D65AC
gUnknown_085D65AC:  @ 0x085D65AC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd6b0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8060664
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806067C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80606D8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8060734
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806067C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80606D8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8060734
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D65F4
gUnknown_085D65F4:  @ 0x085D65F4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd6c0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80607D8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D660C
gUnknown_085D660C:  @ 0x085D660C
	.incbin "baserom.gba", 0x5D660C, 0x18

	.global gUnknown_085D6624
gUnknown_085D6624:  @ 0x085D6624
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd6d0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_806088C
        @ PROC_SLEEP
        .short 0xe, 0x2c
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6644
gUnknown_085D6644:  @ 0x085D6644
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd6e4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80608E0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D665C
gUnknown_085D665C:  @ 0x085D665C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd6f0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8060B2C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8060B48
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D667C
gUnknown_085D667C:  @ 0x085D667C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd6fc
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8060BC4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8060BD4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D66A4
gUnknown_085D66A4:  @ 0x085D66A4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd74c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8060C78
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D66BC
gUnknown_085D66BC:  @ 0x085D66BC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd75c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8060DC4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D66D4
gUnknown_085D66D4:  @ 0x085D66D4
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x214
    .4byte gUnknown_08652734 + 0x142c
    .4byte gUnknown_08652734 + 0x277c
    .4byte gUnknown_08652734 + 0x35f8

	.global gUnknown_085D67A0
gUnknown_085D67A0:  @ 0x085D67A0
    .4byte gUnknown_08656914 + 0x20
    .4byte gUnknown_08656914 + 0xdc
    .4byte gUnknown_08656914 + 0x198
    .4byte gUnknown_08656914 + 0x254
    .4byte gUnknown_08656914 + 0x310
    .4byte gUnknown_08656914 + 0x3cc
    .4byte gUnknown_08656914 + 0x488
    .4byte gUnknown_08656914 + 0x58c
    .4byte gUnknown_08656914 + 0x690
    .4byte gUnknown_08656914 + 0x794
    .4byte gUnknown_08656914 + 0x898
    .4byte gUnknown_08656914 + 0x99c
    .4byte gUnknown_08656914 + 0xaa0
    .4byte gUnknown_08656914 + 0xbe0
    .4byte gUnknown_08656914 + 0xd24
    .4byte gUnknown_08656914 + 0xe68
    .4byte gUnknown_08656914 + 0xfac
    .4byte gUnknown_08656914 + 0x10f0
    .4byte gUnknown_08656914 + 0x1234
    .4byte gUnknown_08656914 + 0x13b4
    .4byte gUnknown_08656914 + 0x1538
    .4byte gUnknown_08656914 + 0x16bc
    .4byte gUnknown_08656914 + 0x181c
    .4byte gUnknown_08656914 + 0x197c
    .4byte gUnknown_08656914 + 0x1adc
    .4byte gUnknown_08656914 + 0x1c80
    .4byte gUnknown_08656914 + 0x1e24
    .4byte gUnknown_08656914 + 0x1fc8
    .4byte gUnknown_08656914 + 0x2138
    .4byte gUnknown_08656914 + 0x22a8
    .4byte gUnknown_08656914 + 0x2418
    .4byte gUnknown_08656914 + 0x25bc
    .4byte gUnknown_08656914 + 0x2760
    .4byte gUnknown_08656914 + 0x2904
    .4byte gUnknown_08656914 + 0x2a78
    .4byte gUnknown_08656914 + 0x2bec
    .4byte gUnknown_08656914 + 0x2d60
    .4byte gUnknown_08656914 + 0x2f10
    .4byte gUnknown_08656914 + 0x30c0
    .4byte gUnknown_08656914 + 0x3270
    .4byte gUnknown_08656914 + 0x33e4
    .4byte gUnknown_08656914 + 0x3558
    .4byte gUnknown_08656914 + 0x36cc
    .4byte gUnknown_08656914 + 0x3880
    .4byte gUnknown_08656914 + 0x3a34
    .4byte gUnknown_08656914 + 0x3be8
    .4byte gUnknown_08656914 + 0x3d60
    .4byte gUnknown_08656914 + 0x3ed8
    .4byte gUnknown_08656914 + 0x4050
    .4byte gUnknown_08656914 + 0x42a8
    .4byte gUnknown_08656914 + 0x44b0

	.global gUnknown_085D686C
gUnknown_085D686C:  @ 0x085D686C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd86c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8060ED8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6884
gUnknown_085D6884:  @ 0x085D6884
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd87c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8060FA4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D689C
gUnknown_085D689C:  @ 0x085D689C
	.incbin "baserom.gba", 0x5D689C, 0x20

	.global gUnknown_085D68BC
gUnknown_085D68BC:  @ 0x085D68BC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd890
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806104C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D68D4
gUnknown_085D68D4:  @ 0x085D68D4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd898
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8061180
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D68EC
gUnknown_085D68EC:  @ 0x085D68EC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd8a4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80612E4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6904
gUnknown_085D6904:  @ 0x085D6904
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd8b0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8061448
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D691C
gUnknown_085D691C:  @ 0x085D691C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd8bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8061704
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6934
gUnknown_085D6934:  @ 0x085D6934
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd8e0
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8061854
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6954
gUnknown_085D6954:  @ 0x085D6954
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd9e8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80618D8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80618F4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6974
gUnknown_085D6974:  @ 0x085D6974
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd9f8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8061A30
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D698C
gUnknown_085D698C:  @ 0x085D698C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dda04
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8061A64
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8061A98
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D69AC
gUnknown_085D69AC:  @ 0x085D69AC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dda14
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8061B14
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8061BE4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D69CC
gUnknown_085D69CC:  @ 0x085D69CC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dda24
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8061C78
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D69E4
gUnknown_085D69E4:  @ 0x085D69E4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dda30
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8061D78
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D69FC
gUnknown_085D69FC:  @ 0x085D69FC
    .4byte gUnknown_08677D34 + 0x14c
    .4byte gUnknown_08677D34 + 0x258
    .4byte gUnknown_08677D34 + 0x358
    .4byte gUnknown_08677D34 + 0x464

	.global gUnknown_085D6A0C
gUnknown_085D6A0C:  @ 0x085D6A0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dda60
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8061E44
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6A2C
gUnknown_085D6A2C:  @ 0x085D6A2C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddb74
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8061F78
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6A44
gUnknown_085D6A44:  @ 0x085D6A44
    .4byte gUnknown_08677D34 + 0x570

	.global gUnknown_085D6A48
gUnknown_085D6A48:  @ 0x085D6A48
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddb88
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80620A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6A68
gUnknown_085D6A68:  @ 0x085D6A68
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddc78
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062128
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6A80
gUnknown_085D6A80:  @ 0x085D6A80
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddc80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80622F4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6A98
gUnknown_085D6A98:  @ 0x085D6A98
    .4byte gUnknown_0867B5A4 + 0x20
    .4byte gUnknown_0867B5A4 + 0xcc
    .4byte gUnknown_0867B5A4 + 0x180
    .4byte gUnknown_0867B5A4 + 0x240
    .4byte gUnknown_0867B5A4 + 0x308
    .4byte gUnknown_0867B5A4 + 0x3e4
    .4byte gUnknown_0867B5A4 + 0x4c4
    .4byte gUnknown_0867B5A4 + 0x5ac
    .4byte gUnknown_0867B5A4 + 0x69c
    .4byte gUnknown_0867B5A4 + 0x79c
    .4byte gUnknown_0867B5A4 + 0x8a8
    .4byte gUnknown_0867B5A4 + 0x9c8
    .4byte gUnknown_0867B5A4 + 0xaf8

	.global gUnknown_085D6ACC
gUnknown_085D6ACC:  @ 0x085D6ACC
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0x1610
    .4byte gUnknown_08678B20 + 0x1610
    .4byte gUnknown_08678B20 + 0x1610
    .4byte gUnknown_08678B20 + 0x1d08
    .4byte gUnknown_08678B20 + 0x1d08
    .4byte gUnknown_08678B20 + 0x2328
    .4byte gUnknown_08678B20 + 0x2328

	.global gUnknown_085D6B00
gUnknown_085D6B00:  @ 0x085D6B00
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddcc0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80623D0
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6B20
gUnknown_085D6B20:  @ 0x085D6B20
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddccc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806241C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6B38
gUnknown_085D6B38:  @ 0x085D6B38
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddcd8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80625B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6B50
gUnknown_085D6B50:  @ 0x085D6B50
    .4byte gUnknown_0867EEB4 + 0xac8
    .4byte gUnknown_0867EEB4 + 0xbc4
    .4byte gUnknown_0867EEB4 + 0xcac
    .4byte gUnknown_0867EEB4 + 0xd94
    .4byte gUnknown_0867EEB4 + 0xe7c
    .4byte gUnknown_0867EEB4 + 0xf78
    .4byte gUnknown_0867EEB4 + 0x1060
    .4byte gUnknown_0867EEB4 + 0x10f8
    .4byte gUnknown_0867EEB4 + 0x11e0
    .4byte gUnknown_0867EEB4 + 0x1278
    .4byte gUnknown_0867EEB4 + 0x1360
    .4byte gUnknown_0867EEB4 + 0x145c
    .4byte gUnknown_0867EEB4 + 0x14f4
    .4byte gUnknown_0867EEB4 + 0x15dc
    .4byte gUnknown_0867EEB4 + 0x1674
    .4byte gUnknown_0867EEB4 + 0x1770
    .4byte gUnknown_0867EEB4 + 0x1808
    .4byte gUnknown_0867EEB4 + 0x1918

	.global gUnknown_085D6B98
gUnknown_085D6B98:  @ 0x085D6B98
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddd30
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062660
        @ PROC_SLEEP
        .short 0xe, 0x28
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6BB8
gUnknown_085D6BB8:  @ 0x085D6BB8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddd40
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80626B4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6BD0
gUnknown_085D6BD0:  @ 0x085D6BD0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddd4c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062840
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6BE8
gUnknown_085D6BE8:  @ 0x085D6BE8
    .4byte gUnknown_086861A4 + 0x20
    .4byte gUnknown_086861A4 + 0xfc
    .4byte gUnknown_086861A4 + 0x1d8
    .4byte gUnknown_086861A4 + 0x2b4
    .4byte gUnknown_086861A4 + 0x390
    .4byte gUnknown_086861A4 + 0x46c
    .4byte gUnknown_086861A4 + 0x548
    .4byte gUnknown_086861A4 + 0x624
    .4byte gUnknown_086861A4 + 0x700
    .4byte gUnknown_086861A4 + 0x7dc
    .4byte gUnknown_086861A4 + 0x8b8
    .4byte gUnknown_086861A4 + 0x994
    .4byte gUnknown_086861A4 + 0xa70
    .4byte gUnknown_086861A4 + 0xb4c
    .4byte gUnknown_086861A4 + 0xc28
    .4byte gUnknown_086861A4 + 0xd04

	.global gUnknown_085D6C28
gUnknown_085D6C28:  @ 0x085D6C28
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dde5c
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062934
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6C48
gUnknown_085D6C48:  @ 0x085D6C48
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dde68
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062934
        @ PROC_SLEEP
        .short 0xe, 0xc8
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6C68
gUnknown_085D6C68:  @ 0x085D6C68
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dde78
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062988
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8062968
        @ PROC_SLEEP
        .short 0xe, 0x36
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8062968
        @ PROC_SLEEP
        .short 0xe, 0x41
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8062968
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6CB0
gUnknown_085D6CB0:  @ 0x085D6CB0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dde84
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80629D4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6CC8
gUnknown_085D6CC8:  @ 0x085D6CC8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dde90
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062B48
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6CE0
gUnknown_085D6CE0:  @ 0x085D6CE0
    .4byte gUnknown_086810B8 + 0x20
    .4byte gUnknown_086810B8 + 0xcc
    .4byte gUnknown_086810B8 + 0x17c
    .4byte gUnknown_086810B8 + 0x23c
    .4byte gUnknown_086810B8 + 0x304
    .4byte gUnknown_086810B8 + 0x3dc
    .4byte gUnknown_086810B8 + 0x4b8
    .4byte gUnknown_086810B8 + 0x5a0
    .4byte gUnknown_086810B8 + 0x690
    .4byte gUnknown_086810B8 + 0x790
    .4byte gUnknown_086810B8 + 0x89c
    .4byte gUnknown_086810B8 + 0x9bc
    .4byte gUnknown_086810B8 + 0xaec

	.global gUnknown_085D6D14
gUnknown_085D6D14:  @ 0x085D6D14
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0x1610
    .4byte gUnknown_08678B20 + 0x1610
    .4byte gUnknown_08678B20 + 0x1610
    .4byte gUnknown_08678B20 + 0x1d08
    .4byte gUnknown_08678B20 + 0x1d08
    .4byte gUnknown_08678B20 + 0x2328
    .4byte gUnknown_08678B20 + 0x2328

	.global gUnknown_085D6D48
gUnknown_085D6D48:  @ 0x085D6D48
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dded4
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062C04
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6D68
gUnknown_085D6D68:  @ 0x085D6D68
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddee4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062C50
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6D80
gUnknown_085D6D80:  @ 0x085D6D80
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddef0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062E44
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6D98
gUnknown_085D6D98:  @ 0x085D6D98
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddf00
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062F3C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062ED8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6DB8
gUnknown_085D6DB8:  @ 0x085D6DB8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddf10
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062FA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062FBC
        @ PROC_SLEEP
        .short 0xe, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80630E8
        @ PROC_SLEEP
        .short 0xe, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062FF8
        @ PROC_SLEEP
        .short 0xe, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063124
        @ PROC_SLEEP
        .short 0xe, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063034
        @ PROC_SLEEP
        .short 0xe, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063160
        @ PROC_SLEEP
        .short 0xe, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063070
        @ PROC_SLEEP
        .short 0xe, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806319C
        @ PROC_SLEEP
        .short 0xe, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80630AC
        @ PROC_SLEEP
        .short 0xe, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80631D8
        @ PROC_SLEEP
        .short 0xe, 0x11
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6E70
gUnknown_085D6E70:  @ 0x085D6E70
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddf20
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063250
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6E88
gUnknown_085D6E88:  @ 0x085D6E88
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddf2c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063378
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6EA0
gUnknown_085D6EA0:  @ 0x085D6EA0
    .4byte gUnknown_0868DF5C + 0x40
    .4byte gUnknown_0868DF5C + 0xf8
    .4byte gUnknown_0868DF5C + 0x1bc
    .4byte gUnknown_0868DF5C + 0x2ac
    .4byte gUnknown_0868DF5C + 0x3dc

	.global gUnknown_085D6EB4
gUnknown_085D6EB4:  @ 0x085D6EB4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de004
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8063468
        @ PROC_SLEEP
        .short 0xe, 0xdc
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6ED4
gUnknown_085D6ED4:  @ 0x085D6ED4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de014
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8063468
        @ PROC_SLEEP
        .short 0xe, 0x6e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6EF4
gUnknown_085D6EF4:  @ 0x085D6EF4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de024
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80634BC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6F0C
gUnknown_085D6F0C:  @ 0x085D6F0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de030
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80635E8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6F24
gUnknown_085D6F24:  @ 0x085D6F24
    .4byte gUnknown_087270B4

	.global gUnknown_085D6F28
gUnknown_085D6F28:  @ 0x085D6F28
    .4byte gUnknown_08727510

	.global gUnknown_085D6F2C
gUnknown_085D6F2C:  @ 0x085D6F2C
    .4byte gUnknown_08725DCC

	.global gUnknown_085D6F30
gUnknown_085D6F30:  @ 0x085D6F30
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de044
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80636D8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6F48
gUnknown_085D6F48:  @ 0x085D6F48
    .4byte gUnknown_08727C48 + 0x20
    .4byte gUnknown_08727C48 + 0xd0
    .4byte gUnknown_08727C48 + 0x1d8
    .4byte gUnknown_08727C48 + 0x314
    .4byte gUnknown_08727C48 + 0x488
    .4byte gUnknown_08727C48 + 0x620
    .4byte gUnknown_08727C48 + 0x794
    .4byte gUnknown_08727C48 + 0x8a0
    .4byte gUnknown_08727C48 + 0x974

	.global gUnknown_085D6F6C
gUnknown_085D6F6C:  @ 0x085D6F6C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de078
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80637B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6F8C
gUnknown_085D6F8C:  @ 0x085D6F8C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0a0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063840
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6FA4
gUnknown_085D6FA4:  @ 0x085D6FA4
	.incbin "baserom.gba", 0x5D6FA4, 0x10

	.global gUnknown_085D6FB4
gUnknown_085D6FB4:  @ 0x085D6FB4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0b0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063948
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6FCC
gUnknown_085D6FCC:  @ 0x085D6FCC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80639B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6FE4
gUnknown_085D6FE4:  @ 0x085D6FE4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0c4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063BC8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6FFC
gUnknown_085D6FFC:  @ 0x085D6FFC
    .4byte gUnknown_0872972C + 0x20

	.global gUnknown_085D7000
gUnknown_085D7000:  @ 0x085D7000
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0d4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063C40
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7018
gUnknown_085D7018:  @ 0x085D7018
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0e0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063D1C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7030
gUnknown_085D7030:  @ 0x085D7030
	.incbin "baserom.gba", 0x5D7030, 0xC0

	.global gUnknown_085D70F0
gUnknown_085D70F0:  @ 0x085D70F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0ec
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8063E58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063E74
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7110
gUnknown_085D7110:  @ 0x085D7110
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0f8
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8063EE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063EF8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7138
gUnknown_085D7138:  @ 0x085D7138
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de144
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063FC0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7150
gUnknown_085D7150:  @ 0x085D7150
    .4byte gUnknown_0872CE60 + 0x20
    .4byte gUnknown_0872CE60 + 0xd4
    .4byte gUnknown_0872CE60 + 0x190
    .4byte gUnknown_0872CE60 + 0x26c
    .4byte gUnknown_0872CE60 + 0x354
    .4byte gUnknown_0872CE60 + 0x478
    .4byte gUnknown_0872CE60 + 0x598
    .4byte gUnknown_0872CE60 + 0x6a4
    .4byte gUnknown_0872CE60 + 0x7b0
    .4byte gUnknown_0872CE60 + 0x8ac
    .4byte gUnknown_0872CE60 + 0x9ac
    .4byte gUnknown_0872CE60 + 0xaa8

	.global gUnknown_085D7180
gUnknown_085D7180:  @ 0x085D7180
    .4byte gUnknown_0872A1BC + 0x1a4
    .4byte gUnknown_0872A1BC + 0x1a4
    .4byte gUnknown_0872A1BC + 0x1a4
    .4byte gUnknown_0872A1BC + 0x1a4
    .4byte gUnknown_0872A1BC + 0x1a4
    .4byte gUnknown_0872A1BC + 0x1a4
    .4byte gUnknown_0872A1BC + 0x1400
    .4byte gUnknown_0872A1BC + 0x1400
    .4byte gUnknown_0872A1BC + 0x1400
    .4byte gUnknown_0872A1BC + 0x20d4
    .4byte gUnknown_0872A1BC + 0x20d4
    .4byte gUnknown_0872A1BC + 0x20d4

	.global gUnknown_085D71B0
gUnknown_085D71B0:  @ 0x085D71B0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de184
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064060
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80640D0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806416C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80641F0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D71E0
gUnknown_085D71E0:  @ 0x085D71E0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de190
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80642BC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D71F8
gUnknown_085D71F8:  @ 0x085D71F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de19c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064344
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7210
gUnknown_085D7210:  @ 0x085D7210
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de1ac
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_806454C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064568
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80645FC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806464C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7240
gUnknown_085D7240:  @ 0x085D7240
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de1bc
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80646B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80646C0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7268
gUnknown_085D7268:  @ 0x085D7268
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de204
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064720
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7280
gUnknown_085D7280:  @ 0x085D7280
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de214
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80647F0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7298
gUnknown_085D7298:  @ 0x085D7298
	.incbin "baserom.gba", 0x5D7298, 0x100

	.global gUnknown_085D7398
gUnknown_085D7398:  @ 0x085D7398
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de228
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_806491C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064938
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D73B8
gUnknown_085D73B8:  @ 0x085D73B8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de238
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806499C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D73D8
gUnknown_085D73D8:  @ 0x085D73D8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de260
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8064AC8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064AE4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D73F8
gUnknown_085D73F8:  @ 0x085D73F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de270
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064B48
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7418
gUnknown_085D7418:  @ 0x085D7418
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de298
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064BFC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7430
gUnknown_085D7430:  @ 0x085D7430
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de2a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064C80
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7448
gUnknown_085D7448:  @ 0x085D7448
    .4byte gUnknown_08723208 + 0x6c

	.global gUnknown_085D744C
gUnknown_085D744C:  @ 0x085D744C
    .4byte gUnknown_08724424 + 0x20

	.global gUnknown_085D7450
gUnknown_085D7450:  @ 0x085D7450
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de2c0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8064DA8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064DC4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7470
gUnknown_085D7470:  @ 0x085D7470
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de2d0
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064E2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7490
gUnknown_085D7490:  @ 0x085D7490
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de334
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064EB0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D74A8
gUnknown_085D74A8:  @ 0x085D74A8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de33c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80651C4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D74C0
gUnknown_085D74C0:  @ 0x085D74C0
    .4byte gUnknown_0873313C + 0x20
    .4byte gUnknown_0873313C + 0xc0
    .4byte gUnknown_0873313C + 0x168
    .4byte gUnknown_0873313C + 0x210
    .4byte gUnknown_0873313C + 0x2bc
    .4byte gUnknown_0873313C + 0x374
    .4byte gUnknown_0873313C + 0x42c
    .4byte gUnknown_0873313C + 0x4dc
    .4byte gUnknown_0873313C + 0x588
    .4byte gUnknown_0873313C + 0x630
    .4byte gUnknown_0873313C + 0x6d0
    .4byte gUnknown_0873313C + 0x76c
    .4byte gUnknown_0873313C + 0x804
    .4byte gUnknown_0873313C + 0x91c
    .4byte gUnknown_0873313C + 0xa58
    .4byte gUnknown_0873313C + 0xba8
    .4byte gUnknown_0873313C + 0xce4
    .4byte gUnknown_0873313C + 0xde8
    .4byte gUnknown_0873313C + 0xe8c
    .4byte gUnknown_0873313C + 0xf28
    .4byte gUnknown_0873313C + 0xfc4
    .4byte gUnknown_0873313C + 0x1060
    .4byte gUnknown_0873313C + 0x10fc
    .4byte gUnknown_0873313C + 0x1198
    .4byte gUnknown_0873313C + 0x1254
    .4byte gUnknown_0873313C + 0x1344
    .4byte gUnknown_0873313C + 0x1448
    .4byte gUnknown_0873313C + 0x154c

	.global gUnknown_085D7530
gUnknown_085D7530:  @ 0x085D7530
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de3c0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8065300
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806531C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7550
gUnknown_085D7550:  @ 0x085D7550
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de3cc
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8065384
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7570
gUnknown_085D7570:  @ 0x085D7570
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de3ec
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806542C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7588
gUnknown_085D7588:  @ 0x085D7588
    .4byte gUnknown_0874394C + 0x20
    .4byte gUnknown_0874394C + 0x298
    .4byte gUnknown_0874394C + 0x510
    .4byte gUnknown_0874394C + 0x788
    .4byte gUnknown_0874394C + 0xa00
    .4byte gUnknown_0874394C + 0xc70
    .4byte gUnknown_0874394C + 0xecc
    .4byte gUnknown_0874394C + 0x1144
    .4byte gUnknown_0874394C + 0x13bc
    .4byte gUnknown_0874394C + 0x1634
    .4byte gUnknown_0874394C + 0x18ac
    .4byte gUnknown_0874394C + 0x1b24

	.global gUnknown_085D75B8
gUnknown_085D75B8:  @ 0x085D75B8
    .4byte gUnknown_0873313C + 0x1650
    .4byte gUnknown_0873313C + 0x2a64
    .4byte gUnknown_0873313C + 0x3f90
    .4byte gUnknown_0873313C + 0x550c
    .4byte gUnknown_0873313C + 0x6a94
    .4byte gUnknown_0873313C + 0x7e84
    .4byte gUnknown_0873313C + 0x9190
    .4byte gUnknown_0873313C + 0xa504
    .4byte gUnknown_0873313C + 0xb9f0
    .4byte gUnknown_0873313C + 0xcd9c
    .4byte gUnknown_0873313C + 0xe14c
    .4byte gUnknown_0873313C + 0xf468

	.global gUnknown_085D75E8
gUnknown_085D75E8:  @ 0x085D75E8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de46c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80654F8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7600
gUnknown_085D7600:  @ 0x085D7600
    .4byte gUnknown_0874670C + 0x54
    .4byte gUnknown_0874670C + 0x864
    .4byte gUnknown_0874670C + 0x1570
    .4byte gUnknown_0874670C + 0x2790
    .4byte gUnknown_0874670C + 0x369c
    .4byte gUnknown_0874670C + 0x4784
    .4byte gUnknown_0874670C + 0x589c
    .4byte gUnknown_0874670C + 0x678c
    .4byte gUnknown_0874670C + 0x7a04
    .4byte gUnknown_0874670C + 0x8d68

	.global gUnknown_085D7628
gUnknown_085D7628:  @ 0x085D7628
    .4byte gUnknown_08750268 + 0x20
    .4byte gUnknown_08750268 + 0x17c
    .4byte gUnknown_08750268 + 0x35c
    .4byte gUnknown_08750268 + 0x5a8
    .4byte gUnknown_08750268 + 0x7d0
    .4byte gUnknown_08750268 + 0xa20
    .4byte gUnknown_08750268 + 0xc94
    .4byte gUnknown_08750268 + 0xec0
    .4byte gUnknown_08750268 + 0x1104
    .4byte gUnknown_08750268 + 0x135c

	.global gUnknown_085D7650
gUnknown_085D7650:  @ 0x085D7650
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de4a8
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8065624
        @ PROC_SLEEP
        .short 0xe, 0xd
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7670
gUnknown_085D7670:  @ 0x085D7670
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de4bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8065724
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7688
gUnknown_085D7688:  @ 0x085D7688
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de4cc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxIvaldi
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D76A0
gUnknown_085D76A0:  @ 0x085D76A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de4d8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxIvaldiBG1
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D76B8
gUnknown_085D76B8:  @ 0x085D76B8
    .4byte gUnknown_086945C4 + 0x20
    .4byte gUnknown_086945C4 + 0xdc
    .4byte gUnknown_086945C4 + 0x200
    .4byte gUnknown_086945C4 + 0x398
    .4byte gUnknown_086945C4 + 0x594
    .4byte gUnknown_086945C4 + 0x80c
    .4byte gUnknown_086945C4 + 0xa84
    .4byte gUnknown_086945C4 + 0xcfc
    .4byte gUnknown_086945C4 + 0xf6c
    .4byte gUnknown_086945C4 + 0x1180
    .4byte gUnknown_086945C4 + 0x132c
    .4byte gUnknown_086945C4 + 0x1470

	.global gUnknown_085D76E8
gUnknown_085D76E8:  @ 0x085D76E8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de518
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxIvaldiBG2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7700
gUnknown_085D7700:  @ 0x085D7700
    .4byte gUnknown_08696840 + 0x20
    .4byte gUnknown_08696840 + 0xb8
    .4byte gUnknown_08696840 + 0x24c
    .4byte gUnknown_08696840 + 0x3e8
    .4byte gUnknown_08696840 + 0x584

	.global gUnknown_085D7714
gUnknown_085D7714:  @ 0x085D7714
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de544
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxIvaldiBG3
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D772C
gUnknown_085D772C:  @ 0x085D772C
    .4byte gUnknown_08696840 + 0x8130
    .4byte gUnknown_08696840 + 0x8374
    .4byte gUnknown_08696840 + 0x85ec
    .4byte gUnknown_08696840 + 0x8850
    .4byte gUnknown_08696840 + 0x8ac4
    .4byte gUnknown_08696840 + 0x8d80
    .4byte gUnknown_08696840 + 0x9048
    .4byte gUnknown_08696840 + 0x930c
    .4byte gUnknown_08696840 + 0x95bc
    .4byte gUnknown_08696840 + 0x9870
    .4byte gUnknown_08696840 + 0x9b48

	.global gUnknown_085D7758
gUnknown_085D7758:  @ 0x085D7758
    .4byte gUnknown_08696840 + 0x724
    .4byte gUnknown_08696840 + 0xdd0
    .4byte gUnknown_08696840 + 0x14d8
    .4byte gUnknown_08696840 + 0x1d44
    .4byte gUnknown_08696840 + 0x2738
    .4byte gUnknown_08696840 + 0x32ac
    .4byte gUnknown_08696840 + 0x3ecc
    .4byte gUnknown_08696840 + 0x4c30
    .4byte gUnknown_08696840 + 0x58f0
    .4byte gUnknown_08696840 + 0x65dc
    .4byte gUnknown_08696840 + 0x7350

	.global gUnknown_085D7784
gUnknown_085D7784:  @ 0x085D7784
    .4byte gUnknown_08696840 + 0x7fd0
    .4byte gUnknown_08696840 + 0x7ff0
    .4byte gUnknown_08696840 + 0x8010
    .4byte gUnknown_08696840 + 0x8030
    .4byte gUnknown_08696840 + 0x8050
    .4byte gUnknown_08696840 + 0x8070
    .4byte gUnknown_08696840 + 0x8090
    .4byte gUnknown_08696840 + 0x80b0
    .4byte gUnknown_08696840 + 0x80d0
    .4byte gUnknown_08696840 + 0x80f0
    .4byte gUnknown_08696840 + 0x8110

	.global gUnknown_085D77B0
gUnknown_085D77B0:  @ 0x085D77B0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de580
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8065CA0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D77C8
gUnknown_085D77C8:  @ 0x085D77C8
    .4byte gUnknown_086A1CE0 + 0x20

	.global gUnknown_085D77CC
gUnknown_085D77CC:  @ 0x085D77CC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de594
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8065DF8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D77E4
gUnknown_085D77E4:  @ 0x085D77E4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de5a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxIvaldiOBJSideWash
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D77FC
gUnknown_085D77FC:  @ 0x085D77FC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de5c0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80660B4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7814
gUnknown_085D7814:  @ 0x085D7814
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de5d4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806635C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D782C
gUnknown_085D782C:  @ 0x085D782C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de614
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8066434
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7844
gUnknown_085D7844:  @ 0x085D7844
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de62c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80664A8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D785C
gUnknown_085D785C:  @ 0x085D785C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de63c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8066550
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7874
gUnknown_085D7874:  @ 0x085D7874
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de64c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8066758
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D788C
gUnknown_085D788C:  @ 0x085D788C
    .4byte gUnknown_087A61EC + 0xc244
    .4byte gUnknown_087A61EC + 0xc4b8
    .4byte gUnknown_087A61EC + 0xc730
    .4byte gUnknown_087A61EC + 0xc9a4
    .4byte gUnknown_087A61EC + 0xcc18
    .4byte gUnknown_087A61EC + 0xce90
    .4byte gUnknown_087A61EC + 0xd104
    .4byte gUnknown_087A61EC + 0xd37c
    .4byte gUnknown_087A61EC + 0xd5f0
    .4byte gUnknown_087A61EC + 0xd868
    .4byte gUnknown_087A61EC + 0xdadc
    .4byte gUnknown_087A61EC + 0xdd54
    .4byte gUnknown_087A61EC + 0xdfc8
    .4byte gUnknown_087A61EC + 0xe23c
    .4byte gUnknown_087A61EC + 0xe4b4
    .4byte gUnknown_087A61EC + 0xe728
    .4byte gUnknown_087A61EC + 0x1cd48
    .4byte gUnknown_087A61EC + 0x1cfb8
    .4byte gUnknown_087A61EC + 0x1d230
    .4byte gUnknown_087A61EC + 0x1d4a8
    .4byte gUnknown_087A61EC + 0x1d704
    .4byte gUnknown_087A61EC + 0x1d94c
    .4byte gUnknown_087A61EC + 0x1db88
    .4byte gUnknown_087A61EC + 0x1ddbc
    .4byte gUnknown_087A61EC + 0x1dff4
    .4byte gUnknown_087A61EC + 0x1e234
    .4byte gUnknown_087A61EC + 0x1e474
    .4byte gUnknown_087A61EC + 0x1e6c0
    .4byte gUnknown_087A61EC + 0x1e904
    .4byte gUnknown_087A61EC + 0x1eab4
    .4byte gUnknown_087A61EC + 0x1ec78
    .4byte gUnknown_087A61EC + 0x1ee48

	.global gUnknown_085D790C
gUnknown_085D790C:  @ 0x085D790C
    .4byte gUnknown_087A61EC + 0x1208
    .4byte gUnknown_087A61EC + 0x1d4c
    .4byte gUnknown_087A61EC + 0x2888
    .4byte gUnknown_087A61EC + 0x33ac
    .4byte gUnknown_087A61EC + 0x3e40
    .4byte gUnknown_087A61EC + 0x48bc
    .4byte gUnknown_087A61EC + 0x536c
    .4byte gUnknown_087A61EC + 0x5e04
    .4byte gUnknown_087A61EC + 0x68dc
    .4byte gUnknown_087A61EC + 0x7360
    .4byte gUnknown_087A61EC + 0x7e00
    .4byte gUnknown_087A61EC + 0x8888
    .4byte gUnknown_087A61EC + 0x932c
    .4byte gUnknown_087A61EC + 0x9e84
    .4byte gUnknown_087A61EC + 0xaa14
    .4byte gUnknown_087A61EC + 0xb53c
    .4byte gUnknown_087A61EC + 0xe99c
    .4byte gUnknown_087A61EC + 0xf48c
    .4byte gUnknown_087A61EC + 0xffac
    .4byte gUnknown_087A61EC + 0x10b68
    .4byte gUnknown_087A61EC + 0x11900
    .4byte gUnknown_087A61EC + 0x1277c
    .4byte gUnknown_087A61EC + 0x13710
    .4byte gUnknown_087A61EC + 0x14724
    .4byte gUnknown_087A61EC + 0x158b8
    .4byte gUnknown_087A61EC + 0x16aec
    .4byte gUnknown_087A61EC + 0x17d20
    .4byte gUnknown_087A61EC + 0x18e70
    .4byte gUnknown_087A61EC + 0x19d08
    .4byte gUnknown_087A61EC + 0x1a82c
    .4byte gUnknown_087A61EC + 0x1b3f8
    .4byte gUnknown_087A61EC + 0x1c11c

	.global gUnknown_085D798C
gUnknown_085D798C:  @ 0x085D798C
    .4byte gUnknown_087A61EC + 0xc044
    .4byte gUnknown_087A61EC + 0xc064
    .4byte gUnknown_087A61EC + 0xc084
    .4byte gUnknown_087A61EC + 0xc0a4
    .4byte gUnknown_087A61EC + 0xc0c4
    .4byte gUnknown_087A61EC + 0xc0e4
    .4byte gUnknown_087A61EC + 0xc104
    .4byte gUnknown_087A61EC + 0xc124
    .4byte gUnknown_087A61EC + 0xc144
    .4byte gUnknown_087A61EC + 0xc164
    .4byte gUnknown_087A61EC + 0xc184
    .4byte gUnknown_087A61EC + 0xc1a4
    .4byte gUnknown_087A61EC + 0xc1c4
    .4byte gUnknown_087A61EC + 0xc1e4
    .4byte gUnknown_087A61EC + 0xc204
    .4byte gUnknown_087A61EC + 0xc224
    .4byte gUnknown_087A61EC + 0x1cb48
    .4byte gUnknown_087A61EC + 0x1cb68
    .4byte gUnknown_087A61EC + 0x1cb88
    .4byte gUnknown_087A61EC + 0x1cba8
    .4byte gUnknown_087A61EC + 0x1cbc8
    .4byte gUnknown_087A61EC + 0x1cbe8
    .4byte gUnknown_087A61EC + 0x1cc08
    .4byte gUnknown_087A61EC + 0x1cc28
    .4byte gUnknown_087A61EC + 0x1cc48
    .4byte gUnknown_087A61EC + 0x1cc68
    .4byte gUnknown_087A61EC + 0x1cc88
    .4byte gUnknown_087A61EC + 0x1cca8
    .4byte gUnknown_087A61EC + 0x1ccc8
    .4byte gUnknown_087A61EC + 0x1cce8
    .4byte gUnknown_087A61EC + 0x1cd08
    .4byte gUnknown_087A61EC + 0x1cd28

	.global gUnknown_085D7A0C
gUnknown_085D7A0C:  @ 0x085D7A0C
    .4byte gUnknown_087A61EC + 0x319fc
    .4byte gUnknown_087A61EC + 0x31c70
    .4byte gUnknown_087A61EC + 0x31ee8
    .4byte gUnknown_087A61EC + 0x3215c
    .4byte gUnknown_087A61EC + 0x323d0
    .4byte gUnknown_087A61EC + 0x32648
    .4byte gUnknown_087A61EC + 0x328bc
    .4byte gUnknown_087A61EC + 0x32b34
    .4byte gUnknown_087A61EC + 0x32da8
    .4byte gUnknown_087A61EC + 0x33020
    .4byte gUnknown_087A61EC + 0x33294
    .4byte gUnknown_087A61EC + 0x3350c
    .4byte gUnknown_087A61EC + 0x33780
    .4byte gUnknown_087A61EC + 0x339f4
    .4byte gUnknown_087A61EC + 0x33c6c
    .4byte gUnknown_087A61EC + 0x33ee0
    .4byte gUnknown_087A61EC + 0x422e0
    .4byte gUnknown_087A61EC + 0x42550
    .4byte gUnknown_087A61EC + 0x427c8
    .4byte gUnknown_087A61EC + 0x42a40
    .4byte gUnknown_087A61EC + 0x42c9c
    .4byte gUnknown_087A61EC + 0x42ee4
    .4byte gUnknown_087A61EC + 0x43128
    .4byte gUnknown_087A61EC + 0x43368
    .4byte gUnknown_087A61EC + 0x435ac
    .4byte gUnknown_087A61EC + 0x437f4
    .4byte gUnknown_087A61EC + 0x43a3c
    .4byte gUnknown_087A61EC + 0x43c8c
    .4byte gUnknown_087A61EC + 0x43ed4
    .4byte gUnknown_087A61EC + 0x4407c
    .4byte gUnknown_087A61EC + 0x44230
    .4byte gUnknown_087A61EC + 0x443e4

	.global gUnknown_085D7A8C
gUnknown_085D7A8C:  @ 0x085D7A8C
    .4byte gUnknown_087A61EC + 0x26a0c
    .4byte gUnknown_087A61EC + 0x2754c
    .4byte gUnknown_087A61EC + 0x28088
    .4byte gUnknown_087A61EC + 0x28bac
    .4byte gUnknown_087A61EC + 0x29638
    .4byte gUnknown_087A61EC + 0x2a0ac
    .4byte gUnknown_087A61EC + 0x2ab50
    .4byte gUnknown_087A61EC + 0x2b5d4
    .4byte gUnknown_087A61EC + 0x2c0a8
    .4byte gUnknown_087A61EC + 0x2cb2c
    .4byte gUnknown_087A61EC + 0x2d5cc
    .4byte gUnknown_087A61EC + 0x2e04c
    .4byte gUnknown_087A61EC + 0x2eaf8
    .4byte gUnknown_087A61EC + 0x2f648
    .4byte gUnknown_087A61EC + 0x301d0
    .4byte gUnknown_087A61EC + 0x30cf8
    .4byte gUnknown_087A61EC + 0x34154
    .4byte gUnknown_087A61EC + 0x34c54
    .4byte gUnknown_087A61EC + 0x35774
    .4byte gUnknown_087A61EC + 0x3632c
    .4byte gUnknown_087A61EC + 0x3709c
    .4byte gUnknown_087A61EC + 0x37edc
    .4byte gUnknown_087A61EC + 0x38e44
    .4byte gUnknown_087A61EC + 0x39e40
    .4byte gUnknown_087A61EC + 0x3afa4
    .4byte gUnknown_087A61EC + 0x3c1a0
    .4byte gUnknown_087A61EC + 0x3d3a0
    .4byte gUnknown_087A61EC + 0x3e480
    .4byte gUnknown_087A61EC + 0x3f2c8
    .4byte gUnknown_087A61EC + 0x3fde8
    .4byte gUnknown_087A61EC + 0x409a4
    .4byte gUnknown_087A61EC + 0x416b4

	.global gUnknown_085D7B0C
gUnknown_085D7B0C:  @ 0x085D7B0C
    .4byte gUnknown_087A61EC + 0x317fc
    .4byte gUnknown_087A61EC + 0x3181c
    .4byte gUnknown_087A61EC + 0x3183c
    .4byte gUnknown_087A61EC + 0x3185c
    .4byte gUnknown_087A61EC + 0x3187c
    .4byte gUnknown_087A61EC + 0x3189c
    .4byte gUnknown_087A61EC + 0x318bc
    .4byte gUnknown_087A61EC + 0x318dc
    .4byte gUnknown_087A61EC + 0x318fc
    .4byte gUnknown_087A61EC + 0x3191c
    .4byte gUnknown_087A61EC + 0x3193c
    .4byte gUnknown_087A61EC + 0x3195c
    .4byte gUnknown_087A61EC + 0x3197c
    .4byte gUnknown_087A61EC + 0x3199c
    .4byte gUnknown_087A61EC + 0x319bc
    .4byte gUnknown_087A61EC + 0x319dc
    .4byte gUnknown_087A61EC + 0x420e0
    .4byte gUnknown_087A61EC + 0x42100
    .4byte gUnknown_087A61EC + 0x42120
    .4byte gUnknown_087A61EC + 0x42140
    .4byte gUnknown_087A61EC + 0x42160
    .4byte gUnknown_087A61EC + 0x42180
    .4byte gUnknown_087A61EC + 0x421a0
    .4byte gUnknown_087A61EC + 0x421c0
    .4byte gUnknown_087A61EC + 0x421e0
    .4byte gUnknown_087A61EC + 0x42200
    .4byte gUnknown_087A61EC + 0x42220
    .4byte gUnknown_087A61EC + 0x42240
    .4byte gUnknown_087A61EC + 0x42260
    .4byte gUnknown_087A61EC + 0x42280
    .4byte gUnknown_087A61EC + 0x422a0
    .4byte gUnknown_087A61EC + 0x422c0

	.global gUnknown_085D7B8C
gUnknown_085D7B8C:  @ 0x085D7B8C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de6e0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806683C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7BA4
gUnknown_085D7BA4:  @ 0x085D7BA4
    .4byte gUnknown_087F3C54 + 0x20
    .4byte gUnknown_087F3C54 + 0x10c
    .4byte gUnknown_087F3C54 + 0x234

	.global gUnknown_085D7BB0
gUnknown_085D7BB0:  @ 0x085D7BB0
    .4byte gUnknown_087A61EC + 0x4baa8
    .4byte gUnknown_087A61EC + 0x4c278
    .4byte gUnknown_087A61EC + 0x4cc54

	.global gUnknown_085D7BBC
gUnknown_085D7BBC:  @ 0x085D7BBC
    .4byte gUnknown_087A61EC + 0x4da28
    .4byte gUnknown_087A61EC + 0x4da48
    .4byte gUnknown_087F3C54

	.global gUnknown_085D7BC8
gUnknown_085D7BC8:  @ 0x085D7BC8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de700
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806699C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7BE0
gUnknown_085D7BE0:  @ 0x085D7BE0
    .4byte gUnknown_087A61EC + 0x26410
    .4byte gUnknown_087A61EC + 0x26548
    .4byte gUnknown_087A61EC + 0x2668c
    .4byte gUnknown_087A61EC + 0x267cc
    .4byte gUnknown_087A61EC + 0x268ec

	.global gUnknown_085D7BF4
gUnknown_085D7BF4:  @ 0x085D7BF4
    .4byte gUnknown_087A61EC + 0x23d2c
    .4byte gUnknown_087A61EC + 0x244a0
    .4byte gUnknown_087A61EC + 0x24c74
    .4byte gUnknown_087A61EC + 0x25444
    .4byte gUnknown_087A61EC + 0x25c08

	.global gUnknown_085D7C08
gUnknown_085D7C08:  @ 0x085D7C08
    .4byte gUnknown_087A61EC + 0x26370
    .4byte gUnknown_087A61EC + 0x26390
    .4byte gUnknown_087A61EC + 0x263b0
    .4byte gUnknown_087A61EC + 0x263d0
    .4byte gUnknown_087A61EC + 0x263f0

	.global gUnknown_085D7C1C
gUnknown_085D7C1C:  @ 0x085D7C1C
    .4byte gUnknown_087A61EC + 0x4b4b4
    .4byte gUnknown_087A61EC + 0x4b5ec
    .4byte gUnknown_087A61EC + 0x4b730
    .4byte gUnknown_087A61EC + 0x4b868
    .4byte gUnknown_087A61EC + 0x4b988

	.global gUnknown_085D7C30
gUnknown_085D7C30:  @ 0x085D7C30
    .4byte gUnknown_087A61EC + 0x48dd0
    .4byte gUnknown_087A61EC + 0x49544
    .4byte gUnknown_087A61EC + 0x49d18
    .4byte gUnknown_087A61EC + 0x4a4e8
    .4byte gUnknown_087A61EC + 0x4acac

	.global gUnknown_085D7C44
gUnknown_085D7C44:  @ 0x085D7C44
    .4byte gUnknown_087A61EC + 0x4b414
    .4byte gUnknown_087A61EC + 0x4b434
    .4byte gUnknown_087A61EC + 0x4b454
    .4byte gUnknown_087A61EC + 0x4b474
    .4byte gUnknown_087A61EC + 0x4b494

	.global gUnknown_085D7C58
gUnknown_085D7C58:  @ 0x085D7C58
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de738
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8066A94
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7C70
gUnknown_085D7C70:  @ 0x085D7C70
    .4byte gUnknown_087A61EC + 0x231a4
    .4byte gUnknown_087A61EC + 0x23278
    .4byte gUnknown_087A61EC + 0x23414
    .4byte gUnknown_087A61EC + 0x2362c
    .4byte gUnknown_087A61EC + 0x23840
    .4byte gUnknown_087A61EC + 0x23a00
    .4byte gUnknown_087A61EC + 0x23b08
    .4byte gUnknown_087A61EC + 0x23c18

	.global gUnknown_085D7C90
gUnknown_085D7C90:  @ 0x085D7C90
    .4byte gUnknown_087A61EC + 0x1efa4
    .4byte gUnknown_087A61EC + 0x1f4f8
    .4byte gUnknown_087A61EC + 0x1ffb0
    .4byte gUnknown_087A61EC + 0x20b08
    .4byte gUnknown_087A61EC + 0x2148c
    .4byte gUnknown_087A61EC + 0x21f20
    .4byte gUnknown_087A61EC + 0x224d0
    .4byte gUnknown_087A61EC + 0x22a94

	.global gUnknown_085D7CB0
gUnknown_085D7CB0:  @ 0x085D7CB0
    .4byte gUnknown_087A61EC + 0x230a4
    .4byte gUnknown_087A61EC + 0x230c4
    .4byte gUnknown_087A61EC + 0x230e4
    .4byte gUnknown_087A61EC + 0x23104
    .4byte gUnknown_087A61EC + 0x23124
    .4byte gUnknown_087A61EC + 0x23144
    .4byte gUnknown_087A61EC + 0x23164
    .4byte gUnknown_087A61EC + 0x23184

	.global gUnknown_085D7CD0
gUnknown_085D7CD0:  @ 0x085D7CD0
    .4byte gUnknown_087A61EC + 0x482b4
    .4byte gUnknown_087A61EC + 0x4838c
    .4byte gUnknown_087A61EC + 0x48524
    .4byte gUnknown_087A61EC + 0x4870c
    .4byte gUnknown_087A61EC + 0x48908
    .4byte gUnknown_087A61EC + 0x48abc
    .4byte gUnknown_087A61EC + 0x48bc0
    .4byte gUnknown_087A61EC + 0x48cc4

	.global gUnknown_085D7CF0
gUnknown_085D7CF0:  @ 0x085D7CF0
    .4byte gUnknown_087A61EC + 0x44540
    .4byte gUnknown_087A61EC + 0x44a94
    .4byte gUnknown_087A61EC + 0x45518
    .4byte gUnknown_087A61EC + 0x45e68
    .4byte gUnknown_087A61EC + 0x46758
    .4byte gUnknown_087A61EC + 0x470c4
    .4byte gUnknown_087A61EC + 0x4763c
    .4byte gUnknown_087A61EC + 0x47bd4

	.global gUnknown_085D7D10
gUnknown_085D7D10:  @ 0x085D7D10
    .4byte gUnknown_087A61EC + 0x481b4
    .4byte gUnknown_087A61EC + 0x481d4
    .4byte gUnknown_087A61EC + 0x481f4
    .4byte gUnknown_087A61EC + 0x48214
    .4byte gUnknown_087A61EC + 0x48234
    .4byte gUnknown_087A61EC + 0x48254
    .4byte gUnknown_087A61EC + 0x48274
    .4byte gUnknown_087A61EC + 0x48294

	.global gUnknown_085D7D30
gUnknown_085D7D30:  @ 0x085D7D30
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de76c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8066B40
        @ PROC_SLEEP
        .short 0xe, 0x20
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8066BBC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7D58
gUnknown_085D7D58:  @ 0x085D7D58
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de780
        @ PROC_SLEEP
        .short 0xe, 0x4
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8066C1C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7D78
gUnknown_085D7D78:  @ 0x085D7D78
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de888
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8066D7C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7D90
gUnknown_085D7D90:  @ 0x085D7D90
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de8a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8066E74
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7DA8
gUnknown_085D7DA8:  @ 0x085D7DA8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de8c8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8066F90
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7DC0
gUnknown_085D7DC0:  @ 0x085D7DC0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de8e4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80670A8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7DD8
gUnknown_085D7DD8:  @ 0x085D7DD8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de908
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80671C0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7DF0
gUnknown_085D7DF0:  @ 0x085D7DF0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de92c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8067244
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7E08
gUnknown_085D7E08:  @ 0x085D7E08
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de944
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80674A0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7E20
gUnknown_085D7E20:  @ 0x085D7E20
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de95c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8067510
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7E38
gUnknown_085D7E38:  @ 0x085D7E38
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de968
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8067660
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7E50
gUnknown_085D7E50:  @ 0x085D7E50
    .4byte gUnknown_086BDA5C + 0x120
    .4byte gUnknown_086BDA5C + 0x670
    .4byte gUnknown_086BDA5C + 0xc0c
    .4byte gUnknown_086BDA5C + 0x1200
    .4byte gUnknown_086BDA5C + 0x1898
    .4byte gUnknown_086BDA5C + 0x1f54
    .4byte gUnknown_086BDA5C + 0x26b4
    .4byte gUnknown_086BDA5C + 0x2ec8
    .4byte gUnknown_086BDA5C + 0x3740
    .4byte gUnknown_086BDA5C + 0x4074
    .4byte gUnknown_086BDA5C + 0x49dc
    .4byte gUnknown_086BDA5C + 0x534c
    .4byte gUnknown_086BDA5C + 0x5d00
    .4byte gUnknown_086BDA5C + 0x6698
    .4byte gUnknown_086BDA5C + 0x7058
    .4byte gUnknown_086BDA5C + 0x7970
    .4byte gUnknown_086BDA5C + 0x82c4
    .4byte gUnknown_086BDA5C + 0x8c40
    .4byte gUnknown_086BDA5C + 0x95b4

	.global gUnknown_085D7E9C
gUnknown_085D7E9C:  @ 0x085D7E9C
    .4byte gUnknown_086C794C + 0x20
    .4byte gUnknown_086C794C + 0xe0
    .4byte gUnknown_086C794C + 0x1ac
    .4byte gUnknown_086C794C + 0x284
    .4byte gUnknown_086C794C + 0x370
    .4byte gUnknown_086C794C + 0x474
    .4byte gUnknown_086C794C + 0x588
    .4byte gUnknown_086C794C + 0x6b0
    .4byte gUnknown_086C794C + 0x7ec
    .4byte gUnknown_086C794C + 0x940
    .4byte gUnknown_086C794C + 0xab8
    .4byte gUnknown_086C794C + 0xc24
    .4byte gUnknown_086C794C + 0xd98
    .4byte gUnknown_086C794C + 0xf14
    .4byte gUnknown_086C794C + 0x10a0
    .4byte gUnknown_086C794C + 0x11e4
    .4byte gUnknown_086C794C + 0x1338
    .4byte gUnknown_086C794C + 0x149c
    .4byte gUnknown_086C794C + 0x1600

	.global gUnknown_085D7EE8
gUnknown_085D7EE8:  @ 0x085D7EE8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de9c4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8067764
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7F00
gUnknown_085D7F00:  @ 0x085D7F00
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de9d0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80677D4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7F18
gUnknown_085D7F18:  @ 0x085D7F18
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de9dc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8067914
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7F30
gUnknown_085D7F30:  @ 0x085D7F30
    .4byte gUnknown_086C978C + 0x28
    .4byte gUnknown_086C978C + 0x620
    .4byte gUnknown_086C978C + 0xc38
    .4byte gUnknown_086C978C + 0x1308
    .4byte gUnknown_086C978C + 0x1a38
    .4byte gUnknown_086C978C + 0x2164
    .4byte gUnknown_086C978C + 0x2958
    .4byte gUnknown_086C978C + 0x3114
    .4byte gUnknown_086C978C + 0x390c
    .4byte gUnknown_086C978C + 0x41fc
    .4byte gUnknown_086C978C + 0x49d0
    .4byte gUnknown_086C978C + 0x5270
    .4byte gUnknown_086C978C + 0x5ab8
    .4byte gUnknown_086C978C + 0x624c
    .4byte gUnknown_086C978C + 0x6adc
    .4byte gUnknown_086C978C + 0x7398
    .4byte gUnknown_086C978C + 0x7bc0
    .4byte gUnknown_086C978C + 0x83e0
    .4byte gUnknown_086C978C + 0x8c74
    .4byte gUnknown_086C978C + 0x9458

	.global gUnknown_085D7F80
gUnknown_085D7F80:  @ 0x085D7F80
    .4byte gUnknown_086C978C + 0x9f48
    .4byte gUnknown_086C978C + 0xa028
    .4byte gUnknown_086C978C + 0xa104
    .4byte gUnknown_086C978C + 0xa1ec
    .4byte gUnknown_086C978C + 0xa2f0
    .4byte gUnknown_086C978C + 0xa3ec
    .4byte gUnknown_086C978C + 0xa4f8
    .4byte gUnknown_086C978C + 0xa600
    .4byte gUnknown_086C978C + 0xa708
    .4byte gUnknown_086C978C + 0xa830
    .4byte gUnknown_086C978C + 0xa940
    .4byte gUnknown_086C978C + 0xaa68
    .4byte gUnknown_086C978C + 0xab8c
    .4byte gUnknown_086C978C + 0xac9c
    .4byte gUnknown_086C978C + 0xadc0
    .4byte gUnknown_086C978C + 0xaee0
    .4byte gUnknown_086C978C + 0xaffc
    .4byte gUnknown_086C978C + 0xb110
    .4byte gUnknown_086C978C + 0xb244
    .4byte gUnknown_086C978C + 0xb350

	.global gUnknown_085D7FD0
gUnknown_085D7FD0:  @ 0x085D7FD0
    .4byte gUnknown_086C978C + 0x9cc8
    .4byte gUnknown_086C978C + 0x9ce8
    .4byte gUnknown_086C978C + 0x9d08
    .4byte gUnknown_086C978C + 0x9d28
    .4byte gUnknown_086C978C + 0x9d48
    .4byte gUnknown_086C978C + 0x9d68
    .4byte gUnknown_086C978C + 0x9d88
    .4byte gUnknown_086C978C + 0x9da8
    .4byte gUnknown_086C978C + 0x9dc8
    .4byte gUnknown_086C978C + 0x9de8
    .4byte gUnknown_086C978C + 0x9e08
    .4byte gUnknown_086C978C + 0x9e28
    .4byte gUnknown_086C978C + 0x9e48
    .4byte gUnknown_086C978C + 0x9e68
    .4byte gUnknown_086C978C + 0x9e88
    .4byte gUnknown_086C978C + 0x9ea8
    .4byte gUnknown_086C978C + 0x9ec8
    .4byte gUnknown_086C978C + 0x9ee8
    .4byte gUnknown_086C978C + 0x9f08
    .4byte gUnknown_086C978C + 0x9f28

	.global gUnknown_085D8020
gUnknown_085D8020:  @ 0x085D8020
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dea3c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8067A30
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8038
gUnknown_085D8038:  @ 0x085D8038
    .4byte gUnknown_086C978C + 0xb47c
    .4byte gUnknown_086C978C + 0xbc8c
    .4byte gUnknown_086C978C + 0xc6b8
    .4byte gUnknown_086C978C + 0xd120
    .4byte gUnknown_086C978C + 0xdc18
    .4byte gUnknown_086C978C + 0xe794

	.global gUnknown_085D8050
gUnknown_085D8050:  @ 0x085D8050
    .4byte gUnknown_086D8A94 + 0xc0
    .4byte gUnknown_086D8A94 + 0x1d0
    .4byte gUnknown_086D8A94 + 0x358
    .4byte gUnknown_086D8A94 + 0x510
    .4byte gUnknown_086D8A94 + 0x6dc
    .4byte gUnknown_086D8A94 + 0x8c0

	.global gUnknown_085D8068
gUnknown_085D8068:  @ 0x085D8068
    .4byte gUnknown_086D8A94 + 0xc0
    .4byte gUnknown_086D8A94 + 0x1d0
    .4byte gUnknown_086D8A94 + 0xaa8
    .4byte gUnknown_086D8A94 + 0xc5c
    .4byte gUnknown_086D8A94 + 0xe14
    .4byte gUnknown_086D8A94 + 0xfe0

	.global gUnknown_085D8080
gUnknown_085D8080:  @ 0x085D8080
    .4byte gUnknown_086D8A94
    .4byte gUnknown_086D8A94 + 0x20
    .4byte gUnknown_086D8A94 + 0x40
    .4byte gUnknown_086D8A94 + 0x60
    .4byte gUnknown_086D8A94 + 0x80
    .4byte gUnknown_086D8A94 + 0xa0

	.global gUnknown_085D8098
gUnknown_085D8098:  @ 0x085D8098
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dea64
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8067B48
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D80B0
gUnknown_085D80B0:  @ 0x085D80B0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dea7c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxNaglfar
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D80C8
gUnknown_085D80C8:  @ 0x085D80C8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dea88
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxNaglfarBG
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D80E0
gUnknown_085D80E0:  @ 0x085D80E0
    .4byte gUnknown_086FFD3C + 0x6c8

	.global gUnknown_085D80E4
gUnknown_085D80E4:  @ 0x085D80E4
    .4byte gUnknown_087013A0 + 0x20

	.global gUnknown_085D80E8
gUnknown_085D80E8:  @ 0x085D80E8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dea9c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxNaglfarBG2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8100
gUnknown_085D8100:  @ 0x085D8100
    .4byte gUnknown_087013A0 + 0x2c0
    .4byte gUnknown_087013A0 + 0xd2c
    .4byte gUnknown_087013A0 + 0x19f8
    .4byte gUnknown_087013A0 + 0x282c
    .4byte gUnknown_087013A0 + 0x3af0
    .4byte gUnknown_087013A0 + 0x4fe8
    .4byte gUnknown_087013A0 + 0x664c
    .4byte gUnknown_087013A0 + 0x7a00
    .4byte gUnknown_087013A0 + 0x8c08
    .4byte gUnknown_087013A0 + 0x9cc0
    .4byte gUnknown_087013A0 + 0xac74
    .4byte gUnknown_087013A0 + 0xba50
    .4byte gUnknown_087013A0 + 0xc82c
    .4byte gUnknown_087013A0 + 0xd4f4
    .4byte gUnknown_087013A0 + 0xe184
    .4byte gUnknown_087013A0 + 0xee78

	.global gUnknown_085D8140
gUnknown_085D8140:  @ 0x085D8140
    .4byte gUnknown_087013A0 + 0xfc18
    .4byte gUnknown_087013A0 + 0xfe40
    .4byte gUnknown_087013A0 + 0x10098
    .4byte gUnknown_087013A0 + 0x10304
    .4byte gUnknown_087013A0 + 0x1055c
    .4byte gUnknown_087013A0 + 0x107cc
    .4byte gUnknown_087013A0 + 0x10a38
    .4byte gUnknown_087013A0 + 0x10c9c
    .4byte gUnknown_087013A0 + 0x10f04
    .4byte gUnknown_087013A0 + 0x1116c
    .4byte gUnknown_087013A0 + 0x113cc
    .4byte gUnknown_087013A0 + 0x11620
    .4byte gUnknown_087013A0 + 0x11874
    .4byte gUnknown_087013A0 + 0x11acc
    .4byte gUnknown_087013A0 + 0x11d14
    .4byte gUnknown_087013A0 + 0x11f70

	.global gUnknown_085D8180
gUnknown_085D8180:  @ 0x085D8180
    .4byte gUnknown_087013A0 + 0xfa18
    .4byte gUnknown_087013A0 + 0xfa38
    .4byte gUnknown_087013A0 + 0xfa58
    .4byte gUnknown_087013A0 + 0xfa78
    .4byte gUnknown_087013A0 + 0xfa98
    .4byte gUnknown_087013A0 + 0xfab8
    .4byte gUnknown_087013A0 + 0xfad8
    .4byte gUnknown_087013A0 + 0xfaf8
    .4byte gUnknown_087013A0 + 0xfb18
    .4byte gUnknown_087013A0 + 0xfb38
    .4byte gUnknown_087013A0 + 0xfb58
    .4byte gUnknown_087013A0 + 0xfb78
    .4byte gUnknown_087013A0 + 0xfb98
    .4byte gUnknown_087013A0 + 0xfbb8
    .4byte gUnknown_087013A0 + 0xfbd8
    .4byte gUnknown_087013A0 + 0xfbf8

	.global gUnknown_085D81C0
gUnknown_085D81C0:  @ 0x085D81C0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80deaec
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8067FB8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D81D8
gUnknown_085D81D8:  @ 0x085D81D8
    .4byte gUnknown_087013A0 + 0x121b8
    .4byte gUnknown_087013A0 + 0x13ac4
    .4byte gUnknown_087013A0 + 0x15370
    .4byte gUnknown_087013A0 + 0x16ad8

	.global gUnknown_085D81E8
gUnknown_085D81E8:  @ 0x085D81E8
    .4byte gUnknown_087197E4 + 0x20
    .4byte gUnknown_087197E4 + 0x4c0
    .4byte gUnknown_087197E4 + 0x950
    .4byte gUnknown_087197E4 + 0xdec

	.global gUnknown_085D81F8
gUnknown_085D81F8:  @ 0x085D81F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80deb5c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806807C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8210
gUnknown_085D8210:  @ 0x085D8210
    .4byte gUnknown_087197E4 + 0x1294
    .4byte gUnknown_087197E4 + 0x2780
    .4byte gUnknown_087197E4 + 0x3b2c
    .4byte gUnknown_087197E4 + 0x4edc
    .4byte gUnknown_087197E4 + 0x61f8

	.global gUnknown_085D8224
gUnknown_085D8224:  @ 0x085D8224
    .4byte gUnknown_08720D84 + 0x20
    .4byte gUnknown_08720D84 + 0x298
    .4byte gUnknown_08720D84 + 0x510
    .4byte gUnknown_08720D84 + 0x788
    .4byte gUnknown_08720D84 + 0xa00

	.global gUnknown_085D8238
gUnknown_085D8238:  @ 0x085D8238
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80debb8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8068208
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8250
gUnknown_085D8250:  @ 0x085D8250
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dec20
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80682E0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8268
gUnknown_085D8268:  @ 0x085D8268
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dec40
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8068348
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8280
gUnknown_085D8280:  @ 0x085D8280
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dec58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8068638
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8068680
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8068738
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80687D0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D82B0
gUnknown_085D82B0:  @ 0x085D82B0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dec68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806881C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D82C8
gUnknown_085D82C8:  @ 0x085D82C8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dec7c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8068970
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D82E0
gUnknown_085D82E0:  @ 0x085D82E0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dec90
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8068A28
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D82F8
gUnknown_085D82F8:  @ 0x085D82F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80deca4
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8068A9C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8318
gUnknown_085D8318:  @ 0x085D8318
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ded94
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8068BB8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8330
gUnknown_085D8330:  @ 0x085D8330
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80deda4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8068D20
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8348
gUnknown_085D8348:  @ 0x085D8348
    .4byte gUnknown_086A66D8 + 0x20
    .4byte gUnknown_086A66D8 + 0x1c8
    .4byte gUnknown_086A66D8 + 0x33c
    .4byte gUnknown_086A66D8 + 0x4b0
    .4byte gUnknown_086A66D8 + 0x5f8
    .4byte gUnknown_086A66D8 + 0x704
    .4byte gUnknown_086A66D8 + 0x7e4
    .4byte gUnknown_086A66D8 + 0x8bc
    .4byte gUnknown_086A66D8 + 0x980
    .4byte gUnknown_086A66D8 + 0xa3c
    .4byte gUnknown_086A66D8 + 0xae0

	.global gUnknown_085D8374
gUnknown_085D8374:  @ 0x085D8374
    .4byte gUnknown_086A2EAC + 0x14
    .4byte gUnknown_086A2EAC + 0x624
    .4byte gUnknown_086A2EAC + 0xcf4
    .4byte gUnknown_086A2EAC + 0x13c4
    .4byte gUnknown_086A2EAC + 0x1a2c
    .4byte gUnknown_086A2EAC + 0x1ff0
    .4byte gUnknown_086A2EAC + 0x24e0
    .4byte gUnknown_086A2EAC + 0x28c0
    .4byte gUnknown_086A2EAC + 0x2ca0
    .4byte gUnknown_086A2EAC + 0x3080
    .4byte gUnknown_086A2EAC + 0x3458

	.global gUnknown_085D83A0
gUnknown_085D83A0:  @ 0x085D83A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dede8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8069100
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D83B8
gUnknown_085D83B8:  @ 0x085D83B8
    .4byte gUnknown_086A66D8 + 0xc3a0
    .4byte gUnknown_086A66D8 + 0xc458
    .4byte gUnknown_086A66D8 + 0xc51c
    .4byte gUnknown_086A66D8 + 0xc5f4
    .4byte gUnknown_086A66D8 + 0xc6e0
    .4byte gUnknown_086A66D8 + 0xc7e4
    .4byte gUnknown_086A66D8 + 0xc900
    .4byte gUnknown_086A66D8 + 0xca3c
    .4byte gUnknown_086A66D8 + 0xcb94
    .4byte gUnknown_086A66D8 + 0xcd08
    .4byte gUnknown_086A66D8 + 0xcea0
    .4byte gUnknown_086A66D8 + 0xd05c
    .4byte gUnknown_086A66D8 + 0xd224
    .4byte gUnknown_086A66D8 + 0xd414
    .4byte gUnknown_086A66D8 + 0xd610
    .4byte gUnknown_086A66D8 + 0xd828

	.global gUnknown_085D83F8
gUnknown_085D83F8:  @ 0x085D83F8
    .4byte gUnknown_086A66D8 + 0xb80
    .4byte gUnknown_086A66D8 + 0xfe8
    .4byte gUnknown_086A66D8 + 0x14ec
    .4byte gUnknown_086A66D8 + 0x1aa4
    .4byte gUnknown_086A66D8 + 0x2114
    .4byte gUnknown_086A66D8 + 0x2870
    .4byte gUnknown_086A66D8 + 0x30d0
    .4byte gUnknown_086A66D8 + 0x3a64
    .4byte gUnknown_086A66D8 + 0x4508
    .4byte gUnknown_086A66D8 + 0x50b8
    .4byte gUnknown_086A66D8 + 0x5dd8
    .4byte gUnknown_086A66D8 + 0x6be0
    .4byte gUnknown_086A66D8 + 0x7b48
    .4byte gUnknown_086A66D8 + 0x8b94
    .4byte gUnknown_086A66D8 + 0x9cc0
    .4byte gUnknown_086A66D8 + 0xaeec

	.global gUnknown_085D8438
gUnknown_085D8438:  @ 0x085D8438
    .4byte gUnknown_086A66D8 + 0xc1a0
    .4byte gUnknown_086A66D8 + 0xc1c0
    .4byte gUnknown_086A66D8 + 0xc1e0
    .4byte gUnknown_086A66D8 + 0xc200
    .4byte gUnknown_086A66D8 + 0xc220
    .4byte gUnknown_086A66D8 + 0xc240
    .4byte gUnknown_086A66D8 + 0xc260
    .4byte gUnknown_086A66D8 + 0xc280
    .4byte gUnknown_086A66D8 + 0xc2a0
    .4byte gUnknown_086A66D8 + 0xc2c0
    .4byte gUnknown_086A66D8 + 0xc2e0
    .4byte gUnknown_086A66D8 + 0xc300
    .4byte gUnknown_086A66D8 + 0xc320
    .4byte gUnknown_086A66D8 + 0xc340
    .4byte gUnknown_086A66D8 + 0xc360
    .4byte gUnknown_086A66D8 + 0xc380

	.global gUnknown_085D8478
gUnknown_085D8478:  @ 0x085D8478
    .4byte gUnknown_086B52CC + 0x20

	.global gUnknown_085D847C
gUnknown_085D847C:  @ 0x085D847C
    .4byte gUnknown_086A66D8 + 0xda44
    .4byte gUnknown_086B52CC

	.global gUnknown_085D8484
gUnknown_085D8484:  @ 0x085D8484
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dee48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806935C
        @ PROC_SLEEP
        .short 0xe, 0xe
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80693CC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8069400
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D84B4
gUnknown_085D84B4:  @ 0x085D84B4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8069528
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8069530
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnablePaletteSync
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


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
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dee5c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80697F4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D871C
gUnknown_085D871C:  @ 0x085D871C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dee74
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80699A8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8734
gUnknown_085D8734:  @ 0x085D8734
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dee88
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8069AFC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D874C
gUnknown_085D874C:  @ 0x085D874C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80deea0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8069CDC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8764
gUnknown_085D8764:  @ 0x085D8764
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80deeb4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8069F00
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D877C
gUnknown_085D877C:  @ 0x085D877C
    .4byte gUnknown_086BC824 + 0x60
    .4byte gUnknown_086BC824 + 0x2d4
    .4byte gUnknown_086BC824 + 0x54c
    .4byte gUnknown_086BC824 + 0x7c4

	.global gUnknown_085D878C
gUnknown_085D878C:  @ 0x085D878C
    .4byte gUnknown_086B5EAC + 0x610
    .4byte gUnknown_086B5EAC + 0x1efc
    .4byte gUnknown_086B5EAC + 0x3774
    .4byte gUnknown_086B5EAC + 0x5068
    .4byte gUnknown_086B5EAC + 0x610
    .4byte gUnknown_086B5EAC + 0x1efc
    .4byte gUnknown_086B5EAC + 0x3774
    .4byte gUnknown_086B5EAC + 0x5068

	.global gUnknown_085D87AC
gUnknown_085D87AC:  @ 0x085D87AC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80deed4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806A008
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D87C4
gUnknown_085D87C4:  @ 0x085D87C4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80deeec
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806A0CC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D87DC
gUnknown_085D87DC:  @ 0x085D87DC
	.incbin "baserom.gba", 0x5D87DC, 0x80

	.global gUnknown_085D885C
gUnknown_085D885C:  @ 0x085D885C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80def08
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806A1EC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8874
gUnknown_085D8874:  @ 0x085D8874
    .4byte gUnknown_086B5EAC + 0x20
    .4byte gUnknown_086B5EAC + 0xcc
    .4byte gUnknown_086B5EAC + 0x190
    .4byte gUnknown_086B5EAC + 0x254
    .4byte gUnknown_086B5EAC + 0x318
    .4byte gUnknown_086B5EAC + 0x3dc
    .4byte gUnknown_086B5EAC + 0x4a0
    .4byte gUnknown_086B5EAC + 0x564

	.global gUnknown_085D8894
gUnknown_085D8894:  @ 0x085D8894
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80def44
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806A47C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D88AC
gUnknown_085D88AC:  @ 0x085D88AC
	.incbin "baserom.gba", 0x5D88AC, 0xB4

	.global gUnknown_085D8960
gUnknown_085D8960:  @ 0x085D8960
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80def54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806A7C4
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806A8E8
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806A9C4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806AAA0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D89A0
gUnknown_085D89A0:  @ 0x085D89A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80def68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806AF30
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D89B8
gUnknown_085D89B8:  @ 0x085D89B8
    .4byte gUnknown_086DA920 + 0xbbc0
    .4byte gUnknown_086DA920 + 0xbccc
    .4byte gUnknown_086DA920 + 0xbdfc
    .4byte gUnknown_086DA920 + 0xbf40
    .4byte gUnknown_086DA920 + 0xc0a8
    .4byte gUnknown_086DA920 + 0xc218
    .4byte gUnknown_086DA920 + 0xc3a4
    .4byte gUnknown_086DA920 + 0xc540
    .4byte gUnknown_086DA920 + 0xc6ec
    .4byte gUnknown_086DA920 + 0xc89c
    .4byte gUnknown_086DA920 + 0xca60
    .4byte gUnknown_086DA920 + 0xcc30
    .4byte gUnknown_086DA920 + 0xce10
    .4byte gUnknown_086DA920 + 0xcff4
    .4byte gUnknown_086DA920 + 0xd1dc
    .4byte gUnknown_086DA920 + 0xd3b8

	.global gUnknown_085D89F8
gUnknown_085D89F8:  @ 0x085D89F8
    .4byte gUnknown_086DA920 + 0x614
    .4byte gUnknown_086DA920 + 0xe40
    .4byte gUnknown_086DA920 + 0x1744
    .4byte gUnknown_086DA920 + 0x2144
    .4byte gUnknown_086DA920 + 0x2c78
    .4byte gUnknown_086DA920 + 0x3848
    .4byte gUnknown_086DA920 + 0x4470
    .4byte gUnknown_086DA920 + 0x50d8
    .4byte gUnknown_086DA920 + 0x5cd0
    .4byte gUnknown_086DA920 + 0x6974
    .4byte gUnknown_086DA920 + 0x7634
    .4byte gUnknown_086DA920 + 0x82c8
    .4byte gUnknown_086DA920 + 0x8f08
    .4byte gUnknown_086DA920 + 0x9b00
    .4byte gUnknown_086DA920 + 0xa670
    .4byte gUnknown_086DA920 + 0xb110

	.global gUnknown_085D8A38
gUnknown_085D8A38:  @ 0x085D8A38
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb40
    .4byte gUnknown_086DA920 + 0xbb40
    .4byte gUnknown_086DA920 + 0xbb60
    .4byte gUnknown_086DA920 + 0xbb80
    .4byte gUnknown_086DA920 + 0xbba0

	.global gUnknown_085D8A78
gUnknown_085D8A78:  @ 0x085D8A78
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80defbc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B0AC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B11C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8A98
gUnknown_085D8A98:  @ 0x085D8A98
    .4byte gUnknown_086E91B8 + 0x20
    .4byte gUnknown_086E91B8 + 0xc4
    .4byte gUnknown_086E91B8 + 0x1a0
    .4byte gUnknown_086E91B8 + 0x2bc
    .4byte gUnknown_086E91B8 + 0x41c
    .4byte gUnknown_086E91B8 + 0x5a0
    .4byte gUnknown_086E91B8 + 0x72c
    .4byte gUnknown_086E91B8 + 0x8ac
    .4byte gUnknown_086E91B8 + 0xa1c

	.global gUnknown_085D8ABC
gUnknown_085D8ABC:  @ 0x085D8ABC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df010
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B194
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8AD4
gUnknown_085D8AD4:  @ 0x085D8AD4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df024
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B24C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8AEC
gUnknown_085D8AEC:  @ 0x085D8AEC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806B33C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B344
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnablePaletteSync
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8B0C
gUnknown_085D8B0C:  @ 0x085D8B0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df038
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B534
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8B24
gUnknown_085D8B24:  @ 0x085D8B24
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_806B64C
        @ PROC_SLEEP
        .short 0xe, 0x19
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B664
        @ PROC_SLEEP
        .short 0xe, 0x36
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8B4C
gUnknown_085D8B4C:  @ 0x085D8B4C
    .4byte gUnknown_086EAE24 + 0x5520
    .4byte gUnknown_086EAE24 + 0x55c8
    .4byte gUnknown_086EAE24 + 0x5694
    .4byte gUnknown_086EAE24 + 0x577c
    .4byte gUnknown_086EAE24 + 0x5878
    .4byte gUnknown_086EAE24 + 0x5978
    .4byte gUnknown_086EAE24 + 0x5a94
    .4byte gUnknown_086EAE24 + 0x5bbc
    .4byte gUnknown_086EAE24 + 0x5d08
    .4byte gUnknown_086EAE24 + 0x5e64
    .4byte gUnknown_086EAE24 + 0x5fd4

	.global gUnknown_085D8B78
gUnknown_085D8B78:  @ 0x085D8B78
    .4byte gUnknown_086EAE24 + 0xa90
    .4byte gUnknown_086EAE24 + 0xf20
    .4byte gUnknown_086EAE24 + 0x1440
    .4byte gUnknown_086EAE24 + 0x19b0
    .4byte gUnknown_086EAE24 + 0x1fb4
    .4byte gUnknown_086EAE24 + 0x2600
    .4byte gUnknown_086EAE24 + 0x2cd4
    .4byte gUnknown_086EAE24 + 0x3438
    .4byte gUnknown_086EAE24 + 0x3bd4
    .4byte gUnknown_086EAE24 + 0x43b8
    .4byte gUnknown_086EAE24 + 0x4ba4

	.global gUnknown_085D8BA4
gUnknown_085D8BA4:  @ 0x085D8BA4
    .4byte gUnknown_086EAE24 + 0x53c0
    .4byte gUnknown_086EAE24 + 0x53e0
    .4byte gUnknown_086EAE24 + 0x5400
    .4byte gUnknown_086EAE24 + 0x5420
    .4byte gUnknown_086EAE24 + 0x5440
    .4byte gUnknown_086EAE24 + 0x5460
    .4byte gUnknown_086EAE24 + 0x5480
    .4byte gUnknown_086EAE24 + 0x54a0
    .4byte gUnknown_086EAE24 + 0x54c0
    .4byte gUnknown_086EAE24 + 0x54e0
    .4byte gUnknown_086EAE24 + 0x5500

	.global gUnknown_085D8BD0
gUnknown_085D8BD0:  @ 0x085D8BD0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df070
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B73C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8BE8
gUnknown_085D8BE8:  @ 0x085D8BE8
    .4byte gUnknown_086EAE24 + 0x9c74
    .4byte gUnknown_086EAE24 + 0x9ea8
    .4byte gUnknown_086EAE24 + 0xa0b4

	.global gUnknown_085D8BF4
gUnknown_085D8BF4:  @ 0x085D8BF4
    .4byte gUnknown_086EAE24 + 0x6148
    .4byte gUnknown_086EAE24 + 0x76a4
    .4byte gUnknown_086EAE24 + 0x8a0c

	.global gUnknown_085D8C00
gUnknown_085D8C00:  @ 0x085D8C00
    .4byte gUnknown_086EAE24 + 0x9c14
    .4byte gUnknown_086EAE24 + 0x9c34
    .4byte gUnknown_086EAE24 + 0x9c54

	.global gUnknown_085D8C0C
gUnknown_085D8C0C:  @ 0x085D8C0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df09c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B830
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8C24
gUnknown_085D8C24:  @ 0x085D8C24
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806B938
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806BACC
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnablePaletteSync
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8C4C
gUnknown_085D8C4C:  @ 0x085D8C4C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df0b0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806BBF0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8C64
gUnknown_085D8C64:  @ 0x085D8C64
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df0cc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806BD94
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8C7C
gUnknown_085D8C7C:  @ 0x085D8C7C
    .4byte gUnknown_086FDA44 + 0x20
    .4byte gUnknown_086FDA44 + 0xc4
    .4byte gUnknown_086FDA44 + 0x29c
    .4byte gUnknown_086FDA44 + 0x480
    .4byte gUnknown_086FDA44 + 0x690
    .4byte gUnknown_086FDA44 + 0x8dc
    .4byte gUnknown_086FDA44 + 0xa9c
    .4byte gUnknown_086FDA44 + 0xc3c
    .4byte gUnknown_086FDA44 + 0xdd8

	.global gUnknown_085D8CA0
gUnknown_085D8CA0:  @ 0x085D8CA0
    .4byte gUnknown_086EAE24 + 0xa2b0
    .4byte gUnknown_086EAE24 + 0xb440
    .4byte gUnknown_086EAE24 + 0xc32c
    .4byte gUnknown_086EAE24 + 0xd294
    .4byte gUnknown_086EAE24 + 0xe338
    .4byte gUnknown_086EAE24 + 0xf52c
    .4byte gUnknown_086EAE24 + 0x10258
    .4byte gUnknown_086EAE24 + 0x10ec4
    .4byte gUnknown_086EAE24 + 0x11f34

	.global gUnknown_085D8CC4
gUnknown_085D8CC4:  @ 0x085D8CC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df108
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C050
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B11C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8CE4
gUnknown_085D8CE4:  @ 0x085D8CE4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806C14C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C154
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C1B8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C2D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnablePaletteSync
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8D14
gUnknown_085D8D14:  @ 0x085D8D14
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806C14C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C478
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C1B8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C2D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnablePaletteSync
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8D44
gUnknown_085D8D44:  @ 0x085D8D44
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df11c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C650
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8D5C
gUnknown_085D8D5C:  @ 0x085D8D5C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df130
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C6EC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8D74
gUnknown_085D8D74:  @ 0x085D8D74
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df148
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C768
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8D8C
gUnknown_085D8D8C:  @ 0x085D8D8C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df15c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C7E8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8DA4
gUnknown_085D8DA4:  @ 0x085D8DA4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df170
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C840
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8DC4
gUnknown_085D8DC4:  @ 0x085D8DC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df1cc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C8C4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8DDC
gUnknown_085D8DDC:  @ 0x085D8DDC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df1dc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C990
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8DF4
gUnknown_085D8DF4:  @ 0x085D8DF4
    .4byte gUnknown_085E9150 + 0x20
    .4byte gUnknown_085E9150 + 0xec
    .4byte gUnknown_085E9150 + 0x1ec
    .4byte gUnknown_085E9150 + 0x2fc
    .4byte gUnknown_085E9150 + 0x408
    .4byte gUnknown_085E9150 + 0x50c
    .4byte gUnknown_085E9150 + 0x5f8
    .4byte gUnknown_085E9150 + 0x6cc
    .4byte gUnknown_085E9150 + 0x788
    .4byte gUnknown_085E9150 + 0x830

	.global gUnknown_085D8E1C
gUnknown_085D8E1C:  @ 0x085D8E1C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df218
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CA08
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8E34
gUnknown_085D8E34:  @ 0x085D8E34
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df230
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CA88
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8E4C
gUnknown_085D8E4C:  @ 0x085D8E4C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df24c
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CAE0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8E6C
gUnknown_085D8E6C:  @ 0x085D8E6C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df2ac
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CB3C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8E84
gUnknown_085D8E84:  @ 0x085D8E84
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df2c4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CC08
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8E9C
gUnknown_085D8E9C:  @ 0x085D8E9C
    .4byte gUnknown_085D1470 + 0x20
    .4byte gUnknown_085D1470 + 0xec
    .4byte gUnknown_085D1470 + 0x1f8
    .4byte gUnknown_085D1470 + 0x320
    .4byte gUnknown_085D1470 + 0x444
    .4byte gUnknown_085D1470 + 0x56c
    .4byte gUnknown_085D1470 + 0x68c
    .4byte gUnknown_085D1470 + 0x78c
    .4byte gUnknown_085D1470 + 0x86c
    .4byte gUnknown_085D1470 + 0x930

	.global gUnknown_085D8EC4
gUnknown_085D8EC4:  @ 0x085D8EC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df308
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CC88
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8EDC
gUnknown_085D8EDC:  @ 0x085D8EDC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df31c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CD14
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CD7C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CDA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CE08
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8F0C
gUnknown_085D8F0C:  @ 0x085D8F0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df334
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CE74
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8F24
gUnknown_085D8F24:  @ 0x085D8F24
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df344
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CEC4
        @ PROC_SLEEP
        .short 0xe, 0x1a
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CF10
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CF5C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8F5C
gUnknown_085D8F5C:  @ 0x085D8F5C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df358
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806CFC4
        @ PROC_SLEEP
        .short 0xe, 0x3a
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D010
        @ PROC_SLEEP
        .short 0xe, 0x15
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D05C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8F94
gUnknown_085D8F94:  @ 0x085D8F94
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df36c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D198
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8FAC
gUnknown_085D8FAC:  @ 0x085D8FAC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df378
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D294
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8FC4
gUnknown_085D8FC4:  @ 0x085D8FC4
    .4byte gUnknown_085EF24C + 0x20
    .4byte gUnknown_085EF24C + 0xbc
    .4byte gUnknown_085EF24C + 0x158
    .4byte gUnknown_085EF24C + 0x1f8
    .4byte gUnknown_085EF24C + 0x29c
    .4byte gUnknown_085EF24C + 0x350

	.global gUnknown_085D8FDC
gUnknown_085D8FDC:  @ 0x085D8FDC
    .4byte gUnknown_085EF24C + 0x3f8
    .4byte gUnknown_085EF24C + 0x4a8
    .4byte gUnknown_085EF24C + 0x558
    .4byte gUnknown_085EF24C + 0x610
    .4byte gUnknown_085EF24C + 0x6c8
    .4byte gUnknown_085EF24C + 0x77c
    .4byte gUnknown_085EF24C + 0x81c
    .4byte gUnknown_085EF24C + 0x8d0
    .4byte gUnknown_085EF24C + 0x984
    .4byte gUnknown_085EF24C + 0xa38
    .4byte gUnknown_085EF24C + 0xad8
    .4byte gUnknown_085EF24C + 0xb94
    .4byte gUnknown_085EF24C + 0xc44
    .4byte gUnknown_085EF24C + 0xd14
    .4byte gUnknown_085EF24C + 0xdcc
    .4byte gUnknown_085EF24C + 0xe9c

	.global gUnknown_085D901C
gUnknown_085D901C:  @ 0x085D901C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df3e8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D350
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085D9034
gUnknown_085D9034:  @ 0x085D9034
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df3f8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D540
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D904C
gUnknown_085D904C:  @ 0x085D904C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df40c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D59C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9064
gUnknown_085D9064:  @ 0x085D9064
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df418
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D62C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D907C
gUnknown_085D907C:  @ 0x085D907C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df428
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D678
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9094
gUnknown_085D9094:  @ 0x085D9094
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df434
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D704
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D90AC
gUnknown_085D90AC:  @ 0x085D90AC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df440
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D7D8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D90C4
gUnknown_085D90C4:  @ 0x085D90C4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df44c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D89C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D90DC
gUnknown_085D90DC:  @ 0x085D90DC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df458
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D980
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D90F4
gUnknown_085D90F4:  @ 0x085D90F4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df468
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D9AC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D910C
gUnknown_085D910C:  @ 0x085D910C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df480
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806DA68
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9124
gUnknown_085D9124:  @ 0x085D9124
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df498
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806DAB0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D913C
gUnknown_085D913C:  @ 0x085D913C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df4b0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806DB54
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9154
gUnknown_085D9154:  @ 0x085D9154
	.incbin "baserom.gba", 0x5D9154, 0xF0

	.global gUnknown_085D9244
gUnknown_085D9244:  @ 0x085D9244
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df4cc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806DBBC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D925C
gUnknown_085D925C:  @ 0x085D925C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df4e0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806DCA4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9274
gUnknown_085D9274:  @ 0x085D9274
    .4byte gUnknown_085F0E04 + 0x20
    .4byte gUnknown_085F0E04 + 0x120
    .4byte gUnknown_085F0E04 + 0x214
    .4byte gUnknown_085F0E04 + 0x2e8

	.global gUnknown_085D9284
gUnknown_085D9284:  @ 0x085D9284
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df514
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806DFA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806DFD0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D92A4
gUnknown_085D92A4:  @ 0x085D92A4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df524
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E034
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D92BC
gUnknown_085D92BC:  @ 0x085D92BC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df534
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E0D0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D92D4
gUnknown_085D92D4:  @ 0x085D92D4
    .4byte gUnknown_087456E8 + 0xc0
    .4byte gUnknown_087456E8 + 0x48c
    .4byte gUnknown_087456E8 + 0x8e8

	.global gUnknown_085D92E0
gUnknown_085D92E0:  @ 0x085D92E0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df554
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E158
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9300
gUnknown_085D9300:  @ 0x085D9300
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df5b4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E290
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9318
gUnknown_085D9318:  @ 0x085D9318
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df5c4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E444
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9330
gUnknown_085D9330:  @ 0x085D9330
    .4byte gUnknown_085C9328 + 0x5b44
    .4byte gUnknown_085C9328 + 0x5bdc
    .4byte gUnknown_085C9328 + 0x5c7c
    .4byte gUnknown_085C9328 + 0x5d1c
    .4byte gUnknown_085C9328 + 0x5dc0
    .4byte gUnknown_085C9328 + 0x5e78
    .4byte gUnknown_085C9328 + 0x5f3c
    .4byte gUnknown_085C9328 + 0x6014
    .4byte gUnknown_085C9328 + 0x6118
    .4byte gUnknown_085C9328 + 0x621c
    .4byte gUnknown_085C9328 + 0x6320
    .4byte gUnknown_085C9328 + 0x6428
    .4byte gUnknown_085C9328 + 0x6514
    .4byte gUnknown_085C9328 + 0x65f4
    .4byte gUnknown_085C9328 + 0x66cc
    .4byte gUnknown_085C9328 + 0x6798

	.global gUnknown_085D9370
gUnknown_085D9370:  @ 0x085D9370
    .4byte gUnknown_085C9328 + 0x34
    .4byte gUnknown_085C9328 + 0x418
    .4byte gUnknown_085C9328 + 0x810
    .4byte gUnknown_085C9328 + 0xc20
    .4byte gUnknown_085C9328 + 0x1058
    .4byte gUnknown_085C9328 + 0x14d4
    .4byte gUnknown_085C9328 + 0x19cc
    .4byte gUnknown_085C9328 + 0x1fa4
    .4byte gUnknown_085C9328 + 0x2684
    .4byte gUnknown_085C9328 + 0x2dc0
    .4byte gUnknown_085C9328 + 0x34f8
    .4byte gUnknown_085C9328 + 0x3bec
    .4byte gUnknown_085C9328 + 0x4278
    .4byte gUnknown_085C9328 + 0x48d8
    .4byte gUnknown_085C9328 + 0x4ed8
    .4byte gUnknown_085C9328 + 0x549c

	.global gUnknown_085D93B0
gUnknown_085D93B0:  @ 0x085D93B0
    .4byte gUnknown_085C9328 + 0x5944
    .4byte gUnknown_085C9328 + 0x5964
    .4byte gUnknown_085C9328 + 0x5984
    .4byte gUnknown_085C9328 + 0x59a4
    .4byte gUnknown_085C9328 + 0x59c4
    .4byte gUnknown_085C9328 + 0x59e4
    .4byte gUnknown_085C9328 + 0x5a04
    .4byte gUnknown_085C9328 + 0x5a24
    .4byte gUnknown_085C9328 + 0x5a44
    .4byte gUnknown_085C9328 + 0x5a64
    .4byte gUnknown_085C9328 + 0x5a84
    .4byte gUnknown_085C9328 + 0x5aa4
    .4byte gUnknown_085C9328 + 0x5ac4
    .4byte gUnknown_085C9328 + 0x5ae4
    .4byte gUnknown_085C9328 + 0x5b04
    .4byte gUnknown_085C9328 + 0x5b24

	.global gUnknown_085D93F0
gUnknown_085D93F0:  @ 0x085D93F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df618
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E6E0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E868
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E610
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E638
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E8A4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E79C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9430
gUnknown_085D9430:  @ 0x085D9430
    .4byte nullsub_73
    .4byte sub_806EB7C
    .4byte sub_806ED0C
    .4byte sub_806EF48
    .4byte sub_806F210
    .4byte sub_806F5BC
    .4byte sub_806F648
    .4byte sub_806F6B4
    .4byte sub_806F844

	.global gUnknown_085D9454
gUnknown_085D9454:  @ 0x085D9454
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df62c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806EB9C
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D947C
gUnknown_085D947C:  @ 0x085D947C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df638
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806EC1C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9494
gUnknown_085D9494:  @ 0x085D9494
    .4byte gUnknown_085F6230 + 0x20
    .4byte gUnknown_085F6230 + 0xc8
    .4byte gUnknown_085F6230 + 0x170
    .4byte gUnknown_085F6230 + 0x228
    .4byte gUnknown_085F6230 + 0x2f0
    .4byte gUnknown_085F6230 + 0x3c0
    .4byte gUnknown_085F6230 + 0x4c0
    .4byte gUnknown_085F6230 + 0x5c8
    .4byte gUnknown_085F6230 + 0x6dc
    .4byte gUnknown_085F6230 + 0x814
    .4byte gUnknown_085F6230 + 0x918
    .4byte gUnknown_085F6230 + 0x9ec

	.global gUnknown_085D94C4
gUnknown_085D94C4:  @ 0x085D94C4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df678
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806ECE8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D94DC
gUnknown_085D94DC:  @ 0x085D94DC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df688
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806ED2C
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9504
gUnknown_085D9504:  @ 0x085D9504
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df698
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806EDB0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D951C
gUnknown_085D951C:  @ 0x085D951C
    .4byte gUnknown_085F367C + 0x200
    .4byte gUnknown_085F367C + 0x2cc

	.global gUnknown_085D9524
gUnknown_085D9524:  @ 0x085D9524
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df6b4
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806EE68
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9544
gUnknown_085D9544:  @ 0x085D9544
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df708
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806EF24
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D955C
gUnknown_085D955C:  @ 0x085D955C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df718
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806EF64
        @ PROC_SLEEP
        .short 0xe, 0x46
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9584
gUnknown_085D9584:  @ 0x085D9584
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df724
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F00C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D959C
gUnknown_085D959C:  @ 0x085D959C
    .4byte gUnknown_0866F774

	.global gUnknown_085D95A0
gUnknown_085D95A0:  @ 0x085D95A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df738
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F08C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D95C0
gUnknown_085D95C0:  @ 0x085D95C0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df78c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F0FC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F118
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D95E0
gUnknown_085D95E0:  @ 0x085D95E0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df79c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F1E8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D95F8
gUnknown_085D95F8:  @ 0x085D95F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df7ac
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F230
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9620
gUnknown_085D9620:  @ 0x085D9620
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df7bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F2A0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9638
gUnknown_085D9638:  @ 0x085D9638
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3358
    .4byte gUnknown_0861AD8C + 0x3358
    .4byte gUnknown_0861AD8C + 0x3358
    .4byte gUnknown_0861AD8C + 0x4008
    .4byte gUnknown_0861AD8C + 0x4008
    .4byte gUnknown_0861AD8C + 0x4008
    .4byte gUnknown_0861AD8C + 0x4008
    .4byte gUnknown_0861AD8C + 0x4008

	.global gUnknown_085D96BC
gUnknown_085D96BC:  @ 0x085D96BC
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48

	.global gUnknown_085D9740
gUnknown_085D9740:  @ 0x085D9740
    .4byte gUnknown_0861AD8C + 0x4a68
    .4byte gUnknown_0861AD8C + 0x4b8c
    .4byte gUnknown_0861AD8C + 0x4cac
    .4byte gUnknown_0861AD8C + 0x4db8
    .4byte gUnknown_0861AD8C + 0x4eb4
    .4byte gUnknown_0861AD8C + 0x4f9c
    .4byte gUnknown_0861AD8C + 0x5080
    .4byte gUnknown_0861AD8C + 0x5164
    .4byte gUnknown_0861AD8C + 0x5240
    .4byte gUnknown_0861AD8C + 0x5320
    .4byte gUnknown_0861AD8C + 0x5414
    .4byte gUnknown_0861AD8C + 0x5508
    .4byte gUnknown_0861AD8C + 0x560c
    .4byte gUnknown_0861AD8C + 0x5714
    .4byte gUnknown_0861AD8C + 0x582c
    .4byte gUnknown_0861AD8C + 0x5950
    .4byte gUnknown_0861AD8C + 0x5a64
    .4byte gUnknown_0861AD8C + 0x5b14
    .4byte gUnknown_0861AD8C + 0x5c1c
    .4byte gUnknown_0861AD8C + 0x5d58
    .4byte gUnknown_0861AD8C + 0x5ecc
    .4byte gUnknown_0861AD8C + 0x6064
    .4byte gUnknown_0861AD8C + 0x61d8
    .4byte gUnknown_0861AD8C + 0x62e4
    .4byte gUnknown_0861AD8C + 0x63b8
    .4byte gUnknown_0861AD8C + 0x6458
    .4byte gUnknown_0861AD8C + 0x6578
    .4byte gUnknown_0861AD8C + 0x6694
    .4byte gUnknown_0861AD8C + 0x67a8
    .4byte gUnknown_0861AD8C + 0x68a0
    .4byte gUnknown_0861AD8C + 0x6988
    .4byte gUnknown_0861AD8C + 0x6a58
    .4byte gUnknown_0861AD8C + 0x6b1c

	.global gUnknown_085D97C4
gUnknown_085D97C4:  @ 0x085D97C4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df854
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F3F8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D97DC
gUnknown_085D97DC:  @ 0x085D97DC
    .4byte gUnknown_0862A2F0 + 0x20
    .4byte gUnknown_0862A2F0 + 0x11c
    .4byte gUnknown_0862A2F0 + 0x21c
    .4byte gUnknown_0862A2F0 + 0x320
    .4byte gUnknown_0862A2F0 + 0x418
    .4byte gUnknown_0862A2F0 + 0x524
    .4byte gUnknown_0862A2F0 + 0x630
    .4byte gUnknown_0862A2F0 + 0x750
    .4byte gUnknown_0862A2F0 + 0x874
    .4byte gUnknown_0862A2F0 + 0x95c
    .4byte gUnknown_0862A2F0 + 0xa38
    .4byte gUnknown_0862A2F0 + 0xaf8
    .4byte gUnknown_0862A2F0 + 0xbb0
    .4byte gUnknown_0862A2F0 + 0xc58
    .4byte gUnknown_0862A2F0 + 0xd14
    .4byte gUnknown_0862A2F0 + 0xdec
    .4byte gUnknown_0862A2F0 + 0xecc
    .4byte gUnknown_0862A2F0 + 0xfbc
    .4byte gUnknown_0862A2F0 + 0x10b8
    .4byte gUnknown_0862A2F0 + 0x11ac
    .4byte gUnknown_0862A2F0 + 0x12a4
    .4byte gUnknown_0862A2F0 + 0x1390
    .4byte gUnknown_0862A2F0 + 0x1474
    .4byte gUnknown_0862A2F0 + 0x154c
    .4byte gUnknown_0862A2F0 + 0x161c
    .4byte gUnknown_0862A2F0 + 0x16e8
    .4byte gUnknown_0862A2F0 + 0x17b0
    .4byte gUnknown_0862A2F0 + 0x1864
    .4byte gUnknown_0862A2F0 + 0x1918
    .4byte gUnknown_0862A2F0 + 0x19b8
    .4byte gUnknown_0862A2F0 + 0x1a6c
    .4byte gUnknown_0862A2F0 + 0x1b28
    .4byte gUnknown_0862A2F0 + 0x1c04
    .4byte gUnknown_0862A2F0 + 0x1cec
    .4byte gUnknown_0862A2F0 + 0x1e10
    .4byte gUnknown_0862A2F0 + 0x1f30
    .4byte gUnknown_0862A2F0 + 0x203c
    .4byte gUnknown_0862A2F0 + 0x2148
    .4byte gUnknown_0862A2F0 + 0x2244
    .4byte gUnknown_0862A2F0 + 0x2344
    .4byte gUnknown_0862A2F0 + 0x2440

	.global gUnknown_085D9880
gUnknown_085D9880:  @ 0x085D9880
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x3278
    .4byte gUnknown_0862688C + 0x3278
    .4byte gUnknown_0862688C + 0x3278
    .4byte gUnknown_0862688C + 0x3278
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xb8

	.global gUnknown_085D9924
gUnknown_085D9924:  @ 0x085D9924
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df910
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_806F4B4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F4C0
        @ PROC_SLEEP
        .short 0xe, 0x20
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F4F8
        @ PROC_SLEEP
        .short 0xe, 0xb
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F530
        @ PROC_SLEEP
        .short 0xe, 0x16
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D996C
gUnknown_085D996C:  @ 0x085D996C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df924
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_806F4B4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F568
        @ PROC_SLEEP
        .short 0xe, 0xe
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F594
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D999C
gUnknown_085D999C:  @ 0x085D999C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df938
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F5E0
        @ PROC_SLEEP
        .short 0xe, 0xaa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D99C4
gUnknown_085D99C4:  @ 0x085D99C4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df948
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F668
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D99EC
gUnknown_085D99EC:  @ 0x085D99EC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F6D4
        @ PROC_SLEEP
        .short 0xe, 0x18
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F6EC
        @ PROC_SLEEP
        .short 0xe, 0x48
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9A1C
gUnknown_085D9A1C:  @ 0x085D9A1C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F75C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9A2C
gUnknown_085D9A2C:  @ 0x085D9A2C
    .4byte gUnknown_086C978C + 0x28
    .4byte gUnknown_086C978C + 0x620
    .4byte gUnknown_086C978C + 0xc38
    .4byte gUnknown_086C978C + 0x1308
    .4byte gUnknown_086C978C + 0x1a38
    .4byte gUnknown_086C978C + 0x2164
    .4byte gUnknown_086C978C + 0x2958
    .4byte gUnknown_086C978C + 0x3114
    .4byte gUnknown_086C978C + 0x390c
    .4byte gUnknown_086C978C + 0x41fc
    .4byte gUnknown_086C978C + 0x49d0
    .4byte gUnknown_086C978C + 0x5270
    .4byte gUnknown_086C978C + 0x5ab8
    .4byte gUnknown_086C978C + 0x624c
    .4byte gUnknown_086C978C + 0x6adc
    .4byte gUnknown_086C978C + 0x7398
    .4byte gUnknown_086C978C + 0x7bc0
    .4byte gUnknown_086C978C + 0x83e0
    .4byte gUnknown_086C978C + 0x8c74
    .4byte gUnknown_086C978C + 0x9458
    .4byte gUnknown_086C978C + 0xb47c
    .4byte gUnknown_086C978C + 0xbc8c
    .4byte gUnknown_086C978C + 0xc6b8
    .4byte gUnknown_086C978C + 0xd120
    .4byte gUnknown_086C978C + 0xdc18
    .4byte gUnknown_086C978C + 0xe794

	.global gUnknown_085D9A94
gUnknown_085D9A94:  @ 0x085D9A94
    .4byte gUnknown_086C978C + 0x9f48
    .4byte gUnknown_086C978C + 0xa028
    .4byte gUnknown_086C978C + 0xa104
    .4byte gUnknown_086C978C + 0xa1ec
    .4byte gUnknown_086C978C + 0xa2f0
    .4byte gUnknown_086C978C + 0xa3ec
    .4byte gUnknown_086C978C + 0xa4f8
    .4byte gUnknown_086C978C + 0xa600
    .4byte gUnknown_086C978C + 0xa708
    .4byte gUnknown_086C978C + 0xa830
    .4byte gUnknown_086C978C + 0xa940
    .4byte gUnknown_086C978C + 0xaa68
    .4byte gUnknown_086C978C + 0xab8c
    .4byte gUnknown_086C978C + 0xac9c
    .4byte gUnknown_086C978C + 0xadc0
    .4byte gUnknown_086C978C + 0xaee0
    .4byte gUnknown_086C978C + 0xaffc
    .4byte gUnknown_086C978C + 0xb110
    .4byte gUnknown_086C978C + 0xb244
    .4byte gUnknown_086C978C + 0xb350
    .4byte gUnknown_086D8A94 + 0xc0
    .4byte gUnknown_086D8A94 + 0x1d0
    .4byte gUnknown_086D8A94 + 0x358
    .4byte gUnknown_086D8A94 + 0x510
    .4byte gUnknown_086D8A94 + 0x6dc
    .4byte gUnknown_086D8A94 + 0x8c0

	.global gUnknown_085D9AFC
gUnknown_085D9AFC:  @ 0x085D9AFC
    .4byte gUnknown_086C978C + 0x9cc8
    .4byte gUnknown_086C978C + 0x9ce8
    .4byte gUnknown_086C978C + 0x9d08
    .4byte gUnknown_086C978C + 0x9d28
    .4byte gUnknown_086C978C + 0x9d48
    .4byte gUnknown_086C978C + 0x9d68
    .4byte gUnknown_086C978C + 0x9d88
    .4byte gUnknown_086C978C + 0x9da8
    .4byte gUnknown_086C978C + 0x9dc8
    .4byte gUnknown_086C978C + 0x9de8
    .4byte gUnknown_086C978C + 0x9e08
    .4byte gUnknown_086C978C + 0x9e28
    .4byte gUnknown_086C978C + 0x9e48
    .4byte gUnknown_086C978C + 0x9e68
    .4byte gUnknown_086C978C + 0x9e88
    .4byte gUnknown_086C978C + 0x9ea8
    .4byte gUnknown_086C978C + 0x9ec8
    .4byte gUnknown_086C978C + 0x9ee8
    .4byte gUnknown_086C978C + 0x9f08
    .4byte gUnknown_086C978C + 0x9f28
    .4byte gUnknown_086D8A94
    .4byte gUnknown_086D8A94 + 0x20
    .4byte gUnknown_086D8A94 + 0x40
    .4byte gUnknown_086D8A94 + 0x60
    .4byte gUnknown_086D8A94 + 0x80
    .4byte gUnknown_086D8A94 + 0xa0

	.global gUnknown_085D9B64
gUnknown_085D9B64:  @ 0x085D9B64
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F820
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9B74
gUnknown_085D9B74:  @ 0x085D9B74
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F864
        @ PROC_SLEEP
        .short 0xe, 0x3e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F87C
        @ PROC_SLEEP
        .short 0xe, 0x8a
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9BA4
gUnknown_085D9BA4:  @ 0x085D9BA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F8F0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9BB4
gUnknown_085D9BB4:  @ 0x085D9BB4
    .4byte gUnknown_086BDA5C + 0x120
    .4byte gUnknown_086BDA5C + 0x670
    .4byte gUnknown_086BDA5C + 0xc0c
    .4byte gUnknown_086BDA5C + 0x1200
    .4byte gUnknown_086BDA5C + 0x1898
    .4byte gUnknown_086BDA5C + 0x1f54
    .4byte gUnknown_086BDA5C + 0x26b4
    .4byte gUnknown_086BDA5C + 0x2ec8
    .4byte gUnknown_086BDA5C + 0x3740
    .4byte gUnknown_086BDA5C + 0x4074
    .4byte gUnknown_086BDA5C + 0x49dc
    .4byte gUnknown_086BDA5C + 0x534c
    .4byte gUnknown_086BDA5C + 0x5d00
    .4byte gUnknown_086BDA5C + 0x6698
    .4byte gUnknown_086BDA5C + 0x7058
    .4byte gUnknown_086BDA5C + 0x7970
    .4byte gUnknown_086BDA5C + 0x82c4
    .4byte gUnknown_086BDA5C + 0x8c40
    .4byte gUnknown_086BDA5C + 0x95b4

	.global gUnknown_085D9C00
gUnknown_085D9C00:  @ 0x085D9C00
    .4byte gUnknown_086C794C + 0x20
    .4byte gUnknown_086C794C + 0xe0
    .4byte gUnknown_086C794C + 0x1ac
    .4byte gUnknown_086C794C + 0x284
    .4byte gUnknown_086C794C + 0x370
    .4byte gUnknown_086C794C + 0x474
    .4byte gUnknown_086C794C + 0x588
    .4byte gUnknown_086C794C + 0x6b0
    .4byte gUnknown_086C794C + 0x7ec
    .4byte gUnknown_086C794C + 0x940
    .4byte gUnknown_086C794C + 0xab8
    .4byte gUnknown_086C794C + 0xc24
    .4byte gUnknown_086C794C + 0xd98
    .4byte gUnknown_086C794C + 0xf14
    .4byte gUnknown_086C794C + 0x10a0
    .4byte gUnknown_086C794C + 0x11e4
    .4byte gUnknown_086C794C + 0x1338
    .4byte gUnknown_086C794C + 0x149c
    .4byte gUnknown_086C794C + 0x1600

	.global gUnknown_085D9C4C
gUnknown_085D9C4C:  @ 0x085D9C4C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F9D8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


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
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806FC50
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806FCD8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806FD74
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806FEA4
        @ PROC_SLEEP
        .short 0xe, 0x2d
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806FED4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806FF00
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806FF48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80700CC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80701A0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087586D8
gUnknown_087586D8:  @ 0x087586D8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dfa0c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80703C4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087586F0
gUnknown_087586F0:  @ 0x087586F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dfa1c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80705A8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8070618
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8070670
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80706E0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08758720
gUnknown_08758720:  @ 0x08758720
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80707C0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80707FC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08758740
gUnknown_08758740:  @ 0x08758740
	.incbin "baserom.gba", 0x758740, 0x14

	.global gUnknown_08758754
gUnknown_08758754:  @ 0x08758754
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80708FC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807096C
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80709CC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80709EC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8070A14
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8070AE4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875879C
gUnknown_0875879C:  @ 0x0875879C
	.incbin "baserom.gba", 0x75879C, 0x280

	.global gUnknown_08758A1C
gUnknown_08758A1C:  @ 0x08758A1C
	.incbin "baserom.gba", 0x758A1C, 0x14

	.global gUnknown_08758A30
gUnknown_08758A30:  @ 0x08758A30
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e13c0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8071714
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08758A48
gUnknown_08758A48:  @ 0x08758A48
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1414
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxSoundSE
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08758A60
gUnknown_08758A60:  @ 0x08758A60
	.incbin "baserom.gba", 0x758A60, 0x2C0

	.global gUnknown_08758D20
gUnknown_08758D20:  @ 0x08758D20
    .4byte gUnknown_08758A60 + 0x100
    .4byte gUnknown_08758A60 + 0x110
    .4byte gUnknown_08758A60 + 0x120
    .4byte gUnknown_08758A60 + 0x130
    .4byte gUnknown_08758A60 + 0x140
    .4byte gUnknown_08758A60 + 0x150
    .4byte gUnknown_08758A60 + 0x160

	.global gUnknown_08758D3C
gUnknown_08758D3C:  @ 0x08758D3C
    .4byte gUnknown_08758A60 + 0x170
    .4byte gUnknown_08758A60 + 0x180
    .4byte gUnknown_08758A60 + 0x190
    .4byte gUnknown_08758A60 + 0x1a0
    .4byte gUnknown_08758A60 + 0x1b0
    .4byte gUnknown_08758A60 + 0x1c0
    .4byte gUnknown_08758A60 + 0x1d0

	.global gUnknown_08758D58
gUnknown_08758D58:  @ 0x08758D58
    .4byte gUnknown_08758A60 + 0x1e0
    .4byte gUnknown_08758A60 + 0x1f0
    .4byte gUnknown_08758A60 + 0x200
    .4byte gUnknown_08758A60 + 0x210
    .4byte gUnknown_08758A60 + 0x220
    .4byte gUnknown_08758A60 + 0x230
    .4byte gUnknown_08758A60 + 0x240

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
    .4byte gUnknown_08758F18 + 0x1c
    .4byte gUnknown_08758F18 + 0x2c
    .4byte gUnknown_08758F18 + 0x3c
    .4byte gUnknown_08758F18 + 0x4c
    .4byte gUnknown_08758F18 + 0x5c
    .4byte gUnknown_08758F18 + 0x6c
    .4byte gUnknown_08758F18 + 0x7c

	.global gUnknown_08758FC0
gUnknown_08758FC0:  @ 0x08758FC0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1420
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word EndEfxStatusUnit
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8072A44
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8072DC0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08758FE8
gUnknown_08758FE8:  @ 0x08758FE8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e142c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8072E60
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08759000
gUnknown_08759000:  @ 0x08759000
    .4byte gUnknown_08792988 + 0x964
    .4byte gUnknown_08792988 + 0x9fc
    .4byte gUnknown_08792988 + 0xb0c
    .4byte gUnknown_08792988 + 0xc28
    .4byte gUnknown_08792988 + 0xd38
    .4byte gUnknown_08792988 + 0xe48
    .4byte gUnknown_08792988 + 0xf64
    .4byte gUnknown_08792988 + 0x6e90
    .4byte gUnknown_08792988 + 0x7134
    .4byte gUnknown_08792988 + 0x73dc
    .4byte gUnknown_08792988 + 0x7680
    .4byte gUnknown_08792988 + 0x7920
    .4byte gUnknown_08792988 + 0x7abc
    .4byte gUnknown_08792988 + 0x7d18
    .4byte gUnknown_08792988 + 0x7ef4
    .4byte gUnknown_08792988 + 0x8060
    .4byte gUnknown_08792988 + 0x8188
    .4byte gUnknown_08792988 + 0xef68
    .4byte gUnknown_08792988 + 0xf064
    .4byte gUnknown_08792988 + 0xf1e0
    .4byte gUnknown_08792988 + 0xf3ec
    .4byte gUnknown_08792988 + 0xf614
    .4byte gUnknown_08792988 + 0xf7ac
    .4byte gUnknown_08792988 + 0xf9fc
    .4byte gUnknown_08792988 + 0xfbfc
    .4byte gUnknown_08792988 + 0xfdc0
    .4byte gUnknown_08792988 + 0xff20
    .4byte gUnknown_08792988 + 0x10054
    .4byte gUnknown_08792988 + 0x10160
    .4byte gUnknown_08792988 + 0x1025c
    .4byte gUnknown_08792988 + 0x10344
    .4byte gUnknown_08792988 + 0x10430
    .4byte gUnknown_08792988 + 0x12100
    .4byte gUnknown_08792988 + 0x121e0
    .4byte gUnknown_08792988 + 0x122bc
    .4byte gUnknown_08792988 + 0x123a4
    .4byte gUnknown_08792988 + 0x12484

	.global gUnknown_08759094
gUnknown_08759094:  @ 0x08759094
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x1074
    .4byte gUnknown_08792988 + 0x1ca0
    .4byte gUnknown_08792988 + 0x2850
    .4byte gUnknown_08792988 + 0x346c
    .4byte gUnknown_08792988 + 0x406c
    .4byte gUnknown_08792988 + 0x4754
    .4byte gUnknown_08792988 + 0x513c
    .4byte gUnknown_08792988 + 0x5a0c
    .4byte gUnknown_08792988 + 0x61e4
    .4byte gUnknown_08792988 + 0x68a0
    .4byte gUnknown_08792988 + 0x8280
    .4byte gUnknown_08792988 + 0x87e0
    .4byte gUnknown_08792988 + 0x8f6c
    .4byte gUnknown_08792988 + 0x985c
    .4byte gUnknown_08792988 + 0xa12c
    .4byte gUnknown_08792988 + 0xa870
    .4byte gUnknown_08792988 + 0xb288
    .4byte gUnknown_08792988 + 0xbc54
    .4byte gUnknown_08792988 + 0xc548
    .4byte gUnknown_08792988 + 0xcd10
    .4byte gUnknown_08792988 + 0xd3b4
    .4byte gUnknown_08792988 + 0xd9b0
    .4byte gUnknown_08792988 + 0xdf84
    .4byte gUnknown_08792988 + 0xe4f0
    .4byte gUnknown_08792988 + 0xea38
    .4byte gUnknown_08792988 + 0x10518
    .4byte gUnknown_08792988 + 0x10a78
    .4byte gUnknown_08792988 + 0x11018
    .4byte gUnknown_08792988 + 0x115b0
    .4byte gUnknown_08792988 + 0x11b50

	.global gUnknown_08759128
gUnknown_08759128:  @ 0x08759128
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0x120e0
    .4byte gUnknown_08792988 + 0x120e0
    .4byte gUnknown_08792988 + 0x120e0
    .4byte gUnknown_08792988 + 0x120e0
    .4byte gUnknown_08792988 + 0x120e0

	.global gUnknown_087591BC
gUnknown_087591BC:  @ 0x087591BC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1508
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8072EF4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087591D4
gUnknown_087591D4:  @ 0x087591D4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e151c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8072F74
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087591EC
gUnknown_087591EC:  @ 0x087591EC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1530
        @ PROC_SLEEP
        .short 0xe, 0x64
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8072FD0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875920C
gUnknown_0875920C:  @ 0x0875920C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1544
        @ PROC_SLEEP
        .short 0xe, 0x64
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8073034
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875922C
gUnknown_0875922C:  @ 0x0875922C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1558
        @ PROC_SLEEP
        .short 0xe, 0x64
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80730AC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875924C
gUnknown_0875924C:  @ 0x0875924C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1570
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80731C8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08759264
gUnknown_08759264:  @ 0x08759264
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1580
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80732A4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8073240
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08759284
gUnknown_08759284:  @ 0x08759284
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1594
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80732E0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875929C
gUnknown_0875929C:  @ 0x0875929C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e15a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80733C0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087592B4
gUnknown_087592B4:  @ 0x087592B4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e15bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80734AC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087592CC
gUnknown_087592CC:  @ 0x087592CC
	.incbin "baserom.gba", 0x7592CC, 0x20

	.global gUnknown_087592EC
gUnknown_087592EC:  @ 0x087592EC
    .4byte gMid_Hp
    .4byte gMid_Str
    .4byte gMid_Skl
    .4byte gMid_Spd
    .4byte gMid_Lck
    .4byte gMid_Def
    .4byte gMid_Res
    .4byte gMid_Con

	.global gUnknown_0875930C
gUnknown_0875930C:  @ 0x0875930C
    .4byte gMid_Hp
    .4byte gMid_Mag
    .4byte gMid_Skl
    .4byte gMid_Spd
    .4byte gMid_Lck
    .4byte gMid_Def
    .4byte gMid_Res
    .4byte gMid_Con

	.global gUnknown_0875932C
gUnknown_0875932C:  @ 0x0875932C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e15dc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80739E0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8073A4C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8073CE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8073E18
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8073E48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8073E8C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8073FB4
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8073FE0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074040
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80740C8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807411C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807419C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80741CC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80742BC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80742EC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80742F8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80743C0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074544
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087593DC
gUnknown_087593DC:  @ 0x087593DC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e15e8
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_62
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074610
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087593FC
gUnknown_087593FC:  @ 0x087593FC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e15fc
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8074634
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074638
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875941C
gUnknown_0875941C:  @ 0x0875941C
	.incbin "baserom.gba", 0x75941C, 0x40

	.global gUnknown_0875945C
gUnknown_0875945C:  @ 0x0875945C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1610
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_807478C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074798
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80747A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08759484
gUnknown_08759484:  @ 0x08759484
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1620
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807490C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875949C
gUnknown_0875949C:  @ 0x0875949C
    .4byte gUnknown_085C48AC + 0x20
    .4byte gUnknown_085C48AC + 0x180
    .4byte gUnknown_085C48AC + 0x2f4
    .4byte gUnknown_085C48AC + 0x488
    .4byte gUnknown_085C48AC + 0x63c
    .4byte gUnknown_085C48AC + 0x814
    .4byte gUnknown_085C48AC + 0xa0c
    .4byte gUnknown_085C48AC + 0xc28
    .4byte gUnknown_085C48AC + 0xe3c
    .4byte gUnknown_085C48AC + 0xf6c
    .4byte gUnknown_085C48AC + 0x1034

	.global gUnknown_087594C8
gUnknown_087594C8:  @ 0x087594C8
    .4byte gUnknown_085BEF94 + 0x774
    .4byte gUnknown_085BEF94 + 0x774
    .4byte gUnknown_085BEF94 + 0x134c
    .4byte gUnknown_085BEF94 + 0x134c
    .4byte gUnknown_085BEF94 + 0x217c
    .4byte gUnknown_085BEF94 + 0x2d40
    .4byte gUnknown_085BEF94 + 0x3980
    .4byte gUnknown_085BEF94 + 0x4704
    .4byte gUnknown_085BEF94 + 0x5408
    .4byte gUnknown_085BEF94 + 0x5408
    .4byte gUnknown_085BEF94 + 0x5408

	.global gUnknown_087594F4
gUnknown_087594F4:  @ 0x087594F4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1658
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80749B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875950C
gUnknown_0875950C:  @ 0x0875950C
    .4byte gUnknown_085C60D4 + 0x20
    .4byte gUnknown_085C60D4 + 0x104
    .4byte gUnknown_085C60D4 + 0x1e8
    .4byte gUnknown_085C60D4 + 0x308
    .4byte gUnknown_085C60D4 + 0x428
    .4byte gUnknown_085C60D4 + 0x544

	.global gUnknown_08759524
gUnknown_08759524:  @ 0x08759524
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1680
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8074A54
        @ PROC_SLEEP
        .short 0xe, 0x18
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08759544
gUnknown_08759544:  @ 0x08759544
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e168c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074A94
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074AFC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08759564
gUnknown_08759564:  @ 0x08759564
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8074B38
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074B40
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875957C
gUnknown_0875957C:  @ 0x0875957C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e16f0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074E6C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074EDC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074F14
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087595A4
gUnknown_087595A4:  @ 0x087595A4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e16fc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074F80
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087595BC
gUnknown_087595BC:  @ 0x087595BC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1708
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80751BC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087595D4
gUnknown_087595D4:  @ 0x087595D4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e171c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8075308
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087595EC
gUnknown_087595EC:  @ 0x087595EC
    .4byte gUnknown_080E2B54 + 0xa00
    .4byte gUnknown_080E2B54 + 0xb14
    .4byte gUnknown_080E2B54 + 0xc38
    .4byte gUnknown_080E2B54 + 0xd10
    .4byte gUnknown_080E2B54 + 0xe2c
    .4byte gUnknown_080E2B54 + 0xf50

	.global gUnknown_08759604
gUnknown_08759604:  @ 0x08759604
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1750
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80753FC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875961C
gUnknown_0875961C:  @ 0x0875961C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1768
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807545C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08759634
gUnknown_08759634:  @ 0x08759634
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e177c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80756BC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875964C
gUnknown_0875964C:  @ 0x0875964C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1794
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8075828
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8075874
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875966C
gUnknown_0875966C:  @ 0x0875966C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e17ac
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80758D4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0x75966C + 0x18, 0x4C8 - 0x18

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
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e829c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word BattlePopup_Wait16Frames
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_DrawWRankUp
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_WaitWRankUp
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_DrawWRankUp2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_WaitWRankUp2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_DrawWpnBroke
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_WaitWpnBroke
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_DrawWpnBroke2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_WaitWpnBroke2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_MarkEnd
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_68
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0878D588
gUnknown_0878D588:  @ 0x0878D588
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e82a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word BattlePopup_Wait16Frames
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076250
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076290
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80762D0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076290
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_MarkEnd
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_68
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0878D5F0
gUnknown_0878D5F0:  @ 0x0878D5F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e82b4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076380
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80763E0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076400
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076464
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0878D620
gUnknown_0878D620:  @ 0x0878D620
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e82c8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076484
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80764B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076514
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


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
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80765CC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80765E4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80766E4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076640
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807669C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076A84
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076798
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80767F4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076818
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80768A0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80768F8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0x7F4324 + 0x68, 0x8

	.global gUnknown_087F4394
gUnknown_087F4394:  @ 0x087F4394
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e82dc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076934
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807699C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F43B4
gUnknown_087F43B4:  @ 0x087F43B4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e82f0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076A10
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076A78
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F43D4
gUnknown_087F43D4:  @ 0x087F43D4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e8304
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807707C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F43EC
gUnknown_087F43EC:  @ 0x087F43EC
    .4byte gUnknown_087F798C
    .4byte gUnknown_087F7DC8 + 0x408
    .4byte gUnknown_087F7DC8

	.global gUnknown_087F43F8
gUnknown_087F43F8:  @ 0x087F43F8
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8076C34
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8076C10
        @ PROC_SLEEP
        .short 0xe, 0xc
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x5a
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076C54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076D60
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076DE8
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076E00
        @ PROC_SLEEP
        .short 0xe, 0x16
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F4458
gUnknown_087F4458:  @ 0x087F4458
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8076C34
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8076C10
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076C54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076D60
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076DE8
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076E00
        @ PROC_SLEEP
        .short 0xe, 0x16
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F44B0
gUnknown_087F44B0:  @ 0x087F44B0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8076F28
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8076F08
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076F48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076FD0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076FD4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F44E0
gUnknown_087F44E0:  @ 0x087F44E0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80771E4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F44F8
gUnknown_087F44F8:  @ 0x087F44F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077310
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077394
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F4518
gUnknown_087F4518:  @ 0x087F4518
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80773BC
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08801810
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80773E4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077460
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F4548
gUnknown_087F4548:  @ 0x087F4548
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83bc
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8077678
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807759C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80775E8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807766C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F4578
gUnknown_087F4578:  @ 0x087F4578
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83d0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80777E0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807789C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077AA8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F45A0
gUnknown_087F45A0:  @ 0x087F45A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83e0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077AEC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077B5C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077BB4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077C24
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


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
	.incbin "baserom.gba", 0x8017E0, 0x20

	.global gUnknown_08801800
gUnknown_08801800:  @ 0x08801800
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077D30
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077D38

	.global gUnknown_08801810
gUnknown_08801810:  @ 0x08801810
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8077E9C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077DC8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077E64
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077E6C
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gUnknown_08801840
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08801840
gUnknown_08801840:  @ 0x08801840
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077F04
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077F10
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08801858
gUnknown_08801858:  @ 0x08801858
	.incbin "baserom.gba", 0x801858, 0x8

	.global gUnknown_08801860
gUnknown_08801860:  @ 0x08801860
	.incbin "baserom.gba", 0x801860, 0x8

	.global gUnknown_08801868
gUnknown_08801868:  @ 0x08801868
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83f0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8078078
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08801880
gUnknown_08801880:  @ 0x08801880
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e8400
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8078174
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807819C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_088018A0
gUnknown_088018A0:  @ 0x088018A0
	.incbin "baserom.gba", 0x8018A0, 0x20C

	.global gUnknown_08801AAC
gUnknown_08801AAC:  @ 0x08801AAC
    .4byte gUnknown_088018A0 + 0x1f6
    .4byte gUnknown_088018A0 + 0x154

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
 

