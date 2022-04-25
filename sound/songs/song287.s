	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song287_1
song287_1:	@ 0x0857F774
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 57
	.byte	VOL	, v096
	.byte	BENDR	, 8
	.byte		N64	, Cn3, v127
	.byte	W24
	.byte	W18
	.byte	VOL	, v080
	.byte	W02
	.byte		v066
	.byte	W02
	.byte		v053
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v016
	.byte	W02
	.byte		v010
	.byte	W02
	.byte		v006
	.byte	W02
	.byte		v002
	.byte	W02
	.byte		v000
	.byte	W10
	.byte	FINE

	.align 2
	.global song287
song287:	@ 0x0857F79C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song287_1		@ track
