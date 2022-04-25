	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song955_1
song955_1:	@ 0x085862D0
	.byte	TEMPO	, 75
	.byte	VOL	, v100
	.byte	VOICE	, 8
	.byte	KEYSH	, 0
	.byte		N48	, En3, v127
	.byte	W48
	.byte	FINE

	.align 2
	.global song955
song955:	@ 0x085862E0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song955_1		@ track
