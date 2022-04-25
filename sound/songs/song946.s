	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song946_1
song946_1:	@ 0x085858E8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 91
	.byte	VOL	, v085
	.byte		TIE	, Cn3, v127
	.byte	W96
	.byte	W44
	.byte	W03
	.byte		EOT	
	.byte	W48
	.byte	W01
	.byte	VOICE	, 93
	.byte	W24
	.byte		N80	
	.byte	W72
	.byte	W11
	.byte	FINE

	@********************** Track  2 **********************@

	.global song946_2
song946_2:	@ 0x08585900
	.byte	KEYSH	, 0
	.byte	VOICE	, 30
	.byte	MOD	, 1
	.byte	BENDR	, 12
	.byte	VOL	, v085
	.byte	BEND	, c_v-50
	.byte		TIE	, Cn3, v127
	.byte	W01
	.byte	BEND	, c_v-45
	.byte	W02
	.byte		c_v-39
	.byte	W01
	.byte		c_v-33
	.byte	W02
	.byte		c_v-27
	.byte	W01
	.byte		c_v-21
	.byte	W02
	.byte		c_v-16
	.byte	W01
	.byte		c_v-10
	.byte	W02
	.byte		c_v
	.byte	W10
	.byte	MOD	, 2
	.byte	W11
	.byte		3
	.byte	W11
	.byte		4
	.byte	W11
	.byte		5
	.byte	W11
	.byte		6
	.byte	W11
	.byte		8
	.byte	W01
	.byte		12
	.byte	W02
	.byte		16
	.byte	W01
	.byte		20
	.byte	W02
	.byte		24
	.byte	W01
	.byte		28
	.byte	W02
	.byte		32
	.byte	W01
	.byte		36
	.byte	W01
	.byte	BEND	, c_v
	.byte	W01
	.byte	MOD	, 40
	.byte	BEND	, c_v-2
	.byte	W01
	.byte	MOD	, 44
	.byte	W01
	.byte	BEND	, c_v-5
	.byte	W01
	.byte	MOD	, 48
	.byte	BEND	, c_v-8
	.byte	W01
	.byte	MOD	, 52
	.byte	W01
	.byte	BEND	, c_v-11
	.byte	W01
	.byte	MOD	, 56
	.byte	BEND	, c_v-13
	.byte	W01
	.byte	MOD	, 59
	.byte	W01
	.byte	BEND	, c_v-16
	.byte	W01
	.byte		c_v-19
	.byte	W01
	.byte	VOL	, v083
	.byte	W01
	.byte		v080
	.byte	BEND	, c_v-22
	.byte	W01
	.byte	VOL	, v076
	.byte	BEND	, c_v-25
	.byte	W01
	.byte	VOL	, v072
	.byte	W01
	.byte		v070
	.byte	BEND	, c_v-27
	.byte	W01
	.byte	VOL	, v066
	.byte	BEND	, c_v-30
	.byte	W01
	.byte	VOL	, v061
	.byte	W01
	.byte		v058
	.byte	BEND	, c_v-33
	.byte	W01
	.byte	VOL	, v054
	.byte	BEND	, c_v-36
	.byte	W01
	.byte	VOL	, v050
	.byte	W01
	.byte		v048
	.byte	BEND	, c_v-38
	.byte	W01
	.byte	VOL	, v044
	.byte	BEND	, c_v-41
	.byte	W01
	.byte	VOL	, v039
	.byte	W01
	.byte		v036
	.byte	BEND	, c_v-44
	.byte	W01
	.byte	VOL	, v032
	.byte	BEND	, c_v-47
	.byte	W01
	.byte	VOL	, v028
	.byte	W01
	.byte		v026
	.byte	BEND	, c_v-50
	.byte	W01
	.byte	VOL	, v022
	.byte	BEND	, c_v-52
	.byte	W01
	.byte	VOL	, v017
	.byte	W01
	.byte		v014
	.byte	BEND	, c_v-55
	.byte	W01
	.byte	VOL	, v010
	.byte	BEND	, c_v-58
	.byte	W01
	.byte	VOL	, v006
	.byte	W01
	.byte		v004
	.byte	BEND	, c_v-61
	.byte	W01
	.byte	VOL	, v000
	.byte	BEND	, c_v-64
	.byte	W03
	.byte		EOT	
	.byte	W07
	.byte	VOICE	, 31
	.byte	W02
	.byte	VOL	, v000
	.byte	BEND	, c_v-58
	.byte		N80	
	.byte	W01
	.byte	VOL	, v001
	.byte	BEND	, c_v-52
	.byte	W01
	.byte	VOL	, v002
	.byte	BEND	, c_v-46
	.byte	W01
	.byte	VOL	, v004
	.byte	BEND	, c_v-33
	.byte	W01
	.byte	VOL	, v005
	.byte	BEND	, c_v-29
	.byte	W01
	.byte	VOL	, v006
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v009
	.byte	BEND	, c_v-28
	.byte	W01
	.byte	VOL	, v010
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v013
	.byte	BEND	, c_v-27
	.byte	W01
	.byte	VOL	, v014
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v017
	.byte	BEND	, c_v-26
	.byte	W01
	.byte	VOL	, v018
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v021
	.byte	BEND	, c_v-25
	.byte	W01
	.byte	VOL	, v022
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	BEND	, c_v-24
	.byte	W01
	.byte	VOL	, v026
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	BEND	, c_v-23
	.byte	W01
	.byte	VOL	, v030
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	BEND	, c_v-22
	.byte	W01
	.byte	VOL	, v034
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	BEND	, c_v-21
	.byte	W01
	.byte	VOL	, v038
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v042
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	BEND	, c_v-18
	.byte	W01
	.byte	VOL	, v046
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	BEND	, c_v-17
	.byte	W01
	.byte	VOL	, v050
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	BEND	, c_v-16
	.byte	W01
	.byte	VOL	, v054
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	BEND	, c_v-15
	.byte	W01
	.byte	VOL	, v058
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v061
	.byte	BEND	, c_v-14
	.byte	W01
	.byte	VOL	, v063
	.byte	W02
	.byte	BEND	, c_v-13
	.byte	W03
	.byte		c_v-12
	.byte	W03
	.byte		c_v-11
	.byte	W03
	.byte		c_v-9
	.byte	W03
	.byte		c_v-8
	.byte	W03
	.byte		c_v-7
	.byte	W03
	.byte		c_v-6
	.byte	W03
	.byte		c_v-5
	.byte	W03
	.byte		c_v-4
	.byte	W03
	.byte		c_v-3
	.byte	W03
	.byte		c_v-2
	.byte	W03
	.byte		c_v-1
	.byte	W03
	.byte		c_v+1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song946_3
song946_3:	@ 0x08585A7D
	.byte	KEYSH	, 0
	.byte	VOICE	, 126
	.byte	VOL	, v085
	.byte	W92
	.byte	W02
	.byte		v082
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v000
	.byte	W03
	.byte		v000
	.byte	W01
	.byte		v002
	.byte	W01
	.byte	VOICE	, 90
	.byte	VOL	, v004
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v015
	.byte		TIE	, Cn2, v127
	.byte	W01
	.byte	VOL	, v018
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v085
	.byte	W36
	.byte	W28
	.byte	W01
	.byte		EOT	
	.byte	FINE

	@********************** Track  4 **********************@

	.global song946_4
song946_4:	@ 0x08585B0A
	.byte	KEYSH	, 0
	.byte	VOICE	, 87
	.byte	VOL	, v085
	.byte	W96
	.byte	W96
	.byte	W18
	.byte		N92	, An2, v127
	.byte	W78
	.byte	W17
	.byte	FINE

	.align 2
	.global song946
song946:	@ 0x08585B1C
	.byte	4		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song946_1		@ track
	.word	song946_2		@ track
	.word	song946_3		@ track
	.word	song946_4		@ track
