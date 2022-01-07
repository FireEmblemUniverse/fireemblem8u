	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song056_1
song056_1:	@ 0x0856E224
	.byte	KEYSH	, 0
song056_1_1:
	.byte	TEMPO	, 40
	.byte	VOICE	, 56
	.byte	VOL	, v052
	.byte	PAN	, c_v-25
	.byte	W96
	.byte	W96
	.byte	TEMPO	, 64
	.byte		N07	, Bn2, v100
	.byte	W08
	.byte			Fs2, v096
	.byte	W08
	.byte			Bn2, v092
	.byte	W08
	.byte			Ds3, v100
	.byte	W08
	.byte			Bn2, v092
	.byte	W08
	.byte			Ds3
	.byte	W08
	.byte			Fs3, v104
	.byte	W08
	.byte			Ds3, v096
	.byte	W08
	.byte			Fs3
	.byte	W08
	.byte			Bn3, v104
	.byte	W08
	.byte			Fs3, v096
	.byte	W08
	.byte			Bn3
	.byte	W08
	.byte		N23	, Ds4, v100
	.byte	W24
	.byte		N05	, Ds4, v104
	.byte	W08
	.byte			Ds4, v092
	.byte	W08
	.byte		N05	
	.byte	W08
	.byte		N07	, Ds4, v096
	.byte	W08
	.byte			Ds4, v028
	.byte	W16
	.byte		N15	, Ds4, v100
	.byte	W24
	.byte		N42	, En3, v104
	.byte	W48
	.byte			Bn3
	.byte	W48
	.byte			An3
	.byte	W48
	.byte		N18	, Gs3, v100
	.byte	W24
	.byte			Fs3, v104
	.byte	W24
	.byte		N42	, Gs3, v100
	.byte	W48
	.byte		TIE	, En3, v104
	.byte	W48
	.byte	W84
	.byte		EOT	
	.byte		N07	, En3, v028
	.byte	W12
	.byte		N42	, En3, v100
	.byte	W48
	.byte			Bn3, v096
	.byte	W48
	.byte			An3, v100
	.byte	W48
	.byte		N15	, Gs3, v104
	.byte	W16
	.byte			Fs3
	.byte	W16
	.byte			En3
	.byte	W16
	.byte		N42	, Fs3, v096
	.byte	W48
	.byte		N72	, Dn3, v100
	.byte	W48
	.byte	W24
	.byte		N07	, Dn3, v028
	.byte	W08
	.byte		N05	, An2, v104
	.byte	W08
	.byte			Dn3
	.byte	W08
	.byte			Fs3
	.byte	W08
	.byte			Dn3
	.byte	W08
	.byte			Fs3, v100
	.byte	W08
	.byte			An3, v104
	.byte	W08
	.byte			Fs3
	.byte	W08
	.byte			An3, v100
	.byte	W08
	.byte		N23	, Bn3
	.byte	W24
	.byte		N05	, Bn3, v096
	.byte	W08
	.byte			Cs4
	.byte	W08
	.byte			Dn4, v092
	.byte	W08
	.byte		N07	, Cs4
	.byte	W08
	.byte			Cs4, v028
	.byte	W16
	.byte			An3, v096
	.byte	W08
	.byte			An3, v028
	.byte	W16
	.byte		N84	, Bn3, v092
	.byte	W88
	.byte		N07	, Bn3, v028
	.byte	W08
	.byte		N23	, Bn3, v100
	.byte	W24
	.byte		N05	
	.byte	W08
	.byte			Cs4, v096
	.byte	W08
	.byte			Dn4, v092
	.byte	W08
	.byte		N07	, Cs4
	.byte	W08
	.byte			Cs4, v028
	.byte	W16
	.byte			An3, v100
	.byte	W08
	.byte			An3, v028
	.byte	W16
	.byte		N66	, Bn3, v104
	.byte	W24
	.byte	TEMPO	, 63
	.byte	W06
	.byte	TEMPO	, 62
	.byte	W06
	.byte	TEMPO	, 60
	.byte	W06
	.byte	TEMPO	, 58
	.byte	W06
	.byte	TEMPO	, 56
	.byte	W06
	.byte	TEMPO	, 55
	.byte	W06
	.byte	TEMPO	, 53
	.byte	W06
	.byte	TEMPO	, 52
	.byte	W06
	.byte	TEMPO	, 51
	.byte		N05	
	.byte	W06
	.byte	TEMPO	, 50
	.byte	W02
	.byte			Bn3, v100
	.byte	W04
	.byte	TEMPO	, 48
	.byte	W04
	.byte			Bn3, v096
	.byte	W02
	.byte	TEMPO	, 48
	.byte	W06
	.byte	TEMPO	, 48
	.byte		N84	, Bn3, v104
	.byte	W88
	.byte		N07	, Bn3, v028
	.byte	W08
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song056_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song056_2
song056_2:	@ 0x0856E336
	.byte	KEYSH	, 0
