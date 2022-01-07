	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song248_1
song248_1:	@ 0x0857EDC8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 7
	.byte	VOL	, v110
	.byte		N44	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song248
song248:	@ 0x0857EDD8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song248_1		@ track
