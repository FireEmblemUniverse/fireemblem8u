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

	.global gUnknown_08205C44
gUnknown_08205C44:  @ 0x08205C44
	.incbin "baserom.gba", 0x205C44, 0x20

	.global gUnknown_08205C64
gUnknown_08205C64:  @ 0x08205C64
@ replacing .incbin "baserom.gba", 0x00205c64, 0xc
.4byte gUnknown_02013560
.4byte gUnknown_02013560 + 0x8
.4byte gUnknown_02013570 + 0x10

	.global gUnknown_08205C70
gUnknown_08205C70:  @ 0x08205C70
	.incbin "baserom.gba", 0x205C70, 0x20
