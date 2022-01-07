	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song008_1
song008_1:	@ 0x0854B1FC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 55
	.byte	VOICE	, 48
	.byte	VOL	, v041
	.byte	PAN	, c_v-15
	.byte		TIE	, En2, v100
	.byte		N84	, Bn2
	.byte	W84
	.byte		N06	, Cs3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte		N48	, En3
	.byte	W48
	.byte		N60	, Bn2
	.byte	W44
	.byte	W01
	.byte		EOT	, En2
	.byte	W03
	.byte		TIE	
	.byte	W12
	.byte		N06	, Bn2, v024
	.byte	W12
	.byte		N48	, Cs3, v100
	.byte	W48
	.byte			Ds3
	.byte	W24
	.byte	W24
	.byte			En3
	.byte	W48
	.byte		N24	, Fs3
	.byte	W21
	.byte		EOT	, En2
	.byte	W03
	.byte	VOL	, v040
	.byte		N92	, Fs2
	.byte		N48	, En3
	.byte	W01
	.byte	VOL	, v037
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W03
	.byte		v021
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte		N48	, Ds3
	.byte	W02
	.byte	VOL	, v030
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v041
	.byte	W01
song008_1_3:
	.byte	VOL	, v041
	.byte		N48	, Bn2, v112
	.byte	W48
	.byte		N24	, En3
	.byte	W24
	.byte		N21	, Gs3
	.byte	W24
	.byte		N48	
	.byte	W48
	.byte		N44	, Cs3
	.byte	W48
song008_1_1:
	.byte		N60	, Cs3, v112
	.byte	W60
	.byte		N12	, Ds3
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte	PEND
	.byte		N48	, En3
	.byte	W48
	.byte		N44	, Ds3
	.byte	W48
	.byte		N48	, Bn2
	.byte	W48
	.byte		N24	, En3
	.byte	W24
	.byte			Gs3
	.byte	W24
	.byte		N48	, Bn3
	.byte	W48
	.byte		N24	, An3
	.byte	W24
	.byte			Gs3, v104
	.byte	W24
	.byte	PATT	
		.word	song008_1_1
	.byte		N72	, En3, v112
	.byte	W72
	.byte	W03
	.byte		N06	, En3, v024
	.byte	W21
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N36	, An2, v064
	.byte	W36
	.byte		N06	, Bn2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte		N24	, Dn3
	.byte	W24
	.byte		N06	, Dn3, v024
	.byte	W12
	.byte		N12	, Cn3, v064
	.byte	W12
	.byte		N36	, Bn2
	.byte	W36
	.byte		N06	, Cn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N12	, En3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			An3
	.byte	W12
	.byte		N68	, Bn3
	.byte	W72
	.byte		N12	
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte		N48	, Bn3
	.byte	W48
	.byte		N42	, An3
	.byte	W42
	.byte		N06	, An3, v024
	.byte	W06
song008_1_2:
	.byte		N96	, Fn3, v080
	.byte		N80	, As3, v104
	.byte	W84
	.byte		N06	, An3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte	PEND
	.byte		N96	, Fn3, v080
	.byte		N48	, An3, v104
	.byte	W48
	.byte		N42	, Cn4
	.byte	W48
	.byte	PATT	
		.word	song008_1_2
	.byte		N48	, Fn3, v080
	.byte		N48	, An3, v100
	.byte	W48
	.byte		N36	, Dn3, v084
	.byte		N36	, Fn3, v100
	.byte	W36
	.byte	W03
	.byte		N09	, Fn3, v040
	.byte	W09
	.byte		N54	, Dn3, v084
	.byte		N54	, Gn3, v100
	.byte	W54
	.byte		N06	, Gn3, v040
	.byte	W06
	.byte		N12	, Gn2, v084
	.byte		N12	, As2, v100
	.byte	W12
	.byte			Cn3, v084
	.byte		N12	, Ds3, v100
	.byte	W12
	.byte			Dn3, v084
	.byte		N12	, Fn3, v100
	.byte	W12
	.byte		N48	, Ds3, v084
	.byte		N36	, Gn3, v100
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte			An3
	.byte	W06
	.byte		N42	, Gn3, v084
	.byte		N42	, As3, v100
	.byte	W42
	.byte		N06	, Gn3, v040
	.byte		N06	, As3
	.byte	W06
	.byte		N92	, Cs3, v084
	.byte		N72	, Gs3, v100
	.byte	W19
	.byte	VOL	, v041
	.byte	W06
	.byte		v041
	.byte	W03
	.byte		v040
	.byte	W03
	.byte		v040
	.byte	W03
	.byte		v040
	.byte	W03
	.byte		v039
	.byte	W03
	.byte		v039
	.byte	W04
	.byte		v038
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v037
	.byte	W03
	.byte		v037
	.byte	W03
	.byte		v037
	.byte	W03
	.byte		v036
	.byte	W03
	.byte		v036
	.byte	W03
	.byte		v035
	.byte	W03
	.byte		v035
	.byte	W03
	.byte		v035
	.byte	W03
	.byte		v034
	.byte	W03
	.byte		v034
	.byte	W01
	.byte		N06	
	.byte	W02
	.byte	VOL	, v033
	.byte	W03
	.byte		v033
	.byte	W01
	.byte		N06	, An3
	.byte	W02
	.byte	VOL	, v032
	.byte	W03
	.byte		v032
	.byte	W01
	.byte		N06	, Bn3
	.byte	W02
	.byte	VOL	, v032
	.byte	W03
	.byte		v031
	.byte	W01
	.byte		N24	, Cs3, v084
	.byte		N96	, Cs4, v100
	.byte	W03
	.byte	VOL	, v031
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W03
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v035
	.byte		N21	, Bn2, v084
	.byte	W02
	.byte	VOL	, v036
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v040
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
	.byte		v017
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W03
	.byte	GOTO	
		.word	song008_1_3
	.byte	FINE

	@********************** Track  2 **********************@

	.global song008_2
