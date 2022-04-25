	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song209_1
song209_1:	@ 0x0857E8E4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 11
	.byte	VOL	, v127
	.byte	BENDR	, 2
	.byte	BEND	, c_v-40
	.byte		N02	, Cn3, v127
	.byte	W02
	.byte	BEND	, c_v-32
	.byte		N02	, Cn3, v120
	.byte	W02
	.byte	BEND	, c_v-24
	.byte		N04	, Cn3, v116
	.byte	W04
	.byte	BEND	, c_v-16
	.byte		N06	, Cn3, v112
	.byte	W06
	.byte	BEND	, c_v-8
	.byte		N08	, Cn3, v108
	.byte	W08
	.byte	BEND	, c_v
	.byte		N09	, Cn3, v100
	.byte	W02
	.byte	W24
	.byte	FINE

	.align 2
	.global song209
song209:	@ 0x0857E914
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song209_1		@ track
