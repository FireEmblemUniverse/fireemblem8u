	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song344_1
song344_1:	@ 0x085813BC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 6
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song344
song344:	@ 0x085813CC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song344_1		@ track
