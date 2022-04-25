	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song015_1
song015_1:	@ 0x085532C4
	.byte	KEYSH	, 0
song015_1_3:
	.byte	TEMPO	, 58
	.byte	VOICE	, 48
	.byte	VOL	, v047
	.byte	PAN	, c_v+25
	.byte		N30	, Dn2, v088
	.byte		N30	, Fn2
	.byte	W30
	.byte		N06	, Fn2, v032
	.byte	W06
	.byte			Dn2, v088
	.byte		N06	, Fn2
	.byte	W06
	.byte			En2
	.byte		N06	, Gn2
	.byte	W06
	.byte		N12	, Fn2
	.byte		N12	, An2
	.byte	W12
	.byte		N06	, An2, v032
	.byte	W12
	.byte		N12	, An2, v088
	.byte		N12	, Cn3
	.byte	W12
	.byte		N06	, Cn3, v032
	.byte	W12
	.byte		N90	, An2, v088
	.byte		N90	, En3
	.byte	W90
	.byte		N06	, En3, v032
	.byte	W06
	.byte		N30	, Fn3, v088
	.byte		N30	, An3
	.byte	W30
	.byte		N06	, An3, v032
	.byte	W06
	.byte			En3, v088
	.byte		N06	, Gn3
	.byte	W06
	.byte			Dn3
	.byte		N06	, Fn3
	.byte	W06
	.byte		N12	, Cn3
	.byte		N12	, En3
	.byte	W12
	.byte		N06	, En3, v032
	.byte	W12
	.byte		N12	, Bn2, v088
	.byte		N12	, Dn3
	.byte	W12
	.byte		N06	, Dn3, v032
	.byte	W12
	.byte		N90	, Cs3, v088
	.byte		N90	, En3
	.byte	W90
	.byte		N06	, En3, v032
	.byte	W06
song015_1_1:
	.byte	W12
	.byte		N06	, Fn2, v060
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v020
	.byte	W18
	.byte			Fn2, v060
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v020
	.byte	W18
	.byte			Fn2, v060
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v020
	.byte	W18
	.byte			Fn2, v060
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v020
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song015_1_1
	.byte	PATT	
		.word	song015_1_1
	.byte	W12
	.byte		N06	, Fn2, v060
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v020
	.byte	W18
	.byte			Fn2, v060
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v020
	.byte	W18
	.byte			Fn2, v060
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v020
	.byte	W06
	.byte			Fn2, v060
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v020
	.byte	W06
	.byte			Fn2, v060
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v020
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N32	, Fn2, v116
	.byte		N32	, An2, v120
	.byte	W36
	.byte		N05	, An2, v096
	.byte	W06
	.byte			As2, v116
	.byte	W06
	.byte		N44	, An2, v108
	.byte		N44	, Cn3
	.byte	W48
	.byte		N32	, Gn2, v116
	.byte		N32	, Bn2
	.byte	W36
	.byte		N05	, Bn2, v096
	.byte	W06
	.byte			Cn3, v108
	.byte	W06
	.byte		N44	, Bn2, v120
	.byte		N44	, Dn3
	.byte	W48
	.byte			Gn2
	.byte		N44	, Cn3, v112
	.byte	W48
	.byte		N23	, En2
	.byte		N23	, Gn2, v120
	.byte	W24
	.byte			Gn2, v112
	.byte		N23	, Cn3, v120
	.byte	W24
	.byte		N32	, Bn2, v124
	.byte		N32	, Dn3, v116
	.byte	W36
	.byte		N05	, Bn2, v080
	.byte		N05	, Dn3
	.byte	W06
	.byte			Cn3, v084
	.byte		N05	, En3, v104
	.byte	W06
	.byte		N11	, Dn3, v092
	.byte		N11	, Fn3, v104
	.byte	W12
	.byte		N06	, Fn3, v032
	.byte	W12
	.byte		N11	, Bn2, v080
	.byte		N11	, Dn3, v116
	.byte	W12
	.byte		N06	, Dn3, v032
	.byte	W12
	.byte		N40	, Cn3, v116
	.byte		N40	, En3, v127
	.byte	W42
	.byte		N06	, En3, v032
	.byte	W54
	.byte	W96
	.byte		N32	, Cn3, v104
	.byte	W36
	.byte		N05	
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N20	, En3
	.byte	W24
	.byte			Fn3
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte			En3
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte			Cn4
	.byte	W24
