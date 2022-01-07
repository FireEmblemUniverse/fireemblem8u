	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song941_1
song941_1:	@ 0x0858538C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 46
	.byte	VOL	, v065
	.byte	BENDR	, 12
	.byte	BEND	, c_v
	.byte		N11	, An2, v127
	.byte	W12
	.byte		N17	
	.byte	W01
	.byte	VOL	, v064
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v000
	.byte	FINE

	@********************** Track  2 **********************@

	.global song941_2
song941_2:	@ 0x085853CB
	.byte	KEYSH	, 0
	.byte	VOICE	, 100
	.byte	VOL	, v028
	.byte	BENDR	, 12
	.byte	BEND	, c_v
	.byte		N05	, Ds2, v072
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Ds2, v076
	.byte	W06
	.byte			Ds2, v032
	.byte	W05
	.byte	FINE

	@********************** Track  3 **********************@

	.global song941_3
song941_3:	@ 0x085853E4
	.byte	KEYSH	, 0
	.byte	VOICE	, 47
	.byte	VOL	, v090
	.byte	BENDR	, 12
	.byte	BEND	, c_v-58
	.byte		N11	, Ds4, v127
	.byte	W01
	.byte	BEND	, c_v-52
	.byte	W01
	.byte		c_v-46
	.byte	W01
	.byte		c_v-34
	.byte	W01
	.byte		c_v-28
	.byte	W01
	.byte		c_v-21
	.byte	W01
	.byte		c_v-9
	.byte	W01
	.byte		c_v
	.byte	W04
	.byte	VOL	, v090
	.byte	W01
	.byte		v085
	.byte		N17	
	.byte	W01
	.byte	VOL	, v080
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	FINE

	.align 2
	.global song941
song941:	@ 0x08585430
	.byte	3		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song941_1		@ track
	.word	song941_2		@ track
	.word	song941_3		@ track
