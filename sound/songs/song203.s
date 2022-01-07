	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song203_1
song203_1:	@ 0x0857E83C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 7
	.byte	VOL	, v127
	.byte		N16	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song203
song203:	@ 0x0857E84C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song203_1		@ track
