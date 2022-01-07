	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song431_1
song431_1:	@ 0x08581AA0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 20
	.byte	VOL	, v110
	.byte		N16	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song431
song431:	@ 0x08581AB0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song431_1		@ track
