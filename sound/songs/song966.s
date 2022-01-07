	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song966_1
song966_1:	@ 0x085866D4
	.byte	TEMPO	, 75
	.byte	VOL	, v100
	.byte	VOICE	, 51
	.byte	KEYSH	, 0
	.byte		TIE	, Cn3, v127
	.byte	W96
	.byte	W64
	.byte		EOT	, Cn3
	.byte	FINE

	.align 2
	.global song966
song966:	@ 0x085866E4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song966_1		@ track
