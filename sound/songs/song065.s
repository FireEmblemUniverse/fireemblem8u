	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song065_1
song065_1:	@ 0x08571534
	.byte	KEYSH	, 0
	.byte	TEMPO	, 43
	.byte	VOICE	, 49
	.byte	VOL	, v048
	.byte	PAN	, c_v-12
	.byte	W48
	.byte		N68	, An2, v092
	.byte	W48
	.byte	W24
	.byte		N44	, An2, v080
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte		N24	, Gn3, v076
	.byte	W24
	.byte		N92	, An2, v084
	.byte		N80	, En3
	.byte	W84
	.byte		N05	, Dn3, v068
	.byte	W06
	.byte			En3, v076
	.byte	W06
	.byte		N88	, An2, v084
	.byte		N88	, Dn3, v076
	.byte		N88	, Fs3, v080
	.byte	W90
	.byte		N06	, Dn3, v032
	.byte		N06	, Fs3
	.byte	W06
	.byte	W48
	.byte		N44	, An2, v092
	.byte	W48
	.byte			En3, v080
	.byte		N44	, Gn3
	.byte	W48
	.byte			Cs3
	.byte		N44	, En3, v076
	.byte	W48
	.byte		TIE	, Dn3, v084
	.byte		TIE	, Fs3
	.byte	W96
	.byte	W88
	.byte	W01
	.byte		EOT	
	.byte	W01
	.byte		EOT	, Dn3
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte		TIE	, An3, v100
	.byte	W96
	.byte	W44
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N44	, Gn3, v096
	.byte	W48
	.byte		N92	, Fs3, v100
	.byte	W96
	.byte			Dn3
	.byte	W96
	.byte		N80	, En3
	.byte	W84
	.byte		N05	, Fs3, v092
	.byte	W06
	.byte			Gn3, v088
	.byte	W06
	.byte		N80	, An3, v096
	.byte	W84
	.byte		N06	, An3, v032
	.byte	W12
	.byte		N80	, An3, v100
	.byte	W84
	.byte		N05	, An3, v092
	.byte	W06
	.byte			As3, v088
	.byte	W06
	.byte	TEMPO	, 43
	.byte		N44	, Cn4, v080
	.byte	W06
	.byte	TEMPO	, 43
	.byte	W06
	.byte	TEMPO	, 42
	.byte	W06
	.byte	TEMPO	, 42
	.byte	W06
	.byte	TEMPO	, 41
	.byte	W24
	.byte	TEMPO	, 50
	.byte			En4
	.byte	W48
