	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song022_1
song022_1:	@ 0x08559C88
	.byte	KEYSH	, 0
song022_1_2:
	.byte	TEMPO	, 35
	.byte	W24
	.byte	VOICE	, 14
	.byte	W06
	.byte	VOL	, v055
	.byte	W06
	.byte	PAN	, c_v
	.byte	W60
song022_1_1:
	.byte	PAN	, c_v
	.byte		N24	, Fn2, v120
	.byte	W03
	.byte	PAN	, c_v-10
	.byte	W04
	.byte		c_v-20
	.byte	W04
	.byte		c_v-30
	.byte	W04
	.byte		c_v-40
	.byte	W03
	.byte		c_v-50
	.byte	W04
	.byte		c_v-60
	.byte	W02
	.byte		c_v-61
	.byte		N24	
	.byte	W02
	.byte	PAN	, c_v-51
	.byte	W02
	.byte		c_v-41
	.byte	W02
	.byte		c_v-31
	.byte	W02
	.byte		c_v-21
	.byte	W02
	.byte		c_v-11
	.byte	W02
	.byte		c_v-1
	.byte	W01
	.byte		c_v+9
	.byte	W02
	.byte		c_v+19
	.byte	W02
	.byte		c_v+29
	.byte	W02
	.byte		c_v+39
	.byte	W02
	.byte		c_v+49
	.byte	W02
	.byte		c_v+61
	.byte	W01
	.byte		c_v+63
	.byte		N36	
	.byte	W48
	.byte	PEND
	.byte	PAN	, c_v
	.byte	W96
	.byte	PATT	
		.word	song022_1_1
	.byte	PAN	, c_v
	.byte	W96
	.byte	PATT	
		.word	song022_1_1
	.byte	PAN	, c_v
	.byte	W96
	.byte	PATT	
		.word	song022_1_1
	.byte	W96
	.byte	W96
	.byte	VOICE	, 53
	.byte	W23
	.byte	VOL	, v055
	.byte	W01
	.byte		v027
	.byte	W24
	.byte	PAN	, c_v
	.byte	W48
	.byte	VOL	, v027
	.byte		N48	, Gn4, v108
	.byte	W02
	.byte	VOL	, v028
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
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
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		N24	, As3
	.byte	W01
	.byte	VOL	, v035
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v038
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
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte		N24	, Cs4
	.byte	W24
	.byte			Gn4
	.byte	W24
	.byte		N48	, Cn4
	.byte	W17
	.byte	VOL	, v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v012
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
	.byte		v003
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v000
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
		.word	song022_1_2
	.byte	FINE

	@********************** Track  2 **********************@

	.global song022_2
song022_2:	@ 0x08559D97
	.byte	KEYSH	, 0
song022_2_4:
	.byte	VOICE	, 57
	.byte	VOL	, v055
	.byte	PAN	, c_v-20
	.byte		N06	, Fn2, v052
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v008
	.byte	W06
	.byte			Fs2, v052
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v008
	.byte	W06
	.byte			Fn2, v052
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v008
	.byte	W06
	.byte			Fs2, v052
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v008
	.byte	W06
	.byte			Fn2, v052
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v008
	.byte	W06
	.byte			Fs2, v052
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v008
	.byte	W06
	.byte			Fn2, v052
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v008
	.byte	W06
	.byte			Fs2, v052
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v008
	.byte	W06
song022_2_2:
	.byte		N06	, Fn2, v052
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v008
	.byte	W06
	.byte			Fs2, v060
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v016
	.byte	W06
	.byte			Fn2, v068
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v024
	.byte	W06
	.byte			Fs2, v076
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v032
	.byte	W06
	.byte			Fn2, v084
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v040
	.byte	W06
	.byte			Fs2, v088
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v044
	.byte	W06
	.byte			Fn2, v080
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v036
	.byte	W06
	.byte			Fs2, v064
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v020
	.byte	W06
	.byte	PEND
