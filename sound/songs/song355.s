	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song355_1
song355_1:	@ 0x085814B8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 10
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song355
song355:	@ 0x085814C8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song355_1		@ track
