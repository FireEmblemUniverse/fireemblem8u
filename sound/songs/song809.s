	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song809_1
song809_1:	@ 0x08584600
	.byte	TEMPO	, 75
	.byte	VOL	, v099
	.byte	VOICE	, 89
	.byte	KEYSH	, 0
	.byte		N48	, Cn3, v127
	.byte	W48
	.byte	FINE

	.align 2
	.global song809
song809:	@ 0x08584610
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song809_1		@ track
