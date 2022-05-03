	.include "MPlayDef.s"

	.section .rodata

	.align 2
	.global dummy_song
dummy_song:	@ 0x082263B0
	.byte	0		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	0		@ reverb

