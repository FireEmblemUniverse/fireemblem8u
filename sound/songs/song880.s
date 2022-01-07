	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song880_1
song880_1:	@ 0x0858497C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 6
	.byte	VOL	, v120
	.byte	BEND	, c_v
	.byte		N96	, Cn3, v092
	.byte	W96
	.byte	FINE

	.align 2
	.global song880
song880:	@ 0x0858498C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup039		@ voicegroup/tone

	.word	song880_1		@ track
