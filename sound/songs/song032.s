	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song032_1
song032_1:	@ 0x08560964
	.byte	KEYSH	, 0
song032_1_2:
	.byte	TEMPO	, 64
	.byte	VOICE	, 11
	.byte	VOL	, v045
	.byte	PAN	, c_v
	.byte	W12
	.byte		N06	, An4, v100
	.byte	W06
	.byte			An4, v060
	.byte	W06
	.byte			As4, v100
	.byte	W06
	.byte			As4, v060
	.byte	W06
	.byte			Cs5, v100
	.byte	W06
	.byte			Cs5, v060
	.byte	W06
	.byte			Dn5, v100
	.byte	W06
	.byte			Dn5, v060
	.byte	W06
	.byte			Dn5, v100
	.byte	W06
	.byte			Dn5, v060
	.byte	W06
song032_1_1:
	.byte	W12
	.byte		N06	, Dn5, v100
	.byte	W06
	.byte			Dn5, v060
	.byte	W06
	.byte			En5, v100
	.byte	W06
	.byte			En5, v060
	.byte	W06
	.byte			Cs5, v100
	.byte	W06
	.byte			Cs5, v060
	.byte	W06
	.byte			Dn5, v100
	.byte	W06
	.byte			Dn5, v060
	.byte	W06
	.byte			As4, v100
	.byte	W06
	.byte			As4, v060
	.byte	W06
	.byte	PEND
	.byte	W12
	.byte			An4, v100
	.byte	W06
	.byte			An4, v060
	.byte	W06
	.byte			As4, v100
	.byte	W06
	.byte			As4, v060
	.byte	W06
	.byte			Dn5, v100
	.byte	W06
	.byte			Dn5, v060
	.byte	W06
	.byte			Cs5, v100
	.byte	W06
	.byte			Cs5, v060
	.byte	W06
	.byte			An4, v100
	.byte	W06
	.byte			An4, v060
	.byte	W06
	.byte			As4, v100
	.byte	W06
	.byte			As4, v060
	.byte	W06
	.byte			Gn4, v100
	.byte	W06
	.byte			Gn4, v060
	.byte	W06
	.byte		N24	, An4, v100
	.byte	W48
	.byte	W72
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			An4, v060
	.byte	W06
	.byte			As4, v100
	.byte	W06
	.byte			As4, v060
	.byte	W06
	.byte			Cs5, v100
	.byte	W06
	.byte			Cs5, v060
	.byte	W06
	.byte			Dn5, v100
	.byte	W06
	.byte			Dn5, v060
	.byte	W06
	.byte			Dn5, v100
	.byte	W06
	.byte			Dn5, v060
	.byte	W06
	.byte	PATT	
		.word	song032_1_1
	.byte	W12
	.byte		N06	, Dn5, v100
	.byte	W06
	.byte			Dn5, v060
	.byte	W06
	.byte			Ds5, v100
	.byte	W06
	.byte			Ds5, v060
	.byte	W06
	.byte			Gn5, v100
	.byte	W06
	.byte			Gn5, v060
	.byte	W06
	.byte			Fs5, v100
	.byte	W06
	.byte			Fs5, v060
	.byte	W06
	.byte			Dn5, v100
	.byte	W06
	.byte			Dn5, v060
	.byte	W06
	.byte			Ds5, v100
	.byte	W06
	.byte			Ds5, v060
	.byte	W06
	.byte			Cn5, v100
	.byte	W06
	.byte			Cn5, v060
	.byte	W06
	.byte			Dn5, v100
	.byte	W06
	.byte			Dn5, v060
	.byte	W06
	.byte			As4, v100
	.byte	W06
	.byte			As4, v060
	.byte	W06
	.byte		N48	, An4, v100
	.byte	W24
	.byte	W72
	.byte		N12	, Cn4
	.byte	W12
	.byte		N04	, Bn3
	.byte	W04
	.byte			Cn4
	.byte	W04
	.byte			Bn3
	.byte	W04
	.byte		N24	, An3
	.byte	W48
	.byte		N12	
	.byte	W12
	.byte		N04	, Gs3
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Gs3
	.byte	W04
	.byte		N12	, Fn3
	.byte	W12
	.byte		N24	, En3
	.byte	W24
	.byte		N12	, Dn3
	.byte	W12
	.byte		N24	, En3
	.byte	W72
	.byte		N12	, En4
	.byte	W12
	.byte		N04	, Dn4
	.byte	W04
	.byte			En4
	.byte	W04
	.byte			Dn4
	.byte	W04
	.byte		N24	, Cn4
	.byte	W48
	.byte		N12	
	.byte	W12
	.byte		N04	, Bn3
	.byte	W04
	.byte			Cn4
	.byte	W04
	.byte			Bn3
	.byte	W04
	.byte		N12	, An3
	.byte	W12
	.byte		N24	, Gn3
	.byte	W24
	.byte		N12	, Fn3
	.byte	W12
	.byte		N24	, Gn3
	.byte	W72
	.byte	GOTO	
		.word	song032_1_2
	.byte	FINE

	@********************** Track  2 **********************@

	.global song032_2
