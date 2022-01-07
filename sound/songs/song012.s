	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song012_1
song012_1:	@ 0x085505CC
	.byte	KEYSH	, 0
song012_1_7:
	.byte	TEMPO	, 64
	.byte	VOICE	, 63
	.byte	VOL	, v048
	.byte	PAN	, c_v-15
	.byte		N12	, En3, v104
	.byte	W18
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v028
	.byte	W12
	.byte		N24	, Gn3, v092
	.byte	W24
	.byte		N06	, Fs3, v104
	.byte	W06
	.byte			Fs3, v028
	.byte	W06
	.byte		N18	, Gn3, v104
	.byte	W18
	.byte		N06	, Gn3, v028
	.byte	W06
song012_1_2:
	.byte		N12	, Fs3, v104
	.byte	W18
	.byte		N06	, Gn3
	.byte	W06
	.byte			Gn3, v028
	.byte	W12
	.byte		N24	, An3, v104
	.byte	W24
	.byte		N06	, Gn3
	.byte	W06
	.byte			Gn3, v028
	.byte	W06
	.byte		N18	, An3, v104
	.byte	W18
	.byte		N06	, An3, v028
	.byte	W06
	.byte	PEND
song012_1_1:
	.byte		N12	, En3, v104
	.byte	W18
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v028
	.byte	W12
	.byte		N24	, Gn3, v104
	.byte	W24
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v028
	.byte	W06
	.byte		N18	, Gn3, v104
	.byte	W18
	.byte		N06	, Gn3, v028
	.byte	W06
	.byte	PEND
	.byte		N18	, Fs3, v104
	.byte	W18
	.byte		N06	, Fs3, v028
	.byte	W06
	.byte		N04	, An3, v104
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N36	, Fs3
	.byte	W36
	.byte		N06	, Fs3, v028
	.byte	W12
	.byte	PATT	
		.word	song012_1_1
	.byte	PATT	
		.word	song012_1_2
	.byte		N12	, Gn3, v104
	.byte	W18
	.byte		N06	, An3
	.byte	W06
	.byte			An3, v028
	.byte	W12
	.byte		N24	, Bn3, v104
	.byte	W24
	.byte		N06	, Cn4
	.byte	W06
	.byte			Cn4, v028
	.byte	W06
	.byte		N18	, Bn3, v104
	.byte	W18
	.byte		N06	, Bn3, v028
	.byte	W06
	.byte		N18	, An3, v104
	.byte	W18
	.byte		N06	, An3, v028
	.byte	W06
	.byte		N04	, Dn4, v104
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N36	, An3
	.byte	W36
	.byte		N06	, An3, v028
	.byte	W12
	.byte	VOICE	, 61
	.byte	VOL	, v048
	.byte	PAN	, c_v+5
	.byte		N12	, En3, v116
	.byte	W18
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v036
	.byte	W12
	.byte		N24	, Gn3, v116
	.byte	W24
	.byte		N06	, Bn3
	.byte	W06
	.byte			Bn3, v036
	.byte	W06
	.byte		N18	, Gn3, v116
	.byte	W18
	.byte		N06	, Gn3, v036
	.byte	W06
song012_1_3:
	.byte		N12	, Fs3, v116
	.byte	W18
	.byte		N06	, Gn3
	.byte	W06
	.byte			Gn3, v036
	.byte	W12
	.byte		N48	, An3, v116
	.byte	W48
	.byte		N06	, An3, v036
	.byte	W12
	.byte	PEND
	.byte		N12	, En3, v116
	.byte	W18
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v036
	.byte	W12
	.byte		N24	, Gn3, v116
	.byte	W24
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v036
	.byte	W06
	.byte		N12	, Gn3, v116
	.byte	W12
	.byte			Gn3, v036
	.byte	W12
	.byte	PATT	
		.word	song012_1_3
	.byte		N12	, En3, v116
	.byte	W18
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v036
	.byte	W12
	.byte		N24	, Gn3, v116
	.byte	W24
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v036
	.byte	W06
	.byte		N12	, Gn3, v116
	.byte	W18
	.byte		N06	, Gn3, v036
	.byte	W06
	.byte		N12	, Fs3, v116
	.byte	W18
	.byte		N06	, Gn3
	.byte	W06
	.byte			Gn3, v036
	.byte	W12
	.byte		N24	, An3, v116
	.byte	W24
	.byte		N06	, Gn3
	.byte	W06
	.byte			Gn3, v036
	.byte	W06
	.byte		N12	, An3, v116
	.byte	W12
	.byte		N06	, An3, v036
	.byte	W12
	.byte		N12	, En3, v116
	.byte	W18
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v036
	.byte	W12
	.byte		N24	, Gn3, v116
	.byte	W24
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v036
	.byte	W06
	.byte		N18	, Gn3, v116
	.byte	W18
	.byte		N06	, Gn3, v036
	.byte	W06
	.byte		N24	, Fs3, v116
	.byte	W24
	.byte		N04	, An3
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N36	, Fs3
	.byte	W36
	.byte		N06	, Fs3, v036
	.byte	W12
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W84
	.byte			En3, v104
	.byte	W06
	.byte			Fs3
	.byte	W06
