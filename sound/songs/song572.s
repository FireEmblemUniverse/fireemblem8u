	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song572_1
song572_1:	@ 0x085823EC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 57
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song572
song572:	@ 0x085823FC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song572_1		@ track
