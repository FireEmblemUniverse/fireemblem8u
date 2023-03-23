    .section .rodata

	.global gGlobalSaveInfoName
gGlobalSaveInfoName:  @ 0x08205C9C
	.incbin "baserom.gba", 0x205C9C, 0x8

	.global gUnknown_08205CA4
gUnknown_08205CA4:  @ 0x08205CA4
	.incbin "baserom.gba", 0x205CA4, 0x8

	.global gUnknown_08205CAC
gUnknown_08205CAC:  @ 0x08205CAC
	.incbin "baserom.gba", 0x205CAC, 0x8

	.global gUnknown_08205CB4
gUnknown_08205CB4:  @ 0x08205CB4
	.incbin "baserom.gba", 0x205CB4, 0xC8

	.global gUnknown_08205D7C
gUnknown_08205D7C:  @ 0x08205D7C
	.incbin "baserom.gba", 0x205D7C, 0x8
