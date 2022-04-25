	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song214_1
song214_1:	@ 0x0857E990
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 103
	.byte	VOL	, v080
	.byte		N48	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song214
song214:	@ 0x0857E9A0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song214_1		@ track
