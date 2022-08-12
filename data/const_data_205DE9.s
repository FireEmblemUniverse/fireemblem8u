    .section .rodata

	.incbin "baserom.gba", 0x205DD4, 0x15

	.global gUnknown_08205DE9
gUnknown_08205DE9:  @ 0x08205DE9
	.incbin "baserom.gba", 0x205DE9, 0x2F

	.global gUnknown_08205E18
gUnknown_08205E18:  @ 0x08205E18
@ replacing .incbin "baserom.gba", 0x00205e18, 0x10
.4byte gUnknown_08A20C4C + 0x18
.4byte gUnknown_08A20C4C + 0x50
.4byte gUnknown_08A20C4C + 0x88
.4byte gUnknown_08A20C4C + 0xc0

	.global gUnknown_08205E28
gUnknown_08205E28:  @ 0x08205E28
@ Replacing .incbin "baserom.gba", 0x205E28, 0x28
    .4byte gUnknown_08A20C4C + 0xf8
    .4byte gUnknown_08A20C4C + 0xf8
    .4byte gUnknown_08A20C4C + 0x10c
    .4byte gUnknown_08A20C4C + 0x10c
    .4byte 0x66435f45
    .4byte 0x6c707845
    .4byte 0x72576552
    .4byte 0x00657469
    .4byte 0x66635f45
    .4byte 0x006a624f

	.global gUnknown_08205E50
gUnknown_08205E50:  @ 0x08205E50
	.incbin "baserom.gba", 0x205E50, 0x44

	.global gUnknown_08205E94
gUnknown_08205E94:  @ 0x08205E94
	.incbin "baserom.gba", 0x205E94, 0x3C

	.global gUnknown_08205ED0
gUnknown_08205ED0:  @ 0x08205ED0
	.incbin "baserom.gba", 0x205ED0, 0x4

	.global gUnknown_08205ED4
gUnknown_08205ED4:  @ 0x08205ED4
	.incbin "baserom.gba", 0x205ED4, 0x8

	.global gUnknown_08205EDC
gUnknown_08205EDC:  @ 0x08205EDC
	.incbin "baserom.gba", 0x205EDC, 0x40

	.global gUnknown_08205F1C
gUnknown_08205F1C:  @ 0x08205F1C
	.incbin "baserom.gba", 0x205F1C, 0x4

	.global gUnknown_08205F20
gUnknown_08205F20:  @ 0x08205F20
	.incbin "baserom.gba", 0x205F20, 0x4

	.global gUnknown_08205F24
gUnknown_08205F24:  @ 0x08205F24
	.incbin "baserom.gba", 0x205F24, 0x4

	.global gUnknown_08205F28
gUnknown_08205F28:  @ 0x08205F28
	.incbin "baserom.gba", 0x205F28, 0x54

	.global gUnknown_08205F7C
gUnknown_08205F7C:  @ 0x08205F7C
	.incbin "baserom.gba", 0x205F7C, 0x24

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
    .incbin "baserom.gba", 0x206498, 0x1DC

	.global gUnknown_08206674
