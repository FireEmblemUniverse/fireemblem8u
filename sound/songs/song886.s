	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song886_1
song886_1:	@ 0x085849D0
	.byte	TEMPO	, 75
	.byte	VOL	, v099
	.byte	VOICE	, 28
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song886
song886:	@ 0x085849E0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song886_1		@ track
