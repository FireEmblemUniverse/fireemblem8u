	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song997_1
song997_1:	@ 0x08587690
	.byte	TEMPO	, 75
	.byte	VOL	, v080
	.byte	KEYSH	, 0
	.byte	VOICE	, 125
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song997
song997:	@ 0x085876A0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song997_1		@ track
