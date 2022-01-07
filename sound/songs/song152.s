	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song152_1
song152_1:	@ 0x0857E074
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 0
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte		N12	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song152
song152:	@ 0x0857E084
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song152_1		@ track
