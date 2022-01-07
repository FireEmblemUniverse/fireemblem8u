	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song070_1
song070_1:	@ 0x08575144
	.byte	KEYSH	, 0
	.byte	TEMPO	, 50
	.byte	W96
	.byte	W96
	.byte	VOICE	, 48
	.byte	VOL	, v049
	.byte	PAN	, c_v-24
	.byte	W96
	.byte	W24
	.byte		N24	, Dn3, v100
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte			Fn3, v096
	.byte	W24
	.byte	TEMPO	, 50
	.byte			Gn3, v100
	.byte	W06
	.byte	TEMPO	, 50
	.byte	W06
	.byte	TEMPO	, 49
	.byte	W06
	.byte	TEMPO	, 49
	.byte	W06
	.byte	TEMPO	, 48
	.byte			An3
	.byte	W06
	.byte	TEMPO	, 47
	.byte	W06
	.byte	TEMPO	, 46
	.byte	W06
	.byte	TEMPO	, 46
	.byte	W06
	.byte	TEMPO	, 45
	.byte			Bn3
	.byte	W06
	.byte	TEMPO	, 45
	.byte	W06
	.byte	TEMPO	, 44
	.byte	W06
	.byte	TEMPO	, 43
	.byte	W06
	.byte	TEMPO	, 43
	.byte			Dn4
	.byte	W06
	.byte	TEMPO	, 42
	.byte	W06
	.byte	TEMPO	, 41
	.byte	W06
	.byte	TEMPO	, 40
	.byte	W06
song070_1_1:
	.byte	TEMPO	, 57
	.byte		N54	, Gn3, v068
	.byte		N54	, Cn4, v076
	.byte	W54
	.byte		N06	, Cn4, v028
	.byte	W06
	.byte		N12	, En3, v092
	.byte		N12	, Gn3, v072
	.byte	W12
	.byte		N21	, Gn3, v076
	.byte		N12	, Cn4
	.byte	W12
	.byte			Dn4, v072
	.byte	W12
	.byte		N24	, Gn3
	.byte		N24	, Bn3, v076
	.byte	W24
	.byte		N06	, Dn3, v064
	.byte		N06	, Gn3, v072
	.byte	W06
	.byte			Gn3, v028
	.byte	W06
	.byte		N54	, Bn2, v068
	.byte		N54	, Dn3
	.byte	W60
	.byte		N44	, Gn3, v072
	.byte		N48	, Cn4, v068
	.byte	W48
	.byte		N24	, En3, v060
	.byte		N21	, Gn3, v072
	.byte	W24
	.byte		N21	
	.byte		N12	, Cn4, v064
	.byte	W12
	.byte			Dn4, v072
	.byte	W12
	.byte		N24	, Gn3
	.byte		N24	, Bn3
	.byte	W24
	.byte		N06	, An3
	.byte		N06	, Cn4
	.byte	W06
	.byte			Cn4, v028
	.byte	W06
	.byte		N30	, Bn3, v060
	.byte		N30	, Dn4, v068
	.byte	W36
	.byte		N24	, Dn4, v064
	.byte		N24	, Gn4, v072
	.byte	W24
	.byte		N48	, Cn4, v076
	.byte		N48	, Fn4
	.byte	W48
	.byte		N36	, An3, v068
	.byte		N36	, Cn4
	.byte	W36
	.byte		N12	, Dn4, v060
	.byte	W12
	.byte		N48	, Cn4, v072
	.byte		N48	, En4
	.byte	W48
	.byte		N24	, Gn3, v060
	.byte		N24	, Cn4, v080
	.byte	W24
	.byte		N12	, Fn3, v064
	.byte		N12	, As3, v088
	.byte	W12
	.byte		N06	, Cn4, v072
	.byte	W06
	.byte			Dn4, v076
	.byte	W06
	.byte		N60	, As3, v084
	.byte		N60	, Ds4, v064
	.byte	W60
	.byte		N12	, Gn3
	.byte	W12
	.byte		N24	, As3, v084
	.byte		N24	, Ds4
	.byte	W24
	.byte		N48	, Cn4, v064
	.byte		N48	, Fn4, v072
	.byte	W48
	.byte		N24	, An3, v064
	.byte		N24	, Cn4, v072
	.byte	W24
	.byte			Fn3, v060
	.byte		N24	, An3, v064
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
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		TIE	, Dn3, v088
	.byte		TIE	, Gn3, v108
	.byte	W96
	.byte	W21
	.byte		EOT	, Dn3
	.byte			Gn3
	.byte	W03
	.byte		N24	, Dn3, v084
	.byte		N24	, Fs3, v104
	.byte	W24
	.byte			Dn3, v088
	.byte		N24	, Gn3, v104
	.byte	W24
	.byte			Gn3, v076
	.byte		N24	, Bn3, v092
	.byte	W24
	.byte			An3, v076
	.byte		N24	, Cn4, v092
	.byte	W24
	.byte		N48	, Fs3, v084
	.byte		N48	, An3, v104
	.byte	W48
	.byte		N06	, En3, v084
	.byte		N06	, Gn3, v104
	.byte	W06
	.byte			Gn3, v028
	.byte	W06
	.byte			Fs3, v084
	.byte		N06	, An3, v104
	.byte	W06
	.byte			An3, v028
	.byte	W06
	.byte		N80	, Gn3, v084
	.byte		N80	, Bn3, v096
	.byte	W80
	.byte	W01
	.byte		N06	, Bn3, v028
	.byte	W15
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W84
	.byte			Gn3, v060
	.byte		N06	, As3, v076
	.byte	W06
	.byte			Gs3, v056
	.byte		N06	, Cn4, v072
	.byte	W06
	.byte		N36	, As3, v060
	.byte		N36	, Cs4, v076
	.byte	W36
	.byte		N06	, Gs3, v060
	.byte		N06	, Cn4, v072
	.byte	W06
	.byte			Gn3, v060
	.byte		N06	, As3, v076
	.byte	W06
	.byte		N48	, Gs3, v060
	.byte		N48	, Cn4, v072
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 61
	.byte	VOL	, v049
	.byte	PAN	, c_v
	.byte	W96
	.byte		N06	, Fn3
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			Fn3, v080
	.byte	W06
	.byte			Fn3, v028
	.byte	W18
	.byte			As2, v100
	.byte		N06	, Fn3, v084
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			As2, v100
	.byte		N06	, Fn3, v076
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			As2, v096
	.byte		N06	, Fn3, v080
	.byte	W06
	.byte			Fn3, v028
	.byte	W18
	.byte			As2, v084
	.byte		N06	, Fn3, v076
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			Gs2, v084
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v088
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Gs2, v088
	.byte		N06	, Ds3, v076
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v088
	.byte		N06	, Ds3, v076
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v088
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Gs2, v088
	.byte		N06	, Ds3, v076
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			As2, v076
	.byte		N06	, Fn3, v072
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			As2, v092
	.byte		N06	, Fn3, v080
	.byte	W06
	.byte			Fn3, v028
	.byte	W18
	.byte			As2, v092
	.byte		N06	, Fn3, v072
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			As2, v092
	.byte		N06	, Fn3, v080
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			As2, v092
	.byte		N06	, Fn3, v080
	.byte	W06
	.byte			Fn3, v028
	.byte	W18
	.byte			As2, v092
	.byte		N06	, Fn3, v080
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			As2, v092
	.byte		N06	, Fn3, v088
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			As2, v084
	.byte		N06	, Fn3
	.byte	W06
	.byte			Fn3, v028
	.byte	W18
	.byte			As2, v088
	.byte		N06	, Fn3, v080
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			Gs2, v092
	.byte		N06	, Ds3, v084
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v096
	.byte		N06	, Ds3, v084
	.byte	W06
	.byte			Ds3, v028
	.byte	W30
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W24
	.byte	VOICE	, 48
	.byte	VOL	, v049
	.byte	PAN	, c_v-24
	.byte	W18
	.byte		N06	, Cs4, v068
	.byte		N06	, Fn4
	.byte	W06
	.byte		N84	, Cs4
	.byte		N84	, Fn4
	.byte	W48
	.byte	W36
	.byte		N06	, Fn4, v028
	.byte	W06
	.byte			Gs3, v068
	.byte		N06	, Cn4
	.byte	W06
	.byte		N84	, Gs3
	.byte		N84	, Cn4
	.byte	W48
	.byte	W36
	.byte		N06	, Cn4, v028
	.byte	W06
	.byte			Cs4, v068
	.byte		N06	, Fn4
	.byte	W06
	.byte		N84	, Cs4
	.byte		N84	, Fn4
	.byte	W48
	.byte	W36
	.byte		N06	, Fn4, v028
	.byte	W06
	.byte			Cn4, v068
	.byte	W06
	.byte		N24	, Gs3
	.byte		N24	, Cn4
	.byte	W24
	.byte		N24	
	.byte		N24	, Ds4
	.byte	W24
	.byte		N72	, As3, v052
	.byte		N72	, Cs4
	.byte	W72
	.byte		N06	, Cs4, v028
	.byte	W06
	.byte			Fs3, v052
	.byte		N06	, As3
	.byte	W06
	.byte			Gs3
	.byte		N06	, Cn4
	.byte	W06
	.byte			As3
	.byte		N06	, Cs4
	.byte	W06
	.byte		N84	, As3
	.byte		N84	, Cs4
	.byte	W84
	.byte		N06	, Cs4, v028
	.byte	W12
	.byte		N36	, Gs3, v052
	.byte		N36	, Cn4
	.byte	W36
	.byte		N06	, Gs3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte		N48	
	.byte		N48	, Ds4
	.byte	W48
	.byte			As3
	.byte		N48	, Dn4
	.byte	W48
	.byte		N24	, Fn3
	.byte		N24	, As3
	.byte	W24
	.byte			Dn3
	.byte		N24	, Fn3
	.byte	W24
	.byte		N30	, Ds3
	.byte		N30	, Fs3
	.byte	W30
	.byte		N06	, Fs3, v028
	.byte	W06
	.byte			Ds3, v052
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte		N24	, Ds3
	.byte		N24	, Fs3
	.byte	W24
	.byte		N06	, Fs3, v028
	.byte	W06
	.byte			Fs3, v052
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte		N48	
	.byte		N48	, Cs4
	.byte	W48
	.byte		N30	, Fs3
	.byte		N30	, As3
	.byte	W30
	.byte		N06	, As3, v028
	.byte	W06
	.byte			Gs3, v052
	.byte	W06
	.byte			As3
	.byte	W06
	.byte		N36	, Gs3
	.byte		N36	, Cn4
	.byte	W36
	.byte		N06	, As3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte		N24	
	.byte		N24	, Fn4
	.byte	W24
	.byte			Gs3
	.byte		N24	, Cn4
	.byte	W24
	.byte		N48	
	.byte		N48	, Ds4
	.byte	W48
	.byte		N24	, As3
	.byte		N24	, Cs4
	.byte	W24
	.byte			Gs3
	.byte		N24	, Cn4
	.byte	W24
	.byte		N72	, Fs3
	.byte		N72	, As3
	.byte	W72
	.byte		N06	, As3, v028
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	TEMPO	, 57
	.byte	W06
	.byte	TEMPO	, 57
	.byte	W06
	.byte	TEMPO	, 56
	.byte	W06
	.byte	TEMPO	, 56
	.byte	W06
	.byte	TEMPO	, 55
	.byte	W06
	.byte	TEMPO	, 55
	.byte	W06
	.byte	TEMPO	, 54
	.byte	W06
	.byte	TEMPO	, 53
	.byte	W06
	.byte	TEMPO	, 53
	.byte	W06
	.byte	TEMPO	, 52
	.byte	W06
	.byte	TEMPO	, 51
	.byte	W06
	.byte	TEMPO	, 50
	.byte	W06
	.byte	TEMPO	, 50
	.byte	W06
	.byte	TEMPO	, 50
	.byte	W06
	.byte	TEMPO	, 50
	.byte	W06
	.byte	TEMPO	, 49
	.byte	W06
	.byte	TEMPO	, 49
	.byte	W06
	.byte	TEMPO	, 48
	.byte	W06
	.byte	TEMPO	, 48
	.byte	W06
	.byte	TEMPO	, 47
	.byte	W06
	.byte	TEMPO	, 47
	.byte	W06
	.byte	TEMPO	, 46
	.byte	W06
	.byte	TEMPO	, 46
	.byte	W06
	.byte	TEMPO	, 45
	.byte	W06
	.byte	TEMPO	, 45
	.byte	W06
	.byte	TEMPO	, 44
	.byte	W06
	.byte	TEMPO	, 43
	.byte	W06
	.byte	TEMPO	, 43
	.byte	W06
	.byte	TEMPO	, 42
	.byte	W06
	.byte	TEMPO	, 41
	.byte	W06
	.byte	TEMPO	, 41
	.byte	W06
	.byte	TEMPO	, 40
	.byte	W06
	.byte	GOTO	
		.word	song070_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song070_2