song022_2_1:
	.byte		N06	, Fn2, v052
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v008
	.byte	W06
	.byte			Fs2, v052
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v008
	.byte	W06
	.byte			Fn2, v052
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v008
	.byte	W06
	.byte			Fs2, v052
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v008
	.byte	W06
	.byte			Fn2, v052
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v008
	.byte	W06
	.byte			Fs2, v052
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v008
	.byte	W06
	.byte			Fn2, v052
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v008
	.byte	W06
	.byte			Fs2, v052
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v008
	.byte	W06
	.byte	PEND
song022_2_3:
	.byte		N06	, Fn2, v052
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v008
	.byte	W06
	.byte			Fs2, v060
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v016
	.byte	W06
	.byte			Fn2, v068
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v024
	.byte	W06
	.byte			Fs2, v076
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v032
	.byte	W06
	.byte			Fn2, v084
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v040
	.byte	W06
	.byte			Fs2, v092
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v048
	.byte	W06
	.byte			Fn2, v100
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v056
	.byte	W06
	.byte			Fs2, v112
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v068
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song022_2_1
	.byte	PATT	
		.word	song022_2_2
	.byte	PATT	
		.word	song022_2_1
	.byte	PATT	
		.word	song022_2_3
	.byte	VOICE	, 51
	.byte	VOL	, v043
	.byte	PAN	, c_v+30
	.byte		N12	, Gs2, v088
	.byte		N12	, Bn2
	.byte	W12
	.byte		N06	, Bn2, v028
	.byte	W12
	.byte		N12	, Gs2, v088
	.byte		N12	, Bn2
	.byte	W12
	.byte		N06	, Bn2, v028
	.byte	W12
	.byte		N12	, Gs2, v088
	.byte		N12	, Bn2
	.byte	W12
	.byte		N06	, Bn2, v028
	.byte	W12
	.byte		N12	, Gs2, v088
	.byte		N12	, Bn2
	.byte	W12
	.byte		N06	, Bn2, v028
	.byte	W12
	.byte		N12	, Gn2, v088
	.byte		N12	, Cs3
	.byte	W12
	.byte		N06	, Cs3, v028
	.byte	W12
	.byte		N12	, Gn2, v088
	.byte		N12	, Cs3
	.byte	W12
	.byte		N06	, Cs3, v028
	.byte	W12
	.byte		N12	, Gn2, v088
	.byte		N12	, Cs3
	.byte	W12
	.byte		N06	, Cs3, v028
	.byte	W12
	.byte		N12	, Gn2, v088
	.byte		N12	, Cs3
	.byte	W12
	.byte		N06	, Cs3, v028
	.byte	W12
	.byte		N12	, Gs2, v088
	.byte		N12	, Bn2
	.byte	W12
	.byte		N06	, Bn2, v028
	.byte	W12
	.byte		N12	, Gs2, v088
	.byte		N12	, Bn2
	.byte	W12
	.byte		N06	, Bn2, v028
	.byte	W12
	.byte		N12	, Gs2, v088
	.byte		N12	, Bn2
	.byte	W12
	.byte		N06	, Bn2, v028
	.byte	W12
	.byte		N12	, Gs2, v088
	.byte		N12	, Bn2
	.byte	W12
	.byte		N06	, Bn2, v028
	.byte	W12
	.byte		N12	, Gn2, v088
	.byte	W12
	.byte		N06	, Gn2, v028
	.byte	W12
	.byte		N12	, Gn2, v088
	.byte	W12
	.byte		N06	, Gn2, v028
	.byte	W12
	.byte		N12	, Gn2, v088
	.byte	W12
	.byte		N06	, Gn2, v028
	.byte	W12
	.byte		N12	, Gn2, v088
	.byte	W12
	.byte			Gn2, v028
	.byte	W12
	.byte	W48
	.byte		N44	, Cn3, v068
	.byte	W48
	.byte		N21	, Ds3, v072
	.byte	W24
	.byte		N44	, Cs3
	.byte	W48
	.byte		N21	, Cn3
	.byte	W24
	.byte		N44	, Cs3
	.byte	W48
	.byte			Cn3, v068
	.byte	W48
	.byte		N56	, Cn3, v060
	.byte	W60
	.byte		N09	, Cn3, v080
	.byte	W12
	.byte			Fn3
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte		N21	, As2, v068
	.byte	W24
	.byte		N68	, Cn3
	.byte	W72
	.byte		N21	, Ds3
	.byte	W24
	.byte			Cs3
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte			As2
	.byte	W24
	.byte		N92	, Cn3
	.byte	W96
	.byte		N44	
	.byte	W48
	.byte			Ds3
	.byte	W48
	.byte	W24
	.byte		N21	, Cn3
	.byte		N21	, Ds3, v080
	.byte	W24
	.byte			As2, v072
	.byte		N21	, Cs3, v092
	.byte	W24
	.byte			Gs2, v084
	.byte		N21	, Cn3, v108
	.byte	W24
	.byte	GOTO	
		.word	song022_2_4
	.byte	FINE

	@********************** Track  3 **********************@

	.global song022_3
