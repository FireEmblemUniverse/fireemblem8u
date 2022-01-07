	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song039_1
song039_1:	@ 0x08564ACC
	.byte	KEYSH	, 0
song039_1_1:
	.byte	TEMPO	, 54
	.byte	VOICE	, 68
	.byte	MOD	, 0
	.byte	VOL	, v054
	.byte	PAN	, c_v
	.byte		N32	, An2, v127
	.byte	W36
	.byte		N12	
	.byte	W12
	.byte		N36	, Dn3
	.byte	W36
	.byte		N12	, An2
	.byte	W12
	.byte		N32	, Fs3
	.byte	W36
	.byte		N06	, An3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte		N12	
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte		N78	, En3
	.byte	W84
	.byte		N06	
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte		N78	, Gn3
	.byte	W84
	.byte		N06	, Cn3
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte		N36	, As2
	.byte	W36
	.byte		N12	, Ds3
	.byte	W12
	.byte		N36	, Fn3
	.byte	W36
	.byte		N06	, Gs3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte		N36	
	.byte	W36
	.byte		N06	, Fn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte		N18	, Fn3
	.byte	W24
	.byte		N24	, As3
	.byte	W24
	.byte		N36	, Cs4
	.byte	W36
	.byte		N06	, Cn4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte		N36	, Cn4
	.byte	W36
	.byte		N06	, As3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte		N84	, As3
	.byte	W96
	.byte		N72	, Cn4, v088
	.byte	W72
	.byte		N24	, As3
	.byte	W24
	.byte		N90	, An3
	.byte	W96
	.byte		N56	, Cn4
	.byte	W60
	.byte		N12	
	.byte	W12
	.byte			As3
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte		N90	, Dn4
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N32	, En3, v116
	.byte	W36
	.byte		N11	
	.byte	W12
	.byte		N32	, Fs3
	.byte	W36
	.byte		N11	, En3
	.byte	W12
	.byte		N32	, Gn3
	.byte	W36
	.byte		N11	, En3
	.byte	W12
	.byte		N23	, Fs3
	.byte	W24
	.byte			Gn3, v112
	.byte	W24
	.byte		N80	, An3, v116
	.byte	W84
	.byte		N11	, Bn3
	.byte	W12
	.byte		N90	, An3
	.byte	W96
	.byte	GOTO	
		.word	song039_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song039_2
song039_2:	@ 0x08564B73
	.byte	KEYSH	, 0
song039_2_2:
	.byte	VOICE	, 33
	.byte	VOL	, v054
	.byte	PAN	, c_v
	.byte		N36	, Dn1, v127
	.byte	W48
	.byte		N36	
	.byte	W36
	.byte		N09	
	.byte	W12
	.byte		N36	
	.byte	W48
	.byte		N36	
	.byte	W48
	.byte			Cn1
	.byte	W48
	.byte		N36	
	.byte	W36
	.byte		N09	
	.byte	W12
	.byte		N36	
	.byte	W48
	.byte		N21	
	.byte	W24
	.byte		N09	
	.byte	W12
	.byte			Dn1
	.byte	W12
	.byte		N36	, Ds1
	.byte	W48
	.byte		N36	
	.byte	W36
	.byte		N09	, As1
	.byte	W12
	.byte		N36	, Ds2
	.byte	W48
	.byte			Ds1
	.byte	W36
	.byte		N09	
	.byte	W12
	.byte		N36	, Cs1
	.byte	W48
	.byte		N36	
	.byte	W48
	.byte		N36	
	.byte	W48
	.byte		N24	
	.byte	W24
	.byte		N21	
	.byte	W24
