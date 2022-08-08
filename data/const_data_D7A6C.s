    .section .rodata

	.global gUnknown_080D7A6C
gUnknown_080D7A6C:  @ 0x080D7A6C
	.incbin "baserom.gba", 0xD7A6C, 0x10

	.global gUnknown_080D7A7C
gUnknown_080D7A7C:  @ 0x080D7A7C
	.incbin "baserom.gba", 0xD7A7C, 0xC

	.global gUnknown_080D7A88
gUnknown_080D7A88:  @ 0x080D7A88
	.incbin "baserom.gba", 0xD7A88, 0x4

	.global gUnknown_080D7A8C
gUnknown_080D7A8C:  @ 0x080D7A8C
	.incbin "baserom.gba", 0xD7A8C, 0x28

	.global gUnknown_080D7AB4
gUnknown_080D7AB4:  @ 0x080D7AB4
@ replacing .incbin "baserom.gba", 0x000d7ab4, 0x10
.4byte gUnknown_080D7A8C + 0x8
.4byte gUnknown_080D7A8C + 0x10
.4byte gUnknown_080D7A8C + 0x18
.4byte gUnknown_080D7A8C + 0x20

	.global gUnknown_080D7AC4
gUnknown_080D7AC4:  @ 0x080D7AC4
	.incbin "baserom.gba", 0xD7AC4, 0x18