song065_1_1:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N40	, Fs2, v112
	.byte		N40	, An2
	.byte	W42
	.byte		N06	, An2, v032
	.byte	W06
	.byte		N40	, En3, v096
	.byte		N40	, Gn3
	.byte	W42
	.byte		N06	, Gn3, v032
	.byte	W06
	.byte		N32	, Cs3, v092
	.byte		N32	, En3
	.byte	W36
	.byte		N05	, Bn2, v096
	.byte		N05	, Dn3
	.byte	W06
	.byte			Cs3
	.byte		N05	, En3
	.byte	W06
	.byte		N52	, Dn3, v108
	.byte		N52	, Fs3
	.byte	W48
	.byte	W06
	.byte		N06	, Fs3, v032
	.byte	W18
	.byte		N17	, Fs2, v104
	.byte		N17	, An2
	.byte	W18
	.byte		N06	, An2, v032
	.byte	W06
	.byte		N17	, En3, v096
	.byte		N17	, Gn3
	.byte	W18
	.byte		N06	, Gn3, v032
	.byte	W06
	.byte		N17	, Cs3, v100
	.byte		N17	, En3
	.byte	W18
	.byte		N06	, En3, v032
	.byte	W06
	.byte		N44	, Dn3, v100
	.byte		N44	, Fs3
	.byte	W48
	.byte		N21	, Dn3, v108
	.byte		N44	, En3
	.byte	W24
	.byte		N21	, Cn3
	.byte	W24
	.byte		N32	, As2
	.byte		N32	, Dn3
	.byte	W36
	.byte		N05	, Gn2, v104
	.byte		N05	, As2
	.byte	W06
	.byte			An2
	.byte		N05	, Cn3
	.byte	W06
	.byte		N36	, As2, v108
	.byte		N36	, Dn3
	.byte	W36
	.byte	W03
	.byte		N06	, Dn3, v032
	.byte	W09
	.byte		N32	, Cn3, v108
	.byte		N32	, En3
	.byte	W36
	.byte		N05	, Dn3, v104
	.byte		N05	, Fn3
	.byte	W06
	.byte		N06	, Fn3, v032
	.byte	W06
	.byte		N32	, En3, v104
	.byte		N32	, Gn3
	.byte	W36
	.byte	W03
	.byte		N06	, Gn3, v032
	.byte	W09
	.byte		N44	, Dn3, v096
	.byte		N40	, Fn3
	.byte	W42
	.byte		N06	, Fn3, v032
	.byte	W18
	.byte		N05	, En3, v096
	.byte		N05	, Gn3, v092
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			Fn3, v096
	.byte		N05	, An3, v092
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Gn3, v096
	.byte		N05	, As3, v100
	.byte	W06
	.byte			As3, v032
	.byte	W06
	.byte		N44	, Fn3, v096
	.byte		N44	, An3
	.byte	W48
	.byte		N22	, En3, v104
	.byte		N40	, Gn3
	.byte	W42
	.byte		N05	, Gn3, v032
	.byte	W06
	.byte		N64	, Fs3, v104
	.byte	W66
	.byte		N05	, Fs3, v032
	.byte	W30
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N21	, En3, v100
	.byte		N21	, An3
	.byte	W24
	.byte		N40	, Cs3
	.byte		N40	, En3
	.byte	W42
	.byte		N05	, En3, v032
	.byte	W06
	.byte		N24	, En3, v100
	.byte		N24	, Gn3
	.byte	W24
	.byte			Dn3
	.byte		N24	, Fs3
	.byte	W24
	.byte			Cs3
	.byte		N24	, En3
	.byte	W24
	.byte		N23	, An2
	.byte		N23	, Dn3
	.byte	W24
	.byte		N36	, Gn2
	.byte		N36	, Bn2
	.byte	W36
	.byte		N06	, An2
	.byte		N06	, Cs3
	.byte	W06
	.byte			Bn2
	.byte		N06	, Dn3
	.byte	W06
	.byte		N42	, Cs3
	.byte		N42	, En3
	.byte	W42
	.byte		N05	, En3, v032
	.byte	W06
	.byte		N36	, Dn3, v100
	.byte		N36	, Fs3
	.byte	W36
	.byte		N06	, Cs3
	.byte		N06	, En3
	.byte	W06
	.byte			Dn3
	.byte		N06	, Fs3
	.byte	W06
	.byte		N18	, En3
	.byte		N18	, Gn3
	.byte	W18
	.byte		N05	, Gn3, v032
	.byte	W06
	.byte		N17	, En3, v100
	.byte		N17	, An3
	.byte	W18
	.byte		N05	, An3, v032
	.byte	W06
	.byte	GOTO	
		.word	song065_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song065_2
song065_2:	@ 0x0857170B
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	VOICE	, 52
	.byte	VOL	, v054
	.byte	PAN	, c_v
	.byte	W96
	.byte	W84
	.byte		N03	, Dn1, v116
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		TIE	, Dn1, v120
	.byte	W96
	.byte	W78
	.byte	W01
	.byte		EOT	
	.byte	W05
	.byte		N03	
	.byte	W06
	.byte			Dn1, v100
	.byte	W06
	.byte		TIE	, Dn1, v120
	.byte	W96
	.byte	W64
	.byte	W01
	.byte		EOT	
	.byte	W07
	.byte		N11	, Dn1, v112
	.byte	W12
	.byte			Cn1, v096
	.byte	W12
	.byte		TIE	, As0, v092
	.byte	W96
	.byte	W92
	.byte		EOT	
	.byte	W04
	.byte		TIE	, An0
	.byte	W96
	.byte	W20
	.byte		EOT	
	.byte	W04
	.byte		N20	, An1
	.byte	W24
	.byte			Dn1
	.byte	W24
	.byte			An0
	.byte	W24
	.byte		TIE	
	.byte	W96
	.byte	W68
	.byte		EOT	
	.byte	W04
	.byte		N20	
	.byte	W24
	.byte		TIE	, As0, v104
	.byte	W96
	.byte	W44
	.byte		EOT	
	.byte	W04
	.byte		N20	, As0, v108
	.byte	W24
	.byte			Cn1, v116
	.byte	W24
song065_2_1:
	.byte		N09	, Dn1, v127
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song065_2_1
	.byte	PATT	
		.word	song065_2_1
