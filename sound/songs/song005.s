	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song005_1
song005_1:	@ 0x08548920
	.byte	KEYSH	, 0
	.byte	TEMPO	, 53
	.byte	W72
	.byte	VOICE	, 49
	.byte	VOL	, v043
	.byte	PAN	, c_v-25
	.byte	W24
song005_1_1:
	.byte		N32	, As3, v088
	.byte	W36
	.byte		N05	, Fn3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte		N32	, Fn4
	.byte	W36
	.byte		N05	, Ds4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte	PEND
	.byte		N68	, As3
	.byte	W96
	.byte	PATT	
		.word	song005_1_1
	.byte		N92	, Ds4, v088
	.byte	W96
	.byte	W24
	.byte		N23	
	.byte	W24
	.byte			Fn4
	.byte	W24
	.byte			Gn4
	.byte	W24
	.byte		TIE	, Fn4
	.byte	W92
	.byte	W02
	.byte	VOL	, v043
	.byte	W01
	.byte		v042
	.byte	W01
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
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
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v016
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
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		EOT	
	.byte	VOL	, v000
	.byte	W01
	.byte		v000
	.byte	W24
song005_1_2:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 49
	.byte	W23
	.byte	VOL	, v000
	.byte	W01
	.byte		v031
	.byte	W24
	.byte	PAN	, c_v-25
	.byte	W48
	.byte		TIE	, Ds4, v068
	.byte	W96
	.byte	W96
	.byte	W23
	.byte		EOT	
	.byte	W01
	.byte		N44	, Cs4
	.byte	W48
	.byte			Cn4
	.byte	W24
	.byte	W24
	.byte			As3
	.byte	W48
	.byte		N23	, Gs3
	.byte	W24
	.byte		TIE	, Ds4
	.byte	W96
	.byte	W23
	.byte		EOT	
	.byte	W72
	.byte	W01
	.byte	W96
	.byte	W48
	.byte		N23	, Cn4, v100
	.byte	W24
	.byte			Ds4
	.byte	W13
	.byte	VOL	, v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v018
	.byte		TIE	, Gn4, v072
	.byte	W05
	.byte	VOL	, v018
	.byte	W03
	.byte		v018
	.byte	W03
	.byte		v019
	.byte	W03
	.byte		v019
	.byte	W02
	.byte		v020
	.byte	W03
	.byte		v020
	.byte	W03
	.byte		v020
	.byte	W03
	.byte		v021
	.byte	W03
	.byte		v021
	.byte	W03
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W03
	.byte		v022
	.byte	W03
	.byte		v023
	.byte	W03
	.byte		v023
	.byte	W03
	.byte		v024
	.byte	W03
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W03
	.byte		v025
	.byte	W03
	.byte		v025
	.byte	W03
	.byte		v025
	.byte	W03
	.byte		v026
	.byte	W02
	.byte		v026
	.byte	W03
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W28
	.byte	W96
	.byte	W96
	.byte	W48
	.byte	W01
	.byte		v027
	.byte	W04
	.byte		v027
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v023
	.byte	W01
	.byte		EOT	
	.byte	W01
	.byte	VOL	, v023
	.byte		N23	, Fn4
	.byte	W01
	.byte	VOL	, v022
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v021
	.byte	W02
	.byte		v021
	.byte	W02
	.byte		v020
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
	.byte	W02
	.byte		v018
	.byte	W02
	.byte		v017
	.byte		TIE	, Gn4
	.byte	W06
	.byte	VOL	, v018
	.byte	W03
	.byte		v018
	.byte	W03
	.byte		v018
	.byte	W02
	.byte		v019
	.byte	W03
	.byte		v019
	.byte	W03
	.byte		v020
	.byte	W03
	.byte		v020
	.byte	W03
	.byte		v020
	.byte	W03
	.byte		v021
	.byte	W02
	.byte		v021
	.byte	W03
	.byte		v022
	.byte	W03
	.byte		v022
	.byte	W03
	.byte		v022
	.byte	W03
	.byte		v023
	.byte	W03
	.byte		v023
	.byte	W02
	.byte		v024
	.byte	W03
	.byte		v024
	.byte	W03
	.byte		v024
	.byte	W03
	.byte		v025
	.byte	W03
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W03
	.byte		v026
	.byte	W03
	.byte		v026
	.byte	W03
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W28
	.byte	W01
	.byte		v027
	.byte	W09
	.byte		v027
	.byte	W09
	.byte		EOT	
	.byte	VOL	, v026
	.byte	W01
	.byte		N44	, Fn4
	.byte	W08
	.byte	VOL	, v026
	.byte	W08
	.byte		v025
	.byte	W09
	.byte		v025
	.byte	W09
	.byte		v025
	.byte	W09
	.byte		v024
	.byte	W05
	.byte	GOTO	
		.word	song005_1_2
	.byte	FINE

	@********************** Track  2 **********************@

	.global song005_2
