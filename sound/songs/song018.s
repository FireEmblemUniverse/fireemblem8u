	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song018_1
song018_1:	@ 0x08555EF8
	.byte	KEYSH	, 0
song018_1_1:
	.byte	TEMPO	, 56
	.byte	VOICE	, 51
	.byte	MOD	, 0
	.byte	VOL	, v046
	.byte	PAN	, c_v
	.byte		TIE	, As3, v108
	.byte	W72
	.byte	W72
	.byte		EOT	
	.byte		N72	, Cs4
	.byte	W72
	.byte			Ds4
	.byte	W72
	.byte		TIE	, Cs4
	.byte	W72
	.byte	W72
	.byte		EOT	
	.byte		N72	, Cn4
	.byte	W72
	.byte			Fn4
	.byte	W72
	.byte		TIE	, As3
	.byte	W72
	.byte	W72
	.byte		EOT	
	.byte		N72	, Cs4
	.byte	W72
	.byte			Ds4
	.byte	W72
	.byte			Fn4
	.byte	W72
	.byte			Fs4
	.byte	W72
	.byte			Gs4
	.byte	W72
	.byte			Fn4
	.byte	W72
	.byte	VOICE	, 99
	.byte		N96	, Gn3
	.byte	W72
	.byte	W72
	.byte			As3
	.byte	W72
	.byte	W72
	.byte		N96	
	.byte	W72
	.byte	W72
	.byte		N72	, An3
	.byte	W72
	.byte			Fn3
	.byte	W72
	.byte		N96	, Gn3
	.byte	W72
	.byte	W72
	.byte		N72	, As3
	.byte	W72
	.byte			An3
	.byte	W72
	.byte		N96	, As3
	.byte	W72
	.byte	W72
	.byte		N48	, An3
	.byte	W48
	.byte		N24	, Gn3
	.byte	W24
	.byte		N72	, Fs3
	.byte	W72
	.byte	VOICE	, 71
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte	W24
	.byte		N24	, As4, v088
	.byte	W24
	.byte			An4, v100
	.byte	W24
	.byte		N60	, Gn4, v108
	.byte	W60
	.byte		N12	, Gn4, v060
	.byte	W12
	.byte	W24
	.byte		N24	, As4, v088
	.byte	W24
	.byte			An4, v096
	.byte	W24
	.byte		N60	, Cn5, v108
	.byte	W60
	.byte		N12	, Cn5, v060
	.byte	W12
	.byte	W24
	.byte		N24	, As4, v088
	.byte	W24
	.byte			An4, v100
	.byte	W24
	.byte		N60	, Gn4, v108
	.byte	W24
	.byte	MOD	, 3
	.byte	W36
	.byte		N06	, Gn4, v060
	.byte	W12
	.byte	MOD	, 0
	.byte		N72	, Fs4, v080
	.byte	W24
	.byte	MOD	, 3
	.byte	W48
	.byte		0
	.byte		N72	, En4, v100
	.byte	W24
	.byte	MOD	, 3
	.byte	W42
	.byte		0
	.byte	W06
	.byte		N72	, Fs4, v108
	.byte	W24
	.byte	MOD	, 3
	.byte	W48
	.byte		0
	.byte		N72	, Gn4, v092
	.byte	W24
	.byte	MOD	, 3
	.byte	W48
	.byte	W06
	.byte		0
	.byte	W18
	.byte		N24	, As4, v084
	.byte	W24
	.byte			An4, v096
	.byte	W24
	.byte		N60	, Gn4, v108
	.byte	W24
	.byte	MOD	, 3
	.byte	W36
	.byte		N12	, Gn4, v060
	.byte	W12
	.byte	W24
	.byte	MOD	, 0
	.byte		N24	, As4, v088
	.byte	W24
	.byte			An4, v100
	.byte	W24
	.byte		N60	, Cn5, v108
	.byte	W24
	.byte	MOD	, 3
	.byte	W36
	.byte		N12	, Cn5, v060
	.byte	W12
	.byte	MOD	, 0
	.byte		N72	, An4, v076
	.byte	W24
	.byte	MOD	, 3
	.byte	W48
	.byte		0
	.byte		N72	, Bn4, v092
	.byte	W24
	.byte	MOD	, 3
	.byte	W48
	.byte		0
	.byte		N72	, As4, v108
	.byte	W24
	.byte	MOD	, 3
	.byte	W48
	.byte		0
	.byte		N72	, Gs4, v092
	.byte	W24
	.byte	MOD	, 3
	.byte	W48
	.byte	GOTO	
		.word	song018_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song018_2
song018_2:	@ 0x08555FFE
	.byte	KEYSH	, 0
song018_2_3:
	.byte	VOICE	, 33
	.byte	VOL	, v059
	.byte	PAN	, c_v
	.byte		N72	, As1, v127
	.byte	W72
	.byte	W24
	.byte		N48	
	.byte	W48
	.byte		N72	, Fs1
	.byte	W72
	.byte	W24
	.byte		N48	
	.byte	W48
	.byte		N72	
	.byte	W72
	.byte	W24
	.byte		N48	
	.byte	W48
	.byte		N72	, Gs1
	.byte	W72
	.byte	W24
	.byte		N48	
	.byte	W48
	.byte		N72	, Fs1
	.byte	W72
	.byte	W24
	.byte		N48	
	.byte	W48
	.byte		N72	, Gs1
	.byte	W72
	.byte	W24
	.byte		N48	
	.byte	W48
	.byte		N72	, Fs1
	.byte	W72
	.byte	W24
	.byte		N48	
	.byte	W48
	.byte		N72	, Gs1
	.byte	W72
	.byte	W24
	.byte		N48	, An1
	.byte	W48
	.byte			Gn2
	.byte	W72
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W60
	.byte		N48	, Fn2
	.byte	W72