song065_2_3:
	.byte		N09	, Dn1, v127
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W12
	.byte			Cn1
	.byte	W12
	.byte	PEND
song065_2_2:
	.byte		N09	, As0, v127
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song065_2_2
	.byte	PATT	
		.word	song065_2_2
	.byte		N09	, As0, v127
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W12
	.byte			Cn1
	.byte	W12
	.byte	PATT	
		.word	song065_2_1
	.byte	PATT	
		.word	song065_2_1
	.byte	PATT	
		.word	song065_2_1
	.byte	PATT	
		.word	song065_2_3
	.byte	PATT	
		.word	song065_2_2
	.byte	PATT	
		.word	song065_2_2
	.byte	PATT	
		.word	song065_2_2
	.byte	PATT	
		.word	song065_2_2
	.byte		N92	, An0, v127
	.byte	W96
	.byte		N68	, An1
	.byte	W72
	.byte		N12	
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte		N92	, Fs1
	.byte	W96
	.byte		N68	, En1
	.byte	W72
	.byte		N21	, Dn1
	.byte	W24
	.byte		N92	, Cs1
	.byte	W96
	.byte		N68	, Dn1
	.byte	W72
	.byte		N12	
	.byte	W12
	.byte		N06	, En1
	.byte	W06
	.byte			Fs1
	.byte	W06
	.byte		N68	, Gn1
	.byte	W72
	.byte		N12	
	.byte	W12
	.byte		N06	, An1
	.byte	W06
	.byte			Bn1
	.byte	W06
	.byte		N68	, An1
	.byte	W72
	.byte		N23	, An0
	.byte	W24
	.byte	GOTO	
		.word	song065_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song065_3
song065_3:	@ 0x08571804
	.byte	KEYSH	, 0
	.byte	VOICE	, 53
	.byte	VOL	, v054
	.byte	PAN	, c_v+25
	.byte		N06	, An4, v127
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			En4
	.byte	W06
song065_3_1:
	.byte		N06	, An4, v127
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song065_3_1
	.byte	PATT	
		.word	song065_3_1
	.byte	PATT	
		.word	song065_3_1
	.byte	PATT	
		.word	song065_3_1
	.byte	PATT	
		.word	song065_3_1
	.byte	PATT	
		.word	song065_3_1
	.byte	PATT	
		.word	song065_3_1
	.byte	PATT	
		.word	song065_3_1
	.byte	PATT	
		.word	song065_3_1
	.byte	PATT	
		.word	song065_3_1
	.byte	PATT	
		.word	song065_3_1
	.byte	PATT	
		.word	song065_3_1
	.byte	W96
	.byte	W96
