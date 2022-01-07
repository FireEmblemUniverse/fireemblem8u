	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song204_1
song204_1:	@ 0x0857E858
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 10
	.byte	VOL	, v110
	.byte		N12	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song204
song204:	@ 0x0857E868
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song204_1		@ track
