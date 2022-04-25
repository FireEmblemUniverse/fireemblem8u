	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song415_1
song415_1:	@ 0x085819C0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 5
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song415
song415:	@ 0x085819D0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song415_1		@ track
