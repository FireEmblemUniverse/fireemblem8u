	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song788_1
song788_1:	@ 0x08583F80
	.byte	TEMPO	, 75
	.byte	VOL	, v115
	.byte	KEYSH	, 0
	.byte	VOICE	, 116
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song788
song788:	@ 0x08583F90
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song788_1		@ track
