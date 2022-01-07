	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song340_1
song340_1:	@ 0x0858134C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 4
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song340
song340:	@ 0x0858135C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song340_1		@ track
