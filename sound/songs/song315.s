	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song315_1
song315_1:	@ 0x0857FDB4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 17
	.byte	VOL	, v127
	.byte		N96	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song315
song315:	@ 0x0857FDC8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song315_1		@ track
