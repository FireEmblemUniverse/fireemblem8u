	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song003_1
song003_1:	@ 0x08547A9C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 50
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song003_1_1:
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
	.byte	VOICE	, 51
	.byte	VOL	, v056
	.byte	PAN	, c_v
	.byte		TIE	, Gs1, v108
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, As1
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, Cn2
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte	GOTO	
		.word	song003_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song003_2
song003_2:	@ 0x08547AD8
	.byte	KEYSH	, 0
	.byte	VOICE	, 60
	.byte	VOL	, v056
	.byte	PAN	, c_v
	.byte	BEND	, c_v
	.byte	W48
	.byte		N36	, Gn2, v116
	.byte	W36
	.byte	W03
	.byte		N08	, Gn2, v048
	.byte	W09
song003_2_1:
	.byte		N40	, Fn3, v116
	.byte	W42
	.byte		N05	, Fn3, v048
	.byte	W06
	.byte		N40	, Dn3, v116
	.byte	W42
	.byte		N05	, Dn3, v048
	.byte	W06
	.byte	PEND
	.byte		N96	, Cn3, v100
	.byte		N92	, En3, v116
	.byte	W96
song003_2_2:
	.byte	W03
	.byte		N11	, En3, v048
	.byte	W92
	.byte	W01
	.byte	PEND
song003_2_3:
	.byte	VOICE	, 60
	.byte	VOL	, v056
	.byte	PAN	, c_v
	.byte	W48
	.byte		N36	, Gn2, v116
	.byte	W36
	.byte	W03
	.byte		N08	, Gn2, v048
	.byte	W09
	.byte	PATT	
		.word	song003_2_1
	.byte		N92	, Cn3, v100
	.byte		N92	, En3, v116
	.byte	W96
	.byte	PATT	
		.word	song003_2_2
	.byte	W96
	.byte		N80	, Gn2, v116
	.byte	W84
	.byte		N05	, Gn2, v040
	.byte	W12
	.byte		N68	, Dn3, v116
	.byte	W72
	.byte		N08	, Dn3, v040
	.byte	W12
	.byte		N05	, Cn3, v116
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N72	, En3
	.byte	W84
	.byte		N05	, En3, v040
	.byte	W12
	.byte		TIE	, Cn3, v100
	.byte		TIE	, Gn3, v116
	.byte	W96
	.byte	W36
	.byte	W02
	.byte		EOT	
	.byte	W03
	.byte		EOT	, Cn3
	.byte	W01
	.byte		N05	, Gn3, v040
	.byte	W06
	.byte		N40	, Fn3, v116
	.byte	W42
	.byte		N05	, Fn3, v040
	.byte	W06
	.byte		TIE	, Cn3, v100
	.byte		TIE	, En3, v116
	.byte	W96
	.byte	W68
	.byte		EOT	
	.byte	W01
	.byte		EOT	, Cn3
	.byte	W03
	.byte		N11	, En3, v040
	.byte	W24
	.byte		N68	, Cn3, v100
	.byte		N68	, Dn3, v116
	.byte	W72
	.byte		N11	, Dn3, v040
	.byte	W24
	.byte		N68	, Fn3, v084
	.byte		N68	, Gn3, v100
	.byte	W72
	.byte		N11	, Gn3, v040
	.byte	W24
	.byte		N92	, Cn4, v048
	.byte		N92	, Dn4, v076
	.byte	W96
	.byte		N08	, Dn4, v040
	.byte	W48
	.byte		N40	, Fn3, v064
	.byte		N40	, Bn3, v080
	.byte	W42
	.byte		N05	, Bn3, v040
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 49
	.byte	VOL	, v050
	.byte		N52	, Dn3, v096
	.byte	W60
	.byte		N11	, Gn2
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			Dn3, v092
	.byte	W12
	.byte		N40	, Gn3, v088
	.byte	W48
	.byte		N44	, Cn3, v096
	.byte	W48
	.byte			Dn3
	.byte	W48
	.byte		N32	, En3
	.byte	W36
	.byte		N05	, Fn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte		N44	, Dn3
	.byte	W48
	.byte			Cn3
	.byte	W48
	.byte	GOTO	
		.word	song003_2_3
	.byte	FINE

	@********************** Track  3 **********************@

	.global song003_3
