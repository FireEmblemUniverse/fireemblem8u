	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song050_1
song050_1:	@ 0x0856BDB4
	.byte	KEYSH	, 0
song050_1_2:
	.byte	TEMPO	, 60
	.byte	VOICE	, 56
	.byte	VOL	, v037
	.byte	PAN	, c_v
	.byte	W24
	.byte		N04	, Dn3, v116
	.byte	W04
	.byte			Dn3, v036
	.byte	W04
	.byte			Dn3, v116
	.byte	W04
	.byte			Dn3, v036
	.byte	W04
	.byte			Dn3, v116
	.byte	W04
	.byte			Dn3, v036
	.byte	W04
	.byte		N21	, Gn3, v116
	.byte	W24
	.byte		N04	
	.byte	W04
	.byte			Gn3, v036
	.byte	W04
	.byte			Gn3, v116
	.byte	W04
	.byte			Gn3, v036
	.byte	W04
	.byte			Gn3, v116
	.byte	W04
	.byte			Gn3, v036
	.byte	W04
	.byte		N21	, Fn3, v116
	.byte	W24
	.byte		N04	
	.byte	W04
	.byte			Fn3, v036
	.byte	W04
	.byte			Fn3, v116
	.byte	W04
	.byte			Fn3, v036
	.byte	W04
	.byte			Fn3, v116
	.byte	W04
	.byte			Fn3, v036
	.byte	W04
	.byte		N36	, An3, v116
	.byte	W36
	.byte	W03
	.byte		N06	, An3, v036
	.byte	W09
	.byte		N60	, Gn3, v116
	.byte	W60
	.byte	W03
	.byte		N06	, Gn3, v036
	.byte	W09
	.byte			Gn3, v116
	.byte	W06
	.byte			Gn3, v036
	.byte	W12
	.byte			Gn3, v116
	.byte	W06
	.byte		N42	, An3
	.byte	W42
	.byte		N06	, An3, v036
	.byte	W06
	.byte		N36	, Fn3, v116
	.byte	W36
	.byte	W03
	.byte		N06	, Fn3, v036
	.byte	W09
song050_1_1:
	.byte		N42	, En3, v116
	.byte	W42
	.byte		N06	, En3, v036
	.byte	W06
	.byte		N32	, Gn3, v116
	.byte	W32
	.byte	W01
	.byte		N06	, Gn3, v036
	.byte	W09
	.byte			Gn3, v116
	.byte	W06
	.byte	PEND
	.byte		N60	
	.byte	W60
	.byte	W03
	.byte		N06	, Gn3, v036
	.byte	W09
	.byte			Fn3, v116
	.byte	W06
	.byte			Fn3, v036
	.byte	W12
	.byte			Fn3, v116
	.byte	W06
	.byte	PATT	
		.word	song050_1_1
	.byte		N66	, Gn3, v116
	.byte	W66
	.byte		N06	, Gn3, v036
	.byte	W06
	.byte			Gn3, v116
	.byte	W06
	.byte			Gn3, v036
	.byte	W12
	.byte			Gn3, v116
	.byte	W06
	.byte	VOICE	, 68
	.byte	VOL	, v048
	.byte		TIE	, As3, v112
	.byte	W96
	.byte	W36
	.byte		EOT	
	.byte		N08	, As3, v060
	.byte	W12
	.byte		N24	, An3, v112
	.byte	W24
	.byte			As3
	.byte	W24
	.byte		N84	, An3
	.byte	W84
	.byte		N12	, An3, v060
	.byte	W12
	.byte		N18	, Fn3, v112
	.byte	W24
	.byte		N24	, Dn3
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte			Fn3
	.byte	W24
	.byte		TIE	, As3
	.byte	W96
	.byte	W12
	.byte		EOT	
	.byte		N12	, As3, v060
	.byte	W12
	.byte		N48	, An3, v112
	.byte	W48
	.byte		N24	, Gn3
	.byte	W24
	.byte		N72	, An3
	.byte	W84
	.byte		N12	, As3
	.byte	W12
	.byte		N72	, An3
	.byte	W78
	.byte		N06	, Gn3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte		N96	, Cn4
	.byte	W96
	.byte		N84	, Dn4
	.byte	W84
	.byte		N12	, Dn4, v060
	.byte	W12
	.byte	GOTO	
		.word	song050_1_2
	.byte	FINE

	@********************** Track  2 **********************@

	.global song050_2
