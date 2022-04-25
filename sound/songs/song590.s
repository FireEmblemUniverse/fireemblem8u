	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song590_1
song590_1:	@ 0x08582504
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 63
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song590
song590:	@ 0x08582514
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song590_1		@ track
