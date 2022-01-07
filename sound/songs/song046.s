	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song046_1
song046_1:	@ 0x085696C8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 46
	.byte	W24
	.byte	VOICE	, 48
	.byte	VOL	, v040
	.byte	PAN	, c_v-24
	.byte	W12
	.byte		N05	, En3, v072
	.byte	W12
	.byte		N11	, En3, v068
	.byte	W12
	.byte		N05	, Gn3, v072
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N05	, Fs3, v076
	.byte	W12
song046_1_1:
	.byte		N11	, Fs3, v076
	.byte	W12
	.byte		N05	, Fn3, v108
	.byte	W12
	.byte		N11	, Fn3, v112
	.byte	W12
	.byte		N05	, En3, v072
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N05	, Dn3, v076
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			En3, v080
	.byte	W12
	.byte		N11	, En3, v076
	.byte	W12
	.byte		N05	, Gn3, v080
	.byte	W12
	.byte		N11	, Gn3, v076
	.byte	W12
	.byte		N05	, Fs3, v084
	.byte	W12
	.byte		N11	, Fs3, v076
	.byte	W12
	.byte		N05	, Fn3, v084
	.byte	W12
	.byte		N11	, Fn3, v108
	.byte	W12
	.byte		N05	, En3, v064
	.byte	W12
	.byte		N11	, En3, v076
	.byte	W12
	.byte		N05	, Fn3
	.byte	W12
	.byte	W12
	.byte			Gn3, v072
	.byte	W12
	.byte		N11	, Gn3, v068
	.byte	W12
	.byte		N05	, As3, v072
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N05	, An3, v076
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N05	, Gs3, v108
	.byte	W12
	.byte		N11	, Gs3, v112
	.byte	W12
	.byte		N05	, Gn3, v072
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N05	, Fn3, v076
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gn3, v080
	.byte	W12
	.byte		N11	, Gn3, v076
	.byte	W12
	.byte		N05	, As3, v080
	.byte	W12
	.byte		N11	, As3, v076
	.byte	W12
	.byte		N05	, An3, v084
	.byte	W12
	.byte		N11	, An3, v076
	.byte	W12
	.byte		N05	, Gs3, v084
	.byte	W12
	.byte		N11	, Gs3, v108
	.byte	W12
	.byte		N05	, Gn3, v064
	.byte	W12
	.byte			Bn3, v076
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			En4
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W48
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	VOICE	, 56
	.byte	VOL	, v052
	.byte	PAN	, c_v+18
	.byte		N06	, Cs3, v096
	.byte	W06
	.byte			Cs3, v032
	.byte	W06
	.byte			Cs3, v096
	.byte	W06
	.byte			Cs3, v032
	.byte	W54
	.byte			Gn2, v096
	.byte	W06
	.byte			Gn2, v032
	.byte	W06
	.byte			Gn2, v096
	.byte	W06
	.byte			Gn2, v032
	.byte	W54
	.byte	VOICE	, 48
	.byte	VOL	, v040
	.byte	PAN	, c_v-24
	.byte	W24
	.byte		N24	, Fs3, v096
	.byte	W24
	.byte			En3
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte			As2
	.byte	W24
	.byte	VOL	, v040
	.byte	W12
	.byte		N05	, En3, v072
	.byte	W12
	.byte		N11	, En3, v068
	.byte	W12
	.byte		N05	, Gn3, v072
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N05	, Fs3, v076
	.byte	W12
	.byte	GOTO	
		.word	song046_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song046_2
song046_2:	@ 0x085697DC
	.byte	KEYSH	, 0
	.byte	W24
	.byte	VOICE	, 33
	.byte	VOL	, v052
	.byte	PAN	, c_v
	.byte		N09	, An1, v127
	.byte	W48
	.byte		N09	
	.byte	W24
song046_2_3:
	.byte		N09	, An1, v127
	.byte	W24
	.byte		N09	
	.byte	W48
	.byte	PEND
song046_2_2:
	.byte		N09	, An1, v127
	.byte	W48
	.byte		N09	
	.byte	W24
	.byte	PEND
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte			As1
	.byte	W12
	.byte			Bn1
	.byte	W12
song046_2_1:
	.byte		N09	, Cn2, v127
	.byte	W48
	.byte		N09	
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song046_2_1
	.byte	PATT	
		.word	song046_2_1
	.byte		N09	, Cn2, v127
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte			En2
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			En2
	.byte	W12
	.byte	PATT	
		.word	song046_2_2
	.byte	PATT	
		.word	song046_2_3
	.byte	PATT	
		.word	song046_2_2
	.byte		N09	, An1, v127
	.byte	W24
	.byte			Bn1
	.byte	W24
	.byte			As1
	.byte	W24
	.byte	PATT	
		.word	song046_2_2
	.byte	PATT	
		.word	song046_2_3
	.byte	PATT	
		.word	song046_2_2
	.byte		N09	, An1, v127
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte			En2
	.byte	W24
song046_2_4:
	.byte		N09	, As1, v127
	.byte	W48
	.byte		N09	
	.byte	W24
	.byte	PEND
	.byte		N09	
	.byte	W24
	.byte		N09	
	.byte	W48
	.byte	PATT	
		.word	song046_2_4
	.byte		N09	, As1, v127
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte		N06	, As2
	.byte	W12
	.byte		N06	
	.byte	W60
	.byte			As1
	.byte	W12
	.byte		N06	
	.byte	W60
	.byte	W72
	.byte	W72
	.byte	PATT	
		.word	song046_2_2
	.byte	GOTO	
		.word	song046_2_3
	.byte	FINE

	@********************** Track  3 **********************@

	.global song046_3
