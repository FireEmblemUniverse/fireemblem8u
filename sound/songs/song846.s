	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song846_1
song846_1:	@ 0x08584848
	.byte	TEMPO	, 75
	.byte	VOL	, v099
	.byte	VOICE	, 24
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song846
song846:	@ 0x08584858
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song846_1		@ track
