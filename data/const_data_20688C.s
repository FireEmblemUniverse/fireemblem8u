
    .section .rodata

	.global gAsciiStr_GmapMoveCursor
gAsciiStr_GmapMoveCursor:  @ 0x0820688C
	.asciz "Gmap Move Cursor"
	.align 2, 0

	.global gAsciiStr_GmapScrollManage
gAsciiStr_GmapScrollManage:  @ 0x082068A0
	.asciz "Gmap Scroll Manage"
	.align 2, 0

	.global gAsciiStr_GmapPalFade
gAsciiStr_GmapPalFade:  @ 0x082068B4
	.asciz "Gmap Pal Fade"
	.align 2, 0

	.global gAsciiStr_GmapBaseEntry
gAsciiStr_GmapBaseEntry:  @ 0x082068C4
	.asciz "Gmap Base Entry"
	.align 2, 0

	.global gAsciiStr_GmapMUEntry
gAsciiStr_GmapMUEntry:  @ 0x082068D4
	.asciz "Gmap Mu Entry"
	.align 2, 0

	.global gAsciiStr_GmapLineFade
gAsciiStr_GmapLineFade:  @ 0x082068E4
	.asciz "Gmap Line Fade"
	.align 2, 0

	.global gUnknown_082068F4
gUnknown_082068F4:  @ 0x082068F4
	.incbin "baserom.gba", 0x2068F4, 0x8

	.global gUnknown_082068FC
gUnknown_082068FC:  @ 0x082068FC
	.incbin "baserom.gba", 0x2068FC, 0x8

	.global gUnknown_08206904
gUnknown_08206904:  @ 0x08206904
	.incbin "baserom.gba", 0x206904, 0x44

	.global gWMMonsterSpawnLocations
gWMMonsterSpawnLocations:  @ 0x08206948
@ Replacing .incbin "baserom.gba", 0x206948, 0x9
    .byte 0x04 @ Za'ha Woods WM node ID
    .byte 0x06 @ Adlas Plains WM node ID
    .byte 0x0A @ Teraz Plateau WM node ID
    .byte 0x0C @ Hamill Canyon WM node ID
    .byte 0x0F @ Bethroen WM node ID
    .byte 0x11 @ Za'albul Marsh WM node ID
    .byte 0x15 @ Narube River WM node ID
    .byte 0x16 @ Neleras Peak WM node ID
    .byte 0x1C @ Melkaen Peak WM node ID

	.global gWMMonsterSpawnsSize
gWMMonsterSpawnsSize:  @ 0x08206951
@ Replacing .incbin "baserom.gba", 0x206951, 0x3
    .byte 0x09
    .align 2, 0

	.global gUnknown_08206954
gUnknown_08206954:  @ 0x08206954
	.incbin "baserom.gba", 0x206954, 0x84

	.global gUnknown_082069D8
gUnknown_082069D8:  @ 0x082069D8
	.incbin "baserom.gba", 0x2069D8, 0xB

	.global gUnknown_082069E3
gUnknown_082069E3:  @ 0x082069E3
	.incbin "baserom.gba", 0x2069E3, 0xB

	.global gUnknown_082069EE
gUnknown_082069EE:  @ 0x082069EE
	.incbin "baserom.gba", 0x2069EE, 0x5A

	.global gUnknown_08206A48
gUnknown_08206A48:  @ 0x08206A48
	.incbin "baserom.gba", 0x206A48, 0x9

	.global gUnknown_08206A51
gUnknown_08206A51:  @ 0x08206A51
	.incbin "baserom.gba", 0x206A51, 0x5A

	.global gUnknown_08206AAB
gUnknown_08206AAB:  @ 0x08206AAB
	.incbin "baserom.gba", 0x206AAB, 0x45

	.global gUnknown_08206AF0
