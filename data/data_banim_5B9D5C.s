	.section .data

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

	.global gProc_ekrChienCHR
gProc_ekrChienCHR:  @ 0x085B9D94
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80daf34
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EkrChienCHRMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProc_efxAnimeDrvProc
gProc_efxAnimeDrvProc:  @ 0x085B9DAC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80daf40
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ExecAllAIS
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_ekrUnitMainMini
ProcScr_ekrUnitMainMini:  @ 0x085B9DC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80daf50
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EkrUnitMainMiniMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProc_ekrTogiInit
gProc_ekrTogiInit:  @ 0x085B9DDC
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


	.global gProc_ekrTogiEnd
gProc_ekrTogiEnd:  @ 0x085B9E0C
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


	.global gProc_ekrTogiColor
gProc_ekrTogiColor:  @ 0x085B9E34
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

@ Following are some animation scripts. these contain pointers, sometimes
@ packed with other data into one word. Ideally there'd be some macros here
@ based on the decoding in animedrv.c - but I think the alignment guarantees
@ that shifting the objects referenced here doesn't affect the other data.

	.global gUnknown_085C71E4
gUnknown_085C71E4:  @ 0x085C71E4
@ Replacing .incbin "baserom.gba", 0x5C71E4, 0xC8
    .4byte gUnknown_085C6730 + 0x299
    .4byte gUnknown_085C6730 + 0x2d5
    .4byte gUnknown_085C6730 + 0x329
    .4byte gUnknown_085C6730 + 0x395
    .4byte gUnknown_085C6730 + 0x419
    .4byte gUnknown_085C6730 + 0x49d
    .4byte gUnknown_085C6730 + 0x52d
    .4byte gUnknown_085C6730 + 0x5bd
    .4byte gUnknown_085C6730 + 0x641
    .4byte gUnknown_085C6730 + 0x6c5
    .4byte gUnknown_085C6730 + 0x755
    .4byte gUnknown_085C6730 + 0x7e5
    .4byte gUnknown_085C6730 + 0x881
    .4byte gUnknown_085C6730 + 0x91d
    .4byte gUnknown_085C6730 + 0x9b9
    .4byte 0x20000000 + gUnknown_085C6730 + 0xa4a
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

	.global gUnknown_085C72AC
gUnknown_085C72AC:  @ 0x085C72AC
    .4byte 0x10000000 + gUnknown_085C71E4 + 0x44
    .4byte 0x80000000

	.global gUnknown_085C72B4
gUnknown_085C72B4:  @ 0x085C72B4
	.incbin "baserom.gba", 0x5C72B4, 0x84

	.global gUnknown_085C7338
gUnknown_085C7338:  @ 0x085C7338
    .4byte 0x10000000 + gUnknown_085C72B4
    .4byte 0x80000000

	.global gUnknown_085C7340
gUnknown_085C7340:  @ 0x085C7340
    .incbin "baserom.gba", 0x5C7340, 0x78

	.global gUnknown_085C73B8
gUnknown_085C73B8:  @ 0x085C73B8
    .4byte 0x10000000 + gUnknown_085C7340
    .4byte 0x80000000

	.global gUnknown_085C73C0
gUnknown_085C73C0:  @ 0x085C73C0
	.incbin "baserom.gba", 0x5C73C0, 0x78

	.global gUnknown_085C7438
gUnknown_085C7438:  @ 0x085C7438
    .4byte 0x10000000 + gUnknown_085C73C0
    .4byte 0x80000000

	.global gUnknown_085C7440
gUnknown_085C7440:  @ 0x085C7440
	.incbin "baserom.gba", 0x5C7440, 0xD64

	.global gUnknown_085C81A4
gUnknown_085C81A4:  @ 0x085C81A4
@ Replacing .incbin "baserom.gba", 0x5C81A4, 0x74
    .4byte gUnknown_085C7438 + 0x7d
    .4byte gUnknown_085C7438 + 0xa1
    .4byte gUnknown_085C7438 + 0xc5
    .4byte gUnknown_085C7438 + 0xe9
    .4byte gUnknown_085C7438 + 0x125
    .4byte gUnknown_085C7438 + 0x161
    .4byte gUnknown_085C7438 + 0x19d
    .4byte gUnknown_085C7438 + 0x1e5
    .4byte gUnknown_085C7438 + 0x22d
    .4byte gUnknown_085C7438 + 0x275
    .4byte gUnknown_085C7438 + 0x2c9
    .4byte gUnknown_085C7438 + 0x31d
    .4byte gUnknown_085C7438 + 0x371
    .4byte gUnknown_085C7438 + 0x3d1
    .4byte gUnknown_085C7438 + 0x431
    .4byte gUnknown_085C7438 + 0x491
    .4byte gUnknown_085C7438 + 0x4fd
    .4byte gUnknown_085C7438 + 0x569
    .4byte gUnknown_085C7438 + 0x5d5
    .4byte gUnknown_085C7438 + 0x64d
    .4byte gUnknown_085C7438 + 0x6c5
    .4byte gUnknown_085C7438 + 0x73d
    .4byte gUnknown_085C7438 + 0x7b5
    .4byte gUnknown_085C7438 + 0x82d
    .4byte 0x70000000 + gUnknown_085C7438 + 0x8a7
    .4byte 0x84000013
    .4byte 0x70000000 + gUnknown_085C7438 + 0x91f
    .4byte 0x84000013
    .4byte 0x80000000

	.global gUnknown_085C8218
gUnknown_085C8218:  @ 0x085C8218
@ Replacing .incbin "baserom.gba", 0x5C8218, 0x60
    .4byte gUnknown_085C7438 + 0x935
    .4byte gUnknown_085C7438 + 0x94d
    .4byte gUnknown_085C7438 + 0x965
    .4byte gUnknown_085C7438 + 0x97d
    .4byte gUnknown_085C7438 + 0x9a1
    .4byte gUnknown_085C7438 + 0x9c5
    .4byte gUnknown_085C7438 + 0x9e9
    .4byte gUnknown_085C7438 + 0xa19
    .4byte gUnknown_085C7438 + 0xa49
    .4byte gUnknown_085C7438 + 0xa79
    .4byte gUnknown_085C7438 + 0xab5
    .4byte gUnknown_085C7438 + 0xaf1
    .4byte gUnknown_085C7438 + 0xb2d
    .4byte gUnknown_085C7438 + 0xb75
    .4byte gUnknown_085C7438 + 0xbbd
    .4byte gUnknown_085C7438 + 0xc05
    .4byte gUnknown_085C7438 + 0xc4d
    .4byte gUnknown_085C7438 + 0xc95
    .4byte gUnknown_085C7438 + 0xcdd
    .4byte 0x70000000 + gUnknown_085C7438 + 0xd27
    .4byte 0x84000013
    .4byte 0x70000000 + gUnknown_085C7438 + 0x91f
    .4byte 0x84000013
    .4byte 0x80000000

	.global gUnknown_085C8278