song012_1_4:
	.byte		N06	, Gn3, v104
	.byte	W06
	.byte			Gn3, v028
	.byte	W06
	.byte			Fs3, v104
	.byte	W06
	.byte			Fs3, v028
	.byte	W06
	.byte			Gn3, v104
	.byte	W06
	.byte			Gn3, v028
	.byte	W06
	.byte		N30	, An3, v104
	.byte	W30
	.byte		N06	, An3, v028
	.byte	W06
	.byte		N18	, Fs3, v104
	.byte	W18
	.byte		N06	, Fs3, v028
	.byte	W06
	.byte	PEND
song012_1_5:
	.byte		N06	, Gn3, v104
	.byte	W06
	.byte			Gn3, v028
	.byte	W06
	.byte			Fs3, v104
	.byte	W06
	.byte			Fs3, v028
	.byte	W06
	.byte			Gn3, v104
	.byte	W06
	.byte			Gn3, v028
	.byte	W06
	.byte		N42	, An3, v104
	.byte	W42
	.byte		N06	, An3, v028
	.byte	W06
	.byte			Gn3, v104
	.byte	W06
	.byte			An3
	.byte	W06
	.byte	PEND
song012_1_6:
	.byte		N06	, Bn3, v104
	.byte	W06
	.byte			Bn3, v028
	.byte	W06
	.byte			An3, v104
	.byte	W06
	.byte			An3, v028
	.byte	W06
	.byte			Bn3, v104
	.byte	W06
	.byte			Bn3, v028
	.byte	W06
	.byte		N30	, Cn4, v104
	.byte	W30
	.byte		N06	, Cn4, v028
	.byte	W06
	.byte		N18	, Bn3, v104
	.byte	W18
	.byte		N06	, Bn3, v028
	.byte	W06
	.byte	PEND
	.byte			Dn4, v104
	.byte	W06
	.byte			Dn4, v028
	.byte	W06
	.byte			Cn4, v104
	.byte	W06
	.byte			Cn4, v028
	.byte	W06
	.byte			Bn3, v104
	.byte	W06
	.byte			Bn3, v028
	.byte	W06
	.byte		N30	, An3, v104
	.byte	W30
	.byte		N06	, An3, v028
	.byte	W06
	.byte		N12	, Fs3, v104
	.byte	W12
	.byte		N06	, En3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte	PATT	
		.word	song012_1_4
	.byte	PATT	
		.word	song012_1_5
	.byte	PATT	
		.word	song012_1_6
	.byte		N06	, Dn4, v104
	.byte	W06
	.byte			Dn4, v028
	.byte	W06
	.byte			Cn4, v104
	.byte	W06
	.byte			Cn4, v028
	.byte	W06
	.byte			Bn3, v104
	.byte	W06
	.byte			Bn3, v028
	.byte	W06
	.byte		N30	, An3, v104
	.byte	W30
	.byte		N06	, An3, v028
	.byte	W06
	.byte		N18	, Fs3, v104
	.byte	W18
	.byte		N06	, Fs3, v028
	.byte	W06
	.byte	VOICE	, 63
	.byte	VOL	, v045
	.byte	PAN	, c_v-25
	.byte		N66	, Dn3, v116
	.byte	W66
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte			Dn3, v116
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte			Cn3, v116
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte		N66	, Dn3, v112
	.byte	W66
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte			Fn3, v116
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			En3, v116
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte		N66	, Fn3, v112
	.byte	W66
	.byte		N06	, Fn3, v032
	.byte	W06
	.byte			Fn3, v116
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			En3, v116
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte		N42	, Dn3, v112
	.byte	W42
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte		N42	, Cn3, v112
	.byte	W42
	.byte		N06	, Cn3, v032
	.byte	W06
	.byte		N66	, Fn2, v112
	.byte	W66
	.byte		N06	, Fn2, v032
	.byte	W06
	.byte			Fn2, v116
	.byte	W06
	.byte			Fn2, v032
	.byte	W06
	.byte			Gn2, v116
	.byte	W06
	.byte			Gn2, v032
	.byte	W06
	.byte		N66	, Gs2, v112
	.byte	W66
	.byte		N06	, Gs2, v032
	.byte	W06
	.byte			Gs2, v116
	.byte	W06
	.byte			Gs2, v032
	.byte	W06
	.byte			As2, v116
	.byte	W06
	.byte			As2, v032
	.byte	W06
	.byte		N72	, Cn3, v112
	.byte	W72
	.byte		N06	, Cn3, v032
	.byte	W12
	.byte			Cn3, v116
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte		N78	, Ds3, v112
	.byte	W78
	.byte		N06	, Ds3, v032
	.byte	W18
	.byte	GOTO	
		.word	song012_1_7
	.byte	FINE

	@********************** Track  2 **********************@

	.global song012_2
song012_2:	@ 0x0855089C
	.byte	KEYSH	, 0
song012_2_7:
	.byte	VOICE	, 34
	.byte	VOL	, v039
	.byte	PAN	, c_v
	.byte		N06	, En2, v127
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N20	
	.byte	W24
song012_2_1:
	.byte		N06	, En2, v127
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte	PEND
song012_2_2:
	.byte		N06	, En2, v127
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song012_2_1
	.byte	PATT	
		.word	song012_2_2
	.byte	PATT	
		.word	song012_2_1
	.byte	PATT	
		.word	song012_2_2
