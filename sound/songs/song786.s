	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song786_1
song786_1:	@ 0x08583F48
	.byte	TEMPO	, 75
	.byte	VOL	, v090
	.byte	KEYSH	, 0
	.byte	VOICE	, 113
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song786
song786:	@ 0x08583F58
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song786_1		@ track
