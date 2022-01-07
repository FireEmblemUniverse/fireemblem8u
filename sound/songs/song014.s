	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song014_1
song014_1:	@ 0x08552A80
	.byte	KEYSH	, 0
	.byte	TEMPO	, 33
	.byte	VOICE	, 6
	.byte	VOL	, v034
	.byte	PAN	, c_v+40
	.byte		N06	, Ds2, v104
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			As1
	.byte	W06
	.byte			Bn1
	.byte	W06
	.byte			Cs2
	.byte	W06
	.byte			Bn1
	.byte	W06
	.byte			As1
	.byte	W06
song014_1_1:
	.byte		N06	, Ds2, v104
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Cs2
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Bn1
	.byte	W06
	.byte			Cs2
	.byte	W06
	.byte	PEND
song014_1_2:
	.byte		N06	, Ds2, v104
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			As1
	.byte	W06
	.byte			Bn1
	.byte	W06
	.byte			Cs2
	.byte	W06
	.byte			Bn1
	.byte	W06
	.byte			As1
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song014_1_1
song014_1_3:
	.byte		N06	, En2, v104
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			Bn1
	.byte	W06
	.byte			Cs2
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Cs2
	.byte	W06
	.byte			Bn1
	.byte	W06
	.byte	PEND
song014_1_4:
	.byte		N06	, En2, v104
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			Cs2
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Cs2
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song014_1_2
	.byte	PATT	
		.word	song014_1_1
	.byte	PATT	
		.word	song014_1_3
	.byte	PATT	
		.word	song014_1_4
	.byte	PATT	
		.word	song014_1_2
	.byte	PATT	
		.word	song014_1_1
	.byte	PATT	
		.word	song014_1_3
	.byte	PATT	
		.word	song014_1_4
	.byte	PATT	
		.word	song014_1_2
	.byte	PATT	
		.word	song014_1_1
	.byte	PATT	
		.word	song014_1_3
	.byte	PATT	
		.word	song014_1_4
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	PATT	
		.word	song014_1_2
	.byte	PATT	
		.word	song014_1_1
	.byte	GOTO	
		.word	song014_1_2
	.byte	FINE

	@********************** Track  2 **********************@

	.global song014_2
song014_2:	@ 0x08552B69
	.byte	KEYSH	, 0
	.byte	VOICE	, 33
	.byte	VOL	, v047
	.byte	PAN	, c_v
	.byte		N06	, Ds2, v127
	.byte	W18
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W18
song014_2_1:
	.byte		N06	, Ds2, v127
	.byte	W18
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PEND
song014_2_2:
	.byte		N06	, Ds2, v127
	.byte	W18
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W18
	.byte	PEND
	.byte	PATT	
		.word	song014_2_1
song014_2_3:
	.byte		N06	, En2, v127
	.byte	W18
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W18
	.byte	PEND
song014_2_4:
	.byte		N06	, En2, v127
	.byte	W18
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song014_2_2
	.byte	PATT	
		.word	song014_2_1
	.byte	PATT	
		.word	song014_2_3
	.byte	PATT	
		.word	song014_2_4
	.byte	PATT	
		.word	song014_2_2
	.byte	PATT	
		.word	song014_2_1
	.byte	PATT	
		.word	song014_2_3
	.byte	PATT	
		.word	song014_2_4
	.byte	PATT	
		.word	song014_2_2
	.byte	PATT	
		.word	song014_2_1
	.byte	PATT	
		.word	song014_2_3
	.byte		N06	, En2, v127
	.byte	W18
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte	PATT	
		.word	song014_2_1
	.byte	PATT	
		.word	song014_2_1
	.byte	PATT	
		.word	song014_2_1
	.byte	PATT	
		.word	song014_2_1
song014_2_5:
	.byte		N06	, Bn1, v127
	.byte	W18
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song014_2_5
	.byte	PATT	
		.word	song014_2_5
	.byte		N06	, Bn1, v127
	.byte	W18
	.byte		N06	
	.byte	W18
	.byte			As1
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song014_2_2
	.byte	PATT	
		.word	song014_2_1
	.byte	GOTO	
		.word	song014_2_2
	.byte	FINE

	@********************** Track  3 **********************@

	.global song014_3
song014_3:	@ 0x08552C3A
	.byte	KEYSH	, 0
	.byte	VOICE	, 19
	.byte	VOL	, v055
	.byte	PAN	, c_v
	.byte		TIE	, Ds2, v112
	.byte	W72
	.byte	W72
	.byte		EOT	