song015_1_2:
	.byte		N68	, As2, v072
	.byte	W72
	.byte		N24	
	.byte	W24
	.byte	PEND
	.byte			An2
	.byte	W24
	.byte			Fn2
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte			An2
	.byte	W24
	.byte	PATT	
		.word	song015_1_2
	.byte		N24	, As2, v072
	.byte	W24
	.byte			Fn2
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte			An2
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W24
	.byte			As2, v104
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte		N96	, Fn3
	.byte	W96
	.byte	GOTO	
		.word	song015_1_3
	.byte	FINE

	@********************** Track  2 **********************@

	.global song015_2
song015_2:	@ 0x0855343E
	.byte	KEYSH	, 0
song015_2_6:
	.byte	VOICE	, 33
	.byte	VOL	, v045
	.byte	PAN	, c_v
	.byte		N30	, Fn2, v127
	.byte	W36
	.byte		N03	
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		N21	
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte		N60	, An2
	.byte	W96
	.byte		N30	, Fn2
	.byte	W36
	.byte		N09	
	.byte	W12
	.byte		N21	
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte		N60	, An2
	.byte	W96
song015_2_1:
	.byte		N06	, Fn2, v127
	.byte	W12
	.byte		N18	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song015_2_1
	.byte	PATT	
		.word	song015_2_1
	.byte		N06	, Fn2, v127
	.byte	W12
	.byte		N18	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N06	, Ds2
	.byte	W12
	.byte		TIE	, Cs2
	.byte	W96
	.byte	W48
	.byte		EOT	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N68	, Ds2
	.byte	W72
	.byte		N21	, As1
	.byte	W24
	.byte		N42	, Ds2
	.byte	W48
	.byte		N09	
	.byte	W12
	.byte			As1
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte			As1
	.byte	W12
song015_2_2:
	.byte		N06	, Cn2, v127
	.byte	W12
	.byte		N18	
	.byte	W24
	.byte		N03	
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N17	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PEND
song015_2_3:
	.byte		N06	, Cn2, v127
	.byte	W12
	.byte		N16	
	.byte	W24
	.byte		N03	
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N15	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PEND
song015_2_4:
	.byte		N06	, Cn2, v127
	.byte	W12
	.byte		N16	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N16	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte		N06	
	.byte	W12
	.byte		N15	
	.byte	W24
	.byte		N03	
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song015_2_2
	.byte	PATT	
		.word	song015_2_3
	.byte	PATT	
		.word	song015_2_4
	.byte		N06	, Cn2, v127
	.byte	W12
	.byte		N15	
	.byte	W24
	.byte		N03	
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn2
	.byte	W12
song015_2_5:
	.byte		N66	, Ds2, v127
	.byte	W72
	.byte		N18	
	.byte	W24
	.byte	PEND
	.byte		N90	, Fn2
	.byte	W96
	.byte	PATT	
		.word	song015_2_5
	.byte		N90	, Fn2, v127
	.byte	W96
	.byte		N06	, Ds2
	.byte	W12
	.byte		N18	
	.byte	W24
	.byte		N03	
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N17	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N16	
	.byte	W24
	.byte		N03	
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N15	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song015_2_4
	.byte		N06	, Dn2, v127
	.byte	W12
	.byte		N15	
	.byte	W24
	.byte		N03	
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song015_2_4
	.byte		N06	, Dn2, v127
	.byte	W12
	.byte		N15	
	.byte	W24
	.byte		N03	
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			En2
	.byte	W12
	.byte	GOTO	
		.word	song015_2_6
	.byte	FINE

	@********************** Track  3 **********************@

	.global song015_3
song015_3:	@ 0x08553568
	.byte	KEYSH	, 0