song008_2:	@ 0x0854B465
	.byte	KEYSH	, 0
	.byte	VOICE	, 33
	.byte	VOL	, v053
	.byte	PAN	, c_v
	.byte		N72	, En1, v127
	.byte	W84
	.byte		N06	, Bn1
	.byte	W12
	.byte		N80	, En2
	.byte	W84
	.byte		N06	, Ds2
	.byte	W12
song008_2_1:
	.byte		N06	, Cs2, v127
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
		.word	song008_2_1
	.byte		N06	, Bn1, v127
	.byte	W12
	.byte		N18	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N06	
	.byte	W12
song008_2_2:
	.byte		N28	, En1, v127
	.byte	W36
	.byte		N23	
	.byte	W36
	.byte		N05	, En2
	.byte	W12
	.byte		N03	, Ds2
	.byte	W12
	.byte		N24	, Cs2
	.byte	W36
	.byte		N32	
	.byte	W36
	.byte		N03	
	.byte	W12
	.byte		N04	, Bn1
	.byte	W12
	.byte		N24	, An1
	.byte	W36
	.byte		N18	
	.byte	W24
	.byte		N07	
	.byte	W12
	.byte		N06	, Bn1
	.byte	W12
	.byte		N05	, Cs2
	.byte	W12
	.byte		N24	, Bn1
	.byte	W36
	.byte		N05	, Fs1
	.byte	W12
	.byte		N13	, Bn1
	.byte	W24
	.byte		N18	, Bn2
	.byte	W24
	.byte		N28	, En2
	.byte	W36
	.byte		N28	
	.byte	W36
	.byte		N05	
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte		N24	, Cs2
	.byte	W36
	.byte		N24	
	.byte	W36
	.byte		N05	
	.byte	W06
	.byte			Bn1
	.byte	W06
	.byte			An1
	.byte	W06
	.byte			Gs1
	.byte	W06
	.byte		N24	, Fs1
	.byte	W36
	.byte		N05	
	.byte	W12
	.byte		N24	, Bn1
	.byte	W36
	.byte		N04	
	.byte	W12
	.byte		N24	, En1
	.byte	W36
	.byte		N05	, Bn1
	.byte	W12
	.byte		N30	, En2
	.byte	W48
	.byte	W24
	.byte		N21	
	.byte	W48
	.byte		N21	
	.byte	W24
	.byte	W24
	.byte		N20	
	.byte	W48
	.byte		N05	
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte	W24
	.byte		N20	, Cn2
	.byte	W48
	.byte		N20	
	.byte	W24
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte			Bn1
	.byte	W24
	.byte		N05	, An1
	.byte	W12
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N05	, Bn1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N05	, Cn2
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte		N11	, An1
	.byte	W36
	.byte		N17	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte		N11	, Dn2
	.byte	W36
	.byte		N17	, Dn3
	.byte	W24
	.byte		N05	, An2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			An1
	.byte	W12
	.byte		N68	, Gn1
	.byte	W84
	.byte		N05	
	.byte	W12
	.byte		N68	
	.byte	W72
	.byte		N05	, Cn2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N68	, Ds2
	.byte	W84
	.byte		N05	
	.byte	W12
	.byte		N68	
	.byte	W96
	.byte			Fn2
	.byte	W84
	.byte		N05	, Cn2
	.byte	W12
	.byte		N68	, Fn2
	.byte	W96
	.byte		N92	, Fs2
	.byte	W96
	.byte		N44	
	.byte	W48
	.byte			Bn1
	.byte	W48
	.byte	GOTO	
		.word	song008_2_2
	.byte	FINE

	@********************** Track  3 **********************@

	.global song008_3
