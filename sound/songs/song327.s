	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song327_1
song327_1:	@ 0x08581238
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 20
	.byte	VOL	, v127
	.byte	BENDR	, 1
	.byte	BEND	, c_v
	.byte		N22	, Cn3, v127
	.byte	W02
	.byte	BEND	, c_v-7
	.byte	W02
	.byte		c_v-13
	.byte	W02
	.byte		c_v-20
	.byte	W02
	.byte		c_v-26
	.byte	W02
	.byte		c_v-32
	.byte	W02
	.byte		c_v-39
	.byte	W02
	.byte		c_v-45
	.byte	W02
	.byte		c_v-52
	.byte	W02
	.byte		c_v-58
	.byte	W02
	.byte		c_v-64
	.byte	W04
	.byte	FINE

	.align 2
	.global song327
song327:	@ 0x08581260
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song327_1		@ track
