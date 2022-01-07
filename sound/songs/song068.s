	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song068_1
song068_1:	@ 0x085741F4
	.byte	KEYSH	, 0
song068_1_3:
	.byte	TEMPO	, 68
	.byte	VOICE	, 10
	.byte	VOL	, v056
	.byte	PAN	, c_v+15
	.byte		N09	, Cs4, v068
	.byte	W72
song068_1_1:
	.byte		N09	, Ds4, v080
	.byte	W24
	.byte			En4, v064
	.byte	W24
	.byte			Cs4, v056
	.byte	W24
	.byte	PEND
	.byte			Ds4, v076
	.byte	W72
	.byte	W72
	.byte			En4, v064
	.byte	W72
song068_1_2:
	.byte		N09	, Fs4, v068
	.byte	W24
	.byte			Gs4, v076
	.byte	W24
	.byte			En4, v056
	.byte	W24
	.byte	PEND
	.byte			Fs4, v084
	.byte	W72
	.byte	W72
	.byte			En4, v060
	.byte	W72
	.byte			Fs4, v076
	.byte	W24
	.byte			Gs4, v072
	.byte	W24
	.byte			An4, v056
	.byte	W24
	.byte			Gs4, v076
	.byte	W72
	.byte	W24
	.byte			Fs4, v068
	.byte	W24
	.byte			En4, v048
	.byte	W24
	.byte			Fs4, v072
	.byte	W72
	.byte	W72
	.byte			Ds4, v080
	.byte	W72
	.byte	W72
	.byte			Cs4, v068
	.byte	W72
	.byte	PATT	
		.word	song068_1_1
	.byte		N09	, Ds4, v076
	.byte	W72
	.byte	W24
	.byte			Cs4
	.byte	W24
	.byte			Ds4
	.byte	W24
	.byte			En4, v064
	.byte	W72
	.byte	PATT	
		.word	song068_1_2
	.byte		N09	, Fs4, v084
	.byte	W72
	.byte			Fs4, v060
	.byte	W24
	.byte			En4
	.byte	W24
	.byte			Ds4
	.byte	W24
	.byte			En4
	.byte	W48
	.byte			En5
	.byte	W24
	.byte	W24
	.byte			Ds5
	.byte	W48
	.byte			Cs5
	.byte	W72
	.byte		N09	
	.byte	W24
	.byte			Bn4
	.byte	W24
	.byte			An4
	.byte	W24
	.byte			Gs4
	.byte	W72
	.byte	W24
	.byte		N09	
	.byte	W24
	.byte			As4
	.byte	W24
	.byte			Cn5
	.byte	W72
	.byte	W24
	.byte			Gs4
	.byte	W48
	.byte			En4, v064
	.byte	W24
	.byte			Ds4, v068
	.byte	W24
	.byte			Cs4, v076
	.byte	W24
	.byte			Bn3
	.byte	W24
	.byte			An3, v068
	.byte	W24
	.byte			Gs3, v080
	.byte	W24
	.byte			An3, v068
	.byte	W72
	.byte	W24
	.byte			Gs4, v092
	.byte	W48
	.byte			Fs4, v088
	.byte	W72
	.byte	W24
	.byte			En4, v076
	.byte	W48
	.byte			Ds4, v092
	.byte	W72
	.byte	W24
	.byte			Cs4, v084
	.byte	W24
	.byte			Ds4, v076
	.byte	W24
	.byte			En4, v084
	.byte	W72
	.byte			En4, v064
	.byte	W24
	.byte			Fs4, v080
	.byte	W24
	.byte			Gs4, v076
	.byte	W24
	.byte			An4
	.byte	W48
	.byte			Bn4, v088
	.byte	W24
	.byte	W24
	.byte			Cs5, v084
	.byte	W48
	.byte			Cs5, v080
	.byte	W72
	.byte	W24
	.byte			Ds5, v076
	.byte	W48
	.byte			Cn5, v072
	.byte	W48
	.byte			Gs4, v084
	.byte	W24
	.byte	W72
	.byte	GOTO	
		.word	song068_1_3
	.byte	FINE

	@********************** Track  2 **********************@

	.global song068_2