song005_2:	@ 0x08548AF8
	.byte	KEYSH	, 0
	.byte	VOICE	, 34
	.byte	VOL	, v050
	.byte	PAN	, c_v
	.byte		N92	, Gn2, v120
	.byte	W96
	.byte		N56	
	.byte	W72
	.byte		N23	, Gn2, v108
	.byte	W24
	.byte		N92	, Fn2, v120
	.byte	W96
	.byte		N56	
	.byte	W72
	.byte		N23	, Fn2, v108
	.byte	W24
	.byte		N92	, Ds2, v120
	.byte	W96
	.byte		N64	
	.byte	W72
	.byte		N20	
	.byte	W24
	.byte		N92	, Fn2
	.byte	W96
	.byte		N40	
	.byte	W48
	.byte		N20	
	.byte	W24
	.byte			Fn1
	.byte	W24
song005_2_7:
	.byte		N11	, Gn1, v120
	.byte	W36
	.byte		N11	
	.byte	W60
	.byte		N11	
	.byte	W36
	.byte		N11	
	.byte	W48
	.byte			Dn2
	.byte	W12
song005_2_1:
	.byte		N11	, Ds2, v120
	.byte	W36
	.byte		N11	
	.byte	W60
	.byte	PEND
	.byte		N11	
	.byte	W36
	.byte		N11	
	.byte	W48
	.byte		N11	
	.byte	W12
	.byte			Cn2
	.byte	W36
	.byte		N11	
	.byte	W60
	.byte		N11	
	.byte	W36
	.byte		N11	
	.byte	W48
	.byte			Dn2
	.byte	W12
	.byte	PATT	
		.word	song005_2_1
	.byte	PATT	
		.word	song005_2_1
	.byte		N11	, Ds2, v120
	.byte	W36
	.byte			Fn2
	.byte	W24
	.byte		N11	
	.byte	W24
	.byte		N05	
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte		N11	, Gs2, v112
	.byte	W36
	.byte		N32	
	.byte	W60
	.byte		N11	, Gs1
	.byte	W36
	.byte		N32	
	.byte	W60
song005_2_3:
	.byte		N11	, Cs2, v112
	.byte	W36
	.byte		N32	
	.byte	W60
	.byte	PEND
	.byte		N11	
	.byte	W36
	.byte		N32	
	.byte	W48
	.byte		N05	
	.byte	W06
	.byte			Ds2
	.byte	W06
song005_2_2:
	.byte		N11	, Fn2, v112
	.byte	W36
	.byte		N32	
	.byte	W60
	.byte	PEND
	.byte	PATT	
		.word	song005_2_2
	.byte	PATT	
		.word	song005_2_3
	.byte		N23	, Cs2, v112
	.byte	W36
	.byte		N23	
	.byte	W36
	.byte		N05	, Ds2
	.byte	W12
	.byte			Fn2
	.byte	W12
song005_2_5:
	.byte		N05	, Ds2, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PEND
song005_2_4:
	.byte		N05	, Dn2, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PEND
song005_2_6:
	.byte		N05	, Cn2, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song005_2_4
	.byte	PATT	
		.word	song005_2_5
	.byte	PATT	
		.word	song005_2_4
	.byte	PATT	
		.word	song005_2_6
	.byte	PATT	
		.word	song005_2_4
	.byte	GOTO	
		.word	song005_2_7
	.byte	FINE

	@********************** Track  3 **********************@

	.global song005_3
song005_3:	@ 0x08548BEC
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 68
	.byte	VOL	, v050
	.byte	PAN	, c_v+11
	.byte	W24
	.byte		N23	, Dn3, v096
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte			Fn3
	.byte	W24
