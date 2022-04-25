	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song030_1
song030_1:	@ 0x0855F9C0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 50
	.byte	VOICE	, 52
	.byte	MOD	, 0
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte	W24
	.byte		N18	, Dn4, v112
	.byte	W18
	.byte		N06	, Dn4, v072
	.byte	W06
	.byte		N18	, En4, v112
	.byte	W18
	.byte		N06	, En4, v072
	.byte	W06
	.byte		N18	, Cs4, v112
	.byte	W18
	.byte		N06	, Cs4, v072
	.byte	W06
	.byte	W24
	.byte		N18	, En4, v112
	.byte	W18
	.byte		N06	, En4, v072
	.byte	W06
	.byte		N18	, Fs4, v112
	.byte	W18
	.byte		N06	, Fs4, v072
	.byte	W06
	.byte		N18	, Dn4, v112
	.byte	W18
	.byte		N06	, Dn4, v072
	.byte	W06
	.byte		N42	, Fs4, v112
	.byte	W42
	.byte		N06	, Fs4, v072
	.byte	W06
	.byte		N42	, Fn4, v112
	.byte	W42
	.byte		N06	, Fn4, v072
	.byte	W06
	.byte		N42	, Dn4, v112
	.byte	W42
	.byte		N06	, Dn4, v072
	.byte	W06
	.byte		N42	, Cn4, v112
	.byte	W42
	.byte		N06	, Cn4, v072
	.byte	W06
	.byte	TEMPO	, 55
	.byte		N90	, Cs4, v112
	.byte	W90
	.byte		N06	, Cs4, v072
	.byte	W06
song030_1_2:
	.byte	TEMPO	, 75
	.byte		N42	, Cn4, v112
	.byte	W42
	.byte		N06	, Cn4, v072
	.byte	W06
	.byte		N42	, Dn4, v112
	.byte	W42
	.byte		N06	, Dn4, v072
	.byte	W06
	.byte		N24	, Fn4, v112
	.byte	W24
	.byte			Ds4
	.byte	W24
	.byte			Dn4
	.byte	W24
	.byte			Ds4
	.byte	W24
	.byte		N42	, Gs3
	.byte	W42
	.byte		N06	, Gs3, v072
	.byte	W06
	.byte		N42	, As3, v112
	.byte	W42
	.byte		N06	, As3, v072
	.byte	W06
	.byte		N24	, Cs4, v112
	.byte	W24
	.byte			Bn3
	.byte	W24
	.byte			As3
	.byte	W24
	.byte			Gs3
	.byte	W24
	.byte		N42	, En3
	.byte	W42
	.byte		N06	, En3, v072
	.byte	W06
	.byte		N42	, Fs3, v112
	.byte	W42
	.byte		N06	, Fs3, v072
	.byte	W06
	.byte		N24	, An3, v112
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte			Fs3
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte		N42	, Fs3
	.byte	W42
	.byte		N06	, Fs3, v072
	.byte	W06
	.byte		N42	, Gs3, v112
	.byte	W42
	.byte		N06	, Gs3, v072
	.byte	W06
	.byte		N24	, Bn3, v112
	.byte	W24
	.byte			An3
	.byte	W24
	.byte			Gs3
	.byte	W24
	.byte			An3
	.byte	W24
	.byte		N90	, Gn3
	.byte	W90
	.byte		N06	, Gn3, v072
	.byte	W06
	.byte		N90	, Gs3, v112
	.byte	W90
	.byte		N06	, Gs3, v072
	.byte	W06
	.byte		N90	, An3, v112
	.byte	W90
	.byte		N06	, An3, v072
	.byte	W06
	.byte		N90	, As3, v112
	.byte	W90
	.byte		N06	, As3, v072
	.byte	W06
