	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song706_1
song706_1:	@ 0x08582A94
	.byte	TEMPO	, 75
	.byte	VOL	, v095
	.byte	VOICE	, 16
	.byte	KEYSH	, 0
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song706
song706:	@ 0x08582AA4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song706_1		@ track