song005_3_1:
	.byte	VOL	, v050
	.byte		TIE	, Dn3, v080
	.byte		TIE	, Gn3, v096
	.byte	W96
	.byte	W17
	.byte		EOT	, Dn3
	.byte			Gn3
	.byte	W01
	.byte		N05	, Gn3, v020
	.byte	W06
	.byte			Dn3, v080
	.byte		N05	, Gn3, v096
	.byte	W06
	.byte			Gn3, v080
	.byte		N05	, As3, v096
	.byte	W06
	.byte			As3, v072
	.byte		N05	, Dn4, v092
	.byte	W06
	.byte			Dn4, v068
	.byte		N05	, Fn4, v084
	.byte	W06
	.byte		N23	, Cn4, v072
	.byte		N23	, En4, v088
	.byte	W24
	.byte			An3, v080
	.byte		N23	, Cn4, v096
	.byte	W24
	.byte		N64	, As3, v080
	.byte		N64	, Dn4, v096
	.byte	W66
	.byte		N05	, Dn4, v020
	.byte	W06
	.byte		N11	, An3, v080
	.byte		N11	, Cn4, v096
	.byte	W12
	.byte			Gn3, v080
	.byte		N11	, As3, v096
	.byte	W12
	.byte		N44	, Fn3, v080
	.byte		N44	, An3, v096
	.byte	W48
	.byte		N64	, Dn3, v080
	.byte		N64	, Gn3, v096
	.byte	W48
	.byte	W18
	.byte		N05	, Gn3, v020
	.byte	W06
	.byte		N23	, Fn3, v080
	.byte		N23	, An3, v096
	.byte	W24
	.byte			Gn3, v080
	.byte		N23	, As3, v096
	.byte	W24
	.byte			An3, v080
	.byte		N23	, Cn4, v096
	.byte	W24
	.byte		N44	, As3, v072
	.byte		N44	, Dn4, v088
	.byte	W48
	.byte		N23	, Dn4, v072
	.byte		N23	, Fn4, v084
	.byte	W24
	.byte			Cn4, v072
	.byte		N23	, Ds4, v092
	.byte	W24
	.byte		N64	, As3, v080
	.byte		N64	, Dn4, v096
	.byte	W66
	.byte		N05	, Dn4, v020
	.byte	W06
	.byte		N44	, An3, v080
	.byte		N44	, Cn4, v096
	.byte	W24
	.byte	W24
	.byte			Fn3, v080
	.byte		N44	, An3, v096
	.byte	W48
	.byte		N23	, Ds3, v080
	.byte		N36	, Gn3, v096
	.byte	W24
	.byte		N14	, Dn3, v080
	.byte	W15
	.byte		N05	, Gn3, v020
	.byte	W09
	.byte		N64	, Cn3, v080
	.byte		N64	, Fn3, v096
	.byte	W66
	.byte		N05	, Fn3, v020
	.byte	W05
	.byte	VOL	, v050
	.byte	W01
	.byte	VOICE	, 60
	.byte	VOL	, v039
	.byte	PAN	, c_v-14
	.byte		N04	, Dn3, v100
	.byte	W12
	.byte			Dn3, v084
	.byte	W12
	.byte			Dn3, v092
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Dn3, v100
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Ds3, v088
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Ds3, v092
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Ds3, v084
	.byte	W12
	.byte			Ds3, v076
	.byte	W12
	.byte			Ds3, v088
	.byte	W12
	.byte			Ds3, v068
	.byte	W12
	.byte			Fn3, v052
	.byte	W12
	.byte			Fn3, v056
	.byte	W12
	.byte			Fn3, v052
	.byte	W12
	.byte			Fn3, v060
	.byte	W12
	.byte			Fn3, v052
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Fn3, v088
	.byte	W12
	.byte			Fn3, v052
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Fn3, v068
	.byte	W12
	.byte			Fn3, v052
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Fn3, v100
	.byte	W12
	.byte			Fn3, v060
	.byte	W12
	.byte			Fn3, v084
	.byte	W12
	.byte			Fn3, v100
	.byte	W12
	.byte			Fn3, v068
	.byte	W12
	.byte			Fn3, v076
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Fn3, v056
	.byte	W12
	.byte			Fn3, v092
	.byte	W12
	.byte			Fn3, v052
	.byte	W12
	.byte			Fn3, v068
	.byte	W12
	.byte			Fn3, v100
	.byte	W12
	.byte			Fn3, v088
	.byte	W12
	.byte			Fn3, v068
	.byte	W12
	.byte			Fn3, v060
	.byte	W12
	.byte			Fn3, v056
	.byte	W12
	.byte			Fn3, v052
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Fn3, v060
	.byte	W12
	.byte			Fn3, v052
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Fn3, v056
	.byte	W12
	.byte			Fn3, v052
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Fn3, v068
	.byte	W12
	.byte			Fn3, v052
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Fn3, v076
	.byte	W12
	.byte	W96
	.byte	W96
	.byte	W92
	.byte	W03
	.byte	VOL	, v039
	.byte	W01
	.byte	VOICE	, 68
	.byte	VOL	, v050
	.byte	PAN	, c_v+11
	.byte	W24
	.byte		N44	, As3, v108
	.byte	W48
	.byte		N32	, Cn4
	.byte	W24
	.byte	W12
	.byte		N05	, Cn4, v032
	.byte	W12
	.byte		N23	, As3, v096
	.byte		N23	, Dn4, v108
	.byte	W24
	.byte		N08	, Gn3, v096
	.byte		N11	, As3, v108
	.byte	W12
	.byte		N05	, As3, v096
	.byte		N05	, Dn4, v108
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte			Dn4, v096
	.byte		N05	, Fn4, v108
	.byte	W06
	.byte			Fn4, v032
	.byte	W06
	.byte			Fn4, v096
	.byte		N05	, An4, v108
	.byte	W06
	.byte			An4, v032
	.byte	W06
	.byte		N23	, En4, v096
	.byte		N23	, Gn4, v108
	.byte	W24
	.byte		N40	, Cn4, v096
	.byte		N40	, En4, v108
	.byte	W42
	.byte		N05	, En4, v032
	.byte	W06
	.byte		N11	, Gn3, v096
	.byte		N11	, Cn4, v108
	.byte	W12
	.byte			An3, v096
	.byte		N11	, Dn4, v108
	.byte	W12
	.byte		N23	, As3, v096
	.byte		N23	, Ds4, v108
	.byte	W24
	.byte			Dn3, v096
	.byte		N23	, Gn3, v108
	.byte	W24
	.byte			Fn3, v096
	.byte		N23	, As3, v108
	.byte	W24
	.byte			As3, v096
	.byte		N23	, Ds4, v108
	.byte	W24
	.byte		N80	, Cn4, v096
	.byte		N80	, Fn4, v108
	.byte	W40
	.byte	VOL	, v050
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
	.byte		v047
	.byte	W01
	.byte		v046
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
	.byte		v043
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
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
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v000
	.byte	W05
	.byte	GOTO	
		.word	song005_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song005_4
