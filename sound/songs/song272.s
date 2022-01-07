	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song272_1
song272_1:	@ 0x0857F42C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 42
	.byte	BENDR	, 6
	.byte	VOL	, v032
	.byte	BEND	, c_v
	.byte		N48	, Cn3, v127
	.byte	W01
	.byte	VOL	, v063
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v095
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v127
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte		c_v
	.byte	W02
	.byte		c_v
	.byte	W02
	.byte		c_v+1
	.byte	W02
	.byte		c_v+2
	.byte	W02
	.byte		c_v+4
	.byte	W02
	.byte		c_v+7
	.byte	W02
	.byte		c_v+10
	.byte	W02
	.byte		c_v+13
	.byte	W02
	.byte		c_v+18
	.byte	W02
	.byte		c_v+23
	.byte	W02
	.byte		c_v+28
	.byte	W02
	.byte		c_v+34
	.byte	W02
	.byte		c_v+41
	.byte	W02
	.byte		c_v+48
	.byte	W02
	.byte		c_v+55
	.byte	W01
	.byte	VOL	, v127
	.byte	W01
	.byte		v109
	.byte	BEND	, c_v+63
	.byte	W01
	.byte	VOL	, v092
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v004
	.byte	W01
	.byte	FINE

	.align 2
	.global song272
song272:	@ 0x0857F48C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song272_1		@ track
