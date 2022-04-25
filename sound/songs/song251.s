	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song251_1
song251_1:	@ 0x0857EEE4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 9
	.byte	VOL	, v064
	.byte	BENDR	, 5
	.byte		N36	, Cn3, v127
	.byte	W05
	.byte	VOL	, v065
	.byte	W02
	.byte		v067
	.byte	W02
	.byte		v068
	.byte	W02
	.byte		v071
	.byte	W02
	.byte		v073
	.byte	W02
	.byte		v076
	.byte	W02
	.byte		v079
	.byte	W02
	.byte		v083
	.byte	W02
	.byte		v087
	.byte	W02
	.byte		v092
	.byte	W01
	.byte	W01
	.byte		v096
	.byte	W02
	.byte		v102
	.byte	W02
	.byte		v107
	.byte	W02
	.byte		v113
	.byte	W02
	.byte		v120
	.byte	W02
	.byte		v127
	.byte	W13
	.byte	FINE

	.align 2
	.global song251
song251:	@ 0x0857EF18
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song251_1		@ track
