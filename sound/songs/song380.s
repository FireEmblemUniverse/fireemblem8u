	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song380_1
song380_1:	@ 0x085816CC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 20
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song380
song380:	@ 0x085816DC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song380_1		@ track
