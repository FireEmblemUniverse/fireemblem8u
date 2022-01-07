	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song601_1
song601_1:	@ 0x085825C8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 66
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song601
song601:	@ 0x085825D8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song601_1		@ track
