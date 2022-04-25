	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song059_1
song059_1:	@ 0x0856F344
	.byte	KEYSH	, 0
	.byte	TEMPO	, 58
	.byte	VOICE	, 61
	.byte	VOL	, v044
	.byte	PAN	, c_v-5
	.byte		N80	, Bn2, v088
	.byte		N80	, Fs3, v100
	.byte	W84
	.byte		N06	, Fs2, v088
	.byte		N06	, Bn2, v100
	.byte	W06
	.byte			Bn2, v080
	.byte		N06	, Fs3, v096
	.byte	W06
	.byte		N66	, Fs3, v080
	.byte		N66	, Bn3, v092
	.byte	W66
	.byte		N06	, Bn3, v020
	.byte	W06
	.byte		N24	, Bn2, v088
	.byte		N24	, En3, v100
	.byte	W24
song059_1_1:
	.byte		N42	, Cs3, v088
	.byte		N42	, Fs3, v100
	.byte	W42
	.byte		N06	, Fs3, v020
	.byte	W06
	.byte		N42	, Fs3, v076
	.byte		N42	, Bn3, v092
	.byte	W42
	.byte		N06	, Bn3, v020
	.byte	W06
	.byte		N42	, En3, v080
	.byte		N42	, An3, v096
	.byte	W42
	.byte		N06	, An3, v020
	.byte	W06
	.byte		N42	, Cs3, v088
	.byte		N42	, Fs3, v100
	.byte	W42
	.byte		N06	, Fs3, v020
	.byte	W06
	.byte		N72	, Bn2, v088
	.byte		N72	, Gs3, v100
	.byte	W72
	.byte		N06	, Gs3, v020
	.byte	W12
	.byte		N05	, Bn2, v088
	.byte		N05	, Fs3, v100
	.byte	W06
	.byte			Cs3, v088
	.byte		N05	, Gs3, v100
	.byte	W06
	.byte		N36	, Dn3, v084
	.byte		N36	, An3, v096
	.byte	W36
	.byte		N05	, En3, v088
	.byte		N05	, Gs3, v100
	.byte	W06
	.byte			Fs3, v084
	.byte		N05	, An3, v096
	.byte	W06
	.byte		N36	, Gs3, v080
	.byte		N36	, Bn3, v088
	.byte	W36
	.byte		N06	, Bn3, v020
	.byte	W12
	.byte		N18	, An3, v080
	.byte		N18	, Cs4, v088
	.byte	W18
	.byte		N06	, Cs4, v020
	.byte	W06
	.byte		N18	, En3, v080
	.byte		N18	, An3, v088
	.byte	W18
	.byte		N06	, An3, v020
	.byte	W06
	.byte		N18	, Cs3, v088
	.byte		N18	, En3, v100
	.byte	W18
	.byte		N06	, En3, v020
	.byte	W06
	.byte		N18	, Fs2, v088
	.byte		N18	, Bn2, v100
	.byte	W24
	.byte		N72	, Fs3, v080
	.byte		N72	, Bn3, v088
	.byte	W72
	.byte		N06	, Bn3, v020
	.byte	W24
	.byte		N80	, Bn2, v080
	.byte		N80	, Fs3, v096
	.byte	W84
	.byte		N06	, Fs2, v080
	.byte		N06	, Bn2, v096
	.byte	W06
	.byte			Bn2, v076
	.byte		N06	, Fs3, v092
	.byte	W06
	.byte		N66	, Fs3, v068
	.byte		N66	, Bn3, v080
	.byte	W72
	.byte		N24	, Bn2, v076
	.byte		N24	, En3, v092
	.byte	W24
	.byte	GOTO	
		.word	song059_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song059_2
song059_2:	@ 0x0856F432
	.byte	KEYSH	, 0
	.byte	VOICE	, 33
	.byte	VOL	, v048
	.byte	PAN	, c_v
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
song059_2_1:
	.byte		N06	, En2, v127
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
song059_2_2:
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
	.byte	PATT	
		.word	song059_2_1
	.byte	PATT	
		.word	song059_2_2
song059_2_3:
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
	.byte	PEND
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
	.byte	PATT	
		.word	song059_2_3
	.byte	PATT	
		.word	song059_2_2
	.byte	PATT	
		.word	song059_2_1
	.byte	GOTO	
		.word	song059_2_2
	.byte	FINE

	@********************** Track  3 **********************@

	.global song059_3
song059_3:	@ 0x0856F4A4
	.byte	KEYSH	, 0
	.byte	VOICE	, 49
	.byte	VOL	, v056
	.byte	PAN	, c_v+24
	.byte		N06	, Fs2, v080
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v020
	.byte	W06
	.byte			Fs2, v080
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v020
	.byte	W30
	.byte			Fs2, v080
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v020
	.byte	W06
	.byte			Fs2, v080
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v020
	.byte	W30
song059_3_1:
	.byte		N06	, Fs2, v080
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v020
	.byte	W06
	.byte			Fs2, v080
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v020
	.byte	W30
	.byte			Fs2, v080
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v020
	.byte	W06
	.byte			Fs2, v080
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v020
	.byte	W18
	.byte			Fs2, v080
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v020
	.byte	W06
	.byte	PEND
