	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song471_1
song471_1:	@ 0x08581D40
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 13
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song471
song471:	@ 0x08581D50
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song471_1		@ track
