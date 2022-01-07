	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song170_1
song170_1:	@ 0x0857E234
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 45
	.byte	VOL	, v100
	.byte	BENDR	, 12
	.byte	BEND	, c_v
	.byte		N48	, Gn2, v127
	.byte	W02
	.byte	BEND	, c_v
	.byte	W02
	.byte		c_v+1
	.byte	W02
	.byte		c_v+2
	.byte	W02
	.byte		c_v+5
	.byte	W02
	.byte		c_v+8
	.byte	W02
	.byte		c_v+11
	.byte	W02
	.byte		c_v+15
	.byte	W02
	.byte		c_v+20
	.byte	W02
	.byte		c_v+25
	.byte	W02
	.byte		c_v+32
	.byte	W02
	.byte		c_v+38
	.byte	W02
	.byte		c_v+43
	.byte	W02
	.byte	VOL	, v094
	.byte	BEND	, c_v+48
	.byte	W02
	.byte	VOL	, v092
	.byte	BEND	, c_v+52
	.byte	W02
	.byte	VOL	, v090
	.byte	BEND	, c_v+55
	.byte	W02
	.byte	VOL	, v086
	.byte	BEND	, c_v+58
	.byte	W02
	.byte	VOL	, v081
	.byte	BEND	, c_v+61
	.byte	W02
	.byte	VOL	, v074
	.byte	BEND	, c_v+62
	.byte	W02
	.byte	VOL	, v065
	.byte	BEND	, c_v+63
	.byte	W02
	.byte	VOL	, v055
	.byte	BEND	, c_v+63
	.byte	W02
	.byte	VOL	, v043
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v018
	.byte	W02
	.byte	FINE

	.align 2
	.global song170
song170:	@ 0x0857E290
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song170_1		@ track
