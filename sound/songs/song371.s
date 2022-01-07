	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song371_1
song371_1:	@ 0x08581608
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 16
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song371
song371:	@ 0x08581618
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song371_1		@ track
