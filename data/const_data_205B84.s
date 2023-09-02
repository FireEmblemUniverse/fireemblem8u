    .section .rodata

	.incbin "baserom.gba", 0x205B74, 0x10

	.global gUnknown_08205B84
gUnknown_08205B84:  @ 0x08205B84
	.incbin "baserom.gba", 0x205B84, 0x10

	.global gUnknown_08205B94
gUnknown_08205B94:  @ 0x08205B94
	.incbin "baserom.gba", 0x205B94, 0x1C

	.global gUnknown_08205BB0
gUnknown_08205BB0:  @ 0x08205BB0
@ replacing .incbin "baserom.gba", 0x00205bb0, 0x10
.4byte Img_PrepPopupWindow + 0x74
.4byte Img_PrepPopupWindow + 0x94
.4byte Img_PrepPopupWindow + 0xb4
.4byte Img_PrepPopupWindow + 0xd4
