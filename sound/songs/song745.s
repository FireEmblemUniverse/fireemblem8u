	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song745_1
song745_1:	@ 0x08583518
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 63
	.byte	VOL	, v115
	.byte	PAN	, c_v
	.byte		N06	, Cs3, v127
	.byte		N06	, An3
	.byte	W06
	.byte	FINE

	.align 2
	.global song745
song745:	@ 0x0858352C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song745_1		@ track
