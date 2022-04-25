	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song035_1
song035_1:	@ 0x08561E3C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 49
	.byte	VOL	, v035
	.byte	PAN	, c_v
	.byte		N72	, Cn3, v096
	.byte	W72
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N72	, Dn3, v100
	.byte	W72
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N72	, Ds3, v104
	.byte	W72
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte			En3, v108
	.byte	W06
	.byte		N06	, En3, v024
	.byte	W18
	.byte		N66	, Fs3, v108
	.byte	W72
	.byte		N96	, As3, v112
	.byte	W96
	.byte		N04	, En3
	.byte	W24
	.byte		N60	, Fs3
	.byte	W60
	.byte	W03
	.byte		N06	, Fs3, v028
	.byte	W09
song035_1_1:
	.byte		N48	, Gs3, v100
	.byte	W60
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v024
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v024
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs3, v024
	.byte	W06
	.byte		N66	, Cs4, v100
	.byte	W72
	.byte		N24	, Fs3
	.byte	W24
	.byte		N48	, Gs3
	.byte	W48
	.byte			Fs3
	.byte	W48
	.byte			Gs3
	.byte	W48
	.byte			Bn3
	.byte	W48
	.byte		N72	, As3
	.byte	W84
	.byte		N06	, Gs3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte		N36	, Bn3
	.byte	W36
	.byte		N06	, As3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte		N36	, Cs4
	.byte	W48
	.byte		N48	, Ds4
	.byte	W48
	.byte			Bn3
	.byte	W48
	.byte		N24	, Cs4
	.byte	W24
	.byte			Cs3
	.byte		N24	, Gs3
	.byte	W24
	.byte			Bn2
	.byte		N24	, Fs3
	.byte	W24
	.byte			Fs2
	.byte		N24	, Cs3
	.byte	W24
	.byte	GOTO	
		.word	song035_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song035_2
song035_2:	@ 0x08561ED1
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte	VOICE	, 33
	.byte	VOL	, v043
	.byte	W24
	.byte		N92	, Fs2, v127
	.byte	W96
	.byte		N06	, En2
	.byte	W24
	.byte		N44	, Fs2
	.byte	W48
	.byte		N06	
	.byte	W12
	.byte			Cs2
	.byte	W12
song035_2_1:
	.byte		N06	, Fs2, v124
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
		.word	song035_2_1
	.byte	PATT	
		.word	song035_2_1
	.byte	PATT	
		.word	song035_2_1
	.byte		N06	, Fs2, v124
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Fn2
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Cs2
	.byte	W12
	.byte			Bn1
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
	.byte			Cs2
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte	GOTO	
		.word	song035_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song035_3
