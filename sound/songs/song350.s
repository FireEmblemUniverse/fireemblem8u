	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song350_1
song350_1:	@ 0x0858142C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 8
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song350
song350:	@ 0x0858143C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song350_1		@ track
