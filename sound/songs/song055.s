	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song055_1
song055_1:	@ 0x0856DF3C
	.byte	KEYSH	, 0
song055_1_1:
	.byte	TEMPO	, 55
	.byte	VOICE	, 70
	.byte	VOL	, v052
	.byte	PAN	, c_v+1
	.byte		N11	, Dn2, v120
	.byte		N11	, Fs2
	.byte	W12
	.byte		N03	, Cs2, v116
	.byte		N03	, En2
	.byte	W04
	.byte			Dn2, v104
	.byte		N03	, Fs2
	.byte	W04
	.byte			Cs2, v108
	.byte		N03	, En2
	.byte	W04
	.byte		N05	, Bn1, v112
	.byte		N05	, Dn2
	.byte	W12
	.byte		N04	, Cs2
	.byte		N04	, En2
	.byte	W12
	.byte			Dn2
	.byte		N04	, Fs2
	.byte	W12
	.byte			Fs2, v116
	.byte		N04	, An2
	.byte	W12
	.byte		N11	, En2, v100
	.byte		N11	, Gs2
	.byte	W12
	.byte		N03	, Dn2, v096
	.byte		N03	, Fs2
	.byte	W04
	.byte			En2, v088
	.byte		N03	, Gs2
	.byte	W04
	.byte			Dn2, v080
	.byte		N03	, Fs2
	.byte	W04
	.byte		N07	, Cs2, v112
	.byte		N07	, En2
	.byte	W12
	.byte		N04	, Dn2
	.byte		N04	, Fs2
	.byte	W12
	.byte			En2, v100
	.byte		N04	, Gs2
	.byte	W12
	.byte			Gs2, v108
	.byte		N04	, Bn2
	.byte	W12
	.byte		N11	, An2, v112
	.byte		N11	, Cs3
	.byte	W12
	.byte		N03	, Gs2, v104
	.byte		N03	, Bn2
	.byte	W04
	.byte			An2, v100
	.byte		N03	, Cs3
	.byte	W04
	.byte			Gs2, v104
	.byte		N03	, Bn2
	.byte	W04
	.byte		N02	, Fs2, v100
	.byte		N02	, An2
	.byte	W12
	.byte		N03	, En2, v096
	.byte		N03	, Gs2
	.byte	W12
	.byte			Dn2, v116
	.byte		N03	, Fs2
	.byte	W12
	.byte		N04	, Cs2, v112
	.byte		N04	, En2
	.byte	W12
	.byte		N52	, Dn2
	.byte		N52	, Fs2
	.byte	W72
	.byte	W72
	.byte	W72
	.byte		N11	, En1
	.byte	W12
	.byte			Fs1, v104
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte			An1, v092
	.byte	W12
	.byte			Bn1, v100
	.byte	W12
	.byte			Cs2, v112
	.byte	W12
	.byte			Bn1, v100
	.byte	W12
	.byte			Cs2, v112
	.byte	W12
	.byte			Dn2, v104
	.byte	W12
	.byte			En2
	.byte	W12
	.byte			Fs2, v108
	.byte	W12
	.byte			Gs2, v088
	.byte	W12
	.byte	GOTO	
		.word	song055_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song055_2
song055_2:	@ 0x0856DFF7
	.byte	KEYSH	, 0
