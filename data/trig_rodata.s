	.section .rodata

	.align 2

	.global gSinLookup
gSinLookup:  @ 0x080D751C
	.incbin "baserom.gba", 0xD751C, 0x80

	.global gCosLookup
gCosLookup:  @ 0x080D759C
	.incbin "baserom.gba", 0xD759C, 0x200
