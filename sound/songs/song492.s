	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song492_1
song492_1:	@ 0x08581EAC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 31
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song492
song492:	@ 0x08581EBC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song492_1		@ track
