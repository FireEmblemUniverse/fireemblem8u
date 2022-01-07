	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song836_1
song836_1:	@ 0x085847D8
	.byte	TEMPO	, 75
	.byte	VOL	, v080
	.byte	VOICE	, 23
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song836
song836:	@ 0x085847E8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song836_1		@ track
