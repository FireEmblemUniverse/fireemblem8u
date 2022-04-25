	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song130_1
song130_1:	@ 0x0857D8D8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 30
	.byte	BENDR	, 1
	.byte	VOL	, v056
	.byte	BEND	, c_v-64
	.byte		N64	, Cs3, v127
	.byte	W02
	.byte	VOL	, v069
	.byte	BEND	, c_v-54
	.byte	W02
	.byte	VOL	, v083
	.byte	BEND	, c_v-43
	.byte	W02
	.byte	VOL	, v097
	.byte	BEND	, c_v-33
	.byte	W02
	.byte	VOL	, v112
	.byte	BEND	, c_v-22
	.byte	W02
	.byte		c_v-11
	.byte	W02
	.byte		c_v
	.byte	W12
	.byte	W16
	.byte	VOL	, v105
	.byte	W02
	.byte		v097
	.byte	W02
	.byte		v089
	.byte	W02
	.byte		v081
	.byte	W02
	.byte		v073
	.byte	W02
	.byte		v065
	.byte	W02
	.byte		v057
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v041
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v017
	.byte	W10
	.byte	FINE

	.align 2
	.global song130
song130:	@ 0x0857D91C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song130_1		@ track
