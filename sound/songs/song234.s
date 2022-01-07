	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song234_1
song234_1:	@ 0x0857EBF8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 14
	.byte	VOL	, v127
	.byte		N20	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song234
song234:	@ 0x0857EC08
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song234_1		@ track
