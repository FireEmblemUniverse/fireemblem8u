	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song892_1
song892_1:	@ 0x08584AC4
	.byte	TEMPO	, 75
	.byte	VOL	, v080
	.byte	VOICE	, 84
	.byte	KEYSH	, 0
	.byte		N64	, Cn3, v127
	.byte	W64
	.byte	FINE

	.align 2
	.global song892
song892:	@ 0x08584AD4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song892_1		@ track