song018_2_1:
	.byte		N12	, Fn2, v127
	.byte	W12
	.byte		N12	
	.byte	W60
	.byte	PEND
	.byte		N48	, Ds2
	.byte	W72
song018_2_2:
	.byte		N12	, Ds2, v127
	.byte	W12
	.byte		N12	
	.byte	W60
	.byte	PEND
	.byte		N48	, Fn2
	.byte	W72
	.byte	PATT	
		.word	song018_2_1
	.byte		N48	, Ds2, v127
	.byte	W72
	.byte	PATT	
		.word	song018_2_2
	.byte		N48	, Fn2, v127
	.byte	W72
	.byte	PATT	
		.word	song018_2_1
	.byte		N48	, Ds2, v127
	.byte	W72
	.byte	PATT	
		.word	song018_2_2
	.byte		N48	, Fn2, v127
	.byte	W72
	.byte		N12	, Fs2
	.byte	W12
	.byte		N12	
	.byte	W56
	.byte	W03
	.byte	VOL	, v059
	.byte	W01
	.byte	VOICE	, 52
	.byte	VOL	, v041
	.byte	PAN	, c_v+26
	.byte	W24
	.byte		N54	, As1, v116
	.byte	W48
	.byte	W24
	.byte			Cn2
	.byte	W48
	.byte	W24
	.byte			As1
	.byte	W48
	.byte	W24
	.byte			Cn2
	.byte	W48
	.byte	W24
	.byte			As1
	.byte	W48
	.byte	W24
	.byte			Cn2
	.byte	W48
	.byte	W24
	.byte			An1
	.byte	W48
	.byte	W24
	.byte			As1
	.byte	W48
	.byte	W24
	.byte			An1
	.byte	W48
	.byte	W24
	.byte			As1
	.byte	W48
	.byte	W24
	.byte			Ds2
	.byte	W48
	.byte	W24
	.byte			Cs2
	.byte	W48
	.byte	W24
	.byte			Ds2
	.byte	W48
	.byte	W24
	.byte			Cs2
	.byte	W48
	.byte	W24
	.byte		TIE	, Dn2
	.byte	W48
	.byte	W72
	.byte	W06
	.byte		EOT	
	.byte	W18
	.byte		N54	, Cs2
	.byte	W48
	.byte	W24
	.byte		N48	, Cn2
	.byte	W48
	.byte	GOTO	
		.word	song018_2_3
	.byte	FINE

	@********************** Track  3 **********************@

	.global song018_3
song018_3:	@ 0x085560C8
	.byte	KEYSH	, 0
song018_3_3:
	.byte	VOICE	, 1
	.byte	VOL	, v054
	.byte	PAN	, c_v-35
	.byte	W12
	.byte		N06	, As1, v108
	.byte	W12
	.byte			As1, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			Cs2, v108
	.byte	W12
	.byte			Cs2, v060
	.byte	W12
	.byte			As1, v108
	.byte	W12
	.byte			As1, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			Cs2, v108
	.byte	W12
	.byte			Cs2, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			Cs2, v108
	.byte	W12
	.byte			Cs2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			Cs2, v108
	.byte	W12
	.byte			Cs2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Cs2, v108
	.byte	W12
	.byte			Cs2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
