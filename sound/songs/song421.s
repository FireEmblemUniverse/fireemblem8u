	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song421_1
song421_1:	@ 0x085819F8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 6
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song421
song421:	@ 0x08581A08
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song421_1		@ track
