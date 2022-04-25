	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song011_1
song011_1:	@ 0x0854F3E0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	W24
song011_1_2:
	.byte	VOICE	, 63
	.byte	VOL	, v048
	.byte	PAN	, c_v+13
	.byte		N30	, Gs2, v120
	.byte	W36
	.byte		N06	, En2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte		N18	, Bn2
	.byte	W18
	.byte		N06	, Bn2, v024
	.byte	W06
	.byte		N18	, En3, v120
	.byte	W18
	.byte		N06	, En3, v024
	.byte	W06
	.byte		N30	, Dn3, v120
	.byte	W30
	.byte		N06	, Dn3, v024
	.byte	W06
	.byte			An2, v120
	.byte	W12
	.byte		N44	, Fs2
	.byte	W48
	.byte		N30	, Gs2
	.byte	W36
	.byte		N06	, En2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte		N18	, Bn2
	.byte	W18
	.byte		N06	, Bn2, v024
	.byte	W06
	.byte		N18	, En3, v120
	.byte	W18
	.byte		N06	, En3, v024
	.byte	W06
	.byte		N30	, Fs3, v120
	.byte	W30
	.byte		N06	, Fs3, v024
	.byte	W06
	.byte			Gs3, v120
	.byte	W12
	.byte		N18	, Fs3
	.byte	W18
	.byte		N06	, Fs3, v024
	.byte	W06
	.byte		N18	, Dn3, v120
	.byte	W18
	.byte		N06	, Dn3, v024
	.byte	W06
	.byte		N30	, En3, v120
	.byte	W30
	.byte		N06	, En3, v024
	.byte	W06
	.byte			Cn3, v120
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N18	, En3
	.byte	W18
	.byte		N06	, En3, v024
	.byte	W06
	.byte		N18	, Fs3, v120
	.byte	W18
	.byte		N06	, Fs3, v024
	.byte	W06
	.byte		N30	, Dn3, v120
	.byte	W30
	.byte		N06	, Dn3, v024
	.byte	W06
	.byte			En3, v120
	.byte	W12
	.byte		N18	, Dn3
	.byte	W18
	.byte		N06	, Dn3, v024
	.byte	W06
	.byte		N18	, Bn2, v120
	.byte	W18
	.byte		N06	, Bn2, v024
	.byte	W06
	.byte		N30	, Cn3, v120
	.byte	W30
	.byte		N06	, Cn3, v024
	.byte	W06
	.byte			Dn3, v120
	.byte	W12
	.byte		N18	, En3
	.byte	W18
	.byte		N06	, En3, v024
	.byte	W06
	.byte		N18	, Cn3, v120
	.byte	W18
	.byte		N06	, Cn3, v024
	.byte	W06
	.byte		N42	, Ds3, v120
	.byte	W42
	.byte		N06	, Ds3, v024
	.byte	W06
	.byte		N42	, Bn2, v120
	.byte	W42
	.byte		N06	, Bn2, v024
	.byte	W06
