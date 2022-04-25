	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song051_1
song051_1:	@ 0x0856C640
	.byte	KEYSH	, 0
	.byte	TEMPO	, 40
	.byte	VOICE	, 57
	.byte	VOL	, v050
	.byte	PAN	, c_v+19
	.byte		N66	, Dn2, v084
	.byte		N66	, Fn2
	.byte	W72
	.byte		N18	
	.byte		N18	, As2
	.byte	W24
	.byte		N96	, Fs2
	.byte		N96	, Cs3
	.byte	W96
	.byte			Fs2
	.byte		N96	, Bn2
	.byte	W24
	.byte	TEMPO	, 35
	.byte	W06
	.byte	TEMPO	, 34
	.byte	W06
	.byte	TEMPO	, 32
	.byte	W06
	.byte	TEMPO	, 31
	.byte	W06
	.byte	TEMPO	, 30
	.byte	W06
	.byte	TEMPO	, 29
	.byte	W06
	.byte	TEMPO	, 28
	.byte	W06
	.byte	TEMPO	, 27
	.byte	W06
	.byte	TEMPO	, 26
	.byte	W06
	.byte	TEMPO	, 25
	.byte	W06
	.byte	TEMPO	, 23
	.byte	W06
	.byte	TEMPO	, 23
	.byte	W06
song051_1_4:
	.byte	TEMPO	, 52
	.byte		N44	, Bn2, v084
	.byte		N44	, Dn3, v108
	.byte	W48
	.byte		N06	, Bn2, v020
	.byte		N06	, Dn3, v032
	.byte	W12
	.byte		N04	, Bn2, v084
	.byte		N04	, Dn3, v108
	.byte	W06
	.byte			Bn2, v020
	.byte		N04	, Dn3, v032
	.byte	W06
	.byte			Dn3, v084
	.byte		N04	, Gn3, v108
	.byte	W06
	.byte			Dn3, v020
	.byte		N04	, Gn3, v032
	.byte	W06
	.byte			Gn3, v060
	.byte		N04	, Bn3, v084
	.byte	W06
	.byte			Gn3, v020
	.byte		N04	, Bn3, v032
	.byte	W06
	.byte		N44	, Gn3, v068
	.byte		N44	, Bn3, v096
	.byte	W48
	.byte		N42	, Cn3, v084
	.byte		N42	, En3, v108
	.byte	W42
	.byte		N04	, Cn3, v020
	.byte		N04	, En3, v032
	.byte	W06
song051_1_2:
	.byte		N66	, Cn3, v084
	.byte		N66	, En3, v108
	.byte	W66
	.byte		N04	, Cn3, v020
	.byte		N04	, En3, v032
	.byte	W06
	.byte		N06	, Cn3, v084
	.byte		N06	, En3, v108
	.byte	W06
	.byte			Dn3, v084
	.byte		N06	, Fs3, v108
	.byte	W06
	.byte		N04	, En3, v084
	.byte		N04	, Gn3, v108
	.byte	W06
	.byte			Fs3, v084
	.byte		N04	, An3, v108
	.byte	W06
	.byte	PEND
song051_1_3:
	.byte		N48	, En3, v084
	.byte		N48	, Gn3, v108
	.byte	W48
	.byte		N42	, Dn3, v084
	.byte		N42	, Fs3, v108
	.byte	W42
	.byte		N04	, Dn3, v020
	.byte		N04	, Fs3, v032
	.byte	W06
	.byte	PEND