song015_3_2:
	.byte	W48
	.byte	VOICE	, 61
	.byte	W24
	.byte	VOL	, v047
	.byte	W12
	.byte	PAN	, c_v+20
	.byte	W12
	.byte		N30	, An2, v100
	.byte	W36
	.byte		N06	, Bn2
	.byte	W12
	.byte		N21	, Cn3
	.byte	W24
	.byte			En3
	.byte	W24
	.byte		N06	, Dn3
	.byte	W12
	.byte			Bn2
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N72	, Cn3
	.byte	W72
	.byte	VOICE	, 53
	.byte	VOL	, v047
	.byte	PAN	, c_v-14
	.byte		N30	, En4, v116
	.byte	W36
	.byte		N06	, Dn4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte		N12	, Bn3
	.byte	W12
	.byte		N06	, Bn3, v060
	.byte	W12
	.byte		N12	, Cs4, v116
	.byte	W12
	.byte		N06	, Cs4, v060
	.byte	W12
	.byte	W96
	.byte	W96
	.byte		N36	, An3, v120
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte			As3
	.byte	W06
	.byte		N32	, Cn4
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte		N48	, Ds4
	.byte	W48
	.byte		N24	, Fn4
	.byte	W24
	.byte			Gn4
	.byte	W24
	.byte			Fn4
	.byte	W24
	.byte	W03
	.byte		N06	, Fn4, v032
	.byte	W09
	.byte			Fn4, v120
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	
	.byte	W12
	.byte		N06	, Fn4, v032
	.byte	W12
	.byte		N12	, Gn4, v120
	.byte	W12
	.byte		N06	, Gn4, v032
	.byte	W12
	.byte		N84	, Gs4, v120
	.byte	W84
	.byte		N06	, Gs4, v032
	.byte	W12
	.byte		N24	, Fn4, v120
	.byte	W24
	.byte	W03
	.byte		N06	, Fn4, v032
	.byte	W09
	.byte			Fn4, v120
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N18	
	.byte	W18
	.byte		N06	, Fn4, v032
	.byte	W06
	.byte		N24	, Gn4, v120
	.byte	W24
	.byte			Gs4
	.byte	W24
	.byte			Gn4
	.byte	W24
	.byte			Ds4
	.byte	W24
	.byte			As3
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song015_3_1:
	.byte	VOICE	, 49
	.byte	W24
	.byte	VOL	, v047
	.byte	W24
	.byte	PAN	, c_v-12
	.byte	W48
	.byte	PEND
	.byte		N48	, Gn3, v116
	.byte	W48
	.byte		N24	, Dn4, v096
	.byte	W24
	.byte			Cn4, v104
	.byte	W24
	.byte		N48	, As3, v116
	.byte	W48
	.byte			An3
	.byte	W48
	.byte	VOICE	, 53
	.byte	VOL	, v047
	.byte	PAN	, c_v-14
	.byte		N05	, Ds4, v127
	.byte	W06
	.byte			Ds4, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Gn3, v127
	.byte	W06
	.byte			Gn3, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Ds4, v127
	.byte	W06
	.byte			Ds4, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Gn3, v127
	.byte	W06
	.byte			Gn3, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Fn4, v127
	.byte	W06
	.byte			Fn4, v044
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v044
	.byte	W06
	.byte			An3, v127
	.byte	W06
	.byte			An3, v044
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v044
	.byte	W06
	.byte			Fn4, v127
	.byte	W06
	.byte			Fn4, v044
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v044
	.byte	W06
	.byte			An3, v127
	.byte	W06
	.byte			An3, v044
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v044
	.byte	W06
	.byte			Ds4, v127
	.byte	W06
	.byte			Ds4, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Gn3, v127
	.byte	W06
	.byte			Gn3, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Ds4, v127
	.byte	W06
	.byte			Ds4, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Gn3, v127
	.byte	W06
	.byte			Gn3, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Fn4, v127
	.byte	W06
	.byte			Fn4, v044
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v044
	.byte	W06
	.byte			An3, v127
	.byte	W06
	.byte			An3, v044
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v044
	.byte	W06
	.byte			Fn4, v127
	.byte	W06
	.byte			Fn4, v044
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v044
	.byte	W06
	.byte			An3, v127
	.byte	W06
	.byte			An3, v044
	.byte	W06
	.byte			Fn3, v127
	.byte	W06
	.byte			Fn3, v044
	.byte	W06
	.byte	PATT	
		.word	song015_3_1
	.byte	W24
	.byte		N24	, Cn3, v104
	.byte	W24
	.byte			An3
	.byte	W24
	.byte			Cn4
	.byte	W24
	.byte	GOTO	
		.word	song015_3_2
	.byte	FINE

	@********************** Track  4 **********************@

	.global song015_4
song015_4:	@ 0x08553702
	.byte	KEYSH	, 0
