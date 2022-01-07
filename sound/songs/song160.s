	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song160_1
song160_1:	@ 0x0857E154
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 8
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte		N11	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song160
song160:	@ 0x0857E164
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song160_1		@ track