song022_3:	@ 0x08559FA8
	.byte	KEYSH	, 0
song022_3_1:
	.byte	VOICE	, 50
	.byte	VOL	, v043
	.byte	PAN	, c_v+18
	.byte		N44	, Cn2, v116
	.byte		N48	, Fn2
	.byte	W48
	.byte		N21	, Cs2
	.byte		N24	, Fs2
	.byte	W24
	.byte		N21	, Ds2
	.byte		N24	, Gs2
	.byte	W18
	.byte	PAN	, c_v+18
	.byte	W06
	.byte		N44	, Cn2
	.byte		N48	, Fn2
	.byte	W48
	.byte		N44	, Cs2
	.byte		N48	, Fs2
	.byte	W48
	.byte		N92	, Cn2
	.byte		N96	, Fn2
	.byte	W96
	.byte	VOL	, v043
	.byte		N92	, Gn2
	.byte		N96	, Cn3
	.byte	W01
	.byte	VOL	, v042
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
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W05
	.byte		v032
	.byte	W03
	.byte		v032
	.byte	W03
	.byte		v032
	.byte	W03
	.byte		v033
	.byte	W03
	.byte		v033
	.byte	W03
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W03
	.byte		v035
	.byte	W03
	.byte		v035
	.byte	W03
	.byte		v035
	.byte	W03
	.byte		v036
	.byte	W03
	.byte		v036
	.byte	W03
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v039
	.byte	W03
	.byte		v039
	.byte	W02
	.byte		v040
	.byte	W03
	.byte		v040
	.byte	W03
	.byte		v041
	.byte	W03
	.byte		v041
	.byte	W03
	.byte		v042
	.byte	W03
	.byte		v042
	.byte	W03
	.byte		v043
	.byte	W02
	.byte		N44	, Gs2
	.byte		N48	, Cs3
	.byte	W48
	.byte		N44	, En2
	.byte		N48	, An2
	.byte	W48
	.byte		N44	, Gn2
	.byte		N48	, Cn3
	.byte	W48
	.byte		N44	, Ds2, v112
	.byte		N48	, Gs2
	.byte	W48
	.byte		N68	, Cn2, v108
	.byte		N72	, Fn2
	.byte	W72
	.byte		N09	, Cn2, v116
	.byte		N12	, Fn2
	.byte	W12
	.byte		N09	, Dn2
	.byte		N12	, Gn2
	.byte	W12
	.byte		N56	, Ds2
	.byte		N72	, Gs2
	.byte	W96
	.byte	W24
	.byte		N24	, Gs2, v108
	.byte	W24
	.byte		N48	, Dn3
	.byte	W48
	.byte		N24	, Gn2
	.byte	W24
	.byte			As2
	.byte	W24
	.byte			Cs3
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte	W24
	.byte		N21	, Bn2
	.byte		N24	, Dn3
	.byte	W24
	.byte		N32	, Gs3
	.byte		N36	, Bn3
	.byte	W36
	.byte		N06	, Fs3
	.byte		N06	, An3
	.byte	W06
	.byte			Fn3
	.byte		N06	, Gs3
	.byte	W06
	.byte		N68	, En3
	.byte		N72	, Gn3
	.byte	W92
	.byte	W03
	.byte	VOL	, v043
	.byte	PAN	, c_v+18
	.byte	W01
	.byte	VOICE	, 54
	.byte	VOL	, v000
	.byte	PAN	, c_v-10
	.byte	W44
	.byte	W02
	.byte	VOL	, v001
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v005
	.byte		N21	, As2, v092
	.byte		N24	, Ds3, v108
	.byte	W01
	.byte	VOL	, v007
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte		N09	, Cs3, v092
	.byte		N12	, Fn3, v108
	.byte	W12
	.byte		N09	, Ds3, v088
	.byte		N12	, Fs3, v104
	.byte	W12
	.byte		N21	, Fn3, v096
	.byte		N24	, Gs3, v112
	.byte	W24
	.byte		N21	, Ds3, v088
	.byte		N24	, Fs3, v104
	.byte	W24
	.byte		N21	, Cs3, v088
	.byte		N24	, Fn3, v108
	.byte	W24
	.byte		N21	, Cn3, v096
	.byte		N24	, Ds3, v108
	.byte	W24
	.byte		N44	, Cs3, v096
	.byte		N48	, Fn3, v108
	.byte	W48
	.byte		N44	, Gs2, v088
	.byte		N48	, Cn3, v108
	.byte	W48
	.byte		N21	, Gn2, v088
	.byte		N24	, As2, v108
	.byte	W24
	.byte		N56	, Gs2, v088
	.byte		N60	, Cn3, v112
	.byte	W72
	.byte		N44	, Fs2, v092
	.byte		N48	, As2, v108
	.byte	W48
	.byte		N68	, Gs2, v092
	.byte		N72	, Cn3, v108
	.byte	W48
	.byte	W24
	.byte		N21	, As2, v092
	.byte		N24	, Cs3, v108
	.byte	W24
	.byte		N18	, Cn3, v092
	.byte		N24	, Ds3, v104
	.byte	W24
	.byte		N21	, As2, v096
	.byte		N24	, Cs3, v104
	.byte	W24
	.byte		N72	, Gs2, v092
	.byte		N78	, Cn3, v100
	.byte	W84
	.byte		N06	, Gs2, v096
	.byte		N06	, Cn3, v100
	.byte	W06
	.byte			As2, v096
	.byte		N06	, Cs3, v100
	.byte	W06
	.byte		N42	, Cn3, v084
	.byte		N48	, Ds3, v096
	.byte	W48
	.byte		N44	, Cn3, v088
	.byte		N48	, Fn3, v108
	.byte	W48
	.byte		N44	, Ds3, v096
	.byte		N48	, Fs3, v116
	.byte	W48
	.byte		N44	, Fs3, v108
	.byte		N48	, Gs3, v127
	.byte	W48
	.byte	GOTO	
		.word	song022_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song022_4