song030_1_1:
	.byte		N30	, Dn4, v112
	.byte	W30
	.byte		N06	, Dn4, v072
	.byte	W06
	.byte		N30	, Cn4, v112
	.byte	W30
	.byte		N06	, Cn4, v072
	.byte	W06
	.byte		N18	, Ds4, v112
	.byte	W18
	.byte		N06	, Ds4, v072
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song030_1_1
	.byte		N90	, Fn4, v112
	.byte	W90
	.byte		N06	, Fn4, v072
	.byte	W06
	.byte		N90	, Gn4, v112
	.byte	W90
	.byte		N06	, Gn4, v072
	.byte	W05
	.byte	VOL	, v041
	.byte	W01
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte	PAN	, c_v
	.byte		N06	, Gn4, v108
	.byte	W06
	.byte			Gs4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			As4
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Fn3
	.byte	W05
	.byte	VOL	, v034
	.byte	W01
	.byte	TEMPO	, 72
	.byte	VOICE	, 52
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte	W12
	.byte		N12	, Bn3, v056
	.byte	W12
	.byte	TEMPO	, 70
	.byte		N06	, Bn3, v032
	.byte	W12
	.byte		N12	, Bn3, v072
	.byte	W12
	.byte	TEMPO	, 66
	.byte		N06	, Bn3, v032
	.byte	W12
	.byte		N12	, Bn3, v084
	.byte	W12
	.byte	TEMPO	, 62
	.byte		N06	, Bn3, v032
	.byte	W12
	.byte		N12	, Bn3, v100
	.byte	W12
	.byte	TEMPO	, 56
	.byte		N06	, Bn3, v032
	.byte	W12
	.byte		N12	, Cn4, v116
	.byte	W12
	.byte	TEMPO	, 51
	.byte		N06	, Cn4, v032
	.byte	W12
	.byte		N12	, Cn4, v100
	.byte	W12
	.byte	TEMPO	, 47
	.byte		N06	, Cn4, v032
	.byte	W12
	.byte		N12	, Cn4, v080
	.byte	W12
	.byte	TEMPO	, 43
	.byte		N06	, Cn4, v032
	.byte	W12
	.byte		N12	, Cn4, v056
	.byte	W12
	.byte	TEMPO	, 66
	.byte	VOL	, v028
	.byte		N90	, Fs3, v112
	.byte	W04
	.byte	VOL	, v028
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
	.byte	W03
	.byte		v030
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	MOD	, 0
	.byte	W01
	.byte		4
	.byte	W01
	.byte		5
	.byte	VOL	, v032
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W03
	.byte		v034
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
	.byte	W03
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
	.byte		v039
	.byte	W03
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W12
	.byte	MOD	, 5
	.byte	W03
	.byte		3
	.byte		N06	, Fs3, v072
	.byte	W03
	.byte	MOD	, 0
	.byte	W03
	.byte		N90	, Cn3, v112
	.byte	W32
	.byte	W03
	.byte	MOD	, 0
	.byte	W03
	.byte		2
	.byte	W03
	.byte		5
	.byte	W07
	.byte	TEMPO	, 67
	.byte	W42
	.byte		N06	, Cn3, v072
	.byte	W02
	.byte	MOD	, 5
	.byte	W01
	.byte		3
	.byte	W02
	.byte		0
	.byte	W01
	.byte		N90	, Fs3, v112
	.byte	W32
	.byte	W03
	.byte	MOD	, 0
	.byte	W01
	.byte		1
	.byte	W02
	.byte		3
	.byte	W01
	.byte		5
	.byte	W48
	.byte	W03
	.byte		5
	.byte		N06	, Fs3, v072
	.byte	W02
	.byte	MOD	, 3
	.byte	W01
	.byte		0
	.byte	W03
	.byte		N90	, Cn3, v112
	.byte	W24
	.byte	W03
	.byte	MOD	, 0
	.byte	W02
	.byte		1
	.byte	W01
	.byte		3
	.byte	W01
	.byte		5
	.byte	W56
	.byte	W03
	.byte		N06	, Cn3, v072
	.byte	W01
	.byte	MOD	, 5
	.byte	W01
	.byte		3
	.byte	W02
	.byte		0
	.byte	W02
	.byte		N90	, An3, v112
	.byte	W32
	.byte	MOD	, 0
	.byte	W03
	.byte		2
	.byte	W03
	.byte		5
	.byte	W44
	.byte	W03
	.byte		5
	.byte	W02
	.byte		3
	.byte	W01
	.byte		1
	.byte	W01
	.byte		0
	.byte	W01
	.byte		N06	, An3, v072
	.byte	W06
	.byte		N90	, Ds3, v112
	.byte	W24
	.byte	W02
	.byte	MOD	, 0
	.byte	W03
	.byte		2
	.byte	W02
	.byte		5
	.byte	W54
	.byte		5
	.byte	W01
	.byte		4
	.byte	W02
	.byte		2
	.byte	W01
	.byte		0
	.byte	W01
	.byte		N06	, Ds3, v072
	.byte	W06
	.byte		N90	, An3, v112
	.byte	W30
	.byte	MOD	, 0
	.byte	W03
	.byte		2
	.byte	W02
	.byte		5
	.byte	W48
	.byte	W02
	.byte		5
	.byte	W02
	.byte		3
	.byte	W01
	.byte		1
	.byte	W01
	.byte		0
	.byte	W01
	.byte		N06	, An3, v072
	.byte	W06
	.byte		N66	, Ds3, v112
	.byte	W18
	.byte	MOD	, 0
	.byte	W01
	.byte		1
	.byte	W02
	.byte		3
	.byte	W01
	.byte		5
	.byte	W44
	.byte		5
	.byte		N06	, Ds3, v072
	.byte	W02
	.byte	MOD	, 3
	.byte	W01
	.byte		0
	.byte	W02
	.byte	VOL	, v041
	.byte	W01
	.byte	TEMPO	, 75
	.byte	VOICE	, 48
	.byte	VOL	, v034
	.byte	PAN	, c_v
	.byte		N12	, En3, v108
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte		N72	, Bn3
	.byte	W72
	.byte		N12	, Fn3
	.byte	W12
	.byte			Cs4
	.byte	W12
	.byte	TEMPO	, 71
	.byte			Cs4, v068
	.byte	W12
	.byte			Cn4, v108
	.byte	W12
	.byte			Cn4, v068
	.byte	W12
	.byte			Fn3, v108
	.byte	W12
	.byte			Fn3, v068
	.byte	W12
	.byte			Cn4, v108
	.byte	W12
	.byte			Cn4, v068
	.byte	W12
	.byte			Fn3, v108
	.byte	W12
	.byte	GOTO	
		.word	song030_1_2
	.byte	FINE

	@********************** Track  2 **********************@

	.global song030_2
