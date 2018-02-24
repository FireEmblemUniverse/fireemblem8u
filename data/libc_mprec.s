    .section .rodata

	.global p05_27
p05_27:  @ 0x085877D0
	.incbin "baserom.gba", 0x5877D0, 0xC

	.global __mprec_tens
__mprec_tens:  @ 0x085877DC
	.incbin "baserom.gba", 0x5877DC, 0xC8

	.global __mprec_bigtens
__mprec_bigtens:  @ 0x085878A4
	.incbin "baserom.gba", 0x5878A4, 0x50
