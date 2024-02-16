    .section .rodata

	.asciz "ekrDragonQuake"
	.align 2, 0

	.asciz "ekrWhiteINOUT"
	.align 2, 0

	.incbin "baserom.gba", 0xDFA2C, 0xE1164 - 0xDFA2C

	.global Pal_080E1164
Pal_080E1164:  @ 0x080E1164
	.incbin "baserom.gba", 0xE1164, 0x230