song015_4_2:
	.byte	VOICE	, 49
	.byte	VOL	, v047
	.byte	PAN	, c_v-12
	.byte		TIE	, An3, v052
	.byte	W96
	.byte	W72
	.byte		EOT	
	.byte		N06	
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte		N96	, Fn4
	.byte	W96
	.byte		N90	, En4
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 58
	.byte	VOL	, v047
	.byte	PAN	, c_v-4
	.byte	W96
	.byte		TIE	, Gs2, v084
	.byte		TIE	, Cs3
	.byte	W96
	.byte	W20
	.byte		EOT	, Gs2
	.byte			Cs3
	.byte	W04
	.byte		N17	, Gs2
	.byte		N17	, Cs3
	.byte	W18
	.byte		N06	, Cs3, v032
	.byte	W06
	.byte		N17	, Cs3, v084
	.byte		N17	, Fn3
	.byte	W18
	.byte		N06	, Fn3, v032
	.byte	W06
	.byte		N17	, Fn3, v084
	.byte		N17	, Gs3
	.byte	W18
	.byte		N06	, Gs3, v032
	.byte	W06
	.byte		N68	, As2, v084
	.byte		N68	, Ds3
	.byte	W72
	.byte		N20	, Fn2
	.byte		N20	, As2
	.byte	W24
	.byte		N20	
	.byte		N20	, Ds3
	.byte	W24
	.byte		N17	
	.byte		N20	, Gn3
	.byte	W24
	.byte		N17	, As2
	.byte		N20	, Fn3
	.byte	W24
	.byte		N17	, Gn2
	.byte		N20	, Ds3
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N32	, Cn3, v096
	.byte		N32	, En3, v120
	.byte	W36
	.byte		N05	, An2, v092
	.byte		N05	, Cn3, v116
	.byte	W06
	.byte			Bn2, v092
	.byte		N05	, Dn3, v116
	.byte	W06
	.byte		N17	, Cn3, v080
	.byte		N17	, En3, v104
	.byte	W18
	.byte		N06	, En3, v032
	.byte	W06
	.byte		N17	, En3, v092
	.byte		N17	, Gn3, v116
	.byte	W18
	.byte		N06	, Gn3, v032
	.byte	W06
	.byte		N17	, Dn3, v088
	.byte		N17	, Fn3, v112
	.byte	W18
	.byte		N06	, Fn3, v032
	.byte	W06
	.byte		N17	, An2, v072
	.byte		N17	, Cn3, v096
	.byte	W18
	.byte		N06	, Cn3, v032
	.byte	W06
	.byte		N17	, Dn3, v080
	.byte		N17	, Fn3, v104
	.byte	W18
	.byte		N06	, Fn3, v032
	.byte	W06
	.byte		N17	, Fn3, v080
	.byte		N17	, An3, v104
	.byte	W18
	.byte		N06	, An3, v032
	.byte	W06
	.byte		N68	, Gn3, v076
	.byte		N68	, As3, v100
	.byte	W72
	.byte		N05	, Fn3, v088
	.byte		N05	, An3, v112
	.byte	W06
	.byte		N06	, An3, v032
	.byte	W06
	.byte		N05	, Dn3, v084
	.byte		N05	, Fn3, v108
	.byte	W06
	.byte		N06	, Fn3, v032
	.byte	W06
	.byte		N80	, En3, v084
	.byte		N80	, Gn3, v108
	.byte	W84
	.byte		N06	, Gn3, v032
	.byte	W12
	.byte	VOICE	, 45
	.byte	VOL	, v052
	.byte	PAN	, c_v+25
	.byte		N06	, Ds4, v127
	.byte	W06
	.byte			Ds4, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Gn3, v127
	.byte	W06
	.byte			Gn3, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Ds4, v127
	.byte	W06
	.byte			Ds4, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Gn3, v127
	.byte	W06
	.byte			Gn3, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Fn4, v127
	.byte	W06
	.byte			Fn4, v044
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v044
	.byte	W06
	.byte			An3, v127
	.byte	W06
	.byte			An3, v044
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v044
	.byte	W06
	.byte			Fn4, v127
	.byte	W06
	.byte			Fn4, v044
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v044
	.byte	W06
	.byte			An3, v127
	.byte	W06
	.byte			An3, v044
	.byte	W06
	.byte			Fn3, v127
	.byte	W06
	.byte			Fn3, v044
	.byte	W06
	.byte			Ds4, v127
	.byte	W06
	.byte			Ds4, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Gn3, v127
	.byte	W06
	.byte			Gn3, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Ds4, v127
	.byte	W06
	.byte			Ds4, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Gn3, v127
	.byte	W06
	.byte			Gn3, v044
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Fn4, v127
	.byte	W06
	.byte			Fn4, v044
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v044
	.byte	W06
	.byte			An3, v127
	.byte	W06
	.byte			An3, v044
	.byte	W06
	.byte			Fn3, v127
	.byte	W06
	.byte			Fn3, v044
	.byte	W06
	.byte			Cn3, v127
	.byte	W06
	.byte			Cn3, v044
	.byte	W06
	.byte			Fn3, v127
	.byte	W06
	.byte			Fn3, v044
	.byte	W06
	.byte			An3, v127
	.byte	W06
	.byte			An3, v044
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v044
	.byte	W06
	.byte	VOICE	, 58
	.byte	VOL	, v047
	.byte	PAN	, c_v-4
	.byte		N06	, As2, v100
	.byte	W12
	.byte			As2, v076
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			As2, v100
	.byte	W12
	.byte			As2, v076
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Cn3, v100
	.byte	W12
	.byte			Cn3, v076
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Cn3, v100
	.byte	W12
	.byte			Cn3, v076
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			As2, v100
	.byte	W12
	.byte			As2, v076
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			As2, v100
	.byte	W12
	.byte			As2, v076
	.byte	W24
	.byte		N06	
	.byte	W12
