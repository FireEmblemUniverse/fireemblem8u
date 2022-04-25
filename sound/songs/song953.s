	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song953_1
song953_1:	@ 0x08586184
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 46
	.byte	VOL	, v002
	.byte		N96	, Cn2, v127
	.byte	W01
	.byte	VOL	, v008
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v111
	.byte	W01
	.byte		v115
	.byte	W48
	.byte	W01
	.byte		v114
	.byte	W01
	.byte		v110
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v000
	.byte	FINE

	@********************** Track  2 **********************@

	.global song953_2
song953_2:	@ 0x085861FC
	.byte	KEYSH	, 0
	.byte	VOICE	, 101
	.byte	VOL	, v036
	.byte		N06	, En2, v127
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			An2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			En2, v072
	.byte	W06
	.byte			Fn2, v040
	.byte	W06
	.byte			Cs2, v036
	.byte	W06
	.byte	FINE

	.align 2
	.global song953
song953:	@ 0x08586220
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song953_1		@ track
	.word	song953_2		@ track
