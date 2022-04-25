	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song213_1
song213_1:	@ 0x0857E974
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 113
	.byte	VOL	, v125
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song213
song213:	@ 0x0857E984
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song213_1		@ track
