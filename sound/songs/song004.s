	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song004_1
song004_1:	@ 0x08548060
	.byte	KEYSH	, 0
	.byte	TEMPO	, 54
	.byte	VOICE	, 69
	.byte	VOL	, v051
	.byte	PAN	, c_v+14
	.byte	W24
	.byte		N23	, Gn2, v088
	.byte		N23	, Dn3, v108
	.byte	W24
	.byte			As2, v088
	.byte		N23	, Fn3, v108
	.byte	W24
	.byte			An2, v088
	.byte		N23	, En3, v108
	.byte	W24
song004_1_1:
	.byte		N12	, Fn2, v088
	.byte		N12	, Cn3, v108
	.byte	W12
	.byte		N06	, Cn3, v044
	.byte	W12
	.byte		N72	, Gn2, v088
	.byte		N72	, Dn3, v108
	.byte	W72
	.byte	PEND
song004_1_2:
	.byte	W24
	.byte		N23	, Gn2, v088
	.byte		N23	, Dn3, v108
	.byte	W24
	.byte			As2, v088
	.byte		N23	, Fn3, v108
	.byte	W24
	.byte			An2, v088
	.byte		N23	, En3, v108
	.byte	W24
	.byte		N12	, As2, v088
	.byte		N12	, Fn3, v108
	.byte	W12
	.byte		N06	, Fn3, v044
	.byte	W12
	.byte		N44	, Cn3, v088
	.byte		N44	, Gn3, v108
	.byte	W48
	.byte			An2, v088
	.byte		N44	, En3, v108
	.byte	W24
	.byte	W24
	.byte			Fn2, v088
	.byte		N44	, Cn3, v108
	.byte	W48
	.byte		TIE	, Gn2, v088
	.byte		TIE	, Dn3, v108
	.byte	W24
	.byte	W90
	.byte		EOT	, Gn2
	.byte			Dn3
	.byte		N06	, Gn2, v028
	.byte		N06	, Dn3, v044
	.byte	W06
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
	.byte	VOICE	, 47
	.byte	VOL	, v051
	.byte	PAN	, c_v-8
	.byte		N24	, Dn3, v116
	.byte	W24
	.byte			Gn2
	.byte	W72
	.byte	W96
	.byte			Dn3
	.byte	W24
	.byte			Gn2
	.byte	W72
	.byte	VOICE	, 69
	.byte	VOL	, v051
	.byte	PAN	, c_v+14
	.byte	W72
	.byte		N23	, Dn2, v108
	.byte	W24
	.byte			An2
	.byte	W24
	.byte		N21	, Gn2
	.byte	W24
	.byte		N23	
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			An2
	.byte	W24
	.byte		N44	, Gn2
	.byte	W48
	.byte			Fn2
	.byte	W24
	.byte	W24
	.byte		N23	, Gn2
	.byte	W24
	.byte			Gs2
	.byte	W24
	.byte			As2
	.byte	W24
	.byte		N92	, Cn3
	.byte	W96
	.byte	VOICE	, 69
	.byte	VOL	, v051
	.byte	PAN	, c_v+14
	.byte	W24
	.byte		N23	, Gn2, v100
	.byte		N23	, Dn3, v116
	.byte	W24
	.byte			As2, v088
	.byte		N23	, Fn3, v108
	.byte	W24
	.byte			An2, v088
	.byte		N23	, En3, v108
	.byte	W24
	.byte	PATT	
		.word	song004_1_1
	.byte	GOTO	
		.word	song004_1_2
	.byte	FINE

	@********************** Track  2 **********************@

	.global song004_2
song004_2:	@ 0x0854813D
	.byte	KEYSH	, 0
	.byte	VOICE	, 33
	.byte	VOL	, v044
	.byte	PAN	, c_v
	.byte		N06	, Gn1, v127
	.byte	W12
	.byte			Gn2
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
song004_2_2:
	.byte		N06	, Gn2, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Gn1
	.byte	W12
	.byte	PEND
