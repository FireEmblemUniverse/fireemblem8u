	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song207_1
song207_1:	@ 0x0857E8AC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 9
	.byte	VOL	, v127
	.byte		N12	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song207
song207:	@ 0x0857E8BC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song207_1		@ track
