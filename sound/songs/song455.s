	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song455_1
song455_1:	@ 0x08581C60
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 28
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song455
song455:	@ 0x08581C70
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song455_1		@ track
