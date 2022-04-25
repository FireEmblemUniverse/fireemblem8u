	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song020_1
song020_1:	@ 0x085577AC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 53
	.byte	VOICE	, 57
	.byte	VOL	, v000
	.byte	PAN	, c_v+23
	.byte	VOL	, v008
	.byte	BEND	, c_v
	.byte		TIE	, Fn3, v032
	.byte		TIE	, As3
	.byte	W01
	.byte	VOL	, v017
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
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
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W68
	.byte	W02
	.byte		v053
	.byte	W02
	.byte	W92
	.byte	W03
	.byte		EOT	, Fn3
	.byte	W01
	.byte		TIE	, En3
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N92	, Fn3
	.byte	W96
	.byte			En3
	.byte	W96
	.byte		N44	, Dn3, v044
	.byte	W48
	.byte		N24	, Fn3
	.byte	W24
	.byte			Ds3, v052
	.byte	W23
	.byte		EOT	, As3
	.byte	W01
song020_1_3:
	.byte		N23	, Cn3, v072
	.byte		N23	, Fn3, v064
	.byte	W24
	.byte			Fn2
	.byte		N23	, Cn3, v068
	.byte	W24
	.byte			En2
	.byte		N23	, Cs3, v076
	.byte	W24
	.byte			Cs2, v080
	.byte		N23	, Gs3
	.byte	W24
	.byte		TIE	, Fn1, v104
	.byte		N07	, Fn2, v028
	.byte	W08
	.byte			Cn3, v032
	.byte	W08
	.byte			Fn3, v036
	.byte	W08
	.byte			As3, v024
	.byte	W08
	.byte			Bn3, v028
	.byte	W08
	.byte			Fn4
	.byte	W08
	.byte			Fn2, v020
	.byte	W08
	.byte			Cn3, v032
	.byte	W08
	.byte			Fn3, v036
	.byte	W08
	.byte			As3, v032
	.byte	W08
	.byte			Bn3, v024
	.byte	W08
	.byte			En4, v020
	.byte	W08
	.byte			Fn2
	.byte	W08
	.byte			Cn3, v028
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			As3
	.byte	W08
	.byte			Bn3, v024
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Fn2, v020
	.byte	W08
	.byte			Cn3, v024
	.byte	W08
	.byte			Fn3, v036
	.byte	W08
	.byte			As3, v032
	.byte	W08
	.byte			Bn3, v020
	.byte	W08
	.byte			Dn4, v032
	.byte	W07
	.byte		EOT	, Fn1
	.byte	W01
	.byte		TIE	, Fn1, v104
	.byte		N07	, Fn2, v028
	.byte	W08
	.byte			Cn3, v032
	.byte	W08
	.byte			Fn3, v036
	.byte	W08
	.byte			As3, v028
	.byte	W08
	.byte			Bn3, v020
	.byte	W08
	.byte			Fn4, v024
	.byte	W08
	.byte			Fn2, v020
	.byte	W08
	.byte			Cn3, v028
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			As3
	.byte	W08
	.byte			Bn3, v012
	.byte	W08
	.byte			En4, v028
	.byte	W08
	.byte			Fn2, v024
	.byte	W08
	.byte			Cn3, v028
	.byte	W08
	.byte			Fn3, v036
	.byte	W08
	.byte			As3, v028
	.byte	W08
	.byte			Bn3, v020
	.byte	W08
	.byte			Ds4, v032
	.byte	W08
	.byte			Fn2, v020
	.byte	W08
	.byte			Cn3, v024
	.byte	W08
	.byte			Fn3, v020
	.byte	W08
	.byte			As3, v028
	.byte	W08
	.byte			Bn3, v016
	.byte	W08
	.byte			Dn4, v024
	.byte	W07
	.byte		EOT	, Fn1
	.byte	W01
	.byte		N07	, An2, v088
	.byte	W08
	.byte			Ds2
	.byte	W08
	.byte			Dn2, v092
	.byte	W08
	.byte			Fn1, v100
	.byte	W08
	.byte			Ds2
	.byte	W08
	.byte			Dn2, v088
	.byte	W08
	.byte			An2, v100
	.byte	W08
	.byte			Ds2, v088
	.byte	W08
	.byte			Dn2, v092
	.byte	W08
	.byte			Fn1, v100
	.byte	W08
	.byte			Ds2
	.byte	W08
	.byte			Dn2, v088
	.byte	W08
song020_1_1:
	.byte		N07	, Gs2, v100
	.byte	W08
	.byte			Ds2, v088
	.byte	W08
	.byte			Dn2, v092
	.byte	W08
	.byte			Fn1, v100
	.byte	W08
	.byte			Ds2
	.byte	W08
	.byte			Dn2, v088
	.byte	W08
	.byte			Gs2, v100
	.byte	W08
	.byte			Ds2, v088
	.byte	W08
	.byte			Dn2, v092
	.byte	W08
	.byte			Fn1, v100
	.byte	W08
	.byte			Ds2
	.byte	W08
	.byte			Dn2, v088
	.byte	W08
	.byte	PEND
