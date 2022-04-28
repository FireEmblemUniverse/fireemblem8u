	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song142_1
song142_1:	@ 0x0857DD30
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 87
	.byte	MODT	, 2
	.byte	MOD	, 30
	.byte	LFOS	, 10
	.byte	VOL	, v032
	.byte		TIE	, Cn3, v127
	.byte	W04
	.byte	VOL	, v033
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v050
	.byte	W02
	.byte		v055
	.byte	W02
	.byte		v061
	.byte	W02
	.byte		v067
	.byte	W02
	.byte		v074
	.byte	W02
	.byte		v081
	.byte	W02
	.byte		v089
	.byte	W02
	.byte		v098
	.byte	W02
	.byte		v107
	.byte	W02
	.byte		v116
	.byte	W02
	.byte		v127
	.byte	W12
	.byte	W24
	.byte		v126
	.byte	W02
	.byte		v120
	.byte	W02
	.byte		v115
	.byte	W02
	.byte		v109
	.byte	W02
	.byte		v104
	.byte	W02
	.byte		v098
	.byte	W02
	.byte		v093
	.byte	W02
	.byte		v087
	.byte	W02
	.byte		v082
	.byte	W02
	.byte		v076
	.byte	W02
	.byte		v071
	.byte	W02
	.byte		v065
	.byte	W02
song142_1_1:
	.byte	VOL	, v060
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	GOTO	
		.word	song142_1_1
	.byte	W08
	.byte		EOT	, Cn3
	.byte	W16
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song142
song142:	@ 0x0857DDA0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	51		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song142_1		@ track
