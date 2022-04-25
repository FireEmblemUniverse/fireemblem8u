	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song166_1
song166_1:	@ 0x0857E1FC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 9
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte		N14	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song166
song166:	@ 0x0857E20C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song166_1		@ track