song039_2_1:
	.byte		N12	, Cn1, v127
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte	PEND
	.byte			Dn1
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte	PATT	
		.word	song039_2_1
	.byte		N12	, Dn1, v127
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte			En1
	.byte	W12
	.byte			Fs1
	.byte	W12
	.byte		N32	, Gn1
	.byte	W84
	.byte		N12	, Gn0
	.byte	W12
	.byte		N24	
	.byte	W72
	.byte			Gn1
	.byte	W24
	.byte		N36	, Fs1
	.byte	W72
	.byte		N24	, Cs1
	.byte	W24
	.byte		N48	, Bn0
	.byte	W72
	.byte		N12	, Cs1
	.byte	W12
	.byte			Dn1
	.byte	W12
	.byte		N48	, En1
	.byte	W84
	.byte		N12	, Bn0
	.byte	W12
	.byte		N48	, En1
	.byte	W96
	.byte			An0
	.byte	W96
	.byte		N48	
	.byte	W48
	.byte		N24	, An1
	.byte	W24
	.byte			An0
	.byte	W24
	.byte	GOTO	
		.word	song039_2_2
	.byte	FINE

	@********************** Track  3 **********************@

	.global song039_3
song039_3:	@ 0x08564C03
	.byte	KEYSH	, 0
song039_3_1:
	.byte	VOICE	, 48
	.byte	MOD	, 0
	.byte	VOL	, v042
	.byte	PAN	, c_v-19
	.byte		N32	, Fs3, v104
	.byte	W36
	.byte		N09	
	.byte	W12
	.byte		N32	, An3
	.byte	W36
	.byte		N09	, Fs3
	.byte	W12
	.byte		N36	, Dn4
	.byte	W36
	.byte		N06	, Fs4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte		N12	
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Cs4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte		N32	, Cn4
	.byte	W36
	.byte		N06	, Gn3
	.byte		N06	, Cn4
	.byte	W06
	.byte		N06	
	.byte		N06	, En4
	.byte	W06
	.byte		N32	
	.byte		N32	, Gn4
	.byte	W36
	.byte		N06	, Cn4
	.byte		N06	, En4
	.byte	W06
	.byte		N06	
	.byte		N06	, Gn4
	.byte	W06
	.byte		N32	
	.byte		N32	, Cn5
	.byte	W36
	.byte		N09	, En4
	.byte		N09	, Gn4
	.byte	W12
	.byte		N44	, Cn4
	.byte		N44	, En4
	.byte	W48
	.byte		N32	, Gn3
	.byte	W36
	.byte		N09	, As3
	.byte	W12
	.byte		N32	, Cs4
	.byte	W36
	.byte		N06	, Fn4
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte		N36	
	.byte	W36
	.byte		N06	, Cs4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte		N24	, Cs4
	.byte	W24
	.byte			Fn4
	.byte	W24
	.byte		N32	, Gs4
	.byte	W36
	.byte		N06	, Gn4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte		N32	, Gn4
	.byte	W36
	.byte		N06	, Fn4
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte		N90	, Fn4
	.byte	W96
	.byte		N24	, Gn4
	.byte	W24
	.byte			Cn4
	.byte	W24
	.byte			En4
	.byte	W24
	.byte			Gn4
	.byte	W24
	.byte		N48	, Fs4
	.byte	W48
	.byte			Dn4
	.byte	W48
	.byte		N56	, En4
	.byte	W60
	.byte		N12	
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			En4
	.byte	W12
	.byte		N36	, Fs4
	.byte	W36
	.byte		N12	, Gn4
	.byte	W12
	.byte		N42	, An4
	.byte	W48
	.byte		TIE	, Gn4, v072
	.byte	W48
	.byte		N96	, Dn4
	.byte	W48
	.byte	W48
	.byte		EOT	, Gn4
	.byte		N48	, Dn4
	.byte		N24	, An4
	.byte	W24
	.byte			Bn4
	.byte	W24
	.byte		N96	, Dn4
	.byte		TIE	, An4
	.byte	W96
	.byte		N96	, Dn4
	.byte	W96
	.byte		EOT	, An4
	.byte	VOICE	, 51
	.byte		N32	, Dn2, v076
	.byte		N32	, Gn2, v088
	.byte	W36
	.byte		N09	, Dn2, v076
	.byte		N09	, Gn2, v088
	.byte	W12
	.byte		N32	, Gn2, v076
	.byte		N32	, Bn2, v088
	.byte	W36
	.byte		N09	, Dn2, v076
	.byte		N09	, Gn2, v088
	.byte	W12
	.byte		N36	, Bn2, v076
	.byte		N36	, Dn3, v088
	.byte	W36
	.byte		N06	, Fs3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte		N24	, Bn2, v076
	.byte		N24	, Dn3, v088
	.byte	W24
	.byte		N12	, An2, v076
	.byte		N12	, Cs3, v088
	.byte	W12
	.byte			Bn2, v076
	.byte		N12	, Dn3, v088
	.byte	W12
	.byte		N96	, Dn3, v076
	.byte		N84	, En3, v088
	.byte	W84
	.byte		N06	, Fs3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte		N90	, En3, v076
	.byte		N90	, An3, v088
	.byte	W96
	.byte	GOTO	
		.word	song039_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song039_4