gUnknown_085C8278:  @ 0x085C8278
	.incbin "baserom.gba", 0x5C8278, 0xFF8

	.global gUnknown_085C9270
gUnknown_085C9270:  @ 0x085C9270
@ Replacing .incbin "baserom.gba", 0x5C9270, 0x30
    .4byte gUnknown_085C8278 + 0x802
    .4byte gUnknown_085C8278 + 0x832
    .4byte gUnknown_085C8278 + 0x87a
    .4byte gUnknown_085C8278 + 0x8ce
    .4byte gUnknown_085C8278 + 0x922
    .4byte gUnknown_085C8278 + 0x976
    .4byte gUnknown_085C8278 + 0x9ca
    .4byte gUnknown_085C8278 + 0xa1e
    .4byte gUnknown_085C8278 + 0xa72
    .4byte gUnknown_085C8278 + 0xac6
    .4byte gUnknown_085C8278 + 0xb1a
    .4byte 0x80000000

	.global gUnknown_085C92A0
gUnknown_085C92A0:  @ 0x085C92A0
@ Replacing .incbin "baserom.gba", 0x5C92A0, 0x30
    .4byte gUnknown_085C8278 + 0xb6d
    .4byte gUnknown_085C8278 + 0xb91
    .4byte gUnknown_085C8278 + 0xbc1
    .4byte gUnknown_085C8278 + 0xbf2
    .4byte gUnknown_085C8278 + 0xc22
    .4byte gUnknown_085C8278 + 0xc53
    .4byte gUnknown_085C8278 + 0xc22
    .4byte gUnknown_085C8278 + 0xc82
    .4byte gUnknown_085C8278 + 0xcb1
    .4byte 0x60000000 + gUnknown_085C8278 + 0xce0
    .4byte 0x20000000 + gUnknown_085C8278 + 0xd10
    .4byte 0x80000000

	.global gUnknown_085C92D0
gUnknown_085C92D0:  @ 0x085C92D0
	.incbin "baserom.gba", 0x5C92D0, 0x1C

	.global gUnknown_085C92EC
gUnknown_085C92EC:  @ 0x085C92EC
@ Replacing .incbin "baserom.gba", 0x5C92EC, 0x3C
    .4byte gUnknown_085C8278 + 0xe91
    .4byte 0x10000000 + gUnknown_085C8278 + 0xd88
    .4byte 0x80000000
    .4byte gUnknown_085C8278 + 0xda1
    .4byte gUnknown_085C8278 + 0xdb9
    .4byte gUnknown_085C8278 + 0xdd1
    .4byte gUnknown_085C8278 + 0xdea
    .4byte gUnknown_085C8278 + 0xe02
    .4byte gUnknown_085C8278 + 0xe1b
    .4byte gUnknown_085C8278 + 0xe02
    .4byte gUnknown_085C8278 + 0xe32
    .4byte gUnknown_085C8278 + 0xe49
    .4byte 0x60000000 + gUnknown_085C8278 + 0xe60
    .4byte 0x20000000 + gUnknown_085C8278 + 0xe78
    .4byte 0x80000000

	.global gUnknown_085C9328
gUnknown_085C9328:  @ 0x085C9328
@ Replacing .incbin "baserom.gba", 0x5C9328, 0x6848
    .4byte 0x10000000 + gUnknown_085C8278 + 0xe9c
    .4byte gUnknown_085C8278 + 0xec2
    .4byte gUnknown_085C8278 + 0xee5
    .4byte gUnknown_085C8278 + 0xf09
    .4byte gUnknown_085C8278 + 0xf2d
    .4byte gUnknown_085C8278 + 0xf51
    .4byte gUnknown_085C8278 + 0xf69
    .4byte gUnknown_085C8278 + 0xf8d
    .4byte gUnknown_085C8278 + 0xfb1
    .4byte gUnknown_085C8278 + 0xfd5
    .4byte gUnknown_085C8278 + 0xe91
    .4byte 0x10000000 + gUnknown_085C8278 + 0xd88
    .4byte 0x80000000

	.global gUnknown_085C935C
