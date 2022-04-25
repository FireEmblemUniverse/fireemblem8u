	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song600_1
song600_1:	@ 0x085825AC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 66
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song600
song600:	@ 0x085825BC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song600_1		@ track
