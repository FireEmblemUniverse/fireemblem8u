	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song069_1
song069_1:	@ 0x0857467C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 69
	.byte	W24
song069_1_2:
	.byte	VOICE	, 50
	.byte	VOL	, v042
	.byte	PAN	, c_v-25
	.byte		TIE	, As3, v100
	.byte	W96
	.byte	W68
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N05	, As3, v032
	.byte	W12
	.byte			Ds4, v100
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte		N80	, Fs4
	.byte	W84
	.byte		N05	, En4
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte		N80	, Cs4
	.byte	W84
	.byte		N05	, Cs4, v032
	.byte	W12
	.byte		N44	, Bn3, v100
	.byte	W48
	.byte		N05	, Bn3, v032
	.byte	W12
	.byte			Bn3, v100
	.byte	W06
	.byte			Bn3, v032
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Fs4, v032
	.byte	W06
	.byte			Bn4, v100
	.byte	W06
	.byte			Bn4, v032
	.byte	W06
	.byte		N17	, Bn4, v100
	.byte	W18
	.byte		N05	, Bn4, v032
	.byte	W06
	.byte		N17	, An4, v100
	.byte	W18
	.byte		N05	, An4, v032
	.byte	W06
	.byte		N11	, Gn4, v100
	.byte	W12
	.byte		N05	, Fs4
	.byte	W06
	.byte			Fs4, v032
	.byte	W06
	.byte			En4, v100
	.byte	W06
	.byte			En4, v032
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v032
	.byte	W06
	.byte		N80	, Cn4, v100
	.byte	W84
	.byte		N05	, Bn3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte		N56	, Dn4
	.byte	W60
	.byte		N11	, Bn3
	.byte	W12
	.byte	VOICE	, 49
	.byte	VOL	, v038
	.byte	PAN	, c_v+25
	.byte		N05	, Cn3, v112
	.byte	W04
	.byte			Dn3
	.byte	W04
	.byte			En3
	.byte	W04
	.byte			Fs3
	.byte	W04
	.byte			Gn3
	.byte	W04
	.byte			An3
	.byte	W04
	.byte		N68	, Bn3
	.byte	W72
	.byte		N05	, An3
	.byte	W06
	.byte			An3, v032
	.byte	W06
	.byte			Gn3, v112
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte		N44	, Fs3, v112
	.byte	W48
	.byte		N28	, Dn3
	.byte	W30
	.byte		N05	, Dn3, v032
	.byte	W06
	.byte			En3, v112
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte		N23	, Gn3
	.byte	W24
	.byte			En3
	.byte	W24
	.byte			Fs3
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte			An3
	.byte	W24
	.byte			Fs3
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte			Bn3
	.byte	W24
	.byte		N68	, En3, v080
	.byte	W72
	.byte		N05	, Fs3
	.byte	W06
	.byte			Fs3, v032
	.byte	W06
	.byte			Gn3, v080
	.byte	W06
	.byte			Gn3, v032
	.byte	W06
	.byte		N44	, Fs3, v080
	.byte	W48
	.byte			Dn3
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 17
	.byte	VOL	, v049
	.byte	PAN	, c_v-10
	.byte		N44	, Ds4, v120
	.byte		N44	, As4, v127
	.byte	W48
	.byte			As3, v120
	.byte		N44	, Ds4, v127
	.byte	W48
	.byte			Fn4, v120
	.byte		N44	, Gs4, v127
	.byte	W48
	.byte			Cs4, v120
	.byte		N44	, Fn4, v127
	.byte	W48
	.byte		N20	, Ds4, v120
	.byte		N20	, Fs4, v127
	.byte	W24
	.byte			As3, v120
	.byte		N20	, Ds4, v127
	.byte	W24
	.byte			Ds4, v120
	.byte		N20	, Fs4, v127
	.byte	W24
	.byte			Fs4, v120
	.byte		N20	, As4, v127
	.byte	W24
