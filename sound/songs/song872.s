	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song872_1
song872_1:	@ 0x08584928
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 10
	.byte	VOL	, v100
	.byte	BEND	, c_v
	.byte		N96	, Cn3, v092
	.byte	W96
	.byte	FINE

	.align 2
	.global song872
song872:	@ 0x08584938
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup039		@ voicegroup/tone

	.word	song872_1		@ track