song065_3_2:
	.byte	VOICE	, 62
	.byte	VOL	, v049
	.byte	PAN	, c_v-16
	.byte		N40	, Fs2, v112
	.byte		N40	, An2
	.byte	W42
	.byte		N06	, An2, v032
	.byte	W06
	.byte		N40	, En3, v096
	.byte		N40	, Gn3
	.byte	W42
	.byte		N06	, Gn3, v032
	.byte	W06
	.byte		N32	, Cs3, v092
	.byte		N32	, En3
	.byte	W36
	.byte		N05	, Bn2, v096
	.byte		N05	, Dn3
	.byte	W06
	.byte			Cs3
	.byte		N05	, En3
	.byte	W06
	.byte		N52	, Dn3, v108
	.byte		N52	, Fs3
	.byte	W48
	.byte	W06
	.byte		N06	, Fs3, v032
	.byte	W18
	.byte		N17	, Fs2, v104
	.byte		N17	, An2
	.byte	W18
	.byte		N06	, An2, v032
	.byte	W06
	.byte		N17	, En3, v096
	.byte		N17	, Gn3
	.byte	W18
	.byte		N06	, Gn3, v032
	.byte	W06
	.byte		N17	, Cs3, v100
	.byte		N17	, En3
	.byte	W18
	.byte		N06	, En3, v032
	.byte	W06
	.byte		N44	, Dn3, v100
	.byte		N44	, Fs3
	.byte	W48
	.byte		N21	, Dn3, v108
	.byte		N44	, En3
	.byte	W24
	.byte		N21	, Cn3
	.byte	W24
	.byte		N32	, As2
	.byte		N32	, Dn3
	.byte	W36
	.byte		N05	, Gn2, v104
	.byte		N05	, As2
	.byte	W06
	.byte			An2
	.byte		N05	, Cn3
	.byte	W06
	.byte		N36	, As2, v108
	.byte		N36	, Dn3
	.byte	W36
	.byte	W03
	.byte		N06	, Dn3, v032
	.byte	W09
	.byte		N44	, Cn3, v108
	.byte		N44	, En3
	.byte	W48
	.byte		N32	, En3, v104
	.byte		N32	, Gn3
	.byte	W36
	.byte	W03
	.byte		N06	, Gn3, v032
	.byte	W09
	.byte		N44	, Dn3, v096
	.byte		N40	, Fn3
	.byte	W42
	.byte		N06	, Fn3, v032
	.byte	W18
	.byte		N05	, En3, v096
	.byte		N05	, Gn3, v092
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			Fn3, v096
	.byte		N05	, An3, v092
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Gn3, v096
	.byte		N05	, As3, v100
	.byte	W06
	.byte			As3, v032
	.byte	W06
	.byte		N40	, Fn3, v100
	.byte		N44	, An3, v096
	.byte	W48
	.byte		N40	, En3, v100
	.byte		N40	, Gn3, v104
	.byte	W42
	.byte		N05	, Gn3, v032
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 63
	.byte	VOL	, v054
	.byte	PAN	, c_v+17
	.byte	W96
	.byte		N28	, Dn3, v120
	.byte	W30
	.byte		N05	, Dn3, v032
	.byte	W06
	.byte		N03	, Dn2, v116
	.byte		N03	, An2
	.byte	W06
	.byte		N04	, An2, v096
	.byte		N04	, Dn3
	.byte	W06
	.byte		N44	, Dn3, v116
	.byte		N44	, An3
	.byte	W48
	.byte			En3, v127
	.byte		N44	, Gn3
	.byte	W48
	.byte			Cs3, v120
	.byte		N44	, En3
	.byte	W48
	.byte		N21	, Dn3, v112
	.byte		N21	, Fs3
	.byte	W24
	.byte		N19	, An2, v100
	.byte		N19	, Dn3
	.byte	W24
	.byte			Cs3, v112
	.byte		N19	, En3
	.byte	W24
	.byte		N18	, Dn3, v100
	.byte		N18	, Fs3
	.byte	W24
	.byte		N40	, En3
	.byte		N40	, Gn3
	.byte	W42
	.byte		N05	, Gn3, v032
	.byte	W06
	.byte		N17	, Fs3, v100
	.byte		N17	, An3
	.byte	W18
	.byte		N05	, An3, v032
	.byte	W06
	.byte		N17	, Gn3, v100
	.byte		N17	, Bn3
	.byte	W18
	.byte		N05	, Bn3, v032
	.byte	W06
	.byte		N68	, En3, v100
	.byte		N68	, An3
	.byte	W72
	.byte		N06	, An3, v032
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song065_3_2
	.byte	FINE

	@********************** Track  4 **********************@

	.global song065_4
song065_4:	@ 0x085719CD
	.byte	KEYSH	, 0
	.byte	VOICE	, 51
	.byte	VOL	, v054
	.byte	PAN	, c_v+25
	.byte		N80	, Dn2, v108
	.byte	W80
	.byte	W01
	.byte		N03	, Dn2, v032
	.byte	W03
	.byte		N02	, Dn2, v108
	.byte	W03
	.byte		N03	, Dn2, v032
	.byte	W03
	.byte		N02	, Dn2, v108
	.byte	W03
	.byte		N03	, Dn2, v032
	.byte	W03
song065_4_1:
	.byte		N92	, Dn2, v108
	.byte	W92
	.byte	W01
	.byte		N03	, Dn2, v032
	.byte	W03
	.byte	PEND
song065_4_2:
	.byte		N80	, Dn2, v108
	.byte	W80
	.byte	W01
	.byte		N03	, Dn2, v032
	.byte	W03
	.byte		N02	, Dn2, v108
	.byte	W03
	.byte		N03	, Dn2, v032
	.byte	W03
	.byte		N02	, Dn2, v108
	.byte	W03
	.byte		N03	, Dn2, v032
	.byte	W03
	.byte	PEND
	.byte	PATT	
		.word	song065_4_1
	.byte	PATT	
		.word	song065_4_2
	.byte	PATT	
		.word	song065_4_1
	.byte	PATT	
		.word	song065_4_2
	.byte	PATT	
		.word	song065_4_1
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 68
	.byte	VOL	, v042
	.byte	PAN	, c_v
	.byte	W96
	.byte	W24
	.byte		N23	, En3, v112
	.byte	W24
	.byte			Fs3, v108
	.byte	W24
	.byte			Gn3, v104
	.byte	W24
	.byte		N44	, An3, v108
	.byte	W48
	.byte		N06	, An3, v032
	.byte	W48
	.byte	W24
	.byte		N23	, Gn3, v116
	.byte	W24
	.byte			Fn3, v108
	.byte	W24
	.byte			En3, v116
	.byte	W24
