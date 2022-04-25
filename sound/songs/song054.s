	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song054_1
song054_1:	@ 0x0856DBCC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	W24
song054_1_1:
	.byte	VOICE	, 61
	.byte	VOL	, v051
	.byte	PAN	, c_v+18
	.byte		N68	, Dn2, v100
	.byte		N68	, Gn2, v116
	.byte	W72
	.byte		N06	, Gn2, v028
	.byte	W08
	.byte			Gn2, v092
	.byte		N06	, Cn3, v108
	.byte	W08
	.byte			Cn3, v084
	.byte		N06	, Fn3, v100
	.byte	W08
	.byte		N68	, Dn3, v084
	.byte		N68	, Gn3, v100
	.byte	W72
	.byte		N06	, Gn3, v028
	.byte	W96
	.byte	W96
	.byte	W24
	.byte			Gn2, v124
	.byte	W08
	.byte			Gn2, v036
	.byte	W08
	.byte			Dn2, v124
	.byte	W08
	.byte		N60	, Gn2
	.byte	W48
	.byte	W16
	.byte		N06	, Gn2, v036
	.byte	W08
	.byte			Dn3, v124
	.byte	W08
	.byte			Dn3, v036
	.byte	W08
	.byte			An2, v124
	.byte	W08
	.byte		N60	, Dn3
	.byte	W48
	.byte	W16
	.byte		N06	, Dn3, v036
	.byte	W80
	.byte	W48
	.byte		N23	, Fn3, v116
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte			Fn2
	.byte	W24
	.byte	GOTO	
		.word	song054_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song054_2
song054_2:	@ 0x0856DC2C
	.byte	KEYSH	, 0
	.byte	W24
song054_2_1:
	.byte	W72
	.byte	W96
	.byte	VOICE	, 48
	.byte	VOL	, v039
	.byte	PAN	, c_v-16
	.byte	W24
	.byte		N68	, An2, v092
	.byte		N68	, Dn3, v108
	.byte	W72
	.byte		N06	, Dn3, v028
	.byte	W08
	.byte			Dn3, v092
	.byte		N06	, Gn3, v108
	.byte	W08
	.byte			Gn3, v084
	.byte		N06	, Cn4, v104
	.byte	W08
	.byte		N68	, An3, v084
	.byte		N68	, Dn4, v104
	.byte	W72
	.byte		N06	, Dn4, v028
	.byte	W72
	.byte			Gn3, v096
	.byte	W08
	.byte			Gn3, v028
	.byte	W08
	.byte			Dn3, v096
	.byte	W08
	.byte		N60	, Gn3
	.byte	W64
	.byte		N06	, Gn3, v028
	.byte	W08
	.byte			Gn3, v096
	.byte	W08
	.byte			Gn3, v028
	.byte	W08
	.byte			Dn3, v096
	.byte	W08
	.byte		N36	, Gn3
	.byte	W36
	.byte	W03
	.byte		N06	, Gn3, v028
	.byte	W09
	.byte		N20	, Dn3, v080
	.byte		N23	, Gn3, v092
	.byte	W24
	.byte		N20	, Gn3, v076
	.byte		N23	, Cn4, v088
	.byte	W24
	.byte		N20	, Cn4, v068
	.byte		N23	, Fn4, v080
	.byte	W24
	.byte		N84	, Gn3, v076
	.byte		N84	, Cn4, v088
	.byte	W72
	.byte	W16
	.byte		N06	, Cn4, v028
	.byte	W08
	.byte	GOTO	
		.word	song054_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song054_3
song054_3:	@ 0x0856DCA2
	.byte	KEYSH	, 0
	.byte	W24
song054_3_3:
	.byte	VOICE	, 36
	.byte	VOL	, v056
	.byte	PAN	, c_v
	.byte		N07	, An1, v127
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W24
song054_3_1:
	.byte		N20	, An1, v127
	.byte	W24
	.byte		N07	, As1, v120
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte			As1, v124
	.byte	W24
	.byte	PEND
