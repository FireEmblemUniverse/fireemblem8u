	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song722_1
song722_1:	@ 0x08582BD8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 33
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte		N03	, Bn2, v112
	.byte	W03
	.byte			An2
	.byte	W03
	.byte		N30	, Gn2, v127
	.byte	W30
	.byte	FINE

	@********************** Track  2 **********************@

	.global song722_2
song722_2:	@ 0x08582BED
	.byte	KEYSH	, 0
	.byte	VOICE	, 34
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte		N30	, Gn2, v127
	.byte	W30
	.byte	FINE

	.align 2
	.global song722
song722:	@ 0x08582BFC
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song722_1		@ track
	.word	song722_2		@ track
