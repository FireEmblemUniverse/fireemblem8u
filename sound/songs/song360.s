	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song360_1
song360_1:	@ 0x0858150C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 12
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song360
song360:	@ 0x0858151C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song360_1		@ track