song020_1_2:
	.byte		N07	, An2, v100
	.byte	W08
	.byte			Ds2, v088
	.byte	W08
	.byte			Dn2, v092
	.byte	W08
	.byte			Fn1, v100
	.byte	W08
	.byte			Ds2
	.byte	W08
	.byte			Dn2, v088
	.byte	W08
	.byte			An2, v100
	.byte	W08
	.byte			Ds2, v088
	.byte	W08
	.byte			Dn2, v092
	.byte	W08
	.byte			Fn1, v100
	.byte	W08
	.byte			Ds2
	.byte	W08
	.byte			Dn2, v088
	.byte	W08
	.byte	PEND
	.byte	PATT	
		.word	song020_1_1
	.byte	PATT	
		.word	song020_1_2
	.byte	PATT	
		.word	song020_1_1
	.byte	PATT	
		.word	song020_1_2
	.byte		N07	, Gs2, v096
	.byte	W08
	.byte			Dn2
	.byte	W08
	.byte			Ds2, v104
	.byte	W08
	.byte			Dn2, v096
	.byte	W08
	.byte			Gs1
	.byte	W08
	.byte			An1, v104
	.byte	W08
	.byte			Gs1, v096
	.byte	W08
	.byte			Dn1
	.byte	W08
	.byte			Ds1, v104
	.byte	W08
	.byte			Dn1, v096
	.byte	W08
	.byte			Gs0
	.byte	W08
	.byte			An0, v104
	.byte	W08
	.byte		N08	, Fs3, v068
	.byte		N08	, As3
	.byte	W08
	.byte			Fn3
	.byte		N08	, An3, v076
	.byte	W08
	.byte			En3, v080
	.byte		N08	, Gs3
	.byte	W08
	.byte		N72	, Ds3
	.byte		N72	, Gn3, v072
	.byte	W72
	.byte		N08	, Dn3, v068
	.byte		N08	, Gs3, v064
	.byte	W08
	.byte			Cs3
	.byte		N08	, Gn3
	.byte	W08
	.byte			Cn3, v072
	.byte		N08	, Fs3
	.byte	W08
	.byte		N72	, Bn2, v044
	.byte		N72	, Fn3, v072
	.byte	W72
	.byte	W96
	.byte	W96
	.byte		N24	, Bn1, v076
	.byte		N24	, Bn2, v072
	.byte	W24
	.byte			Ds2, v084
	.byte		N24	, Ds3, v080
	.byte	W24
	.byte			Dn2, v084
	.byte		N24	, Dn3, v076
	.byte	W24
	.byte			Fs2
	.byte		N24	, Fs3, v072
	.byte	W24
	.byte			Gs2
	.byte		N24	, Fn3
	.byte	W24
	.byte			Cn3
	.byte		N24	, As3
	.byte	W24
	.byte			Cs3
	.byte		N24	, Gs3
	.byte	W24
	.byte			Gs2
	.byte		N24	, En3
	.byte	W24
	.byte		N96	, Gs2
	.byte		TIE	, Fn3, v056
	.byte	W96
	.byte		N96	, Gn2, v072
	.byte	W96
	.byte			Fs2
	.byte	W96
	.byte		EOT	, Fn3
	.byte		N06	, Fn2, v088
	.byte		N06	, Cn3
	.byte	W24
	.byte			Fn2, v092
	.byte		N06	, Cn3, v096
	.byte	W24
	.byte			Fn2, v092
	.byte		N06	, Cn3
	.byte	W24
	.byte		N24	, Fs2, v100
	.byte		N24	, Cs3
	.byte	W24
	.byte	VOICE	, 57
	.byte	VOL	, v000
	.byte	PAN	, c_v+23
	.byte	VOL	, v008
	.byte	BEND	, c_v
	.byte		TIE	, Fn2, v084
	.byte		TIE	, Fn3, v060
	.byte	W01
	.byte	VOL	, v017
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
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
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W68
	.byte	W02
	.byte		v053
	.byte	W02
	.byte	W96
	.byte		EOT	
	.byte		TIE	, En3, v056
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N92	, Fn3, v068
	.byte	W96
	.byte			En3
	.byte	W96
	.byte		N44	, Dn3, v076
	.byte	W48
	.byte		N24	, Fn3, v080
	.byte	W24
	.byte			Ds3, v084
	.byte	W24
	.byte		EOT	, Fn2
	.byte	GOTO	
		.word	song020_1_3
	.byte	FINE

	@********************** Track  2 **********************@

	.global song020_2
song020_2:	@ 0x08557A42
	.byte	KEYSH	, 0
song020_2_7:
	.byte	VOICE	, 20
	.byte	VOL	, v053
	.byte	PAN	, c_v-16
	.byte	BEND	, c_v
	.byte	W24
	.byte		N12	, Fn2, v076
	.byte		N12	, As2
	.byte	W12
	.byte		N07	, Fs2, v088
	.byte		N07	, An2, v096
	.byte	W60
	.byte	PEND
song020_2_2:
	.byte	W24
	.byte		N12	, Fn2, v076
	.byte		N12	, As2
	.byte	W12
	.byte		N07	, Fs2, v088
	.byte		N07	, An2, v096
	.byte	W36
	.byte		N05	, Gn2, v076
	.byte		N05	, Gs2, v072
	.byte	W08
	.byte			Gn2, v080
	.byte		N05	, Gs2, v076
	.byte	W08
	.byte			Gn2, v080
	.byte		N05	, Gs2
	.byte	W08
	.byte	PEND
song020_2_1:
	.byte	W24
	.byte		N12	, Fn2, v076
	.byte		N12	, As2
	.byte	W12
	.byte		N07	, Fs2, v088
	.byte		N07	, An2, v096
	.byte	W60
	.byte	PEND
song020_2_8:
	.byte	W24
	.byte		N12	, Fn2, v076
	.byte		N12	, As2
	.byte	W12
	.byte		N07	, Fs2, v088
	.byte		N07	, An2, v096
	.byte	W36
	.byte		N11	, Fs2, v088
	.byte		N11	, As2
	.byte	W12
	.byte			En2
	.byte		N11	, Gn2
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song020_2_1
	.byte	PATT	
		.word	song020_2_2
	.byte	PATT	
		.word	song020_2_1
song020_2_9:
	.byte	VOICE	, 23
	.byte	VOL	, v053
	.byte		N23	, Fn2, v064
	.byte	W24
	.byte			Cn2, v068
	.byte	W24
	.byte	BEND	, c_v
	.byte		N23	, Cs2, v076
	.byte	W24
	.byte			Gs2, v080
	.byte	W24
	.byte		N07	, Fn2, v036
	.byte	W08
	.byte			Cn3, v040
	.byte	W08
	.byte			Fn3, v044
	.byte	W08
	.byte			As3, v032
	.byte	W08
	.byte			Bn3, v036
	.byte	W08
	.byte			Fn4
	.byte	W08
	.byte			Fn2, v028
	.byte	W08
	.byte			Cn3, v040
	.byte	W08
	.byte			Fn3, v044
	.byte	W08
	.byte			As3, v040
	.byte	W08
	.byte			Bn3, v032
	.byte	W08
	.byte			En4, v024
	.byte	W08
	.byte			Fn2, v028
	.byte	W08
	.byte			Cn3, v036
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			As3, v032
	.byte	W08
	.byte			Bn3
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Fn2, v028
	.byte	W08
	.byte			Cn3, v032
	.byte	W08
	.byte			Fn3, v044
	.byte	W08
	.byte			As3, v040
	.byte	W08
	.byte			Bn3, v028
	.byte	W08
	.byte			Dn4, v040
	.byte	W08
	.byte			Fn2, v036
	.byte	W08
	.byte			Cn3, v040
	.byte	W08
	.byte			Fn3, v044
	.byte	W08
	.byte			As3, v036
	.byte	W08
	.byte			Bn3, v028
	.byte	W08
	.byte			Fn4, v032
	.byte	W08
	.byte			Fn2, v028
	.byte	W08
	.byte			Cn3, v036
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			As3
	.byte	W08
	.byte			Bn3, v020
	.byte	W08
	.byte			En4, v036
	.byte	W08
	.byte			Fn2, v032
	.byte	W08
	.byte			Cn3, v036
	.byte	W08
	.byte			Fn3, v044
	.byte	W08
	.byte			As3, v036
	.byte	W08
	.byte			Bn3, v028
	.byte	W08
	.byte			Ds4, v040
	.byte	W08
	.byte			Fn2, v028
	.byte	W08
	.byte			Cn3, v032
	.byte	W08
	.byte			Fn3, v028
	.byte	W08
	.byte			As3, v036
	.byte	W08
	.byte			Bn3, v024
	.byte	W08
	.byte			Dn4, v032
	.byte	W08