song011_1_1:
	.byte		N30	, Gs2, v127
	.byte	W30
	.byte		N06	, Gs2, v032
	.byte	W06
	.byte			En2, v127
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte		N18	, Bn2
	.byte	W18
	.byte		N06	, Bn2, v032
	.byte	W06
	.byte		N18	, En3, v127
	.byte	W18
	.byte		N06	, En3, v032
	.byte	W06
	.byte	PEND
	.byte		N24	, Dn3, v127
	.byte	W24
	.byte		N06	, Dn3, v032
	.byte	W12
	.byte			An2, v127
	.byte	W06
	.byte			An2, v032
	.byte	W06
	.byte		N36	, Fs2, v127
	.byte	W36
	.byte		N06	, Fs2, v028
	.byte	W12
	.byte	PATT	
		.word	song011_1_1
	.byte		N28	, Fs3, v127
	.byte	W30
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte			Gs3, v127
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte		N18	, Fs3, v127
	.byte	W18
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte		N18	, Dn3, v127
	.byte	W18
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte		N24	, En3, v127
	.byte	W30
	.byte		N06	, En3, v032
	.byte	W06
	.byte			Cn3, v127
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N18	, En3
	.byte	W18
	.byte		N06	, En3, v032
	.byte	W06
	.byte		N18	, Fs3, v127
	.byte	W18
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte		N28	, Dn3, v127
	.byte	W30
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte			En3, v127
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte		N18	, Dn3, v127
	.byte	W18
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte		N18	, Bn2, v127
	.byte	W18
	.byte		N06	, Bn2, v032
	.byte	W06
	.byte		N28	, Cn3, v127
	.byte	W30
	.byte		N06	, Cn3, v024
	.byte	W06
	.byte			Dn3, v127
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte		N18	, En3, v127
	.byte	W18
	.byte		N06	, En3, v032
	.byte	W06
	.byte		N18	, Fs3, v127
	.byte	W18
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte		N24	, Ds3, v127
	.byte	W30
	.byte		N06	, Ds3, v056
	.byte	W06
	.byte			En3, v127
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte		N32	, Fs3, v127
	.byte	W36
	.byte		N06	, Fs3, v028
	.byte	W12
	.byte	VOICE	, 50
	.byte	VOL	, v044
	.byte		N56	, Gn4, v112
	.byte	W60
	.byte		N06	, Bn4
	.byte	W06
	.byte			Bn4, v036
	.byte	W06
	.byte			An4, v112
	.byte	W06
	.byte			An4, v036
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Gn4, v036
	.byte	W06
	.byte		N44	, Fs4, v112
	.byte	W48
	.byte		N36	, Dn4
	.byte	W48
	.byte		N56	, Gn4
	.byte	W60
	.byte		N06	, Bn4
	.byte	W06
	.byte			Bn4, v036
	.byte	W06
	.byte			An4, v112
	.byte	W06
	.byte			An4, v036
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Gn4, v036
	.byte	W06
	.byte		N44	, Fs4, v112
	.byte	W48
	.byte			An4
	.byte	W48
	.byte		N11	, En4, v096
	.byte		N11	, Gn4, v112
	.byte	W12
	.byte			Dn4, v096
	.byte		N11	, Fs4, v112
	.byte	W12
	.byte			En4, v096
	.byte		N11	, Gn4, v112
	.byte	W12
	.byte		N23	, Cn4, v096
	.byte		N23	, En4, v112
	.byte	W24
	.byte		N05	, Gn4, v096
	.byte		N05	, Bn4, v112
	.byte	W06
	.byte			Bn4, v036
	.byte	W06
	.byte			Fs4, v096
	.byte		N05	, An4, v112
	.byte	W06
	.byte			An4, v036
	.byte	W06
	.byte			En4, v096
	.byte		N05	, Gn4, v112
	.byte	W06
	.byte			Gn4, v036
	.byte	W06
	.byte		N11	, Dn4, v096
	.byte		N11	, Fs4, v112
	.byte	W12
	.byte			Cs4, v096
	.byte		N11	, En4, v112
	.byte	W12
	.byte			Dn4, v096
	.byte		N11	, Fs4, v112
	.byte	W12
	.byte			Bn3, v096
	.byte		N11	, Dn4, v112
	.byte	W12
	.byte		N40	, Fs4, v096
	.byte		N40	, An4, v112
	.byte	W42
	.byte		N05	, An4, v036
	.byte	W06
	.byte			Gn4, v096
	.byte		N05	, Bn4, v112
	.byte	W06
	.byte			Bn4, v036
	.byte	W06
	.byte			Fs4, v096
	.byte		N05	, An4, v112
	.byte	W06
	.byte			An4, v036
	.byte	W06
	.byte			En4, v096
	.byte		N05	, Gn4, v112
	.byte	W06
	.byte			Gn4, v036
	.byte	W06
	.byte		N23	, Fs4, v112
	.byte		N23	, An4
	.byte	W24
	.byte		N05	, Dn4, v096
	.byte		N05	, Fs4, v112
	.byte	W06
	.byte			Fs4, v036
	.byte	W06
	.byte			En4, v096
	.byte		N05	, Gn4, v112
	.byte	W06
	.byte			Gn4, v036
	.byte	W06
	.byte			Fs4, v096
	.byte		N05	, An4, v112
	.byte	W06
	.byte			An4, v036
	.byte	W06
	.byte		N40	, Fs4, v096
	.byte		N40	, Bn4, v112
	.byte	W42
	.byte		N05	, Bn4, v036
	.byte	W06
	.byte		N40	, Ds4, v096
	.byte		N40	, Fs4, v112
	.byte	W42
	.byte		N05	, Fs4, v036
	.byte	W06
	.byte	VOICE	, 51
	.byte	MOD	, 0
	.byte	VOL	, v044
	.byte		N30	, En4, v104
	.byte	W30
	.byte		N05	, En4, v036
	.byte	W10
	.byte		N04	, Bn3, v104
	.byte	W04
	.byte			Bn3, v036
	.byte	W04
	.byte		N18	, An3, v104
	.byte	W18
	.byte		N05	, An3, v036
	.byte	W06
	.byte		N18	, Bn3, v104
	.byte	W18
	.byte		N05	, Bn3, v036
	.byte	W06
	.byte		N04	, En4, v104
	.byte	W04
	.byte			En4, v036
	.byte	W04
	.byte			Fs4, v104
	.byte	W04
	.byte			Fs4, v036
	.byte	W04
	.byte			Gn4, v104
	.byte	W04
	.byte			Gn4, v036
	.byte	W04
	.byte		N60	, Fs4, v104
	.byte	W60
	.byte		N05	, Fs4, v036
	.byte	W12
	.byte		N30	, Cs4, v104
	.byte	W30
	.byte		N05	, Cs4, v036
	.byte	W10
	.byte		N04	, Gs3, v104
	.byte	W04
	.byte			Gs3, v036
	.byte	W04
	.byte		N18	, Fs3, v104
	.byte	W18
	.byte		N05	, Fs3, v036
	.byte	W06
	.byte		N18	, Gs3, v104
	.byte	W18
	.byte		N05	, Gs3, v036
	.byte	W06
	.byte		N04	, Cs4, v104
	.byte	W04
	.byte			Cs4, v036
	.byte	W04
	.byte			Ds4, v104
	.byte	W04
	.byte			Ds4, v036
	.byte	W04
	.byte			En4, v104
	.byte	W04
	.byte			En4, v036
	.byte	W04
	.byte		N60	, Ds4, v104
	.byte	W60
	.byte		N05	, Ds4, v036
	.byte	W12
	.byte		N04	, En4, v104
	.byte	W04
	.byte			En4, v036
	.byte	W04
	.byte			Fs4, v104
	.byte	W04
	.byte			Fs4, v036
	.byte	W04
	.byte			Gs4, v104
	.byte	W04
	.byte			Gs4, v036
	.byte	W04
	.byte		N60	, Fs4, v104
	.byte	W60
	.byte		N05	, Fs4, v036
	.byte	W11
	.byte	VOL	, v044
	.byte	W01
	.byte	VOICE	, 57
	.byte	VOL	, v051
	.byte	PAN	, c_v+5
	.byte		N06	, Cs3, v076
	.byte		N06	, Cs4, v084
	.byte	W06
	.byte			Bn2, v076
	.byte		N06	, Bn3, v084
	.byte	W06
	.byte			An2, v076
	.byte		N06	, An3, v084
	.byte	W06
	.byte			An2, v020
	.byte		N06	, An3, v028
	.byte	W06
	.byte			Bn2, v076
	.byte		N06	, Bn3, v084
	.byte	W06
	.byte			Bn2, v020
	.byte		N06	, Bn3, v028
	.byte	W06
	.byte			Gs2, v076
	.byte		N06	, Gs3, v084
	.byte	W06
	.byte			Gs2, v020
	.byte		N06	, Gs3, v028
	.byte	W06
	.byte			An2, v076
	.byte		N06	, An3, v084
	.byte	W06
	.byte			An2, v020
	.byte		N06	, An3, v028
	.byte	W06
	.byte		N24	, En3, v076
	.byte		N24	, En4, v084
	.byte	W24
	.byte		N06	, En4, v028
	.byte	W12
	.byte			Ds3, v076
	.byte		N06	, Ds4, v084
	.byte	W06
	.byte			Cs3, v076
	.byte		N06	, Cs4, v084
	.byte	W06
	.byte			Bn2, v076
	.byte		N06	, Bn3, v084
	.byte	W06
	.byte			Bn2, v020
	.byte		N06	, Bn3, v028
	.byte	W06
	.byte			Cs3, v076
	.byte		N06	, Cs4, v084
	.byte	W06
	.byte			Cs3, v020
	.byte		N06	, Cs4, v028
	.byte	W06
	.byte			As2, v076
	.byte		N06	, As3, v084
	.byte	W06
	.byte			As2, v020
	.byte		N06	, As3, v028
	.byte	W06
	.byte			Bn2, v076
	.byte		N06	, Bn3, v084
	.byte	W06
	.byte			Bn2, v020
	.byte		N06	, Bn3, v028
	.byte	W06
	.byte		N24	, Fs3, v076
	.byte		N24	, Fs4, v084
	.byte	W24
	.byte		N06	, Fs4, v028
	.byte	W12
	.byte	VOICE	, 102
	.byte	PAN	, c_v-5
	.byte		N06	, Ds4, v088
	.byte	W06
	.byte			Ds4, v020
	.byte	W06
	.byte			Cs4, v088
	.byte	W06
	.byte			Cs4, v020
	.byte	W06
	.byte			Ds4, v088
	.byte	W06
	.byte			Ds4, v020
	.byte	W06
	.byte		N54	, Fn4, v088
	.byte	W54
	.byte		N06	, Fn4, v020
	.byte	W06
	.byte			Fs4, v088
	.byte	W06
	.byte			Fs4, v020
	.byte	W06
	.byte			Fn4, v088
	.byte	W06
	.byte			Fn4, v020
	.byte	W06
	.byte			Fs4, v088
	.byte	W06
	.byte			Fs4, v020
	.byte	W06
	.byte		N48	, Gs4, v088
	.byte	W48
	.byte		N06	, Gs4, v020
	.byte	W12
	.byte			As4, v088
	.byte	W06
	.byte			As4, v020
	.byte	W06
	.byte			Gs4, v088
	.byte	W06
	.byte			Gs4, v020
	.byte	W06
	.byte			As4, v088
	.byte	W06
	.byte			As4, v020
	.byte	W06
	.byte		N54	, Cs5, v088
	.byte	W54
	.byte		N06	, Cs5, v020
	.byte	W06
	.byte		N30	, Fs4, v088
	.byte	W30
	.byte		N06	, Fs4, v020
	.byte	W06
	.byte			Gs4, v088
	.byte	W06
	.byte			Gs4, v020
	.byte	W06
	.byte		N36	, As4, v088
	.byte	W36
	.byte	W03
	.byte		N06	, As4, v020
	.byte	W09
	.byte			Gs4, v088
	.byte	W06
	.byte			Gs4, v020
	.byte	W06
	.byte			Fs4, v088
	.byte	W06
	.byte			Fs4, v020
	.byte	W06
	.byte			Gs4, v088
	.byte	W06
	.byte			Gs4, v020
	.byte	W06
	.byte		N54	, As4, v088
	.byte	W54
	.byte		N06	, As4, v020
	.byte	W06
	.byte			Bn4, v088
	.byte	W06
	.byte			Bn4, v020
	.byte	W06
	.byte			As4, v088
	.byte	W06
	.byte			As4, v020
	.byte	W06
	.byte			Bn4, v088
	.byte	W06
	.byte			Bn4, v020
	.byte	W06
	.byte		N36	, Cs5, v088
	.byte	W42
	.byte		N06	, Cs5, v020
	.byte	W06
	.byte			As3, v088
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte		N32	, Cs4
	.byte	W36
	.byte		N06	, As3
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte		N21	, Fn4
	.byte	W24
	.byte			As4
	.byte	W24
	.byte		N32	, Gs4
	.byte	W36
	.byte		N06	, Ds4
	.byte	W06
	.byte			Ds4, v020
	.byte	W06
	.byte		N30	, Cn4, v088
	.byte	W30
	.byte		N06	, Cn4, v020
	.byte	W06
	.byte			Cs4, v088
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte		N32	, Fn4
	.byte	W36
	.byte		N06	, Cs4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte		N44	, As4
	.byte	W48
	.byte		N36	, Cn5
	.byte	W42
	.byte		N06	, Cn5, v020
	.byte	W06
	.byte		N36	, Gs4, v088
	.byte	W42
	.byte		N06	, Gs4, v020
	.byte	W06
	.byte		N60	, As4, v088
	.byte	W48
	.byte	W01
	.byte	VOL	, v051
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v000
	.byte	W02
	.byte		N06	, As4, v020
	.byte	W12
	.byte	VOICE	, 63
	.byte	VOL	, v051
	.byte	PAN	, c_v
	.byte		N05	, Cs2, v104
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte	GOTO	
		.word	song011_1_2
	.byte	FINE

	@********************** Track  2 **********************@

	.global song011_2