song065_4_3:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 51
	.byte	VOL	, v054
	.byte	PAN	, c_v+25
	.byte	W96
	.byte	W24
	.byte		N23	, Fn2, v072
	.byte	W24
	.byte			As2, v068
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte		N32	
	.byte	W36
	.byte		N11	, Dn3
	.byte	W12
	.byte		N44	, En3, v072
	.byte	W48
	.byte		N32	, Dn3
	.byte	W36
	.byte		N05	, As2, v068
	.byte	W06
	.byte			Cn3, v072
	.byte	W06
	.byte		N23	, Dn3, v068
	.byte	W24
	.byte			As2
	.byte	W24
	.byte		N11	, An2, v072
	.byte	W12
	.byte		N05	, An2, v032
	.byte	W12
	.byte		N23	, An1, v072
	.byte	W24
	.byte			As1
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte		N92	, Dn2, v092
	.byte	W96
	.byte		N52	
	.byte	W54
	.byte		N05	, Dn2, v032
	.byte	W06
	.byte		N06	, Bn1, v092
	.byte	W06
	.byte			Cs2
	.byte	W06
	.byte		N21	, Dn2
	.byte	W24
	.byte		N92	
	.byte	W96
	.byte		N44	
	.byte	W48
	.byte		N11	, Dn2, v084
	.byte	W12
	.byte			An1, v076
	.byte	W12
	.byte			Dn2, v080
	.byte	W12
	.byte			Cn2, v084
	.byte	W12
	.byte		N80	, As1, v092
	.byte	W84
	.byte		N05	, Gn1
	.byte	W06
	.byte			An1
	.byte	W06
	.byte		N92	, As1
	.byte	W96
	.byte		N92	
	.byte	W96
	.byte		N44	
	.byte	W48
	.byte		N23	, Cn2
	.byte	W24
	.byte			As1
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 80
	.byte	VOL	, v034
	.byte	PAN	, c_v+26
	.byte	W96
	.byte		N05	, An3, v076
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			An2, v080
	.byte	W06
	.byte			An2, v032
	.byte	W06
	.byte			An3, v076
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			An2, v072
	.byte	W06
	.byte			An2, v032
	.byte	W06
	.byte			An3, v076
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			An2, v076
	.byte	W06
	.byte			An2, v032
	.byte	W06
	.byte			An3, v076
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			An2, v072
	.byte	W06
	.byte			An2, v032
	.byte	W06
	.byte			An3, v076
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			An2, v072
	.byte	W06
	.byte			An2, v032
	.byte	W06
	.byte			An3, v080
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			An2, v072
	.byte	W06
	.byte			An2, v032
	.byte	W06
	.byte			An3, v076
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			An2, v072
	.byte	W06
	.byte			An2, v032
	.byte	W06
	.byte			An3, v068
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			An2, v076
	.byte	W06
	.byte			An2, v032
	.byte	W06
	.byte			Bn2, v080
	.byte	W06
	.byte			Gn2, v084
	.byte	W06
	.byte			An2, v080
	.byte	W06
	.byte			Bn2, v084
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			An2
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Dn3, v080
	.byte	W06
	.byte			Bn2, v084
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Cs3, v080
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Fs3, v084
	.byte	W06
	.byte			Dn3, v080
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Fs3, v084
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			En3, v080
	.byte	W06
	.byte			Fs3, v084
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fs3, v080
	.byte	W06
	.byte			Gn3, v084
	.byte	W06
	.byte			An3
	.byte	W06
	.byte	GOTO	
		.word	song065_4_3
	.byte	FINE

	@********************** Track  5 **********************@

	.global song065_5
song065_5:	@ 0x08571B89
	.byte	KEYSH	, 0
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
	.byte	VOICE	, 50
	.byte	VOL	, v054
	.byte	PAN	, c_v-20
	.byte	W48
	.byte	W96