gUnknown_08206674:  @ 0x08206674
@ Replacing .incbin "baserom.gba", 0x206674, 0x1F4
    .4byte gUnknown_08A97FA4 + 0x20
    .4byte 0x00000100
    .4byte gUnknown_08206498 + 0x24
    .4byte gUnknown_08A97FA4 + 0x54
    .4byte 0x00000201
    .4byte gUnknown_08206498 + 0x3c
    .4byte gUnknown_08A97FA4 + 0x8c
    .4byte 0x00000302
    .4byte 0x00000000
    .4byte gUnknown_08A97FA4 + 0xb0
    .4byte 0x00000403
    .4byte 0x00000000
    .4byte gUnknown_08A97FA4 + 0xc8
    .4byte 0x00000504
    .4byte 0x00000000
    .4byte gUnknown_08A97FA4 + 0xec
    .4byte 0x00000605
    .4byte gUnknown_08206498 + 0x4c
    .4byte gUnknown_08A97FA4 + 0x110
    .4byte 0x00000706
    .4byte gUnknown_08206498 + 0x5c
    .4byte gUnknown_08A97FA4 + 0x138
    .4byte 0x00000806
    .4byte gUnknown_08206498 + 0x5c
    .4byte gUnknown_08A97FA4 + 0x160
    .4byte 0x00000900
    .4byte gUnknown_08206498 + 0x6c
    .4byte gUnknown_08A97FA4 + 0x1a0
    .4byte 0x00001a00
    .4byte 0x00000000
    .4byte gUnknown_08A97FA4 + 0x1c4
    .4byte 0x00000a09
    .4byte 0x00000000
    .4byte gUnknown_08A97FA4 + 0x1f8
    .4byte 0x00000b0a
    .4byte 0x00000000
    .4byte gUnknown_08A97FA4 + 0x218
    .4byte 0x00000c0b
    .4byte gUnknown_08206498 + 0x84
    .4byte gUnknown_08A97FA4 + 0x250
    .4byte 0x00000d0c
    .4byte 0x00000000
    .4byte gUnknown_08A97FA4 + 0x284
    .4byte 0x00000e01
    .4byte gUnknown_08206498 + 0x9c
    .4byte gUnknown_08A97FA4 + 0x2d8
    .4byte 0x00000f0e
    .4byte gUnknown_08206498 + 0xac
    .4byte gUnknown_08A97FA4 + 0x330
    .4byte 0x0000100f
    .4byte gUnknown_08206498 + 0xcc
    .4byte gUnknown_08A97FA4 + 0x370
    .4byte 0x00001110
    .4byte gUnknown_08206498 + 0xe4
    .4byte gUnknown_08A97FA4 + 0x3a0
    .4byte 0x00001211
    .4byte 0x00000000
    .4byte gUnknown_08A97FA4 + 0x3c8
    .4byte 0x00001312
    .4byte gUnknown_08206498 + 0xfc
    .4byte gUnknown_08A97FA4 + 0x418
    .4byte 0x00001208
    .4byte gUnknown_08206498 + 0x114
    .4byte gUnknown_08A97FA4 + 0x44c
    .4byte 0x00001413
    .4byte gUnknown_08206498 + 0x12c
    .4byte gUnknown_08A97FA4 + 0x4a4
    .4byte 0x0000130c
    .4byte 0x00000000
    .4byte gUnknown_08A97FA4 + 0x4d8
    .4byte 0x00001400
    .4byte gUnknown_08206498 + 0x144
    .4byte gUnknown_08A97FA4 + 0x530
    .4byte 0x00001513
    .4byte gUnknown_08206498 + 0x15c
    .4byte gUnknown_08A97FA4 + 0x568
    .4byte 0x00001615
    .4byte 0x00000000
    .4byte gUnknown_08A97FA4 + 0x59c
    .4byte 0x00001716
    .4byte 0x00000000
    .4byte gUnknown_08A97FA4 + 0x5c4
    .4byte 0x00001917
    .4byte gUnknown_08206498 + 0x16c
    .4byte gUnknown_08A97FA4 + 0x600
    .4byte 0x00001b17
    .4byte gUnknown_08206498 + 0x194
    .4byte gUnknown_08A97FA4 + 0x658
    .4byte 0x00001c17
    .4byte gUnknown_08206498 + 0x1a4
    .4byte gUnknown_08A97FA4 + 0x698
    .4byte 0x00001c09
    .4byte gUnknown_08206498 + 0x1b4
    .4byte gUnknown_08A97FA4 + 0x6f0
    .4byte 0x00001918
    .4byte gUnknown_08206498 + 0x1cc
    .4byte 0x70616d47
    .4byte 0x74756f52
    .4byte 0x00000065
    .4byte 0x4c8b4081
    .4byte 0x00005e98
    .4byte 0xdd904081
    .4byte 0x0000e892
    .4byte 0xab8e4081
    .4byte 0x0000918f
    .4byte 0xf38f4081
    .4byte 0x0000b58b
    .4byte 0x94954081
    .4byte 0x0000e091
    .4byte 0x41834081
    .4byte 0x65834383
    .4byte 0xae908083
    .4byte 0x00009d97
    .4byte 0xe9944081
    .4byte 0x5893a796
    .4byte 0xfc93c982
    .4byte 0x0000e982
    .4byte 0xb9934081
    .4byte 0xae89ef8b
    .4byte 0xfc93c982
    .4byte 0x0000e982
    .4byte 0x90954081
    .4byte 0xae89ed8a
    .4byte 0xfc93c982
    .4byte 0x0000e982

	.global gUnknown_08206868
gUnknown_08206868:  @ 0x08206868
	.incbin "baserom.gba", 0x206868, 0x8C

	.global gUnknown_082068F4
gUnknown_082068F4:  @ 0x082068F4
	.incbin "baserom.gba", 0x2068F4, 0x8

	.global gUnknown_082068FC
gUnknown_082068FC:  @ 0x082068FC
	.incbin "baserom.gba", 0x2068FC, 0x8

	.global gUnknown_08206904
gUnknown_08206904:  @ 0x08206904
	.incbin "baserom.gba", 0x206904, 0x44

	.global gUnknown_08206948