song030_2:	@ 0x0855FCC2
	.byte	KEYSH	, 0
	.byte	VOICE	, 19
	.byte	VOL	, v048
	.byte	PAN	, c_v
	.byte		N96	, Bn2, v108
	.byte	W96
	.byte		N92	
	.byte	W96
	.byte		TIE	, Fs2
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		N24	
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte		N24	
	.byte	W24
song030_2_4:
	.byte		N84	, Cn2, v120
	.byte	W84
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N72	
	.byte	W72
	.byte		N06	, Dn2
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte		N84	, Gs2
	.byte	W84
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N72	
	.byte	W72
	.byte		N06	
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte		N84	, En2
	.byte	W84
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N96	
	.byte	W96
	.byte		N48	, Fs2
	.byte	W48
	.byte			Cs2
	.byte	W48
	.byte			An2
	.byte	W48
	.byte			Fs2
	.byte	W48
	.byte		N96	, Gn2
	.byte	W96
	.byte			Ds2
	.byte	W96
	.byte			Cs2
	.byte	W96
	.byte			Dn2
	.byte	W96
	.byte			Gs2
	.byte	W96
	.byte			An2
	.byte	W96
	.byte			As2
	.byte	W96
	.byte			Bn2
	.byte	W96
	.byte		N12	, Gn2
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte			Gn1
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			An2
	.byte	W24
	.byte			An1
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			An1
	.byte	W24
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N09	, Bn2
	.byte	W12
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N09	
	.byte	W12
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N09	
	.byte	W12
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N09	, Bn1
	.byte	W12
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N09	, Bn2
	.byte	W12
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N09	
	.byte	W12
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N09	
	.byte	W12
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N09	, Bn1
	.byte	W12
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N09	, Cn3
	.byte	W12
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N09	
	.byte	W12
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N09	
	.byte	W12
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N09	, Cn2
	.byte	W12
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N09	, Cn3
	.byte	W12
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N09	
	.byte	W12
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N09	
	.byte	W12
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N09	, Cn2
	.byte	W12
