	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song297_1
song297_1:	@ 0x0857FA80
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 52
	.byte	VOL	, v110
	.byte		N72	, Ds3, v127
	.byte	W02
	.byte	VOL	, v109
	.byte	W06
	.byte		v108
	.byte	W02
	.byte		v107
	.byte	W02
	.byte		v106
	.byte	W02
	.byte		v105
	.byte	W02
	.byte		v104
	.byte	W02
	.byte		v103
	.byte	W02
	.byte		v101
	.byte	W02
	.byte		v099
	.byte	W02
	.byte		v097
	.byte	W02
	.byte		v096
	.byte	W02
	.byte		v094
	.byte	W02
	.byte		v091
	.byte	W02
	.byte		v089
	.byte	W02
	.byte		v086
	.byte	W02
	.byte		v084
	.byte	W02
	.byte		v081
	.byte	W02
	.byte		v077
	.byte	W02
	.byte		v074
	.byte	W02
	.byte		v071
	.byte	W02
	.byte		v067
	.byte	W02
	.byte		v064
	.byte	W02
	.byte		v059
	.byte	W02
	.byte		v056
	.byte	W02
	.byte		v051
	.byte	W02
	.byte		v047
	.byte	W02
	.byte		v043
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v018
	.byte	W02
	.byte		v012
	.byte	W02
	.byte	FINE

	.align 2
	.global song297
song297:	@ 0x0857FAD0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song297_1		@ track
