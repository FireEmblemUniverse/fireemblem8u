	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song151_1
song151_1:	@ 0x0857E058
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 0
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte		N12	, Bn2, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song151
song151:	@ 0x0857E068
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song151_1		@ track