song008_3:	@ 0x0854B564
	.byte	KEYSH	, 0
	.byte	W06
	.byte	VOICE	, 61
	.byte	VOL	, v041
	.byte	PAN	, c_v-18
	.byte	W18
	.byte		N18	, Gs2, v100
	.byte		N18	, Bn2
	.byte	W18
	.byte		N06	, Bn2, v032
	.byte	W06
	.byte		N18	, Fs3, v100
	.byte		N18	, An3
	.byte	W18
	.byte		N06	, An3, v032
	.byte	W06
	.byte		N18	, Ds3, v100
	.byte		N18	, Fs3
	.byte	W18
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte		N84	, En3, v100
	.byte		N84	, Gs3
	.byte	W84
	.byte		N06	, Gs3, v032
	.byte	W12
	.byte		N18	, En3, v100
	.byte		N18	, Gs3
	.byte	W18
	.byte		N06	, Gs3, v032
	.byte	W06
	.byte		N18	, Ds3, v100
	.byte		N18	, Fs3
	.byte	W18
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte		N18	, En3, v100
	.byte		N18	, Gs3
	.byte	W18
	.byte		N06	, Gs3, v032
	.byte	W06
	.byte		N18	, Fs3, v100
	.byte		N18	, An3
	.byte	W18
	.byte		N06	, An3, v032
	.byte	W06
	.byte		N66	, En3, v100
	.byte		N66	, Gs3
	.byte	W66
	.byte		N06	, Gs3, v032
	.byte	W12
	.byte		N05	, Ds3, v100
	.byte		N05	, Fs3
	.byte	W06
	.byte			En3
	.byte		N05	, Gs3
	.byte	W06
	.byte			Fs3
	.byte		N05	, An3
	.byte	W06
	.byte		N90	, Fs3, v088
	.byte		N90	, Bn3
	.byte	W05
	.byte	VOL	, v039
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W02
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
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v032
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
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v037
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
	.byte		v045
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W02
	.byte		v047
	.byte	W07
	.byte		N06	, Bn3, v032
	.byte	W06
