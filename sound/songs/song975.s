	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song975_1
song975_1:	@ 0x0858698C
	.byte	TEMPO	, 75
	.byte	VOL	, v110
	.byte	VOICE	, 107
	.byte	KEYSH	, 0
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song975
song975:	@ 0x0858699C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song975_1		@ track
