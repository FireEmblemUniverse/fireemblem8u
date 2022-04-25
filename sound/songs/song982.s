	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song982_1
song982_1:	@ 0x0858761C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 46
	.byte	VOL	, v046
	.byte		N06	, En4, v127
	.byte	W06
	.byte			En4, v064
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte		N48	, Dn3
	.byte	W48
	.byte	FINE

	@********************** Track  2 **********************@

	.global song982_2
song982_2:	@ 0x08587634
	.byte	KEYSH	, 0
	.byte	VOICE	, 100
	.byte	VOL	, v017
	.byte		N06	, Cs2, v127
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Gn2, v120
	.byte	W06
	.byte			Ds2, v076
	.byte	W06
	.byte			Gn2, v056
	.byte	W06
	.byte			Ds2, v048
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			Ds2, v028
	.byte	W06
	.byte			Gn2, v016
	.byte	W06
	.byte			Ds2, v020
	.byte	W06
	.byte	FINE

	@********************** Track  3 **********************@

	.global song982_3
song982_3:	@ 0x0858765E
	.byte	KEYSH	, 0
	.byte	VOICE	, 83
	.byte	VOL	, v075
	.byte	BEND	, c_v-52
	.byte		N96	, Cn3, v127
	.byte	W01
	.byte	BEND	, c_v-40
	.byte	W01
	.byte		c_v-28
	.byte	W01
	.byte		c_v-3
	.byte	W01
	.byte		c_v+9
	.byte	W01
	.byte		c_v+21
	.byte	W01
	.byte		c_v+45
	.byte	W01
	.byte		c_v+63
	.byte	W88
	.byte	W01
	.byte	FINE

	.align 2
	.global song982
song982:	@ 0x0858767C
	.byte	3		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song982_1		@ track
	.word	song982_2		@ track
	.word	song982_3		@ track
