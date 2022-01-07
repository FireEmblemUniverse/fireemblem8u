	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song317_1
song317_1:	@ 0x0857FDF0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 19
	.byte	VOL	, v127
	.byte	MOD	, 0
	.byte	BENDR	, 12
	.byte	BEND	, c_v-64
	.byte		TIE	, Gn2, v127
	.byte	W04
	.byte	BEND	, c_v-60
	.byte	W04
	.byte		c_v-56
	.byte	W04
	.byte		c_v-51
	.byte	W04
	.byte		c_v-47
	.byte	W04
	.byte		c_v-43
	.byte	W04
	.byte		c_v-38
	.byte	W04
	.byte		c_v-34
	.byte	W04
	.byte		c_v-30
	.byte	W04
	.byte		c_v-25
	.byte	W04
	.byte		c_v-21
	.byte	W04
	.byte		c_v-17
	.byte	W04
	.byte		c_v-12
	.byte	W04
	.byte		c_v-8
	.byte	W04
	.byte		c_v-4
	.byte	W04
	.byte		c_v+1
	.byte	W04
	.byte		c_v+5
	.byte	W04
	.byte		c_v+9
	.byte	W04
	.byte		c_v+14
	.byte	W04
	.byte		c_v+18
	.byte	W04
	.byte		c_v+22
	.byte	W04
	.byte	VOL	, v126
	.byte	BEND	, c_v+27
	.byte	W02
	.byte	VOL	, v113
	.byte	W02
	.byte		v101
	.byte	BEND	, c_v+31
	.byte	W02
	.byte	VOL	, v090
	.byte	W02
	.byte		v079
	.byte	BEND	, c_v+35
	.byte	W02
	.byte	VOL	, v069
	.byte	W02
	.byte		v060
	.byte	BEND	, c_v+40
	.byte	W02
	.byte	VOL	, v052
	.byte	W02
	.byte		v044
	.byte	BEND	, c_v+44
	.byte	W02
	.byte	VOL	, v037
	.byte	W02
	.byte		v031
	.byte	BEND	, c_v+48
	.byte	W02
	.byte	VOL	, v025
	.byte	W02
	.byte		v021
	.byte	BEND	, c_v+53
	.byte	W02
	.byte	VOL	, v017
	.byte	W02
	.byte		v013
	.byte	BEND	, c_v+57
	.byte	W02
	.byte	VOL	, v011
	.byte	W02
	.byte		v009
	.byte	BEND	, c_v+61
	.byte	W02
	.byte	VOL	, v008
	.byte	W02
	.byte		EOT	
	.byte	FINE

	.align 2
	.global song317
song317:	@ 0x0857FE70
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song317_1		@ track