gUnknown_085C935C:  @ 0x085C935C
    .incbin "baserom.gba", 0x5C935C, 0x6814

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
@ Replacing .incbin "baserom.gba", 0x5D1470, 0x39F0
    .4byte 0x7fff5355
    .4byte 0x7f007ff8
    .4byte 0x54007d40
    .4byte 0x137f3400
    .4byte 0x001801ff
    .4byte 0x0007000c
    .4byte 0x33ec63f7
    .4byte 0x016012a4
    .4byte 0x0004b010
    .4byte 0xf000003f
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xff01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0e101
    .4byte 0x01f001f0
    .4byte 0x08230472
    .4byte 0x231c0710
    .4byte 0x1cf0720c
    .4byte 0x01a001f0
    .4byte 0x02000403
    .4byte 0x01040104
    .4byte 0x70000200
    .4byte 0xf01cf003
    .4byte 0x0501c001
    .4byte 0x1c040404
    .4byte 0xf0050004
    .4byte 0xf001f018
    .4byte 0x0f040c3b
    .4byte 0x0508040c
    .4byte 0x01f0b920
    .4byte 0xb38001f0
    .4byte 0x0c020c00
    .4byte 0x08010c01
    .4byte 0x03083902
    .4byte 0x01f03df0
    .4byte 0x230c2bb1
    .4byte 0x231f0720
    .4byte 0x3bf07204
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0ff01
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf0f001f0
    .4byte 0xf001f001
    .4byte 0x00012001
    .4byte 0x0004b010
    .4byte 0xf000003f
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xff01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x07019084
    .4byte 0xd0040604
    .4byte 0x60000613
    .4byte 0xf028f007
    .4byte 0x040a0001
    .4byte 0x08410409
    .4byte 0x00083da0
    .4byte 0xf00a0009
    .4byte 0x01f0c128
    .4byte 0x040d0100
    .4byte 0x600b040c
    .4byte 0x000b073d
    .4byte 0xf00d000c
    .4byte 0x4001f024
    .4byte 0x04100401
    .4byte 0x200e040f
    .4byte 0x1c000e3d
    .4byte 0xf010000f
    .4byte 0x8001f020
    .4byte 0x47041201
    .4byte 0x113b2011
    .4byte 0x1cf01200
    .4byte 0x01f001f0
    .4byte 0x270100bc
    .4byte 0x01f012f0
    .4byte 0x012001f0
    .4byte 0x2b71002a
    .4byte 0x01f03ff0
    .4byte 0x110cb3b0
    .4byte 0x1cb3200c
    .4byte 0xf0081208
    .4byte 0x8101f03f
    .4byte 0x200f0c2b
    .4byte 0x3b200e0c
    .4byte 0x080f080e
    .4byte 0xf0087010
    .4byte 0x4101f07f
    .4byte 0x0c0c0ca3
    .4byte 0x3920c30b
    .4byte 0x0c08a321
    .4byte 0x3d000d08
    .4byte 0xf0833ff0
    .4byte 0x090c0a01
    .4byte 0x3960080c
    .4byte 0x080f1b22
    .4byte 0x200a0809
    .4byte 0xf03f303d
    .4byte 0x33936233
    .4byte 0x39a0060c
    .4byte 0x07089322
    .4byte 0x01f03b40
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0f801
    .4byte 0x01f001f0
    .4byte 0x017001f0
    .4byte 0x0004b010
    .4byte 0xf000003e
    .4byte 0xf001f001
    .4byte 0x3001f001
    .4byte 0x04181401
    .4byte 0x15f00413
    .4byte 0x00130170
    .4byte 0x14f0c114
    .4byte 0x04170140
    .4byte 0xf0150416
    .4byte 0x0140833d
    .4byte 0x00160015
    .4byte 0x6016f017
    .4byte 0x041a0601
    .4byte 0xf0180419
    .4byte 0x1801003d
    .4byte 0x0019000c
    .4byte 0xa016f01a
    .4byte 0x10041d01
    .4byte 0xe01b041c
    .4byte 0x1c001b3d
    .4byte 0xf01d6000
    .4byte 0x1f01e02c
    .4byte 0x22041e04
    .4byte 0x223da083
    .4byte 0x1f001e00
    .4byte 0x01f028f0
    .4byte 0x21010088
    .4byte 0x3ba02004
    .4byte 0xff210020
    .4byte 0x01f024f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x6001f0c7
    .4byte 0x26003301
    .4byte 0x01f014f0
    .4byte 0x108701f0
    .4byte 0x0036083b
    .4byte 0xf03ff037
    .4byte 0x9f01f001
    .4byte 0x0c270120
    .4byte 0x01f03ff0
    .4byte 0x3ff001f0
    .4byte 0xc18801f0
    .4byte 0x0c200ca3
    .4byte 0x2108a3a1
    .4byte 0x3ff0e108
    .4byte 0x1b0201f0
    .4byte 0x220c1e0c
    .4byte 0x22073ba0
    .4byte 0x1f081e08
    .4byte 0x3f503d00
    .4byte 0x428633f0
    .4byte 0x0c1c0c93
    .4byte 0x2239a01b
    .4byte 0x1c1e0893
    .4byte 0x3d201d08
    .4byte 0x35f03f10
    .4byte 0x180c0b23
    .4byte 0xf0180c19
    .4byte 0x080b131b
    .4byte 0x1a700819
    .4byte 0x01f03d40
    .4byte 0x160c8303
    .4byte 0xf0c3150c
    .4byte 0x08835339
    .4byte 0xf0170816
    .4byte 0x33fb533d
    .4byte 0x39f0130c
    .4byte 0x1408fb93
    .4byte 0x01f03bf0
    .4byte 0x8001f0c0
    .4byte 0x00000001
    .4byte 0x0004b010
    .4byte 0xd0000021
    .4byte 0x13041401
    .4byte 0x8c15f004
    .4byte 0x001301b0
    .4byte 0x0014f014
    .4byte 0x18041701
    .4byte 0xf0150416
    .4byte 0x1501803d
    .4byte 0x00301600
    .4byte 0x2016f017
    .4byte 0x19041a01
    .4byte 0xf0186004
    .4byte 0x1801403d
    .4byte 0x1a001900
    .4byte 0x6016f0c1
    .4byte 0x1c041d01
    .4byte 0x3df01b04
    .4byte 0x1b010083
    .4byte 0x1d001c00
    .4byte 0x01a016f0
    .4byte 0x1e041f04
    .4byte 0x3de02204
    .4byte 0x1e180022
    .4byte 0x2cf01f00
    .4byte 0x042101e0
    .4byte 0x3be08f20
    .4byte 0xf0210020
    .4byte 0xf001f028
    .4byte 0xff01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x2401a083
    .4byte 0x26002500
    .4byte 0x01f016f0
    .4byte 0x0001f081
    .4byte 0x00280824
    .4byte 0xe13ff029
    .4byte 0x01f001f0
    .4byte 0x0c270100
    .4byte 0x3ff0002c
    .4byte 0xf001f0ff
    .4byte 0xf03ff001
    .4byte 0xf001f01d
    .4byte 0xf03ff03f
    .4byte 0x0c210801
    .4byte 0x1be20c20
    .4byte 0xe1082108
    .4byte 0x33f03f70
    .4byte 0x1e0c9342
    .4byte 0x3be0220c
    .4byte 0x1e082207
    .4byte 0x3d001f08
    .4byte 0x35f03f30
    .4byte 0x0c0b2386
    .4byte 0xe01b0c1c
    .4byte 0x080b2339
    .4byte 0x1d081c1c
    .4byte 0x01f03d20
    .4byte 0x190c8323
    .4byte 0xf0180c30
    .4byte 0x08835339
    .4byte 0xc31a0819
    .4byte 0xfb333df0
    .4byte 0x150c160c
    .4byte 0xfb9339f0
    .4byte 0x0816080c
    .4byte 0x143df017
    .4byte 0xc8130c73
    .4byte 0x73d439f0
    .4byte 0x3b001408
    .4byte 0x0004b010
    .4byte 0xb0000020
    .4byte 0x16041701
    .4byte 0x04601504
    .4byte 0x01d015d0
    .4byte 0x00160015
    .4byte 0x16f08117
    .4byte 0x19041a00
    .4byte 0x3df01804
    .4byte 0x18018083
    .4byte 0x1a001900
    .4byte 0x012016f0
    .4byte 0x1c041d06
    .4byte 0x3df01b04
    .4byte 0x0c1b0140
    .4byte 0x1d001c00
    .4byte 0x016016f0
    .4byte 0x1e18041f
    .4byte 0x3df02204
    .4byte 0x00220100
    .4byte 0x1f00311e
    .4byte 0x01a016f0
    .4byte 0xf0200421
    .4byte 0x01008f3b
    .4byte 0xf0210020
    .4byte 0xf001f014
    .4byte 0xff01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x2d01808f
    .4byte 0x14f02e00
    .4byte 0x01f001f0
    .4byte 0x2f070100
    .4byte 0x31003000
    .4byte 0x01f03ff0
    .4byte 0x000301f0
    .4byte 0x0032082f
    .4byte 0xf03ff032
    .4byte 0x01f08101
    .4byte 0x34082d00
    .4byte 0x3d003500
    .4byte 0xf03ff0e1
    .4byte 0x0001f001
    .4byte 0xf00c2600
    .4byte 0x01f0ff3f
    .4byte 0x3ff001f0
    .4byte 0x1ff03f10
    .4byte 0x3ff001f0
    .4byte 0xf0c63f30
    .4byte 0x0c93421b
    .4byte 0x15f00c20
    .4byte 0x38089302
    .4byte 0x3f500821
    .4byte 0x0b231df0
    .4byte 0x610c1e0c
    .4byte 0x133bf022
    .4byte 0x081e080b
    .4byte 0xe13d001f
    .4byte 0x1df03f10
    .4byte 0x1c0c8303
    .4byte 0x19f01b0c
    .4byte 0x08835386
    .4byte 0x201d081c
    .4byte 0x1a01f03d
    .4byte 0x0c190c0c
    .4byte 0x9339f018
    .4byte 0x201908fb
    .4byte 0x3df01a08
    .4byte 0x160c1700
    .4byte 0xf015600c
    .4byte 0x0873d439
    .4byte 0x08170816
    .4byte 0x0004b010
    .4byte 0xb0000020
    .4byte 0x19041a01
    .4byte 0x04601804
    .4byte 0x01d015d0
    .4byte 0x00190018
    .4byte 0x16f0811a
    .4byte 0x1c041d00
    .4byte 0x3df01b04
    .4byte 0x1b018083
    .4byte 0x1d001c00
    .4byte 0x012016f0
    .4byte 0x1e041f06
    .4byte 0x3df02204
    .4byte 0x0c220140
    .4byte 0x1f001e00
    .4byte 0x016016f0
    .4byte 0x20630421
    .4byte 0x01403bf0
    .4byte 0xf0210020
    .4byte 0xff01f014
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0c101
    .4byte 0x00380120
    .4byte 0xf03a0039
    .4byte 0x01f0c016
    .4byte 0x3b0001f0
    .4byte 0x3d003c00
    .4byte 0x003e000e
    .4byte 0xf01af02e
    .4byte 0x3f01c001
    .4byte 0x00400000
    .4byte 0x00420041
    .4byte 0x3ff0e043
    .4byte 0x01e001f0
    .4byte 0x0c250c26
    .4byte 0x460c0329
    .4byte 0x48004700
    .4byte 0x01f03ff0
    .4byte 0x003ff0c1
    .4byte 0x4d004c3f
    .4byte 0x3f204e00
    .4byte 0xf01ff0ef
    .4byte 0x523ff001
    .4byte 0x1bf03f20
    .4byte 0x01f001f0
    .4byte 0xf03f30e3
    .4byte 0x0c0b2317
    .4byte 0x15f00c20
    .4byte 0x081c0b43
    .4byte 0x3f300821
    .4byte 0x83031bf0
    .4byte 0x0c301e0c
    .4byte 0x5319f022
    .4byte 0x081e0883
    .4byte 0x3d20c11f
    .4byte 0x0c1d01f0
    .4byte 0xf01b0c1c
    .4byte 0xfb938439
    .4byte 0x1d081c08
    .4byte 0x1a003df0
    .4byte 0x0c190c0c
    .4byte 0xd439f018
    .4byte 0x00190873
    .4byte 0x00081a08
    .4byte 0x0004b010
    .4byte 0xb0000020
    .4byte 0x1c041d01
    .4byte 0x04601b04
    .4byte 0x01d015d0
    .4byte 0x001c001b
    .4byte 0x16f0811d
    .4byte 0x1e041f00
    .4byte 0x3df02204
    .4byte 0x22018083
    .4byte 0x1f001e00
    .4byte 0x012016f0
    .4byte 0x20042118
    .4byte 0x01803bf0
    .4byte 0xff210020
    .4byte 0x01f014f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0ff01
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf0c001f0
    .4byte 0x0001f001
    .4byte 0x00390038
    .4byte 0x16f0e03a
    .4byte 0x01f001f0
    .4byte 0x3c003b00
    .4byte 0x005b1c00
    .4byte 0xf03ff05c
    .4byte 0x3f01e001
    .4byte 0x00610100
    .4byte 0x00630062
    .4byte 0xc03ff064
    .4byte 0x01e001f0
    .4byte 0x00670c26
    .4byte 0x69070068
    .4byte 0x6b006a00
    .4byte 0x1ff03f00
    .4byte 0xf08301f0
    .4byte 0x6f006e3f
    .4byte 0x1af07000
    .4byte 0xf0df01f0
    .4byte 0x713f2001
    .4byte 0x01f016f0
    .4byte 0x3f4001f0
    .4byte 0x039813f0
    .4byte 0xf0200c83
    .4byte 0x08839317
    .4byte 0xf0c30821
    .4byte 0x0cfb2315
    .4byte 0xf0220c1e
    .4byte 0x08fb933b
    .4byte 0x1f081e08
    .4byte 0x1d003df0
    .4byte 0x0c1c180c
    .4byte 0xd439f01b
    .4byte 0x081c0873
    .4byte 0x00081d00
    .4byte 0x0004b010
    .4byte 0xb0000020
    .4byte 0x1e041f01
    .4byte 0x04602204
    .4byte 0x01d015d0
    .4byte 0x001e0022
    .4byte 0x16f0861f
    .4byte 0x20042100
    .4byte 0x01c03bf0
    .4byte 0x21003f20
    .4byte 0x01f014f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0ff01
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf0ff01f0
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xe001f001
    .4byte 0x01f001f0
    .4byte 0x003801c0
    .4byte 0xe0450044
    .4byte 0x01f016f0
    .4byte 0x3b0001f0
    .4byte 0x1c004900
    .4byte 0xf04b004a
    .4byte 0xe001f03f
    .4byte 0x47003f01
    .4byte 0x503b004f
    .4byte 0x3f005100
    .4byte 0x01f01df0
    .4byte 0x5301b088
    .4byte 0x3f005400
    .4byte 0xf7560055
    .4byte 0x01f01af0
    .4byte 0x3f2001f0
    .4byte 0xf016f057
    .4byte 0xfc01f001
    .4byte 0x13f03f40
    .4byte 0x01f001f0
    .4byte 0xfb4301f0
    .4byte 0x0c62200c
    .4byte 0xfbc315f0
    .4byte 0xf0082108
    .4byte 0x0c0c1f15
    .4byte 0xf0220c1e
    .4byte 0x0873d43b
    .4byte 0x1f08001e
    .4byte 0x00000008
    .4byte 0x0004b010
    .4byte 0xb0000021
    .4byte 0x20042101
    .4byte 0x8313d004
    .4byte 0x000001f0
    .4byte 0xf0210020
    .4byte 0xff01f014
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0ff01
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf0ff01f0
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xfc01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x018001f0
    .4byte 0x591c0058
    .4byte 0x16f05a00
    .4byte 0x01f001f0
    .4byte 0x00035d00
    .4byte 0x005f005e
    .4byte 0xf018f060
    .4byte 0x01e08b01
    .4byte 0x00660065
    .4byte 0x18f05f3b
    .4byte 0xf08701f0
    .4byte 0x006c0001
    .4byte 0xf03f006d
    .4byte 0xff01f017
    .4byte 0x3f3001f0
    .4byte 0x01f013f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x8401f0c6
    .4byte 0x0c200c73
    .4byte 0x01f015f0
    .4byte 0x21080020
    .4byte 0x00000008
    .4byte 0x0004b010
    .4byte 0xf000003f
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xff01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0ff01
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf0ff01f0
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xff01f001
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf001f0ff
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0xf001f001
    .4byte 0x01f0ff01
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0x01f001f0
    .4byte 0xf0f801f0
    .4byte 0xf001f001
    .4byte 0x7001f001
    .4byte 0x00000001
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
    .4byte gUnknown_085D1470 + 0x9c9
    .4byte gUnknown_085D1470 + 0x9ed
    .4byte gUnknown_085D1470 + 0xa35
    .4byte gUnknown_085D1470 + 0xaa1
    .4byte gUnknown_085D1470 + 0xaf5
    .4byte gUnknown_085D1470 + 0xba9
    .4byte gUnknown_085D1470 + 0xc09
    .4byte gUnknown_085D1470 + 0xcbd
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0xcbd
    .4byte gUnknown_085D1470 + 0xc09
    .4byte gUnknown_085D1470 + 0xba9
    .4byte gUnknown_085D1470 + 0xaf5
    .4byte gUnknown_085D1470 + 0xaa1
    .4byte gUnknown_085D1470 + 0xa35
    .4byte gUnknown_085D1470 + 0x9ed
    .4byte gUnknown_085D1470 + 0x9c9
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
    .4byte gUnknown_085D1470 + 0xe01
    .4byte gUnknown_085D1470 + 0xe25
    .4byte gUnknown_085D1470 + 0xe79
    .4byte gUnknown_085D1470 + 0xefd
    .4byte gUnknown_085D1470 + 0xf99
    .4byte gUnknown_085D1470 + 0x104d
    .4byte gUnknown_085D1470 + 0x1125
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x122d
    .4byte gUnknown_085D1470 + 0x1251
    .4byte gUnknown_085D1470 + 0x1281
    .4byte gUnknown_085D1470 + 0x12ed
    .4byte gUnknown_085D1470 + 0x1359
    .4byte gUnknown_085D1470 + 0x1425
    .4byte gUnknown_085D1470 + 0x14e5
    .4byte gUnknown_085D1470 + 0x158d
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x122d
    .4byte gUnknown_085D1470 + 0x164d
    .4byte gUnknown_085D1470 + 0x167d
    .4byte gUnknown_085D1470 + 0x16e9
    .4byte gUnknown_085D1470 + 0x1755
    .4byte gUnknown_085D1470 + 0x1821
    .4byte gUnknown_085D1470 + 0x18e1
    .4byte gUnknown_085D1470 + 0x1989
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x1125
    .4byte gUnknown_085D1470 + 0x104d
    .4byte gUnknown_085D1470 + 0xf99
    .4byte gUnknown_085D1470 + 0xefd
    .4byte gUnknown_085D1470 + 0xe79
    .4byte gUnknown_085D1470 + 0xe25
    .4byte gUnknown_085D1470 + 0xe01
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x158d
    .4byte gUnknown_085D1470 + 0x14e5
    .4byte gUnknown_085D1470 + 0x1425
    .4byte gUnknown_085D1470 + 0x1359
    .4byte gUnknown_085D1470 + 0x12ed
    .4byte gUnknown_085D1470 + 0x1281
    .4byte gUnknown_085D1470 + 0x1251
    .4byte gUnknown_085D1470 + 0x122d
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x1989
    .4byte gUnknown_085D1470 + 0x18e1
    .4byte gUnknown_085D1470 + 0x1821
    .4byte gUnknown_085D1470 + 0x1755
    .4byte gUnknown_085D1470 + 0x16e9
    .4byte gUnknown_085D1470 + 0x167d
    .4byte gUnknown_085D1470 + 0x164d
    .4byte gUnknown_085D1470 + 0x122d
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
    .4byte gUnknown_085D1470 + 0x1b1a
    .4byte gUnknown_085D1470 + 0x1b32
    .4byte gUnknown_085D1470 + 0x21f2
    .4byte gUnknown_085D1470 + 0x1b79
    .4byte gUnknown_085D1470 + 0x1bfd
    .4byte gUnknown_085D1470 + 0x1c99
    .4byte gUnknown_085D1470 + 0x1dd1
    .4byte gUnknown_085D1470 + 0x1d35
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x1b1a
    .4byte gUnknown_085D1470 + 0x1e9e
    .4byte gUnknown_085D1470 + 0x2276
    .4byte gUnknown_085D1470 + 0x1ee5
    .4byte gUnknown_085D1470 + 0x1f69
    .4byte gUnknown_085D1470 + 0x1fed
    .4byte gUnknown_085D1470 + 0x2125
    .4byte gUnknown_085D1470 + 0x2089
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x1d35
    .4byte gUnknown_085D1470 + 0x1dd1
    .4byte gUnknown_085D1470 + 0x1c99
    .4byte gUnknown_085D1470 + 0x1bfd
    .4byte gUnknown_085D1470 + 0x1b79
    .4byte gUnknown_085D1470 + 0x21f2
    .4byte gUnknown_085D1470 + 0x1b32
    .4byte gUnknown_085D1470 + 0x1b1a
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x2089
    .4byte gUnknown_085D1470 + 0x2125
    .4byte gUnknown_085D1470 + 0x1fed
    .4byte gUnknown_085D1470 + 0x1f69
    .4byte gUnknown_085D1470 + 0x1ee5
    .4byte gUnknown_085D1470 + 0x2276
    .4byte gUnknown_085D1470 + 0x1e9e
    .4byte gUnknown_085D1470 + 0x1b1a
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
    .4byte gUnknown_085D1470 + 0x238a
    .4byte gUnknown_085D1470 + 0x23a2
    .4byte gUnknown_085D1470 + 0x2eb2
    .4byte gUnknown_085D1470 + 0x23c5
    .4byte gUnknown_085D1470 + 0x23f5
    .4byte gUnknown_085D1470 + 0x2455
    .4byte gUnknown_085D1470 + 0x24e5
    .4byte gUnknown_085D1470 + 0x258d
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x238a
    .4byte gUnknown_085D1470 + 0x264e
    .4byte gUnknown_085D1470 + 0x2f4e
    .4byte gUnknown_085D1470 + 0x2671
    .4byte gUnknown_085D1470 + 0x26ad
    .4byte gUnknown_085D1470 + 0x270d
    .4byte gUnknown_085D1470 + 0x27b5
    .4byte gUnknown_085D1470 + 0x2869
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x238a
    .4byte gUnknown_085D1470 + 0x2936
    .4byte gUnknown_085D1470 + 0x2ff6
    .4byte gUnknown_085D1470 + 0x2959
    .4byte gUnknown_085D1470 + 0x2989
    .4byte gUnknown_085D1470 + 0x29e9
    .4byte gUnknown_085D1470 + 0x2a91
    .4byte gUnknown_085D1470 + 0x2b45
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x238a
    .4byte gUnknown_085D1470 + 0x2c12
    .4byte gUnknown_085D1470 + 0x309e
    .4byte gUnknown_085D1470 + 0x2c35
    .4byte gUnknown_085D1470 + 0x2c65
    .4byte gUnknown_085D1470 + 0x2cb9
    .4byte gUnknown_085D1470 + 0x2d49
    .4byte gUnknown_085D1470 + 0x2df1
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x258d
    .4byte gUnknown_085D1470 + 0x24e5
    .4byte gUnknown_085D1470 + 0x2455
    .4byte gUnknown_085D1470 + 0x23f5
    .4byte gUnknown_085D1470 + 0x23c5
    .4byte gUnknown_085D1470 + 0x2eb2
    .4byte gUnknown_085D1470 + 0x23a2
    .4byte gUnknown_085D1470 + 0x238a
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x2869
    .4byte gUnknown_085D1470 + 0x27b5
    .4byte gUnknown_085D1470 + 0x270d
    .4byte gUnknown_085D1470 + 0x26ad
    .4byte gUnknown_085D1470 + 0x2671
    .4byte gUnknown_085D1470 + 0x2f4e
    .4byte gUnknown_085D1470 + 0x264e
    .4byte gUnknown_085D1470 + 0x238a
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x2b45
    .4byte gUnknown_085D1470 + 0x2a91
    .4byte gUnknown_085D1470 + 0x29e9
    .4byte gUnknown_085D1470 + 0x2989
    .4byte gUnknown_085D1470 + 0x2959
    .4byte gUnknown_085D1470 + 0x2ff6
    .4byte gUnknown_085D1470 + 0x2936
    .4byte gUnknown_085D1470 + 0x238a
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x2df1
    .4byte gUnknown_085D1470 + 0x2d49
    .4byte gUnknown_085D1470 + 0x2cb9
    .4byte gUnknown_085D1470 + 0x2c65
    .4byte gUnknown_085D1470 + 0x2c35
    .4byte gUnknown_085D1470 + 0x309e
    .4byte gUnknown_085D1470 + 0x2c12
    .4byte gUnknown_085D1470 + 0x238a
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
    .4byte gUnknown_085D1470 + 0x325a
    .4byte gUnknown_085D1470 + 0x37fa
    .4byte gUnknown_085D1470 + 0x3272
    .4byte gUnknown_085D1470 + 0x32ad
    .4byte gUnknown_085D1470 + 0x3835
    .4byte gUnknown_085D1470 + 0x3325
    .4byte gUnknown_085D1470 + 0x33cd
    .4byte gUnknown_085D1470 + 0x3481
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x325a
    .4byte gUnknown_085D1470 + 0x37fa
    .4byte gUnknown_085D1470 + 0x354e
    .4byte gUnknown_085D1470 + 0x3589
    .4byte gUnknown_085D1470 + 0x38c5
    .4byte gUnknown_085D1470 + 0x3601
    .4byte gUnknown_085D1470 + 0x3691
    .4byte gUnknown_085D1470 + 0x3739
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x3481
    .4byte gUnknown_085D1470 + 0x33cd
    .4byte gUnknown_085D1470 + 0x3325
    .4byte gUnknown_085D1470 + 0x3835
    .4byte gUnknown_085D1470 + 0x32ad
    .4byte gUnknown_085D1470 + 0x3272
    .4byte gUnknown_085D1470 + 0x37fa
    .4byte gUnknown_085D1470 + 0x325a
    .4byte 0x80000000
    .4byte gUnknown_085D1470 + 0x3739
    .4byte gUnknown_085D1470 + 0x3691
    .4byte gUnknown_085D1470 + 0x3601
    .4byte gUnknown_085D1470 + 0x38c5
    .4byte gUnknown_085D1470 + 0x3589
    .4byte gUnknown_085D1470 + 0x354e
    .4byte gUnknown_085D1470 + 0x37fa
    .4byte gUnknown_085D1470 + 0x325a
    .4byte 0x80000000

	.global gEkrSpellAnimLut