song051_1_1:
	.byte		N44	, Bn2, v084
	.byte		N44	, Dn3, v108
	.byte	W48
	.byte		N06	, Bn2, v020
	.byte		N06	, Dn3, v032
	.byte	W12
	.byte		N04	, Bn2, v084
	.byte		N04	, Dn3, v108
	.byte	W06
	.byte			Bn2, v020
	.byte		N04	, Dn3, v032
	.byte	W06
	.byte			Dn3, v084
	.byte		N04	, Gn3, v108
	.byte	W06
	.byte			Dn3, v020
	.byte		N04	, Gn3, v032
	.byte	W06
	.byte			Gn3, v084
	.byte		N04	, Bn3, v108
	.byte	W06
	.byte			Gn3, v020
	.byte		N04	, Bn3, v032
	.byte	W06
	.byte	PEND
	.byte		N44	, Bn3, v064
	.byte		N44	, Dn4, v096
	.byte	W48
	.byte		N22	, An3, v072
	.byte		N22	, Cn4, v104
	.byte	W24
	.byte			Gn3, v084
	.byte		N22	, Bn3, v108
	.byte	W24
	.byte		N66	, Cn3, v084
	.byte		N66	, En3, v108
	.byte	W66
	.byte		N04	, Cn3, v020
	.byte		N04	, En3, v032
	.byte	W06
	.byte		N06	, Cn3, v084
	.byte		N06	, En3, v108
	.byte	W06
	.byte			Cn3, v084
	.byte		N06	, Fs3, v108
	.byte	W06
	.byte		N04	, Dn3, v084
	.byte		N04	, Gn3, v108
	.byte	W06
	.byte			En3, v084
	.byte		N04	, An3, v108
	.byte	W06
	.byte		N48	, Dn3, v084
	.byte		N72	, An3, v108
	.byte	W48
	.byte		N24	, En3, v084
	.byte	W24
	.byte			Ds3
	.byte		N06	, An3, v032
	.byte	W24
	.byte	PATT	
		.word	song051_1_1
	.byte		N44	, Gn3, v084
	.byte		N44	, Bn3, v108
	.byte	W48
	.byte		N42	, Cn3, v084
	.byte		N42	, En3, v108
	.byte	W42
	.byte		N04	, Cn3, v020
	.byte		N04	, En3, v032
	.byte	W06
	.byte	PATT	
		.word	song051_1_2
	.byte	PATT	
		.word	song051_1_3
	.byte	PATT	
		.word	song051_1_1
	.byte		N44	, Bn3, v064
	.byte		N44	, Dn4, v096
	.byte	W48
	.byte		N22	, An3, v072
	.byte		N22	, Cn4, v100
	.byte	W24
	.byte			Gn3, v084
	.byte		N22	, Bn3, v108
	.byte	W24
	.byte		N72	, Cn3, v084
	.byte		N72	, En3, v108
	.byte	W72
	.byte		N04	, Cn3, v020
	.byte		N04	, En3, v032
	.byte	W06
	.byte		N06	, Cn3, v084
	.byte		N06	, Fs3, v108
	.byte	W06
	.byte		N03	, Dn3, v084
	.byte		N03	, Gn3, v108
	.byte	W06
	.byte			En3, v084
	.byte		N03	, An3, v108
	.byte	W06
	.byte		N72	, Dn3, v084
	.byte		N72	, Gn3, v108
	.byte	W72
	.byte		N06	, Dn3, v020
	.byte		N06	, Gn3, v032
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N05	, En2, v088
	.byte	W12
	.byte			En2, v020
	.byte	W12
	.byte		N44	, Cn3, v088
	.byte	W48
	.byte		N05	, Cn3, v020
	.byte	W06
	.byte		N06	, An2, v080
	.byte	W06
	.byte		N03	, Gn2, v084
	.byte	W06
	.byte			Fs2, v104
	.byte	W06
	.byte		N32	, Dn3, v108
	.byte	W36
	.byte		N02	, Bn2, v096
	.byte	W06
	.byte		N05	, Bn2, v020
	.byte	W06
	.byte			Gn3, v088
	.byte	W12
	.byte			Gn3, v020
	.byte	W12
	.byte		N12	, Gn3, v088
	.byte	W12
	.byte		N11	, Fs3
	.byte	W12
	.byte		N05	, En3, v108
	.byte	W12
	.byte			En3, v020
	.byte	W12
	.byte		N32	, En3, v104
	.byte	W36
	.byte		N05	, En3, v020
	.byte	W12
	.byte		N06	, En3, v096
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte		N03	, Gn3, v088
	.byte	W06
	.byte			An3
	.byte	W06
	.byte		N42	, Gn3, v100
	.byte	W48
	.byte		N32	, Fs3, v104
	.byte	W36
	.byte		N05	, Fs3, v020
	.byte	W12
	.byte	GOTO	
		.word	song051_1_4
	.byte	FINE

	@********************** Track  2 **********************@

	.global song051_2
