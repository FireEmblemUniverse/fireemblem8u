	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song782_1
song782_1:	@ 0x08583EE4
	.byte	TEMPO	, 75
	.byte	VOL	, v047
	.byte	VOICE	, 3
	.byte	KEYSH	, 0
	.byte		N12	, Cn4, v127
	.byte	W12
	.byte	FINE

	.align 2
	.global song782
song782:	@ 0x08583EF4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup037		@ voicegroup/tone

	.word	song782_1		@ track