song056_2_1:
	.byte	W48
	.byte	VOICE	, 62
	.byte	VOL	, v048
	.byte	PAN	, c_v+25
	.byte	W48
	.byte	W96
	.byte		N07	, Fs2, v104
	.byte	W08
	.byte			Ds2, v092
	.byte	W08
	.byte			Fs2
	.byte	W08
	.byte			Bn2, v100
	.byte	W08
	.byte			Fs2, v092
	.byte	W08
	.byte			Bn2, v096
	.byte	W08
	.byte			Ds3, v100
	.byte	W08
	.byte			Bn2, v092
	.byte	W08
	.byte			Ds3, v088
	.byte	W08
	.byte			Fs3, v100
	.byte	W08
	.byte			Ds3, v092
	.byte	W08
	.byte			Fs3
	.byte	W08
	.byte		N23	, Bn3, v080
	.byte	W24
	.byte		N05	, Bn3, v084
	.byte	W08
	.byte			Bn3, v080
	.byte	W08
	.byte			Bn3, v076
	.byte	W08
	.byte		N07	, Bn3, v084
	.byte	W08
	.byte			Bn3, v028
	.byte	W16
	.byte		N15	, Bn3, v084
	.byte	W16
	.byte		N07	, Bn3, v028
	.byte	W08
	.byte			Bn2, v092
	.byte		N07	, En3, v088
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte		N23	, Bn2, v104
	.byte		N23	, En3, v100
	.byte	W24
	.byte		N07	, Bn2, v088
	.byte		N07	, En3
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte		N23	, Bn2, v100
	.byte		N23	, En3, v104
	.byte	W24
	.byte		N07	, Bn2, v088
	.byte		N07	, En3, v092
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte		N23	, Bn2, v104
	.byte		N23	, En3, v100
	.byte	W24
	.byte		N07	, Bn2, v084
	.byte		N07	, En3, v092
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte		N23	, Bn2, v104
	.byte		N23	, En3, v096
	.byte	W24
	.byte		N07	, An2, v092
	.byte		N07	, Dn3
	.byte	W08
	.byte			Dn3, v028
	.byte	W16
	.byte		N23	, An2, v100
	.byte		N23	, Dn3, v104
	.byte	W24
	.byte		N07	, An2, v088
	.byte		N07	, Dn3
	.byte	W08
	.byte			Dn3, v028
	.byte	W16
	.byte		N23	, An2, v100
	.byte		N23	, Dn3, v104
	.byte	W24
	.byte		N07	, An2, v088
	.byte		N07	, Dn3
	.byte	W08
	.byte			Dn3, v028
	.byte	W16
	.byte		N19	, An2, v100
	.byte		N19	, Dn3, v104
	.byte	W24
	.byte			En2, v096
	.byte		N19	, An2, v100
	.byte	W24
	.byte		N19	
	.byte		N19	, Dn3, v096
	.byte	W24
	.byte		N07	, Bn2, v084
	.byte		N07	, En3, v092
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte		N23	, Bn2, v100
	.byte		N23	, En3
	.byte	W24
	.byte		N07	, Bn2, v088
	.byte		N07	, En3, v092
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte		N23	, Bn2, v104
	.byte		N23	, En3, v096
	.byte	W24
	.byte		N07	, Bn2, v088
	.byte		N07	, En3
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte		N23	, Bn2, v096
	.byte		N23	, En3, v104
	.byte	W24
	.byte		N07	, Bn2, v088
	.byte		N07	, En3, v084
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte		N23	, Bn2, v104
	.byte		N23	, En3
	.byte	W24
	.byte		N07	, An2, v092
	.byte		N07	, Dn3, v084
	.byte	W08
	.byte			Dn3, v028
	.byte	W16
	.byte		N23	, An2, v104
	.byte		N23	, Dn3
	.byte	W24
	.byte		N07	, An2, v088
	.byte		N07	, Dn3, v092
	.byte	W08
	.byte			Dn3, v028
	.byte	W16
	.byte		N23	, An2, v104
	.byte		N23	, Dn3
	.byte	W24
	.byte		N07	, An2, v092
	.byte		N07	, Dn3, v088
	.byte	W08
	.byte			Dn3, v028
	.byte	W16
	.byte		N19	, An2, v100
	.byte		N19	, Dn3
	.byte	W24
	.byte			En2, v104
	.byte		N19	, An2, v100
	.byte	W24
	.byte			An2, v096
	.byte		N19	, Dn3
	.byte	W24
	.byte		N36	, Dn3, v084
	.byte		N36	, Gn3, v088
	.byte	W40
	.byte		N07	, Gn3, v028
	.byte	W08
	.byte		N36	, En3, v080
	.byte		N36	, An3, v084
	.byte	W40
	.byte		N07	, An3, v028
	.byte	W08
	.byte		N84	, Bn2, v080
	.byte		N84	, En3, v084
	.byte	W88
	.byte		N07	, En3, v028
	.byte	W08
	.byte		N36	, Dn3, v084
	.byte		N36	, Gn3, v080
	.byte	W40
	.byte		N07	, Gn3, v028
	.byte	W08
	.byte		N36	, En3, v080
	.byte		N36	, An3, v084
	.byte	W40
	.byte		N07	, An3, v028
	.byte	W08
	.byte		N66	, Ds3, v080
	.byte		N66	, Fs3
	.byte	W72
	.byte		N05	, Ds3
	.byte		N05	, Fs3
	.byte	W08
	.byte			Ds3, v072
	.byte		N05	, Fs3
	.byte	W08
	.byte			Ds3, v068
	.byte		N05	, Fs3, v072
	.byte	W08
	.byte		N84	, Ds3, v084
	.byte		N84	, Fs3
	.byte	W88
	.byte		N07	, Fs3, v028
	.byte	W08
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song056_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song056_3
song056_3:	@ 0x0856E4D9
	.byte	KEYSH	, 0
