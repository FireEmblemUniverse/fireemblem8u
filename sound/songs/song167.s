	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song167_1
song167_1:	@ 0x0857E218
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 9
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte		N14	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song167
song167:	@ 0x0857E228
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song167_1		@ track