song068_2:	@ 0x085742D2
	.byte	KEYSH	, 0
song068_2_3:
	.byte	VOICE	, 10
	.byte	VOL	, v011
	.byte	PAN	, c_v+63
	.byte	W08
	.byte		N09	, Cs4, v068
	.byte	W64
song068_2_1:
	.byte	W08
	.byte		N09	, Ds4, v080
	.byte	W24
	.byte			En4, v064
	.byte	W24
	.byte			Cs4, v056
	.byte	W16
	.byte	PEND
	.byte	W08
	.byte			Ds4, v076
	.byte	W64
	.byte	W72
	.byte	W08
	.byte			En4, v064
	.byte	W64
song068_2_2:
	.byte	W08
	.byte		N09	, Fs4, v068
	.byte	W24
	.byte			Gs4, v076
	.byte	W24
	.byte			En4, v056
	.byte	W16
	.byte	PEND
	.byte	W08
	.byte			Fs4, v084
	.byte	W64
	.byte	W72
	.byte	W08
	.byte			En4, v060
	.byte	W64
	.byte	W08
	.byte			Fs4, v076
	.byte	W24
	.byte			Gs4, v072
	.byte	W24
	.byte			An4, v056
	.byte	W16
	.byte	W08
	.byte			Gs4, v076
	.byte	W64
	.byte	W32
	.byte			Fs4, v068
	.byte	W24
	.byte			En4, v048
	.byte	W16
	.byte	W08
	.byte			Fs4, v072
	.byte	W64
	.byte	W72
	.byte	W08
	.byte			Ds4, v080
	.byte	W64
	.byte	W72
	.byte	W08
	.byte			Cs4, v068
	.byte	W64
	.byte	PATT	
		.word	song068_2_1
	.byte	W08
	.byte		N09	, Ds4, v076
	.byte	W64
	.byte	W32
	.byte			Cs4
	.byte	W24
	.byte			Ds4
	.byte	W16
	.byte	W08
	.byte			En4, v064
	.byte	W64
	.byte	PATT	
		.word	song068_2_2
	.byte	W08
	.byte		N09	, Fs4, v084
	.byte	W64
	.byte	W08
	.byte			Fs4, v060
	.byte	W24
	.byte			En4
	.byte	W24
	.byte			Ds4
	.byte	W16
	.byte	W08
	.byte			En4
	.byte	W48
	.byte			En5
	.byte	W16
	.byte	W32
	.byte			Ds5
	.byte	W40
	.byte	W08
	.byte			Cs5
	.byte	W64
	.byte	W08
	.byte		N09	
	.byte	W24
	.byte			Bn4
	.byte	W24
	.byte			An4
	.byte	W16
	.byte	W08
	.byte			Gs4
	.byte	W64
	.byte	W32
	.byte		N09	
	.byte	W24
	.byte			As4
	.byte	W16
	.byte	W08
	.byte			Cn5
	.byte	W64
	.byte	W32
	.byte			Gs4
	.byte	W40
	.byte	W08
	.byte			En4, v064
	.byte	W24
	.byte			Ds4, v068
	.byte	W24
	.byte			Cs4, v076
	.byte	W16
	.byte	W08
	.byte			Bn3
	.byte	W24
	.byte			An3, v068
	.byte	W24
	.byte			Gs3, v080
	.byte	W16
	.byte	W08
	.byte			An3, v068
	.byte	W64
	.byte	W32
	.byte			Gs4, v092
	.byte	W40
	.byte	W08
	.byte			Fs4, v088
	.byte	W64
	.byte	W32
	.byte			En4, v076
	.byte	W40
	.byte	W08
	.byte			Ds4, v092
	.byte	W64
	.byte	W32
	.byte			Cs4, v084
	.byte	W24
	.byte			Ds4, v076
	.byte	W16
	.byte	W08
	.byte			En4, v084
	.byte	W64
	.byte	W08
	.byte			En4, v064
	.byte	W24
	.byte			Fs4, v080
	.byte	W24
	.byte			Gs4, v076
	.byte	W16
	.byte	W08
	.byte			An4
	.byte	W48
	.byte			Bn4, v088
	.byte	W16
	.byte	W32
	.byte			Cs5, v084
	.byte	W40
	.byte	W08
	.byte			Cs5, v080
	.byte	W64
	.byte	W32
	.byte			Ds5, v076
	.byte	W40
	.byte	W08
	.byte			Cn5, v072
	.byte	W48
	.byte			Gs4, v084
	.byte	W16
	.byte	W72
	.byte	GOTO	
		.word	song068_2_3
	.byte	FINE

	@********************** Track  3 **********************@

	.global song068_3
