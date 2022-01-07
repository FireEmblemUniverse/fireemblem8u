	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song573_1
song573_1:	@ 0x08582408
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 57
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song573
song573:	@ 0x08582418
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song573_1		@ track