gEkrSpellAnimLut:  @ 0x085D4E60
@ Replacing .incbin "baserom.gba", 0x5D4E60, 0x130
    .4byte StartSpellAnimDummy
    .4byte StartSpellAnimHandAxe
    .4byte StartSpellAnimArrow
    .4byte StartSpellAnimJavelin
    .4byte sub_805C44C
    .4byte sub_805C4A8
    .4byte sub_805C504
    .4byte sub_805C560
    .4byte sub_805C5BC
    .4byte sub_805C618
    .4byte sub_805C674
    .4byte sub_805C6D0
    .4byte sub_805C72C
    .4byte sub_805C788
    .4byte StartSpellAnimSong
    .4byte StartSpellAnimDance
    .4byte sub_805CD0C
    .4byte nullsub_42
    .4byte sub_805CEC8
    .4byte StartSpellAnimFireBreath
    .4byte StartSpellAnimIceBreath
    .4byte StartSpellAnimDarkBreath
    .4byte StartSpellAnimFire
    .4byte StartSpellAnimElfire
    .4byte nullsub_41
    .4byte StartSpellAnimThunder
    .4byte sub_805E754
    .4byte StartSpellAnimFimbulvetr
    .4byte sub_805EB98
    .4byte sub_805EED8
    .4byte StartSpellAnimNosferatu
    .4byte sub_805F8B4
    .4byte StartSpellAnimPurge
    .4byte sub_8060284
    .4byte StartSpellAnimDivine
    .4byte nullsub_40
    .4byte sub_806028C
    .4byte StartSpellAnimFenrir
    .4byte StartSpellAnimHeal
    .4byte StartSpellAnimMend
    .4byte StartSpellAnimRecover
    .4byte sub_8061420
    .4byte sub_8061C18
    .4byte sub_8061C48
    .4byte sub_80620EC
    .4byte StartSpellAnimSilence
    .4byte StartSpellAnimSleep
    .4byte StartSpellAnimHammerne
    .4byte StartSpellAnimBerserk
    .4byte sub_8063214
    .4byte 0x00000000
    .4byte StartSpellAnimShine
    .4byte StartSpellAnimLuna
    .4byte sub_8064308
    .4byte nullsub_51
    .4byte StartSpellAnimAura
    .4byte sub_8065490
    .4byte nullsub_53
    .4byte sub_8065634
    .4byte sub_8065670
    .4byte sub_80656AC
    .4byte sub_80656E8
    .4byte StartSpellAnimStone
    .4byte StartSpellAnimIvaldi
    .4byte sub_8066514
    .4byte sub_8068B80
    .4byte StartSpellAnimCrimsonEye
    .4byte StartSpellAnimEvilEye
    .4byte sub_806AEF4
    .4byte sub_806B4F8
    .4byte StartSpellAnimNaglfar
    .4byte sub_80687E4
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

	.global gUnknown_085D4F90
