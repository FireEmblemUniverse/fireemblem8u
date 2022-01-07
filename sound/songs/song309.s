	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song309_1
song309_1:	@ 0x0857FBE8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 64
	.byte	VOL	, v127
	.byte		N06	, En3, v120
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte	VOL	, v127
	.byte		N20	, Cn4
	.byte	W02
	.byte	VOL	, v114
	.byte	W02
	.byte		v101
	.byte	W02
	.byte		v088
	.byte	W02
	.byte		v076
	.byte	W02
	.byte		v063
	.byte	W02
	.byte		v050
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v012
	.byte	W02
	.byte		v000
	.byte	W16
	.byte	FINE

	.align 2
	.global song309
song309:	@ 0x0857FC14
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song309_1		@ track