song046_3:	@ 0x0856988A
	.byte	KEYSH	, 0
	.byte	W24
song046_3_2:
	.byte	VOICE	, 58
	.byte	VOL	, v040
	.byte	PAN	, c_v+30
	.byte		N05	, En2, v108
	.byte		N05	, An2, v104
	.byte	W06
	.byte			An2, v024
	.byte	W06
	.byte			En2, v100
	.byte		N05	, An2
	.byte	W06
	.byte			An2, v024
	.byte	W18
	.byte			En2, v112
	.byte		N05	, An2, v108
	.byte	W06
	.byte			An2, v024
	.byte	W06
	.byte		N22	, Fn2, v104
	.byte		N22	, As2, v084
	.byte	W24
	.byte	PEND
song046_3_3:
	.byte		N05	, En2, v112
	.byte		N05	, An2, v104
	.byte	W06
	.byte			An2, v024
	.byte	W06
	.byte			En2, v104
	.byte		N05	, An2, v092
	.byte	W06
	.byte			An2, v024
	.byte	W06
	.byte			En2, v108
	.byte		N05	, An2, v096
	.byte	W06
	.byte			An2, v024
	.byte	W06
	.byte			En2, v088
	.byte		N05	, An2, v064
	.byte	W06
	.byte			An2, v024
	.byte	W06
	.byte			Fn2, v104
	.byte		N05	, An2, v096
	.byte	W06
	.byte			An2, v024
	.byte	W18
	.byte			En2, v112
	.byte		N05	, An2, v108
	.byte	W06
	.byte			An2, v024
	.byte	W06
	.byte			En2, v100
	.byte		N05	, An2, v092
	.byte	W06
	.byte			An2, v024
	.byte	W18
	.byte			En2, v112
	.byte		N05	, An2, v108
	.byte	W06
	.byte			An2, v024
	.byte	W06
	.byte		N22	, Fn2, v120
	.byte		N22	, As2, v108
	.byte	W24
	.byte		N05	, En2, v120
	.byte		N05	, An2, v112
	.byte	W06
	.byte			An2, v024
	.byte	W06
	.byte			En2, v092
	.byte		N05	, An2, v088
	.byte	W06
	.byte			An2, v024
	.byte	W06
	.byte			En2, v092
	.byte		N05	, An2, v088
	.byte	W06
	.byte			An2, v024
	.byte	W06
	.byte			En2, v116
	.byte		N05	, An2, v104
	.byte	W06
	.byte			An2, v024
	.byte	W06
	.byte			Fn2, v096
	.byte		N05	, An2, v084
	.byte	W06
	.byte			An2, v024
	.byte	W06
	.byte			Fn2, v096
	.byte		N05	, Bn2, v084
	.byte	W06
	.byte			Bn2, v024
	.byte	W06
	.byte			Gn2, v104
	.byte		N05	, Cn3, v096
	.byte	W06
	.byte			Cn3, v024
	.byte	W06
	.byte			Gn2, v104
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v024
	.byte	W18
	.byte			Gn2, v112
	.byte		N05	, Cn3, v108
	.byte	W06
	.byte			Cn3, v024
	.byte	W06
	.byte		N23	, Gs2, v104
	.byte		N23	, Cs3, v092
	.byte	W24
	.byte		N05	, Gn2, v112
	.byte		N05	, Cn3, v108
	.byte	W06
	.byte			Cn3, v024
	.byte	W06
	.byte			Gn2, v104
	.byte		N05	, Cn3, v096
	.byte	W06
	.byte			Cn3, v024
	.byte	W18
	.byte			Gn2, v104
	.byte		N05	, Cn3, v088
	.byte	W06
	.byte			Cn3, v024
	.byte	W06
	.byte			Gs2, v092
	.byte		N05	, Cn3, v064
	.byte	W06
	.byte			Cn3, v024
	.byte	W18
	.byte			Gn2, v096
	.byte		N05	, Cn3, v092
	.byte	W06
	.byte			Cn3, v024
	.byte	W06
	.byte			Gn2, v100
	.byte		N05	, Cn3, v088
	.byte	W06
	.byte			Cn3, v024
	.byte	W18
	.byte			Gn2, v108
	.byte		N05	, Cn3
	.byte	W06
	.byte			Cn3, v024
	.byte	W06
	.byte		N23	, Gs2, v080
	.byte		N23	, Cs3
	.byte	W24
	.byte		N05	, Gn2, v104
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Cn3, v024
	.byte	W06
	.byte			Gn2, v088
	.byte		N05	, Cn3, v068
	.byte	W06
	.byte			Cn3, v024
	.byte	W18
	.byte			Gn2, v096
	.byte		N05	, Cn3, v080
	.byte	W06
	.byte			Cn3, v024
	.byte	W06
	.byte			Gs2, v096
	.byte		N05	, Cn3, v080
	.byte	W06
	.byte			Cn3, v024
	.byte	W06
	.byte			Cn3, v080
	.byte		N05	, En3, v096
	.byte	W06
	.byte			En3, v024
	.byte	W06
	.byte			Bn2, v100
	.byte		N05	, Fn3, v104
	.byte	W06
	.byte			Fn3, v024
	.byte	W06
	.byte			Bn2, v100
	.byte		N05	, Fn3, v104
	.byte	W06
	.byte			Fn3, v024
	.byte	W06
	.byte			Bn2, v088
	.byte		N05	, Fn3, v112
	.byte	W06
	.byte			Fn3, v024
	.byte	W18
	.byte	VOICE	, 56
	.byte	W03
	.byte	VOL	, v052
	.byte	W03
	.byte	PAN	, c_v+18
	.byte	W06
	.byte		N03	, An2, v100
	.byte		N03	, Dn3, v112
	.byte	W06
	.byte			An2, v092
	.byte		N03	, Dn3, v112
	.byte	W06
	.byte		N09	, As2, v088
	.byte		N09	, Ds3, v104
	.byte	W12
	.byte		N18	, Bn2, v088
	.byte		N18	, En3, v104
	.byte	W18
	.byte		N06	, En3, v020
	.byte	W06
	.byte		N18	, En2, v080
	.byte		N18	, As2, v100
	.byte	W18
	.byte		N06	, As2, v020
	.byte	W06
	.byte			En2, v084
	.byte		N06	, Bn2, v104
	.byte	W06
	.byte			Bn2, v020
	.byte	W06
	.byte	VOICE	, 57
	.byte	VOL	, v029
	.byte	PAN	, c_v+29
	.byte	W12
	.byte		N12	, Bn2, v072
	.byte		N12	, En3, v096
	.byte	W12
	.byte			En3, v072
	.byte		N12	, An3, v096
	.byte	W12
	.byte			As3, v072
	.byte		N12	, Ds4, v096
	.byte	W12
	.byte			Bn3, v072
	.byte		N12	, En4, v096
	.byte	W12
	.byte			En4, v072
	.byte		N12	, An4, v096
	.byte	W12
	.byte	W12
	.byte			Bn2, v072
	.byte		N12	, En3, v096
	.byte	W12
	.byte			En3, v072
	.byte		N12	, An3, v096
	.byte	W12
	.byte			Bn3, v072
	.byte		N12	, Ds4, v096
	.byte	W12
	.byte			Bn3, v072
	.byte		N12	, En4, v096
	.byte	W12
	.byte			Ds4, v072
	.byte		N12	, Gs4, v096
	.byte	W12
	.byte	W12
	.byte			Bn2, v072
	.byte		N12	, En3, v096
	.byte	W12
	.byte			En3, v072
	.byte		N12	, An3, v096
	.byte	W12
	.byte			As3, v072
	.byte		N12	, Ds4, v096
	.byte	W12
	.byte			Bn3, v072
	.byte		N12	, En4, v096
	.byte	W12
	.byte			Dn4, v072
	.byte		N12	, Gn4, v096
	.byte	W12
	.byte	W12
	.byte			Bn2, v072
	.byte		N12	, En3, v096
	.byte	W12
	.byte			En3, v072
	.byte		N12	, An3, v096
	.byte	W12
	.byte			As3, v072
	.byte		N12	, Ds4, v096
	.byte	W12
	.byte			Bn3, v072
	.byte		N12	, En4, v096
	.byte	W12
	.byte			Cn4, v072
	.byte		N12	, Fn4, v096
	.byte	W12
	.byte	W72
	.byte	W72
	.byte	VOICE	, 58
	.byte	VOL	, v040
	.byte	PAN	, c_v+30
	.byte	W72
	.byte		N21	, An2, v108
	.byte		N21	, Dn3
	.byte	W24
	.byte			Bn2
	.byte		N21	, En3
	.byte	W24
	.byte			Cn3
	.byte		N21	, Fn3
	.byte	W24
	.byte		TIE	, Cs3
	.byte		TIE	, Fs3
	.byte	W72
	.byte	W30
	.byte		EOT	, Cs3
	.byte			Fs3
	.byte	W06
	.byte		N12	, Fn2
	.byte		N12	, As2
	.byte	W12
	.byte			Gs2
	.byte		N12	, Cs3
	.byte	W12
	.byte		N12	
	.byte		N12	, Fs3
	.byte	W12
	.byte		N66	, Bn2
	.byte		N66	, En3
	.byte	W72
	.byte			An2
	.byte		N66	, Dn3
	.byte	W72
