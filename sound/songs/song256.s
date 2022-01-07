	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song256_1
song256_1:	@ 0x0857F090
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 54
	.byte	VOL	, v110
	.byte	BENDR	, 12
	.byte	BEND	, c_v-64
	.byte		N72	, Dn3, v127
	.byte	W02
	.byte	BEND	, c_v-63
	.byte	W02
	.byte		c_v-60
	.byte	W02
	.byte		c_v-55
	.byte	W02
	.byte		c_v-48
	.byte	W02
	.byte		c_v-39
	.byte	W02
	.byte		c_v-28
	.byte	W02
	.byte		c_v-15
	.byte	W02
	.byte		c_v
	.byte	W02
	.byte		c_v
	.byte	W02
	.byte		c_v
	.byte	W02
	.byte		c_v+1
	.byte	W02
	.byte		c_v+1
	.byte	W02
	.byte		c_v+3
	.byte	W02
	.byte		c_v+4
	.byte	W02
	.byte		c_v+5
	.byte	W02
	.byte		c_v+7
	.byte	W02
	.byte		c_v+9
	.byte	W02
	.byte		c_v+12
	.byte	W02
	.byte		c_v+14
	.byte	W02
	.byte	VOL	, v110
	.byte	BEND	, c_v+17
	.byte	W02
	.byte	VOL	, v096
	.byte	BEND	, c_v+20
	.byte	W02
	.byte	VOL	, v084
	.byte	BEND	, c_v+23
	.byte	W02
	.byte	VOL	, v071
	.byte	BEND	, c_v+27
	.byte	W02
	.byte	VOL	, v061
	.byte	BEND	, c_v+31
	.byte	W02
	.byte	VOL	, v051
	.byte	BEND	, c_v+34
	.byte	W02
	.byte	VOL	, v042
	.byte	BEND	, c_v+39
	.byte	W02
	.byte	VOL	, v034
	.byte	BEND	, c_v+43
	.byte	W02
	.byte	VOL	, v026
	.byte	BEND	, c_v+48
	.byte	W02
	.byte	VOL	, v020
	.byte	BEND	, c_v+53
	.byte	W02
	.byte	VOL	, v014
	.byte	BEND	, c_v+58
	.byte	W02
	.byte	VOL	, v010
	.byte	BEND	, c_v+63
	.byte	W02
	.byte	VOL	, v006
	.byte	W02
	.byte		v003
	.byte	W02
	.byte		v001
	.byte	W02
	.byte		v000
	.byte	W02
	.byte	W24
	.byte	FINE

	.align 2
	.global song256
song256:	@ 0x0857F110
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song256_1		@ track
