	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song390_1
song390_1:	@ 0x085817AC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 24
	.byte	VOL	, v096
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song390
song390:	@ 0x085817BC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song390_1		@ track
