	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song757_1
song757_1:	@ 0x08583D48
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 69
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte		N96	, Gn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song757
song757:	@ 0x08583D58
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song757_1		@ track