song020_2_3:
	.byte		N07	, An3, v044
	.byte	W08
	.byte			Ds3, v032
	.byte	W08
	.byte			Dn3, v040
	.byte	W08
	.byte			Fn2, v044
	.byte	W08
	.byte			Ds3, v048
	.byte	W08
	.byte			Dn3, v032
	.byte	W08
	.byte			An3, v044
	.byte	W08
	.byte			Ds3, v032
	.byte	W08
	.byte			Dn3, v040
	.byte	W08
	.byte			Fn2, v044
	.byte	W08
	.byte			Ds3, v048
	.byte	W08
	.byte			Dn3, v032
	.byte	W08
	.byte	PEND
song020_2_4:
	.byte		N07	, Gs3, v044
	.byte	W08
	.byte			Ds3, v032
	.byte	W08
	.byte			Dn3, v040
	.byte	W08
	.byte			Fn2, v044
	.byte	W08
	.byte			Ds3, v048
	.byte	W08
	.byte			Dn3, v032
	.byte	W08
	.byte			Gs3, v044
	.byte	W08
	.byte			Ds3, v032
	.byte	W08
	.byte			Dn3, v040
	.byte	W08
	.byte			Fn2, v044
	.byte	W08
	.byte			Ds3, v048
	.byte	W08
	.byte			Dn3, v032
	.byte	W08
	.byte	PEND
	.byte	PATT	
		.word	song020_2_3
	.byte	PATT	
		.word	song020_2_4
song020_2_5:
	.byte		N07	, An4, v028
	.byte	W08
	.byte			Ds4, v032
	.byte	W08
	.byte			Dn4, v040
	.byte	W08
	.byte			Fn3, v044
	.byte	W08
	.byte			Ds4, v048
	.byte	W08
	.byte			Dn4, v032
	.byte	W08
	.byte			An4, v028
	.byte	W08
	.byte			Ds4, v032
	.byte	W08
	.byte			Dn4, v040
	.byte	W08
	.byte			Fn3, v044
	.byte	W08
	.byte			Ds4, v048
	.byte	W08
	.byte			Dn4, v032
	.byte	W08
	.byte	PEND
	.byte			Gs4, v028
	.byte	W08
	.byte			Ds4, v032
	.byte	W08
	.byte			Dn4, v040
	.byte	W08
	.byte			Fn3, v044
	.byte	W08
	.byte			Ds4, v048
	.byte	W08
	.byte			Dn4, v032
	.byte	W08
	.byte			Gs4, v028
	.byte	W08
	.byte			Ds4, v032
	.byte	W08
	.byte			Dn4, v040
	.byte	W08
	.byte			Fn3, v044
	.byte	W08
	.byte			Ds4, v048
	.byte	W08
	.byte			Dn4, v032
	.byte	W08
	.byte	PATT	
		.word	song020_2_5
	.byte		N07	, Gs4, v040
	.byte	W08
	.byte			Dn4, v056
	.byte	W08
	.byte			Ds4, v064
	.byte	W08
	.byte			Dn4, v056
	.byte	W08
	.byte			Gs3
	.byte	W08
	.byte			An3, v064
	.byte	W08
	.byte			Gs3, v056
	.byte	W08
	.byte			Dn3
	.byte	W08
	.byte			Ds3, v064
	.byte	W08
	.byte			Dn3, v056
	.byte	W08
	.byte			Gs2
	.byte	W08
	.byte			An2, v064
	.byte	W08
	.byte	W48
	.byte		N08	, Fs3, v048
	.byte		N08	, As3, v044
	.byte	W08
	.byte			Fn3
	.byte		N08	, An3, v052
	.byte	W08
	.byte			En3, v056
	.byte		N08	, Gs3
	.byte	W08
	.byte		N24	, Ds3, v060
	.byte		N24	, Gn3, v052
	.byte	W24
	.byte		N08	, Dn3, v048
	.byte		N08	, Gs3, v044
	.byte	W08
	.byte			Cs3
	.byte		N08	, Gn3
	.byte	W08
	.byte			Cn3, v048
	.byte		N08	, Fs3
	.byte	W08
	.byte		N24	, Bn2, v044
	.byte		N24	, Fn3, v052
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N24	
	.byte		N24	, Cn4, v060
	.byte	W24
	.byte			Cn3
	.byte		N24	, Fn3, v052
	.byte	W24
	.byte			Cs3, v068
	.byte		N24	, En3, v064
	.byte	W24
	.byte			En3, v072
	.byte		N24	, Gs3, v068
	.byte	W24
song020_2_6:
	.byte		N08	, Fn2, v048
	.byte	W08
	.byte			Gs2, v076
	.byte	W08
	.byte			Cn3, v064
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			Cn3, v060
	.byte	W08
	.byte			Fn3, v076
	.byte	W08
	.byte			Fn2
	.byte	W08
	.byte			Gs2, v072
	.byte	W08
	.byte			Cn3, v076
	.byte	W08
	.byte			Cs3
	.byte	W08
	.byte			Fs2
	.byte	W08
	.byte			As2, v080
	.byte	W08
	.byte	PEND
	.byte	PATT	
		.word	song020_2_6
	.byte		N08	, Fs2, v048
	.byte	W08
	.byte			Gs2, v076
	.byte	W08
	.byte			Cn3, v064
	.byte	W08
	.byte			Fs3
	.byte	W08
	.byte			Cn3, v060
	.byte	W08
	.byte			Fs3, v076
	.byte	W08
	.byte			Fs2
	.byte	W08
	.byte			Gs2, v072
	.byte	W08
	.byte			Cn3, v076
	.byte	W08
	.byte			Cs3
	.byte	W08
	.byte			Fs2
	.byte	W08
	.byte			As2, v080
	.byte	W08
	.byte		N06	, Fn2, v092
	.byte	W24
	.byte			Fn2, v100
	.byte	W24
	.byte			Fn2, v108
	.byte	W24
	.byte		N24	, Fs2, v104
	.byte	W24
	.byte	PATT	
		.word	song020_2_7
	.byte	PATT	
		.word	song020_2_2
	.byte	PATT	
		.word	song020_2_1
	.byte	PATT	
		.word	song020_2_8
	.byte	PATT	
		.word	song020_2_1
	.byte	PATT	
		.word	song020_2_2
	.byte	PATT	
		.word	song020_2_1
	.byte	GOTO	
		.word	song020_2_9
	.byte	FINE

	@********************** Track  3 **********************@

	.global song020_3
