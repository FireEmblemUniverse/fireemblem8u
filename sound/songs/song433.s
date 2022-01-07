	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song433_1
song433_1:	@ 0x08581AD8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 21
	.byte	VOL	, v110
	.byte		N14	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song433
song433:	@ 0x08581AE8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song433_1		@ track
