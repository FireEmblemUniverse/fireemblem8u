	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song612_1
song612_1:	@ 0x0858268C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 121
	.byte	VOL	, v120
	.byte		N36	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song612
song612:	@ 0x0858269C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song612_1		@ track
