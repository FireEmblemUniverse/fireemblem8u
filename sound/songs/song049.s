	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song049_1
song049_1:	@ 0x0856B4CC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 63
	.byte	VOICE	, 59
	.byte	MOD	, 0
	.byte	VOL	, v043
	.byte	PAN	, c_v
	.byte	W24
	.byte		N06	, Gn2, v112
	.byte	W07
	.byte		N04	, Gn2, v036
	.byte	W17
	.byte		N24	, Cn3, v112
	.byte	W48
song049_1_3:
	.byte		N84	, Dn3, v112
	.byte	W84
	.byte		N06	, Dn3, v036
	.byte	W12
	.byte		N48	, Fn3, v112
	.byte	W48
	.byte		N18	, Dn3
	.byte	W18
	.byte		N06	, Dn3, v036
	.byte	W06
	.byte			Dn3, v112
	.byte	W06
	.byte			Dn3, v036
	.byte	W12
	.byte			Fn3, v112
	.byte	W06
	.byte		N84	, En3
	.byte	W84
	.byte		N06	, En3, v036
	.byte	W12
song049_1_1:
	.byte		N60	, An2, v112
	.byte	W60
	.byte		N06	, An2, v036
	.byte	W12
	.byte			An2, v112
	.byte	W06
	.byte			An2, v036
	.byte	W12
	.byte			An2, v112
	.byte	W06
	.byte	PEND
