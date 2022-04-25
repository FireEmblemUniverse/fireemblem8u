	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song393_1
song393_1:	@ 0x08581800
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 25
	.byte	VOL	, v080
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song393
song393:	@ 0x08581810
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song393_1		@ track
