	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song200_1
song200_1:	@ 0x0857E7E8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 0
	.byte	VOL	, v090
	.byte		N13	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song200
song200:	@ 0x0857E7F8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song200_1		@ track