song069_1_1:
	.byte		N20	, Fn4, v120
	.byte		N20	, Gs4, v127
	.byte	W24
	.byte			Cs4, v120
	.byte		N20	, Fn4, v127
	.byte	W24
	.byte			Ds4, v120
	.byte		N20	, Fs4, v127
	.byte	W24
	.byte			Fn4, v120
	.byte		N20	, Gs4, v127
	.byte	W24
	.byte	PEND
	.byte		N52	, Fs4, v120
	.byte		N52	, As4, v127
	.byte	W60
	.byte		N05	, Fs4, v120
	.byte		N05	, As4, v127
	.byte	W12
	.byte			Gs4, v120
	.byte		N05	, Bn4, v127
	.byte	W12
	.byte			As4, v120
	.byte		N05	, Cs5, v127
	.byte	W12
	.byte		N44	, As4, v120
	.byte		N44	, Cs5, v127
	.byte	W48
	.byte			Fs4, v120
	.byte		N44	, As4, v127
	.byte	W48
	.byte	PATT	
		.word	song069_1_1
	.byte		N44	, Cn4, v120
	.byte		N44	, Fs4, v127
	.byte	W48
	.byte			Bn3, v120
	.byte		N44	, Fn4, v127
	.byte	W48
	.byte	GOTO	
		.word	song069_1_2
	.byte	FINE

	@********************** Track  2 **********************@

	.global song069_2
song069_2:	@ 0x085747E5
	.byte	KEYSH	, 0
	.byte	W06
	.byte	VOICE	, 33
	.byte	W06
	.byte	VOL	, v042
	.byte	W06
	.byte	PAN	, c_v
	.byte	W06
song069_2_4:
	.byte		N06	, As1, v127
	.byte	W12
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
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			Fs2
	.byte	W12
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
	.byte			En2
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			Cs2
	.byte	W12
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
	.byte		N06	
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			En2
	.byte	W12
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
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Cn2
	.byte	W12
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
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			An1
	.byte	W12
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
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
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
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
song069_2_2:
	.byte		N06	, Cn2, v127
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
song069_2_1:
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
	.byte	PEND
	.byte			An1
	.byte	W12
	.byte		N18	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song069_2_1
	.byte	PATT	
		.word	song069_2_2
	.byte	PATT	
		.word	song069_2_1
	.byte		N06	, An1, v127
	.byte	W12
	.byte		N18	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte		N18	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte		N18	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N18	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			An1
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
song069_2_3:
	.byte		N06	, Ds2, v127
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
		.word	song069_2_3
	.byte	PATT	
		.word	song069_2_3
	.byte		N06	, Cs2, v127
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
	.byte			Bn1
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			As2
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
	.byte			Gs2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	GOTO	
		.word	song069_2_4
	.byte	FINE

	@********************** Track  3 **********************@

	.global song069_3
song069_3:	@ 0x08574939
	.byte	KEYSH	, 0
	.byte	VOICE	, 61
	.byte	VOL	, v049
	.byte	PAN	, c_v+5
	.byte		N05	, Fs2, v124
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Cn3
	.byte	W06
