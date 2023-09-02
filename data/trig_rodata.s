	.section .rodata

	.align 2

	.global gSinLookup
gSinLookup:  @ 0x080D751C
	.incbin "baserom.gba", 0xD751C, 0x280
