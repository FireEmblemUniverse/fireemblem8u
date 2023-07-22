    .section .rodata

	@ 0x08205F60
	.asciz "GMapScreenVSync"
	.align 2, 0

	@ 0x08205F70
	.asciz "GmapScreen"
	.align 2, 0

	.global gUnknown_08205F7C
gUnknown_08205F7C:  @ 0x08205F7C
	.incbin "baserom.gba", 0x205F7C, 0x8

	@ 0x08205F84
	.asciz "GmapUnit"
	.align 2, 0

	@ 0x08205F90
	.asciz "Gmap Unit Fade"
	.align 2, 0

	.global gUnknown_08205FA0
gUnknown_08205FA0:  @ 0x08205FA0
@ Replacing .incbin "baserom.gba", 0x205FA0, 0x110
    .4byte 0x00000080
    .4byte gObject_32x32
    .4byte 0x20201810
    .4byte 0x00000113
    .4byte 0x00000084
    .4byte gObject_32x32
    .4byte 0x20201810
    .4byte 0x0000080f
    .4byte 0x00000088
    .4byte gObject_32x32
    .4byte 0x20201810
    .4byte 0x0000080f
    .4byte 0x00000088
    .4byte gObject_32x32
    .4byte 0x20201810
    .4byte 0x0000080f
    .4byte 0x00000088
    .4byte gObject_32x32
    .4byte 0x20201810
    .4byte 0x0000080f
    .4byte 0x00000092
    .4byte gObject_16x16
    .4byte 0x10100808
    .4byte 0x00000108
    .4byte 0x0000009a
    .4byte gObject_32x32
    .4byte 0x20201810
    .4byte 0x00000510
    .4byte 0x00000014
    .4byte gObject_32x32
    .4byte 0x20201810
    .4byte 0x00000410
    .4byte 0x00000018
    .4byte gObject_32x32
    .4byte 0x20201810
    .4byte 0x00000410
    .4byte 0x00000098
    .4byte gObject_16x16
    .4byte 0x10100808
    .4byte 0x00000308
    .4byte 0x000000d2
    .4byte gObject_16x16
    .4byte 0x10100808
    .4byte 0x00000206
    .4byte 0x00000094
    .4byte gObject_16x16
    .4byte 0x10100808
    .4byte 0x0000020a
    .4byte 0x0000001c
    .4byte gObject_32x32
    .4byte 0x20201810
    .4byte 0x00000b10
    .4byte 0x00000090
    .4byte gObject_16x32
    .4byte 0x20101808
    .4byte 0x00001808
    .4byte 0x0000008c
    .4byte gObject_32x32
    .4byte 0x20201810
    .4byte 0x00001810
    .4byte 0x000000d4
    .4byte gObject_8x8
    .4byte 0x08080404
    .4byte 0x00000404
    .4byte 0x00000092
    .4byte gObject_16x16
    .4byte 0x10100808
    .4byte 0x00000808

	.global gUnknown_082060B0
