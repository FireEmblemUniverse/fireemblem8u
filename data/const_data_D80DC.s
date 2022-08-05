    .section .rodata

	.incbin "baserom.gba", 0xD80DC, 0xC

	.global gUnknown_080D80E8
gUnknown_080D80E8:  @ 0x080D80E8
	.incbin "baserom.gba", 0xD80E8, 0xC

	.global gUnknown_080D80F4
gUnknown_080D80F4:  @ 0x080D80F4
	.incbin "baserom.gba", 0xD80F4, 0x8

	.global gUnknown_080D80FC
gUnknown_080D80FC:  @ 0x080D80FC
@ replacing .incbin "baserom.gba", 0x000d80fc, 0x7c
.4byte sub_803C648
.4byte sub_803C6EC
.4byte sub_803C71C
.4byte sub_803C78C
.4byte sub_803C974
.4byte sub_803CA0C
.4byte sub_803CA7C
.4byte sub_803CA84
.4byte sub_803CAE4
.4byte sub_803CB34
.4byte sub_803CB50
.4byte sub_803CB6C
.4byte sub_803CB88
.4byte sub_803CBD4
.4byte sub_803CC90
.4byte sub_803CC98
.4byte sub_803CCDC
.4byte sub_803CDD4
.4byte sub_803CE18
.4byte sub_803CE98
.4byte sub_803CF18
.4byte sub_803CF20
.4byte sub_803CF28
.4byte sub_803CF3C
.4byte sub_803D228
.4byte sub_803D2D8
.4byte sub_803D354
.4byte sub_803D3D0
.4byte 0
.4byte 0
.4byte 0

	.global gUnknown_080D8178
gUnknown_080D8178:  @ 0x080D8178
	.incbin "baserom.gba", 0xD8178, 0x3C0

	.global gUnknown_080D8538
gUnknown_080D8538:  @ 0x080D8538
	.incbin "baserom.gba", 0xD8538, 0x144

	.global gUnknown_080D867C
gUnknown_080D867C:  @ 0x080D867C
	.incbin "baserom.gba", 0xD867C, 0x4

	.global gUnknown_080D8680
gUnknown_080D8680:  @ 0x080D8680
	.incbin "baserom.gba", 0xD8680, 0xC

	.global gUnknown_080D868C
gUnknown_080D868C:  @ 0x080D868C
	.incbin "baserom.gba", 0xD868C, 0x4

	.global gUnknown_080D8690
gUnknown_080D8690:  @ 0x080D8690
@ Replacing .incbin "baserom.gba", 0xD8690, 0x64
    .4byte sub_803FBB8
    .4byte 0x4c
    .4byte sub_803FBB8
    .4byte 0x4d
    .4byte sub_803FBB8
    .4byte 0x4e
    .4byte sub_803FD30
    .4byte 0x4f
    .4byte sub_803FF00
    .4byte 0x54
    .4byte sub_804000C
    .4byte 0x55
    .4byte sub_803FD30
    .4byte 0x50
    .4byte sub_8040164
    .4byte 0x51
    .4byte sub_8040354
    .4byte 0x52
    .4byte sub_80404E0
    .4byte 0x53
    .4byte sub_80404E0
    .4byte 0x59
    .4byte nullsub_29
    .4byte 0x0
    .4byte 0x0

