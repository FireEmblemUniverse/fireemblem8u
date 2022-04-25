	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song964_1
song964_1:	@ 0x085865C4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 41
	.byte	VOL	, v035
	.byte	PAN	, c_v
	.byte	BEND	, c_v-61
	.byte		N30	, Gn2, v127
	.byte	W01
	.byte	VOL	, v037
	.byte	BEND	, c_v-58
	.byte	W01
	.byte	VOL	, v038
	.byte	BEND	, c_v-55
	.byte	W01
	.byte	VOL	, v039
	.byte	BEND	, c_v-49
	.byte	W01
	.byte	VOL	, v041
	.byte	BEND	, c_v-45
	.byte	W01
	.byte	VOL	, v042
	.byte	BEND	, c_v-42
	.byte	W01
	.byte	VOL	, v044
	.byte	BEND	, c_v-36
	.byte	W01
	.byte	VOL	, v045
	.byte	BEND	, c_v-33
	.byte	W01
	.byte	VOL	, v047
	.byte	BEND	, c_v-30
	.byte	W01
	.byte	VOL	, v048
	.byte	BEND	, c_v-23
	.byte	W01
	.byte	VOL	, v050
	.byte	BEND	, c_v-20
	.byte	W01
	.byte	VOL	, v051
	.byte	BEND	, c_v-17
	.byte	W01
	.byte	VOL	, v052
	.byte	BEND	, c_v-11
	.byte	W01
	.byte	VOL	, v054
	.byte	BEND	, c_v-7
	.byte	W01
	.byte	VOL	, v056
	.byte	BEND	, c_v-4
	.byte	W01
	.byte	VOL	, v057
	.byte	BEND	, c_v+2
	.byte	W01
	.byte	VOL	, v058
	.byte	BEND	, c_v+5
	.byte	W01
	.byte	VOL	, v060
	.byte	BEND	, c_v+9
	.byte	W01
	.byte	VOL	, v061
	.byte	BEND	, c_v+15
	.byte	W01
	.byte	VOL	, v062
	.byte	BEND	, c_v+18
	.byte	W01
	.byte	VOL	, v064
	.byte	BEND	, c_v+21
	.byte	W01
	.byte	VOL	, v066
	.byte	BEND	, c_v+28
	.byte	W01
	.byte	VOL	, v066
	.byte	BEND	, c_v+31
	.byte	W01
	.byte	VOL	, v068
	.byte	BEND	, c_v+34
	.byte	W01
	.byte	VOL	, v070
	.byte	BEND	, c_v+40
	.byte	W01
	.byte	VOL	, v071
	.byte	BEND	, c_v+43
	.byte	W01
	.byte	VOL	, v072
	.byte	BEND	, c_v+47
	.byte	W01
	.byte	VOL	, v074
	.byte	BEND	, c_v+53
	.byte	W01
	.byte	VOL	, v076
	.byte	BEND	, c_v+56
	.byte	W01
	.byte	VOL	, v077
	.byte	BEND	, c_v+59
	.byte	W01
	.byte	VOL	, v078
	.byte	BEND	, c_v+63
	.byte		N06	, Gn2, v088
	.byte	W01
	.byte	VOL	, v080
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v095
	.byte		N06	, Gn2, v056
	.byte	W01
	.byte	VOL	, v097
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v105
	.byte	W06
	.byte		N06	, Gn2, v032
	.byte	W06
	.byte	FINE

	@********************** Track  2 **********************@

	.global song964_2
song964_2:	@ 0x0858669B
	.byte	KEYSH	, 0
	.byte	VOICE	, 103
	.byte	VOL	, v049
	.byte	PAN	, c_v
	.byte		N06	, En3, v127
	.byte	W06
	.byte			En3, v088
	.byte	W06
	.byte			En3, v068
	.byte	W06
	.byte			En3, v044
	.byte	W06
	.byte	FINE

	@********************** Track  3 **********************@

	.global song964_3
song964_3:	@ 0x085866B1
	.byte	KEYSH	, 0
	.byte	VOICE	, 116
	.byte	VOL	, v105
	.byte	PAN	, c_v
	.byte		N78	, Gn3, v127
	.byte	W78
	.byte	FINE

	.align 2
	.global song964
song964:	@ 0x085866C0
	.byte	3		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song964_1		@ track
	.word	song964_2		@ track
	.word	song964_3		@ track