song005_4:	@ 0x08548E66
	.byte	KEYSH	, 0
	.byte	VOICE	, 60
	.byte	VOL	, v039
	.byte	PAN	, c_v-14
	.byte		N76	, Fn2, v068
	.byte		N76	, As2, v084
	.byte	W78
	.byte		N05	, Cn2, v068
	.byte		N05	, Fn2, v084
	.byte	W06
	.byte			Fn2, v068
	.byte		N05	, As2, v084
	.byte	W06
	.byte			Gn2, v068
	.byte		N05	, Cn3, v084
	.byte	W06
song005_4_1:
	.byte		TIE	, Cn3, v068
	.byte		TIE	, Fn3, v084
	.byte	W96
	.byte	PEND
	.byte	W68
	.byte	W03
	.byte		EOT	, Cn3
	.byte			Fn3
	.byte	W01
	.byte		N11	, As2, v068
	.byte		N11	, Ds3, v084
	.byte	W12
	.byte			An2, v068
	.byte		N11	, Dn3, v084
	.byte	W12
	.byte		N88	, Fn2, v068
	.byte		N88	, As2, v084
	.byte	W96
	.byte		N76	, Fn2, v068
	.byte		N76	, As2, v084
	.byte	W78
	.byte		N05	, Cn2, v068
	.byte		N05	, Fn2, v084
	.byte	W06
	.byte			Fn2, v068
	.byte		N05	, As2, v084
	.byte	W06
	.byte			Gn2, v068
	.byte		N05	, Cn3, v084
	.byte	W06
	.byte	PATT	
		.word	song005_4_1
	.byte	W68
	.byte	W03
	.byte		EOT	, Cn3
	.byte			Fn3
	.byte	W01
	.byte		N11	, As2, v068
	.byte		N11	, Ds3, v084
	.byte	W12
	.byte			An2, v068
	.byte		N11	, Dn3, v084
	.byte	W12
	.byte		N44	, Fn2, v068
	.byte		N44	, As2, v084
	.byte	W48
	.byte			Gn2, v068
	.byte		N44	, Cn3, v084
	.byte	W44
	.byte	W03
	.byte	VOL	, v039
	.byte	W01
