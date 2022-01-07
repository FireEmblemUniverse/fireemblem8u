	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song876_1
song876_1:	@ 0x08584960
	.byte	TEMPO	, 75
	.byte	VOL	, v127
	.byte	VOICE	, 27
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song876
song876:	@ 0x08584970
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song876_1		@ track
