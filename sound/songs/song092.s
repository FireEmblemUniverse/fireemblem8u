	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song092_1
song092_1:	@ 0x0857CF14
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 81
	.byte	VOL	, v090
	.byte	PAN	, c_v-10
	.byte	W02
	.byte		N07	, Ds4, v127
	.byte	W09
	.byte			Fn4
	.byte	W09
	.byte			Ds4
	.byte	W04
	.byte	W05
	.byte		N12	, Dn4
	.byte	W14
	.byte			Cn4
	.byte	W05
	.byte	W09
	.byte		N44	, Dn4
	.byte	W15
	.byte	W24
	.byte	W24
	.byte	FINE

	@********************** Track  2 **********************@

	.global song092_2
song092_2:	@ 0x0857CF34
	.byte	KEYSH	, 0
	.byte	VOICE	, 81
	.byte	PAN	, c_v+20
	.byte	VOL	, v056
	.byte	BENDR	, 1
	.byte	BEND	, c_v+6
	.byte	W05
	.byte		N07	, Ds4, v127
	.byte	W09
	.byte			Fn4
	.byte	W09
	.byte			Ds4
	.byte	W01
	.byte	W08
	.byte		N12	, Dn4
	.byte	W14
	.byte			Cn4
	.byte	W02
	.byte	W12
	.byte		N44	, Dn4
	.byte	W12
	.byte	W24
	.byte	W24
	.byte	FINE

	@********************** Track  3 **********************@

	.global song092_3
song092_3:	@ 0x0857CF56
	.byte	KEYSH	, 0
	.byte	VOICE	, 81
	.byte	PAN	, c_v+28
	.byte	LFOS	, 9
	.byte	LFODL	, 1
	.byte	MOD	, 4
	.byte	W02
	.byte	VOL	, v014
	.byte		TIE	, As3, v084
	.byte	W02
	.byte	VOL	, v019
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v051
	.byte	W02
	.byte		v058
	.byte	W02
	.byte		v064
	.byte	W02
	.byte		v070
	.byte	W02
	.byte		v077
	.byte	W02
	.byte		v082
	.byte	W02
	.byte		v090
	.byte	W22
	.byte	W12
	.byte		v089
	.byte	W04
	.byte		v082
	.byte	W04
	.byte		v075
	.byte	W04
	.byte		v069
	.byte	W04
	.byte		v063
	.byte	W04
	.byte		v056
	.byte	W04
	.byte		v050
	.byte	W04
	.byte		v043
	.byte	W04
	.byte		v036
	.byte	W04
	.byte		v030
	.byte	W04
	.byte		v024
	.byte	W04
	.byte		v017
	.byte	W04
	.byte		EOT	
	.byte	VOL	, v011
	.byte	W12
	.byte	FINE

	@********************** Track  4 **********************@

	.global song092_4
song092_4:	@ 0x0857CFA0
	.byte	KEYSH	, 0
	.byte	VOICE	, 81
	.byte	PAN	, c_v-28
	.byte	LFOS	, 9
	.byte	LFODL	, 2
	.byte	MOD	, 4
	.byte	W02
	.byte	VOL	, v014
	.byte		TIE	, Gs3, v084
	.byte	W02
	.byte	VOL	, v019
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v051
	.byte	W02
	.byte		v058
	.byte	W02
	.byte		v064
	.byte	W02
	.byte		v070
	.byte	W02
	.byte		v077
	.byte	W02
	.byte		v082
	.byte	W02
	.byte		v090
	.byte	W22
	.byte	W12
	.byte		v089
	.byte	W04
	.byte		v082
	.byte	W04
	.byte		v075
	.byte	W04
	.byte		v069
	.byte	W04
	.byte		v063
	.byte	W04
	.byte		v056
	.byte	W04
	.byte		v050
	.byte	W04
	.byte		v043
	.byte	W04
	.byte		v036
	.byte	W04
	.byte		v030
	.byte	W04
	.byte		v024
	.byte	W04
	.byte		v017
	.byte	W04
	.byte		EOT	
	.byte	VOL	, v011
	.byte	W12
	.byte	FINE

	.align 2
	.global song092
song092:	@ 0x0857CFEC
	.byte	4		@ trackCount
	.byte	0		@ blockCount
	.byte	60		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song092_1		@ track
	.word	song092_2		@ track
	.word	song092_3		@ track
	.word	song092_4		@ track
