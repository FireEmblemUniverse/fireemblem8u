	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song108_1
song108_1:	@ 0x0857D1B8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 3
	.byte	PRIO	, 10
	.byte	VOL	, v110
	.byte		N02	, Cn2, v127
	.byte	W04
	.byte		N17	, Cn2, v108
	.byte	W12
	.byte	PRIO	, 0
	.byte	W08
	.byte	FINE

	.align 2
	.global song108
song108:	@ 0x0857D1D0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song108_1		@ track