gUnknown_08206AF0:  @ 0x08206AF0
@ Replacing .incbin "baserom.gba", 0x206AF0, 0x80
    .4byte gUnknown_08A9E688 + 0x40
    .4byte gUnknown_08A9E688 + 0x59c
    .4byte 0x00280036
    .4byte gUnknown_08A9E688 + 0x60c
    .4byte gUnknown_08A9E688 + 0xcd0
    .4byte 0x00750058
    .4byte gUnknown_08A9E688 + 0xe0c
    .4byte gUnknown_08A9E688 + 0x1340
    .4byte 0x005700b1
    .4byte gUnknown_08A9E688 + 0x13a4
    .4byte gUnknown_08A9E688 + 0x181c
    .4byte 0x0039007f
    .4byte gUnknown_08A9E688 + 0x1878
    .4byte gUnknown_08A9E688 + 0x1b84
    .4byte 0x002c009a
    .4byte gUnknown_08A9E688 + 0x1bb8
    .4byte gUnknown_08A9E688 + 0x20d8
    .4byte 0x002600bc
    .4byte gUnknown_08A9E688 + 0x2128
    .4byte gUnknown_08A9E688 + 0x2508
    .4byte 0x00300084
    .4byte gUnknown_08A9E688 + 0x2540
    .4byte gUnknown_08A9E688 + 0x2a5c
    .4byte 0x004a0065
    .4byte 0x70616d47
    .4byte 0x204d5220
    .4byte 0x64726f62
    .4byte 0x00007265
    .4byte 0x70616d47
    .4byte 0x74754120
    .4byte 0x754d206f
    .4byte 0x00000000

	.global gUnknown_08206B70
