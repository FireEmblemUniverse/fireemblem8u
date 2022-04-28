	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song266_1
song266_1:	@ 0x0857F2DC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 27
	.byte	VOL	, v095
	.byte		TIE	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	VOL	, v095
	.byte	W02
	.byte		v094
	.byte	W04
	.byte		v092
	.byte	W02
	.byte		v092
	.byte	W02
	.byte		v090
	.byte	W02
	.byte		v089
	.byte	W02
	.byte		v086
	.byte	W02
	.byte		v083
	.byte	W02
	.byte		v081
	.byte	W02
	.byte		v077
	.byte	W02
	.byte		v074
	.byte	W02
	.byte		v071
	.byte	W02
	.byte		v066
	.byte	W02
	.byte		v062
	.byte	W02
	.byte		v057
	.byte	W02
	.byte		v052
	.byte	W02
	.byte		v047
	.byte	W02
	.byte		v041
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v021
	.byte	W02
	.byte		v014
	.byte	W02
	.byte		v007
	.byte	W02
	.byte		v000
	.byte	W02
	.byte		EOT	
	.byte	W22
	.byte	FINE

	.align 2
	.global song266
song266:	@ 0x0857F320
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song266_1		@ track
