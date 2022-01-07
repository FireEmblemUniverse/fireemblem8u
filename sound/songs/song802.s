	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song802_1
song802_1:	@ 0x08584528
	.byte	TEMPO	, 75
	.byte	VOL	, v120
	.byte	VOICE	, 85
	.byte	KEYSH	, 0
	.byte		N48	, Cn3, v127
	.byte	W48
	.byte	FINE

	.align 2
	.global song802
song802:	@ 0x08584538
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song802_1		@ track