song012_2_3:
	.byte		N06	, En2, v127
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte	PEND
	.byte			Cn2
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte		N06	, An1
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			An2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte	PATT	
		.word	song012_2_2
	.byte	PATT	
		.word	song012_2_1
	.byte	PATT	
		.word	song012_2_2
	.byte	PATT	
		.word	song012_2_3
	.byte		N24	, Cn2, v127
	.byte	W36
	.byte		N06	, Gn1
	.byte	W12
	.byte		N36	, Cn2
	.byte	W48
	.byte		N36	
	.byte	W48
	.byte		N14	
	.byte	W24
	.byte		N14	
	.byte	W24
	.byte		N36	, Bn1
	.byte	W48
	.byte		N15	
	.byte	W24
	.byte			Fs1
	.byte	W24
	.byte		N60	, Bn1
	.byte	W72
	.byte		N15	
	.byte	W24
	.byte		N60	, An1
	.byte	W72
	.byte		N15	, En1
	.byte	W24
	.byte		N36	, An1
	.byte	W48
	.byte		N15	
	.byte	W24
	.byte		N15	
	.byte	W24
	.byte		N60	, Dn2
	.byte	W72
	.byte		N15	
	.byte	W24
	.byte		N18	, Bn1
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Bn1
	.byte	W12
song012_2_5:
	.byte		N06	, En2, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PEND
song012_2_4:
	.byte		N06	, Dn2, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PEND
song012_2_6:
	.byte		N06	, Cn2, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song012_2_4
	.byte	PATT	
		.word	song012_2_5
	.byte	PATT	
		.word	song012_2_4
	.byte	PATT	
		.word	song012_2_6
	.byte		N06	, Dn2, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song012_2_4
	.byte	PATT	
		.word	song012_2_6
	.byte		N06	, As1, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Bn1
	.byte	W12
	.byte	GOTO	
		.word	song012_2_7
	.byte	FINE

	@********************** Track  3 **********************@

	.global song012_3
song012_3:	@ 0x08550A08
	.byte	KEYSH	, 0
song012_3_1:
	.byte	VOICE	, 48
	.byte	VOL	, v034
	.byte	PAN	, c_v+15
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte		N06	, An2, v100
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N92	, Bn2, v096
	.byte		N92	, En3, v104
	.byte	W96
	.byte		N68	, An2, v092
	.byte		N68	, Dn3, v100
	.byte	W72
	.byte		N20	, Fs2, v076
	.byte		N20	, An2, v100
	.byte	W24
	.byte		N44	, Gn2, v080
	.byte		N44	, Bn2, v096
	.byte	W48
	.byte		N20	, Bn2, v080
	.byte		N20	, Dn3, v112
	.byte	W24
	.byte			Dn3, v080
	.byte		N20	, Gn3, v112
	.byte	W24
	.byte		N72	, Dn3, v092
	.byte		N76	, Fs3, v104
	.byte	W78
	.byte		N05	, En3, v076
	.byte	W06
	.byte			Dn3, v092
	.byte	W06
	.byte			Cs3, v068
	.byte	W06
	.byte		TIE	, Gn2, v092
	.byte		TIE	, Cn3, v104
	.byte	W96
	.byte	W64
	.byte	W01
	.byte		EOT	, Gn2
	.byte			Cn3
	.byte	W07
	.byte		N04	, Cn3, v108
	.byte	W12
	.byte		N06	, Bn2, v092
	.byte	W12
	.byte		TIE	, En2, v084
	.byte		TIE	, An2, v108
	.byte	W96
	.byte	W21
	.byte		EOT	, En2
	.byte			An2
	.byte	W03
	.byte		N21	, En2
	.byte		N21	, An2
	.byte	W24
	.byte		N21	
	.byte		N21	, Cn3
	.byte	W30
	.byte		N05	, Bn2, v088
	.byte	W06
	.byte			Cn3, v084
	.byte	W06
	.byte			Dn3, v096
	.byte	W06
	.byte		N76	, Bn2
	.byte		N76	, En3, v104
	.byte	W84
	.byte		N04	, Bn2, v092
	.byte		N04	, En3, v096
	.byte	W06
	.byte			Bn2, v088
	.byte		N04	, En3, v092
	.byte	W06
	.byte		N76	, An2, v104
	.byte		N76	, Dn3
	.byte	W84
	.byte		N03	, An2, v092
	.byte		N03	, Dn3, v096
	.byte	W12
	.byte		N76	, Bn2
	.byte		N76	, En3
	.byte	W84
	.byte		N03	, Bn2, v092
	.byte		N02	, En3, v088
	.byte	W06
	.byte		N03	, Bn2
	.byte		N03	, En3, v092
	.byte	W06
	.byte		N44	, An2, v104
	.byte		N44	, Dn3
	.byte	W48
	.byte			Fs2
	.byte		N44	, An2, v100
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 56
	.byte	VOL	, v046
	.byte	PAN	, c_v+25
	.byte		N06	, Fn3, v104
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			En3, v104
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte			Fn3, v104
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte		N30	, Gn3, v104
	.byte	W30
	.byte		N06	, Gn3, v032
	.byte	W06
	.byte		N18	, En3, v104
	.byte	W18
	.byte		N06	, En3, v032
	.byte	W06
	.byte			Fn3, v104
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			En3, v104
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte			Fn3, v104
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte		N30	, Gn3, v104
	.byte	W30
	.byte		N06	, Gn3, v032
	.byte	W06
	.byte		N18	, An3, v104
	.byte	W24
	.byte		N06	
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Gn3, v104
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			An3, v104
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte		N30	, As3, v104
	.byte	W30
	.byte		N06	, As3, v032
	.byte	W06
	.byte		N24	, An3, v104
	.byte	W24
	.byte		N06	, Cn4
	.byte	W06
	.byte			Cn4, v032
	.byte	W06
	.byte			As3, v104
	.byte	W06
	.byte			As3, v032
	.byte	W06
	.byte			An3, v104
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte		N30	, Gn3, v104
	.byte	W30
	.byte		N06	, Gn3, v032
	.byte	W06
	.byte		N12	, En3, v104
	.byte	W12
	.byte		N06	, Fn3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte			Gn3, v104
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			Gs3, v104
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte		N30	, As3, v104
	.byte	W30
	.byte		N06	, As3, v032
	.byte	W06
	.byte		N24	, Gn3, v104
	.byte	W24
	.byte		N06	, Gs3
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte			Gn3, v104
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			Gs3, v104
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte		N30	, As3, v104
	.byte	W30
	.byte		N06	, As3, v032
	.byte	W06
	.byte		N24	, Cn4, v104
	.byte	W24
	.byte		N06	
	.byte	W06
	.byte			Cn4, v032
	.byte	W06
	.byte			As3, v104
	.byte	W06
	.byte			As3, v032
	.byte	W06
	.byte			Cn4, v104
	.byte	W06
	.byte			Cn4, v032
	.byte	W06
	.byte		N30	, Cs4, v104
	.byte	W30
	.byte		N06	, Cs4, v032
	.byte	W06
	.byte		N24	, Cn4, v104
	.byte	W24
	.byte		N06	, Ds4
	.byte	W06
	.byte			Ds4, v032
	.byte	W06
	.byte			Cs4, v104
	.byte	W06
	.byte			Cs4, v032
	.byte	W06
	.byte			Cn4, v104
	.byte	W06
	.byte			Cn4, v032
	.byte	W06
	.byte		N36	, As3, v104
	.byte	W60
	.byte	GOTO	
		.word	song012_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song012_4