song065_5_1:
	.byte		N06	, An4, v108
	.byte	W06
	.byte			Fn4, v100
	.byte	W06
	.byte			Dn4, v104
	.byte	W06
	.byte			As3, v100
	.byte	W06
	.byte			An3, v096
	.byte	W06
	.byte			As3, v100
	.byte	W06
	.byte			Dn4, v104
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			Fn4, v100
	.byte	W06
	.byte			Dn4, v104
	.byte	W06
	.byte			As3, v088
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			As3, v092
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Fn4, v096
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song065_5_1
song065_5_2:
	.byte		N05	, Dn4, v112
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v108
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v104
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v104
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v112
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v104
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v104
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v104
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v104
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v112
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v104
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v104
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v104
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Dn4, v104
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			Fn3, v096
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			Fn3, v100
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			Dn4, v104
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			Fn3, v096
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			Dn4, v104
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			Fn3, v096
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte			En4, v032
	.byte	W06
	.byte			Gn3, v100
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte			En4, v032
	.byte	W06
	.byte			Gn3, v100
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte			En4, v032
	.byte	W06
	.byte			Gn3, v096
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			En4, v108
	.byte	W06
	.byte			En4, v032
	.byte	W06
	.byte			Gn3, v096
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			Fn3, v096
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			Dn4, v104
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			Fn3, v096
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			Fn3, v092
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			Fn3, v096
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			Fn3, v096
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			Fn3, v096
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte			En4, v032
	.byte	W06
	.byte			Gn3, v100
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte			En4, v032
	.byte	W06
	.byte			Gn3, v100
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte			Bn3, v092
	.byte	W04
	.byte			Cs4
	.byte	W04
	.byte			Dn4
	.byte	W04
	.byte			En4
	.byte	W04
	.byte			Fs4
	.byte	W04
	.byte		N04	, Gn4
	.byte	W04
	.byte		TIE	, An4, v052
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		N24	, Gn4
	.byte	W24
	.byte			En4
	.byte	W24
	.byte			Fs4
	.byte	W24
	.byte			Gn4
	.byte	W24
	.byte			An4
	.byte	W96
	.byte	W96
	.byte		N05	, En4, v112
	.byte	W06
	.byte			En4, v032
	.byte	W06
	.byte			An3, v108
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			En4, v108
	.byte	W06
	.byte			En4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			En4, v108
	.byte	W06
	.byte			En4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			En4, v108
	.byte	W06
	.byte			En4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			An4, v112
	.byte	W06
	.byte			An4, v032
	.byte	W06
	.byte			An3, v108
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			An4, v108
	.byte	W06
	.byte			An4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			An4, v108
	.byte	W06
	.byte			An4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			An4, v108
	.byte	W06
	.byte			An4, v032
	.byte	W06
	.byte			An3, v100
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte	GOTO	
		.word	song065_5_2
	.byte	FINE

	@********************** Track  6 **********************@

	.global song065_6
song065_6:	@ 0x08571DE5
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 63
	.byte	VOL	, v054
	.byte	PAN	, c_v+17
	.byte	W96
	.byte	W48
	.byte		N32	, En2, v116
	.byte	W36
	.byte		N05	, Dn2, v096
	.byte	W06
	.byte			En2, v112
	.byte	W06
	.byte		N88	, Fs2, v100
	.byte	W90
	.byte		N06	, Fs2, v032
	.byte	W06
	.byte	W24
	.byte		N21	, Fn2, v104
	.byte	W24
	.byte		N20	, Fn2, v100
	.byte		N20	, As2
	.byte	W24
	.byte		N17	, An2
	.byte		N17	, Cn3, v104
	.byte	W18
	.byte		N06	, Cn3, v032
	.byte	W06
	.byte		TIE	, As2, v104
	.byte		TIE	, Dn3
	.byte	W96
	.byte	W02
	.byte		EOT	, As2
	.byte	W01
	.byte			Dn3
	.byte	W03
	.byte		N06	, As2, v032
	.byte		N06	, Dn3
	.byte	W18
	.byte		N18	, Fs2, v100
	.byte	W24
	.byte		N16	, An2, v092
	.byte		N20	, Dn3, v100
	.byte	W24
	.byte		N16	, Cs3
	.byte		N18	, En3, v108
	.byte	W24
	.byte		N44	, En3, v096
	.byte		N44	, Gn3, v108
	.byte	W48
	.byte			Dn3, v096
	.byte		N44	, Fs3, v108
	.byte	W48
