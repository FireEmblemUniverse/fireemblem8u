	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song811_1
song811_1:	@ 0x08584638
	.byte	TEMPO	, 75
	.byte	VOL	, v127
	.byte	VOICE	, 22
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	@********************** Track  2 **********************@

	.align 2
	.global song811_2
song811_2:	@ 0x08584648
	.byte	VOL	, v045
	.byte	KEYSH	, 0
	.byte	VOICE	, 100
	.byte		N03	, Gn2, v120
	.byte	W03
	.byte			Cn3, v100
	.byte	W03
	.byte	VOICE	, 101
	.byte		N03	, Cs3, v080
	.byte	W03
	.byte			Dn3, v060
	.byte	W03
	.byte			Fn3, v040
	.byte	W03
	.byte			Fn3, v020
	.byte	W03
	.byte			Fn3, v010
	.byte	W03
	.byte	FINE

	.align 2
	.global song811
song811:	@ 0x08584668
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song811_1		@ track
	.word	song811_2		@ track