song035_3:	@ 0x08561F42
	.byte	KEYSH	, 0
	.byte	VOICE	, 62
	.byte	VOL	, v043
	.byte	PAN	, c_v
	.byte		N66	, Fn3, v096
	.byte		N66	, As3
	.byte	W06
	.byte	VOL	, v041
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v023
	.byte	W02
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v027
	.byte	W01
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
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
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
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
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
	.byte	W11
	.byte		N04	, Fn3
	.byte		N04	, As3
	.byte	W08
	.byte			Fn3
	.byte		N04	, As3
	.byte	W08
	.byte			Fn3
	.byte		N04	, As3
	.byte	W08
	.byte		N66	, Gn3, v100
	.byte		N66	, Cn4
	.byte	W03
	.byte	VOL	, v042
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v023
	.byte	W02
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W01
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
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
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
	.byte	W01
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
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W10
	.byte		N04	, Gn3
	.byte		N04	, Cn4
	.byte	W08
	.byte			Gn3
	.byte		N04	, Cn4
	.byte	W08
	.byte			Gn3
	.byte		N04	, Cn4
	.byte	W08
	.byte		N21	, Gs3, v104
	.byte		N21	, Dn4
	.byte	W24
	.byte		N42	, Gs3
	.byte		N42	, Cn4
	.byte	W02
	.byte	VOL	, v042
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
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
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
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
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
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
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W11
	.byte		N04	, Gs3
	.byte		N04	, Cn4
	.byte	W08
	.byte			Gs3
	.byte		N04	, Cn4
	.byte	W08
	.byte			Gs3
	.byte		N04	, Cn4
	.byte	W08
	.byte			En3, v108
	.byte		N04	, Gs3
	.byte	W06
	.byte		N06	, En3, v024
	.byte		N06	, Gs3
	.byte	W18
	.byte		N66	, Fs3, v108
	.byte		N66	, As3
	.byte	W66
	.byte		N06	, Fs3, v024
	.byte		N06	, As3
	.byte	W06
	.byte	VOICE	, 59
	.byte	VOL	, v043
	.byte	PAN	, c_v+1
	.byte		N21	, Cs3, v112
	.byte		N21	, Fs3
	.byte	W24
	.byte		N21	
	.byte		N21	, Cs4
	.byte	W24
	.byte		N09	, Fs3
	.byte		N09	, Bn3
	.byte	W12
	.byte			Fs3
	.byte		N09	, As3
	.byte	W12
	.byte			Fn3
	.byte		N09	, Gs3
	.byte	W12
	.byte			Cs3
	.byte		N09	, Fs3
	.byte	W12
	.byte		N06	, En3
	.byte		N06	, Gs3
	.byte	W06
	.byte			En3, v040
	.byte		N06	, Gs3
	.byte	W18
	.byte		N60	, Fs3, v112
	.byte		N60	, As3
	.byte	W60
	.byte		N06	, Fs3, v040
	.byte		N06	, As3
	.byte	W12
song035_3_1:
	.byte	VOICE	, 68
	.byte	PAN	, c_v
	.byte		N48	, Cs3, v100
	.byte		N48	, Gs3
	.byte	W24
	.byte	VOL	, v037
	.byte	W36
	.byte		N06	, Fs2
	.byte		N06	, Cs3
	.byte	W06
	.byte			Fs2, v024
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v100
	.byte		N06	, Fs3
	.byte	W06
	.byte			Cs3, v024
	.byte		N06	, Fs3
	.byte	W06
	.byte			Ds3, v100
	.byte		N06	, Gs3
	.byte	W06
	.byte			Ds3, v024
	.byte		N06	, Gs3
	.byte	W06
	.byte		N66	, Gs3, v080
	.byte		N66	, Cs4, v100
	.byte	W66
	.byte		N06	, Cs4, v024
	.byte	W06
	.byte		N21	, Cs3, v080
	.byte		N24	, Fs3, v100
	.byte	W24
	.byte		N44	, Dn3, v080
	.byte		N48	, Gs3, v100
	.byte	W48
	.byte		N44	, Cs3, v080
	.byte		N48	, Fs3, v100
	.byte	W48
	.byte		N44	, Bn2, v080
	.byte		N48	, Gs3, v100
	.byte	W48
	.byte		N44	, Dn3, v080
	.byte		N48	, Bn3, v100
	.byte	W48
	.byte		N68	, Cs3, v080
	.byte		N72	, As3, v100
	.byte	W72
	.byte		N06	, As3, v024
	.byte	W12
	.byte			Bn2, v080
	.byte		N06	, Gs3, v100
	.byte	W06
	.byte			Cs3, v080
	.byte		N06	, As3, v100
	.byte	W06
	.byte		N32	, Ds3, v080
	.byte		N36	, Bn3, v100
	.byte	W36
	.byte		N06	, Ds3, v080
	.byte		N06	, As3, v100
	.byte	W06
	.byte			Fn3, v080
	.byte		N06	, Bn3, v100
	.byte	W06
	.byte		N32	, Fs3, v080
	.byte		N36	, Cs4, v100
	.byte	W36
	.byte		N06	, Cs4, v024
	.byte	W12
	.byte		N44	, Fs3, v080
	.byte		N48	, Ds4, v100
	.byte	W48
	.byte		N44	, Ds3, v080
	.byte		N48	, Bn3, v100
	.byte	W48
	.byte		N84	, Fn3, v080
	.byte		N84	, Cs4, v100
	.byte	W84
	.byte		N06	, Cs4, v024
	.byte	W12
	.byte	GOTO	
		.word	song035_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song035_4