song011_2:	@ 0x0854F890
	.byte	KEYSH	, 0
	.byte	VOICE	, 34
	.byte	VOL	, v045
	.byte	PAN	, c_v
	.byte		N19	, Bn1, v127
	.byte	W24
song011_2_1:
	.byte		N08	, En2, v127
	.byte	W24
	.byte		N19	
	.byte	W24
	.byte		N04	, En2, v116
	.byte	W24
	.byte		N16	, En2, v127
	.byte	W24
	.byte	PEND
song011_2_2:
	.byte		N04	, En2, v127
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N05	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte	PEND
song011_2_3:
	.byte		N03	, En2, v127
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N04	
	.byte	W24
	.byte		N23	, En2, v116
	.byte	W24
	.byte	PEND
song011_2_4:
	.byte		N07	, En2, v127
	.byte	W24
	.byte		N19	
	.byte	W24
	.byte		N05	, Dn2
	.byte	W24
	.byte		N23	
	.byte	W24
	.byte	PEND
song011_2_5:
	.byte		N07	, Cn2, v127
	.byte	W24
	.byte		N23	
	.byte	W24
	.byte		N04	, Cn2, v124
	.byte	W24
	.byte		N23	, Cn2, v127
	.byte	W24
	.byte	PEND
song011_2_6:
	.byte		N04	, Gn1, v116
	.byte	W24
	.byte		N18	, Gn1, v127
	.byte	W24
	.byte		N06	, Gn1, v124
	.byte	W24
	.byte		N23	, Gn1, v127
	.byte	W24
	.byte	PEND
song011_2_7:
	.byte		N07	, An1, v127
	.byte	W24
	.byte		N21	
	.byte	W24
	.byte		N06	, An1, v108
	.byte	W24
	.byte		N24	, An1, v127
	.byte	W24
	.byte	PEND
song011_2_8:
	.byte		N05	, Bn1, v127
	.byte	W24
	.byte		N19	
	.byte	W24
	.byte		N11	, Bn1, v116
	.byte	W24
	.byte		N09	, Bn1, v127
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song011_2_1
	.byte	PATT	
		.word	song011_2_2
	.byte	PATT	
		.word	song011_2_3
	.byte	PATT	
		.word	song011_2_4
	.byte	PATT	
		.word	song011_2_5
	.byte	PATT	
		.word	song011_2_6
	.byte	PATT	
		.word	song011_2_7
	.byte	PATT	
		.word	song011_2_8
	.byte		N72	, An1, v127
	.byte	W84
	.byte		N05	, Bn1
	.byte	W06
	.byte			Cn2
	.byte	W06
	.byte		N72	, Bn1, v100
	.byte	W84
	.byte		N05	, Cn2, v116
	.byte	W06
	.byte			Dn2, v096
	.byte	W06
	.byte		N76	, Cn2, v108
	.byte	W84
	.byte		N05	, Dn2
	.byte	W06
	.byte			En2
	.byte	W06
	.byte		N76	, Dn2, v127
	.byte	W96
	.byte		N05	, An1, v116
	.byte	W24
	.byte		N48	, An1, v127
	.byte	W60
	.byte		N05	, Bn1, v092
	.byte	W06
	.byte			Cn2, v088
	.byte	W06
	.byte			Bn1, v116
	.byte	W24
	.byte		N32	
	.byte	W48
	.byte		N23	, Bn1, v127
	.byte	W24
	.byte		N05	, Cn2, v116
	.byte	W24
	.byte		N48	, Cn2, v127
	.byte	W60
	.byte		N11	, Cn2, v084
	.byte	W12
	.byte		N05	, Dn2, v116
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte		N18	, Ds2, v127
	.byte	W24
	.byte			Bn1
	.byte	W24
	.byte		N90	, En2
	.byte	W96
	.byte		N66	, Cn2
	.byte	W72
	.byte		N20	
	.byte	W24
	.byte		N64	, Cs2
	.byte	W72
	.byte		N21	, Bn1
	.byte	W24
	.byte		N66	, An1
	.byte	W72
	.byte		N21	
	.byte	W24
	.byte		N56	, Bn1
	.byte	W72
	.byte		N22	
	.byte	W24
	.byte		N30	, An1, v124
	.byte	W36
	.byte		N05	
	.byte	W12
	.byte		N36	, Bn1
	.byte	W48
	.byte		N24	
	.byte	W36
	.byte		N05	
	.byte	W12
	.byte		N21	, Cs2
	.byte	W24
	.byte			Fs1, v127
	.byte	W24
	.byte		N44	, Bn1
	.byte	W84
	.byte	W01
	.byte		N04	, Bn1, v116
	.byte	W11
	.byte		N42	
	.byte	W84
	.byte		N04	
	.byte	W12
	.byte		N48	, Fs1, v120
	.byte	W84
	.byte		N04	, Cs2
	.byte	W12
	.byte		N48	, Fs1, v127
	.byte	W84
	.byte		N04	
	.byte	W12
	.byte		N36	, Gs1, v120
	.byte	W84
	.byte		N03	, Ds2, v116
	.byte	W12
	.byte		N24	, Gs1
	.byte	W84
	.byte		N04	, Gs1, v112
	.byte	W12
	.byte		N36	, As1, v116
	.byte	W84
	.byte		N03	
	.byte	W12
	.byte		N40	, Gs1, v120
	.byte	W84
	.byte		N04	, Gs1, v116
	.byte	W12
	.byte		N52	, As1, v120
	.byte	W84
	.byte		N04	, As1, v127
	.byte	W12
	.byte		N44	, Gs1, v080
	.byte	W84
	.byte		N04	, Gs1, v068
	.byte	W12
	.byte		N42	, As1, v116
	.byte	W96
	.byte	GOTO	
		.word	song011_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song011_3
