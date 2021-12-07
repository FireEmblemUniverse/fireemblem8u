    .section .data

	.global gMonsterLevelWeights
gMonsterLevelWeights:  @ 0x088D2058
	.incbin "baserom.gba", 0x8D2058, 0x8

	.global gMonsterClassWeights
gMonsterClassWeights:  @ 0x088D2060
	.incbin "baserom.gba", 0x8D2060, 0x168

	.global gUnknown_088D21C8
gUnknown_088D21C8:  @ 0x088D21C8
	.incbin "baserom.gba", 0x8D21C8, 0xFF

	.global gUnknown_088D22C7
gUnknown_088D22C7:  @ 0x088D22C7
	.incbin "baserom.gba", 0x8D22C7, 0x179

	.global gUnknown_088D2440
gUnknown_088D2440:  @ 0x088D2440
	.incbin "baserom.gba", 0x8D2440, 0x2C0