song070_2:	@ 0x085754E1
	.byte	KEYSH	, 0
	.byte	VOICE	, 52
	.byte	VOL	, v049
	.byte	PAN	, c_v
	.byte		N88	, Ds1, v127
	.byte	W96
	.byte			Dn1
	.byte	W96
	.byte			Cn1
	.byte	W96
	.byte		N52	, Dn1
	.byte	W60
	.byte		N05	
	.byte	W12
	.byte			Ds1
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte		N44	, Gn1
	.byte	W48
	.byte		N11	, Gn0
	.byte	W24
	.byte			Gn1
	.byte	W24
song070_2_10:
	.byte	VOICE	, 52
	.byte	VOL	, v049
	.byte	PAN	, c_v
	.byte		N06	, Cn1, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Dn1
	.byte	W06
	.byte			En1
	.byte	W06
	.byte			Fs1
	.byte	W06
song070_2_1:
	.byte		N06	, Gn1, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn1
	.byte	W12
	.byte			Gn0
	.byte	W12
	.byte	PEND
song070_2_2:
	.byte		N06	, Cn1, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Dn1
	.byte	W06
	.byte			En1
	.byte	W06
	.byte			Fs1
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song070_2_1
song070_2_3:
	.byte		N06	, Fn0, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Fn1
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Cn1
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte	PEND
song070_2_4:
	.byte		N06	, En1, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Cn1
	.byte	W12
	.byte			En1
	.byte	W12
	.byte	PEND
song070_2_5:
	.byte		N06	, Ds1, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			As0
	.byte	W12
	.byte			Ds1
	.byte	W12
	.byte	PEND
song070_2_6:
	.byte		N06	, Fn1, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Cn1
	.byte	W12
	.byte			Fn0
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song070_2_2
	.byte	PATT	
		.word	song070_2_1
	.byte	PATT	
		.word	song070_2_2
	.byte	PATT	
		.word	song070_2_1
	.byte	PATT	
		.word	song070_2_3
	.byte	PATT	
		.word	song070_2_4
	.byte	PATT	
		.word	song070_2_5
	.byte	PATT	
		.word	song070_2_6
	.byte		N06	, Gn0, v127
	.byte	W12
	.byte		N06	
	.byte	W24
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
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte		N06	
	.byte	W24
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
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Fn1
	.byte	W12
	.byte			Ds1
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
song070_2_7:
	.byte		N06	, Dn1, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte			Cn1
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song070_2_7
	.byte		N92	, Gn1, v127
	.byte	W96
	.byte		N92	
	.byte	W96
	.byte		N68	, Gn0
	.byte	W72
	.byte		N21	, Dn1
	.byte	W24
	.byte		N68	, Gn1
	.byte	W72
	.byte		N12	, Gn0
	.byte	W12
	.byte			An0
	.byte	W12
	.byte		N92	, As0
	.byte	W96
	.byte		N92	
	.byte	W96
	.byte		N68	
	.byte	W72
	.byte		N21	, Fn1
	.byte	W24
	.byte		N92	, As1
	.byte	W96
	.byte		N32	, Ds1
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte		N32	, Fn1
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte	VOICE	, 62
	.byte	VOL	, v049
	.byte	PAN	, c_v+14
	.byte		N06	, Cs3, v104
	.byte	W06
	.byte			Cn3, v100
	.byte	W06
	.byte		N36	, Cs3
	.byte	W36
	.byte		N06	, Cs3, v028
	.byte	W12
	.byte			Cs3, v100
	.byte	W06
	.byte			Cs3, v028
	.byte	W06
	.byte			Cn3, v100
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			As2, v100
	.byte	W06
	.byte			As2, v028
	.byte	W06
song070_2_8:
	.byte		N24	, Cn3, v100
	.byte	W24
	.byte		N06	, Cn3, v028
	.byte	W12
	.byte		N30	, Cs3, v100
	.byte	W30
	.byte		N06	, Cs3, v028
	.byte	W06
	.byte		N24	, Ds3, v100
	.byte	W24
	.byte	PEND
	.byte		N06	, Fn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte		N36	, Fn3
	.byte	W36
	.byte		N06	, Fn3, v028
	.byte	W12
	.byte			Fn3, v100
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			Ds3, v100
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Cs3, v100
	.byte	W06
	.byte			Cs3, v028
	.byte	W06
	.byte		N24	, Ds3, v100
	.byte	W24
	.byte		N06	, Ds3, v028
	.byte	W12
	.byte		N30	, Fn3, v100
	.byte	W30
	.byte		N06	, Fn3, v028
	.byte	W06
	.byte		N24	, Fs3, v100
	.byte	W24