song056_3_1:
	.byte	W96
	.byte	VOICE	, 58
	.byte	VOL	, v052
	.byte	PAN	, c_v
	.byte	W96
	.byte		N84	, Bn1, v124
	.byte	W88
	.byte		N07	, Bn1, v028
	.byte	W08
	.byte		N23	, Bn1, v120
	.byte	W24
	.byte		N03	, Bn1, v127
	.byte	W08
	.byte			Bn1, v112
	.byte	W08
	.byte		N03	
	.byte	W08
	.byte		N07	, Bn1, v124
	.byte	W08
	.byte			Bn1, v028
	.byte	W16
	.byte		N15	, Bn1, v124
	.byte	W16
	.byte		N07	, Bn1, v028
	.byte	W08
	.byte			En2, v124
	.byte	W08
	.byte			En2, v028
	.byte	W16
	.byte		N03	, En2, v127
	.byte	W08
	.byte			En2, v100
	.byte	W08
	.byte			En2, v108
	.byte	W08
	.byte		N07	, En2, v124
	.byte	W08
	.byte			En2, v028
	.byte	W16
	.byte		N15	, En2, v120
	.byte	W16
	.byte		N07	, En2, v028
	.byte	W08
	.byte			En2, v124
	.byte	W08
	.byte			En2, v028
	.byte	W16
	.byte		N03	, En2, v124
	.byte	W08
	.byte			En2, v104
	.byte	W08
	.byte		N03	
	.byte	W08
	.byte		N07	, En2, v124
	.byte	W08
	.byte			En2, v028
	.byte	W16
	.byte		N15	, En2, v124
	.byte	W16
	.byte		N07	, En2, v028
	.byte	W08
	.byte			Dn2, v124
	.byte	W08
	.byte			Dn2, v028
	.byte	W16
	.byte		N03	, Dn2, v124
	.byte	W08
	.byte			Dn2, v120
	.byte	W08
	.byte			Dn2, v112
	.byte	W08
	.byte		N07	, Dn2, v124
	.byte	W08
	.byte			Dn2, v028
	.byte	W16
	.byte		N15	, Dn2, v127
	.byte	W16
	.byte		N07	, Dn2, v028
	.byte	W08
	.byte		N03	, Dn2, v120
	.byte	W08
	.byte			Dn2, v112
	.byte	W08
	.byte			Dn2, v108
	.byte	W08
	.byte		N07	, Dn2, v124
	.byte	W08
	.byte			Dn2, v028
	.byte	W16
	.byte			An1, v127
	.byte	W08
	.byte			An1, v028
	.byte	W16
	.byte		N15	, Dn2, v127
	.byte	W16
	.byte		N07	, Dn2, v028
	.byte	W08
	.byte			En2, v124
	.byte	W08
	.byte			En2, v028
	.byte	W16
	.byte		N03	, En2, v120
	.byte	W08
	.byte			En2, v112
	.byte	W08
	.byte		N03	
	.byte	W08
	.byte		N07	, En2, v127
	.byte	W08
	.byte			En2, v028
	.byte	W16
	.byte		N03	, En2, v120
	.byte	W08
	.byte			En2, v112
	.byte	W08
	.byte		N03	
	.byte	W08
	.byte		N07	, En2, v120
	.byte	W08
	.byte			En2, v028
	.byte	W16
	.byte		N03	, En2, v127
	.byte	W08
	.byte			En2, v116
	.byte	W08
	.byte			En2, v112
	.byte	W08
	.byte		N07	, En2, v127
	.byte	W08
	.byte			En2, v028
	.byte	W16
	.byte		N03	, En2, v127
	.byte	W08
	.byte			En2, v116
	.byte	W08
	.byte			En2, v112
	.byte	W08
	.byte		N07	, Dn2, v124
	.byte	W08
	.byte			Dn2, v028
	.byte	W16
	.byte		N03	, Dn2, v124
	.byte	W08
	.byte			Dn2, v116
	.byte	W08
	.byte			Dn2, v112
	.byte	W08
	.byte		N07	, Dn2, v120
	.byte	W08
	.byte			Dn2, v028
	.byte	W16
	.byte		N03	, Dn2, v124
	.byte	W08
	.byte			Dn2, v116
	.byte	W08
	.byte			Dn2, v112
	.byte	W08
	.byte			Dn2, v124
	.byte	W08
	.byte			Dn2, v112
	.byte	W08
	.byte			Dn2, v116
	.byte	W08
	.byte		N07	, Dn2, v124
	.byte	W08
	.byte			Dn2, v028
	.byte	W16
	.byte			An1, v127
	.byte	W08
	.byte			An1, v028
	.byte	W16
	.byte		N15	, Dn2, v127
	.byte	W24
	.byte		N36	, Gn2
	.byte	W40
	.byte		N07	, Gn2, v028
	.byte	W08
	.byte		N36	, An2, v120
	.byte	W40
	.byte		N07	, An2, v028
	.byte	W08
	.byte		N23	, En2, v127
	.byte	W24
	.byte		N03	, En2, v124
	.byte	W08
	.byte			En2, v112
	.byte	W08
	.byte		N03	
	.byte	W08
	.byte		N15	, Bn1, v124
	.byte	W16
	.byte		N07	, Bn1, v028
	.byte	W08
	.byte		N15	, En2, v127
	.byte	W16
	.byte		N07	, En2, v028
	.byte	W08
	.byte		N36	, Gn2, v124
	.byte	W40
	.byte		N07	, Gn2, v028
	.byte	W08
	.byte		N36	, An2, v127
	.byte	W40
	.byte		N07	, An2, v028
	.byte	W08
	.byte		N23	, Bn2, v124
	.byte	W24
	.byte		N03	
	.byte	W08
	.byte			Bn2, v112
	.byte	W08
	.byte		N03	
	.byte	W08
	.byte			Bn2, v124
	.byte	W08
	.byte			Bn2, v112
	.byte	W08
	.byte		N03	
	.byte	W08
	.byte			Bn2, v124
	.byte	W08
	.byte			Bn2, v112
	.byte	W08
	.byte			Bn2, v108
	.byte	W08
	.byte		N84	, Bn2, v124
	.byte	W88
	.byte		N07	, Bn2, v028
	.byte	W08
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song056_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song056_4
song056_4:	@ 0x0856E667
	.byte	KEYSH	, 0
