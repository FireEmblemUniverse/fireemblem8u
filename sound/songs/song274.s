	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song274_1
song274_1:	@ 0x0857F504
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 42
	.byte	BENDR	, 10
	.byte	VOL	, v032
	.byte	BEND	, c_v
	.byte		N48	, Cn3, v127
	.byte	W01
	.byte	VOL	, v063
	.byte	W01
	.byte		v095
	.byte	BEND	, c_v+5
	.byte	W01
	.byte	VOL	, v127
	.byte	W01
	.byte	BEND	, c_v+10
	.byte	W02
	.byte		c_v+15
	.byte	W02
	.byte		c_v+20
	.byte	W02
	.byte		c_v+24
	.byte	W02
	.byte		c_v+28
	.byte	W02
	.byte		c_v+32
	.byte	W02
	.byte		c_v+36
	.byte	W02
	.byte		c_v+40
	.byte	W02
	.byte		c_v+43
	.byte	W02
	.byte		c_v+46
	.byte	W02
	.byte		c_v+49
	.byte	W02
	.byte		c_v+51
	.byte	W02
	.byte		c_v+54
	.byte	W02
	.byte		c_v+56
	.byte	W02
	.byte		c_v+58
	.byte	W02
	.byte		c_v+59
	.byte	W02
	.byte	VOL	, v127
	.byte	BEND	, c_v+60
	.byte	W01
	.byte	VOL	, v107
	.byte	W01
	.byte		v089
	.byte	BEND	, c_v+62
	.byte	W01
	.byte	VOL	, v072
	.byte	W01
	.byte		v057
	.byte	BEND	, c_v+62
	.byte	W01
	.byte	VOL	, v044
	.byte	W01
	.byte		v033
	.byte	BEND	, c_v+63
	.byte	W01
	.byte	VOL	, v023
	.byte	W01
	.byte		v016
	.byte	BEND	, c_v+63
	.byte	W01
	.byte	VOL	, v009
	.byte	W01
	.byte		v005
	.byte	BEND	, c_v+63
	.byte	W01
	.byte	VOL	, v002
	.byte	W01
	.byte	FINE

	.align 2
	.global song274
song274:	@ 0x0857F56C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song274_1		@ track