song070_2_9:
	.byte		N90	, Fn3, v100
	.byte	W90
	.byte		N06	, Fn3, v028
	.byte	W06
	.byte	PEND
	.byte	W96
	.byte	W96
	.byte	W96
	.byte			Cs3, v104
	.byte	W06
	.byte			Cn3, v100
	.byte	W06
	.byte		N36	, Cs3
	.byte	W36
	.byte		N06	, Cs3, v028
	.byte	W12
	.byte			Cs3, v100
	.byte	W06
	.byte			Cs3, v028
	.byte	W06
	.byte			Cn3, v100
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			As2, v100
	.byte	W06
	.byte			As2, v028
	.byte	W06
	.byte	PATT	
		.word	song070_2_8
	.byte		N90	, Cs3, v100
	.byte	W90
	.byte		N06	, Cs3, v028
	.byte	W06
	.byte	W84
	.byte			Cs3, v100
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte	PATT	
		.word	song070_2_9
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 52
	.byte	VOL	, v049
	.byte	PAN	, c_v
	.byte		N17	, Fs1, v116
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte		N17	, Ds1
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte			Fn1
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N05	, Fs1
	.byte	W12
	.byte			Gs1
	.byte	W12
	.byte		N17	, As1
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Gs1
	.byte	W12
	.byte		N17	, Fs1
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte		N17	, Ds1
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N05	, Fn1
	.byte	W12
	.byte			Fs1
	.byte	W12
	.byte		N17	, Gs1
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Fs1
	.byte	W12
	.byte		N17	, Fn1
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte	W12
	.byte	VOICE	, 49
	.byte	VOL	, v041
	.byte	PAN	, c_v-24
	.byte	W12
	.byte		N44	, Cn3, v072
	.byte		N44	, Ds3, v076
	.byte	W48
	.byte		N23	, As2, v064
	.byte		N23	, Cs3, v080
	.byte	W24
	.byte		N32	, Gs2, v072
	.byte		N32	, Cn3, v076
	.byte	W36
	.byte		N05	, Gs2, v072
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte		N44	
	.byte		N44	, Ds3, v076
	.byte	W48
	.byte		N80	, As2, v068
	.byte		N80	, Dn3
	.byte	W84
	.byte		N05	, As2, v072
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte		N23	, As2
	.byte		N23	, Dn3
	.byte	W24
	.byte		N23	
	.byte		N23	, Fn3
	.byte	W24
	.byte			As2
	.byte		N23	, Dn3, v076
	.byte	W24
	.byte			Fn2, v072
	.byte		N23	, As2, v080
	.byte	W24
	.byte		N92	, Gn2
	.byte	W24
	.byte		N23	, Cn3
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte		N11	, Fn3
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte		N92	, Fn2
	.byte	W24
	.byte		N23	, Dn3
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte			Fn3
	.byte	W24
	.byte		N68	, Gs2
	.byte	W24
	.byte		N23	, Gs3
	.byte	W24
	.byte			Fs3
	.byte	W24
	.byte			As2
	.byte		N23	, Fn3
	.byte	W24
	.byte		N92	, Cn3
	.byte		N44	, Ds3
	.byte	W48
	.byte			Fn3
	.byte	W48
	.byte		TIE	, Gn2
	.byte		N44	, An3
	.byte	W48
	.byte		N52	, Fn3
	.byte	W48
	.byte	W05
	.byte		EOT	, Gn2
	.byte	W01
	.byte		N06	, Gn2, v028
	.byte		N06	, Fn3
	.byte	W18
	.byte		N20	, Bn2, v080
	.byte		N20	, Dn3
	.byte	W24
	.byte		N20	
	.byte		N20	, Gn3
	.byte	W24
	.byte		N20	
	.byte		N20	, Bn3
	.byte	W24
	.byte	GOTO	
		.word	song070_2_10
	.byte	FINE

	@********************** Track  3 **********************@

	.global song070_3
song070_3:	@ 0x085757D1
	.byte	KEYSH	, 0
	.byte	VOICE	, 61
	.byte	VOL	, v049
	.byte	PAN	, c_v
	.byte		N72	, As2, v112
	.byte		N72	, Fn3
	.byte	W72
	.byte		N06	, Fn3, v032
	.byte	W12
	.byte			Fn2, v100
	.byte		N06	, As2
	.byte	W06
	.byte			As2, v096
	.byte		N06	, Fn3
	.byte	W06
	.byte		N90	, Fn3, v100
	.byte		N90	, As3
	.byte	W90
	.byte		N06	, As3, v032
	.byte	W06
	.byte		N42	, Ds3, v112
	.byte		N42	, Gs3
	.byte	W42
	.byte		N06	, Gs3, v032
	.byte	W06
	.byte		N18	, Dn3, v092
	.byte		N18	, Gn3
	.byte	W18
	.byte		N06	, Gn3, v032
	.byte	W06
	.byte		N18	, As2, v092
	.byte		N18	, Ds3
	.byte	W18
	.byte		N06	, Ds3, v032
	.byte	W06
	.byte		N42	, As2, v084
	.byte		N90	, Fn3
	.byte	W48
	.byte		N42	, Cn3
	.byte	W42
	.byte		N06	, Fn3, v032
	.byte	W06
	.byte		N90	, Dn3, v092
	.byte		N90	, Gn3
	.byte	W90
	.byte		N06	, Gn3, v032
	.byte	W06