song050_2:	@ 0x0856BEB8
	.byte	KEYSH	, 0
song050_2_2:
	.byte	VOICE	, 34
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte		N18	, Gn2, v127
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			Ds2
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte			As1
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte			An1
	.byte	W24
	.byte		N18	
	.byte	W24
song050_2_1:
	.byte		N18	, An1, v127
	.byte	W24
	.byte			En1
	.byte	W24
	.byte			An1
	.byte	W24
	.byte			En1
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song050_2_1
	.byte	PATT	
		.word	song050_2_1
	.byte		N18	, An1, v127
	.byte	W24
	.byte			En1
	.byte	W24
	.byte			An1
	.byte	W24
	.byte			En1
	.byte	W23
	.byte	VOL	, v041
	.byte	W01
	.byte	VOICE	, 51
	.byte	VOL	, v024
	.byte	PAN	, c_v
	.byte		TIE	, Ds2, v100
	.byte	W02
	.byte	VOL	, v024
	.byte	W02
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W02
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W02
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
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v033
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
	.byte		v039
	.byte	W36
	.byte	W03
	.byte	W42
	.byte		v039
	.byte	W03
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W02
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W01
	.byte		EOT	
	.byte	VOL	, v024
	.byte		TIE	, Fn2, v104
	.byte	W03
	.byte	VOL	, v025
	.byte	W01
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
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W01
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
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W02
	.byte		v040
	.byte	W32
	.byte	W44
	.byte	W01
	.byte		v040
	.byte	W03
	.byte		v039
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		EOT	
	.byte	VOL	, v026
	.byte		TIE	, Ds2
	.byte	W03
	.byte	VOL	, v027
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W02
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
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W01
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
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v040
	.byte	W30
	.byte	W01
	.byte	W36
	.byte	W02
	.byte		v040
	.byte	W03
	.byte		v039
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v038
	.byte	W01
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
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		EOT	
	.byte		N96	, Dn2
	.byte	W01
	.byte	VOL	, v027
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W01
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
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
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
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W01
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
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W60
	.byte	W01
	.byte		N96	, Cn2, v100
	.byte	W96
	.byte			Dn2, v104
	.byte	W96
	.byte			Dn2, v092
	.byte	W32
	.byte	VOL	, v039
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W03
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W03
	.byte		v037
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W02
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
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W04
	.byte	GOTO	
		.word	song050_2_2
	.byte	FINE

	@********************** Track  3 **********************@

	.global song050_3
song050_3:	@ 0x0856C184
	.byte	KEYSH	, 0