song005_4_4:
	.byte	VOICE	, 48
	.byte	VOL	, v050
	.byte	PAN	, c_v-6
	.byte	W12
	.byte		N05	, Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W06
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W18
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W06
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W30
song005_4_3:
	.byte	W12
	.byte		N05	, Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W06
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W18
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W06
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W18
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W06
	.byte	PEND
song005_4_2:
	.byte	W12
	.byte		N05	, Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W06
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W18
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W06
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W30
	.byte	PEND
	.byte	PATT	
		.word	song005_4_2
	.byte	PATT	
		.word	song005_4_2
	.byte	PATT	
		.word	song005_4_3
	.byte	PATT	
		.word	song005_4_2
	.byte	PATT	
		.word	song005_4_3
	.byte	W12
	.byte		N05	, Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W06
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W18
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W06
	.byte			Dn3, v088
	.byte	W06
	.byte			Dn3, v020
	.byte	W18
	.byte			Ds3, v108
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte	VOL	, v030
	.byte		TIE	, Gn3, v112
	.byte	W02
	.byte	VOL	, v031
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W01
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
	.byte	W01
	.byte		v041
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W02
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
	.byte	W24
	.byte	W02
	.byte	W17
	.byte		EOT	
	.byte	W01
	.byte		N05	, Gn3, v020
	.byte	W06
	.byte		N23	, Gn3, v112
	.byte	W24
	.byte			Gs3
	.byte	W24
	.byte			As3
	.byte	W24
	.byte		TIE	, Fn3
	.byte	W96
	.byte	W23
	.byte	VOL	, v050
	.byte	W02
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	W02
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v046
	.byte	W02
	.byte		v046
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v038
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
	.byte		v034
	.byte	W01
	.byte		v034
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
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		EOT	
	.byte	VOL	, v018
	.byte	W01
	.byte		v016
	.byte		N05	, Fn3, v020
	.byte	W01
	.byte	VOL	, v014
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W04
	.byte		v050
	.byte		N05	, Ds3, v112
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte	VOL	, v032
	.byte		TIE	, Gn3
	.byte	W03
	.byte	VOL	, v033
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W02
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W02
	.byte		v041
	.byte	W01
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
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W02
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W02
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W02
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W02
	.byte		v050
	.byte	W30
	.byte	W20
	.byte		EOT	
	.byte	W04
	.byte		N68	, Gn3, v096
	.byte	W42
	.byte	VOL	, v049
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
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v035
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
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v022
	.byte	W22
	.byte		TIE	, Gs3
	.byte	W04
	.byte	VOL	, v022
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
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
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v042
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
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W32
	.byte	W03
	.byte	W44
	.byte	W03
	.byte		EOT	
	.byte	W48
	.byte	W01
	.byte		N44	, As2, v088
	.byte		N44	, Dn3, v112
	.byte	W48
	.byte		N05	, Ds2, v088
	.byte		N05	, Gn2, v112
	.byte	W06
	.byte			Gn2, v032
	.byte	W06
	.byte			Gn2, v088
	.byte		N05	, As2, v112
	.byte	W06
	.byte			As2, v032
	.byte	W06
	.byte			As2, v088
	.byte		N05	, Dn3, v112
	.byte	W06
	.byte			Dn3, v032
	.byte	W06
	.byte			Dn3, v088
	.byte		N05	, Fn3, v112
	.byte	W06
	.byte			Fn3, v032
	.byte	W06
	.byte		N44	, Cn3, v088
	.byte		N44	, En3, v112
	.byte	W48
	.byte		N28	, An2, v088
	.byte		N28	, Cn3, v112
	.byte	W30
	.byte		N05	, Cn3, v032
	.byte	W06
	.byte		N11	, As2, v088
	.byte		N11	, Dn3, v112
	.byte	W12
	.byte		N23	, Cn3, v088
	.byte		N23	, Ds3, v112
	.byte	W24
	.byte			As2, v088
	.byte		N23	, Dn3, v112
	.byte	W24
	.byte			An2, v088
	.byte		N23	, Cn3, v112
	.byte	W24
	.byte			Gn2, v088
	.byte		N23	, As2, v112
	.byte	W24
	.byte		N44	, Gn2, v088
	.byte		N44	, As2, v112
	.byte	W48
	.byte			Fn2, v088
	.byte		N44	, An2, v112
	.byte	W48
	.byte		N92	, Gn2, v076
	.byte	W48
	.byte		N23	, As2, v088
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte		N92	, An2, v076
	.byte		N44	, Cn3, v088
	.byte	W48
	.byte			En3
	.byte	W48
	.byte		N92	, As2, v076
	.byte		TIE	, Gn3, v088
	.byte	W96
	.byte		N44	, Cn3, v076
	.byte	W23
	.byte		EOT	, Gn3
	.byte	W01
	.byte		N23	, Fn3, v088
	.byte	W24
	.byte		N44	, An2, v076
	.byte		N23	, Ds3, v088
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte	GOTO	
		.word	song005_4_4
	.byte	FINE

	@********************** Track  5 **********************@

	.global song005_5
