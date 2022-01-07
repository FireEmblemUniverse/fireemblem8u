	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song121_1
song121_1:	@ 0x0857D624
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 37
	.byte	VOL	, v016
	.byte	BENDR	, 18
	.byte	BEND	, c_v+63
	.byte		N20	, Gn2, v127
	.byte	W01
	.byte	BEND	, c_v+63
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte	VOL	, v024
	.byte	BEND	, c_v+62
	.byte	W01
	.byte		c_v+61
	.byte	W01
	.byte		c_v+60
	.byte	W01
	.byte		c_v+59
	.byte	W01
	.byte	VOL	, v032
	.byte	BEND	, c_v+58
	.byte	W01
	.byte		c_v+56
	.byte	W01
	.byte		c_v+54
	.byte	W01
	.byte		c_v+53
	.byte	W01
	.byte	VOL	, v040
	.byte	BEND	, c_v+51
	.byte	W01
	.byte		c_v+47
	.byte	W01
	.byte		c_v+43
	.byte	W01
	.byte		c_v+37
	.byte	W01
	.byte	VOL	, v048
	.byte	BEND	, c_v+29
	.byte	W01
	.byte		c_v+21
	.byte	W01
	.byte		c_v+11
	.byte	W01
	.byte		c_v
	.byte	W05
	.byte	FINE

	@********************** Track  2 **********************@

	.global song121_2
song121_2:	@ 0x0857D668
	.byte	KEYSH	, 0
	.byte	VOICE	, 38
	.byte	VOL	, v127
	.byte	BENDR	, 18
	.byte	BEND	, c_v+62
	.byte		N20	, Gn2, v127
	.byte	W01
	.byte	BEND	, c_v+62
	.byte	W01
	.byte		c_v+62
	.byte	W01
	.byte		c_v+62
	.byte	W01
	.byte		c_v+61
	.byte	W01
	.byte		c_v+60
	.byte	W01
	.byte		c_v+59
	.byte	W01
	.byte		c_v+58
	.byte	W01
	.byte		c_v+57
	.byte	W01
	.byte		c_v+55
	.byte	W01
	.byte		c_v+53
	.byte	W01
	.byte		c_v+52
	.byte	W01
	.byte		c_v+50
	.byte	W01
	.byte		c_v+46
	.byte	W01
	.byte		c_v+42
	.byte	W01
	.byte		c_v+36
	.byte	W01
	.byte		c_v+28
	.byte	W01
	.byte		c_v+20
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v-1
	.byte	W05
	.byte	FINE

	.align 2
	.global song121
song121:	@ 0x0857D6A0
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song121_1		@ track
	.word	song121_2		@ track
