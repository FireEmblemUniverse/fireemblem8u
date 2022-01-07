	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song595_1
song595_1:	@ 0x08582590
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 65
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song595
song595:	@ 0x085825A0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song595_1		@ track