song068_3:	@ 0x085743CD
	.byte	KEYSH	, 0
song068_3_8:
	.byte	VOICE	, 10
	.byte	VOL	, v056
	.byte	PAN	, c_v-15
	.byte		N09	, Cs3, v084
	.byte	W24
	.byte			Gs3
	.byte	W24
	.byte			Cs4, v068
	.byte	W24
	.byte	W72
song068_3_1:
	.byte		N09	, Cs3, v048
	.byte	W24
	.byte			An3, v056
	.byte	W24
	.byte			Cs4, v068
	.byte	W24
	.byte	PEND
	.byte	W72
song068_3_2:
	.byte		N09	, Cs3, v080
	.byte	W24
	.byte			Gs3, v092
	.byte	W24
	.byte			Cs4, v060
	.byte	W24
	.byte	PEND
	.byte	W72
song068_3_4:
	.byte		N09	, Cs3, v048
	.byte	W24
	.byte			An3, v064
	.byte	W24
	.byte			Cs4, v068
	.byte	W24
	.byte	PEND
	.byte	W72
song068_3_5:
	.byte		N09	, An2, v068
	.byte	W24
	.byte			En3
	.byte	W24
	.byte			An3, v056
	.byte	W24
	.byte	PEND
	.byte	W72
	.byte			An2, v064
	.byte	W24
	.byte			En3, v072
	.byte	W24
	.byte			An3, v064
	.byte	W24
	.byte	W72
song068_3_6:
	.byte		N09	, Gs2, v092
	.byte	W24
	.byte			Ds3, v076
	.byte	W24
	.byte			Gs3
	.byte	W24
	.byte	PEND
	.byte	W72
song068_3_7:
	.byte		N09	, Gs2, v084
	.byte	W24
	.byte			Ds3, v060
	.byte	W24
	.byte			Gs3, v064
	.byte	W24
	.byte	PEND
	.byte			Cn4, v052
	.byte	W24
	.byte			Ds4, v076
	.byte	W24
	.byte			Gs4, v056
	.byte	W24
	.byte			Cs3, v084
	.byte	W24
	.byte			Gs3
	.byte	W24
	.byte			Cs4, v068
	.byte	W24