song050_3_1:
	.byte	VOICE	, 72
	.byte	MOD	, 0
	.byte	VOL	, v027
	.byte	PAN	, c_v-34
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N06	, Gn4, v104
	.byte	W06
	.byte			Gn4, v060
	.byte	W12
	.byte			Gn4, v104
	.byte	W06
	.byte		N42	, Fn4
	.byte	W42
	.byte		N06	, Fn4, v048
	.byte	W06
	.byte	W96
	.byte	W24
	.byte			En4, v104
	.byte	W06
	.byte			En4, v060
	.byte	W12
	.byte			En4, v104
	.byte	W06
	.byte		N42	, Dn4
	.byte	W24
	.byte	MOD	, 3
	.byte	W18
	.byte		N06	, Dn4, v048
	.byte	W06
	.byte	MOD	, 0
	.byte	W96
	.byte	W24
	.byte		N06	, Gn4, v104
	.byte	W06
	.byte			Gn4, v060
	.byte	W12
	.byte			Gn4, v104
	.byte	W06
	.byte		N42	, En4
	.byte	W24
	.byte	MOD	, 3
	.byte	W18
	.byte		N06	, En4, v048
	.byte	W06
	.byte	VOICE	, 51
	.byte	MOD	, 0
	.byte	VOL	, v023
	.byte	PAN	, c_v
	.byte		TIE	, Gn2, v084
	.byte	W04
	.byte	VOL	, v023
	.byte	W02
	.byte		v024
	.byte	W02
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
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W03
	.byte		v027
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W42
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		TIE	
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		TIE	
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		TIE	
	.byte	W96
	.byte	W02
	.byte	VOL	, v033
	.byte	W05
	.byte		v033
	.byte	W02
	.byte		v032
	.byte	W03
	.byte		v032
	.byte	W03
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W03
	.byte		v031
	.byte	W02
	.byte		v030
	.byte	W03
	.byte		v030
	.byte	W03
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W03
	.byte		v029
	.byte	W02
	.byte		v028
	.byte	W03
	.byte		v028
	.byte	W03
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W03
	.byte		v027
	.byte	W02
	.byte		v026
	.byte	W03
	.byte		v026
	.byte	W03
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W03
	.byte		v025
	.byte	W02
	.byte		v024
	.byte	W03
	.byte		v024
	.byte	W03
	.byte		v024
	.byte	W02
	.byte		v023
	.byte	W03
	.byte		v023
	.byte	W02
	.byte		v022
	.byte	W03
	.byte		v022
	.byte	W03
	.byte		v022
	.byte	W02
	.byte		v021
	.byte	W03
	.byte		v021
	.byte	W02
	.byte		v020
	.byte	W03
	.byte		v020
	.byte	W03
	.byte		v019
	.byte	W03
	.byte		EOT	
	.byte	GOTO	
		.word	song050_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song050_4
song050_4:	@ 0x0856C26E
	.byte	KEYSH	, 0
song050_4_2:
	.byte	VOICE	, 62
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte	W24
	.byte		N04	, As2, v116
	.byte	W04
	.byte			As2, v032
	.byte	W04
	.byte			As2, v116
	.byte	W04
	.byte			As2, v032
	.byte	W04
	.byte			As2, v116
	.byte	W04
	.byte			As2, v032
	.byte	W04
	.byte		N21	, Dn3, v116
	.byte	W24
	.byte		N04	
	.byte	W04
	.byte			Dn3, v032
	.byte	W04
	.byte			Dn3, v116
	.byte	W04
	.byte			Dn3, v032
	.byte	W04
	.byte			Dn3, v116
	.byte	W04
	.byte			Dn3, v032
	.byte	W04
	.byte		N21	, Cn3, v116
	.byte	W24
	.byte		N04	
	.byte	W04
	.byte			Cn3, v032
	.byte	W04
	.byte			Cn3, v116
	.byte	W04
	.byte			Cn3, v032
	.byte	W04
	.byte			Cn3, v116
	.byte	W04
	.byte			Cn3, v032
	.byte	W04
	.byte		N36	, Cn3, v116
	.byte	W36
	.byte	W03
	.byte		N06	, Cn3, v032
	.byte	W09
	.byte		N42	, Dn3, v116
	.byte	W42
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte		N12	, Dn3, v116
	.byte	W12
	.byte		N06	, Dn3, v032
	.byte	W12
	.byte			Dn3, v116
	.byte	W06
	.byte			Dn3, v032
	.byte	W12
	.byte			Dn3, v116
	.byte	W06
	.byte		N42	, Fn3
	.byte	W42
	.byte		N06	, Fn3, v032
	.byte	W06
	.byte		N42	, Dn3, v116
	.byte	W42
	.byte		N06	, Dn3, v032
	.byte	W06