song070_3_4:
	.byte	VOICE	, 51
	.byte	VOL	, v038
	.byte	PAN	, c_v-36
	.byte		N80	, En2, v068
	.byte	W84
	.byte		N05	, En2, v072
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte		N52	, Gn2, v068
	.byte	W60
	.byte		N11	, An2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte		N80	, En2, v076
	.byte	W84
	.byte		N05	, En2, v068
	.byte	W06
	.byte			Fs2, v072
	.byte	W06
	.byte		N32	, Gn2, v068
	.byte	W36
	.byte		N05	
	.byte	W06
	.byte			An2
	.byte	W06
	.byte		N40	, Bn2
	.byte	W48
	.byte		N92	, An2, v072
	.byte	W96
	.byte		N32	, Gn2, v068
	.byte	W36
	.byte		N05	, An2
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte		N44	, Cn3
	.byte	W48
	.byte			As2, v076
	.byte	W48
	.byte		N23	, Fn2, v068
	.byte	W24
	.byte			As2, v076
	.byte	W24
	.byte		N80	, Cn3, v068
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 61
	.byte	VOL	, v049
	.byte	PAN	, c_v
	.byte	W96
	.byte	W24
	.byte		N20	, Cn3, v076
	.byte		N20	, Fn3, v084
	.byte	W24
	.byte			An2, v076
	.byte		N20	, Cn3, v088
	.byte	W24
	.byte			Cn3, v076
	.byte		N20	, Fn3, v084
	.byte	W24
	.byte	W24
	.byte			Cn3, v076
	.byte		N20	, En3, v084
	.byte	W24
	.byte			Gn2, v076
	.byte		N20	, Cn3, v084
	.byte	W24
	.byte			Cn3, v076
	.byte		N20	, En3, v084
	.byte	W24
	.byte	W24
	.byte			As2, v076
	.byte		N20	, Ds3, v088
	.byte	W24
	.byte			Gn2, v076
	.byte		N20	, As2, v088
	.byte	W24
	.byte			As2, v076
	.byte		N20	, Ds3, v084
	.byte	W24
	.byte			Cn3, v076
	.byte		N20	, Fn3, v084
	.byte	W24
	.byte			Fn2, v076
	.byte		N20	, An2, v084
	.byte	W24
	.byte			An2, v076
	.byte		N20	, Cn3, v084
	.byte	W24
	.byte			Cn3, v072
	.byte		N20	, Fn3, v084
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N17	, Ds2, v060
	.byte		N17	, Gn2, v072
	.byte	W18
	.byte		N05	, Gn2, v028
	.byte	W06
	.byte		N17	, Gn2, v060
	.byte		N17	, As2, v072
	.byte	W18
	.byte		N06	, As2, v028
	.byte	W06
	.byte		N17	, As2, v060
	.byte		N17	, Ds3, v072
	.byte	W18
	.byte		N06	, Ds3, v028
	.byte	W06
	.byte	W24
	.byte		N17	, Dn2, v060
	.byte		N17	, Fn2, v072
	.byte	W18
	.byte		N06	, Fn2, v028
	.byte	W06
	.byte		N17	, Fn2, v060
	.byte		N17	, An2, v072
	.byte	W18
	.byte		N06	, An2, v028
	.byte	W06
	.byte		N17	, An2, v060
	.byte		N17	, Dn3, v072
	.byte	W18
	.byte		N06	, Dn3, v028
	.byte	W06
	.byte	W24
	.byte		N17	, Ds2, v060
	.byte		N17	, Gn2, v072
	.byte	W24
	.byte			As2
	.byte	W03
	.byte			Gn2, v060
	.byte	W21
	.byte			As2
	.byte		N17	, Ds3, v072
	.byte	W24
	.byte			Dn3, v060
	.byte		N17	, Fn3, v072
	.byte	W18
	.byte		N06	, Fn3, v028
	.byte	W06
	.byte		N17	, An2, v060
	.byte		N17	, Dn3, v072
	.byte	W18
	.byte		N06	, Dn3, v028
	.byte	W06
	.byte		N17	, Fn2, v060
	.byte		N17	, An2, v072
	.byte	W18
	.byte		N06	, An2, v028
	.byte	W06
	.byte		N17	, Dn2, v060
	.byte		N17	, Fn2, v072
	.byte	W18
	.byte		N06	, Fn2, v028
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N44	, As2, v072
	.byte	W60
	.byte		N05	, As2, v060
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			Ds3, v064
	.byte	W12
	.byte		N28	, As2, v072
	.byte		N28	, Dn3, v076
	.byte	W36
	.byte		N05	, Fn3, v072
	.byte	W12
	.byte		N44	, Fn3, v076
	.byte		N44	, As3, v068
	.byte	W48
	.byte	W24
	.byte		N40	, Gn3, v076
	.byte	W48
	.byte		N17	, Fn3, v060
	.byte		N17	, An3, v068
	.byte	W24
	.byte			As3
	.byte	W24
	.byte			Fn3, v064
	.byte	W24
	.byte			Dn3, v072
	.byte	W24
	.byte			As2
	.byte	W24
	.byte	W24
	.byte			Fn3
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 68
	.byte	VOL	, v038
	.byte	PAN	, c_v+22
	.byte		N14	, Fn3, v088
	.byte		N17	, As3, v108
	.byte	W18
	.byte		N05	, Gs3, v084
	.byte		N05	, Cn4, v104
	.byte	W06
	.byte		N06	, Cn4, v028
	.byte	W12
	.byte		N20	, As3, v088
	.byte		N23	, Cs4, v108
	.byte	W24
	.byte		N05	, Gs3, v084
	.byte		N05	, Cn4, v104
	.byte	W06
	.byte		N06	, Cn4, v028
	.byte	W06
	.byte		N17	, As3, v088
	.byte		N23	, Cs4, v108
	.byte	W24
	.byte		N14	, Gs3, v088
	.byte		N17	, Cn4, v108
	.byte	W18
	.byte		N05	, As3, v088
	.byte		N05	, Cs4, v108
	.byte	W06
	.byte		N06	, Cs4, v028
	.byte	W12
	.byte		N44	, Cn4, v088
	.byte		N44	, Ds4, v108
	.byte	W48
	.byte		N06	, Ds4, v028
	.byte	W12
	.byte		N14	, As3, v084
	.byte		N17	, Cs4, v104
	.byte	W18
	.byte		N05	, Cn4, v084
	.byte		N05	, Ds4, v104
	.byte	W06
	.byte		N06	, Ds4, v028
	.byte	W12
	.byte		N20	, Cs4, v088
	.byte		N23	, Fn4, v104
	.byte	W24
	.byte		N05	, Ds4, v084
	.byte		N05	, Fs4, v104
	.byte	W06
	.byte		N06	, Fs4, v028
	.byte	W06
	.byte		N17	, Cs4, v088
	.byte		N20	, Fn4, v100
	.byte	W24
	.byte			Cn4, v084
	.byte		N20	, Ds4, v104
	.byte	W24
	.byte			Ds4, v076
	.byte		N20	, Gs4, v096
	.byte	W24
	.byte			Cn4, v084
	.byte		N20	, Ds4, v104
	.byte	W24
	.byte			Gs3, v084
	.byte		N20	, Cn4, v104
	.byte	W24
	.byte	W96
	.byte	W96
	.byte		N14	, Fn3, v088
	.byte		N17	, As3, v108
	.byte	W18
	.byte		N05	, Gs3, v084
	.byte		N05	, Cn4, v104
	.byte	W06
	.byte		N06	, Cn4, v028
	.byte	W12
	.byte		N20	, As3, v088
	.byte		N23	, Cs4, v108
	.byte	W24
	.byte		N05	, Gs3, v084
	.byte		N05	, Cn4, v104
	.byte	W06
	.byte		N06	, Cn4, v028
	.byte	W06
	.byte		N17	, As3, v088
	.byte		N23	, Cs4, v108
	.byte	W24
	.byte		N17	, Gs3, v088
	.byte		N17	, Cn4, v108
	.byte	W18
	.byte		N05	, As3, v088
	.byte		N05	, Cs4, v108
	.byte	W06
	.byte		N06	, Cs4, v028
	.byte	W12
	.byte		N44	, Cn4, v088
	.byte		N52	, Ds4, v108
	.byte	W54
	.byte		N06	, Ds4, v028
	.byte	W06
	.byte	VOICE	, 61
	.byte	VOL	, v049
	.byte	PAN	, c_v
	.byte		N06	, Fn2, v072
	.byte		N06	, As2, v096
	.byte	W06
	.byte			As2, v028
	.byte	W06
	.byte			Fn2, v080
	.byte		N06	, As2, v096
	.byte	W06
	.byte			As2, v028
	.byte	W18
	.byte			Fn2, v084
	.byte		N06	, As2, v100
	.byte	W06
	.byte			As2, v028
	.byte	W06
	.byte			Fn2, v076
	.byte		N06	, As2, v100
	.byte	W06
	.byte			As2, v028
	.byte	W06
	.byte			Fn2, v080
	.byte		N06	, As2, v096
	.byte	W06
	.byte			As2, v028
	.byte	W18
	.byte			Fn2, v076
	.byte		N06	, As2, v084
	.byte	W06
	.byte			As2, v028
	.byte	W06
song070_3_1:
	.byte		N06	, Gs2, v084
	.byte		N06	, Cn3
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			Gs2, v080
	.byte		N06	, Cn3, v088
	.byte	W06
	.byte			Cn3, v028
	.byte	W18
	.byte			Gs2, v076
	.byte		N06	, Cn3, v088
	.byte	W06
	.byte			Cn3, v028
	.byte	W06
	.byte			Gs2, v076
	.byte		N06	, Ds3, v088
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v080
	.byte		N06	, Ds3, v088
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Gs2, v076
	.byte		N06	, Ds3, v088
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte	PEND
	.byte			Fn2, v072
	.byte		N06	, As2, v096
	.byte	W06
	.byte			As2, v028
	.byte	W06
	.byte			Fn2, v080
	.byte		N06	, As2, v096
	.byte	W06
	.byte			As2, v028
	.byte	W18
	.byte			Fn2, v084
	.byte		N06	, As2, v100
	.byte	W06
	.byte			As2, v028
	.byte	W06
	.byte			Fn2, v076
	.byte		N06	, As2, v100
	.byte	W06
	.byte			As2, v028
	.byte	W06
	.byte			Fn2, v080
	.byte		N06	, As2, v096
	.byte	W06
	.byte			As2, v028
	.byte	W18
	.byte			Fn2, v076
	.byte		N06	, As2, v084
	.byte	W06
	.byte			As2, v028
	.byte	W06
	.byte	PATT	
		.word	song070_3_1
song070_3_2:
	.byte		N05	, As2, v112
	.byte	W06
	.byte		N06	, As2, v028
	.byte	W06
	.byte		N05	, Fn2, v108
	.byte	W06
	.byte		N06	, Fn2, v028
	.byte	W06
	.byte		N05	, As2, v108
	.byte	W06
	.byte		N06	, As2, v028
	.byte	W06
	.byte		N36	, Ds3, v112
	.byte	W36
	.byte	W03
	.byte		N06	, Ds3, v028
	.byte	W09
	.byte		N05	, Cs3, v108
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte	PEND
	.byte		N28	, Fn3, v104
	.byte	W30
	.byte		N06	, Fn3, v028
	.byte	W06
	.byte		N36	, As2, v112
	.byte	W36
	.byte	W03
	.byte		N06	, As2, v028
	.byte	W09
	.byte		N05	, Dn3, v108
	.byte	W06
	.byte			Ds3, v112
	.byte	W06
	.byte		N24	, Gs3
	.byte	W24
	.byte	W03
	.byte		N06	, Gs3, v028
	.byte	W09
	.byte		N05	, Fs3, v108
	.byte	W06
	.byte			Fn3, v096
	.byte	W06
	.byte		N24	, Cs3, v108
	.byte	W24
	.byte	W03
	.byte		N06	, Cs3, v028
	.byte	W09
	.byte		N05	, Ds3, v112
	.byte	W06
	.byte		N06	, Ds3, v028
	.byte	W06
