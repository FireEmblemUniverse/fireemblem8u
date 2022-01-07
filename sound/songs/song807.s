	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song807_1
song807_1:	@ 0x085845C0
	.byte	TEMPO	, 75
	.byte	VOL	, v105
	.byte	VOICE	, 3
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	@********************** Track  2 **********************@

	.align 2
	.global song807_2
song807_2:	@ 0x085845D0
	.byte	VOL	, v041
	.byte	VOICE	, 100
	.byte	KEYSH	, 0
	.byte		N02	, Fn3, v127
	.byte	W02
	.byte			En2, v090
	.byte	W02
	.byte			Cn3, v127
	.byte	W02
	.byte			Gs3, v090
	.byte	W02
	.byte			Fn3, v127
	.byte	W02
	.byte			Dn2, v090
	.byte	W02
	.byte			Cn3, v127
	.byte	W02
	.byte			Dn2, v090
	.byte	W02
	.byte	FINE

	.align 2
	.global song807
song807:	@ 0x085845F0
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song807_1		@ track
	.word	song807_2		@ track