song032_2:	@ 0x08560A89
	.byte	KEYSH	, 0
song032_2_3:
	.byte	VOICE	, 34
	.byte	VOL	, v029
	.byte	PAN	, c_v
	.byte		N12	, Dn1, v100
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte			Dn2
	.byte	W12
song032_2_1:
	.byte		N12	, Dn1, v100
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song032_2_1
song032_2_2:
	.byte		N12	, Dn1, v100
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song032_2_2
	.byte	PATT	
		.word	song032_2_1
	.byte	PATT	
		.word	song032_2_1
	.byte	PATT	
		.word	song032_2_1
	.byte	PATT	
		.word	song032_2_2
	.byte	PATT	
		.word	song032_2_2
	.byte	PATT	
		.word	song032_2_2
	.byte	PATT	
		.word	song032_2_2
	.byte	PATT	
		.word	song032_2_2
	.byte	PATT	
		.word	song032_2_2
	.byte	PATT	
		.word	song032_2_2
	.byte	PATT	
		.word	song032_2_2
	.byte	GOTO	
		.word	song032_2_3
	.byte	FINE

	@********************** Track  3 **********************@

	.global song032_3
song032_3:	@ 0x08560B04
	.byte	KEYSH	, 0
song032_3_2:
	.byte	VOICE	, 1
	.byte	VOL	, v027
	.byte	PAN	, c_v-24
	.byte	W12
	.byte		N12	, An2, v100
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N12	
	.byte	W12
