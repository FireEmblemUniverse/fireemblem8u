	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song462_1
song462_1:	@ 0x08581CB4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 11
	.byte	VOL	, v110
	.byte		N14	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song462
song462:	@ 0x08581CC4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song462_1		@ track