song049_1_2:
	.byte		N60	, Cn3, v112
	.byte	W60
	.byte		N06	, Cn3, v036
	.byte	W12
	.byte			Cn3, v112
	.byte	W06
	.byte			Cn3, v036
	.byte	W12
	.byte			Cn3, v112
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song049_1_1
	.byte	PATT	
		.word	song049_1_2
	.byte	VOICE	, 68
	.byte	VOL	, v041
	.byte		N72	, Bn3, v104
	.byte	W72
	.byte		N24	, Dn4
	.byte	W24
	.byte		N48	, Cs4
	.byte	W48
	.byte		N44	, En4
	.byte	W48
	.byte		N48	, Dn4
	.byte	W48
	.byte			Fs4
	.byte	W48
	.byte			En4
	.byte	W48
	.byte		N44	, Gn4
	.byte	W48
	.byte	VOICE	, 73
	.byte	VOL	, v050
	.byte		N60	, Fs4, v112
	.byte	W60
	.byte		N12	, Gn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte			Fs4
	.byte	W12
	.byte		N84	, En4
	.byte	W44
	.byte	W03
	.byte	MOD	, 0
	.byte	W01
	.byte		3
	.byte	W36
	.byte		N06	, En4, v024
	.byte	W11
	.byte	MOD	, 3
	.byte	W01
	.byte		0
	.byte		N60	, Fs4, v112
	.byte	W23
	.byte	MOD	, 0
	.byte	W01
	.byte		3
	.byte	W32
	.byte	W03
	.byte		3
	.byte	W01
	.byte		0
	.byte		N12	, Gn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte			Fs4
	.byte	W12
	.byte		N84	, Gn4
	.byte	W44
	.byte	W03
	.byte	MOD	, 0
	.byte	W01
	.byte		3
	.byte	W36
	.byte		N06	, Gn4, v032
	.byte	W11
	.byte	MOD	, 3
	.byte	W01
	.byte		0
	.byte		N72	, Fs4, v112
	.byte	W23
	.byte	MOD	, 0
	.byte	W01
	.byte		3
	.byte	W44
	.byte	W03
	.byte		3
	.byte	W01
	.byte		0
	.byte		N12	, Gn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte		N48	, Gn4
	.byte	W23
	.byte	MOD	, 0
	.byte	W01
	.byte		3
	.byte	W23
	.byte		3
	.byte	W01
	.byte		0
	.byte		N24	, Fs4
	.byte	W24
	.byte		N21	, En4
	.byte	W24
	.byte		N90	
	.byte	W44
	.byte	W03
	.byte	MOD	, 0
	.byte	W01
	.byte		3
	.byte	W42
	.byte		N06	, En4, v036
	.byte	W06
	.byte		N84	, An4, v112
	.byte	W84
	.byte		N12	, An4, v032
	.byte	W11
	.byte	MOD	, 3
	.byte	W01
	.byte	VOICE	, 68
	.byte	MOD	, 0
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte		N66	, Fs3, v080
	.byte		N66	, Dn4, v104
	.byte	W66
	.byte		N06	, Dn4, v032
	.byte	W06
	.byte		N04	, Fs3, v104
	.byte		N04	, Dn4
	.byte	W04
	.byte			Fs3, v032
	.byte		N04	, Dn4
	.byte	W04
	.byte			Fs3, v104
	.byte		N04	, Dn4
	.byte	W04
	.byte			Fs3, v032
	.byte		N04	, Dn4
	.byte	W04
	.byte			Fs3, v104
	.byte		N04	, Dn4
	.byte	W04
	.byte			Fs3, v032
	.byte		N04	, Dn4
	.byte	W04
	.byte		N66	, En3, v080
	.byte		N66	, Cn4, v104
	.byte	W66
	.byte		N06	, Cn4, v032
	.byte	W06
	.byte		N04	, En3, v080
	.byte		N04	, Cn4, v104
	.byte	W04
	.byte			En3, v032
	.byte		N04	, Cn4
	.byte	W04
	.byte			En3, v080
	.byte		N04	, Cn4, v104
	.byte	W04
	.byte			En3, v032
	.byte		N04	, Cn4
	.byte	W04
	.byte			En3, v080
	.byte		N04	, Cn4, v104
	.byte	W04
	.byte			En3, v032
	.byte		N04	, Cn4
	.byte	W04
	.byte		N66	, Dn3, v080
	.byte		N66	, Bn3, v104
	.byte	W23
	.byte	MOD	, 0
	.byte	W01
	.byte		0
	.byte	W42
	.byte		N06	, Bn3, v032
	.byte	W06
	.byte		N04	, Dn3, v080
	.byte		N04	, Bn3, v104
	.byte	W04
	.byte			Dn3, v032
	.byte		N04	, Bn3
	.byte	W04
	.byte			Dn3, v080
	.byte		N04	, Bn3, v104
	.byte	W04
	.byte			Dn3, v032
	.byte		N04	, Bn3
	.byte	W04
	.byte			Dn3, v080
	.byte		N04	, Bn3, v104
	.byte	W04
	.byte			Bn3, v032
	.byte	W04
	.byte		N42	, Dn3, v080
	.byte		N42	, As3, v104
	.byte	W42
	.byte		N06	, As3, v032
	.byte	W06
	.byte		N42	, En3, v080
	.byte		N42	, Cn4, v104
	.byte	W42
	.byte		N06	, En3, v032
	.byte		N06	, Cn4
	.byte	W06
	.byte		N66	, Fs3, v080
	.byte		N66	, Dn4, v104
	.byte	W66
	.byte		N06	, Fs3, v032
	.byte		N06	, Dn4
	.byte	W06
	.byte		N04	, Fs3, v080
	.byte		N04	, Dn4, v104
	.byte	W04
	.byte			Fs3, v032
	.byte		N04	, Dn4
	.byte	W04
	.byte			Fs3, v080
	.byte		N04	, Dn4, v104
	.byte	W04
	.byte			Fs3, v032
	.byte		N04	, Dn4
	.byte	W04
	.byte			Fs3, v080
	.byte		N04	, Dn4, v104
	.byte	W04
	.byte			Fs3, v032
	.byte		N04	, Dn4
	.byte	W04
	.byte		N36	, Fs3, v080
	.byte		N36	, Dn4, v104
	.byte	W36
	.byte		N06	, Fs3, v032
	.byte		N06	, Dn4
	.byte	W12
	.byte		N12	, Fs3, v080
	.byte		N12	, Dn4, v104
	.byte	W48
	.byte	VOICE	, 59
	.byte	MOD	, 0
	.byte	VOL	, v043
	.byte	PAN	, c_v
	.byte	W24
	.byte		N04	, Gn2, v112
	.byte	W04
	.byte			Gn2, v036
	.byte	W20
	.byte		N24	, Cn3, v112
	.byte	W48
	.byte	GOTO	
		.word	song049_1_3
	.byte	FINE

	@********************** Track  2 **********************@

	.global song049_2