song015_4_1:
	.byte		N06	, An2, v100
	.byte	W12
	.byte			An2, v076
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			An2, v100
	.byte	W12
	.byte			An2, v076
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte			As2, v100
	.byte	W12
	.byte			As2, v076
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			As2, v100
	.byte	W12
	.byte			As2, v076
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song015_4_1
	.byte	GOTO	
		.word	song015_4_2
	.byte	FINE

	@********************** Track  5 **********************@

	.global song015_5
song015_5:	@ 0x0855391E
	.byte	KEYSH	, 0
song015_5_4:
	.byte	VOICE	, 50
	.byte	VOL	, v047
	.byte	PAN	, c_v+33
	.byte		N80	, Fn2, v084
	.byte		N80	, An2, v088
	.byte	W84
	.byte		N05	, Fn2, v084
	.byte		N05	, An2, v088
	.byte	W12
song015_5_1:
	.byte		N80	, En2, v084
	.byte		N80	, An2, v088
	.byte	W96
	.byte	PEND
	.byte			Fn2, v084
	.byte		N80	, An2, v088
	.byte	W84
	.byte		N05	, Fn2, v084
	.byte		N05	, An2, v088
	.byte	W12
	.byte	PATT	
		.word	song015_5_1
	.byte		N30	, Fn2, v100
	.byte		N30	, An2
	.byte	W30
	.byte		N06	, An2, v032
	.byte	W06
	.byte		N03	, Fn2, v100
	.byte		N03	, An2
	.byte	W06
	.byte			Fn2
	.byte		N03	, An2
	.byte	W06
	.byte		N12	, Fn2
	.byte		N12	, An2
	.byte	W12
	.byte		N06	, An2, v032
	.byte	W12
	.byte		N12	, An2, v100
	.byte		N12	, Cn3
	.byte	W12
	.byte		N06	, Cn3, v032
	.byte	W12
	.byte		N18	, As2, v100
	.byte		N18	, Ds3
	.byte	W18
	.byte		N06	, Ds3, v032
	.byte	W06
	.byte		N18	, Gn2, v100
	.byte		N18	, As2
	.byte	W18
	.byte		N06	, As2, v032
	.byte	W06
	.byte		N18	, Ds2, v100
	.byte		N18	, Gn2
	.byte	W18
	.byte		N06	, Gn2, v032
	.byte	W06
	.byte		N18	, Gn2, v100
	.byte		N18	, As2
	.byte	W18
	.byte		N06	, As2, v032
	.byte	W06
	.byte		N36	, Fn2, v092
	.byte		N42	, An2
	.byte	W48
	.byte		N36	
	.byte		N42	, Cn3
	.byte	W48
	.byte		N44	, Gs2
	.byte		N44	, Cn3
	.byte	W48
	.byte		N21	, Gs2
	.byte		N21	, Cn3
	.byte	W24
	.byte			Gs2
	.byte		N21	, Cn3
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song015_5_2:
	.byte		N06	, Cn2, v116
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
song015_5_3:
	.byte		N06	, Cn2, v116
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
	.byte	PEND
	.byte	PATT	
		.word	song015_5_2
	.byte	PATT	
		.word	song015_5_3
	.byte	PATT	
		.word	song015_5_2
	.byte	PATT	
		.word	song015_5_3
	.byte	PATT	
		.word	song015_5_2
	.byte		N06	, Cn2, v116
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
	.byte			Dn2
	.byte	W12
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N32	, Ds2, v108
	.byte		N32	, Gn2
	.byte	W36
	.byte		N05	, Gn2, v096
	.byte	W06
	.byte			An2, v108
	.byte	W06
	.byte		N40	, Gn2, v104
	.byte		N40	, As2
	.byte	W42
	.byte		N06	, As2, v032
	.byte	W06
	.byte		N28	, Fn2, v108
	.byte		N28	, An2
	.byte	W30
	.byte		N06	, An2, v032
	.byte	W06
	.byte		N05	, An2, v100
	.byte	W06
	.byte			As2, v096
	.byte	W06
	.byte		N20	, An2
	.byte		N20	, Cn3
	.byte	W24
	.byte		N05	, An2, v100
	.byte		N05	, Cn3
	.byte	W06
	.byte		N06	, Cn3, v032
	.byte	W06
	.byte		N05	, As2, v100
	.byte		N05	, Dn3
	.byte	W06
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte		N44	, Cn3, v108
	.byte		N44	, Ds3
	.byte	W48
	.byte		N20	, As2, v104
	.byte		N20	, Dn3
	.byte	W24
	.byte			Gn2, v092
	.byte		N20	, As2
	.byte	W24
	.byte		N44	, An2, v096
	.byte		N44	, Cn3
	.byte	W48
	.byte		N40	, An2, v092
	.byte		N40	, Dn3
	.byte	W42
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte		N68	, Cn3, v096
	.byte		N68	, Ds3
	.byte	W72
	.byte		N05	, As2, v108
	.byte		N05	, Dn3
	.byte	W06
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte		N05	, Cn3, v096
	.byte		N05	, Ds3
	.byte	W06
	.byte		N06	, Ds3, v032
	.byte	W06
	.byte		N88	, Dn3, v084
	.byte		N88	, Fn3
	.byte	W90
	.byte		N06	, Fn3, v032
	.byte	W06
	.byte	GOTO	
		.word	song015_5_4
	.byte	FINE

	@********************** Track  6 **********************@

	.global song015_6
