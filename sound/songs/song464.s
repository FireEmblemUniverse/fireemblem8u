	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song464_1
song464_1:	@ 0x08581CEC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 12
	.byte	VOL	, v110
	.byte		N16	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song464
song464:	@ 0x08581CFC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song464_1		@ track