song068_3_3:
	.byte		N09	, Gs3, v068
	.byte	W24
	.byte			Cs3
	.byte	W48
	.byte	PEND
	.byte	PATT	
		.word	song068_3_1
	.byte		N09	, An3, v068
	.byte	W24
	.byte			Cs3
	.byte	W48
	.byte	PATT	
		.word	song068_3_2
	.byte	PATT	
		.word	song068_3_3
	.byte	PATT	
		.word	song068_3_4
	.byte		N09	, An3, v068
	.byte	W24
	.byte			Cs3
	.byte	W24
	.byte			Bn2
	.byte	W24
	.byte	PATT	
		.word	song068_3_5
	.byte		N09	, En3, v068
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			En2
	.byte	W24
	.byte			Fs2, v064
	.byte	W24
	.byte			Cs3, v072
	.byte	W24
	.byte			An3, v064
	.byte	W24
	.byte			Cs3
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			En2
	.byte	W24
	.byte	PATT	
		.word	song068_3_6
	.byte		N09	, Ds3, v064
	.byte	W24
	.byte			Gs2
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte	PATT	
		.word	song068_3_7
	.byte		N09	, Ds3, v052
	.byte	W24
	.byte			Cn3, v076
	.byte	W24
	.byte			Gs2, v056
	.byte	W24
	.byte			Cs3, v076
	.byte	W24
	.byte			En3, v084
	.byte	W24
	.byte			Gs3
	.byte	W24
	.byte	W72
	.byte			Fs2, v092
	.byte	W24
	.byte			Cs3
	.byte	W24
	.byte			Gs3
	.byte	W24
	.byte	W24
	.byte			Fs3, v080
	.byte	W48
	.byte			Bn2
	.byte	W24
	.byte			Fs3, v076
	.byte	W24
	.byte			Bn3, v072
	.byte	W24
	.byte	W72
	.byte			Gs2, v092
	.byte	W24
	.byte			Ds3, v064
	.byte	W24
	.byte			Gs3, v072
	.byte	W24
	.byte	W72
	.byte			An2
	.byte	W24
	.byte			En3, v080
	.byte	W24
	.byte			An3, v072
	.byte	W24
	.byte	W24
	.byte			En3
	.byte	W24
	.byte			Cs3, v060
	.byte	W24
	.byte			Fs2, v092
	.byte	W24
	.byte			Cs3, v076
	.byte	W24
	.byte			An3
	.byte	W24
	.byte			Cs3
	.byte	W24
	.byte			Fs2, v092
	.byte	W24
	.byte			Cs3, v076
	.byte	W24
	.byte			Ds2, v084
	.byte	W24
	.byte			Gn2, v064
	.byte	W24
	.byte			Cs3
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte			Ds3, v076
	.byte	W24
	.byte			Gs2, v084
	.byte	W24
	.byte			Ds3, v076
	.byte	W24
	.byte			Cn4, v068
	.byte	W24
	.byte			Gs3, v076
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte			Gs2
	.byte	W24
	.byte	GOTO	
		.word	song068_3_8
	.byte	FINE

	@********************** Track  4 **********************@

	.global song068_4
song068_4:	@ 0x0857450A
	.byte	KEYSH	, 0
song068_4_8:
	.byte	VOICE	, 10
	.byte	VOL	, v011
	.byte	PAN	, c_v-64
	.byte	W08
	.byte		N09	, Cs3, v084
	.byte	W24
	.byte			Gs3
	.byte	W24
	.byte			Cs4, v068
	.byte	W16
	.byte	W72
song068_4_1:
	.byte	W08
	.byte		N09	, Cs3, v048
	.byte	W24
	.byte			An3, v056
	.byte	W24
	.byte			Cs4, v068
	.byte	W16
	.byte	PEND
	.byte	W72
song068_4_2:
	.byte	W08
	.byte		N09	, Cs3, v080
	.byte	W24
	.byte			Gs3, v092
	.byte	W24
	.byte			Cs4, v060
	.byte	W16
	.byte	PEND
	.byte	W72
song068_4_4:
	.byte	W08
	.byte		N09	, Cs3, v048
	.byte	W24
	.byte			An3, v064
	.byte	W24
	.byte			Cs4, v068
	.byte	W16
	.byte	PEND
	.byte	W72
song068_4_5:
	.byte	W08
	.byte		N09	, An2, v068
	.byte	W24
	.byte			En3
	.byte	W24
	.byte			An3, v056
	.byte	W16
	.byte	PEND
	.byte	W72
	.byte	W08
	.byte			An2, v064
	.byte	W24
	.byte			En3, v072
	.byte	W24
	.byte			An3, v064
	.byte	W16
	.byte	W72
song068_4_6:
	.byte	W08
	.byte		N09	, Gs2, v092
	.byte	W24
	.byte			Ds3, v076
	.byte	W24
	.byte			Gs3
	.byte	W16
	.byte	PEND
	.byte	W72
song068_4_7:
	.byte	W08
	.byte		N09	, Gs2, v084
	.byte	W24
	.byte			Ds3, v060
	.byte	W24
	.byte			Gs3, v064
	.byte	W16
	.byte	PEND
	.byte	W08
	.byte			Cn4, v052
	.byte	W24
	.byte			Ds4, v076
	.byte	W24
	.byte			Gs4, v056
	.byte	W16
	.byte	W08
	.byte			Cs3, v084
	.byte	W24
	.byte			Gs3
	.byte	W24
	.byte			Cs4, v068
	.byte	W16
