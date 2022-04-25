	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song083_1
song083_1:	@ 0x0857B5B4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 0
	.byte	VOL	, v000
	.byte	PAN	, c_v-64
	.byte	VOL	, v000
	.byte		TIE	, Dn3, v076
	.byte	W01
	.byte	VOL	, v001
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v060
	.byte	W48
song083_1_1:
	.byte	W72
	.byte	GOTO	
		.word	song083_1_1
	.byte	W24
	.byte		EOT	, Dn3
	.byte	FINE

	@********************** Track  2 **********************@

	.global song083_2
song083_2:	@ 0x0857B62F
	.byte	KEYSH	, 0
	.byte	VOICE	, 0
	.byte	VOL	, v000
	.byte	PAN	, c_v+63
	.byte	VOL	, v000
	.byte		TIE	, An2, v076
	.byte	W01
	.byte	VOL	, v001
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v060
	.byte	W48
song083_2_1:
	.byte	W72
	.byte	GOTO	
		.word	song083_2_1
	.byte	W24
	.byte		EOT	, An2
	.byte	FINE

	.align 2
	.global song083
song083:	@ 0x0857B6A8
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup092		@ voicegroup/tone

	.word	song083_1		@ track
	.word	song083_2		@ track