song030_2_1:
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N96	, Fs2, v108
	.byte	W96
	.byte	PEND
song030_2_2:
	.byte		N72	, Cn2, v108
	.byte	W72
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song030_2_1
	.byte	PATT	
		.word	song030_2_2
song030_2_3:
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N96	, An2, v108
	.byte	W96
	.byte	PEND
	.byte		N72	, Ds2
	.byte	W72
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte	PATT	
		.word	song030_2_3
	.byte		N72	, Ds2, v108
	.byte	W72
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N12	, En2
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N96	, Ds2
	.byte	W96
	.byte		N12	, En3
	.byte	W12
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N12	, En2
	.byte	W12
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N12	, Bn2
	.byte	W12
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N12	, Bn1
	.byte	W12
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N12	, En3
	.byte	W12
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N12	, En2
	.byte	W12
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte		N12	, Bn2
	.byte	W12
	.byte	VOICE	, 62
	.byte	VOL	, v034
	.byte		N12	, Bn1
	.byte	W12
	.byte	GOTO	
		.word	song030_2_4
	.byte	FINE

	@********************** Track  3 **********************@

	.global song030_3
song030_3:	@ 0x0855FE26
	.byte	KEYSH	, 0
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte	PAN	, c_v
	.byte	BEND	, c_v-2
	.byte		N96	, Fs3, v108
	.byte	W96
	.byte		N96	
	.byte	W96
	.byte		TIE	, Cs3
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		N24	
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte		N24	
	.byte	W24
