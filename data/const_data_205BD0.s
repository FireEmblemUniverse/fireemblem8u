    .section .rodata

	.global gUnknown_08205BD8
gUnknown_08205BD8:  @ 0x08205BC8
	.incbin "baserom.gba", 0x205BD8, 0x24

	.global gUnknown_08205BFC
gUnknown_08205BFC:  @ 0x08205BFC
	.incbin "baserom.gba", 0x205BFC, 0x18

	.global gUnknown_08205C14
gUnknown_08205C14:  @ 0x08205C14
	.incbin "baserom.gba", 0x205C14, 0x20

	.global Pals_PrepWindow
Pals_PrepWindow:  @ 0x08205C34
@ replacing .incbin "baserom.gba", 0x00205c34, 0x10
.4byte Img_PrepPopupWindow + 0x74
.4byte Img_PrepPopupWindow + 0x94
.4byte Img_PrepPopupWindow + 0xb4
.4byte Img_PrepPopupWindow + 0xd4