song065_6_1:
	.byte		N88	, An2, v108
	.byte	W90
	.byte		N06	, An2, v032
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song065_6_1
	.byte		N88	, As2, v108
	.byte	W90
	.byte		N06	, As2, v032
	.byte	W06
	.byte	W24
	.byte		N17	, Fn2, v108
	.byte		N17	, An2
	.byte	W18
	.byte		N06	, An2, v032
	.byte	W06
	.byte		N17	, Gn2, v108
	.byte		N17	, As2
	.byte	W18
	.byte		N06	, As2, v032
	.byte	W06
	.byte		N17	, An2, v108
	.byte		N17	, Cn3
	.byte	W18
	.byte		N06	, Cn3, v032
	.byte	W06
song065_6_5:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 46
	.byte	VOL	, v042
	.byte	PAN	, c_v+27
	.byte	W96
song065_6_2:
	.byte		N06	, Dn4, v116
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte	PEND
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte	PATT	
		.word	song065_6_2
	.byte		N06	, Dn4, v116
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			En3
	.byte	W06
song065_6_3:
	.byte		N06	, Dn4, v116
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn3, v112
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn4, v104
	.byte	W06
	.byte			As3, v108
	.byte	W06
	.byte			Fn3, v116
	.byte	W06
	.byte			Dn3, v120
	.byte	W06
	.byte			Dn4, v112
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Dn3, v116
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn3, v100
	.byte	W06
	.byte			Dn3, v096
	.byte	W06
	.byte	PEND
	.byte			En4, v116
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Gn3, v112
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			En4, v104
	.byte	W06
	.byte			As3, v108
	.byte	W06
	.byte			Gn3, v116
	.byte	W06
	.byte			En3, v120
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			En3, v116
	.byte	W06
	.byte			En4, v108
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Gn3, v100
	.byte	W06
	.byte			En3, v096
	.byte	W06
	.byte	PATT	
		.word	song065_6_3
	.byte		N06	, Dn4, v112
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Dn3, v116
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn3, v100
	.byte	W06
	.byte			Dn3, v096
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			En3, v116
	.byte	W06
	.byte			En4, v108
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Gn3, v100
	.byte	W06
	.byte			En3, v096
	.byte	W06
song065_6_4:
	.byte		N06	, Fs4, v108
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte	PEND
	.byte			Gn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte	PATT	
		.word	song065_6_4
	.byte		N06	, Gn4, v108
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song065_6_5
	.byte	FINE

	@********************** Track  7 **********************@

	.global song065_7
song065_7:	@ 0x08571FF5
	.byte	KEYSH	, 0
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
	.byte	VOICE	, 127
	.byte	VOL	, v054
	.byte	PAN	, c_v
	.byte	W96
	.byte	VOL	, v013
	.byte		TIE	, Ds1, v096
	.byte	W24
	.byte	W01
	.byte	VOL	, v013
	.byte	W06
	.byte		v014
	.byte	W04
	.byte		v014
	.byte	W06
	.byte		v014
	.byte	W04
	.byte		v015
	.byte	W05
	.byte		v015
	.byte	W04
	.byte		v016
	.byte	W03
	.byte		v016
	.byte	W03
	.byte		v017
	.byte	W04
	.byte		v017
	.byte	W03
	.byte		v017
	.byte	W03
	.byte		v018
	.byte	W04
	.byte		v018
	.byte	W02
	.byte		v019
	.byte	W03
	.byte		v019
	.byte	W03
	.byte		v019
	.byte	W01
	.byte		v020
	.byte	W03
	.byte		v020
	.byte	W02
	.byte		v021
	.byte	W02
	.byte		v021
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v023
	.byte	W01
	.byte		v023
	.byte	W03
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W02
	.byte		v026
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W02
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v051
	.byte	W02
	.byte		v054
	.byte	W14
	.byte		EOT	
	.byte	W03
	.byte		N05	, Dn1, v100
	.byte	W06
	.byte			Dn1, v116
	.byte	W06
	.byte			Dn1, v092
	.byte	W06
	.byte			Dn1, v100
	.byte	W06
