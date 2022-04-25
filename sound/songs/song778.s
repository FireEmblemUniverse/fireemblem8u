	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song778_1
song778_1:	@ 0x08583EAC
	.byte	TEMPO	, 75
	.byte	VOL	, v127
	.byte	VOICE	, 20
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song778
song778:	@ 0x08583EBC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song778_1		@ track
