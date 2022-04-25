	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song805_1
song805_1:	@ 0x08584544
	.byte	TEMPO	, 75
	.byte	VOL	, v080
	.byte	VOICE	, 1
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	@********************** Track  2 **********************@

	.align 2
	.global song805_2
song805_2:	@ 0x08584554
	.byte	VOL	, v047
	.byte	VOICE	, 100
	.byte	KEYSH	, 0
	.byte		N04	, Cn3, v127
	.byte	W04
	.byte	VOICE	, 101
	.byte		N03	, Bn2, v100
	.byte	W03
	.byte			Bn2, v080
	.byte	W03
	.byte		N02	, Bn2, v060
	.byte	W02
	.byte			Bn2, v030
	.byte	W02
	.byte			Bn2, v010
	.byte	W02
	.byte	FINE

	.align 2
	.global song805
song805:	@ 0x08584574
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song805_1		@ track
	.word	song805_2		@ track