song008_3_1:
	.byte	W48
	.byte	VOICE	, 69
	.byte	W24
	.byte	VOL	, v041
	.byte	W24
	.byte	PAN	, c_v+30
	.byte	W24
	.byte		N21	, Cs2, v088
	.byte	W24
	.byte			Cs3
	.byte	W24
	.byte			Bn2
	.byte	W24
	.byte		N96	, An2
	.byte	W96
	.byte	W24
	.byte		N21	, Bn1
	.byte	W24
	.byte			Bn2
	.byte	W24
	.byte			An2
	.byte	W24
	.byte		N96	, Gs2
	.byte	W96
	.byte	W24
	.byte		N21	
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			Bn2
	.byte	W24
	.byte		N36	, Cs3
	.byte	W36
	.byte		N06	, Bn2
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte		N32	, Ds3
	.byte	W36
	.byte		N06	, Cs3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte		N72	, En3
	.byte	W96
	.byte	VOICE	, 61
	.byte	VOL	, v041
	.byte	PAN	, c_v-18
	.byte		N04	, En3, v127
	.byte		N04	, Bn3, v092
	.byte	W06
	.byte			En3, v084
	.byte		N04	, Bn3, v072
	.byte	W06
	.byte		N06	, En3, v127
	.byte		N06	, Bn3, v092
	.byte	W06
	.byte			Bn3, v032
	.byte	W66
	.byte		N04	, En3, v100
	.byte		N04	, Bn3, v080
	.byte	W06
	.byte			En3, v084
	.byte		N04	, Bn3, v076
	.byte	W06
	.byte			En3, v108
	.byte		N04	, Bn3, v080
	.byte	W06
	.byte			En3, v127
	.byte		N04	, Bn3, v080
	.byte	W06
	.byte		N06	, En3, v127
	.byte		N06	, Bn3, v084
	.byte	W06
	.byte			Bn3, v032
	.byte	W78
	.byte		N04	, En3, v127
	.byte		N04	, Cn4, v092
	.byte	W06
	.byte			En3, v084
	.byte		N04	, Cn4, v072
	.byte	W06
	.byte		N06	, En3, v127
	.byte		N06	, Cn4, v092
	.byte	W06
	.byte			Cn4, v032
	.byte	W66
	.byte		N04	, En3, v100
	.byte		N04	, Cn4, v080
	.byte	W06
	.byte			En3, v084
	.byte		N04	, Cn4, v076
	.byte	W06
	.byte			En3, v108
	.byte		N04	, Cn4, v080
	.byte	W06
	.byte			En3, v127
	.byte		N04	, Cn4, v080
	.byte	W06
	.byte		N06	, En3, v127
	.byte		N06	, Cn4, v084
	.byte	W06
	.byte			Cn4, v032
	.byte	W78
	.byte	VOICE	, 50
	.byte	VOL	, v048
	.byte	PAN	, c_v+35
	.byte		N24	, En2, v104
	.byte	W24
	.byte		N36	, Cn3, v096
	.byte	W36
	.byte		N12	, An2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte		N36	, Dn3, v100
	.byte	W36
	.byte		N12	, Bn2
	.byte	W12
	.byte		N09	, Gn3, v096
	.byte	W09
	.byte			Gn3, v024
	.byte	W15
	.byte		N12	, Gn3, v096
	.byte	W12
	.byte			Fs3, v100
	.byte	W12
	.byte			En3, v096
	.byte	W12
	.byte		N09	, En3, v024
	.byte	W12
	.byte		N36	, En3, v100
	.byte	W36
	.byte		N12	, Fs3, v092
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			An3, v096
	.byte	W12
	.byte		N48	, Gn3, v100
	.byte	W48
	.byte		N42	, Fs3, v104
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 57
	.byte	W24
	.byte	VOL	, v053
	.byte	W24
	.byte	PAN	, c_v+25
	.byte	W48
	.byte	W24
	.byte		N12	, Gn2, v084
	.byte	W24
	.byte		N44	, Ds3
	.byte	W48
	.byte	W24
	.byte		N12	, As2
	.byte	W24
	.byte		N44	, Gn3
	.byte	W48
	.byte	VOICE	, 61
	.byte	W24
	.byte	VOL	, v041
	.byte	W24
	.byte	PAN	, c_v-18
	.byte	W48
	.byte	W48
	.byte		N06	, An2
	.byte		N06	, Cs3, v100
	.byte	W06
	.byte			Gs2, v084
	.byte		N06	, Bn2, v100
	.byte	W06
	.byte			An2, v084
	.byte		N06	, Cs3, v100
	.byte	W06
	.byte			Bn2, v084
	.byte		N06	, Ds3, v100
	.byte	W06
	.byte			Cs3, v084
	.byte		N06	, En3, v100
	.byte	W06
	.byte			Ds3, v084
	.byte		N06	, Fs3, v100
	.byte	W06
	.byte			En3, v084
	.byte		N06	, Gs3, v100
	.byte	W06
	.byte			Fs3, v084
	.byte		N06	, An3, v100
	.byte	W06
	.byte	GOTO	
		.word	song008_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song008_4
song008_4:	@ 0x0854B7A0
	.byte	KEYSH	, 0
	.byte	W96
	.byte	VOICE	, 57
	.byte	W06
	.byte	VOL	, v053
	.byte	W06
	.byte	PAN	, c_v+25
	.byte	W12
	.byte		N21	, Bn2, v112
	.byte	W24
	.byte			An3
	.byte	W24
	.byte			Fs3
	.byte	W24
	.byte		N68	, Gs3
	.byte	W72
	.byte		N06	
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte			Fs3, v112
	.byte	W06
	.byte			Fs3, v032
	.byte	W06
	.byte		N21	, En3, v112
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte			En3
	.byte	W24
	.byte			Fs3
	.byte	W24
	.byte		N21	
	.byte	W24
	.byte			En3
	.byte	W24
	.byte			Fs3
	.byte	W24
	.byte			Bn2
	.byte	W24
