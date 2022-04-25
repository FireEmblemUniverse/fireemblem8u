	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song394_1
song394_1:	@ 0x0858181C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 26
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song394
song394:	@ 0x0858182C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song394_1		@ track
