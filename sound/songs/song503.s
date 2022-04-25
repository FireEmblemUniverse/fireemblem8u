	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song503_1
song503_1:	@ 0x08581F70
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 34
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song503
song503:	@ 0x08581F80
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song503_1		@ track