song011_3:	@ 0x0854FA03
	.byte	KEYSH	, 0
	.byte	W24
song011_3_1:
	.byte	VOICE	, 62
	.byte	VOL	, v049
	.byte	PAN	, c_v-18
	.byte		N24	, En2, v092
	.byte	W36
	.byte		N06	, Bn1
	.byte	W06
	.byte			En2
	.byte	W06
	.byte		N18	, Gs2
	.byte	W24
	.byte		N20	, Bn2
	.byte	W24
	.byte		N24	, An2
	.byte	W36
	.byte		N06	, Fs2
	.byte	W12
	.byte		N36	, Dn2
	.byte	W48
	.byte		N24	, En2
	.byte	W36
	.byte		N06	, Bn1
	.byte	W06
	.byte			En2
	.byte	W06
	.byte		N18	, Gs2
	.byte	W24
	.byte		N20	, Bn2
	.byte	W24
	.byte		N24	, Dn3
	.byte	W36
	.byte		N06	, En3
	.byte	W12
	.byte		N18	, Dn3
	.byte	W24
	.byte			An2
	.byte	W24
	.byte		N24	, Cn3
	.byte	W36
	.byte		N06	, An2
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte		N15	, Cn3
	.byte	W24
	.byte		N20	, Dn3
	.byte	W24
	.byte		N30	, Bn2
	.byte	W36
	.byte		N06	, Cn3
	.byte	W12
	.byte		N18	, Bn2
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte		N24	, An2
	.byte	W36
	.byte		N06	, Bn2
	.byte	W12
	.byte		N18	, Cn3
	.byte	W24
	.byte			An2
	.byte	W24
	.byte		N36	, Bn2
	.byte	W48
	.byte			Fs2
	.byte	W48
	.byte	W96
	.byte	W60
	.byte		N06	, Cs4, v076
	.byte	W06
	.byte			Cs4, v032
	.byte	W06
	.byte			Bn3, v076
	.byte	W06
	.byte			Bn3, v032
	.byte	W06
	.byte			An3, v076
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte		N72	, Bn3, v076
	.byte	W72
	.byte		N06	, Bn3, v032
	.byte	W24
	.byte		N24	, Fs3, v076
	.byte	W24
	.byte		N06	, Fs3, v032
	.byte	W12
	.byte			Gs3, v076
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte		N36	, An3, v076
	.byte	W36
	.byte		N06	, An3, v032
	.byte	W12
	.byte		N24	, Gn3, v076
	.byte	W24
	.byte		N06	, Gn3, v032
	.byte	W12
	.byte			An3, v076
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte		N36	, Bn3, v076
	.byte	W36
	.byte		N06	, Bn3, v032
	.byte	W12
	.byte		N24	, An3, v076
	.byte	W24
	.byte		N06	, An3, v032
	.byte	W12
	.byte			Bn3, v076
	.byte	W06
	.byte			Bn3, v032
	.byte	W06
	.byte		N36	, An3, v076
	.byte	W36
	.byte		N06	, An3, v032
	.byte	W12
	.byte		N48	, An3, v076
	.byte	W48
	.byte		N06	, An3, v032
	.byte	W12
	.byte			An3, v076
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Bn3, v076
	.byte	W06
	.byte			Bn3, v032
	.byte	W06
	.byte			Cn4, v076
	.byte	W06
	.byte			Cn4, v032
	.byte	W06
	.byte		N42	, Bn3, v076
	.byte	W42
	.byte		N06	, Bn3, v032
	.byte	W06
	.byte		N36	, Fs3, v076
	.byte	W36
	.byte		N06	, Fs3, v032
	.byte	W11
	.byte	VOL	, v049
	.byte	W01
	.byte	VOICE	, 48
	.byte	VOL	, v044
	.byte	PAN	, c_v-24
	.byte		N92	, An2, v064
	.byte		N96	, Cn3, v080
	.byte	W96
	.byte		N92	, Bn2, v064
	.byte		N96	, Dn3, v080
	.byte	W96
	.byte		N92	, Cn3, v064
	.byte		N96	, En3, v080
	.byte	W96
	.byte		N92	, Dn3, v064
	.byte		N96	, Fs3, v080
	.byte	W96
	.byte		N06	, An2, v096
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v036
	.byte	W06
	.byte			An2, v080
	.byte		N06	, Cn3, v084
	.byte	W06
	.byte			Cn3, v036
	.byte	W06
	.byte			An2, v096
	.byte		N06	, Cn3, v108
	.byte	W06
	.byte			Cn3, v036
	.byte	W06
	.byte			An2, v084
	.byte		N06	, Cn3, v088
	.byte	W06
	.byte			Cn3, v036
	.byte	W06
	.byte			An2, v088
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v036
	.byte	W06
	.byte			An2, v080
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v036
	.byte	W06
	.byte			An2, v084
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v036
	.byte	W06
	.byte			An2, v084
	.byte		N06	, Dn3
	.byte	W06
	.byte			En3, v088
	.byte	W06
	.byte			Bn2, v096
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v036
	.byte	W06
	.byte			Bn2, v080
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v036
	.byte	W06
	.byte			Bn2, v076
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v036
	.byte	W06
	.byte			Bn2, v076
	.byte		N06	, Dn3, v084
	.byte	W06
	.byte			Dn3, v036
	.byte	W06
	.byte			Bn2, v096
	.byte		N06	, Dn3, v084
	.byte	W06
	.byte			Dn3, v036
	.byte	W06
	.byte			Bn2, v084
	.byte		N06	, Dn3, v080
	.byte	W06
	.byte			Dn3, v036
	.byte	W06
	.byte			Bn2, v080
	.byte		N06	, Dn3, v088
	.byte	W06
	.byte			Dn3, v036
	.byte	W06
	.byte			Bn2, v084
	.byte		N06	, Dn3, v096
	.byte	W06
	.byte			Dn3, v036
	.byte	W06
	.byte			Cn3, v092
	.byte		N06	, En3, v084
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Cn3, v080
	.byte		N06	, En3, v088
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Cn3, v092
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Cn3, v080
	.byte		N06	, En3, v084
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Cn3, v080
	.byte		N06	, En3, v084
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Cn3, v084
	.byte		N06	, En3, v088
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Cn3, v084
	.byte		N06	, En3, v088
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Cn3, v084
	.byte		N06	, Fs3, v092
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Dn3, v080
	.byte		N06	, Fs3, v096
	.byte	W06
	.byte			Fs3, v036
	.byte	W06
	.byte			Dn3, v084
	.byte		N06	, Fs3, v104
	.byte	W06
	.byte			Fs3, v036
	.byte	W06
	.byte			Dn3, v092
	.byte		N06	, Fs3, v108
	.byte	W06
	.byte			Fs3, v036
	.byte	W06
	.byte			Dn3, v088
	.byte		N06	, Fs3, v100
	.byte	W06
	.byte			Fs3, v036
	.byte	W06
	.byte			Ds3, v096
	.byte		N06	, An3
	.byte	W06
	.byte			An3, v036
	.byte	W06
	.byte			Ds3, v100
	.byte		N06	, An3, v088
	.byte	W06
	.byte			An3, v036
	.byte	W06
	.byte			Ds3, v116
	.byte		N06	, An3, v096
	.byte	W06
	.byte			An3, v036
	.byte	W06
	.byte			Ds3, v120
	.byte		N06	, An3, v112
	.byte	W06
	.byte			An3, v036
	.byte	W05
	.byte	VOL	, v044
	.byte	W01
	.byte	VOICE	, 65
	.byte	VOL	, v049
	.byte	PAN	, c_v-24
	.byte		N30	, Bn3, v080
	.byte	W30
	.byte		N06	, Bn3, v036
	.byte	W10
	.byte		N04	, Gn3, v080
	.byte	W04
	.byte			Gn3, v036
	.byte	W04
	.byte		N18	, Fs3, v080
	.byte	W18
	.byte		N06	, Fs3, v036
	.byte	W06
	.byte		N18	, Gn3, v080
	.byte	W18
	.byte		N06	, Gn3, v036
	.byte	W06
	.byte		N04	, Bn2, v080
	.byte	W04
	.byte			Bn2, v036
	.byte	W04
	.byte			Dn3, v080
	.byte	W04
	.byte			Dn3, v036
	.byte	W04
	.byte			En3, v080
	.byte	W04
	.byte			En3, v036
	.byte	W04
	.byte		N48	, Dn3, v080
	.byte	W48
	.byte		N06	, Dn3, v036
	.byte	W24
	.byte		N30	, Gs3, v080
	.byte	W30
	.byte		N06	, Gs3, v036
	.byte	W10
	.byte		N04	, En3, v080
	.byte	W04
	.byte			En3, v036
	.byte	W04
	.byte		N18	, Ds3, v080
	.byte	W18
	.byte		N06	, Ds3, v036
	.byte	W06
	.byte		N18	, En3, v080
	.byte	W18
	.byte		N06	, En3, v036
	.byte	W06
	.byte		N04	, Gs3, v080
	.byte	W04
	.byte			Gs3, v036
	.byte	W04
	.byte			Bn3, v080
	.byte	W04
	.byte			Bn3, v036
	.byte	W04
	.byte			Cs4, v080
	.byte	W04
	.byte			Cs4, v036
	.byte	W04
	.byte		N48	, Bn3, v080
	.byte	W48
	.byte		N06	, Bn3, v036
	.byte	W24
	.byte		N04	, Cs4, v080
	.byte	W04
	.byte			Cs4, v036
	.byte	W04
	.byte			Ds4, v080
	.byte	W04
	.byte			Ds4, v036
	.byte	W04
	.byte			En4, v080
	.byte	W04
	.byte			En4, v036
	.byte	W04
	.byte		N48	, Ds4, v080
	.byte	W72
	.byte		N06	, An3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Fs3, v032
	.byte	W06
	.byte			Gs3, v080
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte			En3, v080
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte			Fs3, v080
	.byte	W06
	.byte			Fs3, v032
	.byte	W06
	.byte		N24	, Bn3, v068
	.byte	W36
	.byte		N06	, Bn3, v080
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte			An3, v080
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Fs3, v080
	.byte	W06
	.byte			Fs3, v032
	.byte	W06
	.byte			Gs3, v080
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte		N24	, Ds4, v052
	.byte	W32
	.byte	W03
	.byte	VOL	, v049
	.byte	W01
	.byte	VOICE	, 62
	.byte	VOL	, v044
	.byte	PAN	, c_v-24
	.byte		N06	, Bn2, v104
	.byte	W06
	.byte			Bn2, v060
	.byte	W06
	.byte			Fs2, v104
	.byte	W06
	.byte			Fs2, v060
	.byte	W06
	.byte			Bn2, v104
	.byte	W06
	.byte			Bn2, v060
	.byte	W06
	.byte		N54	, Bn2, v104
	.byte	W54
	.byte		N06	, Bn2, v060
	.byte	W06
	.byte			Bn2, v104
	.byte	W06
	.byte			Bn2, v060
	.byte	W06
	.byte			Gs2, v104
	.byte	W06
	.byte			Gs2, v060
	.byte	W06
	.byte			Bn2, v104
	.byte	W06
	.byte			Bn2, v060
	.byte	W06
	.byte		N48	, Cs3, v104
	.byte	W48
	.byte		N06	, Cs3, v060
	.byte	W12
	.byte			Fs3, v104
	.byte	W06
	.byte			Fs3, v060
	.byte	W06
	.byte			Cs3, v104
	.byte	W06
	.byte			Cs3, v060
	.byte	W06
	.byte			Fs3, v104
	.byte	W06
	.byte			Fs3, v060
	.byte	W06
	.byte		N54	, Fs3, v104
	.byte	W54
	.byte		N06	, Fs3, v060
	.byte	W06
	.byte		N30	, Cs3, v104
	.byte	W30
	.byte		N06	, Cs3, v060
	.byte	W06
	.byte			Fn3, v104
	.byte	W06
	.byte			Fn3, v060
	.byte	W06
	.byte		N36	, Fs3, v104
	.byte	W36
	.byte		N06	, Fs3, v060
	.byte	W12
	.byte			Ds3, v104
	.byte	W06
	.byte			Ds3, v060
	.byte	W06
	.byte			Cs3, v104
	.byte	W06
	.byte			Cs3, v060
	.byte	W06
	.byte			Ds3, v104
	.byte	W06
	.byte			Ds3, v060
	.byte	W06
	.byte		N54	, Fs3, v104
	.byte	W54
	.byte		N06	, Fs3, v060
	.byte	W06
	.byte			Fs3, v104
	.byte	W06
	.byte			Fs3, v060
	.byte	W06
	.byte			Fn3, v104
	.byte	W06
	.byte			Fn3, v060
	.byte	W06
	.byte			Fs3, v104
	.byte	W06
	.byte			Fs3, v060
	.byte	W06
	.byte		N30	, Gs3, v104
	.byte	W30
	.byte		N06	, Gs3, v060
	.byte	W30
	.byte		N28	, As2, v104
	.byte	W36
	.byte		N05	, Fn2, v096
	.byte	W06
	.byte			As2, v100
	.byte	W06
	.byte		N12	, Cs3
	.byte	W24
	.byte		N14	, Fn3
	.byte	W24
	.byte		N30	, Ds3, v104
	.byte	W36
	.byte		N05	, Cn3, v096
	.byte	W12
	.byte		N36	, Gs2, v100
	.byte	W48
	.byte		N42	, Cs3, v104
	.byte	W48
	.byte			Fn3
	.byte	W48
	.byte			Ds3
	.byte	W48
	.byte		N18	, Gs3
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte		N68	, As2
	.byte	W48
	.byte	W03
	.byte	VOL	, v043
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v044
	.byte		N05	, An2
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte	GOTO	
		.word	song011_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song011_4