song039_4:	@ 0x08564D0F
	.byte	KEYSH	, 0
song039_4_3:
	.byte	VOICE	, 62
	.byte	VOL	, v046
	.byte	PAN	, c_v+6
	.byte		N06	, Fs2, v088
	.byte		N06	, An2
	.byte	W12
	.byte			Fs2
	.byte		N06	, An2
	.byte	W36
	.byte			Fs2
	.byte		N06	, An2
	.byte	W12
	.byte			Fs2
	.byte		N06	, An2
	.byte	W36
	.byte			Fs2
	.byte		N06	, An2
	.byte	W12
	.byte			Fs2
	.byte		N06	, An2
	.byte	W12
	.byte		N12	, Fs2
	.byte	W12
	.byte		N06	, Fs2, v032
	.byte	W12
	.byte		N12	, Gn2, v088
	.byte	W12
	.byte		N06	, Gn2, v032
	.byte	W12
	.byte		N12	, An2, v088
	.byte	W12
	.byte		N06	, An2, v032
	.byte	W12
	.byte			En2, v088
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N12	, Cn3
	.byte	W12
	.byte		N06	, Cn3, v032
	.byte	W12
	.byte		N12	, Gn2, v088
	.byte	W12
	.byte		N06	, Gn2, v032
	.byte	W12
	.byte		N12	, Cn3, v088
	.byte	W12
	.byte		N06	, Cn3, v032
	.byte	W12
	.byte			Gn2, v088
	.byte		N06	, As2
	.byte	W12
	.byte			Gn2
	.byte		N06	, As2
	.byte	W36
	.byte			Gn2
	.byte		N06	, As2
	.byte	W12
	.byte			Gn2
	.byte		N06	, As2
	.byte	W36
	.byte		N12	, Gn2
	.byte	W12
	.byte		N06	, Gn2, v032
	.byte	W12
	.byte		N12	, Gn2, v088
	.byte	W12
	.byte		N06	, Gn2, v032
	.byte	W12
	.byte		N12	, Gs2, v088
	.byte	W12
	.byte		N06	, Gs2, v032
	.byte	W12
	.byte		N12	, As2, v088
	.byte	W12
	.byte		N06	, As2, v032
	.byte	W12
	.byte			Fn2, v088
	.byte		N06	, Gs2
	.byte	W12
	.byte			Fn2
	.byte		N06	, Gs2
	.byte	W36
	.byte			Fn2
	.byte		N06	, Gs2
	.byte	W12
	.byte			Fn2
	.byte		N06	, Gs2
	.byte	W24
	.byte			Fn2
	.byte		N06	, Gs2
	.byte	W12
	.byte			Fn2
	.byte		N06	, Gs2
	.byte	W12
	.byte			Fn2
	.byte		N06	, Gs2
	.byte	W36
	.byte			Fn2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
