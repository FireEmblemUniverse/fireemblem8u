	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song844_1
song844_1:	@ 0x0858482C
	.byte	TEMPO	, 75
	.byte	VOL	, v080
	.byte	VOICE	, 5
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song844
song844:	@ 0x0858483C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song844_1		@ track
