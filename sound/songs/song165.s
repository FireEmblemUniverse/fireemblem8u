	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song165_1
song165_1:	@ 0x0857E1E0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 1
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte		N16	, Bn2, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song165
song165:	@ 0x0857E1F0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song165_1		@ track