song032_3_1:
	.byte	W12
	.byte		N12	, Dn3, v100
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			As2
	.byte	W12
	.byte	PEND
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte		N90	, An2
	.byte	W03
	.byte	VOL	, v027
	.byte	W05
	.byte		v027
	.byte	W03
	.byte		v027
	.byte	W03
	.byte		v026
	.byte	W03
	.byte		v026
	.byte	W02
	.byte		v025
	.byte	W03
	.byte		v025
	.byte	W03
	.byte		v024
	.byte	W09
	.byte		v025
	.byte	W05
	.byte		v025
	.byte	W05
	.byte		v025
	.byte	W04
	.byte		v026
	.byte	W05
	.byte		v027
	.byte	W08
	.byte		v026
	.byte	W04
	.byte		v026
	.byte	W04
	.byte		v025
	.byte	W03
	.byte		v025
	.byte	W04
	.byte		v024
	.byte	W05
	.byte		v025
	.byte	W05
	.byte		v025
	.byte	W04
	.byte		N06	, An2, v060
	.byte	W01
	.byte	VOL	, v025
	.byte	W05
	.byte		v026
	.byte	W04
	.byte		v026
	.byte	W05
	.byte		v027
	.byte	W05
	.byte		v027
	.byte	W05
	.byte		v027
	.byte	W05
	.byte	W12
	.byte		N12	, An2, v100
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte	PATT	
		.word	song032_3_1
	.byte	W12
	.byte		N12	, Dn3, v100
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			As2
	.byte	W12
	.byte		N66	, An2
	.byte	W14
	.byte	VOL	, v027
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W01
	.byte		v025
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
	.byte		v028
	.byte	W02
	.byte		v029
	.byte	W04
	.byte		v028
	.byte	W03
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W03
	.byte		v027
	.byte	W02
	.byte		v027
	.byte		N06	, An2, v060
	.byte	W03
	.byte	VOL	, v027
	.byte	W02
	.byte		v026
	.byte	W03
	.byte		v026
	.byte	W02
	.byte		v025
	.byte	W07
	.byte		v025
	.byte	W03
	.byte		v026
	.byte	W03
	.byte		v026
	.byte	W03
	.byte		v027
	.byte	W04
	.byte	VOICE	, 68
	.byte	VOL	, v027
	.byte	PAN	, c_v-24
	.byte		N12	, Cn4, v100
	.byte	W12
	.byte		N04	, Bn3
	.byte	W04
	.byte			Cn4
	.byte	W04
	.byte			Bn3
	.byte	W04
	.byte		N24	, An3
	.byte	W48
	.byte		N12	
	.byte	W12
	.byte		N04	, Gs3
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Gs3
	.byte	W04
	.byte		N12	, Fn3
	.byte	W12
	.byte		N24	, En3
	.byte	W24
	.byte		N12	, Dn3
	.byte	W12
	.byte		N42	, En3
	.byte	W42
	.byte		N06	, En3, v060
	.byte	W30
	.byte		N12	, En4, v100
	.byte	W12
	.byte		N04	, Dn4
	.byte	W04
	.byte			En4
	.byte	W04
	.byte			Dn4
	.byte	W04
	.byte		N24	, Cn4
	.byte	W48
	.byte		N12	
	.byte	W12
	.byte		N04	, Bn3
	.byte	W04
	.byte			Cn4
	.byte	W04
	.byte			Bn3
	.byte	W04
	.byte		N12	, An3
	.byte	W12
	.byte		N24	, Gn3
	.byte	W24
	.byte		N12	, Fn3
	.byte	W12
	.byte		N42	, Gn3
	.byte	W42
	.byte		N06	, Gn3, v060
	.byte	W30
	.byte	GOTO	
		.word	song032_3_2
	.byte	FINE

	@********************** Track  4 **********************@

	.global song032_4
song032_4:	@ 0x08560C40
	.byte	KEYSH	, 0
song032_4_2:
	.byte	VOICE	, 11
	.byte	VOL	, v033
	.byte	PAN	, c_v-14
	.byte	W12
	.byte		N09	, Dn4, v056
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
song032_4_1:
	.byte	W12
	.byte		N09	, Dn4, v056
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
	.byte	PATT	
		.word	song032_4_1
	.byte		N09	, Dn4, v056
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N36	
	.byte	W48
	.byte		N09	, An4, v100
	.byte		N09	, Cn5
	.byte	W12
	.byte		N04	, Gn4
	.byte		N04	, Bn4
	.byte	W04
	.byte			An4
	.byte		N04	, Cn5
	.byte	W04
	.byte			Gn4
	.byte		N04	, Bn4
	.byte	W04
	.byte		N23	, Fs4
	.byte		N23	, An4
	.byte	W24
	.byte		N09	, Fs4
	.byte		N09	, An4
	.byte	W12
	.byte		N04	, En4
	.byte		N04	, Gn4
	.byte	W04
	.byte			Fs4
	.byte		N04	, An4
	.byte	W04
	.byte			En4
	.byte		N04	, Gn4
	.byte	W04
	.byte		N09	, Dn4
	.byte		N09	, Fs4
	.byte	W12
	.byte			Dn4, v056
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte	PATT	
		.word	song032_4_1
	.byte	PATT	
		.word	song032_4_1
	.byte		N09	, Dn4, v056
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N09	
	.byte	W48
	.byte			Cn5, v100
	.byte		N09	, En5
	.byte	W12
	.byte			Bn4
	.byte		N09	, Dn5
	.byte	W12
	.byte			An4
	.byte		N09	, Cn5
	.byte	W12
	.byte			Gn4
	.byte		N09	, Bn4
	.byte	W12
	.byte			Fs4
	.byte		N09	, An4
	.byte	W24
	.byte		N12	
	.byte	W12
	.byte		N04	, Gn4
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte		N24	, Fs4
	.byte	W48
	.byte		N12	
	.byte	W12
	.byte		N04	, En4
	.byte	W04
	.byte			Fs4
	.byte	W04
	.byte			En4
	.byte	W04
	.byte		N12	, Cn4
	.byte	W12
	.byte		N24	
	.byte	W24
	.byte		N12	, Bn3
	.byte	W12
	.byte		N48	, Cn4
	.byte	W72
	.byte		N12	, Cn5
	.byte	W12
	.byte		N04	, Bn4
	.byte	W04
	.byte			Cn5
	.byte	W04
	.byte			Bn4
	.byte	W04
	.byte		N24	, An4
	.byte	W48
	.byte		N12	
	.byte	W12
	.byte		N04	, Gn4
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte		N12	, Fs4
	.byte	W12
	.byte		N24	, En4
	.byte	W24
	.byte		N12	, Dn4
	.byte	W12
	.byte		N48	, En4
	.byte	W72
	.byte	GOTO	
		.word	song032_4_2
	.byte	FINE

	@********************** Track  5 **********************@

	.global song032_5
