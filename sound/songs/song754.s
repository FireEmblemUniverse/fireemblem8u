	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song754_1
song754_1:	@ 0x085839D8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 69
	.byte	VOL	, v110
	.byte	PAN	, c_v
	.byte		TIE	, Dn3, v127
	.byte	W96
	.byte	W48
	.byte		EOT	
	.byte	FINE

	@********************** Track  2 **********************@

	.global song754_2
song754_2:	@ 0x085839E9
	.byte	KEYSH	, 0
	.byte	VOICE	, 72
	.byte	VOL	, v110
	.byte	PAN	, c_v
	.byte		N84	, Dn3, v127
	.byte	W84
	.byte	FINE

	@********************** Track  3 **********************@

	.global song754_3
song754_3:	@ 0x085839F6
	.byte	KEYSH	, 0
	.byte	VOICE	, 71
	.byte	VOL	, v077
	.byte	MOD	, 15
	.byte	MODT	, 0
	.byte	LFOS	, 3
	.byte	BENDR	, 4
	.byte	BEND	, c_v+32
	.byte		TIE	, Gn2, v072
	.byte	W01
	.byte	BEND	, c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte	VOL	, v077
	.byte	BEND	, c_v-32
	.byte	W01
	.byte	VOL	, v071
	.byte	BEND	, c_v+32
	.byte	W01
	.byte	VOL	, v064
	.byte	BEND	, c_v+19
	.byte	W01
	.byte	VOL	, v059
	.byte	BEND	, c_v+6
	.byte	W01
	.byte	VOL	, v052
	.byte	BEND	, c_v-7
	.byte	W01
	.byte	VOL	, v045
	.byte	BEND	, c_v-20
	.byte	W01
	.byte	VOL	, v041
	.byte	BEND	, c_v-32
	.byte	W01
	.byte	VOL	, v034
	.byte	BEND	, c_v+32
	.byte	W01
	.byte	VOL	, v027
	.byte	BEND	, c_v+19
	.byte	W01
	.byte	VOL	, v022
	.byte	BEND	, c_v+6
	.byte	W01
	.byte	VOL	, v015
	.byte	BEND	, c_v-7
	.byte	W01
	.byte	VOL	, v008
	.byte	BEND	, c_v-20
	.byte	W01
	.byte	VOL	, v004
	.byte	BEND	, c_v-32
	.byte	W01
	.byte	VOL	, v000
	.byte	BEND	, c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		EOT	
	.byte	BEND	, c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	FINE

	.align 2
	.global song754
song754:	@ 0x08583B64
	.byte	3		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song754_1		@ track
	.word	song754_2		@ track
	.word	song754_3		@ track
