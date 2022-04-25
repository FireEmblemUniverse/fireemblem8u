	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song834_1
song834_1:	@ 0x085847BC
	.byte	TEMPO	, 75
	.byte	VOL	, v050
	.byte	VOICE	, 4
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song834
song834:	@ 0x085847CC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song834_1		@ track
