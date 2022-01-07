	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song784_1
song784_1:	@ 0x08583F00
	.byte	TEMPO	, 75
	.byte	VOL	, v110
	.byte	KEYSH	, 0
	.byte	VOICE	, 112
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song784
song784:	@ 0x08583F10
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song784_1		@ track
