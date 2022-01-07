	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song726_1
song726_1:	@ 0x08583174
	.byte	TEMPO	, 75
	.byte	VOL	, v105
	.byte	KEYSH	, 0
	.byte	VOICE	, 119
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song726
song726:	@ 0x08583184
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song726_1		@ track
