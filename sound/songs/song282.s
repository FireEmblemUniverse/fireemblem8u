	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song282_1
song282_1:	@ 0x0857F704
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 61
	.byte	VOL	, v127
	.byte		N72	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song282
song282:	@ 0x0857F714
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song282_1		@ track