song008_4_1:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 53
	.byte	W24
	.byte	VOL	, v053
	.byte	W24
	.byte	PAN	, c_v+16
	.byte	W24
	.byte		N04	, An3, v064
	.byte	W04
	.byte			Bn3
	.byte	W04
	.byte			Cs4, v072
	.byte	W04
	.byte			Ds4, v080
	.byte	W04
	.byte			En4, v076
	.byte	W04
	.byte			Fs4, v072
	.byte	W04
	.byte		N48	, Gs4, v080
	.byte	W48
	.byte			An4
	.byte	W48
	.byte			Fs4
	.byte	W48
	.byte		N24	, Gs4
	.byte	W24
	.byte		N06	, Bn3
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte		N48	, En4
	.byte	W48
	.byte			Fs4
	.byte	W48
	.byte		N48	
	.byte	W48
	.byte		N30	, Gn4, v072
	.byte	W30
	.byte		N06	, Fs4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte		N96	, Cn4
	.byte	W36
	.byte	W02
	.byte	VOL	, v053
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v050
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
	.byte		v034
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v030
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
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v009
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
	.byte	W01
	.byte		v000
	.byte	W07
	.byte	W96
	.byte	W96
	.byte	VOICE	, 68
	.byte	W24
	.byte	VOL	, v050
	.byte	W24
	.byte	PAN	, c_v+19
	.byte	W48
	.byte	W24
	.byte		N21	, As2, v112
	.byte	W24
	.byte		N60	, As3, v096
	.byte	W48
	.byte	W24
	.byte		N23	, As2, v080
	.byte	W24
	.byte			As3, v088
	.byte	W24
	.byte			An3, v076
	.byte	W24
	.byte		N80	, Gn3, v080
	.byte	W84
	.byte		N05	, Fn3, v068
	.byte	W06
	.byte			Gn3, v080
	.byte	W06
	.byte		N44	, Fn3, v064
	.byte	W48
	.byte		N48	, Dn3
	.byte	W48
	.byte	W96
	.byte	VOICE	, 53
	.byte	W24
	.byte	VOL	, v053
	.byte	W24
	.byte	PAN	, c_v+16
	.byte	W48
	.byte	W24
	.byte		N24	, Ds4, v092
	.byte	W24
	.byte			Cs4
	.byte	W24
	.byte			Bn3
	.byte	W24
	.byte		N48	, An3
	.byte	W48
	.byte		N24	
	.byte	W24
	.byte		N06	
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte	GOTO	
		.word	song008_4_1
	.byte	FINE

	@********************** Track  5 **********************@

	.global song008_5
song008_5:	@ 0x0854B8E0
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song008_5_2:
	.byte	VOICE	, 56
	.byte	VOL	, v041
	.byte	PAN	, c_v+15
	.byte		N08	, Gs2, v092
	.byte	W36
	.byte		N08	
	.byte	W48
	.byte		N08	
	.byte	W12
