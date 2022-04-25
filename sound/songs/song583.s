	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song583_1
song583_1:	@ 0x085824B0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 61
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song583
song583:	@ 0x085824C0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song583_1		@ track