song051_2:	@ 0x0856C85B
	.byte	KEYSH	, 0
	.byte	VOICE	, 33
	.byte	VOL	, v047
	.byte	PAN	, c_v
	.byte		N66	, As1, v127
	.byte	W72
	.byte		N06	
	.byte	W06
	.byte			An1
	.byte	W06
	.byte			Gs1
	.byte	W06
	.byte			Gn1
	.byte	W06
	.byte		N66	, Fs1
	.byte	W72
	.byte		N24	
	.byte	W24
	.byte		N66	, Bn1
	.byte	W72
	.byte		N12	
	.byte	W12
	.byte			An1
	.byte	W12
song051_2_1:
	.byte		N05	, Gn1, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PEND
song051_2_2:
	.byte		N05	, Cn2, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PEND
song051_2_3:
	.byte		N05	, An1, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte		N05	, Dn2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Dn1
	.byte	W12
	.byte	PATT	
		.word	song051_2_1
	.byte	PATT	
		.word	song051_2_2
	.byte	PATT	
		.word	song051_2_3
	.byte		N05	, Dn2, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			An1
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Dn1
	.byte	W12
	.byte	PATT	
		.word	song051_2_1
	.byte	PATT	
		.word	song051_2_2
	.byte	PATT	
		.word	song051_2_3
	.byte		N05	, Dn2, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte		N05	, Bn1
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N05	, En2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte		N05	, Cn2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Dn1
	.byte	W12
	.byte		N05	, Gn1
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	, Dn1
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W12
	.byte			Gn1
	.byte	W24
	.byte		N42	, Cn3, v112
	.byte	W48
	.byte			Dn3
	.byte	W48
	.byte			Bn2
	.byte	W48
	.byte			En2
	.byte	W48
	.byte		N06	, Cn2
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte		N06	, Dn2
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte		N06	, Gn1
	.byte	W24
	.byte		N30	
	.byte	W36
	.byte		N12	, Gn2, v120
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte		N06	, Cn2, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Cn2
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Ds2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			En1
	.byte	W12
	.byte			An1
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Dn1
	.byte	W12
	.byte	GOTO	
		.word	song051_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song051_3
song051_3:	@ 0x0856C996
	.byte	KEYSH	, 0
	.byte	VOICE	, 49
	.byte	W06
	.byte	VOL	, v050
	.byte	W06
	.byte	PAN	, c_v-12
	.byte	W12
	.byte		N24	, Fn2, v080
	.byte	W24
	.byte			As2
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte		N36	, Fn3
	.byte	W36
	.byte		N06	, Ds3
	.byte	W12
	.byte		N48	
	.byte	W48
	.byte		N36	, Ds3, v052
	.byte		N36	, Fn3, v080
	.byte	W36
	.byte		N06	, Bn2, v052
	.byte		N06	, Ds3, v080
	.byte	W12
	.byte		N48	, Bn2, v052
	.byte		N48	, Ds3, v080
	.byte	W48
