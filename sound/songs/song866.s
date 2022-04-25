	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song866_1
song866_1:	@ 0x085848F0
	.byte	TEMPO	, 75
	.byte	VOL	, v099
	.byte	VOICE	, 26
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song866
song866:	@ 0x08584900
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song866_1		@ track