song008_5_1:
	.byte		N08	, Gs2, v092
	.byte	W36
	.byte		N08	
	.byte	W48
	.byte		N08	
	.byte	W12
	.byte	PEND
	.byte			An2
	.byte	W36
	.byte		N08	
	.byte	W36
	.byte			Gs2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte		N17	, Bn2
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			Gs2
	.byte	W24
	.byte			Fs2
	.byte	W24
	.byte	PATT	
		.word	song008_5_1
	.byte	PATT	
		.word	song008_5_1
	.byte		N08	, An2, v092
	.byte	W36
	.byte		N08	
	.byte	W12
	.byte			Bn2
	.byte	W24
	.byte			Cs3
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte		N17	, En3
	.byte	W24
	.byte			Bn2
	.byte	W24
	.byte			Gs2
	.byte	W24
	.byte			En2
	.byte	W24
	.byte	W36
	.byte		N03	, Bn2, v060
	.byte		N03	, En3, v120
	.byte	W06
	.byte			Bn2, v084
	.byte		N03	, En3, v120
	.byte	W06
	.byte		N06	, Bn2, v072
	.byte		N06	, En3, v127
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte			Bn2, v068
	.byte		N06	, En3, v127
	.byte	W06
	.byte			En3, v032
	.byte	W30
	.byte	W36
	.byte		N03	, Bn2, v064
	.byte		N03	, Fs3, v124
	.byte	W06
	.byte			Bn2, v064
	.byte		N03	, Fs3, v108
	.byte	W06
	.byte		N06	, Bn2, v068
	.byte		N06	, Gs3, v127
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte			Bn2, v080
	.byte		N06	, Gs3, v127
	.byte	W06
	.byte			Gs3, v032
	.byte	W30
	.byte	W36
	.byte		N03	, Gn2, v080
	.byte		N03	, En3, v120
	.byte	W06
	.byte			Gn2, v076
	.byte		N03	, En3, v120
	.byte	W06
	.byte		N06	, Gn2, v072
	.byte		N06	, En3, v127
	.byte	W06
	.byte			En3, v032
	.byte	W06
	.byte			Gn2, v068
	.byte		N06	, En3, v127
	.byte	W06
	.byte			En3, v032
	.byte	W30
	.byte	W36
	.byte		N03	, Bn2, v064
	.byte		N03	, Fs3, v124
	.byte	W06
	.byte			Bn2, v064
	.byte		N03	, Fs3, v092
	.byte	W06
	.byte		N06	, Bn2, v068
	.byte		N06	, Gn3, v127
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte			Bn2, v080
	.byte		N06	, Gn3, v127
	.byte	W06
	.byte			Gn3, v032
	.byte	W30
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 56
	.byte	W24
	.byte	VOL	, v041
	.byte	W24
	.byte	PAN	, c_v+15
	.byte	W48
	.byte		N06	, Gn2, v068
	.byte		N06	, Dn3, v028
	.byte	W12
	.byte			Gn2, v040
	.byte		N06	, Dn3, v028
	.byte	W12
	.byte			Gn2, v056
	.byte		N06	, Dn3
	.byte	W12
	.byte			Gn2, v036
	.byte		N06	, Dn3
	.byte	W12
	.byte			Gn2, v060
	.byte		N06	, Dn3, v052
	.byte	W12
	.byte			Gn2, v040
	.byte		N06	, Dn3, v036
	.byte	W12
	.byte			Gn2, v068
	.byte		N06	, Dn3, v052
	.byte	W12
	.byte			Gn2, v040
	.byte		N06	, Dn3, v036
	.byte	W12
	.byte			Gn2, v068
	.byte		N06	, Dn3, v048
	.byte	W12
	.byte			Gn2, v040
	.byte		N06	, Dn3, v036
	.byte	W12
	.byte			Gn2, v068
	.byte		N06	, Dn3, v048
	.byte	W12
	.byte			Gn2, v040
	.byte		N06	, Dn3, v036
	.byte	W12
	.byte			Gn2, v064
	.byte		N06	, Dn3, v052
	.byte	W12
	.byte			Gn2, v040
	.byte		N06	, Dn3, v036
	.byte	W12
	.byte			Gn2, v056
	.byte		N06	, Dn3, v044
	.byte	W12
	.byte			Gn2, v056
	.byte		N06	, Ds3, v044
	.byte	W12
	.byte			Gn2, v056
	.byte		N06	, Dn3, v068
	.byte	W12
	.byte			Gn2, v036
	.byte		N06	, Dn3, v040
	.byte	W12
	.byte			Gn2, v056
	.byte		N06	, Dn3, v068
	.byte	W12
	.byte			Gn2, v040
	.byte		N06	, Dn3
	.byte	W12
	.byte			Gn2, v056
	.byte		N06	, Dn3, v068
	.byte	W12
	.byte			Gn2, v040
	.byte		N06	, Dn3
	.byte	W12
	.byte			Gn2, v048
	.byte		N06	, Dn3, v056
	.byte	W12
	.byte			Gn2, v036
	.byte		N06	, Dn3, v040
	.byte	W12
	.byte			Gn2, v052
	.byte		N06	, Dn3, v056
	.byte	W12
	.byte			Gn2, v036
	.byte		N06	, Dn3
	.byte	W12
	.byte			Gn2, v064
	.byte		N06	, Dn3, v076
	.byte	W12
	.byte			Gn2, v040
	.byte		N06	, Dn3, v044
	.byte	W12
	.byte			Gn2, v056
	.byte		N06	, Dn3, v076
	.byte	W12
	.byte			Gn2, v036
	.byte		N06	, Dn3, v044
	.byte	W12
	.byte			Gn2, v052
	.byte		N06	, Ds3, v068
	.byte	W12
	.byte			Gn2, v052
	.byte		N06	, Dn3, v068
	.byte	W12
	.byte			Fn2, v048
	.byte		N06	, Cn3, v056
	.byte	W12
	.byte			Fn2, v032
	.byte		N06	, Cn3, v044
	.byte	W12
	.byte			Fn2, v028
	.byte		N06	, Cn3, v040
	.byte	W12
	.byte			Fn2, v012
	.byte		N06	, Cn3, v028
	.byte	W12
	.byte			Fn2, v064
	.byte		N06	, Cn3, v048
	.byte	W12
	.byte			Fn2, v052
	.byte		N06	, Cn3, v036
	.byte	W12
	.byte			Fn2, v068
	.byte		N06	, Cn3, v048
	.byte	W12
	.byte			Fn2, v052
	.byte		N06	, Cn3, v036
	.byte	W12
	.byte			Fn2, v032
	.byte		N06	, Cn3, v044
	.byte	W12
	.byte			Fn2, v020
	.byte		N06	, Cn3, v032
	.byte	W12
	.byte			Fn2, v052
	.byte		N06	, Cn3, v076
	.byte	W12
	.byte			Fn2, v040
	.byte		N06	, Cn3, v060
	.byte	W12
	.byte			Fn2, v036
	.byte		N06	, Cn3, v052
	.byte	W12
	.byte			Fn2, v020
	.byte		N06	, Cn3, v040
	.byte	W12
	.byte			Fn2, v036
	.byte		N06	, Cn3, v040
	.byte	W12
	.byte			Fn2, v020
	.byte		N06	, Cn3, v028
	.byte	W12
	.byte			Gs2, v044
	.byte		N06	, Cs3, v064
	.byte	W12
	.byte			Gs2, v032
	.byte		N06	, Cs3, v048
	.byte	W12
	.byte			Gs2, v052
	.byte		N06	, Cs3, v064
	.byte	W12
	.byte			Gs2, v040
	.byte		N06	, Cs3, v048
	.byte	W12
	.byte			Gs2, v044
	.byte		N06	, Cs3, v068
	.byte	W12
	.byte			Gs2, v032
	.byte		N06	, Cs3, v056
	.byte	W12
	.byte			Gs2, v052
	.byte		N06	, Cs3, v072
	.byte	W12
	.byte			Gs2, v040
	.byte		N06	, Cs3, v060
	.byte	W12
	.byte			An2, v068
	.byte		N06	, Cs3
	.byte	W12
	.byte			An2
	.byte		N06	, Cs3
	.byte	W12
	.byte			An2
	.byte		N06	, Cs3
	.byte	W12
	.byte			An2
	.byte		N06	, Cs3
	.byte	W12
	.byte			An2
	.byte		N06	, Cs3
	.byte	W12
	.byte			Gs2
	.byte		N06	, Bn2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte	GOTO	
		.word	song008_5_2
	.byte	FINE

	@********************** Track  6 **********************@

	.global song008_6
