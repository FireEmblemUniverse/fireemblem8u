	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song854_1
song854_1:	@ 0x0858489C
	.byte	TEMPO	, 75
	.byte	VOL	, v060
	.byte	VOICE	, 6
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song854
song854:	@ 0x085848AC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song854_1		@ track
