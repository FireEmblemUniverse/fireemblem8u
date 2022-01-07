	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song295_1
song295_1:	@ 0x0857FA18
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 51
	.byte	VOL	, v127
	.byte		N40	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song295
song295:	@ 0x0857FA28
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song295_1		@ track