song070_3_3:
	.byte		N68	, Fn3, v104
	.byte	W72
	.byte		N06	, Fn3, v028
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song070_3_2
	.byte		N24	, Fn3, v104
	.byte	W24
	.byte	W03
	.byte		N06	, Fn3, v028
	.byte	W09
	.byte		N36	, As2, v112
	.byte	W36
	.byte	W03
	.byte		N06	, As2, v028
	.byte	W09
	.byte		N05	, Dn3, v108
	.byte	W06
	.byte			Ds3, v112
	.byte	W06
	.byte		N24	, Gs3
	.byte	W24
	.byte	W03
	.byte		N06	, Gs3, v028
	.byte	W09
	.byte		N05	, Fs3, v108
	.byte	W06
	.byte			Fn3, v096
	.byte	W06
	.byte		N24	, Ds3, v108
	.byte	W24
	.byte	W03
	.byte		N06	, Ds3, v028
	.byte	W09
	.byte		N05	, Cs3, v112
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte	PATT	
		.word	song070_3_3
	.byte	VOICE	, 68
	.byte	VOL	, v038
	.byte	PAN	, c_v+22
	.byte		N18	, As3, v084
	.byte	W18
	.byte		N12	, Cn4, v072
	.byte	W12
	.byte		N06	, Cn4, v028
	.byte	W06
	.byte		N24	, Cs4, v080
	.byte	W24
	.byte		N12	, As3, v076
	.byte	W12
	.byte			Cn4, v068
	.byte	W12
	.byte			Cs4, v076
	.byte	W12
	.byte		N42	, Ds4, v080
	.byte	W42
	.byte		N06	, Ds4, v028
	.byte	W06
	.byte		N24	, Cs4, v068
	.byte	W24
	.byte			Ds4
	.byte	W24
	.byte		N48	, Fn4, v076
	.byte	W48
	.byte		N42	, Cn4, v072
	.byte	W42
	.byte		N06	, Cn4, v028
	.byte	W06
	.byte		N24	, Dn4, v080
	.byte	W24
	.byte			As3, v068
	.byte	W24
	.byte			Fn3, v060
	.byte	W24
	.byte			Dn3, v068
	.byte	W24
	.byte		N30	, Ds3, v076
	.byte	W30
	.byte		N06	, Ds3, v028
	.byte	W06
	.byte			Ds3, v048
	.byte	W06
	.byte			Fn3, v052
	.byte	W06
	.byte		N24	, Gn3, v076
	.byte	W24
	.byte			An3, v064
	.byte	W24
	.byte		N48	, As3, v076
	.byte	W48
	.byte		N42	, Fn3, v060
	.byte	W42
	.byte		N06	, Fn3, v028
	.byte	W06
	.byte		N56	, Ds3, v076
	.byte	W60
	.byte		N12	, Ds3, v068
	.byte	W12
	.byte			Fn3, v064
	.byte	W12
	.byte			Gn3, v076
	.byte	W12
	.byte		TIE	, Fn3, v084
	.byte	W96
	.byte	W48
	.byte		EOT	
	.byte		N06	, Fn3, v028
	.byte	W12
	.byte		N12	, Fn3, v084
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			An3
	.byte	W12
	.byte		N44	, Bn3
	.byte	W48
	.byte			Dn4
	.byte	W48
	.byte	GOTO	
		.word	song070_3_4
	.byte	FINE

	@********************** Track  4 **********************@

	.global song070_4
song070_4:	@ 0x08575C67
	.byte	KEYSH	, 0
	.byte	VOICE	, 14
	.byte	VOL	, v049
	.byte	PAN	, c_v-35
	.byte		N44	, Ds3, v120
	.byte	W48
	.byte			As2
	.byte	W48
	.byte			Ds3
	.byte	W48
	.byte			As2
	.byte	W48
	.byte			Ds3
	.byte	W48
	.byte			As2, v116
	.byte	W48
	.byte			Ds3
	.byte	W48
	.byte			As2, v120
	.byte	W48
	.byte			Dn3
	.byte	W48
	.byte			Gn3
	.byte	W48
song070_4_3:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N23	, Ds3, v108
	.byte	W24
	.byte			As2
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte	W24
	.byte			Fn3
	.byte	W24
	.byte			Cn3, v104
	.byte	W24
	.byte			Fn3, v108
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N44	, Gn3, v116
	.byte	W96
	.byte			Gn3, v112
	.byte	W72
	.byte		N23	, Dn3, v108
	.byte	W24
	.byte		N44	, Gn3, v112
	.byte	W96
	.byte		N44	
	.byte	W72
	.byte		N23	, Dn3
	.byte	W24
	.byte		N44	, Gn3
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 62
	.byte	VOL	, v049
	.byte	PAN	, c_v+14
	.byte	W96
	.byte		N44	, Gn2, v072
	.byte	W60
	.byte		N05	, Gn2, v060
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Cn3, v064
	.byte	W12
	.byte		N28	, Gn2, v072
	.byte		N28	, Bn2, v076
	.byte	W36
	.byte		N05	, Bn2, v068
	.byte		N05	, Dn3, v072
	.byte	W12
	.byte		N44	, Dn3, v076
	.byte		N44	, Gn3, v068
	.byte	W48
	.byte	W48
	.byte		N17	, En3, v076
	.byte	W24
	.byte			Dn3, v060
	.byte		N17	, Fs3, v068
	.byte	W24
	.byte			Dn3, v064
	.byte		N17	, Gn3, v068
	.byte	W24
	.byte			Dn3, v076
	.byte	W24
	.byte			Bn2, v072
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 46
	.byte	VOL	, v049
	.byte	PAN	, c_v
	.byte	W96
song070_4_1:
	.byte		N05	, Cs4, v104
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte	PEND
song070_4_2:
	.byte		N05	, Cn4, v104
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song070_4_1
	.byte	PATT	
		.word	song070_4_2
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song070_4_1
	.byte	PATT	
		.word	song070_4_2
	.byte	PATT	
		.word	song070_4_1
	.byte	PATT	
		.word	song070_4_2
	.byte	PATT	
		.word	song070_4_1
	.byte	PATT	
		.word	song070_4_2
	.byte	PATT	
		.word	song070_4_1
	.byte	PATT	
		.word	song070_4_2
	.byte	VOICE	, 14
	.byte	VOL	, v049
	.byte	PAN	, c_v-35
	.byte		N44	, As3, v104
	.byte	W96
	.byte		N44	
	.byte	W96
	.byte		N44	
	.byte	W72
	.byte		N23	, Gs3
	.byte	W24
	.byte		N44	, As3
	.byte	W96
	.byte		N44	
	.byte	W96
	.byte		N44	
	.byte	W96
	.byte			Gs3
	.byte	W96
	.byte		N44	
	.byte	W48
	.byte			Cs4
	.byte	W48
	.byte	W96
	.byte	W96
	.byte			As3, v088
	.byte	W72
	.byte		N23	, Fn3
	.byte	W24
	.byte		N44	, As3
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte			Gn3, v096
	.byte	W48
	.byte			Dn3
	.byte	W48
	.byte	W24
	.byte		N23	, Gn3
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte	GOTO	
		.word	song070_4_3
	.byte	FINE

	@********************** Track  5 **********************@

	.global song070_5
song070_5:	@ 0x08575DC9
	.byte	KEYSH	, 0
	.byte	VOICE	, 62
	.byte	VOL	, v049
	.byte	PAN	, c_v+14
	.byte	W24
	.byte		N17	, Fn2, v060
	.byte		N17	, As2, v076
	.byte	W18
	.byte		N06	, As2, v032
	.byte	W06
	.byte		N17	, As2, v060
	.byte		N17	, Fn3, v076
	.byte	W18
	.byte		N06	, Fn3, v032
	.byte	W06
	.byte		N17	, Fn3, v060
	.byte		N17	, As3, v072
	.byte	W18
	.byte		N06	, As3, v032
	.byte	W06
	.byte	W24
	.byte		N17	, Cn3, v060
	.byte		N17	, Fn3, v076
	.byte	W18
	.byte		N06	, Fn3, v032
	.byte	W06
	.byte		N17	, Fn3, v060
	.byte		N17	, As3, v076
	.byte	W18
	.byte		N06	, As3, v032
	.byte	W06
	.byte		N17	, As3, v040
	.byte		N17	, Fn4, v056
	.byte	W18
	.byte		N06	, Fn4, v032
	.byte	W06
	.byte		N92	, As3, v040
	.byte		N92	, Ds4, v056
	.byte	W96
	.byte		N06	, Ds4, v032
	.byte	W24
	.byte		N17	, As3, v040
	.byte		N17	, Dn4, v056
	.byte	W18
	.byte		N06	, Dn4, v032
	.byte	W06
	.byte		N17	, Fn3, v060
	.byte		N17	, As3, v076
	.byte	W18
	.byte		N06	, As3, v032
	.byte	W06
	.byte		N17	, Dn3, v060
	.byte		N17	, Fn3, v076
	.byte	W18
	.byte		N06	, Fn3, v032
	.byte	W06
	.byte		N68	, Dn3, v060
	.byte		N68	, Gn3, v076
	.byte	W96
