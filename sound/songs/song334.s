	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song334_1
song334_1:	@ 0x085812DC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 2
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song334
song334:	@ 0x085812EC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song334_1		@ track
