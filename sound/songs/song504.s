	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song504_1
song504_1:	@ 0x08581F8C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 35
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song504
song504:	@ 0x08581F9C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song504_1		@ track
