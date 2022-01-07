	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song560_1
song560_1:	@ 0x0858230C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 53
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song560
song560:	@ 0x0858231C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song560_1		@ track
