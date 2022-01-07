	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song491_1
song491_1:	@ 0x08581E90
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 30
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song491
song491:	@ 0x08581EA0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song491_1		@ track
