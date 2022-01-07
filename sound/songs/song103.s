	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song103_1
song103_1:	@ 0x0857D0D0
	.byte	VOL	, v055
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 1
	.byte		N04	, Bn4, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song103
song103:	@ 0x0857D0E0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song103_1		@ track
