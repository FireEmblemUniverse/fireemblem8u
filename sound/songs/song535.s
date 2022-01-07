	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song535_1
song535_1:	@ 0x085821A0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 45
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song535
song535:	@ 0x085821B0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song535_1		@ track
