	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song500_1
song500_1:	@ 0x08581F1C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 33
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song500
song500:	@ 0x08581F2C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song500_1		@ track
