	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song531_1
song531_1:	@ 0x08582130
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 43
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song531
song531:	@ 0x08582140
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song531_1		@ track
