    .section .rodata

	.incbin "baserom.gba", 0xDFA2C, 0xE1164 - 0xDFA2C

	.global Pal_080E1164
Pal_080E1164:  @ 0x080E1164
	.incbin "baserom.gba", 0xE1164, 0x230
