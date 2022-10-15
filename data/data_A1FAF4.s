    .section .data

	.global gpSaveDataStart
gpSaveDataStart:  @ 0x08A1FAF4
	.incbin "baserom.gba", 0xA1FAF4, 0x4

	.global gUnknown_08A1FAF8
gUnknown_08A1FAF8:  @ 0x08A1FAF8
	.incbin "baserom.gba", 0xA1FAF8, 0x10

	.global gUnknown_08A1FB08
gUnknown_08A1FB08:  @ 0x08A1FB08
	.incbin "baserom.gba", 0xA1FB08, 0x28

	.global gUnknown_08A1FB30
gUnknown_08A1FB30:  @ 0x08A1FB30
	.incbin "baserom.gba", 0xA1FB30, 0x4

	.global gUnknown_08A1FB34
gUnknown_08A1FB34:  @ 0x08A1FB34
    .incbin "baserom.gba", 0x00a1fb34, 0x4