gUnknown_082060B0:  @ 0x082060B0
@ Replacing .incbin "baserom.gba", 0x2060B0, 0x3A0
    .4byte 0x0b0b0100
    .4byte 0x00890000
    .4byte 0x01010000
    .4byte gUnknown_08A3EEEC + 0xc8
    .4byte gUnknown_08A3EEEC + 0x18c
    .4byte gUnknown_08A3EEEC + 0x27e
    .4byte 0x00580098
    .4byte 0x00000650
    .4byte 0x02020101
    .4byte 0x00883838
    .4byte 0x0e090202
    .4byte gUnknown_08A3EEEC + 0xca
    .4byte gUnknown_08A3EEEC + 0x18e
    .4byte gUnknown_08A3EEEC + 0x280
    .4byte 0x00480058
    .4byte 0x00000651
    .4byte 0x0a0a0200
    .4byte 0xffff0202
    .4byte 0x03030303
    .4byte gUnknown_08A3EEEC + 0xcc
    .4byte gUnknown_08A3EEEC + 0x190
    .4byte gUnknown_08A3EEEC + 0x282
    .4byte 0x00780078
    .4byte 0x00000652
    .4byte 0x0b0b0200
    .4byte 0xffff0303
    .4byte 0x04040404
    .4byte gUnknown_08A3EEEC + 0xde
    .4byte gUnknown_08A3EEEC + 0x192
    .4byte gUnknown_08A3EEEC + 0x284
    .4byte 0x00980078
    .4byte 0x00000653
    .4byte 0x0f0f0200
    .4byte 0xffff0404
    .4byte 0x05050505
    .4byte gUnknown_08A3EEEC + 0xe0
    .4byte gUnknown_08A3EEEC + 0x194
    .4byte gUnknown_08A3EEEC + 0x286
    .4byte 0x00980098
    .4byte 0x00000654
    .4byte 0x0a0a0100
    .4byte 0x00880606
    .4byte 0x01010606
    .4byte gUnknown_08A3EEEC + 0xe2
    .4byte gUnknown_08A3EEEC + 0x196
    .4byte gUnknown_08A3EEEC + 0x288
    .4byte 0x00b70098
    .4byte 0x00000655
    .4byte 0x0f0f0200
    .4byte 0xffff0707
    .4byte 0x07070707
    .4byte gUnknown_08A3EEEC + 0xf8
    .4byte gUnknown_08A3EEEC + 0x1a4
    .4byte gUnknown_08A3EEEC + 0x28a
    .4byte 0x00c800b8
    .4byte 0x00000656
    .4byte 0x05050100
    .4byte 0xffff0808
    .4byte 0x08080808
    .4byte gUnknown_08A3EEEC + 0xfa
    .4byte gUnknown_08A3EEEC + 0x1a6
    .4byte gUnknown_08A3EEEC + 0x28c
    .4byte 0x00d800d8
    .4byte 0x00000657
    .4byte 0x05050100
    .4byte 0xffff0909
    .4byte 0x05050505
    .4byte gUnknown_08A3EEEC + 0xfc
    .4byte gUnknown_08A3EEEC + 0x1a8
    .4byte gUnknown_08A3EEEC + 0x28e
    .4byte 0x00d800d8
    .4byte 0x00000658
    .4byte 0x0a0a0100
    .4byte 0xffff0a0a
    .4byte 0x0a0a0a0a
    .4byte gUnknown_08A3EEEC + 0xfe
    .4byte gUnknown_08A3EEEC + 0x1aa
    .4byte gUnknown_08A3EEEC + 0x290
    .4byte 0x003800d8
    .4byte 0x00010659
    .4byte 0x0f0f0200
    .4byte 0xffff0b0b
    .4byte 0x0b0b0b0b
    .4byte gUnknown_08A3EEEC + 0x118
    .4byte gUnknown_08A3EEEC + 0x1c6
    .4byte gUnknown_08A3EEEC + 0x292
    .4byte 0x006800d8
    .4byte 0x0000065a
    .4byte 0x09090100
    .4byte 0xffff3d3d
    .4byte 0x0c0c0c0c
    .4byte gUnknown_08A3EEEC + 0x11a
    .4byte gUnknown_08A3EEEC + 0x1c8
    .4byte gUnknown_08A3EEEC + 0x294
    .4byte 0x00680108
    .4byte 0x0000065b
    .4byte 0x0f0f0200
    .4byte 0xffff0d0d
    .4byte 0x0d0d0d0d
    .4byte gUnknown_08A3EEEC + 0x11c
    .4byte gUnknown_08A3EEEC + 0x1e0
    .4byte gUnknown_08A3EEEC + 0x296
    .4byte 0x00880138
    .4byte 0x0000065c
    .4byte 0x07070100
    .4byte 0xffff0e0e
    .4byte 0x13131313
    .4byte gUnknown_08A3EEEC + 0x11e
    .4byte gUnknown_08A3EEEC + 0x1e2
    .4byte gUnknown_08A3EEEC + 0x298
    .4byte 0x00c80138
    .4byte 0x0000065d
    .4byte 0x0b0b0200
    .4byte 0xffff1717
    .4byte 0x0f0f0f0f
    .4byte gUnknown_08A3EEEC + 0x120
    .4byte gUnknown_08A3EEEC + 0x1e4
    .4byte gUnknown_08A3EEEC + 0x29a
    .4byte 0x00980048
    .4byte 0x0000065e
    .4byte 0x0f0f0200
    .4byte 0xffff1818
    .4byte 0x10101010
    .4byte gUnknown_08A3EEEC + 0x122
    .4byte gUnknown_08A3EEEC + 0x1e6
    .4byte gUnknown_08A3EEEC + 0x29c
    .4byte 0x00e80048
    .4byte 0x0001065f
    .4byte 0x0a0a0100
    .4byte 0xffff3e3e
    .4byte 0x11111111
    .4byte gUnknown_08A3EEEC + 0x13c
    .4byte gUnknown_08A3EEEC + 0x202
    .4byte gUnknown_08A3EEEC + 0x29e
    .4byte 0x00f80098
    .4byte 0x00010660
    .4byte 0x0f0f0200
    .4byte 0xffff1a1a
    .4byte 0x12121212
    .4byte gUnknown_08A3EEEC + 0x13e
    .4byte gUnknown_08A3EEEC + 0x21a
    .4byte gUnknown_08A3EEEC + 0x2a0
    .4byte 0x010800c8
    .4byte 0x00000661
    .4byte 0x08080100
    .4byte 0xffff1b1b
    .4byte 0x13131313
    .4byte gUnknown_08A3EEEC + 0x140
    .4byte gUnknown_08A3EEEC + 0x21c
    .4byte gUnknown_08A3EEEC + 0x2a2
    .4byte 0x01080108
    .4byte 0x00000662
    .4byte 0x07070100
    .4byte 0xffff1c0f
    .4byte 0x14141414
    .4byte gUnknown_08A3EEEC + 0x142
    .4byte gUnknown_08A3EEEC + 0x21e
    .4byte gUnknown_08A3EEEC + 0x2cc
    .4byte 0x00c80138
    .4byte 0x00000663
    .4byte 0x06060100
    .4byte 0xffff1d10
    .4byte 0x15151515
    .4byte gUnknown_08A3EEEC + 0x144
    .4byte gUnknown_08A3EEEC + 0x23c
    .4byte gUnknown_08A3EEEC + 0x2f6
    .4byte 0x009800d8
    .4byte 0x00000664
    .4byte 0x0f0f0200
    .4byte 0xffff1e11
    .4byte 0x16161616
    .4byte gUnknown_08A3EEEC + 0x146
    .4byte gUnknown_08A3EEEC + 0x23e
    .4byte gUnknown_08A3EEEC + 0x2f8
    .4byte 0x00a80168
    .4byte 0x00000665
    .4byte 0x0f0f0200
    .4byte 0xffff1f12
    .4byte 0x17171717
    .4byte gUnknown_08A3EEEC + 0x162
    .4byte gUnknown_08A3EEEC + 0x256
    .4byte gUnknown_08A3EEEC + 0x2fa
    .4byte 0x00780168
    .4byte 0x00000666
    .4byte 0x03030100
    .4byte 0xffff2013
    .4byte 0x19191919
    .4byte gUnknown_08A3EEEC + 0x164
    .4byte gUnknown_08A3EEEC + 0x258
    .4byte gUnknown_08A3EEEC + 0x2fc
    .4byte 0x00580188
    .4byte 0x00000667
    .4byte 0x0f0f0200
    .4byte 0xffffffff
    .4byte 0xffffffff
    .4byte gUnknown_08A3EEEC + 0x182
    .4byte gUnknown_08A3EEEC + 0x274
    .4byte gUnknown_08A3EEEC + 0x326
    .4byte 0x00480158
    .4byte 0x00000668
    .4byte 0x0c0c0100
    .4byte 0xffff2114
    .4byte 0xffffffff
    .4byte gUnknown_08A3EEEC + 0x184
    .4byte gUnknown_08A3EEEC + 0x276
    .4byte gUnknown_08A3EEEC + 0x328
    .4byte 0x00580138
    .4byte 0x00000669
    .4byte 0x0d0d0303
    .4byte 0xffff2424
    .4byte 0xffffffff
    .4byte gUnknown_08A3EEEC + 0x186
    .4byte gUnknown_08A3EEEC + 0x278
    .4byte gUnknown_08A3EEEC + 0x32a
    .4byte 0x00380098
    .4byte 0x0000066a
    .4byte 0x0e0e0303
    .4byte 0xffff2e2e
    .4byte 0xffffffff
    .4byte gUnknown_08A3EEEC + 0x188
    .4byte gUnknown_08A3EEEC + 0x27a
    .4byte gUnknown_08A3EEEC + 0x32c
    .4byte 0x00b80198
    .4byte 0x0000066b
    .4byte 0x0f0f0202
    .4byte 0xffff3939
    .4byte 0xffffffff
    .4byte gUnknown_08A3EEEC + 0x18a
    .4byte gUnknown_08A3EEEC + 0x27c
    .4byte gUnknown_08A3EEEC + 0x32e
    .4byte 0x00280158
    .4byte 0x0001066c

	.global gUnknown_08206450
gUnknown_08206450:  @ 0x08206450
	.incbin "baserom.gba", 0x206450, 0x48

	.global gUnknown_08206498
gUnknown_08206498:  @ 0x08206498
@ Replacing .incbin "baserom.gba", 0x206498, 0x1DC
    .4byte 0x00000000
    .4byte gObject_16x16
    .4byte 0x00001000
    .4byte 0x00000002
    .4byte gObject_16x16
    .4byte 0x00001000

	.global gUnknown_082064B0
gUnknown_082064B0:  @ 0x082064B0
	.asciz "GmapCursor"