song005_5:	@ 0x0854920B
	.byte	KEYSH	, 0
	.byte	VOICE	, 61
	.byte	VOL	, v050
	.byte	PAN	, c_v-7
	.byte		N68	, Ds3, v108
	.byte	W78
	.byte		N02	, As2
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte		TIE	, As3
	.byte	W96
	.byte	W56
	.byte	W03
	.byte		EOT	
	.byte	W13
	.byte		N09	, Gs3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte		N92	, Ds3
	.byte	W96
	.byte		N68	
	.byte	W78
	.byte		N02	, As2
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte		TIE	, As3
	.byte	W96
	.byte	W56
	.byte	W03
	.byte		EOT	
	.byte	W13
	.byte		N09	, Gs3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte		N68	, Ds3
	.byte	W96
song005_5_3:
	.byte	VOICE	, 50
	.byte	VOL	, v050
	.byte	PAN	, c_v+20
	.byte	W12
	.byte		N08	, As2, v056
	.byte	W12
	.byte		N08	
	.byte	W24
	.byte		N08	
	.byte	W12
	.byte		N08	
	.byte	W36
song005_5_2:
	.byte	W12
	.byte		N08	, As2, v056
	.byte	W12
	.byte		N08	
	.byte	W24
	.byte		N08	
	.byte	W12
	.byte		N08	
	.byte	W24
	.byte		N08	
	.byte	W12
	.byte	PEND
song005_5_1:
	.byte	W12
	.byte		N08	, As2, v056
	.byte	W12
	.byte		N08	
	.byte	W24
	.byte		N08	
	.byte	W12
	.byte		N08	
	.byte	W36
	.byte	PEND
	.byte	PATT	
		.word	song005_5_1
	.byte	PATT	
		.word	song005_5_1
	.byte	PATT	
		.word	song005_5_2
	.byte	PATT	
		.word	song005_5_1
	.byte	PATT	
		.word	song005_5_2
	.byte	W12
	.byte		N08	, As2, v056
	.byte	W12
	.byte		N08	
	.byte	W24
	.byte			An2
	.byte	W12
	.byte		N08	
	.byte	W24
	.byte		N05	, Cn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N92	, Dn3, v072
	.byte	W96
	.byte			Ds3
	.byte	W96
	.byte			Cn3
	.byte	W96
	.byte		N44	, Gs2
	.byte	W48
	.byte			As2
	.byte	W48
	.byte		N68	, Cn3
	.byte	W72
	.byte		N23	, Cs3
	.byte	W24
	.byte		N92	, Ds3
	.byte	W96
	.byte	VOICE	, 46
	.byte	VOL	, v050
	.byte	PAN	, c_v+35
	.byte		N05	, Cn5, v088
	.byte	W06
	.byte			Gs4, v072
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Gs4, v088
	.byte	W06
	.byte			Fn4, v072
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Fn4, v088
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Cs4, v088
	.byte	W06
	.byte			Cn4, v072
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Cs3, v088
	.byte	W06
	.byte			Fn3, v072
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Fn3, v088
	.byte	W06
	.byte			Gs3, v072
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Gs3, v088
	.byte	W06
	.byte			Cn4, v072
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Cn4, v088
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Gs4
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
		.word	song005_5_3
	.byte	FINE

	@********************** Track  6 **********************@

	.global song005_6
