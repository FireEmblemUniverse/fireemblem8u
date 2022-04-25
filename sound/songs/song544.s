	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song544_1
song544_1:	@ 0x0858222C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 48
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song544
song544:	@ 0x0858223C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song544_1		@ track
