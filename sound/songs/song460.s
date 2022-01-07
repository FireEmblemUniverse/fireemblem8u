	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song460_1
song460_1:	@ 0x08581C7C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 10
	.byte	VOL	, v110
	.byte		N17	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song460
song460:	@ 0x08581C8C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song460_1		@ track
