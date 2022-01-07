	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song052_1
song052_1:	@ 0x0856D0D0
	.byte	KEYSH	, 0
song052_1_1:
	.byte	TEMPO	, 56
	.byte	VOICE	, 62
	.byte	VOL	, v051
	.byte	PAN	, c_v-20
	.byte	W24
	.byte		TIE	, Cs3, v084
	.byte		TIE	, Fn3, v112
	.byte	W72
	.byte	W42
	.byte		EOT	, Cs3
	.byte			Fn3
	.byte	W06
	.byte		N42	, Cn3, v080
	.byte		N42	, Ds3, v108
	.byte	W48
	.byte		TIE	, As2, v084
	.byte		TIE	, Cs3, v112
	.byte	W96
	.byte	W42
	.byte		EOT	, As2
	.byte			Cs3
	.byte	W06
	.byte		N42	, Gs2, v080
	.byte		N42	, Cn3, v108
	.byte	W48
	.byte		TIE	, Fn2, v080
	.byte		TIE	, Gs2, v104
	.byte	W96
	.byte	W72
	.byte		EOT	, Fn2
	.byte			Gs2
	.byte		N06	, Gs2, v032
	.byte	W24
	.byte	W24
	.byte		N66	, Cs3, v084
	.byte		N66	, Fn3, v112
	.byte	W72
	.byte		N90	, Ds3, v084
	.byte		N90	, Gn3, v112
	.byte	W96
	.byte		N66	, Fn3, v084
	.byte		N66	, Gs3, v112
	.byte	W72
	.byte			Cs3, v084
	.byte		N66	, Fn3, v112
	.byte	W24
	.byte	W48
	.byte		N42	, Ds3, v084
	.byte		N42	, Gn3, v112
	.byte	W48
	.byte			Cn3, v080
	.byte		N42	, Ds3, v108
	.byte	W48
	.byte		TIE	, As2, v080
	.byte		TIE	, Cs3, v104
	.byte	W48
	.byte	W84
	.byte		EOT	, As2
	.byte			Cs3
	.byte		N06	, Cs3, v032
	.byte	W12
	.byte			Cn4, v076
	.byte	W06
	.byte			Cn4, v032
	.byte	W06
	.byte			As3, v076
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte		N48	, Fn3, v096
	.byte	W48
	.byte		N06	, Fn3, v032
	.byte	W24
	.byte			Cn3, v112
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			As2, v112
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte		N48	, Fn2
	.byte	W48
	.byte		N06	, Fn2, v032
	.byte	W24
	.byte			Gs3, v076
	.byte		N06	, Cn4, v088
	.byte	W06
	.byte			Fn3
	.byte		N06	, Gs3, v100
	.byte	W06
	.byte			Gn3, v088
	.byte		N06	, As3, v100
	.byte	W06
	.byte			Dn3, v088
	.byte		N06	, Gn3, v100
	.byte	W06
	.byte			Ds3, v088
	.byte		N06	, Gs3, v100
	.byte	W06
	.byte			Cn3, v088
	.byte		N06	, Fn3, v100
	.byte	W06
	.byte			Fn3, v032
	.byte	W12
	.byte		N24	, Fn3, v108
	.byte		N24	, As3, v100
	.byte	W24
	.byte		N06	, As3, v032
	.byte	W24
	.byte		N84	, Fs3, v100
	.byte		N84	, Cs4, v084
	.byte	W84
	.byte		N06	, Cs4, v032
	.byte	W12
	.byte	W48
	.byte		N24	, Fn3, v108
	.byte		N24	, As3, v088
	.byte	W24
	.byte		N06	, As3, v032
	.byte	W24
	.byte		N84	, Cn3, v104
	.byte		N84	, Fn3, v096
	.byte	W84
	.byte		N06	, Fn3, v032
	.byte	W12
	.byte			Ds3, v112
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Gs2, v032
	.byte	W12
	.byte		N24	, Fn3, v100
	.byte		N24	, As3, v088
	.byte	W24
	.byte		N06	, As3, v032
	.byte	W24
	.byte		N90	, Gs3, v088
	.byte		N90	, Ds4, v068
	.byte	W96
	.byte		TIE	, Gn3, v084
	.byte		TIE	, Cn4, v072
	.byte	W96
	.byte	W72
	.byte		EOT	, Gn3
	.byte			Cn4
	.byte		N06	, Cn4, v032
	.byte	W24
	.byte	W48
	.byte		N24	, Fn3, v104
	.byte		N24	, As3, v092
	.byte	W24
	.byte		N06	, As3, v032
	.byte	W24
	.byte		N84	, Gs3, v096
	.byte		N84	, Cs4, v076
	.byte	W84
	.byte		N06	, Cs4, v032
	.byte	W12
	.byte	W48
	.byte		N24	, Gs3, v096
	.byte		N24	, Ds4, v088
	.byte	W24
	.byte		N06	, Ds4, v032
	.byte	W24
	.byte		N84	, Fs3, v092
	.byte		N84	, Cn4, v072
	.byte	W84
	.byte		N06	, Cn4, v032
	.byte	W12
	.byte	W48
	.byte		N24	, Fn3, v096
	.byte		N24	, As3, v088
	.byte	W24
	.byte		N06	, As3, v032
	.byte	W24
	.byte		N84	, Ds3, v108
	.byte		N84	, Gs3, v100
	.byte	W84
	.byte		N06	, Gs3, v032
	.byte	W12
	.byte		TIE	, Cn3, v104
	.byte		TIE	, Fn3, v096
	.byte	W96
	.byte	W68
	.byte	W01
	.byte		EOT	, Cn3
	.byte	W06
	.byte			Fn3
	.byte		N06	, Fn3, v032
	.byte	W21
	.byte	GOTO	
		.word	song052_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song052_2