song049_2:	@ 0x0856B6D4
	.byte	KEYSH	, 0
	.byte	VOICE	, 34
	.byte	VOL	, v043
	.byte	PAN	, c_v
	.byte		N44	, Cn2, v127
	.byte	W72
	.byte		N21	
	.byte	W24
song049_2_1:
	.byte		N44	, As1, v127
	.byte	W72
	.byte		N21	
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song049_2_1
	.byte	PATT	
		.word	song049_2_1
song049_2_2:
	.byte		N09	, Dn2, v127
	.byte	W12
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			An1
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song049_2_2
	.byte	PATT	
		.word	song049_2_2
	.byte	PATT	
		.word	song049_2_2
song049_2_3:
	.byte		N09	, Gn1, v127
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N32	, Gn2
	.byte	W36
	.byte		N09	, Dn2
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte	PEND
	.byte		N44	, Gn1
	.byte	W48
	.byte			Bn1
	.byte	W48
	.byte	PATT	
		.word	song049_2_3
	.byte		N21	, Bn2, v127
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			Bn1
	.byte	W24
	.byte		N32	, An1
	.byte	W36
	.byte		N09	
	.byte	W12
	.byte		N21	
	.byte	W24
	.byte			En1
	.byte	W24
	.byte		N32	, An1
	.byte	W36
	.byte		N09	
	.byte	W12
	.byte		N44	, En1
	.byte	W48
song049_2_4:
	.byte		N32	, Fs1, v127
	.byte	W36
	.byte		N09	
	.byte	W12
	.byte		N21	
	.byte	W24
	.byte		N21	
	.byte	W24
	.byte	PEND
song049_2_5:
	.byte		N32	, Gn1, v127
	.byte	W36
	.byte		N09	
	.byte	W12
	.byte		N21	, Fs1
	.byte	W24
	.byte			En1
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song049_2_4
	.byte	PATT	
		.word	song049_2_5
	.byte		N44	, An1, v127
	.byte	W48
	.byte			En1
	.byte	W48
	.byte			An1
	.byte	W48
	.byte			Cs2
	.byte	W48
	.byte		N21	, Dn2
	.byte	W24
	.byte			An1
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			An1
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Bn1
	.byte	W24
	.byte			Fs1
	.byte	W24
	.byte			Bn1
	.byte	W24
	.byte			Fs1
	.byte	W24
	.byte			As1
	.byte	W24
	.byte		N21	
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte		N21	
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte		N21	
	.byte	W24
	.byte		N21	
	.byte	W24
	.byte			An1
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			An1
	.byte	W24
	.byte			Dn2
	.byte	W48
	.byte		N44	, Cn2
	.byte	W72
	.byte		N21	
	.byte	W24
	.byte	GOTO	
		.word	song049_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song049_3