song051_3_1:
	.byte	VOICE	, 70
	.byte	W24
	.byte	VOL	, v042
	.byte	W24
	.byte	PAN	, c_v
	.byte	W36
	.byte		N05	, An2, v080
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte		N68	, Cn3
	.byte	W72
	.byte		N11	
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte		N68	, An2
	.byte	W78
	.byte		N05	
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte		N52	, Dn3
	.byte	W60
	.byte		N11	
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N80	, Gn2
	.byte	W84
	.byte		N05	, An2
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte		N44	, Cn3
	.byte	W48
	.byte		N44	
	.byte	W48
	.byte	W24
	.byte		N23	, An2
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte			Fs2
	.byte	W24
	.byte		N44	, En2
	.byte	W48
	.byte		N23	, Dn2
	.byte	W36
	.byte		N05	, En2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 68
	.byte	W24
	.byte	VOL	, v060
	.byte	W24
	.byte	PAN	, c_v+10
	.byte	W24
	.byte		N11	, Gn3, v096
	.byte	W12
	.byte			Fs3, v104
	.byte	W12
	.byte		N06	, En3
	.byte	W12
	.byte			En3, v040
	.byte	W12
	.byte		N48	, Cn4, v100
	.byte	W54
	.byte		N05	, An3, v088
	.byte	W06
	.byte		N03	, Gn3, v092
	.byte	W06
	.byte		N02	, Fs3, v100
	.byte	W06
	.byte		N36	, Dn4, v092
	.byte	W36
	.byte		N10	, Bn3, v084
	.byte	W12
	.byte		N08	, Gn3, v096
	.byte	W12
	.byte		N05	, Gn3, v040
	.byte	W12
	.byte		N11	, Gn3, v072
	.byte	W12
	.byte			Fs3, v092
	.byte	W12
	.byte		N06	, En3
	.byte	W12
	.byte		N05	, En3, v040
	.byte	W12
	.byte		N48	, En4, v080
	.byte	W54
	.byte		N05	, Dn4, v088
	.byte	W06
	.byte		N03	, Cn4, v096
	.byte	W06
	.byte			An3
	.byte	W06
	.byte		N68	, Bn3, v104
	.byte	W72
	.byte		N05	, Bn3, v040
	.byte	W24
	.byte	VOICE	, 57
	.byte	VOL	, v047
	.byte	PAN	, c_v-14
	.byte		N05	, En2, v072
	.byte	W12
	.byte			En2, v020
	.byte	W12
	.byte		N44	, Cn3, v076
	.byte	W48
	.byte		N05	, Cn3, v020
	.byte	W06
	.byte			An2, v068
	.byte	W06
	.byte		N03	, Gn2, v072
	.byte	W06
	.byte			Fs2, v084
	.byte	W06
	.byte		N32	, Dn3, v088
	.byte	W36
	.byte		N02	, Bn2, v080
	.byte	W06
	.byte		N05	, Bn2, v020
	.byte	W06
	.byte			Gn3, v076
	.byte	W12
	.byte			Gn3, v020
	.byte	W12
	.byte		N11	, Gn3, v072
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte		N05	, En3, v088
	.byte	W12
	.byte			En3, v020
	.byte	W12
	.byte		N32	, En3, v084
	.byte	W36
	.byte		N05	, En3, v020
	.byte	W12
	.byte			En3, v080
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte		N03	, Gn3, v076
	.byte	W06
	.byte			An3
	.byte	W06
	.byte		N42	, Gn3, v084
	.byte	W48
	.byte		N32	, Fs3
	.byte	W36
	.byte		N05	, Fs3, v020
	.byte	W12
	.byte	GOTO	
		.word	song051_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song051_4
song051_4:	@ 0x0856CAD1
	.byte	KEYSH	, 0
	.byte	W96
	.byte	VOICE	, 51
	.byte	W24
	.byte	VOL	, v060
	.byte	W24
	.byte	PAN	, c_v-14
	.byte	W24
	.byte		N24	, As3, v080
	.byte	W24
	.byte		N36	, Fn4
	.byte	W36
	.byte		N06	, Ds4
	.byte	W06
	.byte			Ds4, v032
	.byte	W06
	.byte		N48	, Ds4, v080
	.byte	W48