song046_3_1:
	.byte		N06	, As2, v096
	.byte	W06
	.byte			As2, v032
	.byte	W06
	.byte			As2, v096
	.byte	W06
	.byte			As2, v032
	.byte	W54
	.byte	PEND
	.byte	PATT	
		.word	song046_3_1
	.byte		N06	, An2, v100
	.byte	W06
	.byte			An2, v032
	.byte	W06
	.byte			An2, v100
	.byte	W06
	.byte			An2, v032
	.byte	W18
	.byte			An2, v100
	.byte	W06
	.byte			An2, v032
	.byte	W18
	.byte			Gn2, v100
	.byte	W06
	.byte			Gn2, v032
	.byte	W06
	.byte			Fn2, v100
	.byte	W06
	.byte			Fn2, v032
	.byte	W06
	.byte			Fn2, v100
	.byte	W06
	.byte			Fn2, v032
	.byte	W18
	.byte			Fn2, v100
	.byte	W06
	.byte			Fn2, v032
	.byte	W06
	.byte			En2, v100
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte			En2, v100
	.byte	W06
	.byte			En2, v032
	.byte	W06
	.byte	PATT	
		.word	song046_3_2
	.byte	GOTO	
		.word	song046_3_3
	.byte	FINE

	@********************** Track  4 **********************@

	.global song046_4
