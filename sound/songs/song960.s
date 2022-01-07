	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song960_1
song960_1:	@ 0x08586484
	.byte	TEMPO	, 75
	.byte	VOL	, v105
	.byte	VOICE	, 50
	.byte	KEYSH	, 0
	.byte		N64	, Cn3, v127
	.byte	W64
	.byte	FINE

	.align 2
	.global song960
song960:	@ 0x08586494
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song960_1		@ track
