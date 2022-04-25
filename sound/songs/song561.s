	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song561_1
song561_1:	@ 0x08582328
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 53
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song561
song561:	@ 0x08582338
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song561_1		@ track