song035_4:	@ 0x085621B3
	.byte	KEYSH	, 0
	.byte	VOICE	, 51
	.byte	VOL	, v035
	.byte	PAN	, c_v-24
	.byte		N72	, Fn2, v096
	.byte	W72
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N72	, Gn2, v100
	.byte	W72
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N72	, Gs2, v104
	.byte	W72
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte		N04	
	.byte	W08
	.byte			Bn2, v108
	.byte	W24
	.byte		N66	, Cs3
	.byte	W66
	.byte		N06	, Cs3, v024
	.byte	W06
	.byte		N96	, Fs3, v112
	.byte	W96
	.byte		N04	, Bn2
	.byte	W24
	.byte		N60	, Cs3
	.byte	W48
	.byte	VOICE	, 50
	.byte	VOL	, v035
	.byte	PAN	, c_v-24
	.byte	W15
	.byte		N06	, Cs3, v028
	.byte	W09
song035_4_1:
	.byte		N04	, Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Fs4, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Fs4, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song035_4_1
song035_4_2:
	.byte		N04	, Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v072
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Fs4, v072
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v072
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Fs4, v072
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v072
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song035_4_2
song035_4_3:
	.byte		N04	, Cs3, v100
	.byte	W06
	.byte			Cs3, v072
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs3, v072
	.byte	W06
	.byte			Cs3, v100
	.byte	W06
	.byte			Cs3, v072
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs3, v072
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song035_4_3
	.byte		N04	, Cs3, v100
	.byte	W06
	.byte			Cs3, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Cs3, v100
	.byte	W06
	.byte			Cs3, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte	PATT	
		.word	song035_4_3
	.byte	GOTO	
		.word	song035_4_1
	.byte	FINE

	@********************** Track  5 **********************@

	.global song035_5
song035_5:	@ 0x085622D9
	.byte	KEYSH	, 0
	.byte	VOICE	, 50
	.byte	VOL	, v032
	.byte	PAN	, c_v-34
	.byte		N08	, Cn3, v060
	.byte	W08
	.byte			Fn3, v052
	.byte	W08
	.byte			Gn3, v056
	.byte	W08
	.byte			Fn3, v076
	.byte	W08
	.byte			Gn3, v064
	.byte	W08
	.byte			Cn4, v072
	.byte	W08
	.byte			Gn3, v096
	.byte	W08
	.byte			Cn4, v084
	.byte	W08
	.byte			Fn4, v092
	.byte	W08
	.byte			Cn4, v100
	.byte	W08
	.byte			Fn4
	.byte	W08
	.byte			As4, v108
	.byte	W08
	.byte			Dn3, v064
	.byte	W08
	.byte			Gn3, v056
	.byte	W08
	.byte			An3, v060
	.byte	W08
	.byte			Gn3, v080
	.byte	W08
	.byte			An3, v068
	.byte	W08
	.byte			Dn4, v076
	.byte	W08
	.byte			An3, v100
	.byte	W08
	.byte			Dn4, v088
	.byte	W08
	.byte			Gn4, v096
	.byte	W08
	.byte			Dn4, v104
	.byte	W08
	.byte			Gn4
	.byte	W08
	.byte			Cn5, v112
	.byte	W08
	.byte			Ds3, v064
	.byte	W08
	.byte			Gs3, v056
	.byte	W08
	.byte			As3, v060
	.byte	W08
	.byte			Gs3, v080
	.byte	W08
	.byte			As3, v072
	.byte	W08
	.byte			Ds4, v080
	.byte	W08
	.byte			As3, v100
	.byte	W08
	.byte			Ds4, v092
	.byte	W08
	.byte			Gs4, v100
	.byte	W08
	.byte			Ds4, v108
	.byte	W08
	.byte			Gs4, v104
	.byte	W08
	.byte			Cs5, v096
	.byte	W08
	.byte		N06	, Bn2, v108
	.byte	W06
	.byte			En3, v100
	.byte	W06
	.byte			Gs3, v096
	.byte	W06
	.byte			Bn3, v104
	.byte	W06
	.byte			Fs3, v108
	.byte	W06
	.byte			As3, v100
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			As3, v112
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Fs4, v104
	.byte	W06
	.byte			As4, v100
	.byte	W06
	.byte			Cs4, v120
	.byte	W06
	.byte			Fs4, v116
	.byte	W06
	.byte			As4, v112
	.byte	W06
	.byte			Cs5, v108
	.byte	W06
	.byte	PAN	, c_v
	.byte		N24	, Cs3, v112
	.byte	W24
	.byte			As3
	.byte	W24
	.byte		N12	, Gs3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte		N06	, Bn2
	.byte	W24
	.byte		N60	, Cs3
	.byte	W60
	.byte	W03
	.byte		N06	, Cs3, v028
	.byte	W09
