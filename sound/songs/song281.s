	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song281_1
song281_1:	@ 0x0857F6D0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 35
	.byte	VOL	, v127
	.byte		N14	, Cn3, v127
	.byte	W18
	.byte		N05	, As2, v056
	.byte	W06
	.byte			Cn3, v088
	.byte	W06
	.byte			Cs3, v056
	.byte	W06
	.byte		N06	, Cn3, v104
	.byte	W07
	.byte		N03	, Dn3, v052
	.byte	W05
	.byte		N12	, Cn3, v084
	.byte	W12
	.byte			Dn3, v068
	.byte	W12
	.byte	FINE

	.align 2
	.global song281
song281:	@ 0x0857F6F8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song281_1		@ track