song018_3_1:
	.byte		N06	, Fn2, v060
	.byte	W12
	.byte			Cs2, v108
	.byte	W12
	.byte			Cs2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
	.byte	PEND
	.byte			Fn2, v060
	.byte	W12
	.byte			Fs2, v108
	.byte	W12
	.byte			Fs2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
	.byte			Fn2, v060
	.byte	W12
	.byte			Cs2, v108
	.byte	W12
	.byte			Cs2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			Cs2, v108
	.byte	W12
	.byte			Cs2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
	.byte	PATT	
		.word	song018_3_1
	.byte		N06	, Fn2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
	.byte			Fn2, v060
	.byte	W12
	.byte			Fs2, v108
	.byte	W12
	.byte			Fs2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
	.byte			Fn2, v060
	.byte	W12
	.byte			Fs2, v108
	.byte	W12
	.byte			Fs2, v060
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
	.byte			Fn2, v060
	.byte	W12
	.byte			Fs2, v108
	.byte	W12
	.byte			Fs2, v060
	.byte	W12
	.byte			Gs2, v108
	.byte	W12
	.byte			Gs2, v060
	.byte	W12
	.byte			Fs2, v108
	.byte	W12
	.byte			Fs2, v060
	.byte	W12
	.byte			Gs2, v108
	.byte	W12
	.byte			Gs2, v060
	.byte	W12
	.byte			As2, v108
	.byte	W12
	.byte			As2, v060
	.byte	W12
	.byte			Gs2, v108
	.byte	W12
	.byte			Gs2, v060
	.byte	W12
	.byte			As2, v108
	.byte	W12
	.byte			As2, v060
	.byte	W12
	.byte			Cn3, v108
	.byte	W12
	.byte			Cn3, v060
	.byte	W12
	.byte			An2, v108
	.byte	W12
	.byte			An2, v060
	.byte	W12
	.byte			As2, v108
	.byte	W12
	.byte			As2, v060
	.byte	W12
	.byte			Cn3, v108
	.byte	W12
	.byte			Cn3, v060
	.byte	W12
	.byte			Gn1, v108
	.byte	W12
	.byte			Gn1, v060
	.byte	W12
	.byte			An1, v108
	.byte	W12
	.byte			An1, v060
	.byte	W12
	.byte			As1, v108
	.byte	W12
	.byte			As1, v060
	.byte	W12
	.byte			Gn1, v108
	.byte	W12
	.byte			Gn1, v060
	.byte	W12
	.byte			An1, v108
	.byte	W12
	.byte			An1, v060
	.byte	W12
	.byte			As1, v108
	.byte	W12
	.byte			As1, v060
	.byte	W12
	.byte			An1, v108
	.byte	W12
	.byte			An1, v060
	.byte	W12
	.byte			As1, v108
	.byte	W12
	.byte			As1, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			An1, v108
	.byte	W12
	.byte			An1, v060
	.byte	W12
	.byte			As1, v108
	.byte	W12
	.byte			As1, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			As1, v108
	.byte	W12
	.byte			As1, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			Dn2, v108
	.byte	W12
song018_3_2:
	.byte		N06	, Dn2, v060
	.byte	W12
	.byte			As1, v108
	.byte	W12
	.byte			As1, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			Dn2, v108
	.byte	W12
	.byte	PEND
	.byte			Dn2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			Dn2, v108
	.byte	W12
	.byte			Dn2, v060
	.byte	W12
	.byte			As1, v108
	.byte	W12
	.byte			As1, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			An1, v108
	.byte	W12
	.byte			An1, v060
	.byte	W12
	.byte			As1, v108
	.byte	W12
	.byte			As1, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			Dn2, v108
	.byte	W12
	.byte	PATT	
		.word	song018_3_2
	.byte		N06	, Dn2, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			Dn2, v108
	.byte	W12
	.byte			Dn2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Cn2, v108
	.byte	W12
	.byte			Cn2, v060
	.byte	W12
	.byte			Dn2, v108
	.byte	W12
	.byte			Dn2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Dn2, v108
	.byte	W12
	.byte			Dn2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
	.byte			Fn2, v060
	.byte	W12
	.byte			Ds2, v108
	.byte	W12
	.byte			Ds2, v060
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
	.byte			Fn2, v060
	.byte	W12
	.byte			Gn2, v108
	.byte	W12
	.byte			Gn2, v060
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
	.byte			Fn2, v060
	.byte	W12
	.byte			Gn2, v108
	.byte	W12
	.byte			Gn2, v060
	.byte	W12
	.byte			An2, v108
	.byte	W12
	.byte			An2, v060
	.byte	W12
	.byte			Fs2, v108
	.byte	W12
	.byte			Fs2, v060
	.byte	W12
	.byte			Gn2, v108
	.byte	W12
	.byte			Gn2, v060
	.byte	W12
	.byte			An2, v108
	.byte	W12
	.byte	VOICE	, 19
	.byte	VOL	, v044
	.byte	PAN	, c_v
	.byte		TIE	, Dn3
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W48
	.byte		EOT	
	.byte		N24	, Fn3
	.byte	W24
	.byte		TIE	, Dn3
	.byte	W72
	.byte	W72
	.byte		EOT	
	.byte		N72	, Cs3
	.byte	W72
	.byte			Cn3
	.byte	W72
	.byte			An2
	.byte	W72
	.byte			As2
	.byte	W72
	.byte		TIE	, Gn2
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte		EOT	
	.byte	W72
	.byte		N72	, Bn2
	.byte	W72
	.byte		TIE	, Fn3, v096
	.byte	W72
	.byte	W72
	.byte		EOT	
	.byte	GOTO	
		.word	song018_3_3
	.byte	FINE

	@********************** Track  4 **********************@

	.global song018_4
song018_4:	@ 0x08556330
	.byte	KEYSH	, 0
