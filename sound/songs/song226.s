	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song226_1
song226_1:	@ 0x0857EBA0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 29
	.byte	VOL	, v127
	.byte		N72	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song226
song226:	@ 0x0857EBB0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song226_1		@ track
