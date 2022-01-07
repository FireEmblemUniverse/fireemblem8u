	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song430_1
song430_1:	@ 0x08581A84
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 20
	.byte	VOL	, v110
	.byte		N16	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song430
song430:	@ 0x08581A94
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song430_1		@ track
