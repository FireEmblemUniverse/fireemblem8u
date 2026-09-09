    .section .rodata

	.global Tm_BanimMiniBlank
Tm_BanimMiniBlank:  @ 0x080DAF60
	@ Packed 15-by-5 tilemap used to clear the miniature battle background.
	@ EfxTmCpyExt reads 75 halfwords with no source row padding.
	.fill 15 * 5, 2, 0
	.balign 4, 0
