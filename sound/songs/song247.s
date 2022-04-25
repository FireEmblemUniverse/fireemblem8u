	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song247_1
song247_1:	@ 0x0857ED5C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 7
	.byte	VOL	, v110
	.byte	BENDR	, 12
	.byte	LFOS	, 30
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	MOD	, 30
	.byte	BEND	, c_v-64
	.byte		N06	, Gn3, v127
	.byte	W01
	.byte	BEND	, c_v-59
	.byte	W01
	.byte		c_v-54
	.byte	W01
	.byte		c_v-49
	.byte	W01
	.byte		c_v-43
	.byte	W01
	.byte		c_v-38
	.byte	W01
	.byte		c_v-33
	.byte		N40	, Gn3, v124
	.byte	W01
	.byte	BEND	, c_v-27
	.byte	W01
	.byte		c_v-22
	.byte	W01
	.byte		c_v-17
	.byte	W01
	.byte		c_v-11
	.byte	W01
	.byte		c_v-6
	.byte	W01
	.byte		c_v
	.byte	W12
	.byte	VOL	, v110
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v006
	.byte	W06
	.byte	FINE

	.align 2
	.global song247
song247:	@ 0x0857EDBC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song247_1		@ track
