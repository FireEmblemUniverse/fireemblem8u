	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song524_1
song524_1:	@ 0x085820DC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 42
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song524
song524:	@ 0x085820EC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song524_1		@ track