song030_3_1:
	.byte	VOICE	, 102
	.byte	VOL	, v034
	.byte	PAN	, c_v
	.byte	BEND	, c_v
	.byte		N48	, Cn4, v112
	.byte	W48
	.byte			Dn4
	.byte	W48
	.byte		N24	, Fn4
	.byte	W24
	.byte			Ds4
	.byte	W24
	.byte			Dn4
	.byte	W24
	.byte			Ds4
	.byte	W24
	.byte		N48	, Gs3
	.byte	W48
	.byte			As3
	.byte	W48
	.byte		N24	, Cs4
	.byte	W24
	.byte			Bn3
	.byte	W24
	.byte			As3
	.byte	W24
	.byte			Gs3
	.byte	W24
	.byte		N48	, En4
	.byte	W48
	.byte			Fs4
	.byte	W48
	.byte		N24	, An4
	.byte	W24
	.byte			Gn4
	.byte	W24
	.byte			Fs4
	.byte	W24
	.byte			Gn4
	.byte	W24
	.byte		N48	, Fs4
	.byte	W48
	.byte			Gs4
	.byte	W48
	.byte		N24	, Bn4
	.byte	W24
	.byte			An4
	.byte	W24
	.byte			Gs4
	.byte	W24
	.byte			An4
	.byte	W24
	.byte	VOICE	, 72
	.byte	VOL	, v034
	.byte	PAN	, c_v+16
	.byte		N36	, Bn3, v108
	.byte	W24
	.byte	MOD	, 3
	.byte	W12
	.byte		N12	, Bn3, v068
	.byte	W12
	.byte	MOD	, 0
	.byte		N12	, Bn3, v108
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			Bn3
	.byte	W12
	.byte		N48	, Cn4
	.byte	W12
	.byte	W24
	.byte	MOD	, 3
	.byte	W12
	.byte		N12	, Cn4, v068
	.byte	W12
	.byte	MOD	, 0
	.byte		N12	, Cn4, v108
	.byte	W12
	.byte			Gs3
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte		N48	, Cs4
	.byte	W12
	.byte	W24
	.byte	MOD	, 3
	.byte	W12
	.byte		N12	, Cs4, v068
	.byte	W12
	.byte	MOD	, 0
	.byte		N12	, Cs4, v108
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Cs4
	.byte	W12
	.byte		N48	, Dn4
	.byte	W12
	.byte	W12
	.byte	MOD	, 3
	.byte	W24
	.byte		N12	, Dn4, v068
	.byte	W12
	.byte	MOD	, 0
	.byte		N36	, As3, v108
	.byte	W24
	.byte	MOD	, 3
	.byte	W12
	.byte		N12	, As3, v068
	.byte	W11
	.byte	VOL	, v034
	.byte	W01
	.byte	VOICE	, 48
	.byte	MOD	, 0
	.byte	VOL	, v035
	.byte	PAN	, c_v+26
	.byte		N36	, As3, v108
	.byte	W36
	.byte			Gs3
	.byte	W36
	.byte		N24	, Cn4
	.byte	W24
	.byte		N36	, As3
	.byte	W36
	.byte			An3
	.byte	W36
	.byte		N24	, Cn4
	.byte	W24
	.byte		N36	
	.byte	W36
	.byte			As3
	.byte	W36
	.byte		N24	, Dn4
	.byte	W24
	.byte		N36	
	.byte	W36
	.byte			Bn3
	.byte	W36
	.byte		N06	, Gn3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Cn4
	.byte	W05
	.byte	VOL	, v035
	.byte	W01
	.byte	VOICE	, 19
	.byte	VOL	, v034
	.byte	PAN	, c_v
	.byte		N06	, Gn3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			An2
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			Fn2
	.byte	W05
	.byte	VOL	, v034
	.byte	W01
	.byte	VOICE	, 52
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte	W12
	.byte		N12	, Fs3, v052
	.byte	W12
	.byte		N06	, Fs3, v028
	.byte	W12
	.byte		N12	, Fs3, v072
	.byte	W12
	.byte		N06	, Fs3, v028
	.byte	W12
	.byte		N12	, Fs3, v084
	.byte	W12
	.byte		N06	, Fs3, v028
	.byte	W12
	.byte		N12	, Fs3, v100
	.byte	W12
	.byte		N06	, Fs3, v028
	.byte	W12
	.byte		N12	, Gn3, v120
	.byte	W12
	.byte		N06	, Gn3, v028
	.byte	W12
	.byte		N12	, Gn3, v100
	.byte	W12
	.byte		N06	, Gn3, v028
	.byte	W12
	.byte		N12	, Gn3, v076
	.byte	W12
	.byte		N06	, Gn3, v028
	.byte	W12
	.byte		N12	, Gn3, v048
	.byte	W11
	.byte	VOL	, v041
	.byte	W01
	.byte	VOICE	, 102
	.byte	VOL	, v018
	.byte	PAN	, c_v
	.byte		N96	, Cn3, v112
	.byte	W03
	.byte	VOL	, v018
	.byte	W02
	.byte		v019
	.byte	W02
	.byte		v019
	.byte	W02
	.byte		v020
	.byte	W01
	.byte		v020
	.byte	W02
	.byte		v020
	.byte	W02
	.byte		v021
	.byte	W02
	.byte		v021
	.byte	W02
	.byte		v021
	.byte	W01
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W02
	.byte		v026
	.byte	W02
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
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v031
	.byte	W01
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
	.byte	W01
	.byte		v034
	.byte	W22
	.byte		N96	, Fs3
	.byte	W96
	.byte			Cn3
	.byte	W96
	.byte			Fs3
	.byte	W96
	.byte			Ds3
	.byte	W96
	.byte			An3
	.byte	W96
	.byte			Ds3
	.byte	W96
	.byte		N72	, An3
	.byte	W72
	.byte		N12	, En3, v108
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte		N72	, Bn3
	.byte	W72
	.byte		N12	, Fn3
	.byte	W12
	.byte			Cs4
	.byte	W12
	.byte	W12
	.byte			Cn4
	.byte	W24
	.byte			Fn3
	.byte	W24
	.byte			Cn4
	.byte	W24
	.byte			Fn3
	.byte	W12
	.byte	GOTO	
		.word	song030_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song030_4
