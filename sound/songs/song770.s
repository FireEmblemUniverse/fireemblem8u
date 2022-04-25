	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song770_1
song770_1:	@ 0x08583E3C
	.byte	TEMPO	, 75
	.byte	VOL	, v100
	.byte	VOICE	, 0
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song770
song770:	@ 0x08583E4C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup037		@ voicegroup/tone

	.word	song770_1		@ track