song055_2_1:
	.byte	VOICE	, 104
	.byte	VOL	, v030
	.byte	PAN	, c_v+9
	.byte		N06	, Dn3, v092
	.byte	W24
	.byte		N23	, Dn3, v080
	.byte	W24
	.byte			En3, v084
	.byte	W24
	.byte		N06	, Dn3, v092
	.byte	W24
	.byte		N23	, Dn3, v076
	.byte	W24
	.byte			En3, v088
	.byte	W24
	.byte		N06	, Dn3, v092
	.byte	W24
	.byte		N23	, Dn3, v076
	.byte	W24
	.byte			Cs3, v068
	.byte	W24
	.byte		N06	, Dn3, v080
	.byte	W24
	.byte		N40	
	.byte	W48
	.byte		N11	, Dn3, v084
	.byte	W12
	.byte		N04	, Cs3, v092
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			An2, v088
	.byte	W12
	.byte			Gn2, v092
	.byte	W12
	.byte		N03	, Fs2, v096
	.byte	W12
	.byte		N06	, En2, v088
	.byte	W12
	.byte		N05	, En2, v092
	.byte	W06
	.byte			Fs2, v088
	.byte	W06
	.byte		N32	, Gn2
	.byte	W48
	.byte		N11	, En2, v084
	.byte	W12
	.byte			Fs2, v088
	.byte	W12
	.byte			En2, v084
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Gn2, v088
	.byte	W12
	.byte			An2, v084
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			An2, v088
	.byte	W12
	.byte			Bn2, v076
	.byte	W12
	.byte			Cs3, v088
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N02	, En3, v096
	.byte	W12
	.byte	GOTO	
		.word	song055_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song055_3
song055_3:	@ 0x0856E071
	.byte	KEYSH	, 0
song055_3_1:
	.byte	VOICE	, 104
	.byte	VOL	, v022
	.byte	PAN	, c_v-6
	.byte		N11	, Bn2, v096
	.byte	W12
	.byte		N08	, Fs3, v104
	.byte	W12
	.byte		N06	, Bn2, v080
	.byte	W12
	.byte		N07	, Fs3, v112
	.byte	W12
	.byte		N06	, Bn2, v080
	.byte	W12
	.byte		N04	, En3, v108
	.byte	W12
	.byte		N11	, Bn2, v104
	.byte	W12
	.byte		N05	, Fs3, v108
	.byte	W24
	.byte			An3, v112
	.byte	W24
	.byte		N04	, Gs3, v108
	.byte	W12
	.byte		N11	, Bn2, v104
	.byte	W12
	.byte		N05	, Fs3, v108
	.byte	W24
	.byte			Fs3, v112
	.byte	W24
	.byte		N04	, En3, v108
	.byte	W12
	.byte		N11	, Bn2, v104
	.byte	W12
	.byte		N06	, Fs3, v112
	.byte	W24
	.byte		N05	, Gs3, v108
	.byte	W24
	.byte		N04	, An3
	.byte	W12
	.byte		N11	, En3, v104
	.byte	W12
	.byte		N06	, Bn3, v100
	.byte	W24
	.byte		N05	
	.byte	W24
	.byte			An3, v108
	.byte	W12
	.byte		N11	, En3
	.byte	W12
	.byte		N06	, Bn3
	.byte	W24
	.byte		N05	
	.byte	W24
	.byte		N04	
	.byte	W12
	.byte		N11	, En3, v112
	.byte	W12
	.byte		N05	, Bn3
	.byte	W24
	.byte			Bn3, v108
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N11	, En3
	.byte	W12
	.byte		N05	, Bn3
	.byte	W24
	.byte			An3, v112
	.byte	W24
	.byte			Gs3, v108
	.byte	W12
	.byte	GOTO	
		.word	song055_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song055_4
song055_4:	@ 0x0856E0F3
	.byte	KEYSH	, 0
song055_4_1:
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W48
	.byte	VOL	, v047
	.byte	PAN	, c_v-21
	.byte	W24
	.byte	VOICE	, 68
	.byte		N10	, Fs3, v116
	.byte		N10	, An3
	.byte	W12
	.byte		N03	, En3, v108
	.byte		N03	, Gs3
	.byte	W04
	.byte			Fs3, v104
	.byte		N03	, An3
	.byte	W04
	.byte			En3, v096
	.byte		N03	, Gs3
	.byte	W04
	.byte			Dn3, v112
	.byte		N03	, Fs3
	.byte	W12
	.byte			Cs3, v120
	.byte		N03	, En3
	.byte	W12
	.byte			Bn2, v112
	.byte		N03	, Dn3
	.byte	W12
	.byte			An2, v104
	.byte		N03	, Cs3
	.byte	W12
	.byte		N05	, Gn2, v124
	.byte		N05	, Bn2
	.byte	W12
	.byte			Gn2, v104
	.byte		N05	, Bn2
	.byte	W06
	.byte			An2
	.byte		N05	, Cs3
	.byte	W06
	.byte		N36	, Bn2, v096
	.byte		N36	, Dn3
	.byte	W48
	.byte		N11	, Gn2, v108
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			Gs3
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Gs3
	.byte	W12
	.byte	GOTO	
		.word	song055_4_1
	.byte	FINE

	@********************** Track  5 **********************@

	.global song055_5