song004_2_1:
	.byte		N06	, Gn1, v127
	.byte	W12
	.byte			Gn2
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte	PATT	
		.word	song004_2_1
	.byte	W12
	.byte		N06	, Gn2, v127
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song004_2_1
	.byte	W12
	.byte		N06	, Gn2, v127
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Gn1
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Gn2
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N12	, Fn2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte		N06	, Dn2, v120
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte		N10	, Dn3
	.byte	W24
	.byte		N06	, Dn2
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N12	, Cs3
	.byte	W18
	.byte		N06	
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			An2
	.byte	W06
	.byte			Gn2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Dn2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Gn2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Cs2
	.byte	W12
	.byte			Fs1, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		TIE	, Gn1
	.byte	W96
	.byte	W16
	.byte		EOT	
	.byte	W08
	.byte		N17	, Gn2
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte		TIE	, Dn2
	.byte	W96
	.byte	W22
	.byte		EOT	
	.byte	W02
	.byte		N15	, Dn3
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte		N21	, An1
	.byte	W24
	.byte		N78	, Dn2
	.byte	W84
	.byte		N12	, An1
	.byte	W12
	.byte		N96	, Dn2
	.byte	W96
	.byte			Cs2
	.byte	W96
	.byte		N48	
	.byte	W60
	.byte		N06	, Ds2
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song004_2_1
	.byte	PATT	
		.word	song004_2_2
	.byte	GOTO	
		.word	song004_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song004_3
song004_3:	@ 0x0854823D
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
song004_3_1:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 52
	.byte	VOL	, v044
	.byte	PAN	, c_v
	.byte	W48
	.byte		N05	, Fn3, v116
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte	VOL	, v026
	.byte		TIE	, Gs4, v056
	.byte	W03
	.byte	VOL	, v027
	.byte	W01
	.byte		v027
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W24
	.byte	W03
	.byte	W96
	.byte	W44
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N92	, Fs4, v064
	.byte	W48
	.byte	W48
	.byte		N44	, En4, v076
	.byte	W48
	.byte	W48
	.byte		N23	, Dn4, v080
	.byte	W24
	.byte		N11	, Cs4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte		N44	, En4
	.byte	W48
	.byte			Fs4
	.byte	W48
	.byte		N92	, Cs4, v076
	.byte	W92
	.byte	W03
	.byte	VOL	, v044
	.byte	W01
	.byte	VOICE	, 49
	.byte	VOL	, v040
	.byte	PAN	, c_v-14
	.byte	W13
	.byte	VOL	, v051
	.byte	W11
	.byte		N18	, Cs3, v100
	.byte	W18
	.byte		N06	, Cs3, v052
	.byte	W06
	.byte		N18	, Fs3, v100
	.byte	W18
	.byte		N06	, Fs3, v052
	.byte	W06
	.byte		N18	, Cs4, v100
	.byte	W18
	.byte		N06	, Cs4, v052
	.byte	W06
	.byte		N68	, An3, v088
	.byte		N68	, Cs4, v100
	.byte	W72
	.byte		N23	, Bn3, v088
	.byte		N23	, Dn4, v100
	.byte	W24
	.byte		N54	, Gn3, v088
	.byte		N54	, Bn3, v100
	.byte	W54
	.byte		N06	, Bn3, v052
	.byte	W06
	.byte		N12	, Gn3, v088
	.byte		N12	, Bn3, v100
	.byte	W12
	.byte			An3, v084
	.byte		N12	, Cs4, v092
	.byte	W12
	.byte			Bn3, v080
	.byte		N12	, Dn4, v088
	.byte	W12
	.byte		N84	, Cs4, v072
	.byte		N84	, En4, v088
	.byte	W84
	.byte		N12	, Bn3, v080
	.byte		N12	, Dn4, v092
	.byte	W12
	.byte		N24	, An3, v084
	.byte		N24	, Cs4, v096
	.byte	W24
	.byte		N66	, Fs3, v088
	.byte		N66	, An3, v100
	.byte	W52
	.byte	W01
	.byte	VOL	, v051
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v036
	.byte		N06	, An3, v052
	.byte	W01
	.byte	VOL	, v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W01
	.byte	VOICE	, 52
	.byte	VOL	, v030
	.byte	PAN	, c_v
	.byte		TIE	, Gn4, v068
	.byte	W01
	.byte	VOL	, v031
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
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v036
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
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W48
	.byte	W02
	.byte	W96
	.byte	W96
	.byte	W40
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		EOT	
	.byte	VOL	, v000
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song004_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song004_4
song004_4:	@ 0x08548431
	.byte	KEYSH	, 0
	.byte	VOICE	, 48
	.byte	VOL	, v051
	.byte	PAN	, c_v
	.byte		TIE	, Gn2, v088
	.byte	W96
	.byte	W72
	.byte		EOT	
	.byte		N06	, Gn2, v044
	.byte	W06
	.byte			An2, v096
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			En3
	.byte	W06