song046_4:	@ 0x08569B38
	.byte	KEYSH	, 0
	.byte	VOICE	, 50
	.byte	VOL	, v040
	.byte	PAN	, c_v
	.byte	W24
song046_4_1:
	.byte		N09	, An1, v127
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte	PEND
song046_4_3:
	.byte		N09	, An1, v127
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song046_4_1
	.byte		N09	, An1, v127
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
song046_4_2:
	.byte		N09	, Cn2, v127
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte	PEND
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song046_4_2
	.byte		N09	, Cn2, v127
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte	W72
	.byte	W72
	.byte		N44	, En2, v092
	.byte		N44	, An2, v108
	.byte	W48
	.byte		N23	, Fs2, v092
	.byte		N23	, Bn2, v108
	.byte	W24
	.byte		N08	, Gn2, v092
	.byte		N08	, Cn3, v108
	.byte	W12
	.byte		N23	, En2, v092
	.byte		N23	, An2, v108
	.byte	W24
	.byte			Fs2, v092
	.byte		N23	, Bn2, v108
	.byte	W24
	.byte		N08	, An2, v092
	.byte		N08	, Dn3, v108
	.byte	W12
	.byte		N44	, Bn2, v092
	.byte		N44	, En3, v108
	.byte	W48
	.byte		N23	, Cn3, v092
	.byte		N23	, Fn3, v108
	.byte	W24
	.byte		N56	, Bn2, v092
	.byte		N56	, En3, v108
	.byte	W72
	.byte		N68	, As2, v092
	.byte		N68	, Ds3, v108
	.byte	W72
	.byte		N23	, Bn2, v092
	.byte		N23	, En3, v108
	.byte	W24
	.byte			En2, v092
	.byte		N23	, An2, v108
	.byte	W24
	.byte			Gn2, v092
	.byte		N23	, Cn3, v108
	.byte	W24
	.byte		N44	, Fs2, v092
	.byte		N44	, Bn2, v108
	.byte	W60
	.byte		N11	, Gn2, v092
	.byte		N11	, Cn3, v108
	.byte	W12
	.byte	W72
	.byte	W24
	.byte		TIE	, As2, v080
	.byte	W48
	.byte	W72
	.byte		EOT	
	.byte		N48	, Bn2
	.byte	W48
	.byte		N24	, Cs3
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte			En3
	.byte	W24
	.byte			Fs3
	.byte	W24
	.byte	W72
	.byte	W72
	.byte	W24
	.byte			Dn3, v096
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte			As2
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte			En2
	.byte	W24
	.byte	PATT	
		.word	song046_4_1
	.byte	GOTO	
		.word	song046_4_3
	.byte	FINE

	@********************** Track  5 **********************@

	.global song046_5
song046_5:	@ 0x08569C30
	.byte	KEYSH	, 0
	.byte	W24
	.byte	W72
