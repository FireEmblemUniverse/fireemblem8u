	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song512_1
song512_1:	@ 0x08581FFC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 37
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song512
song512:	@ 0x0858200C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song512_1		@ track
