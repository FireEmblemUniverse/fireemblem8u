	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song810_1
song810_1:	@ 0x0858461C
	.byte	TEMPO	, 75
	.byte	VOL	, v120
	.byte	VOICE	, 21
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song810
song810:	@ 0x0858462C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song810_1		@ track