song003_3:	@ 0x08547BD2
	.byte	KEYSH	, 0
	.byte	VOICE	, 51
	.byte	VOL	, v050
	.byte	PAN	, c_v-3
	.byte		TIE	, Cn1, v108
	.byte		TIE	, Cn2
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W80
	.byte	W02
	.byte		EOT	, Cn1
	.byte			Cn2
	.byte	W02
	.byte		N11	, Gn1
	.byte		N11	, Gn2
	.byte	W12
song003_3_2:
	.byte		TIE	, Cn1, v108
	.byte		TIE	, Cn2
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W88
	.byte		EOT	, Cn1
	.byte			Cn2
	.byte	W08
	.byte		TIE	
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W92
	.byte		EOT	
	.byte	W04
	.byte		TIE	, Gs1
	.byte	W96
	.byte	W80
	.byte	W03
	.byte		EOT	
	.byte	W13
	.byte		TIE	, Gn1
	.byte	W96
	.byte	W88
	.byte	W01
	.byte		EOT	
	.byte	W07
	.byte		TIE	
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W76
	.byte	W01
	.byte		EOT	
	.byte	W19
	.byte	VOICE	, 52
	.byte	VOL	, v033
	.byte	PAN	, c_v+4
	.byte		N06	, Cn5, v088
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Dn5
	.byte	W06
song003_3_1:
	.byte		N06	, Cn5, v088
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			Gn5
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte	PEND
	.byte			Cn5
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte	PATT	
		.word	song003_3_1
	.byte	VOICE	, 51
	.byte	VOL	, v044
	.byte	W48
	.byte		N40	, Gn2, v096
	.byte		N44	, Cn3
	.byte	W48
	.byte			An2
	.byte	W48
	.byte			Gn2
	.byte		N44	, Cn3
	.byte	W48
	.byte		N40	, An2
	.byte		N42	, Cn3
	.byte	W48
	.byte		N44	, Gn2
	.byte		N44	, Cn3
	.byte	W48
	.byte			Fn2
	.byte		N44	, An2
	.byte	W48
	.byte			En2
	.byte		N44	, Gn2
	.byte	W48
	.byte	GOTO	
		.word	song003_3_2
	.byte	FINE

	@********************** Track  4 **********************@

	.global song003_4
song003_4:	@ 0x08547CB0
	.byte	KEYSH	, 0
	.byte	VOICE	, 50
	.byte	VOL	, v056
	.byte	PAN	, c_v-13
	.byte		N92	, Gn2, v072
	.byte	W96
	.byte			Dn3
	.byte	W96
	.byte		N64	, Cn3
	.byte	W72
	.byte		N23	, Dn3
	.byte	W24
	.byte		N88	, En3
	.byte	W96
song003_4_2:
	.byte	W96
	.byte	W96
	.byte		N68	, Cn3, v072
	.byte	W72
	.byte		N23	, Dn3
	.byte	W24
	.byte		N72	, En3, v080
	.byte	W96
	.byte	W96
	.byte	VOICE	, 61
	.byte		N05	, En2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			En2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W78
	.byte			En2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			En2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W66
	.byte		N08	, Fn2, v092
	.byte		N11	, Dn3, v100
	.byte	W12
	.byte		N05	, En2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			En2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W66
	.byte		N08	, En2, v092
	.byte		N11	, Cn3, v100
	.byte	W12
	.byte		N05	, Ds2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			Ds2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W66
	.byte		N11	, Fn2, v092
	.byte		N11	, Dn3, v100
	.byte	W12
	.byte		N05	, Ds2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			Ds2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W78
	.byte			En2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			En2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W66
	.byte		N11	, Fn2, v092
	.byte		N11	, Dn3, v100
	.byte	W12
	.byte		N05	, En2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			En2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W66
	.byte		N11	, En2, v092
	.byte		N11	, Cn3, v100
	.byte	W12