song011_4:	@ 0x0854FE0B
	.byte	KEYSH	, 0
	.byte	W24
song011_4_4:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 66
	.byte	VOL	, v043
	.byte	PAN	, c_v-34
	.byte	W96
song011_4_1:
	.byte		N30	, Gs2, v127
	.byte	W30
	.byte		N06	, Gs2, v032
	.byte	W06
	.byte			En2, v127
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte		N18	, Bn2
	.byte	W18
	.byte		N06	, Bn2, v032
	.byte	W06
	.byte		N18	, En3, v127
	.byte	W18
	.byte		N06	, En3, v032
	.byte	W06
	.byte	PEND
	.byte		N24	, Dn3, v127
	.byte	W24
	.byte		N06	, Dn3, v032
	.byte	W12
	.byte			An2, v127
	.byte	W06
	.byte			An2, v032
	.byte	W06
	.byte		N36	, Fs2, v127
	.byte	W36
	.byte		N06	, Fs2, v028
	.byte	W12
	.byte	PATT	
		.word	song011_4_1
	.byte		N28	, Fs3, v127
	.byte	W30
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte			Gs3, v127
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte		N18	, Fs3, v127
	.byte	W18
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte		N18	, Dn3, v127
	.byte	W18
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte		N24	, En3, v127
	.byte	W30
	.byte		N06	, En3, v032
	.byte	W06
	.byte			Cn3, v127
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N18	, En3
	.byte	W18
	.byte		N06	, En3, v032
	.byte	W06
	.byte		N18	, Fs3, v127
	.byte	W18
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte		N28	, Dn3, v127
	.byte	W30
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte			En3, v127
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte		N18	, Dn3, v127
	.byte	W18
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte		N18	, Bn2, v127
	.byte	W18
	.byte		N06	, Bn2, v032
	.byte	W06
	.byte		N28	, Cn3, v127
	.byte	W30
	.byte		N06	, Cn3, v024
	.byte	W06
	.byte			Dn3, v127
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte		N18	, En3, v127
	.byte	W18
	.byte		N06	, En3, v032
	.byte	W06
	.byte		N18	, Fs3, v127
	.byte	W18
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte		N24	, Ds3, v127
	.byte	W30
	.byte		N06	, Ds3, v056
	.byte	W06
	.byte			En3, v127
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte		N32	, Fs3, v127
	.byte	W36
	.byte		N06	, Fs3, v028
	.byte	W12
	.byte	VOICE	, 63
	.byte	VOL	, v043
	.byte	PAN	, c_v-9
	.byte	W24
	.byte		N04	, Bn2, v104
	.byte	W24
	.byte		N48	, Gn3, v108
	.byte	W48
	.byte	W24
	.byte		N04	, Dn3, v092
	.byte	W24
	.byte		N48	, Fs3, v108
	.byte	W48
	.byte		N09	, Fs3, v032
	.byte	W24
	.byte		N04	, En3, v104
	.byte	W24
	.byte		N48	, Gn3, v108
	.byte	W48
	.byte		N09	, Gn3, v032
	.byte	W24
	.byte		N16	, Fs3, v104
	.byte	W18
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte		N16	, Dn3, v104
	.byte	W18
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte		N16	, Bn2, v104
	.byte	W18
	.byte		N06	, Bn2, v032
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte	VOICE	, 66
	.byte	VOL	, v043
	.byte	PAN	, c_v-34
	.byte	W24
	.byte		N66	, Bn2, v084
	.byte		N68	, En3, v100
	.byte	W72
	.byte		N18	, Dn3, v084
	.byte		N20	, Fs3, v100
	.byte	W24
	.byte		N42	, En3, v088
	.byte		N44	, Gn3, v100
	.byte	W48
	.byte		N04	, Cs3, v076
	.byte		N04	, En3, v092
	.byte	W08
	.byte			Dn3, v088
	.byte		N04	, Fs3, v100
	.byte	W08
	.byte			En3, v080
	.byte		N04	, Gn3, v096
	.byte	W08
	.byte		N20	, Dn3, v088
	.byte		N20	, Fs3, v112
	.byte	W24
	.byte		N66	, Gs2, v084
	.byte		N68	, Cs3, v104
	.byte	W72
	.byte		N18	, Bn2, v084
	.byte		N20	, Ds3, v104
	.byte	W24
	.byte		N42	, Cs3, v088
	.byte		N44	, En3, v100
	.byte	W48
	.byte		N04	, As2, v076
	.byte		N04	, Cs3, v092
	.byte	W08
	.byte			Bn2, v088
	.byte		N04	, Ds3, v100
	.byte	W08
	.byte			Cs3, v080
	.byte		N04	, En3, v092
	.byte	W08
	.byte		N20	, Bn2, v096
	.byte		N20	, Ds3, v112
	.byte	W24
	.byte		N42	, Bn2, v084
	.byte		N44	, En3, v100
	.byte	W48
	.byte		N04	, Bn2, v084
	.byte		N04	, En3, v100
	.byte	W08
	.byte			Ds3, v076
	.byte		N04	, Fs3, v092
	.byte	W08
	.byte			En3, v096
	.byte		N04	, Gs3, v112
	.byte	W08
	.byte		N19	, Ds3, v088
	.byte		N19	, Fs3, v108
	.byte	W24
	.byte		N44	, En2, v084
	.byte		N44	, Cs3
	.byte	W48
	.byte			Fs2
	.byte		N44	, En3
	.byte	W48
	.byte			Fs2
	.byte		N44	, Ds3
	.byte	W48
	.byte		N21	, Bn2
	.byte		N21	, Fs3
	.byte	W24
	.byte			Bn2
	.byte		N21	, En3
	.byte	W24
	.byte	VOICE	, 61
	.byte	VOL	, v032
	.byte	PAN	, c_v-19
	.byte		N04	, Ds3, v104
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Ds3, v104
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Ds3, v104
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Ds3, v104
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
song011_4_3:
	.byte		N04	, Ds3, v104
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Ds3, v104
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Ds3, v104
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Ds3, v104
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte	PEND
song011_4_2:
	.byte		N04	, Cs3, v104
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Cs3, v028
	.byte	W18
	.byte			Cs3, v104
	.byte	W06
	.byte			Cs3, v028
	.byte	W18
	.byte			Cs3, v104
	.byte	W06
	.byte			Cs3, v028
	.byte	W18
	.byte			Cs3, v104
	.byte	W06
	.byte			Cs3, v028
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song011_4_2
	.byte	PATT	
		.word	song011_4_3
	.byte	PATT	
		.word	song011_4_3
	.byte	PATT	
		.word	song011_4_2
	.byte	PATT	
		.word	song011_4_3
	.byte	PATT	
		.word	song011_4_2
	.byte	PATT	
		.word	song011_4_3
	.byte		N78	, Fn3, v104
	.byte	W42
	.byte	VOL	, v031
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W40
	.byte	GOTO	
		.word	song011_4_4
	.byte	FINE

	@********************** Track  5 **********************@

	.global song011_5
