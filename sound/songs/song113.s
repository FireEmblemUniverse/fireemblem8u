	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song113_1
song113_1:	@ 0x0857D364
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 32
	.byte	VOL	, v127
	.byte		N06	, An5, v127
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			En5
	.byte	W06
	.byte			An4
	.byte	W06
	.byte	W24
	.byte	FINE

	@********************** Track  2 **********************@

	.global song113_2
song113_2:	@ 0x0857D378
	.byte	KEYSH	, 0
	.byte	VOICE	, 33
	.byte	VOL	, v040
	.byte		N06	, An6, v127
	.byte	W06
	.byte			Dn6
	.byte	W06
	.byte			En6
	.byte	W06
	.byte			An5
	.byte	W06
	.byte	W24
	.byte	FINE

	.align 2
	.global song113
song113:	@ 0x0857D38C
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song113_1		@ track
	.word	song113_2		@ track
