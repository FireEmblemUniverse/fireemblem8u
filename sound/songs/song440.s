	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song440_1
song440_1:	@ 0x08581B2C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 23
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song440
song440:	@ 0x08581B3C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song440_1		@ track