song039_4_1:
	.byte		N06	, Cn3, v088
	.byte	W06
	.byte			Cn3, v016
	.byte	W06
	.byte			Gn2, v080
	.byte	W06
	.byte			Gn2, v004
	.byte	W06
	.byte			Cn3, v088
	.byte	W06
	.byte			Cn3, v016
	.byte	W06
	.byte			Gn2, v080
	.byte	W06
	.byte			Gn2, v004
	.byte	W06
	.byte			Cn3, v088
	.byte	W06
	.byte			Cn3, v016
	.byte	W06
	.byte			Gn2, v080
	.byte	W06
	.byte			Gn2, v004
	.byte	W06
	.byte			Cn3, v088
	.byte	W06
	.byte			Cn3, v016
	.byte	W06
	.byte			Gn2, v080
	.byte	W06
	.byte			Gn2, v004
	.byte	W06
	.byte	PEND
song039_4_2:
	.byte		N06	, Dn3, v088
	.byte	W06
	.byte			Dn3, v016
	.byte	W06
	.byte			An2, v080
	.byte	W06
	.byte			An2, v004
	.byte	W06
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v016
	.byte	W06
	.byte			An2, v080
	.byte	W06
	.byte			An2, v004
	.byte	W06
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v016
	.byte	W06
	.byte			An2, v080
	.byte	W06
	.byte			An2, v004
	.byte	W06
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v016
	.byte	W06
	.byte			An2, v080
	.byte	W06
	.byte			An2, v004
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song039_4_1
	.byte	PATT	
		.word	song039_4_2
	.byte	VOICE	, 69
	.byte		N68	, Bn2, v100
	.byte	W72
	.byte		N11	, En2, v096
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte		N40	, En3
	.byte	W48
	.byte		N23	, Fs3, v100
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte		N44	, Fs3
	.byte	W48
	.byte			Dn3, v096
	.byte	W48
	.byte		N11	, An2
	.byte	W24
	.byte		N23	, Fs2, v100
	.byte	W24
	.byte			En2, v096
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte		N92	, Gn2, v100
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song039_4_3
	.byte	FINE

	@********************** Track  5 **********************@

	.global song039_5
song039_5:	@ 0x08564E61
	.byte	KEYSH	, 0