song012_4:	@ 0x08550BD4
	.byte	KEYSH	, 0
song012_4_4:
	.byte	VOICE	, 61
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte		N12	, Bn2, v092
	.byte	W18
	.byte		N06	, Dn3, v104
	.byte	W06
	.byte			Dn3, v032
	.byte	W12
	.byte		N24	, En3, v104
	.byte	W24
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte		N18	, En3, v104
	.byte	W18
	.byte		N06	, En3, v032
	.byte	W06
song012_4_2:
	.byte		N12	, Dn3, v104
	.byte	W18
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v032
	.byte	W12
	.byte		N24	, Fs3, v104
	.byte	W24
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte		N18	, Fs3, v104
	.byte	W18
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte	PEND
song012_4_1:
	.byte		N12	, Bn2, v104
	.byte	W18
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v032
	.byte	W12
	.byte		N24	, En3, v104
	.byte	W24
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte		N18	, En3, v104
	.byte	W18
	.byte		N06	, En3, v032
	.byte	W06
	.byte	PEND
	.byte		N24	, Dn3, v104
	.byte	W24
	.byte		N04	, Fs3
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N42	, Dn3
	.byte	W42
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte	PATT	
		.word	song012_4_1
	.byte	PATT	
		.word	song012_4_2
	.byte		N12	, En3, v104
	.byte	W18
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v032
	.byte	W12
	.byte		N24	, Gn3, v104
	.byte	W24
	.byte		N06	, An3
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte		N18	, Gn3, v104
	.byte	W18
	.byte		N06	, Gn3, v032
	.byte	W06
	.byte		N24	, Fs3, v104
	.byte	W24
	.byte		N04	, An3
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N24	, Fs3
	.byte	W48
	.byte	VOICE	, 68
	.byte	VOL	, v024
	.byte		N12	, Cn4
	.byte	W18
	.byte		N06	, Dn4
	.byte	W06
	.byte			Dn4, v032
	.byte	W12
	.byte		N24	, En4, v104
	.byte	W24
	.byte		N06	, Gn4
	.byte	W06
	.byte			Gn4, v032
	.byte	W06
	.byte		N18	, En4, v104
	.byte	W18
	.byte		N06	, En4, v032
	.byte	W06
