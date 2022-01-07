	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song172_1
song172_1:	@ 0x0857E2B8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 47
	.byte	VOL	, v127
	.byte		N20	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song172
song172:	@ 0x0857E2C8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song172_1		@ track
