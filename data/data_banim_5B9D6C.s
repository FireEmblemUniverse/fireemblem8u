	.section .data

	.global gUnknown_085B9E58
gUnknown_085B9E58:  @ 0x085B9E58
	.incbin "baserom.gba", 0x5B9E58, 0x98    @ 0x5B9EF0 - 0x5B9E58

	.global gUnknown_085B9EF0
gUnknown_085B9EF0:  @ 0x085B9EF0
	.incbin "baserom.gba", 0x5B9EF0, 0x98    @ 0x5B9F88 - 0x5B9EF0

	.global gUnknown_085B9F88
gUnknown_085B9F88:  @ 0x085B9F88
	.incbin "baserom.gba", 0x5B9F88, 0x98    @ 0x5BA020 - 0x5B9F88

	.global gUnknown_085BA020
gUnknown_085BA020:  @ 0x085BA020
	.incbin "baserom.gba", 0x5BA020, 0x98    @ 0x5BA0B8 - 0x5BA020

	.global Img_NODAMGEMIS
Img_NODAMGEMIS:  @ 0x085BA0B8
	.incbin "baserom.gba", 0x5BA0B8, 0x228

	.global Pal_085BA2E0
Pal_085BA2E0:  @ 0x085BA2E0
	.incbin "baserom.gba", 0x5BA2E0, 0x20

	.global Pal_085BA300
Pal_085BA300:  @ 0x085BA300
	.incbin "baserom.gba", 0x5BA300, 0x20

	.global Pal_085BA320
Pal_085BA320:  @ 0x085BA320
	.incbin "baserom.gba", 0x5BA320, 0x20

	.global gUnknown_085BA340
gUnknown_085BA340:  @ 0x085BA340
	.incbin "baserom.gba", 0x5BA340, 0x5BB0C8 - 0x5BA340
