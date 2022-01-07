	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song435_1
song435_1:	@ 0x08581B10
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 22
	.byte	VOL	, v110
	.byte		N17	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song435
song435:	@ 0x08581B20
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song435_1		@ track
