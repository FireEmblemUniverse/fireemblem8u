	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song521_1
song521_1:	@ 0x08582088
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 40
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song521
song521:	@ 0x08582098
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song521_1		@ track