gUnknown_08206B70:  @ 0x08206B70
@ Replacing .incbin "baserom.gba", 0x206B70, 0x2B4
    .4byte 0x00000003
    .4byte 0x01030100
    .4byte 0x02020101
    .4byte 0x03020203
    .4byte 0x03020303
    .4byte 0x70616d47
    .4byte 0x64615220
    .4byte 0x00007265
    .4byte 0x70616d47
    .4byte 0x73614220
    .4byte 0x654d2065
    .4byte 0x0000756e
    .4byte gUnknown_08A40FC8 + 0x20
    .4byte gUnknown_08A40FC8 + 0x9e40
    .4byte gUnknown_08A40FC8 + 0xb68
    .4byte gUnknown_08A40FC8 + 0xa0c8
    .4byte gUnknown_08A40FC8 + 0x1780
    .4byte gUnknown_08A40FC8 + 0xa32c
    .4byte gUnknown_08A40FC8 + 0x22f8
    .4byte gUnknown_08A40FC8 + 0xa590
    .4byte gUnknown_08A40FC8 + 0x2cf4
    .4byte gUnknown_08A40FC8 + 0xa7c0
    .4byte gUnknown_08A40FC8 + 0x4188
    .4byte gUnknown_08A40FC8 + 0xab88
    .4byte gUnknown_08A40FC8 + 0x4654
    .4byte gUnknown_08A40FC8 + 0xacfc
    .4byte gUnknown_08A40FC8 + 0x4f90
    .4byte gUnknown_08A40FC8 + 0xaef8
    .4byte gUnknown_08A40FC8 + 0x59c0
    .4byte gUnknown_08A40FC8 + 0xb11c
    .4byte gUnknown_08A40FC8 + 0x62e8
    .4byte gUnknown_08A40FC8 + 0xb340
    .4byte gUnknown_08A40FC8 + 0x777c
    .4byte gUnknown_08A40FC8 + 0xb724
    .4byte gUnknown_08A40FC8 + 0x87e0
    .4byte gUnknown_08A40FC8 + 0xba28
    .4byte gUnknown_08A40FC8 + 0x9a0c
    .4byte gUnknown_08A40FC8 + 0xbd78
    .4byte gUnknown_08A4D0CC + 0x11c
    .4byte gUnknown_08A4D0CC + 0x6ec
    .4byte gUnknown_08A4D0CC + 0xeec
    .4byte gUnknown_08A4D0CC + 0x1710
    .4byte gUnknown_08A4D0CC + 0x1f74
    .4byte gUnknown_08A4D0CC + 0x27cc
    .4byte gUnknown_08A4D0CC + 0x304c
    .4byte gUnknown_08A4D0CC + 0x38b4
    .4byte gUnknown_08A4D0CC + 0x4124
    .4byte gUnknown_08A4D0CC + 0x4984
    .4byte 0x8A708A7 + 0xf435
    .4byte 0x8A708A7 + 0x1233d
    .4byte 0x00000078
    .4byte gUnknown_08A4D0CC + 0x518c
    .4byte gUnknown_08A4D0CC + 0x5918
    .4byte gUnknown_08A4D0CC + 0x6130
    .4byte gUnknown_08A4D0CC + 0x6944
    .4byte gUnknown_08A4D0CC + 0x7150
    .4byte gUnknown_08A4D0CC + 0x7964
    .4byte gUnknown_08A4D0CC + 0x81a8
    .4byte gUnknown_08A4D0CC + 0x8950
    .4byte gUnknown_08A4D0CC + 0x9144
    .4byte gUnknown_08A4D0CC + 0x9958
    .4byte 0x8A708A7 + 0xf8e9
    .4byte 0x8A708A7 + 0x123fd
    .4byte 0x00000078
    .4byte gUnknown_08A4D0CC + 0xa134
    .4byte gUnknown_08A4D0CC + 0xa964
    .4byte gUnknown_08A4D0CC + 0xb1bc
    .4byte gUnknown_08A4D0CC + 0xba18
    .4byte gUnknown_08A4D0CC + 0xc28c
    .4byte gUnknown_08A4D0CC + 0xcb0c
    .4byte gUnknown_08A4D0CC + 0xd368
    .4byte gUnknown_08A4D0CC + 0xdb68
    .4byte gUnknown_08A4D0CC + 0xe2c4
    .4byte gUnknown_08A4D0CC + 0xea88
    .4byte 0x8A708A7 + 0xfd9d
    .4byte 0x8A708A7 + 0x124bd
    .4byte 0x00000078
    .4byte gUnknown_08A4D0CC + 0xf284
    .4byte gUnknown_08A4D0CC + 0xfa54
    .4byte gUnknown_08A4D0CC + 0x1022c
    .4byte gUnknown_08A4D0CC + 0x109a4
    .4byte gUnknown_08A4D0CC + 0x111b0
    .4byte gUnknown_08A4D0CC + 0x119d0
    .4byte gUnknown_08A4D0CC + 0x12224
    .4byte gUnknown_08A4D0CC + 0x12a54
    .4byte gUnknown_08A4D0CC + 0x13220
    .4byte gUnknown_08A4D0CC + 0x13a58
    .4byte 0x8A708A7 + 0x10251
    .4byte 0x8A708A7 + 0x1257d
    .4byte 0x00000078
    .4byte gUnknown_08A4D0CC + 0x142bc
    .4byte gUnknown_08A4D0CC + 0x14af8
    .4byte gUnknown_08A4D0CC + 0x1535c
    .4byte gUnknown_08A4D0CC + 0x15bc0
    .4byte gUnknown_08A4D0CC + 0x16420
    .4byte gUnknown_08A4D0CC + 0x16c98
    .4byte gUnknown_08A4D0CC + 0x17504
    .4byte gUnknown_08A4D0CC + 0x17d20
    .4byte gUnknown_08A4D0CC + 0x18550
    .4byte gUnknown_08A4D0CC + 0x18d68
    .4byte 0x8A708A7 + 0x10705
    .4byte 0x8A708A7 + 0x1263d
    .4byte 0x00000078
    .4byte gUnknown_08A4D0CC + 0x19568
    .4byte gUnknown_08A4D0CC + 0x19d18
    .4byte gUnknown_08A4D0CC + 0x1a4fc
    .4byte gUnknown_08A4D0CC + 0x1acf4
    .4byte gUnknown_08A4D0CC + 0x1b530
    .4byte gUnknown_08A4D0CC + 0x1bd6c
    .4byte gUnknown_08A4D0CC + 0x1c5c8
    .4byte gUnknown_08A4D0CC + 0x1cdf8
    .4byte gUnknown_08A4D0CC + 0x1d600
    .4byte gUnknown_08A4D0CC + 0x1ddb8
    .4byte 0x8A708A7 + 0x10bb9
    .4byte 0x8A708A7 + 0x126fd
    .4byte 0x00000078
    .4byte gUnknown_08A4D0CC + 0x1e4f8
    .4byte gUnknown_08A4D0CC + 0x1ed0c
    .4byte gUnknown_08A4D0CC + 0x1f560
    .4byte gUnknown_08A4D0CC + 0x1fdb4
    .4byte gUnknown_08A4D0CC + 0x20610
    .4byte gUnknown_08A4D0CC + 0x20e84
    .4byte gUnknown_08A4D0CC + 0x21700
    .4byte gUnknown_08A4D0CC + 0x21f74
    .4byte gUnknown_08A4D0CC + 0x227c8
    .4byte gUnknown_08A4D0CC + 0x23018
    .4byte 0x8A708A7 + 0x1106d
    .4byte 0x8A708A7 + 0x127bd
    .4byte 0x00000078
    .4byte 0x8A708A7 + 0x4d
    .4byte 0x8A708A7 + 0x65d
    .4byte 0x8A708A7 + 0xe39
    .4byte 0x8A708A7 + 0x163d
    .4byte 0x8A708A7 + 0x1e71
    .4byte 0x8A708A7 + 0x269d
    .4byte 0x8A708A7 + 0x2ef9
    .4byte 0x8A708A7 + 0x3749
    .4byte 0x8A708A7 + 0x3f65
    .4byte 0x8A708A7 + 0x474d
    .4byte 0x8A708A7 + 0x11521
    .4byte 0x8A708A7 + 0x1287d
    .4byte 0x00000078
    .4byte 0x8A708A7 + 0x4f91
    .4byte 0x8A708A7 + 0x5709
    .4byte 0x8A708A7 + 0x5f55
    .4byte 0x8A708A7 + 0x67c9
    .4byte 0x8A708A7 + 0x7031
    .4byte 0x8A708A7 + 0x7845
    .4byte 0x8A708A7 + 0x8085
    .4byte 0x8A708A7 + 0x88e1
    .4byte 0x8A708A7 + 0x9145
    .4byte 0x8A708A7 + 0x9971
    .4byte 0x8A708A7 + 0x119d5
    .4byte 0x8A708A7 + 0x1293d
    .4byte 0x00000078
    .4byte 0x8A708A7 + 0xa165
    .4byte 0x8A708A7 + 0xa94d
    .4byte 0x8A708A7 + 0xb185
    .4byte 0x8A708A7 + 0xb9d9
    .4byte 0x8A708A7 + 0xc229
    .4byte 0x8A708A7 + 0xca7d
    .4byte 0x8A708A7 + 0xd2c9
    .4byte 0x8A708A7 + 0xdb39
    .4byte 0x8A708A7 + 0xe395
    .4byte 0x8A708A7 + 0xebed
    .4byte 0x8A708A7 + 0x11e89
    .4byte 0x8A708A7 + 0x129fd
    .4byte 0x00000078
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global gUnknown_08206E24
gUnknown_08206E24:  @ 0x08206E24
@ Replacing .incbin "baserom.gba", 0x206E24, 0x190
    .4byte gUnknown_08206B70 + 0x30
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08206B70 + 0xcc
    .4byte gUnknown_08206B70 + 0x100
    .4byte 0x00016000
    .4byte 0x00027000
    .4byte gUnknown_08206B70 + 0x38
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08206B70 + 0x238
    .4byte gUnknown_08206B70 + 0x238
    .4byte 0x00034000
    .4byte 0x00047000
    .4byte gUnknown_08206B70 + 0x40
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08206B70 + 0x134
    .4byte gUnknown_08206B70 + 0x134
    .4byte 0x00055000
    .4byte 0x00067000
    .4byte gUnknown_08206B70 + 0x48
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08206B70 + 0x1d0
    .4byte gUnknown_08206B70 + 0x1d0
    .4byte 0x00074000
    .4byte 0x00087000
    .4byte gUnknown_08206B70 + 0x50
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08206B70 + 0x58
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08206B70 + 0x204
    .4byte gUnknown_08206B70 + 0x204
    .4byte 0x0009e800
    .4byte 0x000b7000
    .4byte gUnknown_08206B70 + 0x60
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08206B70 + 0x26c
    .4byte gUnknown_08206B70 + 0x26c
    .4byte 0x000c2000
    .4byte 0x000d7000
    .4byte gUnknown_08206B70 + 0x68
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08206B70 + 0x168
    .4byte gUnknown_08206B70 + 0x168
    .4byte 0x000e4000
    .4byte 0x000f7000
    .4byte gUnknown_08206B70 + 0x70
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08206B70 + 0x19c
    .4byte gUnknown_08206B70 + 0x19c
    .4byte 0x00103000
    .4byte 0x00117000
    .4byte gUnknown_08206B70 + 0x78
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08206B70 + 0x80
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08206B70 + 0x88
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global gUnknown_08206FB4
gUnknown_08206FB4:  @ 0x08206FB4
@ replacing .incbin "baserom.gba", 0x00206fb4, 0x28
.4byte gUnknown_08206B70 + 0x90
.4byte 0
.4byte 0
.4byte 0
.4byte 0
.4byte 0
.4byte 0
.4byte 0
.4byte 0
.4byte 0

	.global gUnknown_08206FDC
gUnknown_08206FDC:  @ 0x08206FDC
	.incbin "baserom.gba", 0x206FDC, 0x8