song012_4_3:
	.byte		N12	, Dn4, v104
	.byte	W18
	.byte		N06	, En4
	.byte	W06
	.byte			En4, v032
	.byte	W12
	.byte		N54	, Fs4, v104
	.byte	W54
	.byte		N06	, Fs4, v032
	.byte	W06
	.byte	PEND
	.byte		N12	, Cn4, v104
	.byte	W18
	.byte		N06	, Dn4
	.byte	W06
	.byte			Dn4, v032
	.byte	W12
	.byte		N24	, En4, v104
	.byte	W24
	.byte		N06	, Dn4
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte		N18	, En4, v104
	.byte	W18
	.byte		N06	, En4, v032
	.byte	W06
	.byte	PATT	
		.word	song012_4_3
	.byte	VOICE	, 61
	.byte	VOL	, v041
	.byte		N12	, Bn2, v104
	.byte	W18
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v032
	.byte	W12
	.byte		N24	, En3, v104
	.byte	W24
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte		N18	, En3, v104
	.byte	W18
	.byte		N06	, En3, v032
	.byte	W06
	.byte	PATT	
		.word	song012_4_2
	.byte	PATT	
		.word	song012_4_1
	.byte		N24	, Dn3, v104
	.byte	W24
	.byte		N04	, Fs3
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N42	, Dn3
	.byte	W48
	.byte	VOICE	, 48
	.byte	VOL	, v041
	.byte		N84	
	.byte	W84
	.byte		N06	, Cn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N21	, En3
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte		N80	, Bn2
	.byte	W84
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte		N72	, Dn3, v104
	.byte	W78
	.byte		N06	, Bn2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N78	, En3, v096
	.byte	W78
	.byte		N06	, En3, v032
	.byte	W06
	.byte			Dn3, v104
	.byte	W06
	.byte			En3
	.byte	W06
	.byte		N24	, Fs3
	.byte	W24
	.byte			En3
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte			En3
	.byte	W24
	.byte		N44	, Dn3, v096
	.byte	W48
	.byte			Fs3
	.byte	W48
	.byte			Ds3, v104
	.byte	W48
	.byte		N32	, Fs3, v112
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 65
	.byte	VOL	, v037
	.byte	PAN	, c_v+36
	.byte		N72	, En2
	.byte		N72	, Gn2
	.byte	W72
	.byte		N06	, Gn2, v032
	.byte	W12
	.byte			En2, v112
	.byte		N06	, Gn2
	.byte	W06
	.byte			Fs2
	.byte		N06	, An2
	.byte	W06
	.byte		N30	, Gn2
	.byte		N30	, Bn2
	.byte	W30
	.byte		N06	, Bn2, v032
	.byte	W06
	.byte			Fs2, v112
	.byte		N06	, An2
	.byte	W06
	.byte			Gn2
	.byte		N06	, Bn2
	.byte	W06
	.byte		N12	, An2
	.byte		N12	, Cn3
	.byte	W12
	.byte		N06	, Cn3, v032
	.byte	W12
	.byte		N12	, Fs2, v112
	.byte		N12	, An2
	.byte	W12
	.byte		N06	, An2, v032
	.byte	W12
	.byte		N72	, En2, v112
	.byte		N72	, Gn2
	.byte	W72
	.byte		N06	, Gn2, v032
	.byte	W12
	.byte			Gn2, v112
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v032
	.byte	W06
	.byte		N12	, Fs2, v112
	.byte		N12	, An2
	.byte	W12
	.byte		N06	, An2, v032
	.byte	W12
	.byte		N12	, Gn2, v112
	.byte		N12	, Bn2
	.byte	W12
	.byte		N06	, Bn2, v032
	.byte	W12
	.byte		N12	, An2, v112
	.byte		N12	, Cn3
	.byte	W12
	.byte		N06	, Cn3, v032
	.byte	W12
	.byte		N12	, Dn3, v112
	.byte		N12	, Fs3
	.byte	W12
	.byte		N06	, Fs3, v032
	.byte	W12
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 68
	.byte	VOL	, v041
	.byte	PAN	, c_v-25
	.byte	W96
	.byte		N12	, Ds4, v112
	.byte	W12
	.byte			Cs4
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte		N21	, As3
	.byte	W24
	.byte		N12	, Gs3, v104
	.byte		N12	, Cs4, v112
	.byte	W12
	.byte			Gn3, v104
	.byte		N12	, Cn4, v112
	.byte	W12
	.byte			Ds3, v104
	.byte		N12	, Gs3, v112
	.byte	W12
	.byte	GOTO	
		.word	song012_4_4
	.byte	FINE

	@********************** Track  5 **********************@

	.global song012_5
song012_5:	@ 0x08550DFB
	.byte	KEYSH	, 0
song012_5_4:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 68
	.byte	VOL	, v045
	.byte	PAN	, c_v+16
	.byte		N92	, Bn3, v092
	.byte	W96
	.byte		N20	
	.byte	W24
	.byte			An3
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte		N68	, Fs3
	.byte	W72
	.byte		N05	, Fs3, v032
	.byte	W12
	.byte			Gn3, v092
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte		N80	, Fs3, v092
	.byte	W84
	.byte		N05	, Fs3, v032
	.byte	W12
	.byte		N68	, Cn4, v092
	.byte	W72
	.byte		N05	, Cn4, v032
	.byte	W12
	.byte		N06	, Bn3, v092
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte		N20	, Dn4
	.byte	W24
	.byte			Cn4
	.byte	W24
	.byte			Bn3
	.byte	W24
	.byte			Cn4
	.byte	W24
	.byte		N72	, Dn4
	.byte	W72
	.byte		N06	, Bn3
	.byte	W06
	.byte		N05	, Bn3, v032
	.byte	W06
	.byte		N06	, Dn4, v092
	.byte	W06
	.byte		N05	, Dn4, v032
	.byte	W06
	.byte		N78	, Ds4, v092
	.byte	W72
	.byte	VOICE	, 48
	.byte	VOL	, v039
	.byte	PAN	, c_v+25
	.byte	W06
	.byte		N05	, Ds4, v032
	.byte	W06
	.byte		N06	, Bn2, v104
	.byte	W06
	.byte			Dn3
	.byte	W06
song012_5_1:
	.byte		N06	, En3, v104
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte			Dn3, v104
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte			En3, v104
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte		N30	, Fs3, v104
	.byte	W30
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte		N24	, Dn3, v104
	.byte	W24
	.byte	PEND
song012_5_2:
	.byte		N06	, En3, v104
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte			Dn3, v104
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte			En3, v104
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte		N42	, Fs3, v104
	.byte	W42
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte			Dn3, v104
	.byte	W06
	.byte			En3
	.byte	W06
	.byte	PEND