song050_4_1:
	.byte		N60	, Cn3, v116
	.byte	W60
	.byte	W03
	.byte		N06	, Cn3, v032
	.byte	W09
	.byte			Cn3, v116
	.byte	W06
	.byte			Cn3, v032
	.byte	W12
	.byte			Cn3, v116
	.byte	W06
	.byte	PEND
	.byte		N66	, Dn3
	.byte	W66
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte			Dn3, v116
	.byte	W06
	.byte			Dn3, v032
	.byte	W12
	.byte			Dn3, v116
	.byte	W06
	.byte	PATT	
		.word	song050_4_1
	.byte		N66	, Dn3, v116
	.byte	W66
	.byte		N06	, Dn3, v032
	.byte	W06
	.byte			Dn3, v116
	.byte	W06
	.byte			Dn3, v032
	.byte	W12
	.byte			Ds3, v116
	.byte	W06
	.byte	VOICE	, 48
	.byte	VOL	, v028
	.byte	PAN	, c_v-24
	.byte		N72	, Dn3, v072
	.byte	W03
	.byte	VOL	, v028
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v033
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
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v036
	.byte	W01
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
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W21
	.byte		N06	, Dn3, v080
	.byte	W06
	.byte			Ds3, v084
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte		N36	, Gn3, v096
	.byte	W36
	.byte		N06	, Fn3, v080
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte		N48	, Dn3, v100
	.byte	W48
	.byte		N60	, Cn3, v092
	.byte	W72
	.byte		N24	, Dn3
	.byte	W24
	.byte		N48	, Cn3
	.byte	W48
	.byte		N42	, An2
	.byte	W48
	.byte		N72	, As2
	.byte	W72
	.byte		N24	, Cn3
	.byte	W24
	.byte		N72	, Dn3
	.byte	W72
	.byte		N12	, Cn3
	.byte	W12
	.byte			As2
	.byte	W12
	.byte		N48	, Cn3
	.byte	W48
	.byte			An2
	.byte	W48
	.byte			As2
	.byte	W48
	.byte		N36	, Cn3
	.byte	W42
	.byte		N06	, As2
	.byte	W06
	.byte		N96	, An2
	.byte	W96
	.byte			An2, v080
	.byte	W22
	.byte	VOL	, v041
	.byte	W02
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W02
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
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v033
	.byte	W02
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
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
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
	.byte		v026
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
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v018
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
	.byte		v010
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v008
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
	.byte	GOTO	
		.word	song050_4_2
	.byte	FINE

	@********************** Track  5 **********************@

	.global song050_5
song050_5:	@ 0x0856C43B
	.byte	KEYSH	, 0
song050_5_2:
	.byte	VOICE	, 51
	.byte	VOL	, v039
	.byte	PAN	, c_v+21
	.byte		N96	, Gn2, v104
	.byte	W96
song050_5_1:
	.byte		N06	, Gn2, v032
	.byte	W24
	.byte		N05	, Gn2, v104
	.byte	W08
	.byte			Dn2
	.byte	W08
	.byte			Gn2
	.byte	W08
	.byte		N42	, An2
	.byte	W42
	.byte		N06	, An2, v032
	.byte	W06
	.byte	PEND
	.byte		N96	, Gn2, v104
	.byte	W96
	.byte	PATT	
		.word	song050_5_1
	.byte		N96	, En2, v104
	.byte	W96
	.byte		N06	, En2, v032
	.byte	W24
	.byte		N05	, En2, v104
	.byte	W08
	.byte			An1
	.byte	W08
	.byte			En2
	.byte	W08
	.byte		N42	, Gn2
	.byte	W42
	.byte		N06	, Gn2, v032
	.byte	W06
	.byte		N96	, En2, v104
	.byte	W96
	.byte	W24
	.byte		N05	
	.byte	W08
	.byte			An1
	.byte	W08
	.byte			En2
	.byte	W08
	.byte		N32	, Gn2
	.byte	W32
	.byte		N10	, Gn2, v116
	.byte	W10
	.byte		N06	, Gn2, v032
	.byte	W06
	.byte	VOICE	, 48
	.byte	VOL	, v039
	.byte	PAN	, c_v+21
	.byte		N96	, Gn2, v084
	.byte	W96
	.byte		N48	, An2, v088
	.byte	W48
	.byte			As2, v092
	.byte	W48
	.byte			An2
	.byte	W48
	.byte			Fn2, v084
	.byte	W48
	.byte	W48
	.byte			Ds3, v092
	.byte	W48
	.byte		N72	, Dn3, v080
	.byte	W84
	.byte		N12	, As2, v092
	.byte	W12
	.byte		N48	, Cn3
	.byte	W48
	.byte			As2
	.byte	W48
	.byte		TIE	, An2
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		N96	, Cn3, v080
	.byte	W96
	.byte	GOTO	
		.word	song050_5_2
	.byte	FINE

	@********************** Track  6 **********************@

	.global song050_6
