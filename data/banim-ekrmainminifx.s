	.section .data

	.global gUnknown_085C72AC
gUnknown_085C72AC:  @ 0x085C72AC
    .4byte 0x10000000 + AnimScr_EfxLvupOBJ2 + 0x44
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
    .incbin "baserom.gba", 0x5C7440, 0x5C74B4 - 0x5C7440
