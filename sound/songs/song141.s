	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song141_1
song141_1:	@ 0x0857DC88
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 41
	.byte	VOL	, v100
	.byte	BENDR	, 12
	.byte	W22
	.byte		N07	, An2, v068
	.byte	W02
	.byte	W05
	.byte		N06	, As2
	.byte	W06
	.byte			Cn3, v088
	.byte	W06
	.byte		N07	, Dn3
	.byte	W07
	.byte		N48	, Ds3, v108
	.byte	W24
	.byte	VOL	, v127
	.byte	W02
	.byte		v106
	.byte	W02
	.byte		v088
	.byte	W02
	.byte		v071
	.byte	W02
	.byte		v056
	.byte	W02
	.byte		v043
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v014
	.byte	W02
	.byte		v008
	.byte	W02
	.byte		v003
	.byte	W02
	.byte		v000
	.byte	W02
	.byte	W24
	.byte	W24
	.byte	FINE

	@********************** Track  2 **********************@

	.global song141_2
song141_2:	@ 0x0857DCC1
	.byte	KEYSH	, 0
	.byte	VOICE	, 40
	.byte	BENDR	, 12
	.byte	VOL	, v127
	.byte	BEND	, c_v-64
	.byte		TIE	, Fn3, v108
	.byte	W02
	.byte	BEND	, c_v-64
	.byte	W02
	.byte		c_v-63
	.byte	W02
	.byte		c_v-60
	.byte	W02
	.byte		c_v-57
	.byte	W02
	.byte		c_v-53
	.byte	W02
	.byte		c_v-48
	.byte	W02
	.byte		c_v-43
	.byte	W02
	.byte		c_v-36
	.byte	W02
	.byte		c_v-28
	.byte	W02
	.byte		c_v-20
	.byte	W02
	.byte		c_v-11
	.byte	W02
	.byte		c_v
	.byte	W24
	.byte		c_v
	.byte	W24
	.byte	VOL	, v127
	.byte	W02
	.byte		v121
	.byte	W02
	.byte		v116
	.byte	W02
	.byte		v111
	.byte	W02
	.byte		v105
	.byte	W02
	.byte		v100
	.byte	W02
	.byte		v095
	.byte	W02
	.byte		v090
	.byte	W02
	.byte		v084
	.byte	W02
	.byte		v079
	.byte	W02
	.byte		v074
	.byte	W02
	.byte		v068
	.byte	W02
	.byte		v063
	.byte	W02
	.byte		v058
	.byte	W02
	.byte		v053
	.byte	W02
	.byte		v047
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v021
	.byte	W02
	.byte		v016
	.byte	W02
	.byte		v010
	.byte	W02
	.byte		v005
	.byte	W02
	.byte		EOT	
	.byte	W24
	.byte	FINE

	.align 2
	.global song141
song141:	@ 0x0857DD20
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song141_1		@ track
	.word	song141_2		@ track
