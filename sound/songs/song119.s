	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song119_1
song119_1:	@ 0x0857D554
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 30
	.byte	VOL	, v065
	.byte		N02	, An4, v127
	.byte	W02
	.byte			An4, v072
	.byte	W02
	.byte			Dn5, v127
	.byte	W02
	.byte			Dn5, v072
	.byte	W02
	.byte			Dn5, v040
	.byte	W16
	.byte	FINE

	@********************** Track  2 **********************@

	.global song119_2
song119_2:	@ 0x0857D56D
	.byte	KEYSH	, 0
	.byte	VOICE	, 31
	.byte	VOL	, v049
	.byte	BENDR	, 1
	.byte	BEND	, c_v+16
	.byte		N02	, An4, v127
	.byte	W02
	.byte			An4, v072
	.byte	W02
	.byte			Dn5, v127
	.byte	W02
	.byte			Dn5, v072
	.byte	W02
	.byte			Dn5, v040
	.byte	W16
	.byte	FINE

	.align 2
	.global song119
song119:	@ 0x0857D588
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song119_1		@ track
	.word	song119_2		@ track