song051_4_1:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 52
	.byte	W24
	.byte	VOL	, v040
	.byte	W24
	.byte	PAN	, c_v
	.byte	W48
	.byte		N48	, Gn2, v084
	.byte	W60
	.byte		N06	
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N48	, En3
	.byte	W48
	.byte		N42	, Gn2
	.byte	W48
	.byte		N66	
	.byte	W72
	.byte		N06	
	.byte	W06
	.byte			An2
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte		N42	, Dn3
	.byte	W48
	.byte			Cn3
	.byte	W48
	.byte		N48	, Fs2
	.byte	W60
	.byte		N06	
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N24	, Fs3
	.byte	W24
	.byte			En3
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte			Bn2
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			Fs2
	.byte	W24
	.byte			Gn2
	.byte	W30
	.byte		N06	, An2
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte		N68	, Bn2
	.byte	W96
	.byte		N44	, Cn2, v072
	.byte		N44	, En2
	.byte		N48	, Gn2, v076
	.byte	W48
	.byte		N44	, Dn2, v072
	.byte		N44	, Fs2
	.byte		N48	, An2, v076
	.byte	W48
	.byte		N24	, Bn1, v072
	.byte		N44	, Fs2
	.byte		N48	, An2, v076
	.byte	W24
	.byte		N24	, Ds2, v072
	.byte	W24
	.byte		N60	, En2
	.byte		N60	, Gn2, v068
	.byte		N66	, Bn2, v076
	.byte	W48
	.byte	W18
	.byte		N06	, En2, v040
	.byte		N06	, Gn2
	.byte		N06	, Bn2
	.byte	W06
	.byte		N36	, En2, v072
	.byte		N36	, Gn2
	.byte		N24	, Cn3, v084
	.byte	W24
	.byte		N18	, An2, v076
	.byte	W18
	.byte		N06	, En2, v040
	.byte		N06	, Gn2
	.byte		N06	, An2
	.byte	W06
	.byte		N36	, Fs2, v072
	.byte		N36	, An2
	.byte		N24	, Dn3, v088
	.byte	W24
	.byte		N18	, Bn2, v076
	.byte	W18
	.byte		N06	, Fs2, v040
	.byte		N06	, An2
	.byte		N06	, Bn2
	.byte	W78
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song051_4_1
	.byte	FINE

	@********************** Track  5 **********************@

	.global song051_5
song051_5:	@ 0x0856CBA4
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	VOICE	, 56
	.byte	W24
	.byte	VOL	, v047
	.byte	W24
	.byte	PAN	, c_v-14
	.byte	W48
