	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song791_1
song791_1:	@ 0x085844D4
	.byte	TEMPO	, 75
	.byte	VOL	, v110
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song791
song791:	@ 0x085844E4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song791_1		@ track