song030_4:	@ 0x0856002E
	.byte	KEYSH	, 0
	.byte	VOICE	, 50
	.byte	MOD	, 0
	.byte	VOL	, v032
	.byte	PAN	, c_v+2
	.byte	W24
	.byte		N24	, Dn4, v100
	.byte	W24
	.byte			En4
	.byte	W24
	.byte			Cs4
	.byte	W24
	.byte	W24
	.byte			En4
	.byte	W24
	.byte			Fs4
	.byte	W24
	.byte			Dn4
	.byte	W24
	.byte		N06	, An4
	.byte	W06
	.byte			An4, v060
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v060
	.byte	W06
	.byte			An4, v100
	.byte	W06
	.byte			An4, v060
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v060
	.byte	W06
	.byte			Gs4, v100
	.byte	W06
	.byte			Gs4, v060
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v060
	.byte	W06
	.byte			Gs4, v100
	.byte	W06
	.byte			Gs4, v060
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v060
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Fs4, v060
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v060
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Fs4, v060
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v060
	.byte	W06
	.byte			Fn4, v100
	.byte	W06
	.byte			Fn4, v060
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Cs4, v060
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Gs4
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			Bn4
	.byte	W06
	.byte	VOICE	, 14
	.byte	VOL	, v028
	.byte	PAN	, c_v-24
	.byte		N24	, Fs3, v108
	.byte	W24
	.byte			Fs3, v072
	.byte	W24
	.byte			Fs3, v108
	.byte	W24
	.byte			Fs3, v072
	.byte	W24
song030_4_2:
	.byte	VOICE	, 49
	.byte	VOL	, v030
	.byte	PAN	, c_v+31
	.byte		N12	, Cn2, v127
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte	PAN	, c_v-44
	.byte		N12	, Gs1
	.byte	W12
	.byte			Ds1
	.byte	W12
	.byte			As1
	.byte	W12
	.byte			Fs1
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			Gs1
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			As1
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			Gs1
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			Fs1
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte	VOICE	, 48
	.byte	PAN	, c_v+31
	.byte		N12	, En2
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte	PAN	, c_v-44
	.byte		N12	, Fs2
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte	PAN	, c_v+31
	.byte		N12	, En2
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte	PAN	, c_v-39
	.byte		N12	, Gs2
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte	PAN	, c_v+31
	.byte		N12	, An2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte	PAN	, c_v-39
	.byte		N12	, Dn3
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			Fn3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Gs3
	.byte	W12
	.byte			Fn3
	.byte	W12
	.byte			As3
	.byte	W12
	.byte			Gs3
	.byte	W12
	.byte		N06	, Dn3
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte		N36	, Ds4
	.byte	W36
	.byte		N60	, Dn4
	.byte	W60
	.byte		N36	, Gn3
	.byte	W36
	.byte		N60	, Dn3
	.byte	W60
	.byte	VOICE	, 14
	.byte	VOL	, v028
	.byte	PAN	, c_v-24
	.byte		N48	, Gn3, v108
	.byte	W48
	.byte			Gn3, v072
	.byte	W48
	.byte			An3, v108
	.byte	W48
	.byte			An3, v072
	.byte	W48
	.byte	W12
	.byte		N24	, Bn3, v048
	.byte	W24
	.byte			Bn2, v068
	.byte	W24
	.byte			Bn3, v092
	.byte	W24
	.byte			Bn2, v104
	.byte	W12
	.byte	W12
	.byte			Cn4, v116
	.byte	W24
	.byte			Cn3, v108
	.byte	W24
	.byte			Cn4, v084
	.byte	W24
	.byte		N12	, Cn3, v056
	.byte	W12
	.byte		N48	, Fs3, v108
	.byte	W48
	.byte			Fs3, v072
	.byte	W48
	.byte			Cn3, v108
	.byte	W48
	.byte		N24	, Cn3, v072
	.byte	W24
	.byte	VOICE	, 48
	.byte	VOL	, v034
	.byte	PAN	, c_v+26
	.byte		N06	, Fs3, v108
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte	VOICE	, 14
	.byte	VOL	, v028
	.byte	PAN	, c_v-24
	.byte		N48	, Fs3
	.byte	W48
	.byte			Fs3, v072
	.byte	W48
	.byte			Cn3, v108
	.byte	W48
	.byte		N24	, Cn3, v072
	.byte	W24
	.byte	VOICE	, 48
	.byte	VOL	, v034
	.byte	PAN	, c_v+26
	.byte		N06	, An3, v108
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Dn4
	.byte	W06