song046_5_1:
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	VOICE	, 51
	.byte	VOL	, v040
	.byte	PAN	, c_v-28
	.byte	W72
	.byte	W48
	.byte		N05	, Bn3, v120
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte		N06	, En4
	.byte	W06
	.byte			En4, v028
	.byte	W06
	.byte			En4, v120
	.byte	W06
	.byte			En4, v028
	.byte	W06
	.byte			En4, v120
	.byte	W06
	.byte			En4, v028
	.byte	W42
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W68
	.byte	W03
	.byte	VOL	, v040
	.byte	W01
	.byte		v033
	.byte		N06	, An3, v092
	.byte	W04
	.byte	VOL	, v033
	.byte	W02
	.byte		N06	, An3, v028
	.byte	W04
	.byte	VOL	, v033
	.byte	W02
	.byte		N06	, En4, v092
	.byte	W01
	.byte	VOL	, v033
	.byte	W03
	.byte		v034
	.byte	W02
	.byte		N06	, En4, v028
	.byte	W01
	.byte	VOL	, v034
	.byte	W03
	.byte		v035
	.byte	W02
	.byte		N12	, En4, v092
	.byte	W01
	.byte	VOL	, v035
	.byte	W03
	.byte		v036
	.byte	W03
	.byte		v036
	.byte	W03
	.byte		v036
	.byte	W02
	.byte		N06	, Fn4
	.byte	W01
	.byte	VOL	, v037
	.byte	W03
	.byte		v037
	.byte	W02
	.byte		N06	, Fn4, v028
	.byte	W01
	.byte	VOL	, v038
	.byte	W03
	.byte		v038
	.byte	W02
	.byte		N12	, Fn4, v092
	.byte	W01
	.byte	VOL	, v038
	.byte	W03
	.byte		v039
	.byte	W03
	.byte		v039
	.byte	W03
	.byte		v040
	.byte	W02
	.byte		N06	, En4
	.byte	W01
	.byte	VOL	, v040
	.byte	W04
	.byte		v040
	.byte	W01
	.byte		N06	, En4, v028
	.byte	W02
	.byte	VOL	, v041
	.byte	W03
	.byte		v041
	.byte	W01
	.byte		N06	, An3, v092
	.byte	W02
	.byte	VOL	, v042
	.byte	W03
	.byte		v042
	.byte	W01
	.byte		N06	, An3, v028
	.byte	W02
	.byte	VOL	, v042
	.byte	W03
	.byte		v043
	.byte	W01
	.byte		N06	, En4, v092
	.byte	W02
	.byte	VOL	, v043
	.byte	W03
	.byte		v044
	.byte	W01
	.byte		N06	, En4, v028
	.byte	W02
	.byte	VOL	, v044
	.byte	W03
	.byte		v045
	.byte	W01
	.byte		N12	, En4, v092
	.byte	W02
	.byte	VOL	, v045
	.byte	W03
	.byte		v045
	.byte	W03
	.byte		v046
	.byte	W03
	.byte		v046
	.byte	W01
	.byte		N06	, Fs4
	.byte	W02
	.byte	VOL	, v047
	.byte	W03
	.byte		v047
	.byte	W01
	.byte		N06	, Fs4, v028
	.byte	W02
	.byte	VOL	, v047
	.byte	W03
	.byte		v048
	.byte	W01
	.byte		N12	, Fs4, v092
	.byte	W02
	.byte	VOL	, v048
	.byte	W03
	.byte		v049
	.byte	W03
	.byte		v049
	.byte	W03
	.byte		v049
	.byte	W01
	.byte		N06	, En4
	.byte	W02
	.byte	VOL	, v050
	.byte	W03
	.byte		v050
	.byte	W01
	.byte		N06	, En4, v028
	.byte	W02
	.byte	VOL	, v051
	.byte	W03
	.byte		v052
	.byte	W01
	.byte		N06	, An3, v092
	.byte	W05
	.byte	VOL	, v051
	.byte	W01
	.byte		N06	, An3, v028
	.byte	W02
	.byte	VOL	, v051
	.byte	W03
	.byte		v050
	.byte	W01
	.byte		N06	, En4, v092
	.byte	W02
	.byte	VOL	, v050
	.byte	W03
	.byte		v049
	.byte	W01
	.byte		N06	, En4, v028
	.byte	W02
	.byte	VOL	, v049
	.byte	W03
	.byte		v049
	.byte	W01
	.byte		N12	, En4, v092
	.byte	W02
	.byte	VOL	, v048
	.byte	W02
	.byte		v048
	.byte	W03
	.byte		v047
	.byte	W03
	.byte		v047
	.byte	W02
	.byte		N06	, Gn4
	.byte	W01
	.byte	VOL	, v047
	.byte	W03
	.byte		v046
	.byte	W02
	.byte		N06	, Gn4, v028
	.byte	W01
	.byte	VOL	, v046
	.byte	W03
	.byte		v045
	.byte	W02
	.byte		N12	, Gn4, v092
	.byte	W01
	.byte	VOL	, v045
	.byte	W03
	.byte		v045
	.byte	W03
	.byte		v044
	.byte	W03
	.byte		v044
	.byte	W02
	.byte		N06	, Fs4
	.byte	W01
	.byte	VOL	, v043
	.byte	W03
	.byte		v043
	.byte	W02
	.byte		v042
	.byte		N06	, Fs4, v028
	.byte	W03
	.byte	VOL	, v042
	.byte	W03
	.byte		v042
	.byte		N12	, Fs4, v092
	.byte	W03
	.byte	VOL	, v041
	.byte	W03
	.byte		v041
	.byte	W03
	.byte		v040
	.byte	W03
	.byte		v040
	.byte		N06	, Fn4
	.byte	W03
	.byte	VOL	, v040
	.byte	W03
	.byte		v039
	.byte		N06	, Fn4, v028
	.byte	W03
	.byte	VOL	, v039
	.byte	W03
	.byte		v038
	.byte		N12	, En4, v092
	.byte	W03
	.byte	VOL	, v038
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		N06	, Ds4
	.byte	W02
	.byte	VOL	, v036
	.byte	W03
	.byte		v036
	.byte	W01
	.byte		N06	, Ds4, v028
	.byte	W02
	.byte	VOL	, v036
	.byte	W03
	.byte		v035
	.byte	W01
	.byte		N12	, En4, v092
	.byte	W02
	.byte	VOL	, v035
	.byte	W03
	.byte		v034
	.byte	W03
	.byte		v034
	.byte	W03
	.byte		v033
	.byte	W01
	.byte		N06	, Fn4
	.byte	W02
	.byte	VOL	, v033
	.byte	W03
	.byte		v033
	.byte	W01
	.byte		N06	, Fn4, v028
	.byte	W02
	.byte	VOL	, v032
	.byte	W03
	.byte		v032
	.byte	W01
	.byte		v031
	.byte		N06	, Fs4, v088
	.byte	W05
	.byte	VOL	, v032
	.byte	W01
	.byte		N06	, Fs4, v028
	.byte	W02
	.byte	VOL	, v032
	.byte	W03
	.byte		v033
	.byte	W01
	.byte		N06	, Cs4, v088
	.byte	W02
	.byte	VOL	, v033
	.byte	W03
	.byte		v033
	.byte	W01
	.byte		N06	, Cs4, v028
	.byte	W02
	.byte	VOL	, v034
	.byte	W03
	.byte		v034
	.byte	W01
	.byte		N06	, Fs4, v088
	.byte	W02
	.byte	VOL	, v035
	.byte	W03
	.byte		v035
	.byte	W01
	.byte		N06	, Fs4, v028
	.byte	W02
	.byte	VOL	, v036
	.byte	W03
	.byte		v036
	.byte	W01
	.byte		N06	, Cs4, v088
	.byte	W02
	.byte	VOL	, v036
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		N06	, Cs4, v028
	.byte	W01
	.byte	VOL	, v037
	.byte	W03
	.byte		v038
	.byte	W02
	.byte		N06	, Fs4, v088
	.byte	W01
	.byte	VOL	, v038
	.byte	W03
	.byte		v038
	.byte	W02
	.byte		N06	, Fs4, v028
	.byte	W01
	.byte	VOL	, v039
	.byte	W03
	.byte		v039
	.byte	W02
	.byte		N06	, Cs4, v088
	.byte	W01
	.byte	VOL	, v040
	.byte	W03
	.byte		v040
	.byte	W02
	.byte		N06	, Cs4, v028
	.byte	W01
	.byte	VOL	, v040
	.byte	W03
	.byte		v041
	.byte	W02
	.byte		N06	, Fs4, v088
	.byte	W01
	.byte	VOL	, v041
	.byte	W03
	.byte		v042
	.byte	W02
	.byte		v042
	.byte		N06	, Fs4, v028
	.byte	W03
	.byte	VOL	, v042
	.byte	W03
	.byte		v043
	.byte		N06	, Cs4, v088
	.byte	W03
	.byte	VOL	, v043
	.byte	W03
	.byte		v044
	.byte		N06	, Cs4, v028
	.byte	W03
	.byte	VOL	, v044
	.byte	W03
	.byte		v045
	.byte		N06	, Fs4, v088
	.byte	W03
	.byte	VOL	, v045
	.byte	W03
	.byte		v045
	.byte		N06	, Fs4, v028
	.byte	W03
	.byte	VOL	, v046
	.byte	W03
	.byte		v046
	.byte		N06	, Cs4, v088
	.byte	W03
	.byte	VOL	, v047
	.byte	W03
	.byte		v047
	.byte		N06	, Cs4, v028
	.byte	W03
	.byte	VOL	, v047
	.byte	W02
	.byte		v048
	.byte	W01
	.byte		N06	, Fs4, v088
	.byte	W02
	.byte	VOL	, v048
	.byte	W03
	.byte		v049
	.byte	W01
	.byte		N06	, Fs4, v028
	.byte	W02
	.byte	VOL	, v049
	.byte	W03
	.byte		v049
	.byte	W01
	.byte		N06	, Cs4, v088
	.byte	W02
	.byte	VOL	, v050
	.byte	W03
	.byte		v050
	.byte	W01
	.byte		N06	, Cs4, v028
	.byte	W02
	.byte	VOL	, v051
	.byte	W03
	.byte		v052
	.byte	W01
	.byte		N06	, Fs4, v088
	.byte	W05
	.byte	VOL	, v051
	.byte	W01
	.byte		N06	, Fs4, v028
	.byte	W02
	.byte	VOL	, v051
	.byte	W03
	.byte		v050
	.byte	W01
	.byte		N06	, Cs4, v088
	.byte	W02
	.byte	VOL	, v050
	.byte	W03
	.byte		v049
	.byte	W01
	.byte		N06	, Cs4, v028
	.byte	W02
	.byte	VOL	, v049
	.byte	W03
	.byte		v049
	.byte	W01
	.byte		N06	, Fs4, v088
	.byte	W02
	.byte	VOL	, v048
	.byte	W03
	.byte		v048
	.byte	W01
	.byte		N06	, Fs4, v028
	.byte	W02
	.byte	VOL	, v047
	.byte	W03
	.byte		v047
	.byte	W01
	.byte		N06	, Cs4, v088
	.byte	W02
	.byte	VOL	, v047
	.byte	W03
	.byte		v046
	.byte	W01
	.byte		N06	, Cs4, v028
	.byte	W02
	.byte	VOL	, v046
	.byte	W03
	.byte		v045
	.byte	W01
	.byte		N06	, Fs4, v088
	.byte	W02
	.byte	VOL	, v045
	.byte	W03
	.byte		v045
	.byte	W01
	.byte		N06	, Fs4, v028
	.byte	W02
	.byte	VOL	, v044
	.byte	W03
	.byte		v044
	.byte	W01
	.byte		N06	, Cs4, v088
	.byte	W02
	.byte	VOL	, v043
	.byte	W03
	.byte		v043
	.byte	W01
	.byte		N06	, Cs4, v028
	.byte	W02
	.byte	VOL	, v042
	.byte	W03
	.byte		v042
	.byte	W01
	.byte		N06	, Fs4, v088
	.byte	W02
	.byte	VOL	, v042
	.byte	W03
	.byte		v041
	.byte	W01
	.byte		N06	, Fs4, v028
	.byte	W02
	.byte	VOL	, v041
	.byte	W03
	.byte		v040
	.byte	W01
	.byte		N06	, Cs4, v088
	.byte	W02
	.byte	VOL	, v040
	.byte	W03
	.byte		v040
	.byte	W01
	.byte		N06	, Cs4, v028
	.byte	W02
	.byte	VOL	, v039
	.byte	W03
	.byte		v039
	.byte	W01
	.byte		N06	, Fs4, v088
	.byte	W02
	.byte	VOL	, v038
	.byte	W03
	.byte		v038
	.byte	W01
	.byte		N06	, Fs4, v028
	.byte	W02
	.byte	VOL	, v038
	.byte	W03
	.byte		v037
	.byte	W01
	.byte		N06	, Cs4, v088
	.byte	W02
	.byte	VOL	, v037
	.byte	W03
	.byte		v036
	.byte	W01
	.byte		N06	, Cs4, v028
	.byte	W02
	.byte	VOL	, v036
	.byte	W03
	.byte		v036
	.byte	W01
	.byte		N06	, Fs4, v088
	.byte	W02
	.byte	VOL	, v035
	.byte	W03
	.byte		v035
	.byte	W01
	.byte		N06	, Fs4, v028
	.byte	W02
	.byte	VOL	, v034
	.byte	W03
	.byte		v034
	.byte	W01
	.byte		N06	, Cs4, v088
	.byte	W02
	.byte	VOL	, v033
	.byte	W03
	.byte		v033
	.byte	W01
	.byte		N06	, Cs4, v028
	.byte	W02
	.byte	VOL	, v033
	.byte	W03
	.byte		v032
	.byte	W01
	.byte		v032
	.byte		N06	, Gn5, v068
	.byte	W06
	.byte			Gn5, v024
	.byte	W06
	.byte			Gn5, v068
	.byte	W06
	.byte			Gn5, v024
	.byte	W54
	.byte			Cs5, v068
	.byte	W06
	.byte			Cs5, v024
	.byte	W06
	.byte			Cs5, v068
	.byte	W06
	.byte			Cs5, v024
	.byte	W54
	.byte	VOL	, v015
	.byte		TIE	, En4, v096
	.byte	W04
	.byte	VOL	, v015
	.byte	W05
	.byte		v016
	.byte	W05
	.byte		v016
	.byte	W03
	.byte		v017
	.byte	W05
	.byte		v017
	.byte	W04
	.byte		v018
	.byte	W03
	.byte		v018
	.byte	W05
	.byte		v018
	.byte	W03
	.byte		v019
	.byte	W02
	.byte		v019
	.byte	W03
	.byte		v020
	.byte	W03
	.byte		v020
	.byte	W03
	.byte		v020
	.byte	W04
	.byte		v021
	.byte	W01
	.byte		v021
	.byte	W03
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W03
	.byte		v022
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v023
	.byte	W03
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W01
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v026
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
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W20
	.byte		EOT	
	.byte	W72
	.byte	GOTO	
		.word	song046_5_1
	.byte	FINE

	@********************** Track  6 **********************@

	.global song046_6
