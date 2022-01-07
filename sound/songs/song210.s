	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song210_1
song210_1:	@ 0x0857E920
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 110
	.byte	VOL	, v125
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song210
song210:	@ 0x0857E930
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song210_1		@ track