song011_5:	@ 0x08550066
	.byte	KEYSH	, 0
	.byte	W24
song011_5_1:
	.byte	VOICE	, 65
	.byte	VOL	, v034
	.byte	PAN	, c_v-29
	.byte		N32	, Bn2, v052
	.byte		N32	, En3, v064
	.byte	W36
	.byte		N06	, Bn2, v052
	.byte		N06	, En3, v060
	.byte	W06
	.byte			Dn3, v056
	.byte		N06	, Fs3, v064
	.byte	W06
	.byte			En3, v056
	.byte		N06	, Gs3, v068
	.byte	W12
	.byte			En3, v052
	.byte		N06	, Gs3, v064
	.byte	W36
	.byte		N32	, Dn3, v052
	.byte		N32	, Fs3, v064
	.byte	W36
	.byte		N06	, Dn3, v052
	.byte		N06	, Fs3, v060
	.byte	W06
	.byte			En3, v056
	.byte		N06	, Gs3, v064
	.byte	W06
	.byte			Fs3, v056
	.byte		N06	, An3, v068
	.byte	W12
	.byte			Fs3, v052
	.byte		N06	, An3, v064
	.byte	W24
	.byte			Fs3, v052
	.byte		N06	, An3, v064
	.byte	W12
	.byte		N32	, En3, v052
	.byte		N32	, Gs3, v064
	.byte	W36
	.byte		N06	, Bn2, v052
	.byte		N06	, En3, v060
	.byte	W06
	.byte			Dn3, v056
	.byte		N06	, Fs3, v064
	.byte	W06
	.byte			En3, v056
	.byte		N06	, Gs3, v068
	.byte	W12
	.byte			En3, v052
	.byte		N06	, Gs3, v064
	.byte	W36
	.byte		N32	, Dn3, v052
	.byte		N32	, Fs3, v064
	.byte	W36
	.byte		N06	, As2, v052
	.byte		N06	, Dn3, v060
	.byte	W06
	.byte			Cn3, v056
	.byte		N06	, En3, v064
	.byte	W06
	.byte			Dn3, v056
	.byte		N06	, Fs3, v068
	.byte	W12
	.byte			Dn3, v052
	.byte		N06	, Fs3, v064
	.byte	W24
	.byte			Dn3, v052
	.byte		N06	, Fs3, v064
	.byte	W12
	.byte		N32	, En3, v052
	.byte		N32	, Gn3, v064
	.byte	W36
	.byte		N06	, Cn3, v052
	.byte		N06	, En3, v060
	.byte	W06
	.byte			Dn3, v056
	.byte		N06	, Fs3, v064
	.byte	W06
	.byte			En3, v056
	.byte		N06	, Gn3, v068
	.byte	W12
	.byte			En3, v052
	.byte		N06	, Gn3, v064
	.byte	W36
	.byte		N32	, Dn3, v052
	.byte		N32	, Fs3, v064
	.byte	W36
	.byte		N06	, Bn2, v052
	.byte		N06	, Dn3, v060
	.byte	W06
	.byte			Cn3, v056
	.byte		N06	, En3, v064
	.byte	W06
	.byte			Dn3, v056
	.byte		N06	, Fs3, v068
	.byte	W12
	.byte			Dn3, v052
	.byte		N06	, Fs3, v064
	.byte	W36
	.byte		N32	, En3, v052
	.byte		N32	, Gn3, v064
	.byte	W36
	.byte		N06	, Cn3, v052
	.byte		N06	, En3, v060
	.byte	W06
	.byte			Dn3, v056
	.byte		N06	, Fs3, v064
	.byte	W06
	.byte			En3, v056
	.byte		N06	, Gn3, v068
	.byte	W12
	.byte			En3, v052
	.byte		N06	, Gn3, v064
	.byte	W24
	.byte			En3, v052
	.byte		N06	, Gn3, v064
	.byte	W12
	.byte		N17	, Ds3, v072
	.byte		N17	, Fs3, v092
	.byte	W36
	.byte		N04	, En3, v060
	.byte		N04	, Gn3, v080
	.byte	W12
	.byte		N17	, Fs3, v072
	.byte		N17	, An3, v092
	.byte	W24
	.byte		N22	, Ds3, v076
	.byte		N22	, Fs3, v096
	.byte	W24
	.byte	W24
	.byte		N76	, En3, v080
	.byte	W60
	.byte		N06	, Dn3, v068
	.byte	W06
	.byte		N07	, Cs3, v084
	.byte	W06
	.byte		N54	, Bn2, v076
	.byte	W60
	.byte		N04	, Bn2, v100
	.byte	W12
	.byte		N05	, Cs3, v076
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N90	, En3
	.byte	W96
	.byte		N32	, Dn3, v092
	.byte	W36
	.byte		N05	, Dn3, v084
	.byte	W06
	.byte			En3
	.byte	W06
	.byte		N42	, Fs3, v080
	.byte	W48
	.byte		N92	, En3
	.byte	W96
	.byte		N17	, Fs3, v088
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte			Bn2
	.byte	W24
	.byte		N14	, Dn3
	.byte	W24
	.byte		N90	, En3, v076
	.byte	W96
	.byte		N20	, Bn2, v072
	.byte	W36
	.byte		N05	, Bn2, v088
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte		N32	, Ds3
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
	.byte	VOICE	, 52
	.byte	VOL	, v043
	.byte	PAN	, c_v
	.byte	W96
	.byte	VOL	, v043
	.byte		N80	, Bn2, v127
	.byte	W84
	.byte	W01
	.byte		N04	, Bn2, v116
	.byte	W11
	.byte		N78	
	.byte	W84
	.byte		N04	
	.byte	W12
	.byte		N80	, Fs2, v120
	.byte	W84
	.byte		N04	
	.byte	W12
	.byte		N56	, Fs2, v127
	.byte	W60
	.byte		N04	
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte		N80	, Gs2, v120
	.byte	W84
	.byte		N03	, Gs2, v116
	.byte	W12
	.byte		N80	
	.byte	W84
	.byte		N04	, Gs2, v112
	.byte	W12
	.byte		N44	, As2, v116
	.byte	W48
	.byte		N32	
	.byte	W36
	.byte		N03	
	.byte	W12
	.byte		N44	, Gs2
	.byte	W48
	.byte		N32	, Ds2
	.byte	W36
	.byte		N03	, Gs2
	.byte	W12
	.byte		N44	, As2
	.byte	W48
	.byte		N32	, Fn2
	.byte	W36
	.byte		N03	, As2
	.byte	W12
	.byte		N32	, Gs2
	.byte	W36
	.byte		N03	, As2
	.byte	W12
	.byte		N21	, Cn3
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte		N68	, Cs3
	.byte	W17
	.byte	VOL	, v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W40
	.byte	W01
	.byte	GOTO	
		.word	song011_5_1
	.byte	FINE

	@********************** Track  6 **********************@

	.global song011_6