song022_4:	@ 0x0855A170
	.byte	KEYSH	, 0
song022_4_6:
	.byte	VOICE	, 49
	.byte	VOL	, v055
	.byte	PAN	, c_v
	.byte		N24	, Fn1, v127
	.byte	W48
	.byte		N24	
	.byte	W48
song022_4_1:
	.byte		N24	, Fn1, v127
	.byte	W48
	.byte		N24	
	.byte	W48
	.byte	PEND
	.byte	PATT	
		.word	song022_4_1
	.byte	PATT	
		.word	song022_4_1
	.byte	PATT	
		.word	song022_4_1
	.byte	PATT	
		.word	song022_4_1
	.byte	PATT	
		.word	song022_4_1
	.byte	PATT	
		.word	song022_4_1
song022_4_2:
	.byte		N06	, Cs1, v127
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte	PEND
song022_4_3:
	.byte		N06	, Gn1, v127
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song022_4_2
	.byte	PATT	
		.word	song022_4_3
song022_4_4:
	.byte		N12	, Fn1, v108
	.byte	W12
	.byte			Cn2, v116
	.byte	W12
	.byte			Cs2, v108
	.byte	W12
	.byte			Cn2, v116
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte			Cn2, v124
	.byte	W12
	.byte			Cs2, v100
	.byte	W12
	.byte			Cn2, v124
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song022_4_4
	.byte	PATT	
		.word	song022_4_4
	.byte	PATT	
		.word	song022_4_4