song039_5_1:
	.byte	VOICE	, 46
	.byte	VOL	, v038
	.byte	PAN	, c_v-40
	.byte		N12	, Dn2, v116
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte		N06	, Cn4
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			En2
	.byte	W06
	.byte		N12	, Ds2
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			As3
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			As3
	.byte	W12
	.byte			Ds4
	.byte	W12
	.byte			As3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte			Fn3
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte			Fn3
	.byte	W12
	.byte			Gs3
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte			Fn3
	.byte	W12
	.byte			Gs3
	.byte	W12
	.byte		N11	
	.byte		N11	, Cs4
	.byte	W12
	.byte			Fn3
	.byte		N11	, Gs3
	.byte	W12
	.byte			Cs3
	.byte		N11	, Fn3
	.byte	W12
	.byte			Gs2
	.byte		N11	, Cs3
	.byte	W12
	.byte		N08	, Cn2
	.byte	W08
	.byte			En2
	.byte	W08
	.byte			Gn2
	.byte	W08
	.byte			Cn3
	.byte	W08
	.byte			En3
	.byte	W08
	.byte			Gn3
	.byte	W08
	.byte			Cn4
	.byte	W08
	.byte			Gn3
	.byte	W08
	.byte			En3
	.byte	W08
	.byte			Cn3
	.byte	W08
	.byte			Gn2
	.byte	W08
	.byte			En2
	.byte	W08
	.byte			Dn2
	.byte	W08
	.byte			Fs2
	.byte	W08
	.byte			An2
	.byte	W08
	.byte			Dn3
	.byte	W08
	.byte			Fs3
	.byte	W08
	.byte			An3
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			An3
	.byte	W08
	.byte			Fs3
	.byte	W08
	.byte			Dn3
	.byte	W08
	.byte			An2
	.byte	W08
	.byte			Fs2
	.byte	W08
	.byte			En2
	.byte	W08
	.byte			Gn2
	.byte	W08
	.byte			Cn3
	.byte	W08
	.byte			En3
	.byte	W08
	.byte			Gn3
	.byte	W08
	.byte			Cn4
	.byte	W08
	.byte			En4
	.byte	W08
	.byte			Cn4
	.byte	W08
	.byte			Gn3
	.byte	W08
	.byte			En3
	.byte	W08
	.byte			Cn3
	.byte	W08
	.byte			Gn2
	.byte	W08
	.byte			Fs2
	.byte	W08
	.byte			An2
	.byte	W08
	.byte			Dn3
	.byte	W08
	.byte			Fs3
	.byte	W08
	.byte			An3
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			Fs4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			An3
	.byte	W08
	.byte			Fs3
	.byte	W08
	.byte			Dn3
	.byte	W08
	.byte			An2
	.byte	W08
	.byte	VOICE	, 45
	.byte	VOL	, v054
	.byte	PAN	, c_v
	.byte	W12
	.byte		N12	, Dn3, v127
	.byte		N12	, Gn3
	.byte	W12
	.byte		N12	
	.byte		N12	, Bn3
	.byte	W12
	.byte		N12	
	.byte		N12	, Dn4
	.byte	W12
	.byte		N12	
	.byte		N12	, Gn4
	.byte	W12
	.byte			Bn3
	.byte		N12	, Dn4
	.byte	W12
	.byte			Gn3
	.byte		N12	, Bn3
	.byte	W12
	.byte			Dn3
	.byte		N12	, Gn3
	.byte	W12
	.byte	W12
	.byte			Dn3
	.byte		N12	, Gn3
	.byte	W12
	.byte		N12	
	.byte		N12	, Bn3
	.byte	W12
	.byte		N12	
	.byte		N12	, En4
	.byte	W12
	.byte			Dn4
	.byte		N12	, Gn4
	.byte	W12
	.byte			An3
	.byte		N12	, Dn4
	.byte	W12
	.byte			Fs3
	.byte		N12	, An3
	.byte	W12
	.byte			En3
	.byte		N12	, Gn3
	.byte	W12
	.byte	W12
	.byte			Dn3
	.byte		N12	, Fs3
	.byte	W12
	.byte		N12	
	.byte		N12	, An3
	.byte	W12
	.byte		N12	
	.byte		N12	, Dn4
	.byte	W12
	.byte		N12	
	.byte		N12	, Fs4
	.byte	W12
	.byte			An3
	.byte		N12	, Dn4
	.byte	W12
	.byte			Fs3
	.byte		N12	, An3
	.byte	W12
	.byte			Cs3
	.byte		N12	, Fs3
	.byte	W12
	.byte	W12
	.byte		N12	
	.byte		N12	, An3
	.byte	W12
	.byte		N12	
	.byte		N12	, Dn4
	.byte	W12
	.byte		N12	
	.byte		N12	, Fs4
	.byte	W12
	.byte		N12	
	.byte		N12	, An4
	.byte	W12
	.byte			Dn4
	.byte		N12	, Fs4
	.byte	W12
	.byte			An3
	.byte		N12	, Dn4
	.byte	W12
	.byte			Fs3
	.byte		N12	, An3
	.byte	W12
	.byte	VOICE	, 46
	.byte	VOL	, v038
	.byte	PAN	, c_v-40
	.byte		N12	, Bn4
	.byte	W12
	.byte			Gn4
	.byte	W12
	.byte			En4
	.byte	W12
	.byte			Bn3
	.byte	W12
	.byte			Gn4
	.byte	W12
	.byte			En4
	.byte	W12
	.byte			Bn3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			En4
	.byte	W12
	.byte			Bn3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			En3
	.byte	W12
	.byte		N06	, Bn2
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			En4
	.byte	W06
	.byte		N08	, An2
	.byte	W08
	.byte			Dn3
	.byte	W08
	.byte			En3
	.byte	W08
	.byte			An3
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			En4
	.byte	W08
	.byte			An4
	.byte	W08
	.byte			En4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			An3
	.byte	W08
	.byte			En3
	.byte	W08
	.byte			Dn3
	.byte	W08
	.byte			An2
	.byte	W08
	.byte			Cs3
	.byte	W08
	.byte			En3
	.byte	W08
	.byte			An3
	.byte	W08
	.byte			Cs4
	.byte	W08
	.byte			En4
	.byte	W08
	.byte		N06	, An4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte	GOTO	
		.word	song039_5_1
	.byte	FINE

	@********************** Track  6 **********************@

	.global song039_6
