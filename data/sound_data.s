	.section .rodata

    .align 4
    .incbin "baserom.gba", 0x207470, 0x1CF94 @ voicegroup data

	.global gMPlayTable
gMPlayTable:  @ 0x08224404
	.incbin "baserom.gba", 0x224404, 0x6C

	.global gSongTable
gSongTable:  @ 0x08224470
	.incbin "baserom.gba", 0x224470, 0x363290
