	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song346_1
song346_1:	@ 0x085813F4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 7
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song346
song346:	@ 0x08581404
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song346_1		@ track