song039_6:	@ 0x08565046
	.byte	KEYSH	, 0
song039_6_1:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 49
	.byte	VOL	, v054
	.byte	PAN	, c_v
	.byte	W96
	.byte		N92	, En2, v088
	.byte	W96
	.byte			Dn2
	.byte	W96
	.byte		N68	, En2
	.byte	W72
	.byte		N12	
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte		N44	, Fs2
	.byte	W48
	.byte			Dn2
	.byte	W48
	.byte		TIE	, Gn1
	.byte	W96
	.byte	W21
	.byte		EOT	
	.byte	W03
	.byte		N24	, Gn2
	.byte	W24
	.byte			Fs2
	.byte	W24
	.byte			En2
	.byte	W24
	.byte		N66	, Dn2
	.byte	W72
	.byte		N24	, Cs2
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song039_6_1
	.byte	FINE

	@********************** Track  7 **********************@

	.global song039_7
song039_7:	@ 0x0856508D
	.byte	KEYSH	, 0
song039_7_4:
	.byte	VOICE	, 127
	.byte	VOL	, v042
	.byte	PAN	, c_v
	.byte		N06	, Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W30
	.byte			Fs2, v072
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v056
	.byte	W06
	.byte			Fs2, v012
	.byte	W30
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v072
	.byte	W06
	.byte			Fs2, v016
	.byte	W18
	.byte			Fs2, v056
	.byte	W06
	.byte			Fs2, v012
	.byte	W06
	.byte			Fs2, v072
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W30
	.byte			Fs2, v080
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v060
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v072
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Fs2, v080
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W18
	.byte			Fs2, v080
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v072
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v092
	.byte	W06
	.byte			Fs2, v024
	.byte	W18
	.byte			Fs2, v080
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v072
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v072
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Fs2, v092
	.byte	W06
	.byte			Fs2, v024
	.byte	W06
	.byte			Fs2, v072
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Fs2, v080
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Fs2, v020
	.byte	W18
	.byte			Fs2, v092
	.byte	W06
	.byte			Fs2, v024
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W30
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W30
	.byte			Fs2, v072
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W30
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v084
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v084
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v084
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte		N24	, Bn4, v084
	.byte	W84
	.byte		N12	
	.byte	W12
	.byte		N24	
	.byte	W96
	.byte		N12	
	.byte	W84
	.byte		N12	
	.byte	W12
	.byte		N24	
	.byte	W96
song039_7_1:
	.byte		N36	, Dn2, v088
	.byte	W36
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte		N24	
	.byte	W24
	.byte		N24	
	.byte	W12
	.byte	PEND
song039_7_2:
	.byte	W12
	.byte		N24	, Dn2, v088
	.byte	W24
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte		N24	
	.byte	W24
	.byte		N12	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song039_7_1
	.byte	PATT	
		.word	song039_7_2
song039_7_3:
	.byte		N06	, Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W18
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W18
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song039_7_3
	.byte	PATT	
		.word	song039_7_3
	.byte		N06	, Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W18
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	GOTO	
		.word	song039_7_4
	.byte	FINE

	.align 2
	.global song039
song039:	@ 0x08565210
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup062		@ voicegroup/tone

	.word	song039_1		@ track
	.word	song039_2		@ track
	.word	song039_3		@ track
	.word	song039_4		@ track
	.word	song039_5		@ track
	.word	song039_6		@ track
	.word	song039_7		@ track