song052_2:	@ 0x0856D24E
	.byte	KEYSH	, 0
song052_2_2:
	.byte	VOICE	, 34
	.byte	VOL	, v049
	.byte	PAN	, c_v
	.byte		N09	, As1, v127
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
song052_2_1:
	.byte		N09	, As1, v127
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	PATT	
		.word	song052_2_1
	.byte	GOTO	
		.word	song052_2_2
	.byte	FINE

	@********************** Track  3 **********************@

	.global song052_3
song052_3:	@ 0x0856D301
	.byte	KEYSH	, 0
song052_3_6:
	.byte	VOICE	, 59
	.byte	VOL	, v047
	.byte	PAN	, c_v+15
	.byte	W12
	.byte		N05	, As2, v104
	.byte	W06
	.byte			As2, v028
	.byte	W18
	.byte			As2, v104
	.byte	W06
	.byte			As2, v028
	.byte	W18
	.byte			As2, v104
	.byte	W06
	.byte			As2, v028
	.byte	W18
	.byte			As2, v104
	.byte	W06
	.byte			As2, v028
	.byte	W06
song052_3_1:
	.byte	W12
	.byte		N05	, Gs2, v104
	.byte	W06
	.byte			Gs2, v028
	.byte	W18
	.byte			Gs2, v104
	.byte	W06
	.byte			Gs2, v028
	.byte	W18
	.byte			Gs2, v104
	.byte	W06
	.byte			Gs2, v028
	.byte	W18
	.byte			Gs2, v104
	.byte	W06
	.byte			Gs2, v028
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song052_3_1
	.byte	PATT	
		.word	song052_3_1
song052_3_2:
	.byte	W12
	.byte		N05	, As2, v104
	.byte	W06
	.byte			As2, v028
	.byte	W18
	.byte			As2, v104
	.byte	W06
	.byte			As2, v028
	.byte	W18
	.byte			As2, v104
	.byte	W06
	.byte			As2, v028
	.byte	W18
	.byte			As2, v104
	.byte	W06
	.byte			As2, v028
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song052_3_1
	.byte	PATT	
		.word	song052_3_1
	.byte	PATT	
		.word	song052_3_1
	.byte	PATT	
		.word	song052_3_2
	.byte	PATT	
		.word	song052_3_1
	.byte	PATT	
		.word	song052_3_1
	.byte	PATT	
		.word	song052_3_1
	.byte	PATT	
		.word	song052_3_1
	.byte	PATT	
		.word	song052_3_1
song052_3_4:
	.byte	W12
	.byte		N05	, Ds2, v104
	.byte		N05	, As2
	.byte	W06
	.byte			Ds2, v028
	.byte		N05	, As2
	.byte	W18
	.byte			Ds2, v104
	.byte		N05	, As2
	.byte	W06
	.byte			Ds2, v028
	.byte		N05	, As2
	.byte	W18
	.byte			Ds2, v104
	.byte		N05	, As2
	.byte	W06
	.byte			Ds2, v028
	.byte		N05	, As2
	.byte	W18
	.byte			Ds2, v104
	.byte		N05	, As2
	.byte	W06
	.byte			Ds2, v028
	.byte		N05	, As2
	.byte	W06
	.byte	PEND
song052_3_3:
	.byte	W12
	.byte		N05	, Ds2, v104
	.byte		N05	, Gs2
	.byte	W06
	.byte			Ds2, v028
	.byte		N05	, Gs2
	.byte	W18
	.byte			Ds2, v104
	.byte		N05	, Gs2
	.byte	W06
	.byte			Ds2, v028
	.byte		N05	, Gs2
	.byte	W18
	.byte			Ds2, v104
	.byte		N05	, Gs2
	.byte	W06
	.byte			Ds2, v028
	.byte		N05	, Gs2
	.byte	W18
	.byte			Ds2, v104
	.byte		N05	, Gs2
	.byte	W06
	.byte			Ds2, v028
	.byte		N05	, Gs2
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song052_3_3
	.byte	PATT	
		.word	song052_3_3
	.byte	PATT	
		.word	song052_3_4
	.byte	PATT	
		.word	song052_3_3