song005_6:	@ 0x08549314
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song005_6_2:
	.byte	VOICE	, 30
	.byte	VOL	, v050
	.byte	PAN	, c_v+10
	.byte		N11	, Gn2, v072
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
song005_6_1:
	.byte		N11	, Gn2, v072
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song005_6_1
	.byte	PATT	
		.word	song005_6_1
	.byte	PATT	
		.word	song005_6_1
	.byte	PATT	
		.word	song005_6_1
	.byte	PATT	
		.word	song005_6_1
	.byte	PATT	
		.word	song005_6_1
	.byte	PATT	
		.word	song005_6_1
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 46
	.byte	VOL	, v050
	.byte	PAN	, c_v+35
	.byte		N05	, Cn5, v088
	.byte	W06
	.byte			Gs4, v072
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Gs4, v088
	.byte	W06
	.byte			Fn4, v072
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Fn4, v088
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Cs4, v088
	.byte	W06
	.byte			Cn4, v072
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte	W96
	.byte	VOICE	, 56
	.byte	VOL	, v050
	.byte	PAN	, c_v+10
	.byte	W24
	.byte		N17	, Ds2, v092
	.byte		N17	, Gn2, v116
	.byte	W18
	.byte		N05	, Gn2, v028
	.byte	W06
	.byte		N17	, Fn2, v092
	.byte		N17	, Gs2, v116
	.byte	W18
	.byte		N05	, Gs2, v028
	.byte	W06
	.byte		N17	, Gn2, v092
	.byte		N17	, As2, v116
	.byte	W18
	.byte		N05	, As2, v028
	.byte	W06
	.byte		N76	, Gs2, v092
	.byte		N76	, Cn3, v116
	.byte	W78
	.byte		N05	, Cn3, v028
	.byte	W06
	.byte			As2, v092
	.byte		N05	, Cs3, v116
	.byte	W06
	.byte			Cs3, v028
	.byte	W06
	.byte		N64	, Cn3, v092
	.byte		N64	, Ds3, v116
	.byte	W66
	.byte		N05	, Ds3, v028
	.byte	W06
	.byte		N17	, Cn3, v092
	.byte		N17	, Fn3, v116
	.byte	W18
	.byte		N05	, Fn3, v028
	.byte	W06
	.byte		N68	, Gn2, v084
	.byte	W84
	.byte		N05	
	.byte	W12
	.byte		N88	, Fn2
	.byte	W96
	.byte		N68	, Ds2
	.byte	W84
	.byte		N05	
	.byte	W12
	.byte		N88	, Fn2
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song005_6_2
	.byte	FINE

	@********************** Track  7 **********************@

	.global song005_7
song005_7:	@ 0x0854940C
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v046
	.byte	PAN	, c_v
	.byte		N32	, Ds2, v092
	.byte	W36
	.byte		N05	, Fs1, v072
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Fs1, v080
	.byte	W48
song005_7_1:
	.byte	W36
	.byte		N05	, Fs1, v072
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Fs1, v080
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Ds2, v100
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PEND
song005_7_2:
	.byte		N32	, Ds2, v092
	.byte	W36
	.byte		N05	, Fs1, v072
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Fs1, v080
	.byte	W48
	.byte	PEND
	.byte	PATT	
		.word	song005_7_1
	.byte	PATT	
		.word	song005_7_2
	.byte	PATT	
		.word	song005_7_1
	.byte	PATT	
		.word	song005_7_2
	.byte	PATT	
		.word	song005_7_1
song005_7_4:
	.byte		N11	, Dn1, v116
	.byte	W36
	.byte			Dn1, v108
	.byte	W48
	.byte		N05	
	.byte	W06
	.byte			Dn1, v088
	.byte	W06