song008_6:	@ 0x0854BB2D
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song008_6_1:
	.byte	VOICE	, 50
	.byte	VOL	, v041
	.byte	PAN	, c_v+35
	.byte		N05	, En2, v092
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v076
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v092
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v084
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v096
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v084
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v092
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v076
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v092
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v084
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v096
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v084
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v100
	.byte		N05	, Cs3
	.byte	W12
	.byte			En2, v088
	.byte		N05	, Cs3
	.byte	W12
	.byte			En2
	.byte		N05	, Cs3
	.byte	W12
	.byte			En2, v100
	.byte		N05	, Cs3
	.byte	W12
	.byte			En2, v076
	.byte		N05	, Cs3
	.byte	W12
	.byte			En2
	.byte		N05	, Cs3
	.byte	W12
	.byte			En2, v092
	.byte		N05	, Cs3
	.byte	W12
	.byte			Fs2, v076
	.byte		N05	, Cs3
	.byte	W06
	.byte			Gs2
	.byte		N05	, Ds3
	.byte	W06
	.byte			An2, v092
	.byte		N05	, En3
	.byte	W12
	.byte			An2, v060
	.byte		N05	, En3
	.byte	W12
	.byte			An2
	.byte		N05	, En3
	.byte	W12
	.byte			Gs2, v072
	.byte		N05	, En3
	.byte	W12
	.byte			Fs2, v084
	.byte		N05	, Ds3
	.byte	W12
	.byte			Fs2
	.byte		N05	, Ds3
	.byte	W12
	.byte			Fs2, v100
	.byte		N05	, Ds3
	.byte	W12
	.byte			Fs2, v084
	.byte		N05	, Ds3
	.byte	W12
	.byte			En2, v096
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v076
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v096
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v080
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v100
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v080
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v088
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v068
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v088
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v072
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v096
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v072
	.byte		N05	, Bn2
	.byte	W12
	.byte			En2, v100
	.byte		N05	, Cs3
	.byte	W12
	.byte			En2, v080
	.byte		N05	, Cs3
	.byte	W12
	.byte			En2
	.byte		N05	, Cs3
	.byte	W12
	.byte			En2, v100
	.byte		N05	, Cs3
	.byte	W12
	.byte			Fs2, v080
	.byte		N05	, Cs3
	.byte	W12
	.byte			Fs2, v104
	.byte		N05	, Cs3
	.byte	W12
	.byte			Gs2, v100
	.byte		N05	, Cs3
	.byte	W12
	.byte			An2, v080
	.byte		N05	, Ds3
	.byte	W12
	.byte			Gs2, v100
	.byte		N05	, En3
	.byte	W12
	.byte			Gs2, v080
	.byte		N05	, En3
	.byte	W12
	.byte			Gs2
	.byte		N05	, En3
	.byte	W12
	.byte			Gs2, v100
	.byte		N05	, En3
	.byte	W12
	.byte			Gs2, v080
	.byte		N05	, En3
	.byte	W12
	.byte			Gs2
	.byte		N05	, En3
	.byte	W12
	.byte			Gs2, v100
	.byte		N05	, En3
	.byte	W12
	.byte			Gs2, v080
	.byte		N05	, En3
	.byte	W12
	.byte	VOICE	, 57
	.byte	VOL	, v053
	.byte	PAN	, c_v+25
	.byte		N44	, En3, v092
	.byte		N44	, Gs3, v104
	.byte	W48
	.byte			Fs3, v092
	.byte		N44	, An3, v100
	.byte	W48
	.byte			Ds3, v084
	.byte		N44	, Fs3, v100
	.byte	W48
	.byte		N36	, En3, v084
	.byte		N11	, Gs3
	.byte	W12
	.byte		N05	, Gs3, v040
	.byte	W12
	.byte		N23	, Fs3, v084
	.byte	W24
	.byte		N44	, Cn3, v088
	.byte		N44	, En3, v084
	.byte	W48
	.byte			Dn3, v080
	.byte		N44	, Fs3, v088
	.byte	W48
	.byte			Dn3
	.byte		N44	, Fs3, v100
	.byte	W48
	.byte		N20	, En3, v080
	.byte		N23	, Gn3, v092
	.byte	W24
	.byte		N20	, Dn3, v080
	.byte		N23	, Fs3, v084
	.byte	W24
	.byte			Cn3, v092
	.byte	W24
	.byte			An2, v072
	.byte	W24
	.byte			Dn3, v080
	.byte	W24
	.byte			Bn2, v088
	.byte	W24
	.byte		N23	
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte			Cn3, v080
	.byte	W24
	.byte			An2
	.byte	W24
	.byte		N11	, Cn3
	.byte		N11	, En3, v076
	.byte	W12
	.byte			An2, v080
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Cn3, v084
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N44	, Cn3, v072
	.byte		N44	, En3, v088
	.byte	W48
	.byte		N40	, Dn3, v072
	.byte		N44	, Fs3, v088
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song008_6_1
	.byte	FINE

	@********************** Track  7 **********************@

	.global song008_7