song022_4_5:
	.byte		N12	, Ds1, v108
	.byte	W12
	.byte			Cn2, v116
	.byte	W12
	.byte			Cs2, v108
	.byte	W12
	.byte			Cn2, v116
	.byte	W12
	.byte			Ds1
	.byte	W12
	.byte			Cn2, v124
	.byte	W12
	.byte			Cs2, v100
	.byte	W12
	.byte			Cn2, v124
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song022_4_5
	.byte	PATT	
		.word	song022_4_5
	.byte	PATT	
		.word	song022_4_5
	.byte		N12	, Ds1, v108
	.byte	W12
	.byte			Cn2, v116
	.byte	W12
	.byte			Cs2, v108
	.byte	W12
	.byte			Cn2, v116
	.byte	W12
	.byte			Ds1
	.byte	W12
	.byte			Cn2, v124
	.byte	W12
	.byte			Ds2, v100
	.byte	W12
	.byte			Cs2, v124
	.byte	W12
	.byte	GOTO	
		.word	song022_4_6
	.byte	FINE

	@********************** Track  5 **********************@

	.global song022_5
song022_5:	@ 0x0855A231
	.byte	KEYSH	, 0
song022_5_4:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 52
	.byte	W24
	.byte	VOL	, v043
	.byte	W24
	.byte	PAN	, c_v-30
	.byte	W48
	.byte		N48	, Cs4, v116
	.byte	W48
	.byte			An3
	.byte	W48
	.byte			Cn4
	.byte	W48
	.byte			Gs3
	.byte	W48
	.byte		TIE	, Fn3
	.byte	W08
	.byte	VOL	, v043
	.byte	W06
	.byte		v042
	.byte	W04
	.byte		v042
	.byte	W03
	.byte		v042
	.byte	W03
	.byte		v041
	.byte	W04
	.byte		v041
	.byte	W03
	.byte		v040
	.byte	W04
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
	.byte		v038
	.byte	W04
	.byte		v037
	.byte	W03
	.byte		v037
	.byte	W04
	.byte		v036
	.byte	W03
	.byte		v036
	.byte	W03
	.byte		v035
	.byte	W04
	.byte		v035
	.byte	W03
	.byte		v035
	.byte	W03
	.byte		v034
	.byte	W04
	.byte		v034
	.byte	W03
	.byte		v033
	.byte	W04
	.byte		v033
	.byte	W03
	.byte		v032
	.byte	W03
	.byte		v032
	.byte	W01
	.byte	W03
	.byte		v032
	.byte	W03
	.byte		v031
	.byte	W03
	.byte		v031
	.byte	W04
	.byte		v030
	.byte	W03
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W05
	.byte		v030
	.byte	W02
	.byte		EOT	
	.byte	VOL	, v030
	.byte		N12	
	.byte	W03
	.byte	VOL	, v031
	.byte	W02
	.byte		v031
	.byte	W03
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		N12	, Gn3
	.byte	W01
	.byte	VOL	, v032
	.byte	W03
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W03
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		N12	, Gs3
	.byte	W02
	.byte	VOL	, v035
	.byte	W02
	.byte		v035
	.byte	W03
	.byte		v035
	.byte	W02
	.byte		v036
	.byte	W03
	.byte		v036
	.byte		N12	, As3
	.byte	W03
	.byte	VOL	, v037
	.byte	W02
	.byte		v037
	.byte	W03
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		N12	, Cn4
	.byte	W01
	.byte	VOL	, v038
	.byte	W02
	.byte		v039
	.byte	W03
	.byte		v039
	.byte	W02
	.byte		v040
	.byte	W03
	.byte		v040
	.byte	W01
	.byte		N12	, Cs4
	.byte	W01
	.byte	VOL	, v041
	.byte	W03
	.byte		v041
	.byte	W03
	.byte		v042
	.byte	W02
	.byte		v042
	.byte	W03
	.byte		v043
	.byte		N72	, Dn4
	.byte	W05
	.byte	VOL	, v043
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v029
	.byte	W04
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W01
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
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v041
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v043
	.byte	W03
	.byte		N06	
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte		N90	, As3
	.byte	W32
	.byte	W01
	.byte	VOL	, v043
	.byte	W02
	.byte		v042
	.byte	W02
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
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W02
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
	.byte		v011
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W04
	.byte		v043
	.byte		N72	, Dn4
	.byte	W04
	.byte	VOL	, v043
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v041
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
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W02
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
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v039
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
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v043
	.byte	W05
	.byte		N06	
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte		N90	, As3
	.byte	W32
	.byte	W02
	.byte	VOL	, v043
	.byte	W02
	.byte		v042
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
	.byte	W02
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
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
	.byte		v032
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
	.byte		v028
	.byte	W01
	.byte		v027
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
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W05
	.byte		v043
	.byte		N06	, Cn4, v072
	.byte	W06
	.byte			Cn4, v008
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Cs4, v008
	.byte	W06
	.byte			Cn4, v072
	.byte	W06
	.byte			Cn4, v008
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Cs4, v008
	.byte	W06
	.byte			Cn4, v072
	.byte	W06
	.byte			Cn4, v008
	.byte	W06
	.byte			Cs4, v072
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			Cs4
	.byte	W12