song065_7_4:
	.byte		N36	, An2, v096
	.byte	W36
	.byte		N11	, Ds1, v100
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W36
	.byte		N05	
	.byte	W06
	.byte			Dn1, v092
	.byte	W06
	.byte		N06	, Dn1, v120
	.byte	W12
	.byte			Dn1, v092
	.byte	W24
	.byte		N11	, Ds1, v104
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W12
	.byte			Dn1, v120
	.byte	W24
	.byte		N05	, Dn1, v100
	.byte	W06
	.byte			Dn1, v112
	.byte	W06
song065_7_1:
	.byte		N06	, Dn1, v120
	.byte	W36
	.byte		N11	, Ds1, v100
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W36
	.byte		N05	
	.byte	W06
	.byte			Dn1, v092
	.byte	W06
	.byte	PEND
	.byte		N06	, Dn1, v120
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N11	, Ds1, v104
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W12
	.byte			Dn1, v120
	.byte	W12
	.byte		N05	, Dn1, v092
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Dn1, v100
	.byte	W06
	.byte			Dn1, v112
	.byte	W06
	.byte	PATT	
		.word	song065_7_1
	.byte		N06	, Dn1, v120
	.byte	W12
	.byte			Dn1, v092
	.byte	W24
	.byte		N11	, Ds1, v104
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W12
	.byte			Dn1, v120
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte		N05	, Dn1, v100
	.byte	W06
	.byte			Dn1, v112
	.byte	W06
	.byte	PATT	
		.word	song065_7_1
	.byte		N06	, Dn1, v120
	.byte	W24
	.byte			Dn1, v092
	.byte	W12
	.byte		N11	, Ds1, v104
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W12
	.byte			Dn1, v120
	.byte	W12
	.byte			Dn1, v092
	.byte	W06
	.byte		N05	, Dn1, v100
	.byte	W06
	.byte		N11	, Ds1, v112
	.byte	W12
	.byte		N36	, An2, v096
	.byte	W36
	.byte		N11	, Ds1, v100
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W06
	.byte			Dn1, v092
	.byte	W06
song065_7_2:
	.byte		N06	, Dn1, v120
	.byte	W12
	.byte			Dn1, v084
	.byte	W24
	.byte		N11	, Ds1, v104
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W12
	.byte			Dn1, v120
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte		N05	, Dn1, v100
	.byte	W06
	.byte			Dn1, v112
	.byte	W06
	.byte	PEND
song065_7_3:
	.byte		N06	, Dn1, v120
	.byte	W12
	.byte			Dn1, v084
	.byte	W24
	.byte		N11	, Ds1, v100
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W06
	.byte			Dn1, v092
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song065_7_2
	.byte	PATT	
		.word	song065_7_3
	.byte		N06	, Dn1, v120
	.byte	W12
	.byte			Dn1, v084
	.byte	W24
	.byte		N11	, Ds1, v104
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W12
	.byte			Dn1, v120
	.byte	W12
	.byte		N05	, Dn1, v084
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Dn1, v100
	.byte	W06
	.byte			Dn1, v112
	.byte	W06
	.byte	PATT	
		.word	song065_7_3
	.byte		N06	, Dn1, v120
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N11	, Ds1, v104
	.byte	W12
	.byte		N06	, Dn1, v084
	.byte	W12
	.byte		N05	, Dn1, v120
	.byte	W06
	.byte			Dn1, v112
	.byte	W06
	.byte		N23	, Ds1, v104
	.byte	W24
	.byte		N36	, An2, v096
	.byte	W84
	.byte		N11	, Ds1, v104
	.byte	W12
	.byte		N06	, Dn1, v092
	.byte	W12
	.byte		N06	
	.byte	W60
	.byte		N05	, Dn1, v104
	.byte	W06
	.byte			Dn1, v092
	.byte	W06
	.byte		N11	, Ds1, v096
	.byte	W12
	.byte		N06	, Dn1, v112
	.byte	W12
	.byte		N06	
	.byte	W72
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W48
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N36	, An2, v096
	.byte	W36
	.byte		N06	, Dn1, v112
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N11	, Ds1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N11	, Ds1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N11	, Ds1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte			Dn1, v116
	.byte	W06
	.byte		N11	, Ds1, v127
	.byte	W12
	.byte	GOTO	
		.word	song065_7_4
	.byte	FINE

	.align 2
	.global song065
song065:	@ 0x08572248
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup025		@ voicegroup/tone

	.word	song065_1		@ track
	.word	song065_2		@ track
	.word	song065_3		@ track
	.word	song065_4		@ track
	.word	song065_5		@ track
	.word	song065_6		@ track
	.word	song065_7		@ track
