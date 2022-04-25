	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song373_1
song373_1:	@ 0x08581640
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 17
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song373
song373:	@ 0x08581650
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song373_1		@ track
