    .section .data

	.global gMonsterItemWeightsTable
gMonsterItemWeightsTable:  @ 0x088D22C7
	.incbin "baserom.gba", 0x8D22C7, 0x179

	.global gMonsterItemsByClassIndex
gMonsterItemsByClassIndex:  @ 0x088D2440
	.incbin "baserom.gba", 0x8D2440, 0x2C0
