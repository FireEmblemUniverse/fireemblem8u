	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song404_1
song404_1:	@ 0x085818FC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 2
	.byte	VOL	, v110
	.byte		N17	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song404
song404:	@ 0x0858190C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song404_1		@ track