song018_4_1:
	.byte	VOICE	, 19
	.byte	VOL	, v048
	.byte	PAN	, c_v-20
	.byte		TIE	, Fn2, v108
	.byte	W72
	.byte	W48
	.byte		EOT	
	.byte		N12	, Fs2
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte		N72	, As2
	.byte	W72
	.byte			Cn3
	.byte	W72
	.byte		N90	, As2
	.byte	W72
	.byte	W24
	.byte		N24	, Gs2
	.byte	W24
	.byte			Fs2
	.byte	W24
	.byte		N48	, Gs2
	.byte	W48
	.byte		N24	, As2
	.byte	W24
	.byte		N60	, Cn3
	.byte	W72
	.byte		N96	, Fs2
	.byte	W72
	.byte	W24
	.byte		N24	, Gs2
	.byte	W24
	.byte		N18	, As2
	.byte	W24
	.byte		N72	
	.byte	W72
	.byte			Cn3
	.byte	W72
	.byte			Cs3
	.byte	W72
	.byte		N48	, Ds3
	.byte	W48
	.byte		N12	, Fn3
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte		N72	, Cs3
	.byte	W72
	.byte		N66	, Cn3
	.byte	W72
	.byte		TIE	, Dn3, v080
	.byte	W72
	.byte	W72
	.byte		EOT	
	.byte		TIE	, Cn3
	.byte	W72
	.byte	W68
	.byte	W01
	.byte		EOT	
	.byte	W03
	.byte		TIE	, Dn3
	.byte	W72
	.byte	W72
	.byte		EOT	
	.byte		TIE	, Cn3
	.byte	W72
	.byte	W66
	.byte		EOT	
	.byte	W06
	.byte		TIE	, Ds3
	.byte	W72
	.byte	W48
	.byte		EOT	
	.byte		N24	, Dn3
	.byte	W24
	.byte		N90	, Cn3
	.byte	W72
	.byte	W24
	.byte		N24	
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte		TIE	, Ds3
	.byte	W72
	.byte	W72
	.byte		EOT	
	.byte		N48	, Fn3
	.byte	W48
	.byte		N24	, Ds3
	.byte	W24
	.byte		N66	, Dn3
	.byte	W72
	.byte		N72	, Gn2, v084
	.byte	W72
	.byte			Gs2, v096
	.byte	W72
	.byte			Gn2, v108
	.byte	W72
	.byte			Gs2, v096
	.byte	W72
	.byte			Gn2, v080
	.byte	W72
	.byte			Gs2, v096
	.byte	W72
	.byte			An2, v108
	.byte	W72
	.byte			As2, v096
	.byte	W72
	.byte			Bn2
	.byte	W72
	.byte			Cn3, v108
	.byte	W72
	.byte			Cn3, v088
	.byte	W72
	.byte			Cs3, v096
	.byte	W72
	.byte			Cn3, v108
	.byte	W72
	.byte			Cs3, v100
	.byte	W72
	.byte		TIE	, Dn3, v084
	.byte	W72
	.byte	W72
	.byte		EOT	
	.byte		N72	, Cs3, v096
	.byte	W72
	.byte			Cn3, v088
	.byte	W72
	.byte	GOTO	
		.word	song018_4_1
	.byte	FINE

	@********************** Track  5 **********************@

	.global song018_5
song018_5:	@ 0x085563EB
	.byte	KEYSH	, 0
song018_5_9:
	.byte	VOICE	, 50
	.byte	VOL	, v044
	.byte	PAN	, c_v+35
	.byte		N12	, As1, v108
	.byte	W15
	.byte		N06	, As1, v036
	.byte	W09
	.byte		N12	, Cn2, v108
	.byte	W15
	.byte		N06	, Cn2, v036
	.byte	W09
	.byte		N12	, Cs2, v108
	.byte	W15
	.byte		N06	, Cs2, v036
	.byte	W09
	.byte		N12	, As1, v108
	.byte	W15
	.byte		N06	, As1, v036
	.byte	W09
	.byte		N12	, Cn2, v108
	.byte	W15
	.byte		N06	, Cn2, v036
	.byte	W09
	.byte		N12	, Cs2, v108
	.byte	W15
	.byte		N06	, Cs2, v036
	.byte	W09
song018_5_1:
	.byte		N12	, Cn2, v108
	.byte	W15
	.byte		N06	, Cn2, v036
	.byte	W09
	.byte		N12	, Cs2, v108
	.byte	W15
	.byte		N06	, Cs2, v036
	.byte	W09
	.byte		N12	, Ds2, v108
	.byte	W15
	.byte		N06	, Ds2, v036
	.byte	W09
	.byte	PEND
	.byte	PATT	
		.word	song018_5_1
song018_5_2:
	.byte		N12	, Cs2, v108
	.byte	W15
	.byte		N06	, Cs2, v036
	.byte	W09
	.byte		N12	, Ds2, v108
	.byte	W15
	.byte		N06	, Ds2, v036
	.byte	W09
	.byte		N12	, Fn2, v108
	.byte	W15
	.byte		N06	, Fn2, v036
	.byte	W09
	.byte	PEND
	.byte	PATT	
		.word	song018_5_2
	.byte		N12	, Fs2, v108
	.byte	W15
	.byte		N06	, Fs2, v036
	.byte	W09
	.byte		N12	, Ds2, v108
	.byte	W15
	.byte		N06	, Ds2, v036
	.byte	W09
	.byte		N12	, Fn2, v108
	.byte	W15
	.byte		N06	, Fn2, v036
	.byte	W09
	.byte		N12	, Cs2, v108
	.byte	W15
	.byte		N06	, Cs2, v036
	.byte	W09
	.byte		N12	, Ds2, v108
	.byte	W15
	.byte		N06	, Ds2, v036
	.byte	W09
	.byte		N12	, Cn2, v108
	.byte	W15
	.byte		N06	, Cn2, v036
	.byte	W09
	.byte	PATT	
		.word	song018_5_2
	.byte	PATT	
		.word	song018_5_2
