	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song432_1
song432_1:	@ 0x08581ABC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 21
	.byte	VOL	, v110
	.byte		N14	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song432
song432:	@ 0x08581ACC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song432_1		@ track