song049_3:	@ 0x0856B7AE
	.byte	KEYSH	, 0
	.byte	VOICE	, 102
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte		N48	, En3, v124
	.byte	W48
	.byte		N24	, Gn3
	.byte	W24
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W06
song049_3_2:
	.byte		N24	, Dn3, v124
	.byte	W24
	.byte		N06	, Dn4
	.byte	W18
	.byte		N06	
	.byte	W06
	.byte		N48	, Fn4
	.byte	W48
	.byte			Dn3
	.byte	W48
	.byte		N24	, Fn3
	.byte	W24
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W06
	.byte		N24	, En3
	.byte	W24
	.byte		N06	, En4
	.byte	W18
	.byte		N06	
	.byte	W06
	.byte		N24	, Gn4
	.byte	W24
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W06
	.byte			Dn3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Fs4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Fs4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Fs4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Fs4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Gn4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Gn4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Gn4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Gn4
	.byte	W12
	.byte	VOICE	, 46
	.byte	VOL	, v031
	.byte	PAN	, c_v+26
	.byte		N12	, Gn2, v120
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Bn3
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Bn4
	.byte	W12
	.byte			Gn4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Bn3
	.byte	W12
song049_3_1:
	.byte		N12	, Gn2, v120
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Bn3
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Bn4
	.byte	W12
	.byte			Gn4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte			Bn3
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song049_3_1
	.byte	PATT	
		.word	song049_3_1
	.byte	VOICE	, 0
	.byte	VOL	, v033
	.byte	PAN	, c_v
	.byte		N48	, Dn4, v124
	.byte	W48
	.byte			Fs4
	.byte	W48
	.byte			Cs4
	.byte	W48
	.byte		N42	, En4
	.byte	W48
	.byte		N48	, Dn4
	.byte	W48
	.byte			Fs4
	.byte	W48
	.byte			Dn4
	.byte	W48
	.byte			Gn4
	.byte	W48
	.byte			Fs4
	.byte	W48
	.byte			Dn4
	.byte	W48
	.byte		N48	
	.byte	W48
	.byte		N24	, Gn4
	.byte	W24
	.byte			En4
	.byte	W24
	.byte		N48	, Cs4
	.byte	W48
	.byte			En4
	.byte	W48
	.byte			Cs4
	.byte	W48
	.byte		N24	, An4
	.byte	W24
	.byte			Gn4
	.byte	W24
	.byte	VOICE	, 72
	.byte	VOL	, v018
	.byte	PAN	, c_v-24
	.byte		N06	, Fs4, v120
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Fs4, v108
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Fs4, v108
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Fs4, v108
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Fs4, v108
	.byte	W06
	.byte			Gn4, v112
	.byte	W06
	.byte			Fs4, v108
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			En4, v120
	.byte	W06
	.byte			Fs4, v112
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			En4, v108
	.byte	W06
	.byte			Fs4, v112
	.byte	W06
	.byte			En4, v108
	.byte	W06
	.byte			Fs4, v112
	.byte	W06
	.byte			En4, v108
	.byte	W06
	.byte			Fs4, v112
	.byte	W06
	.byte			En4, v108
	.byte	W06
	.byte			Fs4, v112
	.byte	W06
	.byte			En4, v108
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Dn4, v120
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte			Dn4, v108
	.byte	W06
	.byte			En4, v112
	.byte	W06
	.byte		N42	, Dn4, v088
	.byte	W42
	.byte		N06	, Dn4, v032
	.byte	W06
	.byte		N42	, En4, v088
	.byte	W42
	.byte		N06	, En4, v032
	.byte	W06
	.byte		N66	, Fs4, v088
	.byte	W66
	.byte		N06	, Fs4, v032
	.byte	W06
	.byte		N04	, Fs4, v088
	.byte	W04
	.byte			Fs4, v032
	.byte	W04
	.byte			Fs4, v088
	.byte	W04
	.byte			Fs4, v032
	.byte	W04
	.byte			Fs4, v088
	.byte	W04
	.byte			Fs4, v032
	.byte	W04
	.byte		N42	, Fs4, v088
	.byte	W42
	.byte		N06	, Fs4, v032
	.byte	W06
	.byte		N12	, Fs4, v088
	.byte	W24
	.byte	VOICE	, 102
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte		N06	, Cn3, v120
	.byte		N06	, Cn4
	.byte	W06
	.byte			Dn3
	.byte		N06	, Dn4
	.byte	W06
	.byte			En3
	.byte		N06	, En4
	.byte	W06
	.byte			Fn3
	.byte		N06	, Fn4
	.byte	W06
	.byte		N48	, En3, v124
	.byte		N72	, Gn4, v084
	.byte	W48
	.byte		N24	, Gn3, v124
	.byte	W24
	.byte		N06	
	.byte	W18
	.byte		N06	
	.byte	W06
	.byte	GOTO	
		.word	song049_3_2
	.byte	FINE

	@********************** Track  4 **********************@

	.global song049_4
