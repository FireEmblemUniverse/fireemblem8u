	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song231_1
song231_1:	@ 0x0857EBDC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 91
	.byte	VOL	, v110
	.byte		N60	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song231
song231:	@ 0x0857EBEC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song231_1		@ track