song022_5_1:
	.byte		N06	, Cn4, v072
	.byte	W06
	.byte			Cn4, v008
	.byte	W06
	.byte			Cs4, v084
	.byte	W06
	.byte			Cs4, v020
	.byte	W06
	.byte			Cn4, v096
	.byte	W06
	.byte			Cn4, v032
	.byte	W06
	.byte			Cs4, v108
	.byte	W06
	.byte			Cs4, v044
	.byte	W06
	.byte			Cn4, v120
	.byte	W06
	.byte			Cn4, v056
	.byte	W06
	.byte			Cs4, v124
	.byte	W06
	.byte			Cs4, v060
	.byte	W06
	.byte			Cn4, v112
	.byte	W06
	.byte			Cn4, v048
	.byte	W06
	.byte			Cs4, v092
	.byte	W06
	.byte			Cs4, v028
	.byte	W06
	.byte	PEND
song022_5_2:
	.byte		N06	, Cn4, v076
	.byte	W06
	.byte			Cn4, v008
	.byte	W06
	.byte			Cs4, v076
	.byte	W06
	.byte			Cs4, v008
	.byte	W06
	.byte			Cn4, v076
	.byte	W06
	.byte			Cn4, v008
	.byte	W06
	.byte			Cs4, v076
	.byte	W06
	.byte			Cs4, v008
	.byte	W06
	.byte			Cn4, v076
	.byte	W06
	.byte			Cn4, v008
	.byte	W06
	.byte			Cs4, v076
	.byte	W06
	.byte			Cs4, v008
	.byte	W06
	.byte			Cn4, v076
	.byte	W06
	.byte			Cn4, v008
	.byte	W06
	.byte			Cs4, v076
	.byte	W06
	.byte			Cs4, v008
	.byte	W06
	.byte	PEND
song022_5_3:
	.byte		N06	, Cn4, v076
	.byte	W06
	.byte			Cn4, v008
	.byte	W06
	.byte			Cs4, v088
	.byte	W06
	.byte			Cs4, v020
	.byte	W06
	.byte			Cn4, v100
	.byte	W06
	.byte			Cn4, v036
	.byte	W06
	.byte			Cs4, v112
	.byte	W06
	.byte			Cs4, v048
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v060
	.byte	W06
	.byte			Cs4, v127
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Cn4, v127
	.byte	W06
	.byte			Cn4, v084
	.byte	W06
	.byte			Cs4, v127
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte	PEND
	.byte			Cn4, v072
	.byte	W06
	.byte			Cn4, v008
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Cs4, v008
	.byte	W06
	.byte			Cn4, v072
	.byte	W06
	.byte			Cn4, v008
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Cs4, v008
	.byte	W06
	.byte			Cn4, v072
	.byte	W06
	.byte			Cn4, v008
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Cs4, v008
	.byte	W06
	.byte			Cn4, v072
	.byte	W06
	.byte			Cn4, v008
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Cs4, v008
	.byte	W06
	.byte	PATT	
		.word	song022_5_1
	.byte	PATT	
		.word	song022_5_2
	.byte	PATT	
		.word	song022_5_2
	.byte	PATT	
		.word	song022_5_3
	.byte	GOTO	
		.word	song022_5_4
	.byte	FINE

	@********************** Track  6 **********************@

	.global song022_6
