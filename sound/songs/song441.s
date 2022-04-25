	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song441_1
song441_1:	@ 0x08581B48
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 23
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song441
song441:	@ 0x08581B58
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song441_1		@ track