song004_4_1:
	.byte		TIE	, Dn3, v088
	.byte	W96
	.byte	W72
	.byte		EOT	
	.byte		N06	, Dn3, v044
	.byte	W06
	.byte			Dn3, v096
	.byte	W06
	.byte			Fn3, v092
	.byte	W06
	.byte			An3, v088
	.byte	W06
	.byte		TIE	, Gn3
	.byte	W96
	.byte	W18
	.byte		EOT	
	.byte		N06	, Gn3, v044
	.byte	W06
	.byte		N24	, Dn3, v068
	.byte		N24	, Gn3, v096
	.byte	W24
	.byte			An3, v064
	.byte		N24	, Dn4, v080
	.byte	W24
	.byte			Cn4, v064
	.byte		N24	, Fn4, v076
	.byte	W24
	.byte			Bn3, v064
	.byte		N24	, En4, v076
	.byte	W24
	.byte		N44	, Gn3, v068
	.byte		N44	, Cn4, v084
	.byte	W48
	.byte			Dn3, v064
	.byte		N44	, Gn3, v092
	.byte	W24
	.byte	W24
	.byte		N48	, Bn2, v060
	.byte		N48	, En3, v096
	.byte	W48
	.byte		N24	, Gn2, v056
	.byte		N24	, Cn3, v084
	.byte	W24
	.byte		N90	, Gn2, v068
	.byte		N90	, Dn3, v096
	.byte	W96
	.byte		N72	, Cs3
	.byte	W72
	.byte		N24	, Bn2, v092
	.byte	W24
	.byte		N12	, Cs3, v096
	.byte	W12
	.byte		N06	, Cs3, v028
	.byte	W12
	.byte		N48	, Dn3, v096
	.byte	W48
	.byte			En3, v100
	.byte	W24
	.byte	W24
	.byte			Fs3, v096
	.byte	W48
	.byte			Gs3
	.byte	W24
	.byte	W24
	.byte		N24	, An3, v104
	.byte	W24
	.byte			Gs3, v096
	.byte	W24
	.byte			En3
	.byte	W24
	.byte		N68	, Gn2, v080
	.byte		N68	, Dn3, v096
	.byte	W72
	.byte		N12	, An2, v080
	.byte		N12	, Cs3, v096
	.byte	W12
	.byte			Bn2, v080
	.byte		N12	, Dn3, v096
	.byte	W12
	.byte		N48	, Cs3, v080
	.byte		N48	, En3, v096
	.byte	W48
	.byte			Dn3, v080
	.byte		N48	, Fs3, v096
	.byte	W48
	.byte		N96	, An2, v080
	.byte		N96	, Cs3, v096
	.byte	W96
	.byte		N48	, Cs3, v088
	.byte		N48	, Fs3, v092
	.byte	W48
	.byte		N48	
	.byte		N48	, Cs4, v096
	.byte	W48
	.byte	VOICE	, 68
	.byte	VOL	, v051
	.byte	PAN	, c_v+15
	.byte	W96
	.byte	W24
	.byte		N24	, Fs4, v104
	.byte	W24
	.byte			En4
	.byte	W24
	.byte			Dn4
	.byte	W24
	.byte		N92	, Cs4
	.byte	W96
	.byte		N96	, En4
	.byte	W68
	.byte	W03
	.byte	VOL	, v049
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
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
	.byte		v008
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v000
	.byte	W01
	.byte	W96
	.byte	W96
	.byte	VOICE	, 48
	.byte	VOL	, v051
	.byte	PAN	, c_v
	.byte		N24	, Gs2, v088
	.byte	W24
	.byte		N48	, Cn3
	.byte	W48
	.byte			Ds3
	.byte	W24
	.byte	W24
	.byte		N24	, Gs2
	.byte		N24	, Gs3
	.byte	W24
	.byte			Cn3
	.byte		N24	, Cn4
	.byte	W24
	.byte			Gs2
	.byte		N24	, Gs3
	.byte	W24
	.byte		TIE	, Gn2
	.byte	W96
	.byte	W72
	.byte		EOT	
	.byte		N06	, Gn2, v044
	.byte	W06
	.byte			An2, v096
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte	GOTO	
		.word	song004_4_1
	.byte	FINE

	@********************** Track  5 **********************@

	.global song004_5
song004_5:	@ 0x0854857B
	.byte	KEYSH	, 0
