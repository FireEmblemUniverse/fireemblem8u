	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song850_1
song850_1:	@ 0x08584864
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 4
	.byte	VOL	, v100
	.byte	BEND	, c_v
	.byte		N96	, Cn3, v092
	.byte	W96
	.byte	FINE

	.align 2
	.global song850
song850:	@ 0x08584874
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup039		@ voicegroup/tone

	.word	song850_1		@ track
