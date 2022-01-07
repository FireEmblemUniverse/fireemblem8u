	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song423_1
song423_1:	@ 0x08581A30
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 7
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song423
song423:	@ 0x08581A40
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song423_1		@ track
