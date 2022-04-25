	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song856_1
song856_1:	@ 0x085848B8
	.byte	TEMPO	, 75
	.byte	VOL	, v099
	.byte	VOICE	, 25
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song856
song856:	@ 0x085848C8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song856_1		@ track