song046_6:	@ 0x0856A01A
	.byte	KEYSH	, 0
	.byte	VOICE	, 47
	.byte	VOL	, v040
	.byte	PAN	, c_v+16
	.byte		N05	, An2, v120
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
song046_6_8:
	.byte		N24	, An2, v120
	.byte	W60
	.byte		N11	, En3
	.byte	W12
	.byte	PEND
song046_6_1:
	.byte		N14	, An2, v120
	.byte	W48
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PEND
song046_6_2:
	.byte		N21	, An2, v120
	.byte	W60
	.byte		N11	
	.byte	W12
	.byte	PEND
song046_6_3:
	.byte		N17	, An2, v120
	.byte	W48
	.byte		N05	, En3
	.byte	W06
	.byte			En3, v084
	.byte	W06
	.byte			En3, v100
	.byte	W06
	.byte			En3, v080
	.byte	W06
	.byte	PEND
	.byte		N12	, An2, v127
	.byte	W60
	.byte		N11	, En3, v120
	.byte	W12
	.byte	PATT	
		.word	song046_6_1
	.byte	PATT	
		.word	song046_6_2
	.byte	PATT	
		.word	song046_6_3
	.byte		N11	, En3, v116
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte		N05	, Bn2
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N11	, En3
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte	W36
	.byte		N12	
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Bn2
	.byte	W12
