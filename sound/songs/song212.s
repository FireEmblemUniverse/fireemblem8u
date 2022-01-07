	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song212_1
song212_1:	@ 0x0857E958
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 112
	.byte	VOL	, v125
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song212
song212:	@ 0x0857E968
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song212_1		@ track
