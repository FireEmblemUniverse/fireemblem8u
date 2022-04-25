	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song511_1
song511_1:	@ 0x08581FE0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 36
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song511
song511:	@ 0x08581FF0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song511_1		@ track