song069_3_3:
	.byte		N42	, Cs3, v127
	.byte	W54
	.byte		N06	, As2, v028
	.byte	W06
	.byte		N05	, Cs3, v112
	.byte	W06
	.byte		N06	, Cs3, v028
	.byte	W06
	.byte		N05	, Fn3, v112
	.byte	W06
	.byte		N06	, Fn3, v028
	.byte	W06
	.byte		N05	, Gs3, v127
	.byte	W06
	.byte		N06	, Gs3, v028
	.byte	W06
	.byte		N17	, Gn3, v127
	.byte	W18
	.byte		N06	, Gn3, v028
	.byte	W06
	.byte		N17	, Ds3, v120
	.byte	W18
	.byte		N06	, Ds3, v028
	.byte	W06
	.byte		N12	, As2, v120
	.byte	W18
	.byte		N06	, As2, v028
	.byte	W06
	.byte		N05	, As2, v116
	.byte	W06
	.byte		N06	, As2, v028
	.byte	W06
	.byte		N05	, Cn3, v112
	.byte	W06
	.byte		N06	, Cn3, v028
	.byte	W06
	.byte		N30	, Cs3, v124
	.byte	W36
	.byte		N05	, Cn3, v112
	.byte	W06
	.byte			Cs3, v116
	.byte	W06
	.byte		N32	, Ds3, v124
	.byte	W36
	.byte		N05	, Cs3, v116
	.byte	W06
	.byte			Ds3, v120
	.byte	W06
	.byte		N32	, En3, v124
	.byte	W36
	.byte		N05	, Ds3, v116
	.byte	W06
	.byte			En3
	.byte	W06
	.byte		N32	, Fs3, v124
	.byte	W36
	.byte		N05	, En3, v104
	.byte	W06
	.byte			Fs3, v112
	.byte	W06
	.byte		N24	, Gn3, v124
	.byte	W30
	.byte		N06	, Gn3, v028
	.byte	W06
	.byte			Fs3, v120
	.byte	W06
	.byte		N04	, Gn3
	.byte	W06
	.byte		N17	, An3, v127
	.byte	W18
	.byte		N06	, An3, v028
	.byte	W06
	.byte		N17	, Fs3, v127
	.byte	W18
	.byte		N06	, Fs3, v028
	.byte	W06
	.byte		N48	, En3, v124
	.byte	W54
	.byte		N06	, En3, v028
	.byte	W06
	.byte			Dn3, v120
	.byte	W06
	.byte			Dn3, v028
	.byte	W06
	.byte			En3, v120
	.byte	W06
	.byte			En3, v028
	.byte	W06
	.byte			Fs3, v120
	.byte	W06
	.byte			Fs3, v028
	.byte	W06
	.byte		N30	, Gn3, v120
	.byte	W30
	.byte		N06	, Gn3, v028
	.byte	W06
	.byte			Fs3, v120
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte		N30	, An3
	.byte	W30
	.byte		N06	, An3, v028
	.byte	W06
	.byte			Gn3, v120
	.byte	W06
	.byte			An3
	.byte	W06
	.byte		N48	, Bn3
	.byte	W48
	.byte		N36	, An3
	.byte	W48
	.byte	VOICE	, 46
	.byte	VOL	, v038
	.byte	PAN	, c_v-40
	.byte		N05	, Gn4, v088
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
song069_3_1:
	.byte		N05	, Fs4, v088
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte	PEND
	.byte			En4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte	PATT	
		.word	song069_3_1
	.byte		N05	, Gn4, v088
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte	PATT	
		.word	song069_3_1
	.byte	VOICE	, 61
	.byte	VOL	, v049
	.byte	PAN	, c_v+5
	.byte		N40	, Cn3, v100
	.byte	W42
	.byte		N05	, Cn3, v032
	.byte	W06
	.byte		N40	, Dn3, v100
	.byte	W42
	.byte		N05	, Dn3, v032
	.byte	W06
song069_3_2:
	.byte		N40	, En3, v100
	.byte	W42
	.byte		N05	, En3, v032
	.byte	W06
	.byte		N40	, Fs3, v100
	.byte	W42
	.byte		N05	, Fs3, v032
	.byte	W06
	.byte	PEND
	.byte		N40	, Cn3, v100
	.byte	W42
	.byte		N05	, Cn3, v032
	.byte	W06
	.byte		N40	, Dn3, v100
	.byte	W42
	.byte		N05	, Dn3, v032
	.byte	W06
	.byte	PATT	
		.word	song069_3_2
	.byte	W96
	.byte	W96
	.byte	W24
	.byte	VOICE	, 50
	.byte	W24
	.byte	VOL	, v042
	.byte	W24
	.byte	PAN	, c_v-25
	.byte	W24
	.byte	W72
	.byte		N04	, Bn3, v088
	.byte	W04
	.byte			Cs4
	.byte	W04
	.byte			Ds4
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			Fs4
	.byte	W04
	.byte			Gs4
	.byte	W04
	.byte		TIE	, As4
	.byte	W96
	.byte	W24
	.byte	VOL	, v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W02
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v035
	.byte	W02
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
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v028
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
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v023
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
	.byte		v019
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
	.byte		v015
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
	.byte		v008
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v006
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
	.byte	W03
	.byte		EOT	
	.byte	VOICE	, 61
	.byte	VOL	, v049
	.byte	PAN	, c_v+5
	.byte		N32	, Gs2, v120
	.byte	W36
	.byte		N05	, As2
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte		N40	, Cs3
	.byte	W42
	.byte		N05	, Cs3, v032
	.byte	W06
	.byte		N56	, Ds3, v120
	.byte	W60
	.byte		N05	, Ds3, v032
	.byte	W12
	.byte			Fs2, v124
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte	GOTO	
		.word	song069_3_3
	.byte	FINE

	@********************** Track  4 **********************@

	.global song069_4
song069_4:	@ 0x08574BB6
	.byte	KEYSH	, 0
	.byte	W24
