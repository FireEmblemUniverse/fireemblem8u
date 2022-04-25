	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song571_1
song571_1:	@ 0x085823D0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 56
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song571
song571:	@ 0x085823E0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song571_1		@ track
