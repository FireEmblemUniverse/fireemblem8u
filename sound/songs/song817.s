	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song817_1
song817_1:	@ 0x08584748
	.byte	TEMPO	, 75
	.byte	VOL	, v099
	.byte	VOICE	, 45
	.byte	KEYSH	, 0
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song817
song817:	@ 0x08584758
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song817_1		@ track