gUnknown_085D4F90:  @ 0x085D4F90
	.incbin "baserom.gba", 0x5D4F90, 0x8

	.global ProcScr_efxResetRST
ProcScr_efxResetRST:  @ 0x085D4F98
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc860
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_805B444
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxResetRSTMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxTwoBaiRST
ProcScr_efxTwoBaiRST:  @ 0x085D4FB8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc86c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxTwoBaiRSTMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_DummvRST
ProcScr_DummvRST:  @ 0x085D4FD0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc87c
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_805B584
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word DummvRSTMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_EfxRestWIN
ProcScr_EfxRestWIN:  @ 0x085D4FF0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc888
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxRestWINMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_EfxRestWINH
ProcScr_EfxRestWINH:  @ 0x085D5008
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


	.global ProcScr_efxALPHA
ProcScr_efxALPHA:  @ 0x085D5028
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8a0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805BA64
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxCircleWIN
ProcScr_efxCircleWIN:  @ 0x085D5040
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8ac
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805BB84
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxMagicQUAKE
ProcScr_efxMagicQUAKE:  @ 0x085D5058
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxMagicQUAKE
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDummymagic
ProcScr_efxDummymagic:  @ 0x085D5070
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8cc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxDummymagic
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxTeono
ProcScr_efxTeono:  @ 0x085D5088
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8dc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805BF40
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxTeonoOBJ
ProcScr_efxTeonoOBJ:  @ 0x085D50A0
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


	.global ProcScr_efxTeonoOBJ2
