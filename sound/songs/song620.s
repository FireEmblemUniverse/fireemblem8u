	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song620_1
song620_1:	@ 0x085829D0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 29
	.byte	VOL	, v127
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song620
song620:	@ 0x085829E0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song620_1		@ track
