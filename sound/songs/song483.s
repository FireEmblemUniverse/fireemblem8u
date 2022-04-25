	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song483_1
song483_1:	@ 0x08581E20
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 17
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song483
song483:	@ 0x08581E30
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song483_1		@ track