song030_4_1:
	.byte	VOICE	, 14
	.byte	VOL	, v028
	.byte	PAN	, c_v-24
	.byte		N24	, An3, v108
	.byte	W24
	.byte			An3, v072
	.byte	W24
	.byte			Ds3, v108
	.byte	W24
	.byte			Ds3, v072
	.byte	W24
	.byte	PEND
	.byte			An3, v108
	.byte	W24
	.byte			An3, v072
	.byte	W24
	.byte			Ds3, v108
	.byte	W24
	.byte	VOICE	, 48
	.byte	VOL	, v034
	.byte	PAN	, c_v+26
	.byte		N06	, Fs3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte	PATT	
		.word	song030_4_1
	.byte		N48	, An3, v108
	.byte	W48
	.byte		N24	, An3, v072
	.byte	W24
	.byte	VOICE	, 72
	.byte	VOL	, v028
	.byte	PAN	, c_v+26
	.byte		N12	, En3, v108
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte		N72	, Bn3
	.byte	W24
	.byte	MOD	, 5
	.byte	W48
	.byte		0
	.byte		N12	, Fn3
	.byte	W12
	.byte			Cs4
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			Cn4, v068
	.byte	W12
	.byte			Fn3, v108
	.byte	W12
	.byte			Fn3, v068
	.byte	W12
	.byte			Cn4, v108
	.byte	W12
	.byte			Cn4, v068
	.byte	W12
	.byte			Fn3, v108
	.byte	W12
	.byte			Fn3, v068
	.byte	W12
	.byte	GOTO	
		.word	song030_4_2
	.byte	FINE

	@********************** Track  5 **********************@

	.global song030_5
song030_5:	@ 0x085602C2
	.byte	KEYSH	, 0
	.byte	VOICE	, 47
	.byte	VOL	, v048
	.byte	PAN	, c_v
	.byte		N48	, Bn2, v127
	.byte	W48
	.byte		N12	
	.byte	W12
	.byte			Fs2, v116
	.byte	W12
	.byte			Bn2, v124
	.byte	W12
	.byte			Fs2, v116
	.byte	W12
	.byte		N48	, Bn2, v127
	.byte	W48
	.byte		N12	
	.byte	W12
	.byte			Fs2, v116
	.byte	W12
	.byte			Bn2, v124
	.byte	W12
	.byte			Fs2, v116
	.byte	W12
song030_5_1:
	.byte		N24	, Fs2, v127
	.byte	W24
	.byte			Cs2
	.byte	W24
	.byte		N36	, Fs2
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song030_5_1
	.byte		N24	, Fs2, v127
	.byte	W24
	.byte			Cs2
	.byte	W24
	.byte			Fs2
	.byte	W24
	.byte			Cs2
	.byte	W24
song030_5_2:
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte			Cn3
	.byte	W36
	.byte		N06	, Gn2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song030_5_2
song030_5_3:
	.byte		N24	, Gs2, v127
	.byte	W24
	.byte			Ds2
	.byte	W24
	.byte			Gs2
	.byte	W36
	.byte		N06	, Ds2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song030_5_3
song030_5_4:
	.byte		N24	, An2, v127
	.byte	W24
	.byte			En2
	.byte	W24
	.byte			An2
	.byte	W36
	.byte		N06	, En2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song030_5_4
