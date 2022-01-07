	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song555_1
song555_1:	@ 0x085822F0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 52
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song555
song555:	@ 0x08582300
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song555_1		@ track