song051_5_1:
	.byte		N06	, Bn2, v080
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			Bn2, v060
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			Bn2, v068
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			Bn2, v060
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			Bn2, v068
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			Bn2, v060
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			Bn2, v068
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			Bn2, v060
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte	PEND
song051_5_2:
	.byte		N06	, Bn2, v080
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Bn2, v060
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Bn2, v068
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Bn2, v060
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Bn2, v068
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Bn2, v060
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Bn2, v068
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Bn2, v060
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte	PEND
song051_5_3:
	.byte		N06	, Cn3, v080
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Cn3, v060
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Cn3, v068
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Cn3, v060
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Cn3, v068
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Cn3, v060
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Cn3, v068
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Cn3, v060
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte	PEND
	.byte			An2, v080
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			An2, v060
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			An2, v068
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			An2, v060
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			An2, v068
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			An2, v060
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			An2, v068
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			An2, v060
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte	PATT	
		.word	song051_5_1
	.byte	PATT	
		.word	song051_5_2
	.byte	PATT	
		.word	song051_5_3
	.byte		N06	, An2, v080
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			An2, v060
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			An2, v068
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			An2, v060
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			An2, v068
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			An2, v060
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			An2, v068
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			An2, v060
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
song051_5_4:
	.byte		N06	, Bn2, v080
	.byte	W06
	.byte			Bn2, v028
	.byte	W06
	.byte			Bn2, v060
	.byte	W06
	.byte			Bn2, v028
	.byte	W06
	.byte			Bn2, v068
	.byte	W06
	.byte			Bn2, v028
	.byte	W06
	.byte			Bn2, v060
	.byte	W06
	.byte			Bn2, v028
	.byte	W06
	.byte			Bn2, v068
	.byte	W06
	.byte			Bn2, v028
	.byte	W06
	.byte			Bn2, v060
	.byte	W06
	.byte			Bn2, v028
	.byte	W06
	.byte			Bn2, v068
	.byte	W06
	.byte			Bn2, v028
	.byte	W06
	.byte			Bn2, v060
	.byte	W06
	.byte			Bn2, v028
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song051_5_4
	.byte		N06	, Cn3, v080
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			Cn3, v060
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			Cn3, v060
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			Cn3, v060
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			Cn3, v060
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			An2, v080
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v060
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v068
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v060
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v068
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v060
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v068
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v060
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte	PATT	
		.word	song051_5_4
	.byte	PATT	
		.word	song051_5_4
	.byte		N06	, Cn3, v080
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			Cn3, v060
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			Cn3, v060
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			An2, v068
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v060
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v068
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v060
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v080
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v060
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v068
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte			An2, v060
	.byte	W06
	.byte			An2, v028
	.byte	W06
	.byte		N18	, Bn2, v080
	.byte	W18
	.byte		N06	, Bn2, v028
	.byte	W06
	.byte		N18	, Bn2, v080
	.byte	W18
	.byte		N06	, Bn2, v028
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 48
	.byte	W09
	.byte	VOL	, v050
	.byte	W09
	.byte	PAN	, c_v+15
	.byte	W06
	.byte		N21	, Dn3, v068
	.byte		N24	, Fs3, v084
	.byte	W24
	.byte		N21	, Bn2, v068
	.byte		N24	, Dn3, v084
	.byte	W24
	.byte		N21	, Fs2, v068
	.byte		N24	, Bn2, v084
	.byte	W24
	.byte		N44	, Gn2, v068
	.byte		N44	, Cn3, v084
	.byte	W48
	.byte		N06	, An2, v068
	.byte		N06	, Dn3, v084
	.byte	W06
	.byte			Cn3, v068
	.byte		N06	, En3, v084
	.byte	W06
	.byte		N03	, Dn3, v068
	.byte		N03	, Fs3, v084
	.byte	W06
	.byte			En3, v068
	.byte		N03	, Gn3, v084
	.byte	W06
	.byte		N24	, Fs3, v068
	.byte		N24	, An3, v084
	.byte	W24
	.byte		N23	, Bn2, v068
	.byte		N44	, Fs3, v084
	.byte	W24
	.byte		N23	, Dn3, v068
	.byte	W24
	.byte		N06	, Bn2
	.byte		N06	, En3, v084
	.byte	W06
	.byte			Dn3, v068
	.byte		N06	, Fs3, v084
	.byte	W06
	.byte		N03	, En3, v068
	.byte		N03	, Gn3, v084
	.byte	W06
	.byte			Fs3, v068
	.byte		N03	, An3, v084
	.byte	W06
	.byte		N44	, Gn3, v068
	.byte		N44	, Bn3, v084
	.byte	W24
	.byte	W24
	.byte		N24	, Cs3, v068
	.byte		N24	, En3, v084
	.byte	W24
	.byte		N48	, En3, v068
	.byte		N24	, An3, v084
	.byte	W24
	.byte			Cn4
	.byte	W24
	.byte		N44	, An3, v068
	.byte		N92	, Dn4, v076
	.byte	W48
	.byte		N44	, An4, v040
	.byte	W48
	.byte	GOTO	
		.word	song051_5_1
	.byte	FINE

	@********************** Track  6 **********************@

	.global song051_6
song051_6:	@ 0x0856CE98
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
song051_6_1:
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
	.byte	W48
	.byte	VOICE	, 46
	.byte	W24
	.byte	VOL	, v060
	.byte	W24
	.byte	PAN	, c_v-30
	.byte	W24
	.byte		N06	, En1, v112
	.byte	W06
	.byte			Gn1, v096
	.byte	W06
	.byte			Cn2
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			Fs2, v112
	.byte	W06
	.byte			An2, v096
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			An3, v112
	.byte	W06
	.byte			An3, v024
	.byte	W18
	.byte	W24
	.byte			Fs1, v112
	.byte	W06
	.byte			An1, v096
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Gn2, v112
	.byte	W06
	.byte			Bn2, v096
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Bn3, v112
	.byte	W06
	.byte			Bn3, v024
	.byte	W18
	.byte	W24
	.byte			Cn2, v112
	.byte	W06
	.byte			Gn2, v096
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Fs3, v112
	.byte	W06
	.byte			Dn3, v096
	.byte	W06
	.byte			An2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Dn2, v112
	.byte	W06
	.byte			An2, v096
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Bn3, v112
	.byte	W06
	.byte			Fs3, v096
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Gn2, v112
	.byte	W06
	.byte			Dn3, v096
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Dn4, v112
	.byte	W06
	.byte			Bn3, v096
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Fs3, v084
	.byte	W06
	.byte			Bn3, v072
	.byte	W06
	.byte			En4, v064
	.byte	W06
	.byte			En4, v024
	.byte	W90
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song051_6_1
	.byte	FINE

	@********************** Track  7 **********************@

	.global song051_7
