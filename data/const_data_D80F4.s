    .section .rodata

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

