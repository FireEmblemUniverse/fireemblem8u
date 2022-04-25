	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song485_1
song485_1:	@ 0x08581E58
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 18
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song485
song485:	@ 0x08581E68
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song485_1		@ track