song011_6:	@ 0x08550288
	.byte	KEYSH	, 0
	.byte	W24
song011_6_4:
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
	.byte	VOICE	, 49
	.byte	VOL	, v032
	.byte	PAN	, c_v-37
	.byte		N04	, Fs3, v104
	.byte	W06
	.byte			Fs3, v028
	.byte	W06
	.byte		N06	, Fs3, v104
	.byte	W06
	.byte			Fs3, v028
	.byte	W18
	.byte			Fs3, v104
	.byte	W06
	.byte			Fs3, v028
	.byte	W18
	.byte			Fs3, v104
	.byte	W06
	.byte			Fs3, v028
	.byte	W18
	.byte			Fs3, v104
	.byte	W06
	.byte			Fs3, v028
	.byte	W06
song011_6_2:
	.byte		N04	, Gs3, v104
	.byte	W06
	.byte			Gs3, v028
	.byte	W06
	.byte		N06	, Gs3, v104
	.byte	W06
	.byte			Gs3, v028
	.byte	W18
	.byte			Gs3, v104
	.byte	W06
	.byte			Gs3, v028
	.byte	W18
	.byte			Gs3, v104
	.byte	W06
	.byte			Gs3, v028
	.byte	W18
	.byte			Gs3, v104
	.byte	W06
	.byte			Gs3, v028
	.byte	W06
	.byte	PEND
song011_6_1:
	.byte		N04	, Fs3, v104
	.byte	W06
	.byte			Fs3, v028
	.byte	W06
	.byte		N06	, Fs3, v104
	.byte	W06
	.byte			Fs3, v028
	.byte	W18
	.byte			Fs3, v104
	.byte	W06
	.byte			Fs3, v028
	.byte	W18
	.byte			Fs3, v104
	.byte	W06
	.byte			Fs3, v028
	.byte	W18
	.byte			Fs3, v104
	.byte	W06
	.byte			Fs3, v028
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song011_6_1
	.byte	PATT	
		.word	song011_6_2
	.byte	PATT	
		.word	song011_6_2
