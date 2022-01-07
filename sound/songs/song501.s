	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song501_1
song501_1:	@ 0x08581F38
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 33
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song501
song501:	@ 0x08581F48
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song501_1		@ track
