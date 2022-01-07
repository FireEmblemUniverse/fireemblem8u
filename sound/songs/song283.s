	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song283_1
song283_1:	@ 0x0857F720
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 37
	.byte	VOL	, v120
	.byte		N60	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song283
song283:	@ 0x0857F730
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song283_1		@ track
