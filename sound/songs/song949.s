	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song949_1
song949_1:	@ 0x08585E34
	.byte	TEMPO	, 75
	.byte	VOL	, v099
	.byte	VOICE	, 90
	.byte	KEYSH	, 0
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song949
song949:	@ 0x08585E44
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song949_1		@ track