song032_5:	@ 0x08560D19
	.byte	KEYSH	, 0
song032_5_3:
	.byte	VOICE	, 127
	.byte	VOL	, v033
	.byte	PAN	, c_v
	.byte		N06	, Fs2, v056
	.byte		N12	, Gn2, v080
	.byte	W12
	.byte		N06	, Fs2, v044
	.byte		N06	, Cn3, v060
	.byte	W06
	.byte			Fs2, v044
	.byte		N06	, Cs3, v080
	.byte	W06
	.byte			Fs2, v040
	.byte		N06	, Dn3, v084
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v088
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cn3, v092
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v096
	.byte	W12
song032_5_1:
	.byte		N06	, Fs2, v056
	.byte		N06	, Cn3, v100
	.byte	W12
	.byte			Fs2, v044
	.byte		N06	, Cn3, v060
	.byte	W06
	.byte			Fs2, v044
	.byte		N06	, Cs3, v080
	.byte	W06
	.byte			Fs2, v040
	.byte		N06	, Dn3, v084
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v088
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cn3, v092
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v096
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song032_5_1
	.byte		N06	, Fs2, v056
	.byte		N06	, Cn3, v100
	.byte	W12
	.byte			Fs2, v044
	.byte		N06	, Cn3, v060
	.byte	W06
	.byte			Fs2, v044
	.byte		N06	, Cs3, v080
	.byte	W06
	.byte			Fs2, v040
	.byte		N06	, Dn3, v084
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v088
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Ds4, v092
	.byte	W06
	.byte			Ds4, v020
	.byte	W06
	.byte			Fs2, v056
	.byte		N06	, Cs3, v096
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Ds4, v100
	.byte	W06
	.byte			Ds4, v024
	.byte	W06
	.byte			Fs2, v044
	.byte		N06	, Cn3, v060
	.byte	W06
	.byte			Fs2, v044
	.byte		N06	, Cs3, v080
	.byte	W06
	.byte			Fs2, v040
	.byte		N06	, Ds4, v084
	.byte	W06
	.byte			Ds4, v020
	.byte	W06
	.byte			Fs2, v056
	.byte		N06	, Cs3, v088
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Ds4, v092
	.byte	W06
	.byte			Ds4, v020
	.byte	W06
	.byte			Fs2, v056
	.byte		N06	, Dn3, v096
	.byte	W06
	.byte			Fs2, v040
	.byte		N06	, Dn3, v096
	.byte	W06