song046_6_4:
	.byte		N24	, An2, v127
	.byte	W60
	.byte		N06	, En3
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PEND
song046_6_5:
	.byte		N12	, An2, v127
	.byte	W12
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W36
	.byte	PEND
song046_6_6:
	.byte		N12	, An2, v127
	.byte	W36
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W24
	.byte	PEND
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W12
	.byte		N06	, En3
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PATT	
		.word	song046_6_4
	.byte	PATT	
		.word	song046_6_5
	.byte	PATT	
		.word	song046_6_6
	.byte		N12	, An2, v127
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W12
	.byte		N06	, En3
	.byte	W06
	.byte		N06	
	.byte	W06
song046_6_7:
	.byte		N24	, As2, v127
	.byte	W60
	.byte		N06	, Fn3
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PEND
	.byte		N12	, As2
	.byte	W12
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W36
	.byte		N12	
	.byte	W36
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W12
	.byte		N06	, Fn3
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PATT	
		.word	song046_6_7
	.byte		N12	, As2, v127
	.byte	W12
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			Bn2
	.byte	W36
	.byte		N12	
	.byte	W12
	.byte			Fs2
	.byte	W24
	.byte			Bn2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte		N06	, En3
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PATT	
		.word	song046_6_8
	.byte	GOTO	
		.word	song046_6_1
	.byte	FINE

	@********************** Track  7 **********************@

	.global song046_7
song046_7:	@ 0x0856A123
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v040
	.byte	PAN	, c_v
	.byte		N06	, Cn2, v127
	.byte	W06
	.byte			An1
	.byte	W06
	.byte			Fn1
	.byte	W06
	.byte		N06	
	.byte	W06
song046_7_1:
	.byte		N06	, Cn1, v120
	.byte		N48	, An2, v076
	.byte	W12
	.byte		N06	, Cn1, v116
	.byte	W36
	.byte		N12	, Cs1, v127
	.byte	W24
	.byte	PEND