song015_6:	@ 0x08553A92
	.byte	KEYSH	, 0
song015_6_2:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 56
	.byte	VOL	, v047
	.byte	PAN	, c_v
	.byte	W96
	.byte		N24	, Fn2, v104
	.byte	W24
	.byte	W03
	.byte		N06	, Fn2, v032
	.byte	W09
	.byte			Fn2, v104
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	
	.byte	W12
	.byte		N06	, Fn2, v032
	.byte	W12
	.byte		N12	, Gn2, v104
	.byte	W12
	.byte		N06	, Gn2, v032
	.byte	W12
	.byte		N84	, Gs2, v104
	.byte	W84
	.byte		N06	, Gs2, v032
	.byte	W12
	.byte		N24	, Fn2, v104
	.byte	W24
	.byte	W03
	.byte		N06	, Fn2, v032
	.byte	W09
	.byte			Fn2, v104
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N18	
	.byte	W24
	.byte		N24	, Gn2
	.byte	W24
	.byte			Gs2
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte			Fn2
	.byte	W24
	.byte			Ds2
	.byte	W24
	.byte		N06	, Fn2, v076
	.byte		N06	, An2, v084
	.byte	W06
	.byte			An2, v032
	.byte	W30
	.byte		N04	, Fn2, v080
	.byte		N04	, An2, v064
	.byte	W06
	.byte			Fn2, v072
	.byte		N04	, An2, v092
	.byte	W06
	.byte		N06	, Fn2, v072
	.byte		N06	, An2, v084
	.byte	W06
	.byte			An2, v032
	.byte	W06
	.byte			Fn2, v088
	.byte		N06	, An2, v092
	.byte	W06
	.byte			An2, v032
	.byte	W30
	.byte			Gn2, v080
	.byte		N06	, Bn2, v084
	.byte	W06
	.byte			Bn2, v032
	.byte	W30
	.byte		N04	, Gn2, v072
	.byte		N04	, Bn2, v092
	.byte	W06
	.byte			Gn2, v068
	.byte		N04	, Bn2, v080
	.byte	W06
	.byte		N06	, Gn2, v068
	.byte		N06	, Bn2, v076
	.byte	W06
	.byte			Bn2, v032
	.byte	W06
	.byte			Gn2, v076
	.byte		N06	, Bn2, v084
	.byte	W06
	.byte			Bn2, v032
	.byte	W18
	.byte			Gn2, v076
	.byte		N06	, Bn2, v084
	.byte	W06
	.byte			Bn2, v032
	.byte	W06
