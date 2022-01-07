	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song818_1
song818_1:	@ 0x08584764
	.byte	TEMPO	, 75
	.byte	VOICE	, 61
	.byte	VOL	, v099
	.byte	KEYSH	, 0
	.byte		N08	, Cn3, v127
	.byte	W08
	.byte	VOL	, v031
	.byte		N08	, Cn3, v127
	.byte	W08
	.byte	FINE

	.align 2
	.global song818
song818:	@ 0x08584778
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song818_1		@ track
