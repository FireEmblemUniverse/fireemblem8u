	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song133_1
song133_1:	@ 0x0857D974
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 33
	.byte	VOL	, v110
	.byte		N84	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song133
song133:	@ 0x0857D984
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song133_1		@ track
