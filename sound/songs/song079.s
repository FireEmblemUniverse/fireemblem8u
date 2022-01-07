	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song079_1
song079_1:	@ 0x0857A460
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 80
	.byte	VOL	, v000
	.byte	PAN	, c_v
	.byte	VOL	, v002
	.byte		TIE	, Cn3, v116
	.byte	W01
	.byte	VOL	, v005
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v104
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v110
	.byte	W01
	.byte		v112
	.byte	W01
	.byte		v116
	.byte	W01
	.byte		v119
	.byte	W01
	.byte		v121
	.byte	W01
	.byte		v124
	.byte	W01
	.byte		v127
	.byte	W48
	.byte	W02
	.byte	W48
	.byte		v125
	.byte	W01
	.byte		v122
	.byte	W01
	.byte		v120
	.byte	W01
	.byte		v117
	.byte	W01
	.byte		v114
	.byte	W01
	.byte		v112
	.byte	W01
	.byte		v109
	.byte	W01
	.byte		v106
	.byte	W01
	.byte		v104
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		EOT	
	.byte	VOL	, v000
	.byte	FINE

	.align 2
	.global song079
song079:	@ 0x0857A534
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song079_1		@ track