song004_5_1:
	.byte	VOICE	, 51
	.byte	VOL	, v051
	.byte	PAN	, c_v+21
	.byte	W24
	.byte		N23	, Dn3, v088
	.byte	W24
	.byte			Fn3
	.byte	W24
	.byte			En3
	.byte	W24
	.byte	PEND
song004_5_2:
	.byte		N11	, Cn3, v088
	.byte	W12
	.byte		N05	, Cn3, v032
	.byte	W12
	.byte		N72	, Dn3, v088
	.byte	W72
	.byte	PEND
song004_5_3:
	.byte	W24
	.byte		N23	, Dn3, v088
	.byte	W24
	.byte			Fn3
	.byte	W24
	.byte			En3
	.byte	W24
	.byte		N11	, Fn3
	.byte	W12
	.byte		N05	, Fn3, v032
	.byte	W12
	.byte		N44	, Gn3, v088
	.byte	W48
	.byte			En3
	.byte	W24
	.byte	W24
	.byte			Cn3
	.byte	W48
	.byte		TIE	, Dn3
	.byte	W24
	.byte	W96
	.byte		EOT	
	.byte	W96
	.byte	W96
	.byte	W72
	.byte	VOL	, v025
	.byte	W23
	.byte		v025
	.byte	W01
	.byte		TIE	, Fs2, v096
	.byte		TIE	, Cs3
	.byte		TIE	, En3
	.byte	W04
	.byte	VOL	, v026
	.byte	W03
	.byte		v026
	.byte	W02
	.byte		v026
	.byte	W03
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W03
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W03
	.byte		v028
	.byte	W02
	.byte		v029
	.byte	W03
	.byte		v029
	.byte	W03
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W03
	.byte		v030
	.byte	W02
	.byte		v031
	.byte	W03
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W03
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W03
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W03
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W36
	.byte	W02
	.byte	W54
	.byte	W01
	.byte		v034
	.byte	W04
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		EOT	, Fs2
	.byte			Cs3
	.byte			En3
	.byte	VOL	, v026
	.byte		N96	, Gs2
	.byte		TIE	, Cs3
	.byte	W04
	.byte	VOL	, v027
	.byte	W03
	.byte		v027
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W03
	.byte		v028
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W03
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W03
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W03
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W03
	.byte		v033
	.byte	W02
	.byte		v034
	.byte	W03
	.byte		v034
	.byte	W48
	.byte	W01
	.byte		N96	, Bn2
	.byte	W96
	.byte		EOT	, Cs3
	.byte		N96	, An2
	.byte	W68
	.byte	W01
	.byte	VOL	, v034
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte		N96	, Bn2
	.byte	W01
	.byte	VOL	, v024
	.byte	W01
	.byte		v024
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
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v028
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
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
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
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W68
	.byte	W01
	.byte		N96	, Fs2
	.byte	W96
	.byte			Cs3, v100
	.byte	W96
	.byte	VOICE	, 60
	.byte	VOL	, v040
	.byte	PAN	, c_v-29
	.byte	W24
	.byte		N24	, Bn2, v120
	.byte	W24
	.byte		TIE	
	.byte		N72	, Gn3
	.byte	W48
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte			Fs3
	.byte	W24
	.byte			En3
	.byte	W24
	.byte		EOT	, Bn2
	.byte	W24
	.byte		N24	, An2
	.byte	W24
	.byte		TIE	
	.byte		N72	, Fs3
	.byte	W48
	.byte	W24
	.byte		N24	, Dn3, v104
	.byte	W24
	.byte			Cs3, v108
	.byte	W24
	.byte			Dn3, v100
	.byte	W24
	.byte		EOT	, An2
	.byte		TIE	, As2, v084
	.byte		TIE	, Fn3
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		EOT	, As2
	.byte			Fn3
	.byte		N44	, Cn3
	.byte		N44	, Ds3
	.byte	W48
	.byte		N23	, Gs2
	.byte		N23	, Cn3
	.byte	W24
	.byte			Ds2
	.byte		N23	, Gs2
	.byte	W24
	.byte	PATT	
		.word	song004_5_1
	.byte	PATT	
		.word	song004_5_2
	.byte	GOTO	
		.word	song004_5_3
	.byte	FINE

	@********************** Track  6 **********************@

	.global song004_6
