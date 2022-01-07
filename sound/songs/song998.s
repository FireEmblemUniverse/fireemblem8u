	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song998_1
song998_1:	@ 0x085876AC
	.byte	TEMPO	, 75
	.byte	VOL	, v070
	.byte	KEYSH	, 0
	.byte	VOICE	, 126
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song998
song998:	@ 0x085876BC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song998_1		@ track