ProcScr_efxTeonoOBJ2:  @ 0x085D50C0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8f4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C188
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxTeonoSE
ProcScr_efxTeonoSE:  @ 0x085D50D8
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


	.global ProcScr_efxArrow
ProcScr_efxArrow:  @ 0x085D50F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc910
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C29C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxArrowOBJ
ProcScr_efxArrowOBJ:  @ 0x085D5110
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc91c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C3C0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxTeyari
ProcScr_efxTeyari:  @ 0x085D5128
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc928
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C7E4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxTeyariOBJ
ProcScr_efxTeyariOBJ:  @ 0x085D5140
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc934
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxSong
ProcScr_efxSong:  @ 0x085D5158
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc944
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C96C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxSongBG
ProcScr_efxSongBG:  @ 0x085D5170
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

	.global ProcScr_efxSongOBJ
ProcScr_efxSongOBJ:  @ 0x085D5260
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9c4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CBA8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDance
ProcScr_efxDance:  @ 0x085D5278
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9d0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CC14
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxShooter
ProcScr_efxShooter:  @ 0x085D5290
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9dc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CD5C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxShooterOBJ
ProcScr_efxShooterOBJ:  @ 0x085D52A8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9e8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CE94
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxHurtmut
ProcScr_efxHurtmut:  @ 0x085D52C0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9f8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CF04
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxHurtmutOBJ
ProcScr_efxHurtmutOBJ:  @ 0x085D52D8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca04
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D030
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxFirebreath
ProcScr_efxFirebreath:  @ 0x085D52F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca14
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D09C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxFirebreathOBJ
ProcScr_efxFirebreathOBJ:  @ 0x085D5308
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca24
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D1FC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxFirebreathBG
ProcScr_efxFirebreathBG:  @ 0x085D5320
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca38
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D2B4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxFirebreathBGCOL
ProcScr_efxFirebreathBGCOL:  @ 0x085D5338
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


	.global ProcScr_efxResire
