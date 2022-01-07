	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song543_1
song543_1:	@ 0x08582210
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 47
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song543
song543:	@ 0x08582220
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song543_1		@ track
