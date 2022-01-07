	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song357_1
song357_1:	@ 0x085814F0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 11
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song357
song357:	@ 0x08581500
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song357_1		@ track
