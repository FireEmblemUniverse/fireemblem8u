	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song954_1
song954_1:	@ 0x08586230
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 46
	.byte	VOL	, v011
	.byte		N60	, Fn2, v127
	.byte	W01
	.byte	VOL	, v030
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v099
	.byte	W18
	.byte		v098
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	FINE

	@********************** Track  2 **********************@

	.global song954_2
song954_2:	@ 0x085862A1
	.byte	KEYSH	, 0
	.byte	VOICE	, 101
	.byte	VOL	, v031
	.byte		N06	, Gn2, v127
	.byte	W06
	.byte			An2
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Bn2, v072
	.byte	W06
	.byte			As2, v040
	.byte	W06
	.byte			Gs2, v036
	.byte	W06
	.byte	FINE

	.align 2
	.global song954
song954:	@ 0x085862C0
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song954_1		@ track
	.word	song954_2		@ track
