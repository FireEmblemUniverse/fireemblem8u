	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song112_1
song112_1:	@ 0x0857D32C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 32
	.byte	VOL	, v127
	.byte		N06	, An4, v127
	.byte	W06
	.byte			En5
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			En5
	.byte	W06
	.byte			An5
	.byte	W24
	.byte	FINE

	@********************** Track  2 **********************@

	.global song112_2
song112_2:	@ 0x0857D341
	.byte	KEYSH	, 0
	.byte	VOICE	, 33
	.byte	VOL	, v040
	.byte		N06	, An5, v127
	.byte	W06
	.byte			En6
	.byte	W06
	.byte			Dn6
	.byte	W06
	.byte			En6
	.byte	W06
	.byte			An6
	.byte	W24
	.byte	FINE

	.align 2
	.global song112
song112:	@ 0x0857D354
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song112_1		@ track
	.word	song112_2		@ track