song004_6:	@ 0x0854872B
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
song004_6_1:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 60
	.byte	VOL	, v040
	.byte	PAN	, c_v-29
	.byte	W24
	.byte		N09	, Dn2, v100
	.byte		N09	, Gn2
	.byte	W24
	.byte		TIE	
	.byte		TIE	, Dn3
	.byte	W48
	.byte	W80
	.byte	W01
	.byte		EOT	, Gn2
	.byte			Dn3
	.byte	W15
	.byte	W24
	.byte		N09	, Dn2
	.byte		N09	, Gn2
	.byte		N09	, Cn3
	.byte	W24
	.byte		N32	, Gn2
	.byte		N32	, Dn3
	.byte		N32	, Gn3
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 46
	.byte	VOL	, v051
	.byte	PAN	, c_v+20
	.byte		N05	, Gn2, v127
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Bn2, v060
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Bn2, v016
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Bn3
	.byte	W24
	.byte	W96
	.byte			Fs2, v127
	.byte	W06
	.byte			An2
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			An2, v060
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			An2, v016
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			An3
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song004_6_1
	.byte	FINE

	@********************** Track  7 **********************@

	.global song004_7
song004_7:	@ 0x085487B0
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v051
	.byte	PAN	, c_v
	.byte		N06	, Dn1, v120
	.byte	W36
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W36
song004_7_4:
	.byte		N06	, Dn1, v120
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v116
	.byte	W24
	.byte			Dn1, v112
	.byte	W12
	.byte	PEND
song004_7_5:
	.byte		N06	, Dn1, v108
	.byte	W36
	.byte			Dn1, v112
	.byte	W24
	.byte			Dn1, v104
	.byte	W36
	.byte			Dn1, v112
	.byte	W36
	.byte			Dn1, v108
	.byte	W12
	.byte			Dn1, v104
	.byte	W12
	.byte			Dn1, v112
	.byte	W24
	.byte			Dn1, v100
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn1, v112
	.byte	W36
	.byte		N06	
	.byte	W24
	.byte			Dn1, v108
	.byte	W36
	.byte			Dn1, v120
	.byte	W36
	.byte			Dn1, v116
	.byte	W12
	.byte			Dn1, v112
	.byte	W12
	.byte			Dn1, v108
	.byte	W24
	.byte			Dn1, v112
	.byte	W12
	.byte			Dn1, v116
	.byte	W36
	.byte			Dn1, v108
	.byte	W24
	.byte			Dn1, v112
	.byte	W36
	.byte			Dn1, v116
	.byte	W36
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Dn1, v096
	.byte	W06
	.byte			Dn1, v080
	.byte	W06
	.byte			Dn1, v108
	.byte	W36
	.byte			Dn1, v104
	.byte	W06
	.byte			Dn1, v084
	.byte	W06
	.byte			Dn1, v116
	.byte	W12
	.byte			Dn1, v120
	.byte	W24
	.byte			Dn1, v096
	.byte	W06
	.byte			Dn1, v092
	.byte	W06
song004_7_1:
	.byte		N05	, Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte		N06	, Ds4, v116
	.byte	W06
	.byte			Ds4, v028
	.byte	W06
	.byte	PEND
song004_7_2:
	.byte		N05	, Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte	PEND
	.byte	PATT	
		.word	song004_7_1
	.byte		N05	, Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W18
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W18
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
song004_7_3:
	.byte		N05	, Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Ds4, v124
	.byte	W06
	.byte			Ds4, v028
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song004_7_2
	.byte	PATT	
		.word	song004_7_3
	.byte		N05	, Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v064
	.byte	W06
	.byte			Fs2, v016
	.byte	W12
	.byte		N92	, Fn2, v088
	.byte	W18
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N06	, Dn1, v108
	.byte	W36
	.byte			Dn1, v112
	.byte	W60
	.byte			Dn1, v108
	.byte	W36
	.byte			Dn1, v104
	.byte	W48
	.byte			Dn1, v108
	.byte	W12
	.byte			Dn1, v112
	.byte	W36
	.byte		N06	
	.byte	W36
	.byte			Dn1, v124
	.byte	W12
	.byte			Dn1, v112
	.byte	W12
	.byte			Dn1, v116
	.byte	W72
	.byte		N92	, Fn2, v088
	.byte	W24
	.byte		N06	, Dn1, v120
	.byte	W36
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W36
	.byte	PATT	
		.word	song004_7_4
	.byte	GOTO	
		.word	song004_7_5
	.byte	FINE

	.align 2
	.global song004
song004:	@ 0x085488FC
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song004_1		@ track
	.word	song004_2		@ track
	.word	song004_3		@ track
	.word	song004_4		@ track
	.word	song004_5		@ track
	.word	song004_6		@ track
	.word	song004_7		@ track
