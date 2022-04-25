	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song741_1
song741_1:	@ 0x08583494
	.byte	TEMPO	, 75
	.byte	VOL	, v040
	.byte	VOICE	, 58
	.byte	KEYSH	, 0
	.byte		N02	, Bn4, v127
	.byte	W02
	.byte	FINE

	.align 2
	.global song741
song741:	@ 0x085834A4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song741_1		@ track