song049_4:	@ 0x0856B97A
	.byte	KEYSH	, 0
	.byte	VOICE	, 56
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte	W24
	.byte		N06	, En3, v100
	.byte	W07
	.byte		N04	, En3, v036
	.byte	W17
	.byte		N24	, Gn3, v100
	.byte	W24
	.byte		N06	, Gn3, v036
	.byte	W24
song049_4_3:
	.byte		N72	, As3, v100
	.byte	W72
	.byte		N06	, As3, v036
	.byte	W24
	.byte		N48	, Dn4, v100
	.byte	W48
	.byte		N12	, As3
	.byte	W12
	.byte		N06	, As3, v036
	.byte	W12
	.byte			As3, v100
	.byte	W06
	.byte			As3, v036
	.byte	W12
	.byte			As3, v100
	.byte	W06
	.byte		N84	, Cn4
	.byte	W84
	.byte		N06	, Cn4, v036
	.byte	W12
song049_4_1:
	.byte		N68	, Fs3, v100
	.byte	W72
	.byte		N06	
	.byte	W06
	.byte			Fs3, v036
	.byte	W12
	.byte			Fs3, v100
	.byte	W06
	.byte	PEND
	.byte		N60	, Gn3
	.byte	W60
	.byte		N06	, Gn3, v036
	.byte	W12
	.byte			Gn3, v100
	.byte	W06
	.byte			Gn3, v036
	.byte	W12
	.byte			Gn3, v100
	.byte	W06
	.byte	PATT	
		.word	song049_4_1
	.byte		N68	, Gn3, v100
	.byte	W72
	.byte		N06	
	.byte	W06
	.byte			Gn3, v036
	.byte	W12
	.byte			Gn3, v100
	.byte	W06
	.byte	VOICE	, 48
	.byte	VOL	, v037
	.byte		N66	
	.byte	W66
	.byte		N06	, Gn3, v036
	.byte	W06
	.byte		N24	, Bn3, v100
	.byte	W24
	.byte		N42	, An3
	.byte	W42
	.byte		N06	, An3, v036
	.byte	W06
	.byte		N42	, Cs4, v100
	.byte	W42
	.byte		N06	, Cs4, v036
	.byte	W06
	.byte		N42	, Bn3, v100
	.byte	W42
	.byte		N06	, Bn3, v032
	.byte	W06
	.byte		N42	, Dn4, v100
	.byte	W42
	.byte		N06	, Dn4, v032
	.byte	W06
	.byte		N42	, Cs4, v100
	.byte	W42
	.byte		N06	, Cs4, v032
	.byte	W06
	.byte		N42	, En4, v100
	.byte	W42
	.byte		N06	, En4, v032
	.byte	W06