gUnknown_08206948:  @ 0x08206948
	.incbin "baserom.gba", 0x206948, 0x9

	.global gUnknown_08206951
gUnknown_08206951:  @ 0x08206951
	.incbin "baserom.gba", 0x206951, 0x3

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
    .4byte gUnknown_08A708A7 + 0xf435
    .4byte gUnknown_08A708A7 + 0x1233d
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
    .4byte gUnknown_08A708A7 + 0xf8e9
    .4byte gUnknown_08A708A7 + 0x123fd
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
    .4byte gUnknown_08A708A7 + 0xfd9d
    .4byte gUnknown_08A708A7 + 0x124bd
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
    .4byte gUnknown_08A708A7 + 0x10251
    .4byte gUnknown_08A708A7 + 0x1257d
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
    .4byte gUnknown_08A708A7 + 0x10705
    .4byte gUnknown_08A708A7 + 0x1263d
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
    .4byte gUnknown_08A708A7 + 0x10bb9
    .4byte gUnknown_08A708A7 + 0x126fd
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
    .4byte gUnknown_08A708A7 + 0x1106d
    .4byte gUnknown_08A708A7 + 0x127bd
    .4byte 0x00000078
    .4byte gUnknown_08A708A7 + 0x4d
    .4byte gUnknown_08A708A7 + 0x65d
    .4byte gUnknown_08A708A7 + 0xe39
    .4byte gUnknown_08A708A7 + 0x163d
    .4byte gUnknown_08A708A7 + 0x1e71
    .4byte gUnknown_08A708A7 + 0x269d
    .4byte gUnknown_08A708A7 + 0x2ef9
    .4byte gUnknown_08A708A7 + 0x3749
    .4byte gUnknown_08A708A7 + 0x3f65
    .4byte gUnknown_08A708A7 + 0x474d
    .4byte gUnknown_08A708A7 + 0x11521
    .4byte gUnknown_08A708A7 + 0x1287d
    .4byte 0x00000078
    .4byte gUnknown_08A708A7 + 0x4f91
    .4byte gUnknown_08A708A7 + 0x5709
    .4byte gUnknown_08A708A7 + 0x5f55
    .4byte gUnknown_08A708A7 + 0x67c9
    .4byte gUnknown_08A708A7 + 0x7031
    .4byte gUnknown_08A708A7 + 0x7845
    .4byte gUnknown_08A708A7 + 0x8085
    .4byte gUnknown_08A708A7 + 0x88e1
    .4byte gUnknown_08A708A7 + 0x9145
    .4byte gUnknown_08A708A7 + 0x9971
    .4byte gUnknown_08A708A7 + 0x119d5
    .4byte gUnknown_08A708A7 + 0x1293d
    .4byte 0x00000078
    .4byte gUnknown_08A708A7 + 0xa165
    .4byte gUnknown_08A708A7 + 0xa94d
    .4byte gUnknown_08A708A7 + 0xb185
    .4byte gUnknown_08A708A7 + 0xb9d9
    .4byte gUnknown_08A708A7 + 0xc229
    .4byte gUnknown_08A708A7 + 0xca7d
    .4byte gUnknown_08A708A7 + 0xd2c9
    .4byte gUnknown_08A708A7 + 0xdb39
    .4byte gUnknown_08A708A7 + 0xe395
    .4byte gUnknown_08A708A7 + 0xebed
    .4byte gUnknown_08A708A7 + 0x11e89
    .4byte gUnknown_08A708A7 + 0x129fd
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

	.global gUnknown_08206FE4
gUnknown_08206FE4:  @ 0x08206FE4
    .4byte gUnknown_08AA239C + 0x20
    .4byte gUnknown_08AA239C + 0x38e8
    .4byte 0x0000014f
    .4byte gUnknown_08AA239C + 0xe18
    .4byte gUnknown_08AA239C + 0x3b44
    .4byte 0x00000118
    .4byte gUnknown_08AA239C + 0x1748
    .4byte gUnknown_08AA239C + 0x3cfc
    .4byte 0x00000078
    .4byte gUnknown_08AA239C + 0x19e0
    .4byte gUnknown_08AA239C + 0x3dd4
    .4byte 0x00000118
    .4byte gUnknown_08AA239C + 0x1fc0
    .4byte gUnknown_08AA239C + 0x3f00
    .4byte 0x0000014a
    .4byte gUnknown_08AA239C + 0x2fa8
    .4byte gUnknown_08AA239C + 0x41ac
    .4byte 0x0000012c
    .4byte gUnknown_08AA239C + 0x35b8
    .4byte gUnknown_08AA239C + 0x42d8
    .4byte 0x000000fa