song018_5_3:
	.byte		N12	, Ds2, v108
	.byte	W15
	.byte		N06	, Ds2, v036
	.byte	W09
	.byte		N12	, Fn2, v108
	.byte	W15
	.byte		N06	, Fn2, v036
	.byte	W09
	.byte		N12	, Fs2, v108
	.byte	W15
	.byte		N06	, Fs2, v036
	.byte	W09
	.byte	PEND
	.byte	PATT	
		.word	song018_5_3
	.byte		N12	, Fn2, v108
	.byte	W15
	.byte		N06	, Fn2, v036
	.byte	W09
	.byte		N12	, Fs2, v108
	.byte	W15
	.byte		N06	, Fs2, v036
	.byte	W09
	.byte		N12	, Gs2, v108
	.byte	W15
	.byte		N06	, Gs2, v036
	.byte	W09
	.byte		N12	, Fs2, v108
	.byte	W15
	.byte		N06	, Fs2, v036
	.byte	W09
	.byte		N12	, Gs2, v108
	.byte	W15
	.byte		N06	, Gs2, v036
	.byte	W09
	.byte		N12	, As2, v108
	.byte	W15
	.byte		N06	, As2, v036
	.byte	W09
	.byte		N12	, Gs2, v108
	.byte	W15
	.byte		N06	, Gs2, v036
	.byte	W09
	.byte		N12	, As2, v108
	.byte	W15
	.byte		N06	, As2, v036
	.byte	W09
	.byte		N12	, Cn3, v108
	.byte	W15
	.byte		N06	, Cn3, v036
	.byte	W09
	.byte		N12	, An2, v108
	.byte	W15
	.byte		N06	, An2, v036
	.byte	W09
	.byte		N12	, As2, v108
	.byte	W15
	.byte		N06	, As2, v036
	.byte	W09
	.byte		N12	, Cn3, v108
	.byte	W15
	.byte		N06	, Cn3, v036
	.byte	W09
	.byte	VOL	, v059
	.byte		N12	, Gn1, v108
	.byte	W15
	.byte		N06	, Gn1, v036
	.byte	W09
	.byte		N12	, An1, v108
	.byte	W15
	.byte		N06	, An1, v036
	.byte	W09
	.byte		N12	, As1, v108
	.byte	W15
	.byte		N06	, As1, v036
	.byte	W09
	.byte		N12	, Gn1, v108
	.byte	W15
	.byte		N06	, Gn1, v036
	.byte	W09
	.byte		N12	, An1, v108
	.byte	W15
	.byte		N06	, An1, v036
	.byte	W09
	.byte		N12	, As1, v108
	.byte	W15
	.byte		N06	, As1, v036
	.byte	W09
song018_5_4:
	.byte		N12	, An1, v108
	.byte	W15
	.byte		N06	, An1, v036
	.byte	W09
	.byte		N12	, As1, v108
	.byte	W15
	.byte		N06	, As1, v036
	.byte	W09
	.byte		N12	, Cn2, v108
	.byte	W15
	.byte		N06	, Cn2, v036
	.byte	W09
	.byte	PEND
	.byte	PATT	
		.word	song018_5_4
song018_5_5:
	.byte		N12	, As1, v108
	.byte	W15
	.byte		N06	, As1, v036
	.byte	W09
	.byte		N12	, Cn2, v108
	.byte	W15
	.byte		N06	, Cn2, v036
	.byte	W09
	.byte		N12	, Dn2, v108
	.byte	W15
	.byte		N06	, Dn2, v036
	.byte	W09
	.byte	PEND
	.byte	PATT	
		.word	song018_5_5
	.byte		N12	, Ds2, v108
	.byte	W15
	.byte		N06	, Ds2, v036
	.byte	W09
	.byte		N12	, Cn2, v108
	.byte	W15
	.byte		N06	, Cn2, v036
	.byte	W09
	.byte		N12	, Dn2, v108
	.byte	W15
	.byte		N06	, Dn2, v036
	.byte	W09
	.byte		N12	, As1, v108
	.byte	W15
	.byte		N06	, As1, v036
	.byte	W09
	.byte		N12	, Cn2, v108
	.byte	W15
	.byte		N06	, Cn2, v036
	.byte	W09
	.byte		N12	, An1, v108
	.byte	W15
	.byte		N06	, An1, v036
	.byte	W09
	.byte	PATT	
		.word	song018_5_5
	.byte	PATT	
		.word	song018_5_5