song049_4_2:
	.byte		N72	, An2, v100
	.byte	W72
	.byte		N24	
	.byte	W24
	.byte	PEND
	.byte		N48	
	.byte	W48
	.byte			En2
	.byte	W48
	.byte	PATT	
		.word	song049_4_2
	.byte		N48	, Bn2, v100
	.byte	W48
	.byte		N24	, Cs3
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte		N72	, An2
	.byte	W72
	.byte		N12	, Gn2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte		N72	, Bn2
	.byte	W72
	.byte		N12	, An2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte		N96	, An2
	.byte	W96
	.byte			En2
	.byte	W96
	.byte	PAN	, c_v
	.byte		N48	, Dn3
	.byte	W48
	.byte		N24	, Dn3, v068
	.byte	W24
	.byte		N04	, Dn3, v100
	.byte	W04
	.byte			Dn3, v068
	.byte	W04
	.byte			Dn3, v100
	.byte	W04
	.byte			Dn3, v068
	.byte	W04
	.byte			Dn3, v100
	.byte	W04
	.byte			Dn3, v068
	.byte	W04
	.byte		N48	, Cn3, v100
	.byte	W48
	.byte		N24	, Cn3, v068
	.byte	W24
	.byte		N04	, Cn3, v100
	.byte	W04
	.byte			Cn3, v068
	.byte	W04
	.byte			Cn3, v100
	.byte	W04
	.byte			Cn3, v068
	.byte	W04
	.byte			Cn3, v100
	.byte	W04
	.byte			Cn3, v068
	.byte	W04
	.byte		N48	, Bn2, v100
	.byte	W48
	.byte		N24	, Bn2, v068
	.byte	W24
	.byte		N04	, Bn2, v100
	.byte	W04
	.byte			Bn2, v068
	.byte	W04
	.byte			Bn2, v100
	.byte	W04
	.byte			Bn2, v068
	.byte	W04
	.byte			Bn2, v100
	.byte	W04
	.byte			Bn2, v068
	.byte	W04
	.byte		N24	, As2, v100
	.byte	W24
	.byte			As2, v068
	.byte	W24
	.byte			Cn3, v100
	.byte	W24
	.byte			Cn3, v068
	.byte	W24
	.byte		N48	, Dn3, v100
	.byte	W48
	.byte		N24	, Dn3, v068
	.byte	W24
	.byte		N04	, Dn3, v100
	.byte	W04
	.byte			Dn3, v068
	.byte	W04
	.byte			Dn3, v100
	.byte	W04
	.byte			Dn3, v068
	.byte	W04
	.byte			Dn3, v100
	.byte	W04
	.byte			Dn3, v068
	.byte	W04
	.byte		N24	, Dn3, v100
	.byte	W24
	.byte			Dn3, v068
	.byte	W24
	.byte		N12	, Dn3, v100
	.byte	W24
	.byte	VOICE	, 102
	.byte	W24
	.byte	W24
	.byte		56
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte		N04	, En3
	.byte	W04
	.byte			En3, v036
	.byte	W20
	.byte		N24	, Gn3, v100
	.byte	W48
	.byte	GOTO	
		.word	song049_4_3
	.byte	FINE

	@********************** Track  5 **********************@

	.global song049_5
song049_5:	@ 0x0856BAED
	.byte	KEYSH	, 0
song049_5_4:
	.byte	VOICE	, 47
	.byte	VOL	, v043
	.byte	PAN	, c_v+16
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte	VOICE	, 62
	.byte	VOL	, v041
	.byte	PAN	, c_v+16
	.byte		N06	, Cn3, v112
	.byte	W12
	.byte			Gn2, v108
	.byte	W12
	.byte			Cn3, v112
	.byte	W12
	.byte			Gn2, v108
	.byte	W12
	.byte	PEND
song049_5_1:
	.byte	VOICE	, 47
	.byte	VOL	, v043
	.byte	PAN	, c_v+16
	.byte		N24	, As2, v127
	.byte	W24
	.byte			Fn2
	.byte	W24
	.byte	VOICE	, 62
	.byte	VOL	, v041
	.byte	PAN	, c_v+16
	.byte		N06	, As2, v112
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
	.byte			As2, v112
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song049_5_1
	.byte		N48	, As2, v127
	.byte	W48
	.byte		N06	, As2, v112
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
	.byte			As2, v112
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
song049_5_2:
	.byte	VOICE	, 47
	.byte	VOL	, v043
	.byte	PAN	, c_v+16
	.byte		N24	, Dn3, v127
	.byte	W24
	.byte	VOICE	, 62
	.byte	VOL	, v041
	.byte	PAN	, c_v+16
	.byte		N24	, An2
	.byte	W24
	.byte		N06	, Dn3, v112
	.byte	W12
	.byte			An2, v108
	.byte	W12
	.byte			Dn3, v112
	.byte	W12
	.byte			An2, v108
	.byte	W12
	.byte	PEND