song020_3:	@ 0x08557CE1
	.byte	KEYSH	, 0
song020_3_2:
	.byte	VOICE	, 22
	.byte	VOL	, v053
	.byte	PAN	, c_v
	.byte	BEND	, c_v
	.byte		N11	, Fn1, v080
	.byte	W12
	.byte		N05	, As1, v076
	.byte		N05	, Cn2, v072
	.byte	W12
	.byte		N11	, Fn1, v092
	.byte	W12
	.byte		N05	, As1, v080
	.byte		N05	, Cs2
	.byte	W12
	.byte		N11	, Fn1, v088
	.byte	W12
	.byte		N05	, As1, v084
	.byte		N05	, Cn2, v080
	.byte	W12
	.byte		N11	, Fn1, v076
	.byte	W12
	.byte		N05	, Gs1, v080
	.byte		N05	, As1, v076
	.byte	W12
	.byte	PEND
song020_3_1:
	.byte		N11	, Fn1, v080
	.byte	W12
	.byte		N05	, As1, v076
	.byte		N05	, Cn2, v072
	.byte	W12
	.byte		N11	, Fn1, v092
	.byte	W12
	.byte		N05	, As1, v080
	.byte		N05	, Cs2
	.byte	W12
	.byte		N11	, Fn1, v088
	.byte	W12
	.byte		N05	, As1, v084
	.byte		N05	, Cn2, v080
	.byte	W12
	.byte		N11	, Fn1, v076
	.byte	W12
	.byte		N05	, Gs1, v080
	.byte		N05	, As1, v076
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song020_3_1
	.byte	PATT	
		.word	song020_3_1
	.byte	PATT	
		.word	song020_3_1
	.byte	PATT	
		.word	song020_3_1
song020_3_3:
	.byte		N11	, Fs1, v080
	.byte	W12
	.byte		N05	, As1, v076
	.byte		N05	, Cn2, v072
	.byte	W12
	.byte		N11	, Fs1, v092
	.byte	W12
	.byte		N05	, As1, v080
	.byte		N05	, Cs2
	.byte	W12
	.byte		N11	, Fs1, v088
	.byte	W12
	.byte		N05	, As1, v084
	.byte		N05	, Cn2, v080
	.byte	W12
	.byte		N11	, Fs1, v076
	.byte	W12
	.byte		N05	, Gs1, v080
	.byte		N05	, As1, v076
	.byte	W12
	.byte	PEND
song020_3_4:
	.byte		N05	, Cn2, v084
	.byte	W08
	.byte		N05	
	.byte	W08
	.byte		N05	
	.byte	W08
	.byte			Fn1, v080
	.byte	W08
	.byte		N05	
	.byte	W08
	.byte		N05	
	.byte	W08
	.byte			En1, v088
	.byte	W08
	.byte		N05	
	.byte	W08
	.byte		N05	
	.byte	W08
	.byte			Gs1, v084
	.byte	W08
	.byte		N05	
	.byte	W08
	.byte		N05	
	.byte	W08
	.byte	BEND	, c_v
	.byte		N16	, Fn2, v096
	.byte	W24
	.byte	VOICE	, 57
	.byte	VOL	, v053
	.byte		N44	, Gs2, v104
	.byte		N44	, Cn3, v088
	.byte	W48
	.byte		N23	, Gs2, v080
	.byte		N23	, Bn2, v068
	.byte	W24
	.byte			Gs2, v076
	.byte		N23	, Ds3, v080
	.byte	W24
	.byte		N44	, Gs2, v084
	.byte		N44	, Dn3, v092
	.byte	W48
	.byte		N23	, Fs2, v072
	.byte		N23	, As2, v084
	.byte	W24
	.byte		N92	, Ds2, v100
	.byte		TIE	, Cn3, v092
	.byte	W96
	.byte		N92	, Dn2, v104
	.byte	W92
	.byte	W03
	.byte		EOT	, Cn3
	.byte	W01
	.byte	VOICE	, 22
	.byte		N68	, Fn2
	.byte		N68	, Cn3, v088
	.byte	W72
	.byte		N23	, Gn2, v080
	.byte		N23	, Bn2, v068
	.byte	W24
	.byte		N44	, Gs2, v076
	.byte		N44	, Ds3, v080
	.byte	W48
	.byte		N23	, Gs2
	.byte		N23	, Fn3
	.byte	W24
	.byte			Gn2, v072
	.byte		N23	, Ds3, v084
	.byte	W24
	.byte		N92	, An2, v072
	.byte		N92	, Dn3, v084
	.byte	W96
	.byte	VOICE	, 47
	.byte	PAN	, c_v+13
	.byte		N23	, Fn3, v064
	.byte		N23	, Gs3
	.byte	W24
	.byte			Gs3, v056
	.byte		N23	, Cn4
	.byte	W24
	.byte			Gn3, v060
	.byte		N23	, Bn3
	.byte	W24
	.byte		N08	, Cn4, v040
	.byte		N08	, Ds4
	.byte	W08
	.byte			Bn3, v044
	.byte		N08	, Dn4
	.byte	W08
	.byte			As3, v056
	.byte		N08	, Cs4
	.byte	W08
	.byte	VOICE	, 21
	.byte	PAN	, c_v
	.byte		N68	, Fn2, v080
	.byte		N68	, Cn3, v064
	.byte	W72
	.byte		N23	, Gn2, v056
	.byte		N23	, Bn2, v044
	.byte	W24
	.byte			Gs2, v052
	.byte		N23	, Ds3, v056
	.byte	W24
	.byte			Cn2, v076
	.byte		N23	, Gs2
	.byte	W24
	.byte			Gs2, v056
	.byte		N23	, Fn3
	.byte	W24
	.byte			Gn2, v048
	.byte		N23	, Ds3, v060
	.byte	W24
	.byte		N92	, An2, v080
	.byte		N23	, Dn3, v060
	.byte	W24
	.byte		N07	, Dn3, v092
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte			Ds3
	.byte	W08
	.byte		TIE	, Fn3, v088
	.byte	W48
	.byte		N92	, Gs2, v080
	.byte	W92
	.byte	W03
	.byte		EOT	, Fn3
	.byte	W01
	.byte	W96
	.byte	W48
	.byte		N08	, Dn3, v068
	.byte		N08	, Gs3, v064
	.byte	W08
	.byte			Cs3
	.byte		N08	, Gn3
	.byte	W08
	.byte			Cn3, v072
	.byte		N08	, Fs3
	.byte	W08
	.byte		N24	, Bn2
	.byte		N72	, Fn3
	.byte	W24
	.byte		TIE	, Cn3
	.byte	W48
	.byte		N24	, Fs3
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte			Fn3
	.byte	W24
	.byte		EOT	, Cn3
	.byte		TIE	, Fn2
	.byte		N68	, Cn3
	.byte	W72
	.byte	W68
	.byte	W03
	.byte		EOT	, Fn2
	.byte	W01
	.byte		N07	, Cn2, v068
	.byte		N07	, Fn2
	.byte	W08
	.byte			Cn2, v076
	.byte		N07	, Fn2, v072
	.byte	W08
	.byte			Cn2, v088
	.byte		N07	, Fn2, v084
	.byte	W08
	.byte		N24	, Fn2, v072
	.byte	W24
	.byte			As2
	.byte	W24
	.byte			Gs2
	.byte	W24
	.byte			En2
	.byte	W24
	.byte	PATT	
		.word	song020_3_2
	.byte	PATT	
		.word	song020_3_1
	.byte	PATT	
		.word	song020_3_1
	.byte	PATT	
		.word	song020_3_1
	.byte	PATT	
		.word	song020_3_2
	.byte	PATT	
		.word	song020_3_1
	.byte	PATT	
		.word	song020_3_1
	.byte	PATT	
		.word	song020_3_1
	.byte	PATT	
		.word	song020_3_1
	.byte	PATT	
		.word	song020_3_1
	.byte	PATT	
		.word	song020_3_3
	.byte	GOTO	
		.word	song020_3_4
	.byte	FINE

	@********************** Track  4 **********************@

	.global song020_4