song018_5_6:
	.byte		N12	, Cn2, v108
	.byte	W15
	.byte		N06	, Cn2, v036
	.byte	W09
	.byte		N12	, Dn2, v108
	.byte	W15
	.byte		N06	, Dn2, v036
	.byte	W09
	.byte		N12	, Ds2, v108
	.byte	W15
	.byte		N06	, Ds2, v036
	.byte	W09
	.byte	PEND
	.byte	PATT	
		.word	song018_5_6
	.byte		N12	, Dn2, v108
	.byte	W15
	.byte		N06	, Dn2, v036
	.byte	W09
	.byte		N12	, Ds2, v108
	.byte	W15
	.byte		N06	, Ds2, v036
	.byte	W09
	.byte		N12	, Fn2, v108
	.byte	W15
	.byte		N06	, Fn2, v036
	.byte	W09
	.byte		N12	, Ds2, v108
	.byte	W15
	.byte		N06	, Ds2, v036
	.byte	W09
	.byte		N12	, Fn2, v108
	.byte	W15
	.byte		N06	, Fn2, v036
	.byte	W09
	.byte		N12	, Gn2, v108
	.byte	W15
	.byte		N06	, Gn2, v036
	.byte	W09
	.byte		N12	, Fn2, v108
	.byte	W15
	.byte		N06	, Fn2, v036
	.byte	W09
	.byte		N12	, Gn2, v108
	.byte	W15
	.byte		N06	, Gn2, v036
	.byte	W09
	.byte		N12	, An2, v108
	.byte	W15
	.byte		N06	, An2, v036
	.byte	W09
	.byte		N12	, Fs2, v108
	.byte	W15
	.byte		N06	, Fs2, v036
	.byte	W09
	.byte		N12	, Gn2, v108
	.byte	W15
	.byte		N06	, Gn2, v036
	.byte	W09
	.byte		N12	, An2, v108
	.byte	W15
	.byte		N06	, An2, v036
	.byte	W09
	.byte	W24
	.byte	VOL	, v039
	.byte		N24	, Gn2, v104
	.byte	W02
	.byte	VOL	, v039
	.byte	W01
	.byte		v039
	.byte	W01
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
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v047
	.byte	W01
	.byte		v048
	.byte		N24	, Fn2
	.byte	W01
	.byte	VOL	, v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W02
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v053
	.byte	W02
	.byte		v054
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v056
	.byte	W02
	.byte		v057
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v058
	.byte		N72	, Ds2
	.byte	W01
	.byte	VOL	, v059
	.byte	W24
	.byte	W03
	.byte		v059
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v055
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
	.byte		v039
	.byte	W01
	.byte		v039
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
	.byte		v030
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v000
	.byte	W01
song018_5_7:
	.byte	W12
	.byte	VOL	, v039
	.byte	W12
	.byte		v039
	.byte		N24	, Gn2, v104
	.byte	W02
	.byte	VOL	, v039
	.byte	W01
	.byte		v039
	.byte	W01
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
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v047
	.byte	W01
	.byte		v048
	.byte		N24	, Fn2
	.byte	W01
	.byte	VOL	, v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W02
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v053
	.byte	W02
	.byte		v054
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v056
	.byte	W02
	.byte		v057
	.byte	W01
	.byte		v057
	.byte	W01
	.byte	PEND
	.byte		v058
	.byte		N72	, Gn2
	.byte	W01
	.byte	VOL	, v059
	.byte	W24
	.byte	W03
	.byte		v059
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v055
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
	.byte		v039
	.byte	W01
	.byte		v039
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
	.byte		v030
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v000
	.byte	W01
	.byte	PATT	
		.word	song018_5_7
