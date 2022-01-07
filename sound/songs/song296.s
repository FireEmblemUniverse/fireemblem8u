	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song296_1
song296_1:	@ 0x0857FA34
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 51
	.byte	BENDR	, 18
	.byte	VOL	, v110
	.byte	BEND	, c_v-64
	.byte		N12	, Gn3, v127
	.byte	W01
	.byte	BEND	, c_v-19
	.byte	W01
	.byte		c_v-2
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte	BENDR	, 21
	.byte	VOL	, v109
	.byte	BEND	, c_v+28
	.byte	W01
	.byte	VOL	, v107
	.byte	BEND	, c_v+44
	.byte	W01
	.byte	VOL	, v103
	.byte	BEND	, c_v+63
	.byte	W01
	.byte	VOL	, v095
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v110
	.byte		N06	, Gn3, v048
	.byte	W07
	.byte		N04	, Gn3, v020
	.byte	W04
	.byte	FINE

	.align 2
	.global song296
song296:	@ 0x0857FA74
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song296_1		@ track
