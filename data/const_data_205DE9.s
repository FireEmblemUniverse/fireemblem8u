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
	.incbin "baserom.gba", 0x205E50, 0x3C
