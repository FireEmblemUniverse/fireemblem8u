    .section .data

	.global gUnknown_088AFBD8
gUnknown_088AFBD8:  @ 0x088AFBD8
	.incbin "baserom.gba", 0x8AFBD8, 0xA20

	.global gAffinityBonuses
gAffinityBonuses:  @ 0x088B05F8
	.incbin "baserom.gba", 0x8B05F8, 0x298

	.global gChapterDataTable
gChapterDataTable:  @ 0x088B0890
	.incbin "baserom.gba", 0x8B0890, 0x60

	.global gUnknown_088B08F0
gUnknown_088B08F0:  @ 0x088B08F0
	.incbin "baserom.gba", 0x8B08F0, 0x2D4C

	.global gChapterDataAssetTable
gChapterDataAssetTable:  @ 0x088B363C
	.incbin "baserom.gba", 0x8B363C, 0x3B0

	.global gUnknown_088B39EC
gUnknown_088B39EC:  @ 0x088B39EC
	.incbin "baserom.gba", 0x8B39EC, 0xEC

	.global gUnknown_088B3AD8
gUnknown_088B3AD8:  @ 0x088B3AD8
	.incbin "baserom.gba", 0x8B3AD8, 0x1E47C

	.global gUnknown_088D1F54
gUnknown_088D1F54:  @ 0x088D1F54
	.incbin "baserom.gba", 0x8D1F54, 0x104
