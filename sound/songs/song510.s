	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song510_1
song510_1:	@ 0x08581FC4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 36
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song510
song510:	@ 0x08581FD4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song510_1		@ track