song069_4_1:
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
	.byte	VOICE	, 73
	.byte	VOL	, v042
	.byte	PAN	, c_v
	.byte	W72
	.byte		N05	, Fs4, v100
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			Bn4
	.byte	W06
	.byte		N68	, Dn5
	.byte	W72
	.byte		N05	, Cn5
	.byte	W12
	.byte			Bn4
	.byte	W12
	.byte		N44	, An4
	.byte	W48
	.byte		N23	, Gn4
	.byte	W24
	.byte			Fs4
	.byte	W24
	.byte		N05	, En4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte		N32	, En4
	.byte	W36
	.byte		N05	, Fs4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte		N32	, Fs4
	.byte	W36
	.byte		N05	, Gn4
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte		N32	, Gn4
	.byte	W36
	.byte		N05	, An4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			Bn4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Bn4
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			En4
	.byte		N05	, Gn4
	.byte	W06
	.byte			Dn4
	.byte		N05	, Fs4
	.byte	W06
	.byte		N32	, En4
	.byte		N32	, Gn4
	.byte	W36
	.byte		N05	, Fs4
	.byte		N05	, An4
	.byte	W06
	.byte			En4
	.byte		N05	, Gn4
	.byte	W06
	.byte		N32	, Fs4
	.byte		N32	, An4
	.byte	W36
	.byte		N05	, Gn4
	.byte		N05	, Bn4
	.byte	W06
	.byte			Fs4
	.byte		N05	, An4
	.byte	W06
	.byte		N32	, Gn4
	.byte		N32	, Bn4
	.byte	W36
	.byte		N05	, An4
	.byte		N05	, Cn5
	.byte	W06
	.byte			Gn4
	.byte		N05	, Bn4
	.byte	W06
	.byte			An4
	.byte		N05	, Cn5
	.byte	W06
	.byte			Bn4
	.byte		N05	, Dn5
	.byte	W06
	.byte			Cn5
	.byte		N05	, En5
	.byte	W06
	.byte			Bn4
	.byte		N05	, Dn5
	.byte	W06
	.byte			An4
	.byte		N05	, Cn5
	.byte	W06
	.byte			En4
	.byte		N05	, An4
	.byte	W06
	.byte		N80	, As4
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song069_4_1
	.byte	FINE

	@********************** Track  5 **********************@

	.global song069_5
song069_5:	@ 0x08574C68
	.byte	KEYSH	, 0
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte	PAN	, c_v+24
	.byte		N05	, Ds2, v124
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Gs2
	.byte	W06
song069_5_3:
	.byte		N42	, As2, v127
	.byte	W48
	.byte		N05	, Fn2, v112
	.byte	W12
	.byte		N04	, As2, v096
	.byte	W12
	.byte		N03	, Cs3, v092
	.byte	W12
	.byte		N04	, Fn3, v116
	.byte	W12
	.byte		N19	, Ds3, v120
	.byte	W24
	.byte		N18	, Cn3, v100
	.byte	W24
	.byte		N12	, Gn2
	.byte	W24
	.byte		N04	, Gn2, v092
	.byte	W12
	.byte			Gs2, v076
	.byte	W12
	.byte		N30	, As2, v108
	.byte	W36
	.byte		N05	, Gs2, v080
	.byte	W06
	.byte			As2, v092
	.byte	W06
	.byte		N32	, Cn3, v112
	.byte	W36
	.byte		N05	, Bn2, v084
	.byte	W06
	.byte			Cn3, v092
	.byte	W06
	.byte		N32	, Cs3, v104
	.byte	W36
	.byte		N05	, Cn3, v092
	.byte	W06
	.byte			Cs3, v080
	.byte	W06
	.byte		N32	, Ds3, v112
	.byte	W36
	.byte		N05	, Cs3, v076
	.byte	W06
	.byte			Ds3, v088
	.byte	W06
	.byte		N24	, En3, v112
	.byte	W36
	.byte		N06	, Dn3, v100
	.byte	W06
	.byte		N04	, En3, v092
	.byte	W06
	.byte		N19	, Fs3, v120
	.byte	W24
	.byte		N17	, Dn3
	.byte	W24
	.byte		N48	, Bn2, v112
	.byte	W60
	.byte		N06	, Bn2, v100
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N30	, En3
	.byte	W36
	.byte		N06	, Dn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte		N30	, Fs3
	.byte	W36
	.byte		N06	, En3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte		N48	, Gn3
	.byte	W48
	.byte		N36	, Fs3
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song069_5_1:
	.byte		N40	, An2, v100
	.byte	W42
	.byte		N05	, An2, v032
	.byte	W06
	.byte		N40	, Bn2, v100
	.byte	W42
	.byte		N05	, Bn2, v032
	.byte	W06
	.byte	PEND
