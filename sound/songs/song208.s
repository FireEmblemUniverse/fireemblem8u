	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song208_1
song208_1:	@ 0x0857E8C8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 13
	.byte	VOL	, v127
	.byte		N20	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song208
song208:	@ 0x0857E8D8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song208_1		@ track
