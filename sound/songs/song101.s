	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song101_1
song101_1:	@ 0x0857D098
	.byte	VOL	, v040
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 0
	.byte		N03	, Gs4, v127
	.byte	W04
	.byte		N05	, Fs4
	.byte	W20
	.byte	FINE

	.align 2
	.global song101
song101:	@ 0x0857D0A8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song101_1		@ track
