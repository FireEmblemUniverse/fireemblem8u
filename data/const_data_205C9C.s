    .section .rodata

	.global gInitialMultiArenaRankings
gInitialMultiArenaRankings:  @ 0x08205CB4
	.incbin "baserom.gba", 0x205CB4, 0xC8

	.global gUnknown_08205D7C
gUnknown_08205D7C:  @ 0x08205D7C
	.incbin "baserom.gba", 0x205D7C, 0x8
