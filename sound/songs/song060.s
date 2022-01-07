	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song060_1
song060_1:	@ 0x0856F91C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 67
	.byte	VOICE	, 61
	.byte	VOL	, v047
	.byte	PAN	, c_v
	.byte		N06	, Ds3, v116
	.byte	W08
	.byte			As2, v112
	.byte	W08
	.byte			Ds3
	.byte	W08
	.byte		N18	, Gn3, v116
	.byte	W18
	.byte		N06	, Gn3, v036
	.byte	W06
	.byte		N30	, As3, v116
	.byte	W30
	.byte		N06	, As3, v036
	.byte	W06
	.byte			An3, v112
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte		N42	, An3, v116
	.byte	W42
	.byte		N06	, An3, v036
	.byte	W06
	.byte		N18	, Gn3, v112
	.byte	W18
	.byte		N06	, Gn3, v036
	.byte	W06
	.byte		N18	, Fn3, v112
	.byte	W18
	.byte		N06	, Fn3, v036
	.byte	W06
	.byte		N90	, Gn3, v116
	.byte	W90
	.byte		N06	, Gn3, v036
	.byte	W06
	.byte	FINE

	@********************** Track  2 **********************@

	.global song060_2
song060_2:	@ 0x0856F965
	.byte	KEYSH	, 0
	.byte	VOICE	, 34
	.byte	VOL	, v054
	.byte	PAN	, c_v
	.byte		N09	, Ds2, v127
	.byte	W12
	.byte			As1
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte		N84	
	.byte	W84
	.byte	W03
	.byte	FINE

	@********************** Track  3 **********************@

	.global song060_3
song060_3:	@ 0x0856F993
	.byte	KEYSH	, 0
	.byte	VOICE	, 62
	.byte	VOL	, v047
	.byte	PAN	, c_v-19
	.byte		N06	, As2, v116
	.byte	W08
	.byte			Gn2, v112
	.byte	W08
	.byte			As2
	.byte	W08
	.byte		N18	, Ds3, v116
	.byte	W18
	.byte		N06	, Ds3, v036
	.byte	W06
	.byte		N30	, Gn3, v116
	.byte	W30
	.byte		N06	, Gn3, v036
	.byte	W06
	.byte			Fn3, v112
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte		N42	, Fn3, v116
	.byte	W42
	.byte		N06	, Fn3, v036
	.byte	W06
	.byte		N18	, Ds3, v112
	.byte	W18
	.byte		N06	, Ds3, v036
	.byte	W06
	.byte		N18	, Dn3, v112
	.byte	W18
	.byte		N06	, Dn3, v036
	.byte	W06
	.byte		N90	, En3, v116
	.byte	W90
	.byte		N06	, En3, v036
	.byte	W06
	.byte	FINE

	@********************** Track  4 **********************@

	.global song060_4
song060_4:	@ 0x0856F9DA
	.byte	KEYSH	, 0
	.byte	VOICE	, 47
	.byte	VOL	, v042
	.byte	PAN	, c_v
	.byte		N24	, Ds3, v104
	.byte	W24
	.byte			As2
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte			As2
	.byte	W24
	.byte			Fn2
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte			Fn2
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte		N48	
	.byte	W48
	.byte	FINE

	@********************** Track  5 **********************@

	.global song060_5
song060_5:	@ 0x0856F9F7
	.byte	KEYSH	, 0
	.byte	VOICE	, 102
	.byte	VOL	, v035
	.byte	PAN	, c_v+16
	.byte	W96
	.byte	W72
	.byte		N06	, Cn4, v092
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte		N90	, Gn4
	.byte	W90
	.byte		N06	, Gn4, v032
	.byte	W06
	.byte	FINE

	@********************** Track  6 **********************@

	.global song060_6
song060_6:	@ 0x0856FA13
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v047
	.byte	PAN	, c_v
	.byte		N06	, Dn1, v080
	.byte	W12
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W08
	.byte			Dn1, v076
	.byte	W08
	.byte		N06	
	.byte	W08
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v080
	.byte	W12
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W08
	.byte			Dn1, v072
	.byte	W08
	.byte		N06	
	.byte	W08
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte		N48	, An2, v100
	.byte	W48
	.byte	FINE

	.align 2
	.global song060
song060:	@ 0x0856FA58
	.byte	6		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup072		@ voicegroup/tone

	.word	song060_1		@ track
	.word	song060_2		@ track
	.word	song060_3		@ track
	.word	song060_4		@ track
	.word	song060_5		@ track
	.word	song060_6		@ track