song020_4:	@ 0x08557EF0
	.byte	KEYSH	, 0
song020_4_8:
	.byte	VOICE	, 56
	.byte	VOL	, v053
	.byte	PAN	, c_v+14
	.byte	BEND	, c_v
	.byte		N12	, Fn1, v112
	.byte	W24
	.byte			Fn1, v127
	.byte	W24
	.byte			Fn1, v116
	.byte	W24
	.byte		N24	, Fs1, v104
	.byte	W24
	.byte	PEND
song020_4_1:
	.byte		N12	, Fn1, v112
	.byte	W24
	.byte			Fn1, v127
	.byte	W24
	.byte			Fn1, v116
	.byte	W24
	.byte		N24	, Fs1, v104
	.byte	W24
	.byte	PEND
	.byte		N12	, En1, v112
	.byte	W24
	.byte			En1, v127
	.byte	W24
	.byte			En1, v116
	.byte	W24
	.byte		N24	, Fs1, v104
	.byte	W24
	.byte	PATT	
		.word	song020_4_1
	.byte	PATT	
		.word	song020_4_1
	.byte	PATT	
		.word	song020_4_1
	.byte	PATT	
		.word	song020_4_1
song020_4_9:
	.byte		N23	, Fn1, v108
	.byte	W24
	.byte			Cn1, v104
	.byte	W24
	.byte		N07	, Cs1, v088
	.byte	W08
	.byte			En1, v084
	.byte	W08
	.byte			Gs1
	.byte	W08
	.byte			Cs2, v092
	.byte	W08
	.byte			En2, v104
	.byte	W08
	.byte			Gs2, v100
	.byte	W08
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song020_4_2:
	.byte		N12	, Fn1, v100
	.byte	W24
	.byte			Fn1, v104
	.byte	W24
	.byte			Fn1, v100
	.byte	W24
	.byte		N24	, Fs1, v120
	.byte	W24
	.byte	PEND
song020_4_3:
	.byte		N12	, Fn1, v100
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte			Fn1, v096
	.byte	W24
	.byte		N24	, Fs1, v127
	.byte	W24
	.byte	PEND
song020_4_4:
	.byte		N12	, Fn1, v100
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte			Ds1, v096
	.byte	W24
	.byte		N24	, Ds1, v124
	.byte	W24
	.byte	PEND
	.byte		N12	, Dn1, v100
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte			Ds1, v096
	.byte	W24
	.byte		N24	, Ds1, v124
	.byte	W24
	.byte	PATT	
		.word	song020_4_2
	.byte	PATT	
		.word	song020_4_3
	.byte	PATT	
		.word	song020_4_4
	.byte		N08	, Gs2, v100
	.byte	W08
	.byte			Dn2
	.byte	W08
	.byte			Ds2, v108
	.byte	W08
	.byte			Dn2, v100
	.byte	W08
	.byte			Gs1
	.byte	W08
	.byte			An1, v108
	.byte	W08
	.byte			Gs1, v100
	.byte	W08
	.byte			Dn1
	.byte	W08
	.byte			Ds1, v108
	.byte	W08
	.byte			Dn1, v100
	.byte	W08
	.byte			Gs0
	.byte	W08
	.byte			An0, v108
	.byte	W08
	.byte		N48	, Fn1, v104
	.byte	W48
	.byte		N24	, Fs1
	.byte	W24
	.byte			As1
	.byte	W24
	.byte		N48	, En1, v127
	.byte	W48
	.byte			Gn1
	.byte	W48
song020_4_5:
	.byte		N08	, Fn2, v108
	.byte	W08
	.byte			Fn1
	.byte	W08
	.byte			Fn2, v112
	.byte	W08
	.byte			Fn1, v108
	.byte	W08
	.byte			Ds2, v100
	.byte	W08
	.byte			Fn1, v112
	.byte	W08
	.byte			Fn2, v104
	.byte	W08
	.byte			Fn1, v108
	.byte	W08
	.byte			Fn2, v100
	.byte	W08
	.byte			Fn1, v112
	.byte	W08
	.byte			Fs2, v100
	.byte	W08
	.byte			Fn1, v112
	.byte	W08
	.byte	PEND