song070_5_3:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 68
	.byte	VOL	, v038
	.byte	PAN	, c_v+22
	.byte	W96
	.byte		N24	, Gn3, v092
	.byte		N30	, Cn4, v096
	.byte	W30
	.byte		N06	, Cn4, v028
	.byte	W06
	.byte		N32	, En3, v096
	.byte		N32	, Gn3
	.byte	W36
	.byte		N09	, Cn4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte		N24	, Gn3, v092
	.byte		N24	, Bn3, v096
	.byte	W24
	.byte		N06	, Dn3
	.byte		N06	, Gn3, v092
	.byte	W06
	.byte			Gn3, v028
	.byte	W06
	.byte		N54	, Bn2, v092
	.byte		N54	, Dn3
	.byte	W54
	.byte		N06	, Dn3, v028
	.byte	W06
	.byte		N30	, Gn3, v096
	.byte		N30	, Cn4, v092
	.byte	W30
	.byte		N06	, Cn4, v028
	.byte	W06
	.byte		N21	, En3, v092
	.byte		N21	, Gn3
	.byte	W24
	.byte		N09	
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte		N24	, Gn3
	.byte		N24	, Bn3, v096
	.byte	W24
	.byte		N06	, An3
	.byte		N06	, Cn4
	.byte	W06
	.byte			Cn4, v028
	.byte	W06
	.byte		N30	, Bn3, v092
	.byte		N30	, Dn4
	.byte	W36
	.byte		N18	
	.byte		N24	, Gn4, v096
	.byte	W24
	.byte		N42	, Cn4
	.byte		N48	, Fn4
	.byte	W48
	.byte		N32	, An3, v092
	.byte		N32	, Cn4
	.byte	W36
	.byte		N12	, Dn4
	.byte	W12
	.byte		N42	, Cn4
	.byte		N48	, En4, v096
	.byte	W48
	.byte		N18	, Gn3, v092
	.byte		N18	, Cn4, v096
	.byte	W24
	.byte		N12	, Fn3, v088
	.byte		N12	, As3, v092
	.byte	W12
	.byte		N06	, Cn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte		N54	, As3, v096
	.byte		N54	, Ds4
	.byte	W60
	.byte		N12	, Gn3, v092
	.byte	W12
	.byte		N24	, As3, v096
	.byte		N24	, Ds4
	.byte	W24
	.byte		N44	, Cn4, v092
	.byte		N48	, Fn4, v096
	.byte	W48
	.byte		N21	, An3, v092
	.byte		N24	, Cn4, v096
	.byte	W24
	.byte		N21	, Fn3, v092
	.byte		N24	, An3
	.byte	W24
	.byte	VOICE	, 57
	.byte	VOL	, v049
	.byte	PAN	, c_v+12
	.byte		N32	, Gn2, v096
	.byte		N32	, Bn2
	.byte	W36
	.byte		N06	, Gn2, v092
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte		N15	, Dn3
	.byte	W15
	.byte		N06	, Dn3, v028
	.byte	W09
	.byte		N15	, Gn3, v096
	.byte	W15
	.byte		N06	, Gn3, v028
	.byte	W09
	.byte		N84	, Cn3, v072
	.byte	W84
	.byte		N06	, Cn3, v028
	.byte	W12
	.byte		N32	, Gn2, v096
	.byte		N32	, Bn2
	.byte	W36
	.byte		N06	, Gn2, v092
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte		N15	, Dn3
	.byte	W15
	.byte		N06	, Dn3, v028
	.byte	W09
	.byte		N15	, Gn3, v096
	.byte	W15
	.byte		N06	, Gn3, v028
	.byte	W09
	.byte		N42	, Fn3, v068
	.byte	W42
	.byte		N06	, Fn3, v028
	.byte	W06
	.byte		N42	, Cn3, v068
	.byte	W42
	.byte		N06	, Cn3, v028
	.byte	W06
	.byte		N32	, Ds3, v092
	.byte		N32	, Gn3
	.byte	W36
	.byte		N06	, Ds3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte		N15	, Gn3
	.byte	W15
	.byte		N06	, Gn3, v028
	.byte	W09
	.byte		N15	, An3, v092
	.byte	W15
	.byte		N06	, An3, v028
	.byte	W09
	.byte		N36	, Fn3, v092
	.byte	W36
	.byte		N06	, Gn3, v088
	.byte	W06
	.byte			Gn3, v028
	.byte	W06
	.byte		N36	, Fn3, v092
	.byte	W36
	.byte		N06	, Fn3, v028
	.byte	W12
	.byte		N48	, Ds3, v092
	.byte	W48
	.byte		N06	, Ds3, v028
	.byte	W12
	.byte			Ds3, v092
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte		N12	, Fn3, v092
	.byte	W12
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte		N48	, Dn3, v092
	.byte	W48
	.byte		N18	, Ds3
	.byte	W18
	.byte		N06	, Ds3, v028
	.byte	W06
	.byte		N18	, Fn3, v092
	.byte	W18
	.byte		N06	, Fn3, v028
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 14
	.byte	VOL	, v049
	.byte	PAN	, c_v-35
	.byte		N44	, As3, v104
	.byte	W72
	.byte		N23	, Fn3, v092
	.byte	W24
	.byte		N44	, As3, v108
	.byte	W96
	.byte		N44	
	.byte	W96
	.byte		N44	
	.byte	W96
	.byte	W24
	.byte		N23	, Fn3
	.byte	W24
	.byte			As3
	.byte	W24
	.byte			Fn3
	.byte	W24
	.byte	VOICE	, 49
	.byte	VOL	, v041
	.byte	PAN	, c_v-24
	.byte		N06	, As2, v096
	.byte		N06	, Fn3, v072
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			As2, v096
	.byte		N06	, Fn3, v080
	.byte	W06
	.byte			Fn3, v028
	.byte	W18
	.byte			As2, v088
	.byte		N06	, Fn3, v084
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			As2, v088
	.byte		N06	, Fn3, v076
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			As2, v088
	.byte		N06	, Fn3, v080
	.byte	W06
	.byte			Fn3, v028
	.byte	W18
	.byte			As2, v084
	.byte		N06	, Fn3, v076
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			Gs2, v084
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v088
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Gs2, v088
	.byte		N06	, Ds3, v076
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Fs2, v088
	.byte		N06	, Cs3, v076
	.byte	W06
	.byte			Cs3, v028
	.byte	W06
	.byte			Fs2, v088
	.byte		N06	, Cs3, v080
	.byte	W06
	.byte			Cs3, v028
	.byte	W18
	.byte			Gs2, v088
	.byte		N06	, Ds3, v076
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			As2, v076
	.byte		N06	, Fn3, v072
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			As2, v092
	.byte		N06	, Fn3, v080
	.byte	W06
	.byte			Fn3, v028
	.byte	W18
	.byte			As2, v092
	.byte		N06	, Fn3, v072
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			As2, v092
	.byte		N06	, Fn3, v080
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			As2, v092
	.byte		N06	, Fn3, v080
	.byte	W06
	.byte			Fn3, v028
	.byte	W18
	.byte			As2, v092
	.byte		N06	, Fn3, v080
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			Gs2, v076
	.byte		N06	, Ds3, v088
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v084
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Gs2, v088
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v092
	.byte		N06	, Ds3, v084
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v096
	.byte		N06	, Ds3, v084
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Gs2, v084
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte		TIE	, Fn2, v080
	.byte	W96
	.byte	W78
	.byte	W01
	.byte		EOT	
	.byte	W05
	.byte		N05	, Fn2, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		TIE	, Fn2, v084
	.byte	W96
	.byte	W64
	.byte	W01
	.byte		EOT	
	.byte	W07
	.byte		N06	, As2, v088
	.byte		N06	, Fn3, v076
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			Gs2, v096
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Fs2, v092
	.byte		N06	, Cs3, v096
	.byte	W06
	.byte			Cs3, v028
	.byte	W06
	.byte			Fs2, v088
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v028
	.byte	W18
	.byte			Fs2, v084
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v028
	.byte	W06
	.byte			Fs2, v088
	.byte		N06	, Cs3, v084
	.byte	W06
	.byte			Cs3, v028
	.byte	W06
	.byte			Fs2, v084
	.byte		N06	, Cs3, v068
	.byte	W06
	.byte			Cs3, v028
	.byte	W18
	.byte			Fs2, v080
	.byte		N06	, Cs3
	.byte	W06
	.byte			Cs3, v028
	.byte	W06
	.byte			Gs2, v088
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v092
	.byte		N06	, Ds3, v076
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Gs2, v096
	.byte		N06	, Ds3, v084
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v084
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v088
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Gs2, v084
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Fs2, v084
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Fs2, v084
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Fs2, v084
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Fs2, v084
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Fs2, v080
	.byte		N06	, Ds3, v076
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Fs2, v084
	.byte		N06	, Ds3, v076
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v084
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v084
	.byte		N06	, Ds3, v076
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Gs2, v096
	.byte		N06	, Ds3, v084
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v100
	.byte		N06	, Ds3, v084
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte			Gs2, v096
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte			Ds3, v028
	.byte	W18
	.byte			Gs2, v084
	.byte		N06	, Ds3, v076
	.byte	W06
	.byte			Ds3, v028
	.byte	W06
	.byte		TIE	, Fn2, v084
	.byte	W96
	.byte	W92
	.byte		EOT	
	.byte	W04
	.byte		N92	
	.byte	W96
	.byte	VOICE	, 57
	.byte	VOL	, v049
	.byte	PAN	, c_v+12
	.byte	W96
