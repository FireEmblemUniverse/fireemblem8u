	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song124_1
song124_1:	@ 0x0857D728
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 34
	.byte	VOL	, v070
	.byte		N02	, Cn7, v127
	.byte	W04
	.byte		N02	
	.byte	W04
	.byte		N02	
	.byte	W04
	.byte		N02	
	.byte	W12
	.byte	FINE

	.align 2
	.global song124
song124:	@ 0x0857D73C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song124_1		@ track
