	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song155_1
song155_1:	@ 0x0857E0C8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 5
	.byte	VOL	, v112
	.byte	PAN	, c_v
	.byte		N12	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song155
song155:	@ 0x0857E0D8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song155_1		@ track