song003_4_1:
	.byte		N05	, Fn2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W06
	.byte			Fn2, v092
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v032
	.byte	W66
	.byte		N11	, Fn2, v092
	.byte		N11	, Cn3, v100
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song003_4_1
	.byte		N05	, Dn2, v092
	.byte		N05	, Bn2, v100
	.byte	W06
	.byte			Bn2, v032
	.byte	W06
	.byte			Dn2, v092
	.byte		N05	, Bn2, v100
	.byte	W06
	.byte			Bn2, v032
	.byte	W66
	.byte		N11	, Fn2, v092
	.byte		N11	, Dn3, v100
	.byte	W12
	.byte		N05	, An2, v092
	.byte		N05	, Fn3, v100
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			An2, v092
	.byte		N05	, Fn3, v100
	.byte	W06
	.byte			Fn3, v032
	.byte	W54
	.byte		N17	, Cn3, v092
	.byte		N17	, Gn3, v100
	.byte	W18
	.byte		N05	, Gn3, v032
	.byte	W06
	.byte		N44	, Cn3, v096
	.byte	W48
	.byte			Gn2
	.byte	W48
	.byte		N32	, Cn2
	.byte	W36
	.byte		N11	, Fn2
	.byte	W12
	.byte		N44	, Gn2
	.byte	W48
	.byte		N13	, Gn2, v028
	.byte	W24
	.byte		N22	, Gn2, v096
	.byte	W24
	.byte		N44	, Dn3
	.byte	W48
	.byte		N13	, Dn3, v028
	.byte	W24
	.byte			Gn2, v096
	.byte	W15
	.byte		N08	, Gn2, v028
	.byte	W09
	.byte		N42	, Dn3, v096
	.byte	W48
	.byte		N13	, Dn3, v028
	.byte	W24
	.byte		N17	, Gn1, v096
	.byte	W24
	.byte		N21	, Cn2
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte		N40	, En2
	.byte	W48
	.byte		N44	, Gn2
	.byte	W48
	.byte			An2
	.byte	W48
	.byte		N42	, Gn2
	.byte	W48
	.byte		N78	, Cn3
	.byte	W96
	.byte	GOTO	
		.word	song003_4_2
	.byte	FINE

	@********************** Track  5 **********************@

	.global song003_5
song003_5:	@ 0x08547E1F
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte	VOICE	, 47
	.byte	VOL	, v056
	.byte	PAN	, c_v
	.byte	W24
song003_5_1:
	.byte		N12	, Bn2, v116
	.byte	W12
	.byte		N12	
	.byte	W24
	.byte			Bn2, v112
	.byte	W12
	.byte			Bn2, v116
	.byte	W24
	.byte			Bn2, v112
	.byte	W12
	.byte			Fs2, v124
	.byte	W12
	.byte	PEND
song003_5_2:
	.byte		N12	, Bn2, v124
	.byte	W12
	.byte			Bn2, v112
	.byte	W24
	.byte			Bn2, v100
	.byte	W12
	.byte			Bn2, v112
	.byte	W24
	.byte			Bn2, v120
	.byte	W12
	.byte			Fs2, v127
	.byte	W12
	.byte	PEND
song003_5_3:
	.byte		N12	, Bn2, v127
	.byte	W12
	.byte			Bn2, v116
	.byte	W24
	.byte		N12	
	.byte	W12
	.byte			Bn2, v120
	.byte	W24
	.byte		N12	
	.byte	W12
	.byte			Fs2, v124
	.byte	W12
	.byte	PEND
song003_5_4:
	.byte		N12	, Bn2, v127
	.byte	W12
	.byte			Bn2, v124
	.byte	W24
	.byte			Bn2, v112
	.byte	W12
	.byte			Bn2, v127
	.byte	W24
	.byte		N12	
	.byte	W12
	.byte			Fs2, v124
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song003_5_1
	.byte	PATT	
		.word	song003_5_2
	.byte	PATT	
		.word	song003_5_3
	.byte	PATT	
		.word	song003_5_4
	.byte	PATT	
		.word	song003_5_1
	.byte	PATT	
		.word	song003_5_2
	.byte	PATT	
		.word	song003_5_3
	.byte	PATT	
		.word	song003_5_4
	.byte	PATT	
		.word	song003_5_1
	.byte	PATT	
		.word	song003_5_2
	.byte	PATT	
		.word	song003_5_3
	.byte	PATT	
		.word	song003_5_4
	.byte	PATT	
		.word	song003_5_1
	.byte	PATT	
		.word	song003_5_2
	.byte	PATT	
		.word	song003_5_3
	.byte	PATT	
		.word	song003_5_4
	.byte	PATT	
		.word	song003_5_1
	.byte	PATT	
		.word	song003_5_2
	.byte	PATT	
		.word	song003_5_3
	.byte	PATT	
		.word	song003_5_4
	.byte	GOTO	
		.word	song003_5_1
	.byte	FINE

	@********************** Track  6 **********************@

	.global song003_6
