	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song180_1
song180_1:	@ 0x0857E3B8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 78
	.byte	VOL	, v100
	.byte		N84	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song180
song180:	@ 0x0857E3C8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song180_1		@ track
