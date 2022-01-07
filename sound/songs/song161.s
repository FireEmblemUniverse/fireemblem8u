	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song161_1
song161_1:	@ 0x0857E170
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 8
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte		N11	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song161
song161:	@ 0x0857E180
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song161_1		@ track
