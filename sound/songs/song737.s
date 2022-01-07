	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song737_1
song737_1:	@ 0x0858328C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 51
	.byte	BENDR	, 12
	.byte	VOL	, v018
	.byte	BEND	, c_v
	.byte		TIE	, Cn3, v127
	.byte	W02
	.byte	VOL	, v018
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v073
	.byte	W06
	.byte	W24
	.byte	W21
	.byte	BEND	, c_v
	.byte	W02
	.byte		c_v-8
	.byte	W01
	.byte	W01
	.byte		c_v-15
	.byte	W02
	.byte		c_v-22
	.byte	W02
	.byte		c_v-29
	.byte	W02
	.byte		c_v-36
	.byte	W02
	.byte		c_v-43
	.byte	W02
	.byte		c_v-50
	.byte	W01
	.byte	VOL	, v073
	.byte	W01
	.byte		v072
	.byte	BEND	, c_v-57
	.byte	W01
	.byte	VOL	, v071
	.byte	W01
	.byte		v070
	.byte	BEND	, c_v-64
	.byte	W01
	.byte	VOL	, v069
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v000
	.byte	W07
	.byte		EOT	
	.byte	FINE

	.align 2
	.global song737
song737:	@ 0x08583318
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song737_1		@ track