song012_5_3:
	.byte		N06	, Gn3, v104
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			Fs3, v104
	.byte	W06
	.byte			Fs3, v032
	.byte	W06
	.byte			Gn3, v104
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte		N30	, An3, v104
	.byte	W30
	.byte		N06	, An3, v032
	.byte	W06
	.byte		N24	, Gn3, v104
	.byte	W24
	.byte	PEND
	.byte		N06	, Bn3
	.byte	W06
	.byte			Bn3, v032
	.byte	W06
	.byte			An3, v104
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Gn3, v104
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte		N30	, Fs3, v104
	.byte	W30
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte		N12	, Dn3, v104
	.byte	W12
	.byte		N06	, Bn2
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte	PATT	
		.word	song012_5_1
	.byte	PATT	
		.word	song012_5_2
	.byte	PATT	
		.word	song012_5_3
	.byte		N06	, Bn3, v104
	.byte	W06
	.byte			Bn3, v032
	.byte	W06
	.byte			An3, v104
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Gn3, v104
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte		N30	, Fs3, v104
	.byte	W30
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte		N12	, Dn3, v104
	.byte	W12
	.byte		N06	, An2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte			Cn3, v104
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			Dn3, v104
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte		N30	, En3, v104
	.byte	W30
	.byte		N06	, En3, v032
	.byte	W06
	.byte		N24	, Cn3, v104
	.byte	W24
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte			Cn3, v104
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			Dn3, v104
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte		N30	, En3, v104
	.byte	W30
	.byte		N06	, En3, v032
	.byte	W06
	.byte		N24	, Fn3, v104
	.byte	W24
	.byte		N06	
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			En3, v104
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte			Fn3, v104
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte		N30	, Gn3, v104
	.byte	W30
	.byte		N06	, Gn3, v032
	.byte	W06
	.byte		N24	, Fn3, v104
	.byte	W24
	.byte		N06	, An3
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Gn3, v104
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			Fn3, v104
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte		N30	, En3, v104
	.byte	W30
	.byte		N06	, En3, v032
	.byte	W06
	.byte		N12	, Cn3, v104
	.byte	W12
	.byte		N06	, Dn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			Ds3, v104
	.byte	W06
	.byte			Ds3, v032
	.byte	W06
	.byte			Fn3, v104
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte		N30	, Gn3, v104
	.byte	W30
	.byte		N06	, Gn3, v032
	.byte	W06
	.byte		N24	, Ds3, v104
	.byte	W24
	.byte		N06	, Fn3
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			Ds3, v104
	.byte	W06
	.byte			Ds3, v032
	.byte	W06
	.byte			Fn3, v104
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte		N30	, Gn3, v104
	.byte	W30
	.byte		N06	, Gn3, v032
	.byte	W06
	.byte		N24	, Gs3, v104
	.byte	W24
	.byte		N06	
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte			Gn3, v104
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			Gs3, v104
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte		N30	, As3, v104
	.byte	W30
	.byte		N06	, As3, v032
	.byte	W06
	.byte		N24	, Gs3, v104
	.byte	W24
	.byte		N06	, Cn4
	.byte	W06
	.byte			Cn4, v032
	.byte	W06
	.byte			As3, v104
	.byte	W06
	.byte			As3, v032
	.byte	W06
	.byte			Gs3, v104
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte		N48	, Gn3, v104
	.byte	W48
	.byte		N06	, Gn3, v032
	.byte	W12
	.byte	GOTO	
		.word	song012_5_4
	.byte	FINE

	@********************** Track  6 **********************@

	.global song012_6
song012_6:	@ 0x0855101C
	.byte	KEYSH	, 0