song070_5_1:
	.byte		N05	, Cs3, v064
	.byte	W12
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte	PEND
song070_5_2:
	.byte		N05	, As2, v064
	.byte	W12
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte	PEND
	.byte			Cn3
	.byte	W12
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte	PATT	
		.word	song070_5_1
	.byte	PATT	
		.word	song070_5_2
	.byte		N05	, Cn3, v064
	.byte	W12
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte		N05	
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte	W96
	.byte	VOICE	, 46
	.byte	VOL	, v049
	.byte	PAN	, c_v
	.byte	W96
	.byte		N05	, Dn4, v096
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte	W96
	.byte	W96
	.byte			Gs3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte		N11	, Dn4
	.byte	W96
	.byte	GOTO	
		.word	song070_5_3
	.byte	FINE

	@********************** Track  6 **********************@

	.global song070_6
song070_6:	@ 0x085762CB
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 57
	.byte	VOL	, v049
	.byte	PAN	, c_v+12
	.byte	W96
song070_6_3:
	.byte		N06	, Gn2, v080
	.byte		N06	, Cn3
	.byte	W12
	.byte			Gn2, v084
	.byte		N06	, Cn3, v080
	.byte	W24
	.byte			Gn2, v084
	.byte		N06	, Cn3, v080
	.byte	W24
	.byte			Gn2, v084
	.byte		N06	, Cn3, v080
	.byte	W24
	.byte			Gn2, v084
	.byte		N06	, Cn3, v080
	.byte	W12
	.byte			Gn2
	.byte		N06	, Bn2
	.byte	W12
	.byte			Gn2
	.byte		N06	, Bn2
	.byte	W24
	.byte			Gn2, v084
	.byte		N06	, Bn2, v080
	.byte	W24
	.byte			Gn2
	.byte		N06	, Bn2
	.byte	W24
	.byte			Gn2
	.byte		N06	, Bn2
	.byte	W12
	.byte			Gn2
	.byte		N06	, Cn3
	.byte	W12
	.byte			Gn2
	.byte		N06	, Cn3
	.byte	W24
	.byte			Gn2, v084
	.byte		N06	, Cn3, v080
	.byte	W24
	.byte			Gn2
	.byte		N06	, Cn3
	.byte	W24
	.byte			Gn2, v084
	.byte		N06	, Cn3, v076
	.byte	W12
	.byte			Gn2, v080
	.byte		N06	, Bn2
	.byte	W12
	.byte			Gn2
	.byte		N06	, Bn2
	.byte	W24
	.byte			Gn2
	.byte		N06	, Bn2
	.byte	W24
	.byte			Gn2
	.byte		N06	, Bn2
	.byte	W24
	.byte			Gn2
	.byte		N06	, Bn2
	.byte	W12
	.byte		N92	, Fn2, v072
	.byte		N92	, An2, v064
	.byte	W96
	.byte			En2, v072
	.byte		N44	, Gn2, v064
	.byte	W48
	.byte		N23	
	.byte	W24
	.byte			An2
	.byte	W24
	.byte		N92	, Ds2, v072
	.byte		N92	, As2, v088
	.byte	W96
	.byte			Fn2, v084
	.byte		N44	, Cn3
	.byte	W48
	.byte			Dn3
	.byte	W48
	.byte	VOICE	, 49
	.byte	VOL	, v041
	.byte	PAN	, c_v-24
	.byte		N68	, Cn3, v068
	.byte		N68	, En3
	.byte	W72
	.byte		N11	, En3, v072
	.byte	W12
	.byte			Fs3, v084
	.byte	W12
	.byte		N88	, Dn3, v076
	.byte		N88	, Gn3, v068
	.byte	W90
	.byte		N05	, Gn3, v028
	.byte	W06
	.byte		N56	, Cn3, v072
	.byte		N23	, Dn3, v076
	.byte	W24
	.byte		N32	, En3
	.byte	W36
	.byte		N11	, Cn3, v068
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Fs3, v080
	.byte	W12
	.byte		N56	, Dn3, v056
	.byte		N56	, Gn3, v076
	.byte	W60
	.byte		N11	, Gn3, v068
	.byte	W12
	.byte			An3, v076
	.byte	W12
	.byte			Bn3, v084
	.byte	W12
	.byte		N92	, Fn3, v076
	.byte		N44	, Dn4, v056
	.byte	W48
	.byte			Cn4
	.byte	W48
	.byte		N92	, En3, v076
	.byte		N44	, Gn3, v064
	.byte	W48
	.byte			Cn4, v068
	.byte	W48
	.byte		N88	, Ds3, v072
	.byte		N68	, As3, v080
	.byte	W72
	.byte		N23	, Gn3, v072
	.byte	W24
	.byte			An3, v084
	.byte	W24
	.byte			Fn3, v064
	.byte	W24
	.byte			Cn3, v056
	.byte		N23	, Fn3, v064
	.byte	W24
	.byte		N05	, Cn3
	.byte		N05	, Ds3
	.byte	W06
	.byte			Dn3
	.byte		N05	, Fn3
	.byte	W06
	.byte			Ds3
	.byte		N05	, Gn3
	.byte	W06
	.byte			Fn3
	.byte		N05	, An3
	.byte	W06
	.byte		N56	, Gn3
	.byte		N56	, Bn3, v068
	.byte	W60
	.byte		N11	, Dn3, v076
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			Bn3, v080
	.byte	W12
	.byte		N32	, Fn3, v068
	.byte		N32	, An3, v104
	.byte	W36
	.byte		N05	
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte		N44	, An3, v068
	.byte		N44	, Cn4, v104
	.byte	W48
	.byte		N56	, Gn3, v068
	.byte		N56	, Bn3, v076
	.byte	W60
	.byte		N11	, Dn3, v084
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			Bn3, v080
	.byte	W12
	.byte		N32	, Fn3, v068
	.byte		N32	, An3, v104
	.byte	W36
	.byte		N05	, Gn3, v068
	.byte		N05	, Bn3, v100
	.byte	W06
	.byte		N06	, Bn3, v028
	.byte	W06
	.byte		N44	, Fn3, v068
	.byte		N44	, An3, v100
	.byte	W48
	.byte	VOICE	, 51
	.byte	VOL	, v038
	.byte	PAN	, c_v-36
	.byte		N92	, Ds2, v112
	.byte	W96
	.byte			Dn2
	.byte	W96
	.byte			Cn2, v108
	.byte	W96
	.byte		N44	, Dn2, v112
	.byte	W48
	.byte			An2
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N92	, Fn2, v092
	.byte		N92	, As2, v108
	.byte	W96
	.byte	W24
	.byte		N24	, Fn2, v100
	.byte		N24	, An2, v116
	.byte	W24
	.byte			Fn2, v100
	.byte		N24	, As2, v116
	.byte	W24
	.byte			As2, v096
	.byte		N24	, Dn3
	.byte	W24
	.byte			Cn3, v088
	.byte		N24	, Ds3, v108
	.byte	W24
	.byte		N48	, An2, v092
	.byte		N48	, Cn3, v108
	.byte	W48
	.byte		N06	, Gn2, v096
	.byte		N06	, As2, v116
	.byte	W06
	.byte			As2, v024
	.byte	W06
	.byte			An2, v096
	.byte		N06	, Cn3, v116
	.byte	W06
	.byte			Cn3, v024
	.byte	W06
	.byte		N80	, As2, v092
	.byte		N80	, Dn3, v108
	.byte	W80
	.byte	W01
	.byte		N06	, Dn3, v028
	.byte	W15
	.byte	W96
song070_6_1:
	.byte		N76	, As1, v100
	.byte	W84
	.byte		N05	
	.byte	W12
	.byte	PEND
song070_6_2:
	.byte		N44	, Gs1, v100
	.byte	W48
	.byte		N20	, Fs1
	.byte	W24
	.byte			Gs1
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song070_6_1
	.byte	PATT	
		.word	song070_6_2
	.byte	PATT	
		.word	song070_6_1
	.byte		N76	, As1, v100
	.byte	W84
	.byte		N05	, Fn1
	.byte	W12
	.byte	PATT	
		.word	song070_6_1
	.byte		N76	, As1, v100
	.byte	W84
	.byte		N05	, Gs1
	.byte	W12
	.byte		N76	, Fs1
	.byte	W84
	.byte		N05	
	.byte	W12
	.byte		N64	
	.byte	W72
	.byte		N05	
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte		N76	, Ds1
	.byte	W84
	.byte		N05	, As0
	.byte	W12
	.byte		N76	, Ds1
	.byte	W84
	.byte		N05	
	.byte	W12
	.byte	PATT	
		.word	song070_6_1
	.byte		N76	, As1, v100
	.byte	W96
	.byte	PATT	
		.word	song070_6_1
	.byte		N76	, Gs1, v100
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N92	, Fs2, v092
	.byte	W96
	.byte		N72	, Ds2, v108
	.byte	W78
	.byte		N05	
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte			Cn2
	.byte	W06
	.byte		TIE	, As1, v092
	.byte	W96
	.byte	W17
	.byte		EOT	
	.byte	W07
	.byte		N23	, As1, v080
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Dn2, v092
	.byte	W24
	.byte		N92	, Ds2, v084
	.byte	W96
	.byte			Dn2, v076
	.byte	W96
	.byte		N68	, Cs2, v080
	.byte	W72
	.byte		N21	, Ds2
	.byte	W24
	.byte		N92	, Fn2
	.byte	W96
	.byte		TIE	, Dn2
	.byte	W96
	.byte	W03
	.byte		EOT	
	.byte	W03
	.byte		N06	, Dn2, v028
	.byte	W18
	.byte		N21	, Dn2, v072
	.byte	W24
	.byte		N21	
	.byte		N21	, Gn2
	.byte	W24
	.byte		N21	
	.byte		N21	, Dn3
	.byte	W24
	.byte	GOTO	
		.word	song070_6_3
	.byte	FINE

	@********************** Track  7 **********************@

	.global song070_7
