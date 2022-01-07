	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song481_1
song481_1:	@ 0x08581DE8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 16
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song481
song481:	@ 0x08581DF8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song481_1		@ track