song003_6:	@ 0x08547EE2
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song003_6_3:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 46
	.byte	VOL	, v046
	.byte	PAN	, c_v-6
	.byte		N05	, Gn4, v112
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Cn4, v112
	.byte	W06
	.byte			Gn3, v096
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Cn4, v104
	.byte	W06
	.byte			Gn3, v088
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Dn4, v096
	.byte	W06
	.byte			Cn4, v092
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Dn4, v096
	.byte	W06
	.byte			Cn4, v092
	.byte	W06
	.byte			Gn3, v096
	.byte	W06
song003_6_1:
	.byte		N05	, Gn4, v108
	.byte	W06
	.byte			Dn4, v096
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Gn3, v092
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Dn4, v096
	.byte	W06
	.byte			Cn4, v104
	.byte	W06
	.byte			Gn3, v096
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Cn4, v104
	.byte	W06
	.byte			Gn3, v092
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Dn4, v104
	.byte	W06
	.byte			Cn4, v108
	.byte	W06
	.byte			Gn3, v096
	.byte	W06
	.byte	PEND
song003_6_2:
	.byte		N05	, Gn4, v112
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Cn4, v112
	.byte	W06
	.byte			Gn3, v096
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Cn4, v104
	.byte	W06
	.byte			Gn3, v088
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Dn4, v096
	.byte	W06
	.byte			Cn4, v092
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Dn4, v096
	.byte	W06
	.byte			Cn4, v092
	.byte	W06
	.byte			Gn3, v096
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song003_6_1
	.byte		N05	, Gn4, v112
	.byte	W06
	.byte			Ds4, v100
	.byte	W06
	.byte			Cn4, v112
	.byte	W06
	.byte			Gn3, v096
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Ds4, v100
	.byte	W06
	.byte			Cn4, v104
	.byte	W06
	.byte			Gn3, v088
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Ds4, v096
	.byte	W06
	.byte			Cn4, v092
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Ds4, v096
	.byte	W06
	.byte			Cn4, v092
	.byte	W06
	.byte			Gn3, v096
	.byte	W06
	.byte			Gn4, v108
	.byte	W06
	.byte			Ds4, v096
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Gs3, v092
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Ds4, v096
	.byte	W06
	.byte			Cn4, v104
	.byte	W06
	.byte			Gs3, v096
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Ds4, v100
	.byte	W06
	.byte			Cn4, v104
	.byte	W06
	.byte			Gs3, v092
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Ds4, v104
	.byte	W06
	.byte			Cn4, v108
	.byte	W06
	.byte			Gs3, v096
	.byte	W06
	.byte	PATT	
		.word	song003_6_2
	.byte	PATT	
		.word	song003_6_1
	.byte	PATT	
		.word	song003_6_2
	.byte	PATT	
		.word	song003_6_1
	.byte	PATT	
		.word	song003_6_1
	.byte		N05	, Gn4, v108
	.byte	W06
	.byte			Dn4, v096
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Gn3, v092
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Dn4, v096
	.byte	W06
	.byte			Cn4, v104
	.byte	W06
	.byte			Gn3, v096
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Bn3, v104
	.byte	W06
	.byte			Gn3, v092
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Dn4, v104
	.byte	W06
	.byte			Bn3, v108
	.byte	W06
	.byte			Gn3, v096
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song003_6_3
	.byte	FINE

	.align 2
	.global song003
song003:	@ 0x08548040
	.byte	6		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup002		@ voicegroup/tone

	.word	song003_1		@ track
	.word	song003_2		@ track
	.word	song003_3		@ track
	.word	song003_4		@ track
	.word	song003_5		@ track
	.word	song003_6		@ track