song035_5_3:
	.byte	VOICE	, 102
	.byte	PAN	, c_v-40
	.byte		N04	, Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Fs4, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Fs4, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Fs4, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Fs4, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
song035_5_1:
	.byte		N04	, Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v072
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Fs4, v072
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v072
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Fs4, v072
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Dn4, v072
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song035_5_1
song035_5_2:
	.byte		N04	, Cs3, v100
	.byte	W06
	.byte			Cs3, v072
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs3, v072
	.byte	W06
	.byte			Cs3, v100
	.byte	W06
	.byte			Cs3, v072
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs3, v072
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song035_5_2
	.byte		N04	, Cs3, v100
	.byte	W06
	.byte			Cs3, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Cs3, v100
	.byte	W06
	.byte			Cs3, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W06
	.byte			Fs3, v072
	.byte	W06
	.byte	PATT	
		.word	song035_5_2
	.byte	GOTO	
		.word	song035_5_3
	.byte	FINE

	@********************** Track  6 **********************@

	.global song035_6
song035_6:	@ 0x085624A6
	.byte	KEYSH	, 0
	.byte	VOICE	, 47
	.byte	VOL	, v043
	.byte	PAN	, c_v-2
	.byte		N21	, Fn2, v096
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Fn2
	.byte	W24
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte		N21	, Gn2, v100
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte		N21	, Gs2, v104
	.byte	W24
	.byte			Ds2
	.byte	W24
	.byte			Gs2
	.byte	W24
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte		N21	, En2, v108
	.byte	W24
	.byte		N03	, Fs2, v088
	.byte	W03
	.byte			Fs2, v080
	.byte	W03
	.byte			Fs2, v088
	.byte	W03
	.byte			Fs2, v080
	.byte	W03
	.byte			Fs2, v092
	.byte	W03
	.byte			Fs2, v084
	.byte	W03
	.byte			Fs2, v092
	.byte	W03
	.byte			Fs2, v084
	.byte	W03
	.byte			Fs2, v096
	.byte	W03
	.byte			Fs2, v088
	.byte	W03
	.byte			Fs2, v096
	.byte	W03
	.byte			Fs2, v088
	.byte	W03
	.byte			Fs2, v100
	.byte	W03
	.byte			Fs2, v092
	.byte	W03
	.byte			Fs2, v100
	.byte	W03
	.byte			Fs2, v092
	.byte	W03
	.byte			Fs2, v100
	.byte	W03
	.byte			Fs2, v096
	.byte	W03
	.byte			Fs2, v104
	.byte	W03
	.byte			Fs2, v096
	.byte	W03
	.byte			Fs2, v104
	.byte	W03
	.byte			Fs2, v100
	.byte	W03
	.byte			Fs2, v108
	.byte	W03
	.byte			Fs2, v100
	.byte	W03
	.byte		N96	, Fs2, v120
	.byte	W96
	.byte		N24	, En2, v112
	.byte	W24
	.byte		N03	, Fs2, v092
	.byte	W03
	.byte			Fs2, v088
	.byte	W03
	.byte			Fs2, v092
	.byte	W03
	.byte			Fs2, v088
	.byte	W03
	.byte			Fs2, v096
	.byte	W03
	.byte			Fs2, v092
	.byte	W03
	.byte			Fs2, v096
	.byte	W03
	.byte			Fs2, v092
	.byte	W03
	.byte			Fs2, v100
	.byte	W03
	.byte			Fs2, v096
	.byte	W03
	.byte			Fs2, v100
	.byte	W03
	.byte			Fs2, v096
	.byte	W03
	.byte			Fs2, v104
	.byte	W03
	.byte			Fs2, v100
	.byte	W03
	.byte			Fs2, v104
	.byte	W03
	.byte			Fs2, v100
	.byte	W03
	.byte			Fs2, v104
	.byte	W03
	.byte			Fs2, v100
	.byte	W03
	.byte			Fs2, v108
	.byte	W03
	.byte			Fs2, v104
	.byte	W03
	.byte			Fs2, v108
	.byte	W03
	.byte			Fs2, v104
	.byte	W03
	.byte			Fs2, v112
	.byte	W03
	.byte			Fs2, v108
	.byte	W03