song052_3_5:
	.byte	W12
	.byte		N05	, Ds2, v104
	.byte		N05	, Gn2
	.byte	W06
	.byte			Ds2, v028
	.byte		N05	, Gn2
	.byte	W18
	.byte			Ds2, v104
	.byte		N05	, Gn2
	.byte	W06
	.byte			Ds2, v028
	.byte		N05	, Gn2
	.byte	W18
	.byte			Ds2, v104
	.byte		N05	, Gn2
	.byte	W06
	.byte			Ds2, v028
	.byte		N05	, Gn2
	.byte	W18
	.byte			Ds2, v104
	.byte		N05	, Gn2
	.byte	W06
	.byte			Ds2, v028
	.byte		N05	, Gn2
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song052_3_5
	.byte	PATT	
		.word	song052_3_4
	.byte	PATT	
		.word	song052_3_3
	.byte	PATT	
		.word	song052_3_3
	.byte	PATT	
		.word	song052_3_3
	.byte	PATT	
		.word	song052_3_4
	.byte	PATT	
		.word	song052_3_3
	.byte	PATT	
		.word	song052_3_3
	.byte	PATT	
		.word	song052_3_3
	.byte	GOTO	
		.word	song052_3_6
	.byte	FINE

	@********************** Track  4 **********************@

	.global song052_4
song052_4:	@ 0x0856D458
	.byte	KEYSH	, 0
song052_4_1:
	.byte	VOICE	, 50
	.byte	VOL	, v044
	.byte	PAN	, c_v+15
	.byte	W24
	.byte		TIE	, As3, v112
	.byte	W72
	.byte	W48
	.byte		EOT	
	.byte		N48	, Cn4
	.byte	W48
	.byte		N72	, Cs4
	.byte	W72
	.byte		N24	, As3
	.byte	W24
	.byte		N48	, Fn4
	.byte	W48
	.byte			Ds4
	.byte	W48
	.byte		N06	, Cn5, v084
	.byte	W06
	.byte			Cn5, v036
	.byte	W06
	.byte			As4, v084
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte		N48	, Fn4, v112
	.byte	W48
	.byte		N06	, Fn4, v060
	.byte	W24
	.byte			Cn4, v112
	.byte	W06
	.byte			Cn4, v060
	.byte	W06
	.byte			As3, v112
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte		N24	, Fn3
	.byte	W24
	.byte		N06	
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Fn4, v096
	.byte	W06
	.byte			Gs4, v092
	.byte	W06
	.byte			As4, v084
	.byte	W06
	.byte			As4, v060
	.byte	W24
	.byte		N72	, As3, v112
	.byte	W72
	.byte		N96	, Cn4
	.byte	W96
	.byte		N72	, Cs4
	.byte	W72
	.byte			Gs3
	.byte	W24
	.byte	W48
	.byte		N48	, As3
	.byte	W48
	.byte		N24	, Cn4
	.byte	W24
	.byte		TIE	, As3
	.byte		TIE	, Ds4
	.byte	W72
	.byte	W84
	.byte		EOT	, As3
	.byte			Ds4
	.byte		N06	, As3, v024
	.byte		N06	, Ds4
	.byte	W12
	.byte			Cn5, v072
	.byte	W06
	.byte			Cn5, v024
	.byte	W06
	.byte			As4, v072
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte		N48	, Fn4, v096
	.byte	W48
	.byte		N06	, Fn4, v060
	.byte	W24
	.byte			Cn4, v112
	.byte	W06
	.byte			Cn4, v064
	.byte	W06
	.byte			As3, v112
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte		N48	, Fn3
	.byte	W48
	.byte		N06	, Fn3, v060
	.byte	W24
	.byte	W48
	.byte	VOICE	, 48
	.byte	VOL	, v037
	.byte		N24	, Cs3, v112
	.byte	W24
	.byte		N06	, Cs3, v060
	.byte	W24
	.byte		N84	, Ds3, v112
	.byte	W84
	.byte		N06	, Ds3, v060
	.byte	W12
	.byte	W48
	.byte		N24	, Ds3, v112
	.byte	W24
	.byte		N06	, Ds3, v060
	.byte	W24
	.byte		N96	, Ds3, v112
	.byte	W96
	.byte		N06	, Ds4, v076
	.byte	W06
	.byte			Cn4, v088
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Gs3, v060
	.byte	W12
	.byte		N24	, Ds3, v112
	.byte	W24
	.byte		N06	, Ds3, v060
	.byte	W24
	.byte		N96	, Fs3, v112
	.byte	W96
	.byte		N06	, As3, v088
	.byte	W06
	.byte			As3, v056
	.byte	W06
	.byte			Gs3, v088
	.byte	W06
	.byte			As3
	.byte	W06
	.byte		N72	, Fn3, v104
	.byte	W72
	.byte		N06	, As2
	.byte	W06
	.byte			As2, v060
	.byte	W06
	.byte			Gs2, v104
	.byte	W06
	.byte			As2
	.byte	W06
	.byte		N72	, Fn2
	.byte	W72
	.byte		N06	, Fn2, v060
	.byte	W48
	.byte		N24	, Ds3, v112
	.byte	W24
	.byte		N06	, Ds3, v060
	.byte	W24
	.byte		N84	, Fs3, v112
	.byte	W84
	.byte		N06	, Fs3, v060
	.byte	W12
	.byte	W48
	.byte		N24	, Fs3, v112
	.byte	W24
	.byte		N06	, Fs3, v060
	.byte	W24
	.byte		N84	, Gs3, v100
	.byte	W84
	.byte		N06	, Gs3, v060
	.byte	W12
	.byte	W48
	.byte		N24	, Ds3, v100
	.byte	W24
	.byte		N06	, Ds3, v060
	.byte	W24
	.byte		N84	, Cs3, v100
	.byte	W84
	.byte		N06	, Cs3, v060
	.byte	W12
	.byte		TIE	, Cn3, v100
	.byte	W96
	.byte	W72
	.byte		EOT	
	.byte	W24
	.byte	GOTO	
		.word	song052_4_1
	.byte	FINE

	@********************** Track  5 **********************@

	.global song052_5
