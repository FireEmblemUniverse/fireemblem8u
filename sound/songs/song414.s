	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song414_1
song414_1:	@ 0x085819A4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 5
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song414
song414:	@ 0x085819B4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song414_1		@ track