song051_7:	@ 0x0856CF42
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v056
	.byte	PAN	, c_v
	.byte		N44	, An2, v080
	.byte	W96
	.byte		N44	
	.byte	W96
	.byte		N44	
	.byte	W60
	.byte		TIE	, En2, v072
	.byte	W36
song051_7_1:
	.byte		N06	, Dn1, v088
	.byte	W12
	.byte			Dn1, v076
	.byte	W36
	.byte			Dn1, v072
	.byte	W12
	.byte			Dn1, v068
	.byte	W11
	.byte		EOT	, En2
	.byte	W24
	.byte	W01
	.byte		N06	, Dn1, v076
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte			Dn1, v072
	.byte	W12
	.byte			Dn1, v076
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn1, v080
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte			Dn1, v072
	.byte	W12
	.byte			Dn1, v084
	.byte	W24
	.byte			Dn1, v068
	.byte	W12
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v076
	.byte	W24
	.byte			Dn1, v068
	.byte	W12
	.byte		N32	, Ds1, v100
	.byte	W36
	.byte		N06	, Dn1, v084
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v092
	.byte	W36
	.byte			Dn1, v064
	.byte	W12
	.byte			Dn1, v076
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v080
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte			Dn1, v064
	.byte	W24
	.byte			Dn1, v076
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Dn1, v068
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v072
	.byte	W36
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v084
	.byte	W24
	.byte			Dn1, v072
	.byte	W12
	.byte		N23	, Ds1, v080
	.byte	W24
	.byte		N06	, Dn1, v072
	.byte	W12
	.byte			Dn1, v064
	.byte	W12
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v076
	.byte	W24
	.byte			Dn1, v068
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte			Dn1, v080
	.byte	W24
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v092
	.byte	W24
	.byte		N11	, Ds1, v076
	.byte	W12
	.byte		N06	, Dn1, v068
	.byte	W12
	.byte			Dn1, v084
	.byte	W36
	.byte			Dn1, v100
	.byte	W12
	.byte			Dn1, v064
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn1, v072
	.byte	W12
	.byte			Dn1, v052
	.byte	W36
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v072
	.byte	W12
	.byte		N23	, Ds1, v080
	.byte	W24
	.byte		N06	, Dn1, v068
	.byte	W12
	.byte			Dn1, v072
	.byte	W36
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v080
	.byte	W24
	.byte			Dn1, v072
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v092
	.byte	W36
	.byte			Dn1, v088
	.byte	W12
	.byte			Dn1, v084
	.byte	W24
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Dn1, v080
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N23	, Ds1, v084
	.byte	W24
	.byte		N06	, Dn1, v072
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte		N23	, Ds1, v084
	.byte	W24
	.byte		N06	, Dn1, v076
	.byte	W24
	.byte			Dn1, v084
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte		N23	, Ds1, v072
	.byte	W24
	.byte		N24	, An2, v076
	.byte	W24
	.byte		N06	, Dn1, v072
	.byte	W12
	.byte			Dn1, v076
	.byte	W24
	.byte			Dn1, v072
	.byte	W24
	.byte			Dn1, v076
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Dn1, v068
	.byte	W24
	.byte			Dn1, v064
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v072
	.byte	W12
	.byte			Dn1, v084
	.byte	W24
	.byte			Dn1, v076
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v072
	.byte	W12
	.byte			Dn1, v080
	.byte	W06
	.byte			Dn1, v076
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte			Dn1, v092
	.byte	W24
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v072
	.byte	W12
	.byte			Dn1, v076
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	GOTO	
		.word	song051_7_1
	.byte	FINE

	.align 2
	.global song051
song051:	@ 0x0856D0AC
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup016		@ voicegroup/tone

	.word	song051_1		@ track
	.word	song051_2		@ track
	.word	song051_3		@ track
	.word	song051_4		@ track
	.word	song051_5		@ track
	.word	song051_6		@ track
	.word	song051_7		@ track
