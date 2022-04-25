	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song812_1
song812_1:	@ 0x08584678
	.byte	TEMPO	, 75
	.byte	VOL	, v127
	.byte	KEYSH	, 0
	.byte	VOICE	, 29
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song812
song812:	@ 0x08584688
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song812_1		@ track
