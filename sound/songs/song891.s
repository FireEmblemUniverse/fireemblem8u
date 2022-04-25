	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song891_1
song891_1:	@ 0x08584AA8
	.byte	TEMPO	, 75
	.byte	VOL	, v105
	.byte	VOICE	, 87
	.byte	KEYSH	, 0
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song891
song891:	@ 0x08584AB8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song891_1		@ track
