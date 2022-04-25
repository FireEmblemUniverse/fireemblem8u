	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song874_1
song874_1:	@ 0x08584944
	.byte	TEMPO	, 75
	.byte	VOL	, v080
	.byte	VOICE	, 8
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song874
song874:	@ 0x08584954
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song874_1		@ track
