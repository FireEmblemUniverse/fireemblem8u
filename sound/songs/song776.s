	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song776_1
song776_1:	@ 0x08583E90
	.byte	TEMPO	, 75
	.byte	VOL	, v055
	.byte	VOICE	, 0
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song776
song776:	@ 0x08583EA0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song776_1		@ track
