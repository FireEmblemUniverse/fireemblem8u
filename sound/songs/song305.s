	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song305_1
song305_1:	@ 0x0857FB38
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 13
	.byte	VOL	, v110
	.byte		N96	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song305
song305:	@ 0x0857FB4C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song305_1		@ track
