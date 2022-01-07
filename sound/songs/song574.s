	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song574_1
song574_1:	@ 0x08582424
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 58
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song574
song574:	@ 0x08582434
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song574_1		@ track
