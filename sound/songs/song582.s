	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song582_1
song582_1:	@ 0x08582494
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 61
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song582
song582:	@ 0x085824A4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song582_1		@ track
