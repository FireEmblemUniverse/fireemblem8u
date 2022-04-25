	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song140_1
song140_1:	@ 0x0857DBE8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 37
	.byte	BENDR	, 10
	.byte	MODT	, 1
	.byte	LFOS	, 60
	.byte	MOD	, 10
	.byte	VOL	, v069
	.byte	BEND	, c_v-64
	.byte		N96	, Gn3, v127
	.byte	W02
	.byte	VOL	, v112
	.byte	BEND	, c_v-54
	.byte	W02
	.byte	VOL	, v127
	.byte	BEND	, c_v-45
	.byte	W02
	.byte		c_v-37
	.byte	W02
	.byte		c_v-29
	.byte	W02
	.byte		c_v-22
	.byte	W02
	.byte		c_v-17
	.byte	W02
	.byte		c_v-12
	.byte	W02
	.byte		c_v-8
	.byte	W02
	.byte		c_v-5
	.byte	W02
	.byte		c_v-2
	.byte	W02
	.byte		c_v-1
	.byte	W02
	.byte		c_v
	.byte	W06
	.byte		c_v+4
	.byte	W02
	.byte		c_v+12
	.byte	W02
	.byte		c_v+11
	.byte	W02
	.byte		c_v+10
	.byte	W02
	.byte		c_v+9
	.byte	W02
	.byte		c_v+8
	.byte	W02
	.byte		c_v+8
	.byte	W02
	.byte		c_v+7
	.byte	W02
	.byte		c_v+6
	.byte	W02
	.byte		c_v+5
	.byte	W02
	.byte		c_v+4
	.byte	W02
	.byte		c_v+4
	.byte	W02
	.byte		c_v+3
	.byte	W02
	.byte		c_v+2
	.byte	W02
	.byte		c_v+1
	.byte	W10
	.byte		c_v
	.byte	W02
	.byte		c_v
	.byte	W02
	.byte	VOL	, v126
	.byte	BEND	, c_v
	.byte	W02
	.byte	VOL	, v125
	.byte	BEND	, c_v
	.byte	W02
	.byte	VOL	, v122
	.byte	BEND	, c_v+1
	.byte	W02
	.byte	VOL	, v117
	.byte	BEND	, c_v+2
	.byte	W02
	.byte	VOL	, v111
	.byte	BEND	, c_v+5
	.byte	W02
	.byte	VOL	, v103
	.byte	BEND	, c_v+8
	.byte	W02
	.byte	VOL	, v093
	.byte	BEND	, c_v+11
	.byte	W02
	.byte	VOL	, v081
	.byte	BEND	, c_v+15
	.byte	W02
	.byte	VOL	, v067
	.byte	BEND	, c_v+20
	.byte	W02
	.byte	VOL	, v052
	.byte	BEND	, c_v+25
	.byte	W02
	.byte	VOL	, v034
	.byte	BEND	, c_v+32
	.byte	W02
	.byte	VOL	, v016
	.byte	W02
	.byte	FINE

	.align 2
	.global song140
song140:	@ 0x0857DC7C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song140_1		@ track
