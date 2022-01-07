	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song402_1
song402_1:	@ 0x085818C4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 1
	.byte	VOL	, v110
	.byte		N14	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song402
song402:	@ 0x085818D4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song402_1		@ track
