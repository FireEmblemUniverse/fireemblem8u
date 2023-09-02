    .section .rodata

	.global gUnknown_08206868
gUnknown_08206868:  @ 0x08206868
	.incbin "baserom.gba", 0x206868, 0x8

	.global gAsciiStr_GmapMUPrim
gAsciiStr_GmapMUPrim:  @ 0x08206870
	.asciz "Gmap MU prim"
	.align 2, 0

	.global gAsciiStr_GmapMU
gAsciiStr_GmapMU:  @ 0x08206880
	.asciz "Gmap MU"
	.align 2, 0