song059_3_2:
	.byte		N06	, Fs2, v080
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v020
	.byte	W06
	.byte			Fs2, v080
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v020
	.byte	W30
	.byte			Fs2, v080
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v020
	.byte	W06
	.byte			Fs2, v080
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v020
	.byte	W30
	.byte			An2, v080
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v020
	.byte	W06
	.byte			An2, v080
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v020
	.byte	W30
	.byte			An2, v080
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v020
	.byte	W06
	.byte			An2, v080
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v020
	.byte	W18
	.byte			An2, v080
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v020
	.byte	W06
	.byte			Fs2, v080
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v020
	.byte	W06
	.byte			Fs2, v080
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v020
	.byte	W30
	.byte			Fs2, v080
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v020
	.byte	W06
	.byte			Fs2, v080
	.byte		N06	, Bn2
	.byte	W06
	.byte			Bn2, v020
	.byte	W30
	.byte	PATT	
		.word	song059_3_1
	.byte		N06	, An2, v080
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v020
	.byte	W06
	.byte			An2, v080
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v020
	.byte	W30
	.byte			An2, v080
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v020
	.byte	W06
	.byte			An2, v080
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v020
	.byte	W30
	.byte			An2, v080
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v020
	.byte	W06
	.byte			An2, v080
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v020
	.byte	W18
	.byte			An2, v080
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v020
	.byte	W06
	.byte			Dn3, v080
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v020
	.byte	W06
	.byte			Dn3, v080
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v020
	.byte	W18
	.byte			Dn3, v080
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v020
	.byte	W06
	.byte			Fs2, v080
	.byte		N06	, Bn2
	.byte	W12
	.byte			Fs2
	.byte		N06	, Bn2
	.byte	W36
	.byte			Fs2
	.byte		N06	, Bn2
	.byte	W12
	.byte			Fs2
	.byte		N06	, Bn2
	.byte	W36
	.byte			Fs2
	.byte		N06	, Bn2
	.byte	W12
	.byte			Fs2
	.byte		N06	, Bn2
	.byte	W36
	.byte			Fs2
	.byte		N06	, Bn2
	.byte	W12
	.byte			Fs2
	.byte		N06	, Bn2
	.byte	W24
	.byte			Fs2
	.byte		N06	, Bn2
	.byte	W12
	.byte	GOTO	
		.word	song059_3_2
	.byte	FINE

	@********************** Track  4 **********************@

	.global song059_4
song059_4:	@ 0x0856F5E1
	.byte	KEYSH	, 0
	.byte	VOICE	, 48
	.byte	VOL	, v029
	.byte	PAN	, c_v-25
	.byte	W44
	.byte	W03
	.byte	VOL	, v029
	.byte	W01
	.byte		N84	, Bn2, v080
	.byte	W02
	.byte	VOL	, v029
	.byte	W01
	.byte		v030
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
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W02
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W02
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W24
	.byte		N06	, Fs2
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte		N42	, Fs3
	.byte	W42
	.byte		N06	, Fs3, v020
	.byte	W06
song059_4_1:
	.byte		N42	, En3, v080
	.byte	W48
	.byte			Ds3
	.byte	W42
	.byte		N06	, Ds3, v020
	.byte	W06
	.byte		N42	, Cs3, v080
	.byte	W42
	.byte		N06	, Cs3, v020
	.byte	W06
	.byte		N42	, En3, v080
	.byte	W42
	.byte		N06	, En3, v020
	.byte	W06
	.byte		N42	, En3, v080
	.byte	W42
	.byte		N06	, En3, v020
	.byte	W54
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOL	, v029
	.byte	W44
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v030
	.byte		N84	, Bn2, v080
	.byte	W01
	.byte	VOL	, v030
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
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W02
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W02
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W02
	.byte		v050
	.byte	W24
	.byte		N06	, Fs2
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte		N42	, Fs3
	.byte	W48
	.byte	GOTO	
		.word	song059_4_1
	.byte	FINE

	@********************** Track  5 **********************@

	.global song059_5
song059_5:	@ 0x0856F6FC
	.byte	KEYSH	, 0
	.byte	VOICE	, 68
	.byte	VOL	, v056
	.byte	PAN	, c_v-15
	.byte	W96
	.byte	W96
song059_5_1:
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N24	, Bn2, v080
	.byte	W24
	.byte			Cs3
	.byte	W24
	.byte		N84	, Dn3
	.byte	W84
	.byte		N06	, Cs3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N84	, En3
	.byte	W84
	.byte		N06	, En3, v020
	.byte	W12
	.byte	W24
	.byte		N24	, Bn2, v080
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte		N12	, Fs3
	.byte	W12
	.byte			An3
	.byte	W12
	.byte		N96	, Gs3
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song059_5_1
	.byte	FINE

	@********************** Track  6 **********************@

	.global song059_6
song059_6:	@ 0x0856F734
	.byte	KEYSH	, 0
	.byte	VOICE	, 51
	.byte	VOL	, v056
	.byte	PAN	, c_v+9
	.byte		N05	, En2, v112
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v080
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v072
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v092
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v112
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v084
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v112
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v072
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v092
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v072
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
song059_6_2:
	.byte		N05	, En2, v116
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v084
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v100
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v068
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v112
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v080
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v084
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v064
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v072
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v084
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v080
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v072
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v080
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v092
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v072
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v072
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			Dn2, v116
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v084
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v072
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v076
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v092
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v076
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v072
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v076
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v072
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v080
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v092
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v072
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			Dn2, v100
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v080
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v068
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v068
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v076
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v072
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v068
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
	.byte			Dn2, v072
	.byte	W06
	.byte			Dn2, v020
	.byte	W06
song059_6_1:
	.byte		N05	, En2, v100
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v080
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v068
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v068
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v076
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v072
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v068
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte			En2, v072
	.byte	W06
	.byte			En2, v020
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song059_6_1
	.byte	GOTO	
		.word	song059_6_2
	.byte	FINE

	.align 2
	.global song059
song059:	@ 0x0856F8FC
	.byte	6		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup023		@ voicegroup/tone

	.word	song059_1		@ track
	.word	song059_2		@ track
	.word	song059_3		@ track
	.word	song059_4		@ track
	.word	song059_5		@ track
	.word	song059_6		@ track