song035_6_3:
	.byte	VOICE	, 51
	.byte	VOL	, v042
	.byte		N04	, Fs2, v124
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Cs2, v124
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte			Fs2, v124
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Cs2, v124
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte			Fs2, v124
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Cs2, v124
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte			Fs2, v124
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Cs2, v124
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
song035_6_2:
	.byte		N04	, Fs2, v124
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Cs2, v124
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte			Fs2, v124
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Cs2, v124
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte			Fs2, v124
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Cs2, v124
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte			Fs2, v124
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Cs2, v124
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte	PEND
song035_6_1:
	.byte		N04	, Fs2, v124
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Bn1, v124
	.byte	W06
	.byte			Bn1, v080
	.byte	W06
	.byte			Fs2, v124
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Bn1, v124
	.byte	W06
	.byte			Bn1, v080
	.byte	W06
	.byte			Fs2, v124
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Bn1, v124
	.byte	W06
	.byte			Bn1, v080
	.byte	W06
	.byte			Fs2, v124
	.byte	W06
	.byte			Fs2, v080
	.byte	W06
	.byte			Bn1, v124
	.byte	W06
	.byte			Bn1, v080
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song035_6_1
	.byte	PATT	
		.word	song035_6_2
	.byte	PATT	
		.word	song035_6_2
	.byte		N04	, Bn1, v124
	.byte	W06
	.byte			Bn1, v080
	.byte	W06
	.byte			Fs1, v124
	.byte	W06
	.byte			Fs1, v080
	.byte	W06
	.byte			Bn1, v124
	.byte	W06
	.byte			Bn1, v080
	.byte	W06
	.byte			Fs1, v124
	.byte	W06
	.byte			Fs1, v080
	.byte	W06
	.byte			Bn1, v124
	.byte	W06
	.byte			Bn1, v080
	.byte	W06
	.byte			Fs1, v124
	.byte	W06
	.byte			Fs1, v080
	.byte	W06
	.byte			Bn1, v124
	.byte	W06
	.byte			Bn1, v080
	.byte	W06
	.byte			Fs1, v124
	.byte	W06
	.byte			Fs1, v080
	.byte	W06
	.byte			Cs2, v124
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte			Gs1, v124
	.byte	W06
	.byte			Gs1, v080
	.byte	W06
	.byte			Cs2, v124
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte			Gs1, v124
	.byte	W06
	.byte			Gs1, v080
	.byte	W06
	.byte			Cs2, v124
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte			Gs2, v124
	.byte	W06
	.byte			Gs2, v080
	.byte	W06
	.byte			Cs2, v124
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte			Gs2, v124
	.byte	W06
	.byte			Gs2, v080
	.byte	W06
	.byte	GOTO	
		.word	song035_6_3
	.byte	FINE

	.align 2
	.global song035
song035:	@ 0x08562688
	.byte	6		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup059		@ voicegroup/tone

	.word	song035_1		@ track
	.word	song035_2		@ track
	.word	song035_3		@ track
	.word	song035_4		@ track
	.word	song035_5		@ track
	.word	song035_6		@ track
