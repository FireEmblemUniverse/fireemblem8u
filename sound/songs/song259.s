	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song259_1
song259_1:	@ 0x0857F1E8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 3
	.byte	VOL	, v127
	.byte	BENDR	, 8
	.byte	BEND	, c_v
	.byte		TIE	, Dn3, v127
	.byte	W02
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W02
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte		c_v+1
	.byte	W02
	.byte		c_v+1
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v+3
	.byte	W01
	.byte		c_v+3
	.byte	W01
	.byte		c_v+3
	.byte	W01
	.byte		c_v+3
	.byte	W01
	.byte		c_v+3
	.byte	W02
	.byte		c_v+3
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte		c_v+5
	.byte	W01
	.byte		c_v+5
	.byte	W01
	.byte		c_v+5
	.byte	W01
	.byte		c_v+5
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v+6
	.byte	W02
	.byte		c_v+6
	.byte	W01
	.byte		c_v+7
	.byte	W01
	.byte		c_v+7
	.byte	W01
	.byte		c_v+7
	.byte	W01
	.byte		c_v+7
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+9
	.byte	W01
	.byte		c_v+9
	.byte	W01
	.byte		c_v+9
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+10
	.byte	W02
	.byte		c_v+11
	.byte	W01
	.byte		c_v+11
	.byte	W01
	.byte		c_v+11
	.byte	W01
	.byte		c_v+12
	.byte	W01
	.byte		c_v+12
	.byte	W01
	.byte		c_v+12
	.byte	W01
	.byte		c_v+13
	.byte	W01
	.byte		c_v+13
	.byte	W01
	.byte		c_v+13
	.byte	W01
	.byte		c_v+14
	.byte	W01
	.byte		c_v+14
	.byte	W01
	.byte		c_v+14
	.byte	W01
	.byte		c_v+15
	.byte	W02
	.byte		c_v+15
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+17
	.byte	W01
	.byte		c_v+17
	.byte	W01
	.byte		c_v+18
	.byte	W01
	.byte		c_v+18
	.byte	W01
	.byte		c_v+18
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+18
	.byte	W24
	.byte	W24
	.byte	W12
	.byte	VOL	, v127
	.byte	W02
	.byte		v110
	.byte	W02
	.byte		v095
	.byte	W02
	.byte		v081
	.byte	W02
	.byte		v068
	.byte	W02
	.byte		v056
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v020
	.byte	W02
	.byte		v014
	.byte	W02
	.byte		v009
	.byte	W02
	.byte		v005
	.byte	W02
	.byte		v002
	.byte	W02
	.byte		v000
	.byte	W02
	.byte		EOT	
	.byte	W06
	.byte	FINE

	.align 2
	.global song259
song259:	@ 0x0857F2D0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song259_1		@ track
