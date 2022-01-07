	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song163_1
song163_1:	@ 0x0857E1A8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 1
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte		N16	, Bn2, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song163
song163:	@ 0x0857E1B8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song163_1		@ track
