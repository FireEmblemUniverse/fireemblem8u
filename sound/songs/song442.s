	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song442_1
song442_1:	@ 0x08581B64
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 24
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song442
song442:	@ 0x08581B74
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song442_1		@ track
