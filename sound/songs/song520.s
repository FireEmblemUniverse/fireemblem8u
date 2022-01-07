	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song520_1
song520_1:	@ 0x0858206C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 40
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song520
song520:	@ 0x0858207C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song520_1		@ track