song052_5:	@ 0x0856D595
	.byte	KEYSH	, 0
song052_5_4:
	.byte	VOICE	, 47
	.byte	VOL	, v047
	.byte	PAN	, c_v-16
	.byte		N24	, As2, v127
	.byte	W84
	.byte		N06	, As2, v124
	.byte	W06
	.byte		N06	
	.byte	W06
song052_5_2:
	.byte		N24	, As2, v127
	.byte	W24
	.byte			As2, v124
	.byte	W48
	.byte		N24	
	.byte	W24
	.byte	PEND
song052_5_1:
	.byte		N24	, As2, v127
	.byte	W84
	.byte		N06	, As2, v124
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PEND
song052_5_3:
	.byte		N24	, As2, v127
	.byte	W24
	.byte			As2, v124
	.byte	W72
	.byte	PEND
	.byte	PATT	
		.word	song052_5_1
	.byte	PATT	
		.word	song052_5_2
	.byte	PATT	
		.word	song052_5_1
	.byte	PATT	
		.word	song052_5_3
	.byte	PATT	
		.word	song052_5_1
	.byte	PATT	
		.word	song052_5_2
	.byte	PATT	
		.word	song052_5_1
	.byte	PATT	
		.word	song052_5_3
	.byte	PATT	
		.word	song052_5_1
	.byte	PATT	
		.word	song052_5_2
	.byte	PATT	
		.word	song052_5_1
	.byte	PATT	
		.word	song052_5_3
	.byte	PATT	
		.word	song052_5_1
	.byte	PATT	
		.word	song052_5_2
	.byte	PATT	
		.word	song052_5_1
	.byte	PATT	
		.word	song052_5_3
	.byte	PATT	
		.word	song052_5_1
	.byte	PATT	
		.word	song052_5_2
	.byte	PATT	
		.word	song052_5_1
	.byte	PATT	
		.word	song052_5_3
	.byte	PATT	
		.word	song052_5_1
	.byte	PATT	
		.word	song052_5_2
	.byte	PATT	
		.word	song052_5_1
	.byte	PATT	
		.word	song052_5_3
	.byte	PATT	
		.word	song052_5_1
	.byte	PATT	
		.word	song052_5_3
	.byte	GOTO	
		.word	song052_5_4
	.byte	FINE

	@********************** Track  6 **********************@

	.global song052_6
song052_6:	@ 0x0856D64C
	.byte	KEYSH	, 0
song052_6_2:
	.byte	VOICE	, 127
	.byte	VOL	, v047
	.byte	PAN	, c_v
	.byte		N06	, Cn1, v100
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
song052_6_1:
	.byte		N06	, Cn1, v100
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	PATT	
		.word	song052_6_1
	.byte	W96
	.byte	W72
	.byte		N06	, Cn1, v100
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	GOTO	
		.word	song052_6_2
	.byte	FINE

	.align 2
	.global song052
song052:	@ 0x0856D700
	.byte	6		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup071		@ voicegroup/tone

	.word	song052_1		@ track
	.word	song052_2		@ track
	.word	song052_3		@ track
	.word	song052_4		@ track
	.word	song052_5		@ track
	.word	song052_6		@ track
