	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song365_1
song365_1:	@ 0x08581598
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 14
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song365
song365:	@ 0x085815A8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song365_1		@ track
