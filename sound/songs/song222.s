	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song222_1
song222_1:	@ 0x0857EB24
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 90
	.byte	BENDR	, 9
	.byte	VOL	, v050
	.byte	BEND	, c_v
	.byte		N48	, Fn3, v127
	.byte	W02
	.byte	VOL	, v062
	.byte	BEND	, c_v+1
	.byte	W02
	.byte	VOL	, v072
	.byte	BEND	, c_v+4
	.byte	W02
	.byte	VOL	, v077
	.byte	BEND	, c_v+9
	.byte	W02
	.byte	VOL	, v080
	.byte	BEND	, c_v+16
	.byte	W02
	.byte		c_v+25
	.byte	W02
	.byte		c_v+36
	.byte	W02
	.byte		c_v+49
	.byte	W02
	.byte		c_v+63
	.byte	W04
	.byte	VOL	, v070
	.byte	W02
	.byte		v061
	.byte	W02
	.byte		v053
	.byte	BEND	, c_v+62
	.byte	W02
	.byte	VOL	, v045
	.byte	BEND	, c_v+61
	.byte	W02
	.byte	VOL	, v039
	.byte	BEND	, c_v+58
	.byte	W02
	.byte	VOL	, v032
	.byte	BEND	, c_v+53
	.byte	W02
	.byte	VOL	, v027
	.byte	BEND	, c_v+47
	.byte	W02
	.byte	VOL	, v022
	.byte	BEND	, c_v+39
	.byte	W02
	.byte	VOL	, v017
	.byte	BEND	, c_v+29
	.byte	W02
	.byte	VOL	, v014
	.byte	BEND	, c_v+17
	.byte	W02
	.byte	VOL	, v011
	.byte	BEND	, c_v+3
	.byte	W02
	.byte	VOL	, v008
	.byte	BEND	, c_v-12
	.byte	W02
	.byte	VOL	, v007
	.byte	BEND	, c_v-30
	.byte	W02
	.byte	VOL	, v006
	.byte	BEND	, c_v-48
	.byte	W02
	.byte	W24
	.byte	FINE

	.align 2
	.global song222
song222:	@ 0x0857EB94
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song222_1		@ track
