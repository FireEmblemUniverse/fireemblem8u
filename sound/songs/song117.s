	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song117_1
song117_1:	@ 0x0857D4E8
	.byte	VOL	, v100
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 21
	.byte		N22	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song117
song117:	@ 0x0857D4F8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song117_1		@ track
