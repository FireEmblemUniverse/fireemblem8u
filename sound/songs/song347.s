	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song347_1
song347_1:	@ 0x08581410
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 7
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song347
song347:	@ 0x08581420
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song347_1		@ track