song049_5_3:
	.byte		N48	, Dn2, v127
	.byte	W48
	.byte		N06	, Dn3, v112
	.byte	W12
	.byte			An2, v108
	.byte	W12
	.byte			Dn3, v112
	.byte	W12
	.byte			An2, v108
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song049_5_2
	.byte	PATT	
		.word	song049_5_3
	.byte	VOICE	, 48
	.byte	VOL	, v033
	.byte	PAN	, c_v-24
	.byte		N12	, Gn2, v104
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte		N36	, Bn2
	.byte	W36
	.byte		N12	, Gn2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte		N60	, Dn3
	.byte	W60
	.byte		N12	, Gn2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte		N36	, Bn2
	.byte	W36
	.byte		N12	, Gn2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte			Bn2, v120
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Dn2, v112
	.byte	W12
	.byte		N96	, Fs3, v104
	.byte	W96
	.byte		N48	, En3
	.byte	W48
	.byte			Cs3
	.byte	W48
	.byte		N96	, Fs3
	.byte	W96
	.byte		N48	, Gn3
	.byte	W48
	.byte		N24	, An3
	.byte	W24
	.byte			Bn3
	.byte	W24
	.byte		N72	, An3
	.byte	W72
	.byte		N12	, Gn3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte		N72	, Gn3
	.byte	W72
	.byte		N12	, Fs3
	.byte	W12
	.byte			En3
	.byte	W12
	.byte		N96	
	.byte	W96
	.byte			An3
	.byte	W96
	.byte	VOICE	, 47
	.byte	VOL	, v043
	.byte	PAN	, c_v+16
	.byte		N48	, Dn3, v120
	.byte	W48
	.byte		N24	
	.byte	W24
	.byte			An2
	.byte	W24
	.byte		N48	, Cn3
	.byte	W48
	.byte		N24	
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte		N48	, Bn2
	.byte	W48
	.byte		N24	
	.byte	W24
	.byte		N21	, Fs2
	.byte	W24
	.byte		N48	, As2
	.byte	W48
	.byte			Cn3
	.byte	W48
	.byte			Dn3
	.byte	W48
	.byte		N24	
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte		N12	, An2, v100
	.byte	W12
	.byte		N06	, An2, v120
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PATT	
		.word	song049_5_4
	.byte	GOTO	
		.word	song049_5_1
	.byte	FINE

	@********************** Track  6 **********************@

	.global song049_6
song049_6:	@ 0x0856BC2D
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v037
	.byte	PAN	, c_v
	.byte		N24	, Cs2, v088
	.byte	W24
	.byte			Cs2, v072
	.byte	W24
	.byte		N12	, Bn4, v084
	.byte	W24
	.byte		N04	, Dn1, v100
	.byte	W04
	.byte			Dn1, v076
	.byte	W04
	.byte			Dn1, v084
	.byte	W04
	.byte			Dn1, v064
	.byte	W04
	.byte			Dn1, v076
	.byte	W04
	.byte			Dn1, v064
	.byte	W04
