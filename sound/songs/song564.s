	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song564_1
song564_1:	@ 0x0858237C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 55
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song564
song564:	@ 0x0858238C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song564_1		@ track