song020_4_6:
	.byte		N08	, Fn2, v100
	.byte	W08
	.byte			Fn1, v112
	.byte	W08
	.byte			Fn2, v104
	.byte	W08
	.byte			Fn1, v108
	.byte	W08
	.byte			Ds2, v092
	.byte	W08
	.byte			Fn1, v100
	.byte	W08
	.byte			As1, v092
	.byte	W08
	.byte			An1, v100
	.byte	W08
	.byte			Gs1
	.byte	W08
	.byte			Gn1
	.byte	W08
	.byte			Fs1
	.byte	W08
	.byte			En1, v120
	.byte	W08
	.byte	PEND
	.byte	PATT	
		.word	song020_4_5
	.byte	PATT	
		.word	song020_4_6
song020_4_7:
	.byte		N08	, Fn1, v100
	.byte	W08
	.byte			Gs1, v124
	.byte	W08
	.byte			Cn2, v112
	.byte	W08
	.byte			Fn2, v116
	.byte	W08
	.byte			Cn2, v112
	.byte	W08
	.byte			Fn2, v124
	.byte	W08
	.byte			Fn1
	.byte	W08
	.byte			Gs1, v120
	.byte	W08
	.byte			Cn2, v124
	.byte	W08
	.byte			Cs2, v127
	.byte	W08
	.byte			Fs1
	.byte	W08
	.byte			As1
	.byte	W08
	.byte	PEND
	.byte	PATT	
		.word	song020_4_7
	.byte		N08	, Fs1, v100
	.byte	W08
	.byte			Gs1, v124
	.byte	W08
	.byte			Cn2, v112
	.byte	W08
	.byte			Fs2, v116
	.byte	W08
	.byte			Cn2, v112
	.byte	W08
	.byte			Fs2, v124
	.byte	W08
	.byte			Fs1
	.byte	W08
	.byte			Gs1, v120
	.byte	W08
	.byte			Cn2, v124
	.byte	W08
	.byte			Cs2, v127
	.byte	W08
	.byte			Fs1
	.byte	W08
	.byte			As1
	.byte	W08
	.byte		N12	, Fn1, v116
	.byte	W24
	.byte			Fn1, v108
	.byte	W24
	.byte			Fn1, v116
	.byte	W24
	.byte		N24	, Fs1, v100
	.byte	W24
	.byte	PATT	
		.word	song020_4_8
	.byte		N12	, Fn1, v112
	.byte	W24
	.byte			Fn1, v127
	.byte	W24
	.byte			Fn1, v116
	.byte	W24
	.byte		N23	, Fs1, v104
	.byte	W24
	.byte		N07	, En1, v088
	.byte	W08
	.byte			Gs1, v096
	.byte	W08
	.byte			Cn2, v092
	.byte	W08
	.byte			Cs2, v096
	.byte	W08
	.byte			En1, v072
	.byte	W08
	.byte			Cs2, v100
	.byte	W08
	.byte			En1, v096
	.byte	W08
	.byte			Gs1, v100
	.byte	W08
	.byte			Cn2, v088
	.byte	W08
	.byte			Cs2, v096
	.byte	W08
	.byte			En1, v088
	.byte	W08
	.byte			Cs2, v096
	.byte	W08
	.byte			Fn1, v088
	.byte	W08
	.byte			Cn2, v096
	.byte	W08
	.byte			Ds2
	.byte	W08
	.byte			Fn2
	.byte	W08
	.byte			Fn1
	.byte	W08
	.byte			Fn2
	.byte	W08
	.byte			Cn2, v092
	.byte	W08
	.byte			Fn1, v096
	.byte	W08
	.byte			Cn2
	.byte	W08
	.byte			As1, v100
	.byte	W08
	.byte			Fn1, v096
	.byte	W08
	.byte			As1
	.byte	W08
	.byte	PATT	
		.word	song020_4_1
	.byte	PATT	
		.word	song020_4_1
	.byte	PATT	
		.word	song020_4_1
	.byte	GOTO	
		.word	song020_4_9
	.byte	FINE

	@********************** Track  5 **********************@

	.global song020_5
song020_5:	@ 0x085580E3
	.byte	KEYSH	, 0
	.byte	VOICE	, 101
	.byte	VOL	, v053
	.byte		N07	, Cn1, v127
	.byte	W24
	.byte			Cn1, v072
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W24
song020_5_4:
	.byte		N07	, Cn1, v072
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte	PEND
song020_5_5:
	.byte		N07	, Cn1, v072
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W12
	.byte	BEND	, c_v
	.byte		N03	, Dn1, v064
	.byte	W04
	.byte			Dn1, v084
	.byte	W04
	.byte			Dn1, v096
	.byte	W04
	.byte	PEND
song020_5_6:
	.byte		N11	, Dn1, v084
	.byte	W12
	.byte			Ds1, v096
	.byte	W12
	.byte			Dn1, v088
	.byte	W12
	.byte		N03	, Dn1, v064
	.byte	W04
	.byte			Dn1, v084
	.byte	W04
	.byte			Dn1, v096
	.byte	W04
	.byte		N11	, Dn1, v084
	.byte	W12
	.byte			Ds1, v096
	.byte	W12
	.byte			Dn1, v088
	.byte	W12
	.byte			Ds1, v127
	.byte	W12
	.byte	PEND
song020_5_7:
	.byte		N07	, Cn1, v072
	.byte		N23	, An2, v127
	.byte	W48
	.byte		N07	, Cn1, v072
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte	PEND
song020_5_8:
	.byte		N07	, Cn1, v072
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W12
	.byte		N02	, Dn1, v064
	.byte	W04
	.byte			Dn1, v084
	.byte	W04
	.byte			Dn1, v096
	.byte	W04
	.byte	PEND
	.byte		N10	, Dn1, v084
	.byte	W12
	.byte			Ds1, v096
	.byte	W12
	.byte			Dn1, v088
	.byte	W12
	.byte		N02	, Dn1, v064
	.byte	W04
	.byte			Dn1, v084
	.byte	W04
	.byte			Dn1, v096
	.byte	W02
	.byte	VOL	, v053
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v051
	.byte		N48	, Ds1, v127
	.byte	W01
	.byte	VOL	, v050
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v045
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
	.byte		v040
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
	.byte		v035
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v036
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
	.byte		v052
	.byte	W01
