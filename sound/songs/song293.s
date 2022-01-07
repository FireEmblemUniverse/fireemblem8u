	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song293_1
song293_1:	@ 0x0857F9C0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 46
	.byte	VOL	, v110
	.byte		N84	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song293
song293:	@ 0x0857F9D0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song293_1		@ track
