    .section .data

    .incbin "baserom.gba", 0x8B63D8, 0x8D1F54 - 0x8B63D8

	.global gUnitDefSumDK
gUnitDefSumDK:  @ 0x088D1F54
	.incbin "baserom.gba", 0x8D1F54, 0x104
