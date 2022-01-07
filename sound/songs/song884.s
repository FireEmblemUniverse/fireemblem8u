	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song884_1
song884_1:	@ 0x085849B4
	.byte	TEMPO	, 75
	.byte	VOL	, v080
	.byte	VOICE	, 9
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song884
song884:	@ 0x085849C4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song884_1		@ track