song054_3_2:
	.byte		N20	, As1, v116
	.byte	W24
	.byte		N07	, An1, v127
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song054_3_1
	.byte	PATT	
		.word	song054_3_2
	.byte	PATT	
		.word	song054_3_1
	.byte	PATT	
		.word	song054_3_2
	.byte	PATT	
		.word	song054_3_1
	.byte		N20	, As1, v116
	.byte	W24
	.byte	GOTO	
		.word	song054_3_3
	.byte	FINE

	@********************** Track  4 **********************@

	.global song054_4
song054_4:	@ 0x0856DCF1
	.byte	KEYSH	, 0
	.byte	W24
song054_4_1:
	.byte	VOICE	, 0
	.byte	VOL	, v056
	.byte	PAN	, c_v
	.byte		N06	, An2, v088
	.byte		N06	, Bn2, v108
	.byte		N06	, En3, v120
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte			An2, v084
	.byte		N06	, Bn2, v104
	.byte		N06	, En3, v112
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte			An2, v072
	.byte		N06	, Bn2, v100
	.byte		N06	, En3, v116
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte			An2, v080
	.byte		N06	, Bn2, v096
	.byte		N06	, En3, v108
	.byte	W08
	.byte			An2, v072
	.byte		N06	, Bn2, v104
	.byte		N06	, En3
	.byte	W08
	.byte			An2, v092
	.byte		N06	, Bn2, v084
	.byte		N06	, En3, v100
	.byte	W08
	.byte			As2, v076
	.byte		N06	, Cn3, v108
	.byte		N06	, Fn3
	.byte	W08
	.byte			Fn3, v028
	.byte	W16
	.byte			As2, v080
	.byte		N06	, Cn3, v100
	.byte		N06	, Fn3
	.byte	W08
	.byte			Fn3, v028
	.byte	W16
	.byte			As2, v088
	.byte		N06	, Cn3, v096
	.byte		N06	, Fn3, v100
	.byte	W08
	.byte			Fn3, v028
	.byte	W16
	.byte			As2, v084
	.byte		N06	, Cn3
	.byte		N06	, Fn3, v096
	.byte	W08
	.byte			As2, v076
	.byte		N06	, Cn3, v084
	.byte		N06	, Fn3, v104
	.byte	W08
	.byte			As2, v096
	.byte		N06	, Cn3, v092
	.byte		N06	, Fn3, v108
	.byte	W08
	.byte			An2, v096
	.byte		N06	, Bn2, v092
	.byte		N06	, En3, v120
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte			An2, v076
	.byte		N06	, Bn2, v088
	.byte		N06	, En3, v116
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte			An2, v088
	.byte		N06	, Bn2, v104
	.byte		N06	, En3, v120
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte			An2, v092
	.byte		N06	, Bn2, v108
	.byte		N06	, En3
	.byte	W08
	.byte			An2, v080
	.byte		N06	, Bn2, v108
	.byte		N06	, En3, v096
	.byte	W08
	.byte			An2, v076
	.byte		N06	, Bn2, v084
	.byte		N06	, En3, v108
	.byte	W08
	.byte			As2, v096
	.byte		N06	, Cn3, v092
	.byte		N06	, Fn3, v108
	.byte	W08
	.byte			Fn3, v028
	.byte	W16
	.byte			As2, v076
	.byte		N06	, Cn3, v104
	.byte		N06	, Fn3, v096
	.byte	W08
	.byte			Fn3, v028
	.byte	W16
	.byte			As2, v080
	.byte		N06	, Cn3, v100
	.byte		N06	, Fn3
	.byte	W08
	.byte			Fn3, v028
	.byte	W16
	.byte			As2, v080
	.byte		N06	, Cn3, v084
	.byte		N06	, Fn3, v092
	.byte	W08
	.byte			As2, v088
	.byte		N06	, Cn3, v092
	.byte		N06	, Fn3
	.byte	W08
	.byte			As2, v068
	.byte		N06	, Cn3, v104
	.byte		N06	, Fn3, v112
	.byte	W08
	.byte			An2, v088
	.byte		N06	, Bn2, v084
	.byte		N06	, En3, v116
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte			An2, v092
	.byte		N06	, Bn2, v104
	.byte		N06	, En3, v112
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte			An2, v080
	.byte		N06	, Bn2, v092
	.byte		N06	, En3, v108
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte			An2, v084
	.byte		N06	, Bn2
	.byte		N06	, En3, v112
	.byte	W08
	.byte			An2, v088
	.byte		N06	, Bn2, v104
	.byte		N06	, En3, v100
	.byte	W08
	.byte			An2, v080
	.byte		N06	, Bn2, v096
	.byte		N06	, En3
	.byte	W08
	.byte			As2, v084
	.byte		N06	, Cn3, v104
	.byte		N06	, Fn3, v116
	.byte	W08
	.byte			Fn3, v028
	.byte	W16
	.byte			As2, v072
	.byte		N06	, Cn3, v088
	.byte		N06	, Fn3, v112
	.byte	W08
	.byte			Fn3, v028
	.byte	W16
	.byte			As2, v092
	.byte		N06	, Cn3, v084
	.byte		N06	, Fn3, v096
	.byte	W08
	.byte			Fn3, v028
	.byte	W16
	.byte			As2, v076
	.byte		N06	, Cn3, v084
	.byte		N06	, Fn3, v112
	.byte	W08
	.byte			As2, v084
	.byte		N06	, Cn3, v088
	.byte		N06	, Fn3, v096
	.byte	W08
	.byte			As2, v080
	.byte		N06	, Cn3, v108
	.byte		N06	, Fn3, v092
	.byte	W08
	.byte			An2, v084
	.byte		N06	, Bn2, v100
	.byte		N06	, En3, v120
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte			An2, v072
	.byte		N06	, Bn2, v104
	.byte		N06	, En3, v092
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte			An2, v096
	.byte		N06	, Bn2, v084
	.byte		N06	, En3, v100
	.byte	W08
	.byte			En3, v028
	.byte	W16
	.byte			An2, v096
	.byte		N06	, Bn2
	.byte		N06	, En3, v104
	.byte	W08
	.byte			An2, v084
	.byte		N06	, Bn2, v108
	.byte		N06	, En3, v096
	.byte	W08
	.byte			An2, v080
	.byte		N06	, Bn2, v084
	.byte		N06	, En3, v108
	.byte	W08
	.byte			Cn3
	.byte		N06	, Fn3
	.byte	W08
	.byte			Fn3, v028
	.byte	W16
	.byte			Cn3, v096
	.byte		N06	, Fn3
	.byte	W08
	.byte			Fn3, v028
	.byte	W16
	.byte			Cn3, v096
	.byte		N06	, Fn3, v100
	.byte	W08
	.byte			Fn3, v028
	.byte	W16
	.byte			Cn3, v100
	.byte		N06	, Fn3, v112
	.byte	W08
	.byte			Cn3, v084
	.byte		N06	, Fn3, v104
	.byte	W08
	.byte			Cn3, v096
	.byte		N06	, Fn3, v120
	.byte	W08
	.byte	GOTO	
		.word	song054_4_1
	.byte	FINE

	@********************** Track  5 **********************@

	.global song054_5
song054_5:	@ 0x0856DEDA
	.byte	KEYSH	, 0
	.byte	W24
song054_5_2:
	.byte	VOICE	, 127
	.byte	VOL	, v041
	.byte	PAN	, c_v
	.byte		N07	, Fs1, v080
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W24
song054_5_1:
	.byte		N23	, As1, v060
	.byte	W24
	.byte		N07	, Fs1, v080
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song054_5_1
	.byte	PATT	
		.word	song054_5_1
	.byte	PATT	
		.word	song054_5_1
	.byte	PATT	
		.word	song054_5_1
	.byte	PATT	
		.word	song054_5_1
	.byte	PATT	
		.word	song054_5_1
	.byte		N23	, As1, v060
	.byte	W24
	.byte	GOTO	
		.word	song054_5_2
	.byte	FINE

	.align 2
	.global song054
song054:	@ 0x0856DF20
	.byte	5		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup018		@ voicegroup/tone

	.word	song054_1		@ track
	.word	song054_2		@ track
	.word	song054_3		@ track
	.word	song054_4		@ track
	.word	song054_5		@ track
