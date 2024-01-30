    .section .rodata

	.global gUnknown_080DAF60
gUnknown_080DAF60:  @ 0x080DAF60
	.incbin "baserom.gba", 0xDAF60, 0xC6

	.global gUnknown_080DB026
gUnknown_080DB026:  @ 0x080DB026
	.incbin "baserom.gba", 0xDB026, 0xDB034 - 0xDB026

	.global Img_080DB034
Img_080DB034:
	.incbin "baserom.gba", 0xDB034, 0xDB538 - 0xDB034

	.global Img_080DB538
Img_080DB538:
	.incbin "baserom.gba", 0xDB538, 0xDB9C4 - 0xDB538

	.global Img_080DB9C4
Img_080DB9C4:
	.incbin "baserom.gba", 0xDB9C4, 0xDBE1C - 0xDB9C4

	.global Img_080DBE1C
Img_080DBE1C:
	.incbin "baserom.gba", 0xDBE1C, 0xDC350 - 0xDBE1C

	.global Img_080DC350
Img_080DC350:
	.incbin "baserom.gba", 0xDC350, 0xDC85C - 0xDC350

	.global Pal_080DC85C
Pal_080DC85C:  @ 0x080DC85C
	.incbin "baserom.gba", 0xDC85C, 0xDC860 - 0xDC85C
