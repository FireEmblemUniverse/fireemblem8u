	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song740_1
song740_1:	@ 0x0858338C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 80
	.byte	VOL	, v115
	.byte		N06	, En3, v127
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn3, v052
	.byte	W06
	.byte			Fn3, v092
	.byte	W06
	.byte			Fn3, v040
	.byte	W06
	.byte			Fn3, v100
	.byte	W06
	.byte			Gs3, v127
	.byte	W06
	.byte			Gs3, v052
	.byte	W06
	.byte			Gs3, v040
	.byte	W06
	.byte	FINE

	@********************** Track  2 **********************@

	.global song740_2
song740_2:	@ 0x085833BC
	.byte	KEYSH	, 0
	.byte	VOICE	, 82
	.byte	VOL	, v001
	.byte	BENDR	, 8
	.byte	VOL	, v004
	.byte	BEND	, c_v
	.byte		N90	, En3, v084
	.byte	W01
	.byte	VOL	, v009
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v108
	.byte	W01
	.byte		v114
	.byte	W01
	.byte		v109
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v112
	.byte	W01
	.byte		v110
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v109
	.byte	W01
	.byte		v115
	.byte	W01
	.byte		v105
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v095
	.byte	BEND	, c_v+19
	.byte	W01
	.byte	VOL	, v088
	.byte	BEND	, c_v+39
	.byte	W01
	.byte	VOL	, v078
	.byte	BEND	, c_v+63
	.byte	W01
	.byte	VOL	, v068
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v000
	.byte	W06
	.byte	FINE

	.align 2
	.global song740
song740:	@ 0x08583484
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song740_1		@ track
	.word	song740_2		@ track
