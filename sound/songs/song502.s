	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song502_1
song502_1:	@ 0x08581F54
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 34
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song502
song502:	@ 0x08581F64
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song502_1		@ track
