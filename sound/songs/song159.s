	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song159_1
song159_1:	@ 0x0857E138
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 6
	.byte	VOL	, v112
	.byte	PAN	, c_v
	.byte		N12	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song159
song159:	@ 0x0857E148
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song159_1		@ track