song055_5:	@ 0x0856E15F
	.byte	KEYSH	, 0
song055_5_2:
	.byte	VOICE	, 127
	.byte	VOL	, v052
	.byte	PAN	, c_v
	.byte		N06	, EnM1, v080
	.byte	W12
	.byte			DsM1
	.byte	W06
	.byte			EnM1
	.byte	W06
	.byte			CnM1
	.byte		N06	, DnM1
	.byte	W12
	.byte			CnM1
	.byte		N06	, DnM1
	.byte		N06	, Ds0
	.byte	W12
	.byte			CsM1
	.byte	W12
	.byte			DnM1
	.byte		N06	, Ds0
	.byte	W12
	.byte			EnM1
	.byte	W12
	.byte			DsM1
	.byte	W06
	.byte			EnM1
	.byte	W06
	.byte			CnM1
	.byte		N06	, DnM1
	.byte	W12
	.byte			CnM1
	.byte		N06	, DnM1
	.byte	W12
	.byte		N12	, GnM2
	.byte	W12
	.byte		N06	, DnM1
	.byte	W12
	.byte			EnM1
	.byte	W12
	.byte			DsM1
	.byte	W06
	.byte			EnM1
	.byte	W06
	.byte			CnM1
	.byte		N06	, DnM1
	.byte	W12
	.byte			CnM1
	.byte		N06	, DnM1
	.byte	W12
	.byte			CsM1
	.byte		N06	, Dn0
	.byte	W12
	.byte			DnM1
	.byte		N06	, Cs0
	.byte	W12
	.byte			EnM1
	.byte		N06	, Dn0
	.byte	W12
	.byte			DsM1
	.byte		N06	, Cs0
	.byte	W06
	.byte			EnM1
	.byte	W06
	.byte			DnM1
	.byte		N06	, Dn0
	.byte	W12
	.byte			DnM1
	.byte		N06	, Cs0
	.byte	W12
	.byte			DnM1
	.byte		N06	, Fn0
	.byte	W12
	.byte			DnM1
	.byte		N06	, Fn0
	.byte	W12
song055_5_1:
	.byte		N06	, GsM2, v080
	.byte		N06	, CsM1
	.byte	W12
	.byte			GsM2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			FsM2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			CnM1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PEND
	.byte			GsM2
	.byte		N06	, CsM1
	.byte	W12
	.byte			GsM2
	.byte	W12
	.byte			GsM1
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			GnM1
	.byte	W12
	.byte			GsM1
	.byte	W12
	.byte	PATT	
		.word	song055_5_1
	.byte		N06	, DsM1, v080
	.byte	W12
	.byte			EnM1
	.byte	W12
	.byte			DsM1
	.byte	W12
	.byte			EnM1
	.byte	W12
	.byte			CnM1
	.byte		N06	, DnM1
	.byte	W12
	.byte			CnM1
	.byte		N06	, DnM1
	.byte	W06
	.byte			CnM1
	.byte	W06
	.byte	GOTO	
		.word	song055_5_2
	.byte	FINE

	.align 2
	.global song055
song055:	@ 0x0856E208
	.byte	5		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup019		@ voicegroup/tone

	.word	song055_1		@ track
	.word	song055_2		@ track
	.word	song055_3		@ track
	.word	song055_4		@ track
	.word	song055_5		@ track
