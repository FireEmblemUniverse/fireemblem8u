	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song613_1
song613_1:	@ 0x085826A8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 121
	.byte	VOL	, v120
	.byte		N36	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song613
song613:	@ 0x085826B8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song613_1		@ track