song014_3_3:
	.byte		N28	, Ds2, v116
	.byte	W30
	.byte		N02	, As2
	.byte	W06
	.byte		N44	, As2, v120
	.byte	W36
	.byte	W18
	.byte		N17	, Gs2, v127
	.byte	W18
	.byte			As2, v116
	.byte	W18
	.byte			Bn2, v112
	.byte	W18
	.byte		N28	, As2, v120
	.byte	W30
	.byte		N05	, Gs2, v116
	.byte	W06
	.byte		N52	, Fs2, v120
	.byte	W36
	.byte	W18
	.byte		N17	, Gs2, v116
	.byte	W18
	.byte			Fs2, v112
	.byte	W18
	.byte			En2, v108
	.byte	W18
	.byte		N32	, Ds2, v080
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	VOL	, v055
	.byte		N36	, Ds2, v127
	.byte	W36
	.byte		N12	, Fn2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte		N48	, Fn2
	.byte	W54
	.byte		N18	, Cs2
	.byte	W18
	.byte		N36	, Fs2
	.byte	W36
	.byte		N12	, Gs2
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte		N66	, Gs2
	.byte	W72
	.byte		N36	, Fs2
	.byte	W36
	.byte		N12	, Gs2
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte		N30	, As2
	.byte	W36
	.byte		N12	
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte		N72	, Gs2
	.byte	W72
	.byte		N36	, Cs3
	.byte	W36
	.byte			Bn2
	.byte	W36
song014_3_1:
	.byte		N06	, Ds3, v112
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			As2
	.byte	W06
	.byte	PEND
	.byte			En3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte	PATT	
		.word	song014_3_1
song014_3_2:
	.byte		N06	, Ds3, v112
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song014_3_1
	.byte	PATT	
		.word	song014_3_2
	.byte	PATT	
		.word	song014_3_1
	.byte	PATT	
		.word	song014_3_2
	.byte		N60	, As2, v112
	.byte	W66
	.byte		N06	, Ds2
	.byte	W06
	.byte		N72	
	.byte	W72
	.byte	GOTO	
		.word	song014_3_3
	.byte	FINE

	@********************** Track  4 **********************@

	.global song014_4
song014_4:	@ 0x08552D2D
	.byte	KEYSH	, 0
	.byte	VOICE	, 51
	.byte	VOL	, v055
	.byte	PAN	, c_v-6
	.byte		N68	, Ds2, v096
	.byte		TIE	, As2
	.byte	W72
	.byte	W36
	.byte		N17	, Ds3
	.byte	W18
	.byte			As3
	.byte	W17
	.byte		EOT	, As2
	.byte	W01
song014_4_5:
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	VOICE	, 49
	.byte	VOL	, v055
	.byte	PAN	, c_v-8
	.byte	W72
	.byte		N30	, Ds2, v104
	.byte	W30
	.byte		N03	, Fn2, v096
	.byte		N03	, As2
	.byte	W06
	.byte		N48	, Fn2, v092
	.byte		N48	, As2
	.byte	W36
	.byte	W18
	.byte		N15	, Ds2, v100
	.byte		N18	, Gs2
	.byte	W18
	.byte		N15	, Fn2, v096
	.byte		N18	, As2
	.byte	W18
	.byte		N15	, As2, v100
	.byte		N18	, Ds3
	.byte	W18
	.byte		N60	, Gs2, v108
	.byte		N66	, Cs3
	.byte	W66
	.byte		N06	, Fs2, v100
	.byte		N06	, Bn2
	.byte	W06
	.byte		N32	, Gs2, v104
	.byte		N36	, Cs3
	.byte	W36
	.byte		N15	, Cs2, v100
	.byte		N18	, Fs2
	.byte	W18
	.byte		N15	, Bn1
	.byte		N18	, En2
	.byte	W18
song014_4_1:
	.byte		N03	, Ds2, v104
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v088
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v104
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v088
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v104
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v088
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v104
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v088
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2
	.byte		N03	, As2
	.byte	W06
	.byte	PEND
song014_4_2:
	.byte		N03	, Ds2, v104
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v088
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v104
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v088
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v104
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v088
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v104
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v088
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v104
	.byte		N03	, As2
	.byte	W06
	.byte			Ds2, v088
	.byte		N03	, As2
	.byte	W06
	.byte	PEND
song014_4_3:
	.byte		N03	, En2, v104
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v088
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v104
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v088
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v104
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v088
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v104
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v088
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2
	.byte		N03	, Bn2
	.byte	W06
	.byte	PEND
song014_4_4:
	.byte		N03	, En2, v104
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v088
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v104
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v088
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v104
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v088
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v104
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v088
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v104
	.byte		N03	, Bn2
	.byte	W06
	.byte			En2, v088
	.byte		N03	, Bn2
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song014_4_1
	.byte	PATT	
		.word	song014_4_2
	.byte	PATT	
		.word	song014_4_3
	.byte	PATT	
		.word	song014_4_4
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	VOICE	, 51
	.byte	VOL	, v055
	.byte	PAN	, c_v-6
	.byte	W72
	.byte		N68	, As2, v100
	.byte	W36
	.byte		N17	, Ds3
	.byte	W18
	.byte			As3
	.byte	W18
	.byte	GOTO	
		.word	song014_4_5
	.byte	FINE

	@********************** Track  5 **********************@

	.global song014_5