song049_6_4:
	.byte		N24	, Cs2, v072
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte		N12	, Bn4, v084
	.byte	W24
	.byte		N06	, Dn1, v112
	.byte	W24
	.byte		N24	, Cs2, v072
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte		N12	, Bn4, v084
	.byte	W24
	.byte		N24	, Cs2, v072
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte		N06	, Dn1, v112
	.byte	W24
	.byte		N12	, Bn4, v084
	.byte	W24
	.byte		N24	, Cs2, v072
	.byte	W24
	.byte		N06	, Fs1, v100
	.byte	W24
	.byte		N24	, As1, v060
	.byte	W24
	.byte		N06	, Dn1, v112
	.byte	W24
	.byte		N24	, As1, v060
	.byte	W24
	.byte		N06	, Dn1, v112
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N24	, As1, v060
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte		N06	, Fs1, v100
	.byte	W24
	.byte		N24	, As1, v060
	.byte	W24
	.byte		N06	, Dn1, v112
	.byte	W24
	.byte		N24	, As1, v060
	.byte	W24
	.byte		N06	, Dn1, v112
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Fs1, v080
	.byte	W12
	.byte		N06	
	.byte	W12
song049_6_1:
	.byte		N12	, Bn4, v084
	.byte	W36
	.byte			Bn4, v080
	.byte	W12
	.byte			Bn4, v084
	.byte	W48
	.byte	PEND
	.byte	PATT	
		.word	song049_6_1
	.byte	PATT	
		.word	song049_6_1
	.byte	PATT	
		.word	song049_6_1
song049_6_2:
	.byte		N12	, Bn4, v084
	.byte	W36
	.byte			Bn4, v080
	.byte	W12
	.byte			Bn4, v084
	.byte	W24
	.byte		N06	, Fs2, v056
	.byte	W06
	.byte			Fs2, v020
	.byte	W18
	.byte	PEND
	.byte		N12	, Bn4, v084
	.byte	W48
	.byte		N12	
	.byte	W24
	.byte		N06	, Fs2, v056
	.byte		N12	, Bn4, v080
	.byte	W06
	.byte		N06	, Fs2, v020
	.byte	W18
	.byte	PATT	
		.word	song049_6_2
	.byte	PATT	
		.word	song049_6_2
	.byte	PATT	
		.word	song049_6_2
	.byte		N12	, Bn4, v084
	.byte	W36
	.byte			Bn4, v080
	.byte	W12
	.byte			Bn4, v084
	.byte	W24
	.byte		N06	, Fs2, v056
	.byte	W06
	.byte			Fs2, v020
	.byte	W06
	.byte		N12	, Bn4, v080
	.byte	W12
	.byte	PATT	
		.word	song049_6_2
	.byte		N12	, Bn4, v084
	.byte	W48
	.byte		N06	, Cn2, v112
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte		N06	
	.byte	W12
song049_6_3:
	.byte		N24	, Cs2, v072
	.byte	W24
	.byte		N06	, Dn1, v112
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Fn1
	.byte	W24
	.byte	PEND
	.byte			Dn1
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Cn2
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Fn1
	.byte	W24
	.byte			Dn1
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Fn1
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Dn1
	.byte	W24
	.byte			Cn2
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song049_6_3
	.byte		N24	, Cs2, v072
	.byte	W24
	.byte		N06	, Fn1, v112
	.byte	W24
	.byte		N24	, Cs2, v072
	.byte	W24
	.byte		N06	, Dn1, v112
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			An1
	.byte	W06
	.byte			Fn1
	.byte	W06
	.byte		N24	, Cs2, v072
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte		N12	, Bn4, v084
	.byte	W24
	.byte		N04	, Dn1, v100
	.byte	W04
	.byte			Dn1, v076
	.byte	W04
	.byte			Dn1, v084
	.byte	W04
	.byte			Dn1, v064
	.byte	W04
	.byte			Dn1, v076
	.byte	W04
	.byte			Dn1, v064
	.byte	W04
	.byte	GOTO	
		.word	song049_6_4
	.byte	FINE

	.align 2
	.global song049
song049:	@ 0x0856BD94
	.byte	6		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup069		@ voicegroup/tone

	.word	song049_1		@ track
	.word	song049_2		@ track
	.word	song049_3		@ track
	.word	song049_4		@ track
	.word	song049_5		@ track
	.word	song049_6		@ track
