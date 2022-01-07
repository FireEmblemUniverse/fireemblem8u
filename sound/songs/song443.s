	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song443_1
song443_1:	@ 0x08581B80
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 24
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song443
song443:	@ 0x08581B90
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song443_1		@ track
