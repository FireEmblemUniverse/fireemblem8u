	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song377_1
song377_1:	@ 0x085816B0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 19
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song377
song377:	@ 0x085816C0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song377_1		@ track
