    .section .rodata

	.incbin "baserom.gba", 0xDA4AC, 0xDA4BA - 0xDA4AC

	.global gUnknown_080DA4BA
gUnknown_080DA4BA:  @ 0x080DA4BA
	.incbin "baserom.gba", 0xDA4BA, 0x22

	.global gEfxQuakeVecs
gEfxQuakeVecs:  @ 0x080DA4DC
	.incbin "baserom.gba", 0xDA4DC, 0x4A

	.global gUnknown_080DA526
gUnknown_080DA526:  @ 0x080DA526
	.incbin "baserom.gba", 0xDA526, 0x4A

	.global gEfxQuakeVecs2
gEfxQuakeVecs2:  @ 0x080DA570
	.incbin "baserom.gba", 0xDA570, 0x4A

	.global gUnknown_080DA5BA
gUnknown_080DA5BA:  @ 0x080DA5BA
	.incbin "baserom.gba", 0xDA5BA, 0x4A

	.global gUnknown_080DA604
gUnknown_080DA604:  @ 0x080DA604
	.incbin "baserom.gba", 0xDA604, 0x6A

	.global gUnknown_080DA66E
gUnknown_080DA66E:  @ 0x080DA66E
	.incbin "baserom.gba", 0xDA66E, 0x38A

	.global gUnknown_080DA9F8
gUnknown_080DA9F8:  @ 0x080DA9F8
	.incbin "baserom.gba", 0xDA9F8, 0x96

	.global gUnknown_080DAA8E
gUnknown_080DAA8E:  @ 0x080DAA8E
	.incbin "baserom.gba", 0xDAA8E, 0xDABF8 - 0xDAA8E