song005_7_3:
	.byte		N11	, Dn1, v112
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte		N11	
	.byte	W36
	.byte		N05	, Fs2, v080
	.byte	W06
	.byte			Fs2, v020
	.byte	W18
	.byte	PEND
	.byte		N11	, Dn1, v108
	.byte	W36
	.byte			Dn1, v116
	.byte	W24
	.byte			Dn1, v108
	.byte	W24
	.byte		N05	, Dn1, v112
	.byte	W06
	.byte			Dn1, v100
	.byte	W06
	.byte		N11	, Dn1, v112
	.byte	W36
	.byte		N11	
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte			Dn1, v108
	.byte	W24
	.byte			Dn1, v112
	.byte	W36
	.byte		N11	
	.byte	W48
	.byte		N05	, Dn1, v116
	.byte	W06
	.byte			Dn1, v080
	.byte	W06
	.byte	PATT	
		.word	song005_7_3
	.byte		N11	, Dn1, v112
	.byte	W36
	.byte			Dn1, v108
	.byte	W24
	.byte			Dn1, v112
	.byte	W24
	.byte		N05	
	.byte	W06
	.byte			Dn1, v092
	.byte	W06
	.byte		N11	, Dn1, v116
	.byte	W36
	.byte			Dn1, v112
	.byte	W24
	.byte		N11	
	.byte	W24
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N11	
	.byte	W36
	.byte		N11	
	.byte	W24
	.byte			Dn1, v116
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte		N05	, Fs1, v076
	.byte	W24
	.byte			Fs1, v072
	.byte	W24
	.byte			Fs1, v076
	.byte	W24
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W24
	.byte			Fs1, v068
	.byte	W24
	.byte			Fs1, v076
	.byte	W24
	.byte		N05	
	.byte	W06
	.byte			Fs1, v032
	.byte	W06
	.byte		N11	, As1, v080
	.byte	W12
	.byte		N05	, Fs1, v076
	.byte	W24
	.byte			Fs1, v060
	.byte	W24
	.byte			Fs1, v076
	.byte	W24
	.byte			Fs1, v064
	.byte	W12
	.byte		N11	, As1, v080
	.byte	W12
	.byte		N05	, Fs1, v076
	.byte	W24
	.byte			Fs1, v044
	.byte	W24
	.byte			Fs1, v076
	.byte	W24
	.byte			Fs1, v064
	.byte	W12
	.byte			Fs1, v056
	.byte	W12
	.byte			Fs1, v076
	.byte	W24
	.byte			Fs1, v040
	.byte	W24
	.byte			Fs1, v076
	.byte	W24
	.byte			Fs1, v060
	.byte	W24
	.byte			Fs1, v076
	.byte	W24
	.byte			Fs1, v064
	.byte	W24
	.byte			Fs1, v076
	.byte	W24
	.byte		N05	
	.byte	W06
	.byte			Fs1, v048
	.byte	W06
	.byte		N11	, As1, v080
	.byte	W12
	.byte		N05	, Fs1, v076
	.byte	W24
	.byte			Fs1, v056
	.byte	W12
	.byte			Dn1, v116
	.byte	W12
	.byte			Fs1, v076
	.byte	W24
	.byte			Dn1, v116
	.byte	W12
	.byte			Dn1, v112
	.byte	W12
	.byte			Fs1, v076
	.byte	W12
	.byte		N11	, As1, v080
	.byte	W12
	.byte		N05	, Fs1, v076
	.byte	W12
	.byte			Dn1, v096
	.byte	W12
	.byte			Dn1, v116
	.byte	W12
	.byte			Dn1, v104
	.byte	W12
	.byte			Dn1, v116
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte			Dn1, v096
	.byte	W06
	.byte		N11	, Dn1, v112
	.byte	W24
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v108
	.byte	W48
	.byte		N05	, Dn1, v116
	.byte	W06
	.byte			Dn1, v084
	.byte	W06
	.byte		N11	, Dn1, v112
	.byte	W12
	.byte			Dn1, v108
	.byte	W24
	.byte			Dn1, v112
	.byte	W24
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v116
	.byte	W24
	.byte		N11	
	.byte	W24
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v116
	.byte	W24
	.byte			Dn1, v112
	.byte	W24
	.byte		N05	
	.byte	W06
	.byte			Dn1, v092
	.byte	W06
	.byte		N11	, Dn1, v116
	.byte	W24
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v116
	.byte	W24
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v112
	.byte	W24
	.byte		N11	
	.byte	W24
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v108
	.byte	W36
	.byte			Dn1, v116
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte			Dn1, v084
	.byte	W06
	.byte		N11	, Dn1, v112
	.byte	W12
	.byte			Dn1, v116
	.byte	W24
	.byte		N11	
	.byte	W24
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v112
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte			Dn1, v112
	.byte	W36
	.byte		N05	, Dn1, v108
	.byte	W06
	.byte			Dn1, v080
	.byte	W06
	.byte		N11	, Dn1, v112
	.byte	W12
	.byte			Dn1, v116
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte			Dn1, v108
	.byte	W24
	.byte		N05	
	.byte	W06
	.byte			Dn1, v096
	.byte	W06
	.byte		N11	, Dn1, v112
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte			Dn1, v096
	.byte	W06
	.byte	GOTO	
		.word	song005_7_4
	.byte	FINE

	.align 2
	.global song005
song005:	@ 0x085495E8
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup004		@ voicegroup/tone

	.word	song005_1		@ track
	.word	song005_2		@ track
	.word	song005_3		@ track
	.word	song005_4		@ track
	.word	song005_5		@ track
	.word	song005_6		@ track
	.word	song005_7		@ track
