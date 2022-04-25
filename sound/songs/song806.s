	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song806_1
song806_1:	@ 0x08584584
	.byte	TEMPO	, 75
	.byte	VOL	, v080
	.byte	VOICE	, 2
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	@********************** Track  2 **********************@

	.align 2
	.global song806_2
song806_2:	@ 0x08584594
	.byte	VOL	, v047
	.byte	VOICE	, 101
	.byte	KEYSH	, 0
	.byte		N02	, Gn2, v127
	.byte	W02
	.byte			Dn2
	.byte	W02
	.byte	VOICE	, 100
	.byte		N02	, Gn2, v100
	.byte	W02
	.byte			Fs2, v050
	.byte	W02
	.byte			En2, v060
	.byte	W02
	.byte			Dn2, v030
	.byte	W02
	.byte	FINE

	.align 2
	.global song806
song806:	@ 0x085845B0
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song806_1		@ track
	.word	song806_2		@ track
