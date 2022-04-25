	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song120_1
song120_1:	@ 0x0857D598
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 37
	.byte	BENDR	, 18
	.byte	VOL	, v040
	.byte	BEND	, c_v
	.byte		N20	, Gn2, v127
	.byte	W01
	.byte	BEND	, c_v+1
	.byte	W01
	.byte		c_v+3
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte	VOL	, v034
	.byte	BEND	, c_v+6
	.byte	W01
	.byte		c_v+7
	.byte	W01
	.byte		c_v+9
	.byte	W01
	.byte		c_v+11
	.byte	W01
	.byte	VOL	, v028
	.byte	BEND	, c_v+12
	.byte	W01
	.byte		c_v+14
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte	VOL	, v022
	.byte	BEND	, c_v+18
	.byte	W01
	.byte		c_v+21
	.byte	W01
	.byte		c_v+25
	.byte	W01
	.byte		c_v+30
	.byte	W01
	.byte	VOL	, v016
	.byte	BEND	, c_v+37
	.byte	W01
	.byte		c_v+45
	.byte	W01
	.byte		c_v+54
	.byte	W01
	.byte		c_v+63
	.byte	W05
	.byte	FINE

	@********************** Track  2 **********************@

	.global song120_2
song120_2:	@ 0x0857D5DC
	.byte	KEYSH	, 0
	.byte	VOICE	, 38
	.byte	VOL	, v127
	.byte	BENDR	, 18
	.byte	BEND	, c_v-1
	.byte		N20	, Gn2, v127
	.byte	W01
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte		c_v+5
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+9
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+12
	.byte	W01
	.byte		c_v+13
	.byte	W01
	.byte		c_v+15
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+23
	.byte	W01
	.byte		c_v+30
	.byte	W01
	.byte		c_v+39
	.byte	W01
	.byte		c_v+50
	.byte	W01
	.byte		c_v+62
	.byte	W05
	.byte	FINE

	.align 2
	.global song120
song120:	@ 0x0857D614
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song120_1		@ track
	.word	song120_2		@ track