song012_6_2:
	.byte	VOICE	, 52
	.byte	VOL	, v034
	.byte	PAN	, c_v+29
	.byte		N80	, En2, v104
	.byte	W84
	.byte		N03	, En2, v096
	.byte	W06
	.byte			En2, v092
	.byte	W06
	.byte		N76	, En2, v104
	.byte	W84
	.byte		N03	, En2, v096
	.byte	W12
	.byte		N78	
	.byte	W84
	.byte		N02	, En2, v088
	.byte	W06
	.byte		N03	, En2, v092
	.byte	W06
	.byte		N64	, En2, v104
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOL	, v034
	.byte		N76	, Cn2, v068
	.byte		N68	, Gn2, v072
	.byte	W78
	.byte		N05	, Gn2, v068
	.byte	W06
	.byte			An2, v064
	.byte	W06
	.byte			Bn2, v068
	.byte	W06
	.byte		N80	, En2, v076
	.byte		N84	, Cn3, v072
	.byte	W96
	.byte		N68	, Dn2, v080
	.byte		N68	, Bn2, v072
	.byte	W72
	.byte		N06	, Dn2
	.byte		N06	, An2
	.byte	W12
	.byte			Cn2
	.byte		N06	, Gn2
	.byte	W12
	.byte		N88	, Bn1, v076
	.byte		N92	, Fs2, v084
	.byte	W96
	.byte			Cn2, v076
	.byte		N92	, Gn2
	.byte	W96
	.byte			En2
	.byte		N32	, Gn2, v072
	.byte	W36
	.byte		N11	, An2
	.byte	W12
	.byte		N44	, Bn2
	.byte	W48
	.byte		N92	, Dn2, v060
	.byte		N92	, An2, v076
	.byte	W96
	.byte			Fs2, v100
	.byte	W04
	.byte	VOL	, v034
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v012
	.byte	W02
	.byte		v013
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W12
	.byte		N06	, En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v092
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
song012_6_1:
	.byte		N06	, Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte	PEND
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			Fs2, v088
	.byte	W06
	.byte			Fs2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte	PATT	
		.word	song012_6_1
	.byte		N06	, Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v092
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v092
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v092
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v092
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			As1, v088
	.byte	W06
	.byte			As1, v032
	.byte	W06
	.byte			As1, v088
	.byte	W06
	.byte			As1, v032
	.byte	W06
	.byte			As1, v088
	.byte	W06
	.byte			As1, v032
	.byte	W06
	.byte			As1, v088
	.byte	W06
	.byte			As1, v032
	.byte	W06
	.byte			As1, v088
	.byte	W06
	.byte			As1, v032
	.byte	W06
	.byte			As1, v088
	.byte	W06
	.byte			As1, v032
	.byte	W06
	.byte			As1, v088
	.byte	W06
	.byte			As1, v032
	.byte	W06
	.byte			As1, v088
	.byte	W06
	.byte			As1, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Cn2, v092
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte	W06
	.byte			Dn2, v032
	.byte	W06
	.byte			En2, v088
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte			Fn2, v088
	.byte	W06
	.byte			Fn2, v032
	.byte	W06
	.byte			Fn2, v088
	.byte	W06
	.byte			Fn2, v032
	.byte	W06
	.byte			Fn2, v088
	.byte	W06
	.byte			Fn2, v032
	.byte	W06
	.byte			Fn2, v088
	.byte	W06
	.byte			Fn2, v032
	.byte	W06
	.byte			Fn2, v088
	.byte	W06
	.byte			Fn2, v032
	.byte	W06
	.byte			Fn2, v088
	.byte	W06
	.byte			Fn2, v032
	.byte	W06
	.byte			Fn2, v088
	.byte	W06
	.byte			Fn2, v032
	.byte	W06
	.byte			Fn2, v088
	.byte	W06
	.byte			Fn2, v032
	.byte	W06
	.byte			Ds2, v088
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v088
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v088
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v088
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v088
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v088
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v088
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v088
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Cs2, v088
	.byte	W06
	.byte			Cs2, v032
	.byte	W06
	.byte			Cs2, v088
	.byte	W06
	.byte			Cs2, v032
	.byte	W06
	.byte			Cs2, v088
	.byte	W06
	.byte			Cs2, v032
	.byte	W06
	.byte			Cs2, v088
	.byte	W06
	.byte			Cs2, v032
	.byte	W06
	.byte			Cs2, v088
	.byte	W06
	.byte			Cs2, v032
	.byte	W06
	.byte			Cs2, v088
	.byte	W06
	.byte			Cs2, v032
	.byte	W06
	.byte			Cs2, v088
	.byte	W06
	.byte			Cs2, v032
	.byte	W06
	.byte			Cs2, v088
	.byte	W06
	.byte			Cs2, v032
	.byte	W06
	.byte			Ds2, v088
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v092
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v092
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v092
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v092
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v092
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v092
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte			Ds2, v092
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte	GOTO	
		.word	song012_6_2
	.byte	FINE

	@********************** Track  7 **********************@

	.global song012_7
song012_7:	@ 0x0855141C
	.byte	KEYSH	, 0