song018_5_8:
	.byte	VOL	, v058
	.byte		N72	, Ds2, v104
	.byte	W01
	.byte	VOL	, v059
	.byte	W24
	.byte	W03
	.byte		v059
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v055
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
	.byte		v039
	.byte	W01
	.byte		v039
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
	.byte		v029
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v000
	.byte	W01
	.byte	PEND
	.byte		v031
	.byte		N72	, Cs2
	.byte	W02
	.byte	VOL	, v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
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
	.byte		v039
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
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W02
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W02
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W02
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v053
	.byte	W02
	.byte		v054
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v056
	.byte	W02
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		N72	, Cn2
	.byte	W02
	.byte	VOL	, v058
	.byte	W01
	.byte		v058
	.byte	W02
	.byte		v057
	.byte	W01
	.byte		v057
	.byte	W02
	.byte		v056
	.byte	W01
	.byte		v056
	.byte	W02
	.byte		v055
	.byte	W01
	.byte		v055
	.byte	W02
	.byte		v054
	.byte	W01
	.byte		v054
	.byte	W02
	.byte		v053
	.byte	W01
	.byte		v053
	.byte	W02
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W02
	.byte		v052
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W02
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W02
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W02
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W02
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v043
	.byte	W02
	.byte		v043
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W02
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v036
	.byte		N72	, Ds2
	.byte	W02
	.byte	VOL	, v036
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
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v041
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
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
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
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W02
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W02
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W02
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W02
	.byte		v053
	.byte	W01
	.byte		v053
	.byte	W02
	.byte		v054
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W02
	.byte		v055
	.byte	W01
	.byte		v056
	.byte	W02
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W02
	.byte		v057
	.byte	W01
	.byte		v058
	.byte	W02
	.byte		v058
	.byte	W01
	.byte		v059
	.byte		N72	, En2
	.byte	W03
	.byte	VOL	, v058
	.byte	W01
	.byte		v058
	.byte	W02
	.byte		v057
	.byte	W02
	.byte		v057
	.byte	W01
	.byte		v056
	.byte	W02
	.byte		v056
	.byte	W02
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
	.byte	W01
	.byte		v052
	.byte	W02
	.byte		v052
	.byte	W02
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W02
	.byte		v050
	.byte	W02
	.byte		v050
	.byte	W01
	.byte		v049
	.byte	W02
	.byte		v049
	.byte	W01
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
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v044
	.byte	W02
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v042
	.byte	W01
	.byte		v041
	.byte	W02
	.byte		v041
	.byte	W02
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W02
	.byte		v039
	.byte	W24
	.byte		v039
	.byte		N24	, Gn2
	.byte	W02
	.byte	VOL	, v039
	.byte	W01
	.byte		v039
	.byte	W01
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
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v047
	.byte	W01
	.byte		v048
	.byte		N24	, Fn2
	.byte	W01
	.byte	VOL	, v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W02
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v053
	.byte	W02
	.byte		v054
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v056
	.byte	W02
	.byte		v057
	.byte	W01
	.byte		v057
	.byte	W01
	.byte	PATT	
		.word	song018_5_8
	.byte	VOL	, v000
	.byte	W12
	.byte		v039
	.byte	W12
	.byte		v039
	.byte		N24	, Gn2, v104
	.byte	W02
	.byte	VOL	, v039
	.byte	W01
	.byte		v039
	.byte	W01
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
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v047
	.byte	W01
	.byte		v048
	.byte		N24	, Fn2
	.byte	W01
	.byte	VOL	, v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W02
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v053
	.byte	W02
	.byte		v054
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v056
	.byte	W02
	.byte		v057
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v058
	.byte		N66	, Gs2
	.byte	W01
	.byte	VOL	, v059
	.byte	W24
	.byte	W03
	.byte		v059
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v055
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
	.byte		v039
	.byte	W01
	.byte		v039
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
	.byte		v029
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v033
	.byte		TIE	, Gn2
	.byte	W02
	.byte	VOL	, v033
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v034
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
	.byte	W01
	.byte		v039
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
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W02
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W02
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W02
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W02
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W02
	.byte		v053
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v054
	.byte	W02
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v055
	.byte	W02
	.byte		v056
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v057
	.byte	W02
	.byte		v058
	.byte	W01
	.byte		v059
	.byte	W01
	.byte	W03
	.byte		v058
	.byte	W02
	.byte		v058
	.byte	W02
	.byte		v057
	.byte	W02
	.byte		v057
	.byte	W02
	.byte		v056
	.byte	W02
	.byte		v056
	.byte	W02
	.byte		v055
	.byte	W02
	.byte		v055
	.byte	W02
	.byte		v054
	.byte	W02
	.byte		v054
	.byte	W02
	.byte		v053
	.byte	W02
	.byte		v053
	.byte	W02
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W02
	.byte		v052
	.byte	W02
	.byte		v051
	.byte	W02
	.byte		v051
	.byte	W02
	.byte		v050
	.byte	W02
	.byte		v050
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v048
	.byte	W02
	.byte		v048
	.byte	W02
	.byte		v047
	.byte	W02
	.byte		v047
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v044
	.byte	W02
	.byte		v044
	.byte	W02
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v042
	.byte	W01
	.byte		EOT	
	.byte	VOL	, v041
	.byte		TIE	, Fn2
	.byte	W03
	.byte	VOL	, v042
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v043
	.byte	W02
	.byte		v043
	.byte	W02
	.byte		v044
	.byte	W02
	.byte		v044
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v048
	.byte	W02
	.byte		v048
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v050
	.byte	W02
	.byte		v050
	.byte	W02
	.byte		v051
	.byte	W02
	.byte		v051
	.byte	W02
	.byte		v052
	.byte	W02
	.byte		v052
	.byte	W02
	.byte		v052
	.byte	W02
	.byte		v053
	.byte	W01
	.byte		v053
	.byte	W02
	.byte		v054
	.byte	W02
	.byte		v054
	.byte	W02
	.byte		v055
	.byte	W02
	.byte		v055
	.byte	W02
	.byte		v056
	.byte	W02
	.byte		v056
	.byte	W02
	.byte		v057
	.byte	W02
	.byte		v057
	.byte	W02
	.byte		v058
	.byte	W02
	.byte		v059
	.byte	W01
	.byte	W01
	.byte		v058
	.byte	W02
	.byte		v058
	.byte	W02
	.byte		v057
	.byte	W02
	.byte		v057
	.byte	W02
	.byte		v056
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v055
	.byte	W02
	.byte		v055
	.byte	W02
	.byte		v054
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v053
	.byte	W02
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v051
	.byte	W02
	.byte		v051
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	W02
	.byte		v048
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
	.byte		v036
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
	.byte		v024
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v014
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
	.byte		v000
	.byte	W01
	.byte		EOT	
	.byte	GOTO	
		.word	song018_5_9
	.byte	FINE

	@********************** Track  6 **********************@

	.global song018_6
song018_6:	@ 0x08556C65
	.byte	KEYSH	, 0
song018_6_8:
	.byte	VOICE	, 127
	.byte	VOL	, v037
	.byte	PAN	, c_v
	.byte		N06	, Fs1, v076
	.byte	W12
	.byte			Fs1, v068
	.byte	W60
	.byte	W24
	.byte		N24	, As1
	.byte	W24
	.byte		N06	, Fs1, v064
	.byte	W24
song018_6_3:
	.byte		N06	, Fs1, v060
	.byte	W12
	.byte			Fs1, v056
	.byte	W60
	.byte	PEND
	.byte			Fs1, v048
	.byte	W12
	.byte			Fs1, v056
	.byte	W12
	.byte		N24	, As1, v068
	.byte	W24
	.byte		N06	, Fs1, v060
	.byte	W24
