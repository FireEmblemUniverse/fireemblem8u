	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song532_1
song532_1:	@ 0x0858214C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 44
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song532
song532:	@ 0x0858215C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song532_1		@ track
