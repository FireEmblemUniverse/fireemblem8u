	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song257_1
song257_1:	@ 0x0857F11C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 53
	.byte	VOL	, v127
	.byte	BEND	, c_v
	.byte		N72	, Cn3, v127
	.byte	W02
	.byte	VOL	, v126
	.byte	BEND	, c_v
	.byte	W06
	.byte	VOL	, v125
	.byte	W02
	.byte		v124
	.byte	W02
	.byte		v123
	.byte	W02
	.byte		v122
	.byte	W02
	.byte		v120
	.byte	W02
	.byte		v119
	.byte	W02
	.byte		v117
	.byte	W02
	.byte		v115
	.byte	W02
	.byte		v112
	.byte	W02
	.byte		v110
	.byte	W02
	.byte		v107
	.byte	W02
	.byte		v104
	.byte	W02
	.byte		v101
	.byte	W02
	.byte		v098
	.byte	W02
	.byte		v095
	.byte	W02
	.byte		v091
	.byte	W02
	.byte		v087
	.byte	W02
	.byte		v083
	.byte	W02
	.byte		v079
	.byte	W02
	.byte		v075
	.byte	W02
	.byte		v070
	.byte	W02
	.byte		v065
	.byte	W02
	.byte		v060
	.byte	W02
	.byte		v055
	.byte	W02
	.byte		v050
	.byte	W02
	.byte		v044
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v020
	.byte	W02
	.byte		v013
	.byte	W02
	.byte		v006
	.byte	W02
	.byte	FINE

	.align 2
	.global song257
song257:	@ 0x0857F174
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song257_1		@ track
