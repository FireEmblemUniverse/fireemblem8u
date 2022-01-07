	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song787_1
song787_1:	@ 0x08583F64
	.byte	TEMPO	, 75
	.byte	VOL	, v105
	.byte	KEYSH	, 0
	.byte	VOICE	, 115
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song787
song787:	@ 0x08583F74
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song787_1		@ track