song015_6_1:
	.byte		N06	, Gn2, v084
	.byte		N06	, Cn3, v092
	.byte	W06
	.byte			Cn3, v032
	.byte	W30
	.byte		N04	, Gn2, v068
	.byte		N04	, Cn3, v092
	.byte	W06
	.byte			Gn2, v072
	.byte		N04	, Cn3, v080
	.byte	W06
	.byte		N06	, Gn2, v060
	.byte		N06	, Cn3, v080
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			Gn2, v068
	.byte		N06	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W30
	.byte	PEND
	.byte			Gn2, v088
	.byte		N06	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W30
	.byte		N04	, Gn2, v080
	.byte		N04	, Cn3, v092
	.byte	W06
	.byte			Gn2, v076
	.byte		N04	, Cn3, v084
	.byte	W06
	.byte		N06	, Gn2, v076
	.byte		N06	, Cn3, v088
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			Gn2, v084
	.byte		N06	, Cn3, v092
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			Gn2, v076
	.byte		N06	, Dn3, v088
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte			Gn2, v084
	.byte		N06	, Dn3, v092
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte	W48
	.byte			Gn2, v072
	.byte		N06	, Cn3, v084
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			Gn2, v088
	.byte		N06	, Cn3, v092
	.byte	W06
	.byte			Cn3, v032
	.byte	W30
	.byte			An2, v080
	.byte		N06	, Cn3, v084
	.byte	W06
	.byte			Cn3, v032
	.byte	W30
	.byte		N04	, An2, v072
	.byte		N04	, Cn3, v092
	.byte	W06
	.byte			An2, v068
	.byte		N04	, Cn3, v080
	.byte	W06
	.byte		N06	, An2, v068
	.byte		N06	, Cn3, v076
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			An2, v076
	.byte		N06	, Cn3, v084
	.byte	W06
	.byte			Cn3, v032
	.byte	W18
	.byte			An2, v076
	.byte		N06	, Cn3, v084
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte	PATT	
		.word	song015_6_1
	.byte		N06	, Gn2, v088
	.byte		N06	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W30
	.byte		N04	, Gn2, v080
	.byte		N04	, Cn3, v092
	.byte	W06
	.byte			Gn2, v076
	.byte		N04	, Cn3, v084
	.byte	W06
	.byte		N06	, Gn2, v076
	.byte		N06	, Cn3, v088
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			Gn2, v084
	.byte		N06	, Cn3, v092
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			Gn2, v084
	.byte		N06	, Cn3, v092
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			An2, v084
	.byte		N06	, Dn3, v092
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte		N32	, Ds2, v088
	.byte		N32	, Gn2, v112
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte			An2
	.byte	W06
	.byte		N42	, Gn2, v088
	.byte		N42	, As2, v112
	.byte	W42
	.byte		N06	, As2, v032
	.byte	W06
	.byte		N42	, Fn2, v088
	.byte		N44	, An2, v112
	.byte	W48
	.byte			An2, v088
	.byte		N44	, Cn3, v112
	.byte	W48
	.byte		N32	, Gn2, v088
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte			An2
	.byte	W06
	.byte		N42	, As2
	.byte	W42
	.byte		N06	, As2, v032
	.byte	W06
	.byte		N44	, Gn2, v060
	.byte		N44	, As2, v088
	.byte	W48
	.byte			An2, v060
	.byte		N44	, Cn3, v088
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song015_6_2
	.byte	FINE

	.align 2
	.global song015
song015:	@ 0x08553C74
	.byte	6		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup009		@ voicegroup/tone

	.word	song015_1		@ track
	.word	song015_2		@ track
	.word	song015_3		@ track
	.word	song015_4		@ track
	.word	song015_5		@ track
	.word	song015_6		@ track