song069_5_2:
	.byte		N40	, Cn3, v100
	.byte	W42
	.byte		N05	, Cn3, v032
	.byte	W06
	.byte		N40	, Dn3, v100
	.byte	W42
	.byte		N05	, Dn3, v032
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song069_5_1
	.byte	PATT	
		.word	song069_5_2
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N56	, Cn3, v120
	.byte	W60
	.byte		N05	, Cn3, v032
	.byte	W12
	.byte			Ds2, v124
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte	GOTO	
		.word	song069_5_3
	.byte	FINE

	@********************** Track  6 **********************@

	.global song069_6
song069_6:	@ 0x08574D51
	.byte	KEYSH	, 0
	.byte	W03
	.byte	PAN	, c_v+11
	.byte	W06
	.byte	VOICE	, 51
	.byte	W06
	.byte	VOL	, v049
	.byte	W09
song069_6_5:
	.byte		N06	, As1, v127
	.byte	W12
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
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			Fs2
	.byte	W12
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
	.byte			En2
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			Cs2
	.byte	W12
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
	.byte		N06	
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			En2
	.byte	W12
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
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Cn2
	.byte	W12
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
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			An1
	.byte	W12
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
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
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
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
song069_6_1:
	.byte		N06	, Cn2, v092
	.byte		N06	, Gn2, v076
	.byte	W12
	.byte			Cn2, v092
	.byte		N06	, Gn2, v076
	.byte	W24
	.byte			Cn2, v088
	.byte		N06	, Gn2, v072
	.byte	W12
	.byte			Cn2, v088
	.byte		N06	, Gn2, v076
	.byte	W12
	.byte			Cn2, v092
	.byte		N06	, Gn2, v072
	.byte	W24
	.byte			Cn2, v088
	.byte		N06	, Gn2, v076
	.byte	W12
	.byte	PEND
song069_6_2:
	.byte		N06	, Bn1, v092
	.byte		N06	, Fs2, v076
	.byte	W12
	.byte			Bn1, v092
	.byte		N06	, Fs2, v076
	.byte	W24
	.byte			Bn1, v088
	.byte		N06	, Fs2, v072
	.byte	W12
	.byte			Bn1, v088
	.byte		N06	, Fs2, v076
	.byte	W12
	.byte			Bn1, v088
	.byte		N06	, Fs2, v076
	.byte	W24
	.byte			Bn1, v088
	.byte		N06	, Fs2, v068
	.byte	W12
	.byte	PEND
	.byte			An1, v092
	.byte		N06	, En2, v076
	.byte	W12
	.byte			An1, v092
	.byte		N06	, En2, v076
	.byte	W24
	.byte			An1, v088
	.byte		N06	, En2, v072
	.byte	W12
	.byte			An1, v092
	.byte		N06	, En2, v076
	.byte	W12
	.byte			An1, v092
	.byte		N06	, En2, v072
	.byte	W24
	.byte			An1, v088
	.byte		N06	, En2, v072
	.byte	W12
	.byte			Gn1, v092
	.byte		N06	, Dn2, v072
	.byte	W12
	.byte			Gn1, v092
	.byte		N06	, Dn2, v076
	.byte	W24
	.byte			Gn1, v088
	.byte		N06	, Dn2, v076
	.byte	W12
	.byte			Gn1, v088
	.byte		N06	, Dn2, v072
	.byte	W12
	.byte			Gn1, v088
	.byte		N06	, Dn2, v072
	.byte	W12
	.byte			An1, v092
	.byte		N06	, En2, v072
	.byte	W12
	.byte			Bn1, v092
	.byte		N06	, Fs2, v072
	.byte	W12
	.byte	PATT	
		.word	song069_6_1
	.byte	PATT	
		.word	song069_6_2
