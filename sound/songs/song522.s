	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song522_1
song522_1:	@ 0x085820A4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 41
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song522
song522:	@ 0x085820B4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song522_1		@ track
