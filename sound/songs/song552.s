	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song552_1
song552_1:	@ 0x0858229C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 51
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song552
song552:	@ 0x085822AC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song552_1		@ track
