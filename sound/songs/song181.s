	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song181_1
song181_1:	@ 0x0857E3D4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 79
	.byte	VOL	, v110
	.byte	W04
	.byte		N44	, Cn3, v127
	.byte	W20
	.byte	W24
	.byte	FINE

	.align 2
	.global song181
song181:	@ 0x0857E3E4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song181_1		@ track
