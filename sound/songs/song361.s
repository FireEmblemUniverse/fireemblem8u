	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song361_1
song361_1:	@ 0x08581528
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 12
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song361
song361:	@ 0x08581538
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song361_1		@ track
