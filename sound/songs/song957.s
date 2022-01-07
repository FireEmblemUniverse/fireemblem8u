	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song957_1
song957_1:	@ 0x085862EC
	.byte	TEMPO	, 75
	.byte	VOL	, v120
	.byte	VOICE	, 5
	.byte	KEYSH	, 0
	.byte		N12	, Cn3, v127
	.byte	W12
	.byte	FINE

	.align 2
	.global song957
song957:	@ 0x085862FC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup037		@ voicegroup/tone

	.word	song957_1		@ track