song069_6_3:
	.byte		N06	, En2, v096
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			En2, v092
	.byte	W12
	.byte			Fs2, v100
	.byte	W12
	.byte			Fs2, v080
	.byte	W24
	.byte			Fs2, v088
	.byte	W12
	.byte	PEND
song069_6_4:
	.byte		N06	, En2, v092
	.byte	W12
	.byte			En2, v100
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Fs2, v080
	.byte	W24
	.byte			Fs2, v088
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song069_6_3
	.byte	PATT	
		.word	song069_6_4
	.byte		TIE	, Ds2, v088
	.byte		TIE	, As2, v096
	.byte	W96
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	, Ds2
	.byte			As2
	.byte	W01
	.byte		N92	, Cs2, v084
	.byte		N92	, Gs2, v092
	.byte	W96
	.byte			Ds2, v084
	.byte		N92	, As2, v092
	.byte	W96
	.byte			Cs2, v080
	.byte		N92	, As2, v092
	.byte	W96
	.byte			Fn2, v096
	.byte	W96
	.byte		N44	, Ds2, v092
	.byte	W48
	.byte			Gs2
	.byte	W48
	.byte	GOTO	
		.word	song069_6_5
	.byte	FINE

	@********************** Track  7 **********************@

	.global song069_7
song069_7:	@ 0x08574EE2
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v044
	.byte	PAN	, c_v
	.byte		N05	, Cn2, v127
	.byte	W06
	.byte			An1
	.byte	W06
	.byte			Fn1
	.byte	W06
	.byte		N05	
	.byte	W06
song069_7_2:
	.byte		N48	, Cs2, v076
	.byte	W12
	.byte		N05	, Fs1, v036
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs1, v032
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs1, v036
	.byte	W12
	.byte			Fs1, v040
	.byte	W12
	.byte			Fs1, v032
	.byte	W12
	.byte			Fs1, v036
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs1, v032
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs1, v036
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
	.byte			Fs1, v032
	.byte	W12
	.byte			Fs1, v036
	.byte	W12
	.byte			Fs1, v032
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs1, v028
	.byte	W12
	.byte			Fs1, v032
	.byte	W12
	.byte			Fs1, v036
	.byte	W12
	.byte		N06	, Dn1, v092
	.byte	W06
	.byte			Dn1, v096
	.byte	W06
	.byte			Dn1, v104
	.byte	W06
	.byte			Dn1, v112
	.byte	W06
	.byte		N42	, Cs2, v076
	.byte	W12
	.byte		N05	, Fs1, v036
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs1, v040
	.byte	W12
	.byte			Fs1, v036
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs1, v040
	.byte	W12
	.byte			Fs1, v044
	.byte	W12
	.byte			Fs1, v036
	.byte	W12
	.byte			Fs1, v040
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs1, v036
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs1, v040
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs1, v036
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs1, v032
	.byte	W12
	.byte			Fs1, v036
	.byte	W12
	.byte			Fs1, v032
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs1, v028
	.byte	W12
	.byte			Fs1, v032
	.byte	W12
	.byte			Fs1, v036
	.byte	W12
	.byte			Fs1, v032
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			As1, v048
	.byte	W06
	.byte			Fs1, v032
	.byte	W06
	.byte		N11	, Dn2, v112
	.byte	W12
	.byte		N23	, Dn2, v100
	.byte	W24
	.byte		N23	
	.byte	W24
	.byte			Dn2, v116
	.byte	W24
	.byte		N11	, Dn2, v080
	.byte	W12
