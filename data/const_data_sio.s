    .section .rodata

	.global gTacticianTextConf
gTacticianTextConf:  @ 0x080D8740
	.incbin "baserom.gba", 0xD8740, 0x155E

	.global gUnknown_080D9C9E
gUnknown_080D9C9E:  @ 0x080D9C9E
	.incbin "baserom.gba", 0xD9C9E, 0x96

	.global gUnknown_080D9D34
gUnknown_080D9D34:  @ 0x080D9D34
	.incbin "baserom.gba", 0xD9D34, 0x14