song046_7_2:
	.byte		N06	, Cn1, v116
	.byte	W12
	.byte			Cn1, v120
	.byte	W12
	.byte		N12	, Cs1, v127
	.byte	W24
	.byte		N24	, Ds1, v116
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Cn1, v116
	.byte	W12
	.byte		N12	, Cs1, v124
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte	W12
	.byte		N12	, Cs1, v127
	.byte	W12
	.byte			Cs1, v124
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte	W12
	.byte			Cn1, v116
	.byte	W12
	.byte		N12	, Cs1, v127
	.byte	W24
	.byte		N06	, Dn1, v116
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Dn1, v112
	.byte	W06
	.byte			Cn1, v120
	.byte		N48	, An2, v076
	.byte	W12
	.byte		N06	, Cn1, v116
	.byte	W36
	.byte		N12	, Dn1, v112
	.byte	W24
	.byte		N06	, Cn1, v120
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N12	, Dn1, v116
	.byte	W24
	.byte		N24	, Ds1
	.byte	W12
	.byte		N06	, Cn1
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Cn1, v120
	.byte	W12
	.byte		N12	, Dn1, v116
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte	W12
	.byte		N12	, Dn1, v116
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte	W12
	.byte			Cn1, v116
	.byte	W12
	.byte		N12	, Dn1, v112
	.byte	W24
	.byte		N24	, Ds1, v116
	.byte	W24
	.byte		N11	, An2, v088
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N32	, An2, v096
	.byte	W48
	.byte		N12	, Dn1, v116
	.byte	W12
	.byte		N06	, Dn1, v096
	.byte	W06
	.byte			Dn1, v084
	.byte	W06
	.byte		N12	, Dn1, v116
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte		N06	, Dn1, v104
	.byte	W06
	.byte			Dn1, v092
	.byte	W06
	.byte			Dn1, v100
	.byte	W06
	.byte			Dn1, v116
	.byte	W06
	.byte			Cn1, v120
	.byte		N48	, An2, v080
	.byte	W36
	.byte		N12	, Dn1, v116
	.byte	W12
	.byte		N12	
	.byte	W24
	.byte		N06	, Cn1
	.byte	W36
	.byte			Dn1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	, Ds1
	.byte	W24
	.byte		N06	, Cn1
	.byte	W24
	.byte		N12	, Dn1
	.byte	W24
	.byte			Dn1, v112
	.byte	W12
	.byte			Dn1, v116
	.byte	W12
	.byte		N06	, Cn1
	.byte	W24
	.byte		N12	, Dn1, v112
	.byte	W12
	.byte			Dn1, v116
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte		N06	, Dn1, v116
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Cn1, v120
	.byte		N48	, An2, v072
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte	W36
	.byte		N12	, Dn1, v112
	.byte	W24
	.byte		N06	, Cn1, v120
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N12	, Dn1, v116
	.byte	W24
	.byte			Ds1, v112
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N12	, Dn1, v112
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte	W12
	.byte		N12	, Dn1, v116
	.byte	W12
	.byte			Dn1, v112
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte	W12
	.byte			Cn1, v116
	.byte	W12
	.byte		N12	, Dn1, v112
	.byte	W24
	.byte			Ds1, v116
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte		N24	, An2, v068
	.byte	W36
	.byte		N12	, Dn1, v116
	.byte	W12
	.byte		N12	
	.byte	W24
	.byte		N06	, Cn1, v120
	.byte	W36
	.byte			Dn1, v112
	.byte	W06
	.byte			Dn1, v116
	.byte	W06
	.byte		N24	, Ds1
	.byte	W24
	.byte		N06	, Cn1, v120
	.byte	W24
	.byte		N12	, Dn1, v112
	.byte	W24
	.byte		N12	
	.byte	W12
	.byte			Dn1, v116
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte	W24
	.byte		N12	, Dn1, v116
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte		N06	, Dn1, v116
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Cn1, v120
	.byte		N12	, Gn2, v076
	.byte	W12
	.byte		N06	, Cn1, v116
	.byte		N12	, Gn2, v084
	.byte	W24
	.byte			Dn1, v116
	.byte	W12
	.byte			Ds1, v112
	.byte	W12
	.byte		N06	, Dn1, v116
	.byte	W06
	.byte			Dn1, v112
	.byte	W06
	.byte			Cn1, v120
	.byte		N12	, Gn2, v080
	.byte	W12
	.byte		N06	, Cn1, v116
	.byte		N12	, Gn2, v084
	.byte	W24
	.byte		N06	, Dn1, v116
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	, Ds1, v112
	.byte	W24
	.byte		N06	, Cn1, v120
	.byte	W12
	.byte		N12	, Dn1, v116
	.byte	W12
	.byte			Dn1, v112
	.byte	W12
	.byte			Ds1, v116
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte		N12	, Dn1, v112
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Dn1, v116
	.byte	W06
	.byte			Cn1, v120
	.byte		N12	, Dn1, v112
	.byte	W12
	.byte		N06	, Cn1, v120
	.byte		N12	, Dn1, v116
	.byte	W12
	.byte			Dn1, v112
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Dn1, v116
	.byte	W06
	.byte			Cn1, v120
	.byte		N24	, Ds1, v112
	.byte	W24
	.byte	PATT	
		.word	song046_7_1
	.byte	GOTO	
		.word	song046_7_2
	.byte	FINE

	.align 2
	.global song046
song046:	@ 0x0856A310
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup015		@ voicegroup/tone

	.word	song046_1		@ track
	.word	song046_2		@ track
	.word	song046_3		@ track
	.word	song046_4		@ track
	.word	song046_5		@ track
	.word	song046_6		@ track
	.word	song046_7		@ track
