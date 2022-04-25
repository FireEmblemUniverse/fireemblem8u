	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song258_1
song258_1:	@ 0x0857F180
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 39
	.byte	BENDR	, 12
	.byte	VOL	, v027
	.byte		TIE	, Cn3, v127
	.byte	W01
	.byte	VOL	, v055
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v110
	.byte	W21
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W02
	.byte		v109
	.byte	W01
	.byte		v104
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		EOT	
	.byte	VOL	, v000
	.byte	W18
	.byte	FINE

	.align 2
	.global song258
song258:	@ 0x0857F1DC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song258_1		@ track
