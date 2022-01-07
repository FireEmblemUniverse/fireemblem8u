	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song565_1
song565_1:	@ 0x08582398
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 55
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song565
song565:	@ 0x085823A8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song565_1		@ track
