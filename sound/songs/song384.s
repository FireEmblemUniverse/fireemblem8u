	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song384_1
song384_1:	@ 0x0858173C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 22
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song384
song384:	@ 0x0858174C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song384_1		@ track