song068_4_3:
	.byte	W08
	.byte		N09	, Gs3, v068
	.byte	W24
	.byte			Cs3
	.byte	W40
	.byte	PEND
	.byte	PATT	
		.word	song068_4_1
	.byte	W08
	.byte		N09	, An3, v068
	.byte	W24
	.byte			Cs3
	.byte	W40
	.byte	PATT	
		.word	song068_4_2
	.byte	PATT	
		.word	song068_4_3
	.byte	PATT	
		.word	song068_4_4
	.byte	W08
	.byte		N09	, An3, v068
	.byte	W24
	.byte			Cs3
	.byte	W24
	.byte			Bn2
	.byte	W16
	.byte	PATT	
		.word	song068_4_5
	.byte	W08
	.byte		N09	, En3, v068
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			En2
	.byte	W16
	.byte	W08
	.byte			Fs2, v064
	.byte	W24
	.byte			Cs3, v072
	.byte	W24
	.byte			An3, v064
	.byte	W16
	.byte	W08
	.byte			Cs3
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			En2
	.byte	W16
	.byte	PATT	
		.word	song068_4_6
	.byte	W08
	.byte		N09	, Ds3, v064
	.byte	W24
	.byte			Gs2
	.byte	W24
	.byte			Ds3
	.byte	W16
	.byte	PATT	
		.word	song068_4_7
	.byte	W08
	.byte		N09	, Ds3, v052
	.byte	W24
	.byte			Cn3, v076
	.byte	W24
	.byte			Gs2, v056
	.byte	W16
	.byte	W08
	.byte			Cs3, v076
	.byte	W24
	.byte			En3, v084
	.byte	W24
	.byte			Gs3
	.byte	W16
	.byte	W72
	.byte	W08
	.byte			Fs2, v092
	.byte	W24
	.byte			Cs3
	.byte	W24
	.byte			Gs3
	.byte	W16
	.byte	W32
	.byte			Fs3, v080
	.byte	W40
	.byte	W08
	.byte			Bn2
	.byte	W24
	.byte			Fs3, v076
	.byte	W24
	.byte			Bn3, v072
	.byte	W16
	.byte	W72
	.byte	W08
	.byte			Gs2, v092
	.byte	W24
	.byte			Ds3, v064
	.byte	W24
	.byte			Gs3, v072
	.byte	W16
	.byte	W72
	.byte	W08
	.byte			An2
	.byte	W24
	.byte			En3, v080
	.byte	W24
	.byte			An3, v072
	.byte	W16
	.byte	W32
	.byte			En3
	.byte	W24
	.byte			Cs3, v060
	.byte	W16
	.byte	W08
	.byte			Fs2, v092
	.byte	W24
	.byte			Cs3, v076
	.byte	W24
	.byte			An3
	.byte	W16
	.byte	W08
	.byte			Cs3
	.byte	W24
	.byte			Fs2, v092
	.byte	W24
	.byte			Cs3, v076
	.byte	W16
	.byte	W08
	.byte			Ds2, v084
	.byte	W24
	.byte			Gn2, v064
	.byte	W24
	.byte			Cs3
	.byte	W16
	.byte	W08
	.byte			Ds3
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte			Ds3, v076
	.byte	W16
	.byte	W08
	.byte			Gs2, v084
	.byte	W24
	.byte			Ds3, v076
	.byte	W24
	.byte			Cn4, v068
	.byte	W16
	.byte	W08
	.byte			Gs3, v076
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte			Gs2
	.byte	W16
	.byte	GOTO	
		.word	song068_4_8
	.byte	FINE

	.align 2
	.global song068
song068:	@ 0x08574664
	.byte	4		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	178		@ reverb

	.word	voicegroup027		@ voicegroup/tone

	.word	song068_1		@ track
	.word	song068_2		@ track
	.word	song068_3		@ track
	.word	song068_4		@ track