song030_5_5:
	.byte		N24	, Fs2, v127
	.byte	W24
	.byte			Cs2
	.byte	W24
	.byte			Fs2
	.byte	W36
	.byte		N06	, Cs2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song030_5_5
	.byte		N24	, En2, v127
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	, Ds2
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	, Fs2
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	, Dn2
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	, Gs2
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	
	.byte	W24
	.byte			Ds2
	.byte	W24
	.byte			An2
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	
	.byte	W24
	.byte			En2
	.byte	W24
	.byte			As2
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	
	.byte	W24
	.byte			Fn2
	.byte	W24
	.byte			Bn2
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	
	.byte	W24
	.byte			Fs2
	.byte	W24
	.byte		N48	, Gn2
	.byte	W48
	.byte		N36	
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N48	, An2
	.byte	W48
	.byte		N36	
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	, Bn2
	.byte	W24
	.byte			Fs2
	.byte	W24
	.byte			Bn2
	.byte	W24
	.byte			Fs2
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte		N96	, Fs2
	.byte	W96
	.byte	W72
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte		N96	
	.byte	W96
	.byte	W96
song030_5_6:
	.byte		N24	, An2, v127
	.byte	W24
	.byte			En2
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			En2
	.byte	W24
	.byte	PEND
song030_5_7:
	.byte		N24	, An2, v127
	.byte	W24
	.byte			En2
	.byte	W24
	.byte			An2
	.byte	W24
	.byte		N12	, En2
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song030_5_6
	.byte	PATT	
		.word	song030_5_7
	.byte		N84	, Ds2, v127
	.byte	W84
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	, En2
	.byte	W24
	.byte			Bn2
	.byte	W24
	.byte			En2
	.byte	W24
	.byte			Bn2
	.byte	W24
	.byte	GOTO	
		.word	song030_5_2
	.byte	FINE

	@********************** Track  6 **********************@

	.global song030_6
song030_6:	@ 0x08560417
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v034
	.byte	PAN	, c_v
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song030_6_1:
	.byte		N12	, Cs2, v100
	.byte	W12
	.byte		N06	, Dn1, v076
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PEND
song030_6_2:
	.byte		N06	, Dn1, v076
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte			Fn1, v108
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song030_6_1
	.byte		N06	, Dn1, v076
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PATT	
		.word	song030_6_1
	.byte	PATT	
		.word	song030_6_2
	.byte	PATT	
		.word	song030_6_1
	.byte	PATT	
		.word	song030_6_2
song030_6_3:
	.byte		N12	, Cs2, v100
	.byte	W12
	.byte		N06	, Dn1, v076
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte			An1, v108
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song030_6_2
	.byte	PATT	
		.word	song030_6_3
	.byte	PATT	
		.word	song030_6_2
	.byte	PATT	
		.word	song030_6_3
	.byte	PATT	
		.word	song030_6_2
	.byte	PATT	
		.word	song030_6_3
	.byte	PATT	
		.word	song030_6_2
song030_6_4:
	.byte		N48	, Cs2, v100
	.byte	W48
	.byte			Fn1, v108
	.byte	W48
	.byte	PEND
	.byte	PATT	
		.word	song030_6_4
	.byte		N24	, Cs2, v044
	.byte	W24
	.byte			Cs2, v060
	.byte	W24
	.byte			Cs2, v072
	.byte	W24
	.byte			Cs2, v088
	.byte	W24
	.byte			Cs2, v104
	.byte	W24
	.byte			Cs2, v088
	.byte	W24
	.byte			Cs2, v064
	.byte	W24
	.byte			Cs2, v044
	.byte	W24
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
	.byte	GOTO	
		.word	song030_6_1
	.byte	FINE

	.align 2
	.global song030
song030:	@ 0x08560508
	.byte	6		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup055		@ voicegroup/tone

	.word	song030_1		@ track
	.word	song030_2		@ track
	.word	song030_3		@ track
	.word	song030_4		@ track
	.word	song030_5		@ track
	.word	song030_6		@ track
