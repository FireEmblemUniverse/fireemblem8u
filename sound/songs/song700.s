	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song700_1
song700_1:	@ 0x085829EC
	.byte	TEMPO	, 75
	.byte	VOL	, v100
	.byte	VOICE	, 10
	.byte	KEYSH	, 0
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song700
song700:	@ 0x085829FC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song700_1		@ track