song018_6_1:
	.byte		N06	, Fs1, v056
	.byte	W12
	.byte			Fs1, v060
	.byte	W60
	.byte	PEND
	.byte	W24
	.byte		N24	, As1, v068
	.byte	W24
	.byte		N06	, Fs1, v048
	.byte	W24
	.byte	PATT	
		.word	song018_6_1
	.byte		N06	, Fs1, v068
	.byte	W06
	.byte			Fs1, v056
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	, As1, v068
	.byte	W24
	.byte		N06	, Fs1
	.byte	W24
song018_6_2:
	.byte		N06	, Fs1, v056
	.byte	W12
	.byte		N06	
	.byte	W60
	.byte	PEND
	.byte	W24
	.byte		N24	, As1, v068
	.byte	W24
	.byte		N06	, Fs1, v056
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Fs1, v052
	.byte	W60
song018_6_5:
	.byte		N06	, Fs1, v056
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N24	, As1, v068
	.byte	W24
	.byte		N06	, Fs1, v056
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song018_6_2
	.byte	W24
	.byte		N24	, As1, v068
	.byte	W24
	.byte		N06	, Fs1, v060
	.byte	W24
	.byte	PATT	
		.word	song018_6_2
	.byte		N06	, Fs1, v072
	.byte	W06
	.byte			Fs1, v068
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Fs1, v064
	.byte	W06
	.byte		N24	, As1, v068
	.byte	W24
	.byte		N06	, Fs1, v056
	.byte	W24
	.byte			Fs1, v064
	.byte	W12
	.byte			Fs1, v068
	.byte	W24
	.byte			Fs1, v072
	.byte	W36
	.byte			Fs1, v064
	.byte	W12
	.byte			Fs1, v056
	.byte	W12
	.byte		N24	, As1, v068
	.byte	W24
	.byte		N06	, Fs1, v056
	.byte	W24
song018_6_4:
	.byte		N06	, Fs1, v056
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W36
	.byte	PEND
	.byte		N06	
	.byte	W12
	.byte			Fs1, v060
	.byte	W12
	.byte		N24	, As1, v068
	.byte	W24
	.byte		N06	, Fs1, v056
	.byte	W24
	.byte	PATT	
		.word	song018_6_3
	.byte	W12
	.byte		N06	, Fs1, v064
	.byte	W12
	.byte		N24	, As1, v068
	.byte	W24
	.byte		N06	, Fs1, v060
	.byte	W24
	.byte			Fs1, v048
	.byte	W12
	.byte			Fs1, v060
	.byte	W24
	.byte			Fs1, v056
	.byte	W36
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Fs1, v052
	.byte	W06
	.byte			Fs1, v056
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N24	, As1, v068
	.byte	W24
	.byte		N06	, Fs1, v056
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Fs1, v060
	.byte	W36
	.byte			Fs1, v056
	.byte	W06
	.byte			Fs1, v052
	.byte	W06
	.byte			Fs1, v056
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	, As1, v068
	.byte	W24
	.byte		N06	, Fs1, v056
	.byte	W24
	.byte	PATT	
		.word	song018_6_4
	.byte	PATT	
		.word	song018_6_5
	.byte		N06	, Fs1, v060
	.byte	W12
	.byte			Fs1, v056
	.byte	W24
	.byte		N06	
	.byte	W36
	.byte	W12
	.byte			Fs1, v064
	.byte	W12
	.byte		N24	, As1, v068
	.byte	W24
	.byte		N06	, Fs1, v048
	.byte	W12
	.byte			Fs1, v056
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Fs1, v064
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Fs1, v056
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Fs1, v052
	.byte	W06
	.byte			Fs1, v056
	.byte	W06
	.byte			Fs1, v060
	.byte	W12
	.byte			Fs1, v068
	.byte	W12
	.byte		N24	, As1
	.byte	W24
	.byte	W72
song018_6_6:
	.byte	W24
	.byte		N06	, Fs2, v080
	.byte	W06
	.byte			Fs2, v020
	.byte	W42
	.byte	PEND
	.byte	W72
song018_6_7:
	.byte	W24
	.byte		N06	, Fs2, v080
	.byte	W06
	.byte			Fs2, v020
	.byte	W18
	.byte			Fs2, v080
	.byte	W06
	.byte			Fs2, v020
	.byte	W18
	.byte	PEND
	.byte	W72
	.byte	PATT	
		.word	song018_6_6
	.byte	W72
	.byte	PATT	
		.word	song018_6_6
	.byte	W72
	.byte	PATT	
		.word	song018_6_6
	.byte	W72
	.byte	PATT	
		.word	song018_6_7
	.byte	W72
	.byte	PATT	
		.word	song018_6_6
	.byte	W72
	.byte	PATT	
		.word	song018_6_6
	.byte	W72
	.byte	PATT	
		.word	song018_6_7
	.byte	GOTO	
		.word	song018_6_8
	.byte	FINE

	.align 2
	.global song018
song018:	@ 0x08556E04
	.byte	6		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup047		@ voicegroup/tone

	.word	song018_1		@ track
	.word	song018_2		@ track
	.word	song018_3		@ track
	.word	song018_4		@ track
	.word	song018_5		@ track
	.word	song018_6		@ track
