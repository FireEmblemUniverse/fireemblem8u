	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song252_1
song252_1:	@ 0x0857EF24
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 10
	.byte	VOL	, v080
	.byte		N14	, En5, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song252
song252:	@ 0x0857EF34
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song252_1		@ track
