	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song345_1
song345_1:	@ 0x085813D8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 6
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song345
song345:	@ 0x085813E8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song345_1		@ track
