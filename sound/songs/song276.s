	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song276_1
song276_1:	@ 0x0857F5EC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 42
	.byte	BENDR	, 12
	.byte	MODT	, 1
	.byte	LFOS	, 60
	.byte	MOD	, 10
	.byte	VOL	, v069
	.byte	BEND	, c_v-64
	.byte		TIE	, Gn3, v127
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
	.byte	W20
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
	.byte	W02
	.byte		c_v
	.byte	W02
	.byte		c_v
	.byte	W22
	.byte	W01
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
	.byte	W01
	.byte	W01
	.byte		c_v+2
	.byte	W02
	.byte		c_v+1
	.byte	W02
	.byte		c_v
	.byte	W02
	.byte		c_v
	.byte	W17
	.byte	W07
	.byte		c_v+12
	.byte	W02
	.byte		c_v+11
	.byte	W02
	.byte		c_v+10
	.byte	W02
	.byte		c_v+9
	.byte	W02
	.byte		c_v+9
	.byte	W02
	.byte		c_v+8
	.byte	W02
	.byte		c_v+7
	.byte	W02
	.byte		c_v+6
	.byte	W02
	.byte		c_v+5
	.byte	W01
	.byte	W01
	.byte		c_v+4
	.byte	W02
	.byte		c_v+4
	.byte	W02
	.byte		c_v+3
	.byte	W02
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+1
	.byte	W02
	.byte		c_v
	.byte	W02
	.byte		c_v
	.byte	W01
	.byte	VOL	, v127
	.byte	W01
	.byte	BEND	, c_v+2
	.byte	W01
	.byte	VOL	, v126
	.byte	W01
	.byte	BEND	, c_v+5
	.byte	W01
	.byte	VOL	, v125
	.byte	W01
	.byte	BEND	, c_v+9
	.byte	W01
	.byte	VOL	, v123
	.byte	W01
	.byte	BEND	, c_v+14
	.byte	W01
	.byte	VOL	, v119
	.byte	W01
	.byte	BEND	, c_v+20
	.byte	W01
	.byte	VOL	, v114
	.byte	BEND	, c_v+24
	.byte	W02
	.byte	VOL	, v108
	.byte	W02
	.byte		v101
	.byte	W02
	.byte		v092
	.byte	W02
	.byte		v081
	.byte	W02
	.byte		v069
	.byte	W02
	.byte		v056
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v008
	.byte	W02
	.byte		EOT	
	.byte	VOL	, v000
	.byte	W04
	.byte	FINE

	.align 2
	.global song276
song276:	@ 0x0857F6C4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song276_1		@ track
