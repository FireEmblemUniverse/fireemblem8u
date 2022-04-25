	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song221_1
song221_1:	@ 0x0857EAC4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 21
	.byte	BENDR	, 12
	.byte	VOL	, v050
	.byte	BEND	, c_v+63
	.byte		N60	, En3, v127
	.byte	W02
	.byte	VOL	, v051
	.byte	BEND	, c_v+54
	.byte	W02
	.byte	VOL	, v054
	.byte	BEND	, c_v+45
	.byte	W02
	.byte	VOL	, v060
	.byte	BEND	, c_v+37
	.byte	W02
	.byte	VOL	, v069
	.byte	BEND	, c_v+29
	.byte	W02
	.byte	VOL	, v080
	.byte	BEND	, c_v+22
	.byte	W02
	.byte	VOL	, v093
	.byte	BEND	, c_v+15
	.byte	W02
	.byte	VOL	, v109
	.byte	BEND	, c_v+8
	.byte	W02
	.byte	VOL	, v127
	.byte	BEND	, c_v+2
	.byte	W02
	.byte		c_v-3
	.byte	W02
	.byte		c_v-8
	.byte	W02
	.byte		c_v-13
	.byte	W02
	.byte		c_v-17
	.byte	W02
	.byte		c_v-21
	.byte	W02
	.byte		c_v-24
	.byte	W02
	.byte		c_v-26
	.byte	W02
	.byte		c_v-29
	.byte	W02
	.byte		c_v-30
	.byte	W02
	.byte		c_v-32
	.byte	W02
	.byte		c_v-32
	.byte	W02
	.byte		c_v-32
	.byte	W08
	.byte	W24
	.byte	FINE

	.align 2
	.global song221
song221:	@ 0x0857EB18
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song221_1		@ track