song050_6:	@ 0x0856C4C8
	.byte	KEYSH	, 0
song050_6_3:
	.byte	VOICE	, 127
	.byte	VOL	, v043
	.byte	PAN	, c_v
	.byte		N48	, Cs2, v116
	.byte	W48
	.byte		N06	, Fn1, v112
	.byte	W24
	.byte		N24	, As1, v060
	.byte	W24
song050_6_1:
	.byte		N06	, Fs1, v060
	.byte	W48
	.byte			An1, v100
	.byte	W24
	.byte			Fn1, v112
	.byte	W24
	.byte	PEND
	.byte		N24	, As1, v060
	.byte	W48
	.byte		N06	, Fn1, v112
	.byte	W24
	.byte		N24	, As1, v060
	.byte	W24
	.byte	PATT	
		.word	song050_6_1
	.byte		N24	, As1, v060
	.byte	W48
	.byte		N24	
	.byte	W24
	.byte		N06	, Fn1, v112
	.byte	W24
	.byte			Fs1, v060
	.byte	W48
	.byte		N06	
	.byte	W24
	.byte		N24	, As1
	.byte	W24
	.byte		N24	
	.byte	W48
	.byte		N06	, Fs1
	.byte	W24
	.byte			Fn1, v112
	.byte	W24
	.byte			Fs1, v060
	.byte	W48
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	, As1
	.byte	W24
	.byte		N48	, Ds2, v104
	.byte	W96
	.byte	W48
	.byte		N06	, Fs2, v076
	.byte	W06
	.byte			Fs2, v024
	.byte	W42
	.byte	W96
	.byte	W48
	.byte			Fs2, v076
	.byte	W06
	.byte			Fs2, v024
	.byte	W18
	.byte			Ds2, v104
	.byte	W06
	.byte			Ds2, v064
	.byte	W06
	.byte			Ds2, v080
	.byte	W06
	.byte			Ds2, v104
	.byte	W06
	.byte		N48	, Ds2, v096
	.byte	W96
song050_6_2:
	.byte	W48
	.byte		N06	, Fs2, v076
	.byte	W06
	.byte			Fs2, v028
	.byte	W42
	.byte	PEND
	.byte		N48	, Ds2, v092
	.byte	W96
	.byte	PATT	
		.word	song050_6_2
	.byte		N48	, Ds2, v092
	.byte	W96
	.byte	W48
	.byte		N06	, Cn2, v120
	.byte		N24	, Fs2, v076
	.byte	W12
	.byte		N06	, An1, v120
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	GOTO	
		.word	song050_6_3
	.byte	FINE

	@********************** Track  7 **********************@

	.global song050_7
song050_7:	@ 0x0856C570
	.byte	KEYSH	, 0
song050_7_3:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte	VOICE	, 46
	.byte	VOL	, v047
	.byte	PAN	, c_v-25
	.byte	W24
song050_7_1:
	.byte		N12	, Ds3, v104
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			As3
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Fn4
	.byte	W12
	.byte			As3
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Fn4
	.byte	W12
	.byte	PEND
song050_7_2:
	.byte		N12	, Gn3, v104
	.byte	W12
	.byte			As3
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Fn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte			Fn4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			As3
	.byte	W12
	.byte	PEND
	.byte			Fn3
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Fn4
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			Fn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte			Fn4
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Fn4
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Fn3
	.byte	W12
	.byte	PATT	
		.word	song050_7_1
	.byte	PATT	
		.word	song050_7_2
	.byte		N12	, Fn3, v104
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Fn3
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Fn4
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			Fn4
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			Fn3
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Fs4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte			Cn5
	.byte	W12
	.byte	GOTO	
		.word	song050_7_3
	.byte	FINE

	.align 2
	.global song050
song050:	@ 0x0856C61C
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup070		@ voicegroup/tone

	.word	song050_1		@ track
	.word	song050_2		@ track
	.word	song050_3		@ track
	.word	song050_4		@ track
	.word	song050_5		@ track
	.word	song050_6		@ track
	.word	song050_7		@ track