song032_5_2:
	.byte		N06	, Fs2, v056
	.byte		N12	, Gn2, v080
	.byte	W12
	.byte		N06	, Fs2, v044
	.byte		N06	, Cn3, v060
	.byte	W06
	.byte			Fs2, v044
	.byte		N06	, Cs3, v080
	.byte	W06
	.byte			Fs2, v040
	.byte		N06	, Dn3, v084
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v088
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cn3, v092
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v096
	.byte	W12
	.byte	PEND
	.byte			Fs2, v056
	.byte		N06	, Cn3, v100
	.byte	W12
	.byte			Fs2, v044
	.byte		N06	, Cn3, v060
	.byte	W06
	.byte			Fs2, v044
	.byte		N06	, Cs3, v080
	.byte	W06
	.byte			Fs2, v040
	.byte		N06	, Dn3, v084
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v088
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cn3, v092
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v096
	.byte	W06
	.byte			Cn3, v092
	.byte	W06
	.byte	PATT	
		.word	song032_5_1
	.byte		N06	, Fs2, v056
	.byte		N06	, Cn3, v100
	.byte	W12
	.byte			Fs2, v044
	.byte		N06	, Cn3, v060
	.byte	W06
	.byte			Fs2, v044
	.byte		N06	, Cs3, v080
	.byte	W06
	.byte			Fs2, v040
	.byte		N06	, Dn3, v084
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v088
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Ds4, v092
	.byte	W06
	.byte			Ds4, v028
	.byte	W06
	.byte			Fs2, v056
	.byte		N06	, Cs3, v096
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Ds4, v100
	.byte	W06
	.byte			Ds4, v028
	.byte	W06
	.byte			Fs2, v044
	.byte		N06	, Cn3, v060
	.byte	W06
	.byte			Fs2, v044
	.byte		N06	, Cs3, v080
	.byte	W06
	.byte			Fs2, v040
	.byte		N06	, Ds4, v084
	.byte	W06
	.byte			Ds4, v032
	.byte	W06
	.byte			Fs2, v056
	.byte		N06	, Ds4, v088
	.byte	W06
	.byte			Ds4, v032
	.byte	W06
	.byte			Fs2, v056
	.byte		N06	, Cn3, v092
	.byte	W06
	.byte			Fs2, v040
	.byte	W06
	.byte			Fs2, v056
	.byte		N06	, Ds4, v096
	.byte	W06
	.byte			Fs2, v040
	.byte		N06	, Ds4, v028
	.byte	W06
	.byte	PATT	
		.word	song032_5_2
	.byte	PATT	
		.word	song032_5_1
	.byte		N06	, Fs2, v056
	.byte		N06	, Cn3, v100
	.byte	W12
	.byte			Fs2, v044
	.byte		N06	, Cn3, v060
	.byte	W06
	.byte			Fs2, v044
	.byte		N06	, Cs3, v080
	.byte	W06
	.byte			Fs2, v040
	.byte		N06	, Dn3, v084
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v088
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cn3, v092
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v096
	.byte	W06
	.byte			Cs3, v092
	.byte	W06
	.byte	PATT	
		.word	song032_5_1
	.byte	PATT	
		.word	song032_5_1
	.byte		N06	, Fs2, v056
	.byte		N06	, Cn3, v100
	.byte	W12
	.byte			Fs2, v044
	.byte		N06	, Cn3, v060
	.byte	W06
	.byte			Fs2, v044
	.byte		N06	, Cs3, v080
	.byte	W06
	.byte			Fs2, v040
	.byte		N06	, Dn3, v084
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v088
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v092
	.byte	W06
	.byte			Fs2, v056
	.byte		N06	, Cs3, v096
	.byte	W06
	.byte			Fs2, v056
	.byte		N06	, Cn3, v096
	.byte	W06
	.byte			Fs2, v056
	.byte		N06	, Cn3, v096
	.byte	W06
	.byte	GOTO	
		.word	song032_5_3
	.byte	FINE

	.align 2
	.global song032
song032:	@ 0x08560F30
	.byte	5		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup056		@ voicegroup/tone

	.word	song032_1		@ track
	.word	song032_2		@ track
	.word	song032_3		@ track
	.word	song032_4		@ track
	.word	song032_5		@ track
