	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song482_1
song482_1:	@ 0x08581E04
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 17
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song482
song482:	@ 0x08581E14
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song482_1		@ track
