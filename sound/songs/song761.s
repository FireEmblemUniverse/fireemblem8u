	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song761_1
song761_1:	@ 0x08583DF0
	.byte	TEMPO	, 75
	.byte	VOL	, v090
	.byte	VOICE	, 77
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song761
song761:	@ 0x08583E00
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song761_1		@ track
