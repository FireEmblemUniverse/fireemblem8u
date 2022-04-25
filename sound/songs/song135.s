	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song135_1
song135_1:	@ 0x0857D9E0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 34
	.byte	BENDR	, 8
	.byte	VOL	, v028
	.byte	BEND	, c_v
	.byte		N48	, Cs3, v127
	.byte	W01
	.byte	VOL	, v056
	.byte	W01
	.byte		v084
	.byte	BEND	, c_v+5
	.byte	W01
	.byte	VOL	, v112
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
	.byte	VOL	, v105
	.byte	BEND	, c_v+58
	.byte	W02
	.byte	VOL	, v092
	.byte	BEND	, c_v+59
	.byte	W02
	.byte	VOL	, v080
	.byte	BEND	, c_v+60
	.byte	W02
	.byte	VOL	, v067
	.byte	BEND	, c_v+62
	.byte	W02
	.byte	VOL	, v054
	.byte	BEND	, c_v+62
	.byte	W02
	.byte	VOL	, v042
	.byte	BEND	, c_v+63
	.byte	W02
	.byte	VOL	, v029
	.byte	BEND	, c_v+63
	.byte	W02
	.byte	VOL	, v017
	.byte	BEND	, c_v+63
	.byte	W02
	.byte	FINE

	.align 2
	.global song135
song135:	@ 0x0857DA40
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song135_1		@ track
