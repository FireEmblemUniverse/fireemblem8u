	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song110_1
song110_1:	@ 0x0857D2B8
	.byte	VOL	, v050
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 8
	.byte		N02	, Ds4, v127
	.byte	W02
	.byte	FINE

	.align 2
	.global song110
song110:	@ 0x0857D2C8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song110_1		@ track
