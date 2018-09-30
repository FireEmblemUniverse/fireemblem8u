	.section .rodata

	.global gMPlayJumpTableTemplate
gMPlayJumpTableTemplate:  @ 0x08207190
	.incbin "baserom.gba", 0x207190, 0x90

	.global gScaleTable
gScaleTable:  @ 0x08207220
	.incbin "baserom.gba", 0x207220, 0xB4

	.global gFreqTable
gFreqTable:  @ 0x082072D4
	.incbin "baserom.gba", 0x2072D4, 0x30

	.global gPcmSamplesPerVBlankTable
gPcmSamplesPerVBlankTable:  @ 0x08207304
	.incbin "baserom.gba", 0x207304, 0x18

	.global gCgbScaleTable
gCgbScaleTable:  @ 0x0820731C
	.incbin "baserom.gba", 0x20731C, 0x84

	.global gCgbFreqTable
gCgbFreqTable:  @ 0x082073A0
	.incbin "baserom.gba", 0x2073A0, 0x18

	.global gNoiseTable
gNoiseTable:  @ 0x082073B8
	.incbin "baserom.gba", 0x2073B8, 0x3C

	.global gUnknown_082073F4
gUnknown_082073F4:  @ 0x082073F4
	.incbin "baserom.gba", 0x2073F4, 0x10

	.global gClockTable
gClockTable:  @ 0x08207404
	.incbin "baserom.gba", 0x207404, 0x34

	.global gXcmdTable
gXcmdTable:  @ 0x08207438
	.incbin "baserom.gba", 0x207438, 0x1CFCC

	.global gMPlayTable
gMPlayTable:  @ 0x08224404
	.incbin "baserom.gba", 0x224404, 0x6C

	.global gSongTable
gSongTable:  @ 0x08224470
	.incbin "baserom.gba", 0x224470, 0x363290