song012_7_1:
	.byte	VOICE	, 127
	.byte	VOL	, v034
	.byte	PAN	, c_v
	.byte		N36	, Cs2, v112
	.byte	W36
	.byte		N06	, Dn1, v076
	.byte	W24
	.byte			Dn1, v112
	.byte	W24
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v112
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Dn1, v100
	.byte	W24
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v112
	.byte	W12
	.byte		N11	, Fn1, v092
	.byte	W12
	.byte		N06	, Dn1, v100
	.byte	W12
	.byte			Dn1, v116
	.byte	W24
	.byte			Dn1, v112
	.byte	W24
	.byte			Dn1, v100
	.byte	W24
	.byte			Dn1, v120
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Dn1, v100
	.byte	W24
	.byte			Dn1, v112
	.byte	W12
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W06
	.byte			Dn1, v112
	.byte	W06
	.byte			Dn1, v100
	.byte	W12
	.byte			Dn1, v116
	.byte	W24
	.byte			Dn1, v112
	.byte	W24
	.byte			Dn1, v100
	.byte	W24
	.byte			Dn1, v092
	.byte	W12
	.byte	W12
	.byte			Dn1, v116
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Dn1, v112
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N11	, Fn1, v092
	.byte	W12
	.byte		N06	, Dn1, v112
	.byte	W12
	.byte			Dn1, v120
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Dn1, v092
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	W12
	.byte			Dn1, v120
	.byte	W24
	.byte			Dn1, v112
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N05	, Cn2
	.byte	W12
	.byte			An1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	, Cs2, v076
	.byte	W12
	.byte		N06	, Dn1, v112
	.byte	W24
	.byte			Dn1, v080
	.byte	W24
	.byte			Dn1, v092
	.byte	W24
	.byte			Dn1, v072
	.byte	W12
	.byte	W12
	.byte			Dn1, v112
	.byte	W24
	.byte			Dn1, v080
	.byte	W24
	.byte			Dn1, v076
	.byte	W24
	.byte			Dn1, v112
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn1, v100
	.byte	W12
	.byte			Dn1, v116
	.byte	W24
	.byte			Dn1, v084
	.byte	W24
	.byte			Dn1, v120
	.byte	W24
	.byte			Dn1, v116
	.byte	W12
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Dn1, v076
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N11	, Cn2, v112
	.byte	W12
	.byte			An1
	.byte	W12
	.byte		N06	, Dn1, v076
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	W12
	.byte			Dn1, v084
	.byte	W24
	.byte			Dn1, v112
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn1, v100
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	W12
	.byte			Dn1, v120
	.byte	W24
	.byte			Dn1, v116
	.byte	W24
	.byte			Dn1, v100
	.byte	W12
	.byte			Dn1, v112
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn1, v100
	.byte	W12
	.byte			Dn1, v116
	.byte	W24
	.byte			Dn1, v112
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Dn1, v120
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Dn1, v100
	.byte	W24
	.byte			Dn1, v076
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N12	, Ds1, v092
	.byte	W12
	.byte		N44	, Cs2, v068
	.byte	W48
	.byte		N06	, Fs1, v092
	.byte	W36
	.byte		N11	, Bn4, v084
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N32	, Bn4, v112
	.byte	W36
	.byte		N06	, Fs1, v080
	.byte	W24
	.byte		N06	
	.byte	W06
	.byte			Fs1, v072
	.byte	W06
	.byte		N11	, As1, v076
	.byte	W12
	.byte			Bn4, v100
	.byte	W12
	.byte		N32	, Bn4, v112
	.byte	W36
	.byte		N06	, Fs1, v092
	.byte	W48
	.byte			Fs1, v080
	.byte	W36
	.byte		N06	
	.byte	W24
	.byte			Fs1, v068
	.byte	W12
	.byte			Fs1, v076
	.byte	W12
	.byte		N11	, As1, v064
	.byte	W12
	.byte		N06	, Fs1, v076
	.byte	W48
	.byte			Fs1, v092
	.byte	W36
	.byte		N11	, Bn4, v112
	.byte	W12
	.byte			Bn4, v100
	.byte	W12
	.byte		N32	, Bn4, v084
	.byte	W36
	.byte		N06	, Fs1, v076
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N11	, As1
	.byte	W12
	.byte			Bn4, v092
	.byte	W12
	.byte		N32	, Bn4, v112
	.byte	W36
	.byte		N06	, Fs1, v092
	.byte	W24
	.byte			Fs1, v084
	.byte	W24
	.byte			Fs1, v088
	.byte	W18
	.byte		N78	, En2, v124
	.byte	W06
	.byte		N06	, Fs1, v104
	.byte	W24
	.byte		N05	, Cn2, v112
	.byte	W12
	.byte			An1, v120
	.byte	W12
	.byte		N06	, Dn1, v072
	.byte	W06
	.byte			Dn1, v084
	.byte	W06
	.byte			Dn1, v104
	.byte	W06
	.byte			Dn1, v112
	.byte	W06
	.byte		N44	, Cs2
	.byte	W48
	.byte		N06	, Dn1, v100
	.byte	W12
	.byte			Dn1, v116
	.byte	W24
	.byte			Dn1, v072
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v100
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte			Dn1, v092
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn1, v116
	.byte	W12
	.byte			Dn1, v100
	.byte	W36
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v112
	.byte	W24
	.byte			Dn1, v080
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v092
	.byte	W36
	.byte			Dn1, v100
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v080
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn1, v076
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte			Dn1, v100
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte			Dn1, v116
	.byte	W12
	.byte			Dn1, v112
	.byte	W36
	.byte			Dn1, v116
	.byte	W12
	.byte			Dn1, v112
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte			Dn1, v100
	.byte	W36
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v100
	.byte	W24
	.byte			Dn1, v116
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v100
	.byte	W24
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v080
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn1, v088
	.byte	W06
	.byte			Dn1, v096
	.byte	W06
	.byte		N44	, Cs2, v112
	.byte	W48
	.byte		N06	, Dn1, v080
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v100
	.byte	W36
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v084
	.byte	W24
	.byte			Dn1, v080
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v068
	.byte	W24
	.byte			Dn1, v064
	.byte	W12
	.byte			Dn1, v112
	.byte	W12
	.byte			Dn1, v064
	.byte	W24
	.byte			Dn1, v072
	.byte	W12
	.byte			Dn1, v100
	.byte	W12
	.byte			Dn1, v076
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v064
	.byte	W12
	.byte			Dn1, v068
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N44	, Cs2, v112
	.byte	W48
	.byte		N06	, Dn1, v092
	.byte	W12
	.byte			Dn1, v072
	.byte	W24
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v064
	.byte	W24
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v100
	.byte	W12
	.byte			Dn1, v068
	.byte	W24
	.byte			Dn1, v072
	.byte	W12
	.byte			Dn1, v112
	.byte	W12
	.byte			Dn1, v052
	.byte	W24
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v100
	.byte	W12
	.byte			Dn1, v076
	.byte	W24
	.byte			Dn1, v072
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N11	, Cn2, v112
	.byte	W12
	.byte		N05	, Cn2, v127
	.byte	W06
	.byte			An1
	.byte	W06
	.byte			Fn1
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	GOTO	
		.word	song012_7_1
	.byte	FINE

	.align 2
	.global song012
song012:	@ 0x085516B8
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup043		@ voicegroup/tone

	.word	song012_1		@ track
	.word	song012_2		@ track
	.word	song012_3		@ track
	.word	song012_4		@ track
	.word	song012_5		@ track
	.word	song012_6		@ track
	.word	song012_7		@ track
