	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song143_1
song143_1:	@ 0x0857DDAC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 87
	.byte	MODT	, 2
	.byte	MOD	, 30
	.byte	LFOS	, 12
	.byte	BENDR	, 1
	.byte	VOL	, v064
	.byte	BEND	, c_v
	.byte		TIE	, Cn3, v127
	.byte	W02
	.byte	BEND	, c_v+1
	.byte	W02
	.byte	VOL	, v065
	.byte	BEND	, c_v+3
	.byte	W02
	.byte	VOL	, v067
	.byte	BEND	, c_v+5
	.byte	W02
	.byte	VOL	, v071
	.byte	BEND	, c_v+7
	.byte	W02
	.byte	VOL	, v074
	.byte	BEND	, c_v+8
	.byte	W02
	.byte	VOL	, v079
	.byte	BEND	, c_v+10
	.byte	W02
	.byte	VOL	, v085
	.byte	BEND	, c_v+12
	.byte	W02
	.byte	VOL	, v092
	.byte	BEND	, c_v+14
	.byte	W02
	.byte	VOL	, v099
	.byte	BEND	, c_v+15
	.byte	W02
	.byte	VOL	, v107
	.byte	BEND	, c_v+17
	.byte	W02
	.byte	VOL	, v117
	.byte	BEND	, c_v+19
	.byte	W02
	.byte	VOL	, v127
	.byte	BEND	, c_v+21
	.byte	W02
	.byte		c_v+23
	.byte	W02
	.byte		c_v+24
	.byte	W02
	.byte		c_v+26
	.byte	W02
	.byte		c_v+28
	.byte	W02
	.byte		c_v+30
	.byte	W02
	.byte		c_v+32
	.byte	W12
	.byte	W24
	.byte	W24
	.byte	W12
	.byte	VOL	, v126
	.byte	W04
	.byte		v125
	.byte	W05
	.byte		v124
	.byte	W03
	.byte	W02
	.byte		v123
	.byte	W05
	.byte		v121
	.byte	W05
	.byte		v119
	.byte	W04
	.byte		v117
	.byte	W04
	.byte		v114
	.byte	W04
	.byte		v111
	.byte	W04
	.byte		v108
	.byte	W04
	.byte		v105
	.byte	W04
	.byte		v101
	.byte	W04
	.byte		v096
	.byte	W04
	.byte		v092
	.byte	W04
	.byte		v087
	.byte	W04
	.byte		v081
	.byte	W04
	.byte		v076
	.byte	W04
	.byte		v069
	.byte	W04
	.byte		v063
	.byte	W04
	.byte		v056
	.byte	W04
	.byte		v049
	.byte	W04
	.byte		v042
	.byte	W04
	.byte		v034
	.byte	W04
	.byte		v026
	.byte	W04
	.byte		v017
	.byte	W04
	.byte		v009
	.byte	W04
	.byte		EOT	
	.byte	FINE

	.align 2
	.global song143
song143:	@ 0x0857DE44
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	52		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song143_1		@ track