song056_4_2:
	.byte	VOICE	, 126
	.byte	VOL	, v000
	.byte	PAN	, c_v
	.byte		TIE	, Cn3, v116
	.byte	W06
	.byte	VOL	, v000
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v020
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
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
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
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v041
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
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v056
	.byte	W10
	.byte	W96
	.byte	W96
	.byte	W24
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
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
	.byte		v027
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
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		EOT	
	.byte	VOL	, v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte	PAN	, c_v+30
	.byte	VOL	, v032
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		N15	
	.byte	W48
	.byte		N15	
	.byte	W24
song056_4_1:
	.byte	W24
	.byte		N15	, Cn3, v116
	.byte	W48
	.byte		N15	
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song056_4_1
	.byte	PATT	
		.word	song056_4_1
	.byte	PATT	
		.word	song056_4_1
	.byte	PATT	
		.word	song056_4_1
	.byte	PATT	
		.word	song056_4_1
	.byte	PATT	
		.word	song056_4_1
	.byte	PATT	
		.word	song056_4_1
	.byte	PATT	
		.word	song056_4_1
	.byte	PATT	
		.word	song056_4_1
	.byte	PATT	
		.word	song056_4_1
	.byte	PAN	, c_v
	.byte	W24
	.byte		TIE	, Cn3, v116
	.byte	W19
	.byte	VOL	, v056
	.byte	W04
	.byte		v055
	.byte	W01
	.byte		v055
	.byte	W02
	.byte		v054
	.byte	W02
	.byte		v054
	.byte	W01
	.byte		v053
	.byte	W02
	.byte		v053
	.byte	W02
	.byte		v052
	.byte	W02
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W02
	.byte		v051
	.byte	W02
	.byte		v051
	.byte	W02
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	W02
	.byte		v048
	.byte	W02
	.byte		v048
	.byte	W02
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v044
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v043
	.byte	W02
	.byte		v043
	.byte	W01
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v041
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v023
	.byte	W01
	.byte		v023
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W02
	.byte		v021
	.byte	W02
	.byte		v020
	.byte	W02
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W02
	.byte		v019
	.byte	W02
	.byte		v018
	.byte	W01
	.byte		v018
	.byte	W01
	.byte	W01
	.byte		v018
	.byte	W02
	.byte		v017
	.byte	W02
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W02
	.byte		v016
	.byte	W02
	.byte		v015
	.byte	W02
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W02
	.byte		v014
	.byte	W02
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W02
	.byte		v013
	.byte	W02
	.byte		v012
	.byte	W02
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W02
	.byte		v011
	.byte	W02
	.byte		v011
	.byte	W02
	.byte		v010
	.byte	W01
	.byte		v010
	.byte	W02
	.byte		v009
	.byte	W02
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W02
	.byte		v008
	.byte	W02
	.byte		v007
	.byte	W02
	.byte		v007
	.byte	W01
	.byte		v007
	.byte	W02
	.byte		v006
	.byte	W02
	.byte		v006
	.byte	W01
	.byte		v005
	.byte	W02
	.byte		v005
	.byte	W02
	.byte		v004
	.byte	W02
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W02
	.byte		v003
	.byte	W02
	.byte		v003
	.byte	W02
	.byte		v002
	.byte	W01
	.byte		v002
	.byte	W02
	.byte		v001
	.byte	W02
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W02
	.byte		v000
	.byte	W02
	.byte		v000
	.byte	W03
	.byte		EOT	
	.byte	W21
	.byte	GOTO	
		.word	song056_4_2
	.byte	FINE

	@********************** Track  5 **********************@

	.global song056_5
