	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song139_1
song139_1:	@ 0x0857DB70
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 37
	.byte	BENDR	, 10
	.byte	VOL	, v064
	.byte	BEND	, c_v
	.byte		N48	, Cn3, v127
	.byte	W01
	.byte	VOL	, v079
	.byte	W01
	.byte		v095
	.byte	BEND	, c_v+5
	.byte	W01
	.byte	VOL	, v111
	.byte	W01
	.byte		v127
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
	.byte	VOL	, v126
	.byte	BEND	, c_v+49
	.byte	W02
	.byte	VOL	, v107
	.byte	BEND	, c_v+51
	.byte	W02
	.byte	VOL	, v089
	.byte	BEND	, c_v+54
	.byte	W02
	.byte	VOL	, v074
	.byte	BEND	, c_v+56
	.byte	W02
	.byte	VOL	, v060
	.byte	BEND	, c_v+58
	.byte	W02
	.byte	VOL	, v048
	.byte	BEND	, c_v+59
	.byte	W02
	.byte	VOL	, v038
	.byte	BEND	, c_v+60
	.byte	W02
	.byte	VOL	, v030
	.byte	BEND	, c_v+62
	.byte	W02
	.byte	VOL	, v024
	.byte	BEND	, c_v+62
	.byte	W02
	.byte	VOL	, v019
	.byte	BEND	, c_v+63
	.byte	W02
	.byte	VOL	, v016
	.byte	BEND	, c_v+63
	.byte	W02
	.byte		c_v+63
	.byte	W02
	.byte	FINE

	.align 2
	.global song139
song139:	@ 0x0857DBDC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song139_1		@ track
