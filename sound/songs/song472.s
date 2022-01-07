	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song472_1
song472_1:	@ 0x08581D5C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 14
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song472
song472:	@ 0x08581D6C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song472_1		@ track
