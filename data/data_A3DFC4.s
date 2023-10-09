    .section .data

	.global gUnknown_08A3E22C
gUnknown_08A3E22C:  @ 0x08A3E22C
	.incbin "baserom.gba", 0xA3E22C, 0x10

	.global gUnknown_08A3E23C
gUnknown_08A3E23C:  @ 0x08A3E23C
@ Replacing .incbin "baserom.gba", 0xA3E23C, 0xC
    .4byte 0x8001000
    .4byte 0x1000
    .4byte 0x0