song020_5_9:
	.byte	VOL	, v053
	.byte		N07	, Dn1, v104
	.byte	W01
	.byte	VOL	, v052
	.byte	W01
	.byte		v052
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
	.byte		v047
	.byte	W01
	.byte		v047
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
	.byte		v043
	.byte	W01
	.byte		v043
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
	.byte		N68	, Ds1, v127
	.byte	W01
	.byte	VOL	, v039
	.byte	W01
	.byte		v039
	.byte	W01
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
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v030
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
	.byte		v042
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
	.byte	W01
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
	.byte		v049
	.byte	W01
	.byte		v050
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
	.byte		v052
	.byte	W01
	.byte		v053
	.byte		N07	, Cn1, v084
	.byte		N23	, An2, v127
	.byte	W08
	.byte		N07	, Dn1, v052
	.byte	W08
	.byte			Dn1, v068
	.byte	W08
	.byte		N23	, Ds1, v072
	.byte	W24
	.byte		N07	, Cn1, v084
	.byte	W08
	.byte			Dn1
	.byte	W08
	.byte			Dn1, v100
	.byte	W08
	.byte			Dn1, v104
	.byte	W24
	.byte			Cn1, v084
	.byte	W08
	.byte			Dn1, v052
	.byte	W08
	.byte			Dn1, v068
	.byte	W08
	.byte		N23	, Ds1, v072
	.byte	W24
	.byte		N07	, Dn1, v088
	.byte	W08
	.byte			Dn1, v084
	.byte	W08
	.byte			Dn1, v100
	.byte	W08
	.byte			Cn1, v084
	.byte		N07	, Dn1, v104
	.byte	W16
	.byte		N07	
	.byte	W08
	.byte			Cn1, v084
	.byte		N01	, Dn1, v032
	.byte	W04
	.byte			Dn1, v044
	.byte	W04
	.byte		N07	, Dn1, v052
	.byte	W08
	.byte			Dn1, v056
	.byte	W08
	.byte		N23	, Ds1, v072
	.byte	W24
	.byte		N07	, Cn1, v084
	.byte	W16
	.byte			Dn1, v100
	.byte	W08
	.byte			Cn1, v084
	.byte	W08
	.byte			Dn1
	.byte	W08
	.byte			Dn1, v100
	.byte	W08
	.byte			Cn1, v084
	.byte	W08
	.byte			Dn1, v032
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte			Cn1, v084
	.byte	W08
	.byte			Dn1, v056
	.byte	W08
	.byte			Dn1, v064
	.byte	W08
	.byte			Dn1, v096
	.byte	W08
	.byte			Dn1, v088
	.byte	W08
	.byte			Dn1, v096
	.byte	W08
	.byte			Cn1, v084
	.byte	W08
	.byte			Dn1, v127
	.byte	W08
	.byte		N07	
	.byte	W08
song020_5_1:
	.byte		N23	, An2, v096
	.byte	W08
	.byte		N07	, Dn1, v052
	.byte	W08
	.byte			Dn1, v068
	.byte	W08
	.byte		N23	, Ds1, v072
	.byte	W24
	.byte		N07	, Dn1, v088
	.byte	W08
	.byte			Dn1, v084
	.byte	W08
	.byte			Dn1, v100
	.byte	W08
	.byte			Dn1, v104
	.byte	W24
	.byte	PEND
	.byte			Dn1, v084
	.byte	W08
	.byte			Dn1, v052
	.byte	W08
	.byte			Dn1, v068
	.byte	W08
	.byte		N23	, Ds1, v072
	.byte	W24
	.byte		N07	, Dn1, v088
	.byte	W08
	.byte			Dn1, v084
	.byte	W08
	.byte			Dn1, v100
	.byte	W08
	.byte			Dn1, v104
	.byte	W16
	.byte		N07	
	.byte	W08
	.byte		N23	, An2, v096
	.byte	W08
	.byte		N07	, Dn1, v052
	.byte	W08
	.byte			Dn1, v056
	.byte	W08
	.byte		N23	, Ds1, v072
	.byte	W24
	.byte		N07	, Dn1, v088
	.byte	W16
	.byte			Dn1, v100
	.byte	W08
	.byte			Dn1, v088
	.byte	W08
	.byte			Dn1, v084
	.byte	W08
	.byte			Dn1, v100
	.byte	W08
	.byte			Dn1, v084
	.byte	W08
	.byte			Dn1, v032
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte			Dn1, v076
	.byte	W08
	.byte			Dn1, v028
	.byte	W08
	.byte			Dn1, v032
	.byte	W08
	.byte			Dn1, v084
	.byte	W08
	.byte			Dn1, v104
	.byte	W08
	.byte			Dn1, v048
	.byte	W08
	.byte			Dn1, v036
	.byte	W08
	.byte			Dn1, v092
	.byte	W08
	.byte			Dn1, v032
	.byte	W08
	.byte	PATT	
		.word	song020_5_1
	.byte		N23	, An2, v096
	.byte	W08
	.byte		N07	, Dn1, v052
	.byte	W08
	.byte			Dn1, v068
	.byte	W08
	.byte		N23	, Ds1, v072
	.byte	W24
	.byte		N07	, Dn1, v088
	.byte	W08
	.byte			Dn1, v084
	.byte	W08
	.byte			Dn1, v100
	.byte	W08
	.byte			Dn1, v104
	.byte	W16
	.byte		N07	
	.byte	W08
	.byte		N23	, An2, v096
	.byte	W08
	.byte		N07	, Dn1, v052
	.byte	W08
	.byte			Dn1, v056
	.byte	W08
	.byte		N23	, Ds1, v072
	.byte	W24
	.byte		N07	, Dn1, v088
	.byte	W16
	.byte			Dn1, v100
	.byte	W08
	.byte			Dn1, v088
	.byte	W08
	.byte			Dn1, v084
	.byte	W08
	.byte			Dn1, v100
	.byte	W07
	.byte	VOL	, v053
	.byte	W01
	.byte		v052
	.byte		N92	, Ds1, v127
	.byte	W01
	.byte	VOL	, v052
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
	.byte		v047
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
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
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
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v028
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
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v042
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
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W05
	.byte		N07	, Cn1, v108
	.byte		N23	, An2, v096
	.byte	W72
	.byte		N07	, Dn1, v084
	.byte	W08
	.byte			Dn1, v092
	.byte	W08
	.byte			Dn1, v116
	.byte	W08
	.byte			Cn1, v108
	.byte		N23	, An2, v096
	.byte	W24
	.byte		N68	, En2, v127
	.byte	W72