ProcScr_efxResire:  @ 0x085D5AE0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd160
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxResire
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxResireBG
ProcScr_efxResireBG:  @ 0x085D5AF8
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


	.global ProcScr_efxResireBG2
ProcScr_efxResireBG2:  @ 0x085D5B28
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

	.global ProcScr_efxLive
ProcScr_efxLive:  @ 0x085D68BC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd890
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxLiveMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxRelive
ProcScr_efxRelive:  @ 0x085D68D4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd898
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxReliveMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxRecover
ProcScr_efxRecover:  @ 0x085D68EC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd8a4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxRecoverMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxReblow
ProcScr_efxReblow:  @ 0x085D6904
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd8b0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxReblowMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxLiveBG
ProcScr_efxLiveBG:  @ 0x085D691C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd8bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxLivebgMain
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


	.global ProcScr_efxLiveOBJ
ProcScr_efxLiveOBJ:  @ 0x085D6974
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dd9f8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxLiveobjMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxReserveOBJ
ProcScr_efxReserveOBJ:  @ 0x085D698C
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


	.global ProcScr_efxReblowOBJ
ProcScr_efxReblowOBJ:  @ 0x085D69AC
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


	.global ProcScr_efxReserve
ProcScr_efxReserve:  @ 0x085D69CC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dda24
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxReserveMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxReserveBG
ProcScr_efxReserveBG:  @ 0x085D69E4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dda30
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxReservebgMain
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


	.global ProcScr_efxBerserkBG
