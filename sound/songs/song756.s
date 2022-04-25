	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song756_1
song756_1:	@ 0x08583D20
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 28
	.byte	VOL	, v080
	.byte	PAN	, c_v
	.byte		N08	, Cn3, v112
	.byte	W04
	.byte			Dn3, v127
	.byte	W08
	.byte		N03	, Dn3, v032
	.byte	W03
	.byte			Dn3, v020
	.byte	W03
	.byte			Dn3, v012
	.byte	W03
	.byte	FINE

	.align 2
	.global song756
song756:	@ 0x08583D3C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song756_1		@ track
