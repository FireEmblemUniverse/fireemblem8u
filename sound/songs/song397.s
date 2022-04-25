	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song397_1
song397_1:	@ 0x08581870
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 27
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song397
song397:	@ 0x08581880
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song397_1		@ track