ProcScr_efxBerserkBG:  @ 0x085D6D80
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddef0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062E44
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxBerserkCLONE
ProcScr_efxBerserkCLONE:  @ 0x085D6D98
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


	.global ProcScr_efxBerserkOBJ
ProcScr_efxBerserkOBJ:  @ 0x085D6DB8
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


	.global ProcScr_efxMshield
ProcScr_efxMshield:  @ 0x085D6E70
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddf20
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063250
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxMshieldBG
ProcScr_efxMshieldBG:  @ 0x085D6E88
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

	.global ProcScr_efxMshieldBGOBJ
ProcScr_efxMshieldBGOBJ:  @ 0x085D6EB4
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


	.global ProcScr_efxMshieldBGOBJ2
ProcScr_efxMshieldBGOBJ2:  @ 0x085D6ED4
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

	.global ProcScr_efxGorgonBGFinish
ProcScr_efxGorgonBGFinish:  @ 0x085D8CC4
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


	.global ProcScr_efxDamageMojiEffect
ProcScr_efxDamageMojiEffect:  @ 0x085D8D44
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df11c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxDamageMojiEffectMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDamageMojiEffectOBJ
ProcScr_efxDamageMojiEffectOBJ:  @ 0x085D8D5C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df130
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxDamageMojiEffectOBJMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxCriricalEffect
ProcScr_efxCriricalEffect:  @ 0x085D8D74
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df148
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxCriricalEffectMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxCriricalEffectBG
ProcScr_efxCriricalEffectBG:  @ 0x085D8D8C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df15c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxCriricalEffectBGMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxCriricalEffectBGCOL
ProcScr_efxCriricalEffectBGCOL:  @ 0x085D8DA4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df170
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxCriricalEffectBGCOLMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxNormalEffect
ProcScr_efxNormalEffect:  @ 0x085D8DC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df1cc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxNormalEffectMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxNormalEffectBG
ProcScr_efxNormalEffectBG:  @ 0x085D8DDC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df1dc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxNormalEffectBGMain
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

	.global ProcScr_efxPierceCriticalEffect
ProcScr_efxPierceCriticalEffect:  @ 0x085D8E1C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df218
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxPierceCriticalEffectMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxPierceCriticalEffectBG
ProcScr_efxPierceCriticalEffectBG:  @ 0x085D8E34
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df230
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxPierceCriticalEffectBGMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxPierceCriticalEffectBGCOL
ProcScr_efxPierceCriticalEffectBGCOL:  @ 0x085D8E4C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df24c
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxPierceCriticalEffectBGCOLMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxPierceNormalEffect
ProcScr_efxPierceNormalEffect:  @ 0x085D8E6C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df2ac
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxPierceNormalEffectMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxPierceNormalEffectBG
ProcScr_efxPierceNormalEffectBG:  @ 0x085D8E84
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df2c4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxPierceNormalEffectBGMain
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

	.global ProcScr_efxYushaSpinShield
ProcScr_efxYushaSpinShield:  @ 0x085D8EC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df308
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxYushaSpinShieldMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxYushaSpinShieldOBJ
ProcScr_efxYushaSpinShieldOBJ:  @ 0x085D8EDC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df31c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxYushaSpinShieldOBJ_806CD14
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxYushaSpinShieldOBJ_806CD7C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxYushaSpinShieldOBJ_806CDA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxYushaSpinShieldOBJ_806CE08
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxHurtmutEff00
ProcScr_efxHurtmutEff00:  @ 0x085D8F0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df334
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxHurtmutEff00Main
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxHurtmutEff00OBJ
ProcScr_efxHurtmutEff00OBJ:  @ 0x085D8F24
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df344
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxHurtmutEff00OBJ_806CEC4
        @ PROC_SLEEP
        .short 0xe, 0x1a
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxHurtmutEff00OBJ_806CF10
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxHurtmutEff00OBJ_806CF5C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxHurtmutEff01OBJ
ProcScr_efxHurtmutEff01OBJ:  @ 0x085D8F5C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df358
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxHurtmutEff01OBJ_806CFC4
        @ PROC_SLEEP
        .short 0xe, 0x3a
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxHurtmutEff01OBJ_806D010
        @ PROC_SLEEP
        .short 0xe, 0x15
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxHurtmutEff01OBJ_806D05C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxMagfcast
ProcScr_efxMagfcast:  @ 0x085D8F94
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df36c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxMagfcastMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxMagfcastBG
ProcScr_efxMagfcastBG:  @ 0x085D8FAC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df378
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxMagfcastBGMain
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


	.global ProcScr_efxSpecalEffect
ProcScr_efxSpecalEffect:  @ 0x085D90DC
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

	.global ProcScr_efxChillEffectBGCOL
ProcScr_efxChillEffectBGCOL:  @ 0x085D92E0
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


	.global ProcScr_efxChillAnime
ProcScr_efxChillAnime:  @ 0x085D9300
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df5b4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E290
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
