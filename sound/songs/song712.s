	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song712_1
song712_1:	@ 0x08582AE8
	.byte	TEMPO	, 75
	.byte	VOL	, v105
	.byte	VOICE	, 22
	.byte	KEYSH	, 0
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song712
song712:	@ 0x08582AF8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song712_1		@ track