song014_5:	@ 0x08552EAC
	.byte	KEYSH	, 0
	.byte	W72
	.byte	W72
song014_5_2:
	.byte	VOICE	, 53
	.byte	VOL	, v055
	.byte	PAN	, c_v
	.byte		TIE	, Ds2, v096
	.byte		TIE	, As2
	.byte	W72
	.byte	W68
	.byte		EOT	, Ds2
	.byte	W03
	.byte			As2
	.byte	W01
song014_5_1:
	.byte		TIE	, En2, v096
	.byte		TIE	, Bn2
	.byte	W72
	.byte	PEND
	.byte	W68
	.byte		EOT	, En2
	.byte	W03
	.byte			Bn2
	.byte	W01
	.byte		TIE	, Ds2
	.byte		TIE	, As2
	.byte	W72
	.byte	W68
	.byte		EOT	, Ds2
	.byte	W03
	.byte			As2
	.byte	W01
	.byte	PATT	
		.word	song014_5_1
	.byte	W68
	.byte		EOT	, En2
	.byte	W03
	.byte			Bn2
	.byte	W01
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	VOICE	, 53
	.byte	VOL	, v055
	.byte	PAN	, c_v
	.byte		N68	, Ds2, v100
	.byte		N72	, As2, v116
	.byte	W72
	.byte		N68	, En2, v100
	.byte		N36	, Cs3, v116
	.byte	W36
	.byte		N32	, Bn2, v127
	.byte	W36
	.byte		N68	, Ds2, v100
	.byte		N72	, As2, v124
	.byte	W72
	.byte		N32	, Ds2, v100
	.byte		N36	, Gs2, v116
	.byte	W36
	.byte		N32	, Ds2, v104
	.byte		N32	, Fs2, v124
	.byte	W36
	.byte		N68	, Fs2, v100
	.byte		N72	, Bn2, v124
	.byte	W72
	.byte		N68	, Fs2, v100
	.byte		N36	, As2, v124
	.byte	W36
	.byte			Bn2
	.byte	W36
	.byte		N68	, Fs2, v100
	.byte		N72	, As2, v124
	.byte	W72
	.byte		N32	, Bn2, v100
	.byte		N24	, Cs3, v124
	.byte	W24
	.byte		N06	
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte		N32	, As2, v100
	.byte		N32	, Fn3, v124
	.byte	W36
	.byte		N68	, Ds3
	.byte	W72
	.byte	W72
	.byte	GOTO	
		.word	song014_5_2
	.byte	FINE

	@********************** Track  6 **********************@

	.global song014_6
song014_6:	@ 0x08552F4D
	.byte	KEYSH	, 0
	.byte	W72
	.byte	W72