song022_6:	@ 0x0855A59C
	.byte	KEYSH	, 0
song022_6_3:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 47
	.byte	VOL	, v055
	.byte	PAN	, c_v
	.byte	W96
	.byte		N24	, Dn3, v127
	.byte	W72
	.byte		N03	, Gs2, v064
	.byte	W03
	.byte			Gs2, v072
	.byte	W03
	.byte			Gs2, v080
	.byte	W03
	.byte			Gs2, v088
	.byte	W03
	.byte			Gs2, v096
	.byte	W03
	.byte			Gs2, v104
	.byte	W03
	.byte			Gs2, v112
	.byte	W03
	.byte			Gs2, v120
	.byte	W03
	.byte		N24	, Gs2, v127
	.byte	W84
	.byte		N12	, Dn3
	.byte	W12
	.byte		N24	
	.byte	W96
	.byte	W72
	.byte		N03	, Cn3, v064
	.byte	W03
	.byte			Cn3, v072
	.byte	W03
	.byte			Cn3, v080
	.byte	W03
	.byte			Cn3, v088
	.byte	W03
	.byte			Cn3, v096
	.byte	W03
	.byte			Cn3, v104
	.byte	W03
	.byte			Cn3, v112
	.byte	W03
	.byte			Cn3, v120
	.byte	W03
song022_6_1:
	.byte		N21	, Fn2, v127
	.byte	W24
	.byte		N21	
	.byte	W72
	.byte	PEND
song022_6_2:
	.byte		N21	, Fn2, v127
	.byte	W24
	.byte		N21	
	.byte	W48
	.byte		N21	
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song022_6_1
	.byte		N21	, Fn2, v127
	.byte	W24
	.byte		N21	
	.byte	W60
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PATT	
		.word	song022_6_2
	.byte	PATT	
		.word	song022_6_1
	.byte		N21	, Fn2, v127
	.byte	W72
	.byte		N21	
	.byte	W24
	.byte	PATT	
		.word	song022_6_1
	.byte	PATT	
		.word	song022_6_1
	.byte	GOTO	
		.word	song022_6_3
	.byte	FINE

	@********************** Track  7 **********************@

	.global song022_7
song022_7:	@ 0x0855A62B
	.byte	KEYSH	, 0
song022_7_2:
	.byte	VOICE	, 127
	.byte	VOL	, v055
	.byte	PAN	, c_v
	.byte		N12	, Cn1, v116
	.byte		N24	, An2, v080
	.byte	W48
	.byte		N12	, Cn1, v116
	.byte	W48
	.byte	W96
song022_7_1:
	.byte		N12	, Cn1, v116
	.byte	W48
	.byte		N12	
	.byte	W48
	.byte	PEND
	.byte	W72
	.byte		N12	
	.byte	W24
	.byte	PATT	
		.word	song022_7_1
	.byte	W96
	.byte	PATT	
		.word	song022_7_1
	.byte	W60
	.byte		N36	, En2, v088
	.byte	W36
	.byte			An2, v076
	.byte	W96
	.byte	W84
	.byte		N12	
	.byte	W12
	.byte		N36	
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
	.byte	W60
	.byte			En2, v108
	.byte	W36
	.byte	GOTO	
		.word	song022_7_2
	.byte	FINE

	.align 2
	.global song022
song022:	@ 0x0855A674
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup010		@ voicegroup/tone

	.word	song022_1		@ track
	.word	song022_2		@ track
	.word	song022_3		@ track
	.word	song022_4		@ track
	.word	song022_5		@ track
	.word	song022_6		@ track
	.word	song022_7		@ track