song020_5_2:
	.byte		N07	, Cn1, v108
	.byte		N23	, An2, v096
	.byte	W24
	.byte		N07	, Cn1, v108
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte	PEND
song020_5_3:
	.byte		N07	, Cn1, v108
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte		N23	, An2, v096
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song020_5_2
	.byte	PATT	
		.word	song020_5_3
	.byte	PATT	
		.word	song020_5_2
	.byte	PATT	
		.word	song020_5_3
	.byte		N07	, Cn1, v108
	.byte		N23	, An2, v096
	.byte	W48
	.byte		N07	, Cn1, v108
	.byte		N23	, An2, v096
	.byte	W23
	.byte	VOL	, v053
	.byte	W01
	.byte		v052
	.byte		N23	, Ds1, v127
	.byte	W01
	.byte	VOL	, v050
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
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		N07	, Dn1, v108
	.byte	W24
	.byte			Cn1
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte		N23	, An2, v127
	.byte	W24
	.byte	VOICE	, 101
	.byte	VOL	, v053
	.byte		N07	, Cn1
	.byte		N23	, An2
	.byte	W24
	.byte		N07	, Cn1, v072
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte	PATT	
		.word	song020_5_4
	.byte	PATT	
		.word	song020_5_5
	.byte	PATT	
		.word	song020_5_6
	.byte	PATT	
		.word	song020_5_7
	.byte	PATT	
		.word	song020_5_8
	.byte		N10	, Dn1, v084
	.byte	W12
	.byte			Ds1, v096
	.byte	W12
	.byte			Dn1, v088
	.byte	W12
	.byte		N02	, Dn1, v064
	.byte	W04
	.byte			Dn1, v084
	.byte	W04
	.byte	VOL	, v053
	.byte		N02	, Dn1, v096
	.byte	W01
	.byte	VOL	, v052
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v050
	.byte		N44	, Ds1, v127
	.byte	W01
	.byte	VOL	, v049
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v046
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
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
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
	.byte		v034
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
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
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
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte	GOTO	
		.word	song020_5_9
	.byte	FINE

	@********************** Track  6 **********************@

	.global song020_6
song020_6:	@ 0x085585F1
	.byte	KEYSH	, 0
song020_6_3:
	.byte	VOICE	, 75
	.byte	VOL	, v053
	.byte	BEND	, c_v
	.byte	W96
	.byte	PEND
	.byte	W96
	.byte	W96
	.byte	W96
song020_6_4:
	.byte	VOL	, v053
	.byte		N96	, As2, v127
	.byte	W01
	.byte	VOL	, v052
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v050
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
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v047
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
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W01
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
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
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
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v020
	.byte	W02
	.byte		v019
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v015
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
	.byte		v012
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v005
	.byte	W01
	.byte	PEND
song020_6_5:
	.byte	VOL	, v005
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v003
	.byte	W02
	.byte		v002
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W84
	.byte	W01
	.byte	PEND
	.byte	W96
song020_6_6:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W92
	.byte	W03
	.byte	VOL	, v000
	.byte	W01
	.byte	VOICE	, 84
	.byte	VOL	, v029
	.byte		N05	, An4, v024
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			An4
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Dn4
	.byte	W08
song020_6_1:
	.byte		N05	, Gs4, v024
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			Gs4
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte	PEND
song020_6_2:
	.byte		N05	, An4, v024
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			An4
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte	PEND
	.byte	PATT	
		.word	song020_6_1
	.byte	PATT	
		.word	song020_6_2
	.byte	PATT	
		.word	song020_6_1
	.byte	PATT	
		.word	song020_6_2
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
	.byte	PATT	
		.word	song020_6_3
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song020_6_4
	.byte	PATT	
		.word	song020_6_5
	.byte	W96
	.byte	GOTO	
		.word	song020_6_6
	.byte	FINE

	@********************** Track  7 **********************@

	.global song020_7
song020_7:	@ 0x08558771
	.byte	KEYSH	, 0
song020_7_1:
	.byte	VOICE	, 47
	.byte	VOL	, v038
	.byte	BEND	, c_v
	.byte	W96
	.byte	PEND
	.byte	W96
	.byte	W96
	.byte	W96
song020_7_2:
	.byte		N07	, Fn2, v127
	.byte	W08
	.byte			As2
	.byte	W08
	.byte			Cn3
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			En2
	.byte	W08
	.byte			As2
	.byte	W08
	.byte			Cn3
	.byte	W08
	.byte			En3
	.byte	W08
	.byte			Ds3
	.byte	W08
	.byte			As2
	.byte	W08
	.byte			Fn2
	.byte	W08
	.byte			En2
	.byte	W08
	.byte	PEND
song020_7_3:
	.byte		N07	, Ds2, v127
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N23	
	.byte	W72
	.byte	PEND
song020_7_4:
	.byte		N07	, Dn2, v127
	.byte	W08
	.byte			Gn2
	.byte	W08
	.byte			An2
	.byte	W08
	.byte			Dn3
	.byte	W08
	.byte			Cs2
	.byte	W08
	.byte			Gn2
	.byte	W08
	.byte			An2
	.byte	W08
	.byte			Cs3
	.byte	W08
	.byte			Cn3
	.byte	W08
	.byte			Gn2
	.byte	W08
	.byte			Dn2
	.byte	W08
	.byte			Cs2
	.byte	W08
	.byte	PEND
song020_7_5:
	.byte		N08	, Fn2, v112
	.byte	W08
	.byte			Cn3, v116
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			Cn3
	.byte	W08
	.byte			Fn3, v120
	.byte	W08
	.byte			Gs3
	.byte	W08
	.byte			Cs4, v112
	.byte	W08
	.byte			Gs3
	.byte	W08
	.byte			En3, v116
	.byte	W08
	.byte			Cs3, v124
	.byte	W08
	.byte			Gs2, v120
	.byte	W08
	.byte			En2, v127
	.byte	W08
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
	.byte	PATT	
		.word	song020_7_1
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song020_7_2
	.byte	PATT	
		.word	song020_7_3
	.byte	PATT	
		.word	song020_7_4
	.byte	GOTO	
		.word	song020_7_5
	.byte	FINE

	.align 2
	.global song020
song020:	@ 0x08558814
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup076		@ voicegroup/tone

	.word	song020_1		@ track
	.word	song020_2		@ track
	.word	song020_3		@ track
	.word	song020_4		@ track
	.word	song020_5		@ track
	.word	song020_6		@ track
	.word	song020_7		@ track
