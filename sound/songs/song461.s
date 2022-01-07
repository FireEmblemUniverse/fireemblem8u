	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song461_1
song461_1:	@ 0x08581C98
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 10
	.byte	VOL	, v110
	.byte		N17	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song461
song461:	@ 0x08581CA8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song461_1		@ track
