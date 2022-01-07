	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song351_1
song351_1:	@ 0x08581448
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 8
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song351
song351:	@ 0x08581458
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song351_1		@ track
