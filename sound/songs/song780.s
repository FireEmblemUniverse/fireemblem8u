	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song780_1
song780_1:	@ 0x08583EC8
	.byte	TEMPO	, 75
	.byte	VOL	, v045
	.byte	VOICE	, 40
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song780
song780:	@ 0x08583ED8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song780_1		@ track