song014_6_1:
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	VOICE	, 48
	.byte	VOL	, v055
	.byte	PAN	, c_v-20
	.byte	W72
	.byte	VOL	, v031
	.byte		N42	, Fn3, v080
	.byte	W05
	.byte	VOL	, v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v055
	.byte	W21
	.byte		N06	, Fn3, v028
	.byte	W06
	.byte		N12	, As2, v080
	.byte	W12
	.byte			Fn3
	.byte	W12
	.byte		N48	, As3
	.byte	W32
	.byte	W03
	.byte	VOL	, v054
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v038
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
	.byte		v029
	.byte	W01
	.byte		v055
	.byte		N12	, Ds3
	.byte	W12
	.byte		N06	, Ds3, v028
	.byte	W06
	.byte		N36	, Gs3, v080
	.byte	W36
	.byte			Fs3
	.byte	W36
	.byte			En3
	.byte	W32
	.byte	W02
	.byte	VOL	, v055
	.byte	W02
	.byte		v054
	.byte		N18	, Ds3
	.byte	W01
	.byte	VOL	, v054
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v050
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
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v046
	.byte		N18	, Cs3
	.byte	W01
	.byte	VOL	, v046
	.byte	W01
	.byte		v045
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
	.byte		v040
	.byte	W01
	.byte		v040
	.byte		N36	, Ds3
	.byte	W01
	.byte	VOL	, v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
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
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W12
	.byte		N12	, Fn3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			Gs3
	.byte	W12
	.byte		N18	, Fs3
	.byte	W18
	.byte			As3
	.byte	W18
	.byte		N36	, Ds4
	.byte	W22
	.byte	VOL	, v055
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v049
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
	.byte		N36	, Cs4
	.byte	W01
	.byte	VOL	, v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W21
	.byte		N18	, Bn3
	.byte	W18
	.byte			As3
	.byte	W18
	.byte		N66	, Gs3
	.byte	W36
	.byte	W02
	.byte	VOL	, v054
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v048
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
	.byte		v040
	.byte	W01
	.byte		v039
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
	.byte		v032
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v028
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
	.byte		v021
	.byte	W01
	.byte		v019
	.byte		N06	, Gs3, v028
	.byte	W01
	.byte	VOL	, v018
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W02
	.byte	W72
	.byte	W72
	.byte		v055
	.byte	W54
	.byte		N05	, Ds3, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte		N14	, Ds3, v080
	.byte		N17	, Fs3, v096
	.byte	W18
	.byte		N14	, Fn3, v080
	.byte		N17	, Gs3, v096
	.byte	W18
	.byte		N14	, Fs3, v076
	.byte		N17	, As3, v092
	.byte	W18
	.byte		N14	, As3, v068
	.byte		N17	, Ds4, v084
	.byte	W18
	.byte		N56	, As3, v068
	.byte		N56	, Ds4, v084
	.byte	W60
	.byte		N05	, Cs4, v068
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte		N32	, As3
	.byte		N32	, Cs4, v084
	.byte	W36
	.byte			Bn3, v068
	.byte		N32	, Ds4, v084
	.byte	W36
	.byte		N68	, Fs3, v072
	.byte		N68	, As3, v088
	.byte	W72
	.byte		N32	, Cs3, v080
	.byte		N32	, Fn3, v096
	.byte	W36
	.byte			Gs2, v080
	.byte		N32	, Cs3, v096
	.byte	W36
	.byte		TIE	, As2, v080
	.byte		TIE	, Ds3, v096
	.byte	W44
	.byte	W03
	.byte	VOL	, v055
	.byte	W01
	.byte		v054
	.byte	W02
	.byte		v054
	.byte	W01
	.byte		v053
	.byte	W02
	.byte		v053
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W02
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v050
	.byte	W02
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
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v045
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
	.byte	W02
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
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
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
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v011
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
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W15
	.byte		EOT	, As2
	.byte			Ds3
	.byte	W07
	.byte	GOTO	
		.word	song014_6_1
	.byte	FINE

	@********************** Track  7 **********************@

	.global song014_7
song014_7:	@ 0x085531E7
	.byte	KEYSH	, 0
	.byte	VOICE	, 47
	.byte	VOL	, v055
	.byte	PAN	, c_v+12
	.byte		N11	, Ds2, v120
	.byte	W66
	.byte		N05	
	.byte	W06
	.byte		N11	
	.byte	W72
song014_7_1:
	.byte		N11	, Ds2, v120
	.byte	W66
	.byte		N05	
	.byte	W06
	.byte	PEND
	.byte		N11	
	.byte	W72
	.byte	PATT	
		.word	song014_7_1
	.byte		N11	, Ds2, v120
	.byte	W72
	.byte	PATT	
		.word	song014_7_1
	.byte		N11	, Ds2, v120
	.byte	W72
	.byte	PATT	
		.word	song014_7_1
	.byte		N11	, Ds2, v120
	.byte	W60
	.byte		N02	, As2
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte	PATT	
		.word	song014_7_1
	.byte		N11	, Ds2, v120
	.byte	W72
	.byte	PATT	
		.word	song014_7_1
	.byte		N11	, Ds2, v120
	.byte	W36
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte	PATT	
		.word	song014_7_1
	.byte		N11	, Ds2, v120
	.byte	W72
	.byte	PATT	
		.word	song014_7_1
	.byte		N11	, Ds2, v120
	.byte	W36
	.byte		N11	
	.byte	W18
	.byte		N02	, As2
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
song014_7_2:
	.byte		N11	, Ds2, v120
	.byte	W60
	.byte			As2
	.byte	W12
	.byte	PEND
	.byte			Ds2
	.byte	W72
	.byte	PATT	
		.word	song014_7_2
	.byte		N11	, Ds2, v120
	.byte	W60
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte	PATT	
		.word	song014_7_2
	.byte		N11	, Ds2, v120
	.byte	W60
	.byte		N11	
	.byte	W12
	.byte	PATT	
		.word	song014_7_2
	.byte		N11	, Ds2, v120
	.byte	W60
	.byte		N05	, As2
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PATT	
		.word	song014_7_1
	.byte		N11	, Ds2, v120
	.byte	W72
	.byte	GOTO	
		.word	song014_7_1
	.byte	FINE

	.align 2
	.global song014
song014:	@ 0x085532A0
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup008		@ voicegroup/tone

	.word	song014_1		@ track
	.word	song014_2		@ track
	.word	song014_3		@ track
	.word	song014_4		@ track
	.word	song014_5		@ track
	.word	song014_6		@ track
	.word	song014_7		@ track