song008_7:	@ 0x0854BCFE
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte		N48	, Cs2, v080
	.byte	W96
	.byte		N48	
	.byte	W96
	.byte		N06	, Fs1, v060
	.byte	W36
	.byte		N06	
	.byte	W48
	.byte			As1, v056
	.byte	W12
	.byte			Fs1, v060
	.byte	W36
	.byte		N06	
	.byte	W60
	.byte			Dn1, v108
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
song008_7_6:
	.byte		N05	, Dn1, v108
	.byte		N23	, Cs2, v080
	.byte	W06
	.byte		N05	, Dn1, v108
	.byte	W06
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte			Dn1, v104
	.byte	W06
song008_7_1:
	.byte		N05	, Dn1, v104
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Dn1, v108
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte	PEND
song008_7_2:
	.byte		N05	, Dn1, v108
	.byte	W06
	.byte			Dn1, v104
	.byte	W06
	.byte		N06	
	.byte	W24
	.byte			Dn1, v108
	.byte	W24
	.byte			Dn1, v104
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte			Dn1, v096
	.byte	W06
	.byte	PEND
	.byte		N06	, Dn1, v108
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v100
	.byte	W12
	.byte		N05	, Dn1, v108
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte			Dn1, v104
	.byte	W06
	.byte	PATT	
		.word	song008_7_1
	.byte	PATT	
		.word	song008_7_2
	.byte		N06	, Dn1, v108
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N05	, Dn1, v100
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N06	, Dn1, v108
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
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
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W18
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
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
	.byte		N06	
	.byte	W12
	.byte		N23	, Ds2, v072
	.byte	W24
	.byte		N05	, Fs1, v060
	.byte	W24
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N11	, As1, v056
	.byte	W12
	.byte		N05	, Fs1, v060
	.byte	W24
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N23	, As1, v056
	.byte	W24
	.byte		N05	, Fs1, v060
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N11	, As1, v056
	.byte	W12
	.byte			Cn2, v127
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte		N05	, Dn1, v104
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
song008_7_3:
	.byte		N32	, Cs2, v080
	.byte	W36
	.byte		N11	, Cn2, v127
	.byte	W24
	.byte			An1
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte	PEND
song008_7_4:
	.byte		N11	, Dn1, v104
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte			Cn2, v127
	.byte	W24
	.byte			An1
	.byte	W12
	.byte			Dn1, v104
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PEND
song008_7_5:
	.byte		N05	, Fn1, v127
	.byte	W12
	.byte		N05	
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			An1
	.byte	W12
	.byte			Dn1, v104
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PEND
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte		N11	
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte		N05	, Fn1, v127
	.byte	W12
	.byte			Cn2
	.byte	W06
	.byte			Fn1
	.byte	W06
	.byte	PATT	
		.word	song008_7_3
	.byte	PATT	
		.word	song008_7_4
	.byte	PATT	
		.word	song008_7_5
	.byte		N11	, Dn1, v104
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte		N11	
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte		N05	, As1, v052
	.byte	W06
	.byte			As1, v036
	.byte	W06
	.byte			As1, v064
	.byte	W06
	.byte			As1, v084
	.byte	W06
	.byte	GOTO	
		.word	song008_7_6
	.byte	FINE

	.align 2
	.global song008
song008:	@ 0x0854BE90
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup007		@ voicegroup/tone

	.word	song008_1		@ track
	.word	song008_2		@ track
	.word	song008_3		@ track
	.word	song008_4		@ track
	.word	song008_5		@ track
	.word	song008_6		@ track
	.word	song008_7		@ track
