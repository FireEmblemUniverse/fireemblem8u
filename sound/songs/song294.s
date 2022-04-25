	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song294_1
song294_1:	@ 0x0857F9DC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 47
	.byte	VOL	, v011
	.byte		N60	, Cn3, v127
	.byte	W01
	.byte	VOL	, v023
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v074
	.byte	W02
	.byte		v100
	.byte	W17
	.byte	W14
	.byte		v083
	.byte	W02
	.byte		v069
	.byte	W02
	.byte		v055
	.byte	W02
	.byte		v044
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v017
	.byte	W02
	.byte		v011
	.byte	W02
	.byte		v006
	.byte	W02
	.byte		v002
	.byte	W02
	.byte		v000
	.byte	W14
	.byte	FINE

	.align 2
	.global song294
song294:	@ 0x0857FA0C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song294_1		@ track
