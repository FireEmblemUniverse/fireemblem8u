    .section .rodata

	.incbin "baserom.gba", 0xDF334, 0xDF386 - 0xDF334

	.global gUnknown_080DF386
gUnknown_080DF386:  @ 0x080DF386
	.incbin "baserom.gba", 0xDF386, 0x16

	.global gUnknown_080DF39C
gUnknown_080DF39C:  @ 0x080DF39C
	.incbin "baserom.gba", 0xDF39C, 0x6

	.global gUnknown_080DF3A2
gUnknown_080DF3A2:  @ 0x080DF3A2
	.incbin "baserom.gba", 0xDF3A2, 0x22

	.global gUnknown_080DF3C4
gUnknown_080DF3C4:  @ 0x080DF3C4
	.incbin "baserom.gba", 0xDF3C4, 0x130

	.global gUnknown_080DF4F4
gUnknown_080DF4F4:  @ 0x080DF4F4
	.incbin "baserom.gba", 0xDF4F4, 0x52

	.global gUnknown_080DF546
gUnknown_080DF546:  @ 0x080DF546
	.incbin "baserom.gba", 0xDF546, 0x22

	.global gUnknown_080DF568
gUnknown_080DF568:  @ 0x080DF568
	.incbin "baserom.gba", 0xDF568, 0xDF5C4 - 0xDF568