song070_7:	@ 0x0857652D
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 47
	.byte	VOL	, v049
	.byte	PAN	, c_v+10
	.byte	W96
	.byte	W72
	.byte		N04	, Cn3, v080
	.byte	W04
	.byte			Cn3, v088
	.byte	W04
	.byte			Cn3, v100
	.byte	W04
	.byte			Cn3, v104
	.byte	W04
	.byte			Cn3, v112
	.byte	W04
	.byte			Cn3, v116
	.byte	W04
song070_7_1:
	.byte		N24	, Cn3, v120
	.byte	W84
	.byte		N12	, Gn2
	.byte	W12
	.byte	PEND
	.byte		N24	
	.byte	W84
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PATT	
		.word	song070_7_1
	.byte		N24	, Gn2, v120
	.byte	W84
	.byte		N06	, Cn3
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N24	
	.byte	W72
	.byte		N24	
	.byte	W24
	.byte		N24	
	.byte	W96
	.byte			Gn2
	.byte	W96
	.byte			Fn2
	.byte	W72
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
song070_7_2:
	.byte		N24	, Cn3, v120
	.byte	W84
	.byte		N12	, Fs2
	.byte	W12
	.byte	PEND
	.byte		N24	
	.byte	W96
	.byte	PATT	
		.word	song070_7_2
	.byte		N24	, Fs2, v120
	.byte	W96
	.byte		N32	, Fn2, v112
	.byte	W36
	.byte		N04	, Fn2, v100
	.byte	W12
	.byte		N32	, Fn2, v112
	.byte	W48
	.byte		N24	, Cn3
	.byte	W36
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N06	, Cn3, v108
	.byte	W12
	.byte		N24	
	.byte	W36
	.byte		N16	
	.byte	W24
	.byte		N15	, Cn3, v112
	.byte	W24
	.byte		N04	
	.byte	W12
	.byte		N24	
	.byte	W36
	.byte		N14	, Cn3, v108
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte			Fn2, v112
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
song070_7_3:
	.byte		N24	, Gn2, v112
	.byte	W36
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N06	, Gn2, v108
	.byte	W12
	.byte	PEND
song070_7_4:
	.byte		N08	, Gn2, v112
	.byte	W12
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N06	, Gn2, v108
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song070_7_3
	.byte	PATT	
		.word	song070_7_4
	.byte	PATT	
		.word	song070_7_3
	.byte	PATT	
		.word	song070_7_4
	.byte	PATT	
		.word	song070_7_3
	.byte		N08	, Fn2, v112
	.byte	W12
	.byte		N17	
	.byte	W24
	.byte		N17	
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte		N05	, Fn2, v108
	.byte	W06
	.byte			Fn2, v080
	.byte	W06
	.byte			Fn2, v092
	.byte	W06
	.byte			Fn2, v108
	.byte	W06
song070_7_5:
	.byte		N11	, Gn2, v112
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte		N05	, Gn2, v108
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N11	, Gn2, v112
	.byte	W12
	.byte		N11	
	.byte	W36
	.byte	PEND
song070_7_6:
	.byte		N11	, Gn2, v112
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte		N05	, Gn2, v108
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song070_7_5
	.byte	PATT	
		.word	song070_7_6
song070_7_7:
	.byte		N11	, As2, v112
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte		N05	, As2, v108
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N11	, As2, v112
	.byte	W12
	.byte		N11	
	.byte	W36
	.byte	PEND
song070_7_8:
	.byte		N11	, As2, v112
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte		N05	, As2, v108
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song070_7_7
	.byte	PATT	
		.word	song070_7_8
	.byte		N11	, As2, v112
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte		N11	
	.byte	W24
	.byte		N05	, Fn2, v108
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N23	, As2, v104
	.byte	W84
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N23	
	.byte	W36
	.byte		N23	
	.byte	W60
	.byte		N23	
	.byte	W48
	.byte		N23	
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N23	
	.byte	W48
	.byte		N23	
	.byte	W24
	.byte		N23	
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte		N05	, Gs2, v084
	.byte	W06
	.byte			Gs2, v096
	.byte	W06
	.byte			Gs2, v104
	.byte	W06
	.byte			Gs2, v112
	.byte	W06
song070_7_9:
	.byte		N23	, As2, v116
	.byte	W84
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PEND
	.byte		N23	, Gs2
	.byte	W96
song070_7_10:
	.byte		N23	, Gs2, v116
	.byte	W84
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PEND
	.byte		N23	, As2
	.byte	W48
	.byte		N23	
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PATT	
		.word	song070_7_9
	.byte		N23	, Gs2, v116
	.byte	W96
	.byte	PATT	
		.word	song070_7_10
	.byte		N23	, Fn2, v116
	.byte	W48
	.byte		N23	
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N44	, Gn2, v096
	.byte	W48
	.byte		N44	
	.byte	W48
	.byte		N23	
	.byte	W24
	.byte		N23	
	.byte	W24
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte	GOTO	
		.word	song070_7_1
	.byte	FINE

	@********************** Track  8 **********************@

	.global song070_8
song070_8:	@ 0x08576723
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v038
	.byte	PAN	, c_v
	.byte	W96
	.byte	W24
	.byte		TIE	, En2, v088
	.byte	W72
	.byte	W56
	.byte	W01
	.byte		EOT	
	.byte	W36
	.byte	W03
	.byte	W96
	.byte	W24
	.byte		TIE	, En2, v092
	.byte	W72
song070_8_8:
	.byte	W56
	.byte	W01
	.byte		EOT	, En2
	.byte	W36
	.byte	W03
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
	.byte	W96
song070_8_1:
	.byte		N06	, Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte	PEND
song070_8_2:
	.byte		N06	, Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W18
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte	PEND
	.byte	PATT	
		.word	song070_8_1
song070_8_3:
	.byte		N06	, Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W18
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song070_8_1
	.byte	PATT	
		.word	song070_8_2
	.byte	PATT	
		.word	song070_8_1
	.byte	PATT	
		.word	song070_8_3
	.byte		N06	, Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W30
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v016
	.byte	W06
	.byte			Fs2, v068
	.byte	W06
	.byte			Fs2, v060
	.byte	W06
song070_8_4:
	.byte		N12	, Bn4, v072
	.byte	W12
	.byte		N24	
	.byte	W72
	.byte		N06	
	.byte	W06
	.byte			Bn4, v068
	.byte	W06
	.byte	PEND
song070_8_5:
	.byte		N12	, Bn4, v072
	.byte	W12
	.byte		N24	
	.byte	W84
	.byte	PEND
	.byte	PATT	
		.word	song070_8_4
song070_8_6:
	.byte		N12	, Bn4, v068
	.byte	W12
	.byte		N24	, Bn4, v072
	.byte	W60
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte	PEND
	.byte		N24	
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song070_8_4
	.byte	PATT	
		.word	song070_8_5
	.byte	PATT	
		.word	song070_8_4
	.byte	PATT	
		.word	song070_8_6
	.byte		N24	, Bn4, v072
	.byte	W96
	.byte	W96
	.byte		N24	
	.byte	W96
	.byte	W96
	.byte		N06	, Fs2
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte			Fs2, v068
	.byte	W12
	.byte			Fs2, v072
	.byte	W24
	.byte		N06	
	.byte	W12
song070_8_7:
	.byte		N06	, Fs2, v072
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte			Fs2, v068
	.byte	W12
	.byte			Fs2, v072
	.byte	W36
	.byte	PEND
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Fs2, v068
	.byte	W12
	.byte	PATT	
		.word	song070_8_7
	.byte		N06	, Fs2, v072
	.byte	W12
	.byte			Fs2, v068
	.byte	W36
	.byte			Fs2, v072
	.byte	W12
	.byte			Fs2, v068
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte	PATT	
		.word	song070_8_7
	.byte		N06	, Fs2, v072
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte			Fs2, v068
	.byte	W36
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte			Fs2, v072
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W36
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
		.word	song070_8_8
	.byte	FINE

	.align 2
	.global song070
song070:	@ 0x0857689C
	.byte	8		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup029		@ voicegroup/tone

	.word	song070_1		@ track
	.word	song070_2		@ track
	.word	song070_3		@ track
	.word	song070_4		@ track
	.word	song070_5		@ track
	.word	song070_6		@ track
	.word	song070_7		@ track
	.word	song070_8		@ track
