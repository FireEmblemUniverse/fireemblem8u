	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song473_1
song473_1:	@ 0x08581D78
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 14
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song473
song473:	@ 0x08581D88
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song473_1		@ track