song011_6_3:
	.byte		N04	, Fn3, v104
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte		N06	, Fn3, v104
	.byte	W06
	.byte			Fn3, v028
	.byte	W18
	.byte			Fn3, v104
	.byte	W06
	.byte			Fn3, v028
	.byte	W18
	.byte			Fn3, v104
	.byte	W06
	.byte			Fn3, v028
	.byte	W18
	.byte			Fn3, v104
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song011_6_2
	.byte	PATT	
		.word	song011_6_3
	.byte	PATT	
		.word	song011_6_2
	.byte		N78	, Fn3, v112
	.byte	W60
	.byte	VOL	, v032
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W19
	.byte	GOTO	
		.word	song011_6_4
	.byte	FINE

	@********************** Track  7 **********************@

	.global song011_7
song011_7:	@ 0x08550380
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v050
	.byte	PAN	, c_v
	.byte		N23	, Ds1, v056
	.byte	W24
song011_7_2:
	.byte		N06	, Dn1, v108
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte			Dn1, v096
	.byte	W12
	.byte			Dn1, v108
	.byte	W36
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v104
	.byte	W24
	.byte		N11	, Ds1, v080
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W12
	.byte			Dn1, v104
	.byte	W24
	.byte		N06	
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v108
	.byte	W12
	.byte			Dn1, v088
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Dn1, v088
	.byte	W12
	.byte			Dn1, v104
	.byte	W12
	.byte			Dn1, v092
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N23	, Ds1, v088
	.byte	W24
	.byte		N06	, Dn1, v096
	.byte	W12
	.byte			Dn1, v104
	.byte	W24
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v088
	.byte	W12
	.byte			Dn1, v092
	.byte	W24
	.byte			Dn1, v084
	.byte	W06
	.byte			Dn1, v088
	.byte	W06
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v088
	.byte	W24
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v088
	.byte	W12
	.byte			Dn1, v084
	.byte	W24
	.byte		N11	, Ds1
	.byte	W12
	.byte		N06	, Dn1, v088
	.byte	W12
	.byte			Dn1, v092
	.byte	W36
	.byte			Dn1, v088
	.byte	W12
	.byte			Dn1, v096
	.byte	W12
	.byte			Dn1, v088
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v096
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N23	, Ds1, v088
	.byte	W24
	.byte		N06	, Dn1
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v096
	.byte	W36
	.byte			Dn1, v084
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v088
	.byte	W36
	.byte			Dn1, v092
	.byte	W36
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v088
	.byte	W24
	.byte		N11	, Ds1
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W36
	.byte			Dn1, v088
	.byte	W12
	.byte			Dn1, v104
	.byte	W12
	.byte			Dn1, v096
	.byte	W36
	.byte			Dn1, v108
	.byte	W36
	.byte			Dn1, v088
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v096
	.byte	W12
	.byte			Dn1, v088
	.byte	W12
	.byte		N11	, Ds1
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte			Dn1, v088
	.byte	W36
	.byte			Dn1, v084
	.byte	W36
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v080
	.byte	W24
	.byte			Dn1, v088
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v096
	.byte	W36
	.byte			Dn1, v084
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v088
	.byte	W24
	.byte			Dn1, v092
	.byte	W06
	.byte			Dn1, v080
	.byte	W06
	.byte			Dn1, v084
	.byte	W36
	.byte			Dn1, v088
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N23	, Ds1, v076
	.byte	W24
	.byte		N06	, Dn1, v088
	.byte	W36
	.byte			Bn4, v068
	.byte	W06
	.byte			Bn4, v064
	.byte	W06
	.byte		N24	, Bn4, v072
	.byte	W48
	.byte	W48
	.byte			Bn4, v068
	.byte	W48
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte			Bn4, v064
	.byte	W06
	.byte		N24	, Bn4, v072
	.byte	W48
	.byte	W48
	.byte			Bn4, v068
	.byte	W36
	.byte		N06	, Dn1, v080
	.byte	W12
	.byte			Dn1, v092
	.byte	W48
	.byte			Dn1, v072
	.byte	W36
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v100
	.byte	W24
	.byte			Dn1, v080
	.byte	W48
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v100
	.byte	W36
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v100
	.byte	W24
	.byte			Dn1, v112
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte			Dn1, v084
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v120
	.byte	W12
	.byte			Dn1, v116
	.byte	W12
	.byte		N23	, Ds1, v104
	.byte	W24
	.byte		N12	, As2, v092
	.byte	W12
	.byte		N03	, As2, v048
	.byte	W03
	.byte			As2, v044
	.byte	W03
	.byte			As2, v040
	.byte	W03
	.byte			As2, v036
	.byte	W03
	.byte			As2, v032
	.byte	W03
	.byte			As2, v028
	.byte	W03
	.byte			As2, v024
	.byte	W03
	.byte			As2, v020
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte			As2, v016
	.byte	W03
	.byte			As2, v012
	.byte	W03
	.byte			As2, v008
	.byte	W48
	.byte	W03
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte		N06	, Dn1, v112
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Dn1, v064
	.byte	W06
	.byte			Dn1, v076
	.byte	W24
	.byte			Dn1, v092
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Dn1, v076
	.byte	W06
	.byte		N06	
	.byte	W24
	.byte			Dn1, v112
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v112
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn1, v068
	.byte	W12
	.byte			Dn1, v112
	.byte	W24
	.byte			Dn1, v120
	.byte	W06
	.byte			Dn1, v080
	.byte	W06
	.byte			Dn1, v112
	.byte	W06
	.byte			Dn1, v100
	.byte	W06
	.byte		N40	, Bn4, v080
	.byte	W84
	.byte		N11	
	.byte	W12
	.byte		N30	, Bn4, v084
	.byte	W96
song011_7_1:
	.byte		N36	, Bn4, v084
	.byte	W84
	.byte		N11	, Bn4, v080
	.byte	W12
	.byte	PEND
	.byte		N24	, Bn4, v072
	.byte	W72
	.byte		N05	, Bn4, v088
	.byte	W06
	.byte			Bn4, v072
	.byte	W06
	.byte		N11	
	.byte	W12
	.byte		N32	, Bn4, v088
	.byte	W84
	.byte		N11	, Bn4, v080
	.byte	W12
	.byte		N28	, Bn4, v072
	.byte	W96
	.byte		N36	, Bn4, v084
	.byte	W84
	.byte		N11	
	.byte	W12
	.byte	PATT	
		.word	song011_7_1
	.byte		N40	, Bn4, v084
	.byte	W72
	.byte		N05	, Bn4, v080
	.byte	W06
	.byte			Bn4, v076
	.byte	W06
	.byte		N11	, Bn4, v068
	.byte	W12
	.byte		N32	, Bn4, v072
	.byte	W84
	.byte		N11	
	.byte	W12
	.byte		N06	, Dn1, v108
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn1, v096
	.byte	W12
	.byte			Dn1, v108
	.byte	W12
	.byte		N23	, Ds1, v056
	.byte	W24
	.byte	GOTO	
		.word	song011_7_2
	.byte	FINE

	.align 2
	.global song011
song011:	@ 0x085505A8
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup042		@ voicegroup/tone

	.word	song011_1		@ track
	.word	song011_2		@ track
	.word	song011_3		@ track
	.word	song011_4		@ track
	.word	song011_5		@ track
	.word	song011_6		@ track
	.word	song011_7		@ track
