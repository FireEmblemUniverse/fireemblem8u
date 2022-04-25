	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song896_1
song896_1:	@ 0x08584C60
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 70
	.byte	VOL	, v055
	.byte	BENDR	, 8
	.byte	BEND	, c_v-32
	.byte		TIE	, Gn2, v127
	.byte	W04
	.byte	BEND	, c_v-29
	.byte	W04
	.byte		c_v-25
	.byte	W04
	.byte		c_v-22
	.byte	W04
	.byte		c_v-18
	.byte	W04
	.byte		c_v-15
	.byte	W04
	.byte		c_v-11
	.byte	W04
	.byte		c_v-8
	.byte	W04
	.byte		c_v-4
	.byte	W04
	.byte		c_v-4
	.byte	W04
	.byte		c_v-8
	.byte	W04
	.byte		c_v-12
	.byte	W04
	.byte		c_v-15
	.byte	W04
	.byte		c_v-19
	.byte	W04
	.byte		c_v-22
	.byte	W04
	.byte		c_v-26
	.byte	W04
	.byte		c_v-29
	.byte	W04
	.byte		c_v-33
	.byte	W04
	.byte		c_v-36
	.byte	W04
	.byte		c_v-33
	.byte	W04
	.byte		c_v-29
	.byte	W03
	.byte	VOL	, v055
	.byte	W01
	.byte		v053
	.byte	BEND	, c_v-26
	.byte	W01
	.byte	VOL	, v051
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v045
	.byte	BEND	, c_v-22
	.byte	W01
	.byte	VOL	, v043
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v029
	.byte	BEND	, c_v-15
	.byte	W01
	.byte	VOL	, v027
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v020
	.byte	BEND	, c_v-12
	.byte	W01
	.byte	VOL	, v018
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v014
	.byte	BEND	, c_v-8
	.byte	W01
	.byte	VOL	, v011
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v005
	.byte	BEND	, c_v-8
	.byte	W01
	.byte	VOL	, v002
	.byte	W01
	.byte		EOT	
	.byte	VOL	, v000
	.byte	W01
	.byte		v000
	.byte	W01
	.byte	BEND	, c_v-12
	.byte	W04
	.byte		c_v-16
	.byte	FINE

	@********************** Track  2 **********************@

	.global song896_2
song896_2:	@ 0x08584CF0
	.byte	KEYSH	, 0
	.byte	VOICE	, 87
	.byte	BENDR	, 1
	.byte	VOL	, v103
	.byte	W24
	.byte	W12
	.byte	PAN	, c_v-64
	.byte	BEND	, c_v-32
	.byte	W08
	.byte		c_v-29
	.byte	W04
	.byte		N72	, Fn2, v127
	.byte	W04
	.byte	BEND	, c_v-25
	.byte	W08
	.byte		c_v-21
	.byte	W08
	.byte		c_v-17
	.byte	W04
	.byte	W04
	.byte		c_v-14
	.byte	W08
	.byte		c_v-10
	.byte	W08
	.byte		c_v-6
	.byte	W04
	.byte	W04
	.byte		c_v-2
	.byte	W07
	.byte	VOL	, v099
	.byte	W01
	.byte		v084
	.byte	BEND	, c_v+1
	.byte	W01
	.byte	VOL	, v074
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v000
	.byte	W01
	.byte	BEND	, c_v+5
	.byte	W04
	.byte	FINE

	@********************** Track  3 **********************@

	.global song896_3
song896_3:	@ 0x08584D30
	.byte	KEYSH	, 0
	.byte	VOICE	, 87
	.byte	VOL	, v103
	.byte	BENDR	, 1
	.byte	W24
	.byte	W12
	.byte	PAN	, c_v+63
	.byte	BEND	, c_v+32
	.byte	W08
	.byte		c_v+28
	.byte	W04
	.byte		N72	, Fn2, v127
	.byte	W04
	.byte	BEND	, c_v+24
	.byte	W08
	.byte		c_v+20
	.byte	W08
	.byte		c_v+16
	.byte	W04
	.byte	W04
	.byte		c_v+13
	.byte	W08
	.byte		c_v+9
	.byte	W08
	.byte		c_v+5
	.byte	W04
	.byte	W04
	.byte		c_v+1
	.byte	W07
	.byte	VOL	, v099
	.byte	W01
	.byte		v083
	.byte	BEND	, c_v-2
	.byte	W01
	.byte	VOL	, v072
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v000
	.byte	W02
	.byte	BEND	, c_v-6
	.byte	W04
	.byte	FINE

	.align 2
	.global song896
song896:	@ 0x08584D70
	.byte	3		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song896_1		@ track
	.word	song896_2		@ track
	.word	song896_3		@ track
