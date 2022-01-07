	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song307_1
song307_1:	@ 0x0857FB74
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 14
	.byte	VOL	, v112
	.byte		N48	, Cn3, v127
	.byte	W24
	.byte	VOL	, v111
	.byte	W02
	.byte		v105
	.byte	W02
	.byte		v100
	.byte	W02
	.byte		v095
	.byte	W02
	.byte		v089
	.byte	W02
	.byte		v084
	.byte	W02
	.byte		v079
	.byte	W02
	.byte		v074
	.byte	W02
	.byte		v070
	.byte	W02
	.byte		v052
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v017
	.byte	W02
	.byte	FINE

	.align 2
	.global song307
song307:	@ 0x0857FB9C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song307_1		@ track
