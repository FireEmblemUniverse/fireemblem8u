	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song584_1
song584_1:	@ 0x085824CC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 62
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song584
song584:	@ 0x085824DC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song584_1		@ track