song069_7_1:
	.byte		N11	, Dn2, v080
	.byte	W12
	.byte		N23	, Dn2, v116
	.byte	W24
	.byte			Dn2, v092
	.byte	W24
	.byte			Dn2, v112
	.byte	W24
	.byte		N05	, Dn1, v116
	.byte	W06
	.byte			Dn1, v100
	.byte	W06
	.byte	PEND
	.byte		N06	, Dn1, v112
	.byte	W12
	.byte		N23	, Dn2
	.byte	W24
	.byte			Dn2, v116
	.byte	W24
	.byte			Dn2, v120
	.byte	W24
	.byte		N11	, Dn1, v084
	.byte	W12
	.byte		N10	, Dn1, v100
	.byte	W12
	.byte		N23	, Dn2, v112
	.byte	W24
	.byte		N23	
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte			Dn2, v120
	.byte	W12
	.byte			Dn2, v112
	.byte	W12
	.byte			Dn2, v120
	.byte	W12
	.byte		N23	, Dn2, v100
	.byte	W24
	.byte		N23	
	.byte	W24
	.byte			Dn2, v116
	.byte	W24
	.byte		N11	, Dn2, v080
	.byte	W12
	.byte	PATT	
		.word	song069_7_1
	.byte		N06	, Dn1, v112
	.byte	W12
	.byte		N23	, Dn2
	.byte	W24
	.byte			Dn2, v116
	.byte	W24
	.byte			Dn2, v120
	.byte	W24
	.byte		N11	, Dn1, v080
	.byte	W12
	.byte		N10	, Dn1, v100
	.byte	W12
	.byte		N23	, Dn2, v112
	.byte	W24
	.byte		N23	
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte			Dn1, v120
	.byte	W12
	.byte		N05	, Dn1, v112
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N11	, Dn2
	.byte	W12
	.byte		N23	
	.byte	W24
	.byte			Dn2, v116
	.byte	W24
	.byte			Dn2, v120
	.byte	W24
	.byte		N11	, Dn1, v084
	.byte	W12
	.byte		N10	, Dn1, v100
	.byte	W12
	.byte		N23	, Dn2, v112
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte		N05	, Cn2, v116
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Fn1
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Dn1, v096
	.byte	W06
	.byte			Dn1, v112
	.byte	W06
	.byte		N23	, Cs2, v100
	.byte	W24
	.byte		N05	, Fs1, v032
	.byte	W12
	.byte			Dn1, v100
	.byte	W06
	.byte			Dn1, v096
	.byte	W06
	.byte		N05	
	.byte	W12
	.byte			Dn1, v100
	.byte	W12
	.byte			Fs1, v032
	.byte	W24
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Dn1, v096
	.byte	W06
	.byte			Dn1, v088
	.byte	W06
	.byte			Dn1, v100
	.byte		N05	, Fs1, v032
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte			Fs1, v032
	.byte	W12
	.byte			Dn1, v100
	.byte	W06
	.byte			Dn1, v092
	.byte	W06
	.byte			Fs1, v032
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte		N05	
	.byte		N05	, Fs1, v032
	.byte	W12
	.byte			Dn1, v104
	.byte	W12
	.byte			Fs1, v032
	.byte	W12
	.byte			Dn1, v100
	.byte	W12
	.byte		N05	
	.byte		N05	, Fs1, v032
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Dn1, v092
	.byte	W06
	.byte			Dn1, v080
	.byte	W06
	.byte			Dn1, v092
	.byte		N05	, Fs1, v032
	.byte	W12
	.byte			Dn1, v096
	.byte	W12
	.byte			Fs1, v032
	.byte	W12
	.byte			Dn1, v100
	.byte	W06
	.byte			Dn1, v096
	.byte	W06
	.byte		N32	, Cs2, v100
	.byte	W24
	.byte		N05	, Fs1, v032
	.byte	W12
	.byte			Dn1, v100
	.byte	W06
	.byte			Dn1, v096
	.byte	W06
	.byte			Dn1, v100
	.byte	W12
	.byte			Dn1, v104
	.byte	W12
	.byte			Fs1, v032
	.byte	W24
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Dn1, v104
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Dn1, v096
	.byte	W12
	.byte			Dn1, v100
	.byte	W12
	.byte			Fs1, v032
	.byte	W12
	.byte			Dn1, v100
	.byte	W06
	.byte			Dn1, v092
	.byte	W06
	.byte			Fs1, v032
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Dn1, v096
	.byte	W12
	.byte		N05	
	.byte		N05	, Fs1, v032
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte			Fs1, v032
	.byte	W12
	.byte			Dn1, v092
	.byte	W12
	.byte			Fs1, v032
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Dn1, v100
	.byte	W06
	.byte			Dn1, v088
	.byte	W06
	.byte			Dn1, v100
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Dn1, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	GOTO	
		.word	song069_7_2
	.byte	FINE

	.align 2
	.global song069
song069:	@ 0x08575120
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup028		@ voicegroup/tone

	.word	song069_1		@ track
	.word	song069_2		@ track
	.word	song069_3		@ track
	.word	song069_4		@ track
	.word	song069_5		@ track
	.word	song069_6		@ track
	.word	song069_7		@ track
