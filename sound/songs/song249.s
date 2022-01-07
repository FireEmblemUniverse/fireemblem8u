	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song249_1
song249_1:	@ 0x0857EDE4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 40
	.byte	BENDR	, 8
	.byte	VOL	, v016
	.byte	BEND	, c_v
	.byte		N96	, Cn3, v127
	.byte	W01
	.byte	VOL	, v052
	.byte	W01
	.byte		v089
	.byte	BEND	, c_v+5
	.byte	W01
	.byte	VOL	, v127
	.byte	W01
	.byte	BEND	, c_v+9
	.byte	W02
	.byte		c_v+13
	.byte	W02
	.byte		c_v+17
	.byte	W02
	.byte		c_v+21
	.byte	W02
	.byte		c_v+23
	.byte	W02
	.byte		c_v+26
	.byte	W02
	.byte		c_v+28
	.byte	W02
	.byte		c_v+29
	.byte	W02
	.byte		c_v+31
	.byte	W02
	.byte		c_v+31
	.byte	W02
	.byte		c_v+32
	.byte	W02
	.byte		c_v+34
	.byte	W02
	.byte		c_v+37
	.byte	W02
	.byte		c_v+39
	.byte	W02
	.byte		c_v+41
	.byte	W02
	.byte		c_v+43
	.byte	W02
	.byte		c_v+45
	.byte	W02
	.byte		c_v+47
	.byte	W02
	.byte		c_v+49
	.byte	W02
	.byte		c_v+51
	.byte	W02
	.byte		c_v+53
	.byte	W02
	.byte		c_v+54
	.byte	W02
	.byte		c_v+55
	.byte	W02
	.byte		c_v+57
	.byte	W02
	.byte		c_v+58
	.byte	W02
	.byte		c_v+59
	.byte	W02
	.byte		c_v+60
	.byte	W02
	.byte		c_v+61
	.byte	W02
	.byte		c_v+61
	.byte	W02
	.byte		c_v+62
	.byte	W02
	.byte		c_v+63
	.byte	W02
	.byte		c_v+63
	.byte	W02
	.byte		c_v+63
	.byte	W02
	.byte		c_v+63
	.byte	W02
	.byte	VOL	, v127
	.byte	BEND	, c_v+63
	.byte	W01
	.byte	VOL	, v116
	.byte	W01
	.byte		v106
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v000
	.byte	W02
	.byte	FINE

	.align 2
	.global song249
song249:	@ 0x0857EE78
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song249_1		@ track
