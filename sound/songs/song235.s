	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song235_1
song235_1:	@ 0x0857EC14
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 15
	.byte	VOL	, v127
	.byte		N20	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song235
song235:	@ 0x0857EC24
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song235_1		@ track
