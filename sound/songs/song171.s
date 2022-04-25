	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song171_1
song171_1:	@ 0x0857E29C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 46
	.byte	VOL	, v127
	.byte		N44	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song171
song171:	@ 0x0857E2AC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song171_1		@ track
