	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song505_1
song505_1:	@ 0x08581FA8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 35
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song505
song505:	@ 0x08581FB8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song505_1		@ track
