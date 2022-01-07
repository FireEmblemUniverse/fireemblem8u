	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song704_1
song704_1:	@ 0x08582A5C
	.byte	TEMPO	, 75
	.byte	VOL	, v100
	.byte	VOICE	, 14
	.byte	KEYSH	, 0
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song704
song704:	@ 0x08582A6C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song704_1		@ track