song056_5:	@ 0x0856E92D
	.byte	KEYSH	, 0
song056_5_2:
	.byte	VOL	, v056
	.byte	PAN	, c_v-33
	.byte	W96
	.byte	W96
	.byte	VOICE	, 126
	.byte	VOL	, v056
	.byte	PAN	, c_v-33
	.byte	W96
	.byte	W96
	.byte		N15	, Cs3, v064
	.byte	W24
	.byte			Cs3, v072
	.byte	W24
	.byte			Cs3, v076
	.byte	W24
	.byte			Cs3, v080
	.byte	W24
	.byte			Cs3, v084
	.byte	W24
	.byte			Cs3, v092
	.byte	W24
	.byte			Cs3, v096
	.byte	W24
	.byte			Cs3, v100
	.byte	W24
	.byte			Cs3, v108
	.byte	W24
	.byte			Cs3, v112
	.byte	W24
	.byte		N15	
	.byte	W24
	.byte		N15	
	.byte	W24
song056_5_1:
	.byte		N15	, Cs3, v112
	.byte	W24
	.byte		N15	
	.byte	W24
	.byte		N15	
	.byte	W24
	.byte		N15	
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song056_5_1
	.byte	PATT	
		.word	song056_5_1
	.byte	PATT	
		.word	song056_5_1
	.byte	PATT	
		.word	song056_5_1
	.byte	PATT	
		.word	song056_5_1
	.byte	PATT	
		.word	song056_5_1
	.byte	PATT	
		.word	song056_5_1
	.byte	PATT	
		.word	song056_5_1
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song056_5_2
	.byte	FINE

	.align 2
	.global song056
song056:	@ 0x0856E99C
	.byte	5		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup020		@ voicegroup/tone

	.word	song056_1		@ track
	.word	song056_2		@ track
	.word	song056_3		@ track
	.word	song056_4		@ track
	.word	song056_5		@ track
