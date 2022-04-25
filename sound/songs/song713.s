	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song713_1
song713_1:	@ 0x08582B04
	.byte	TEMPO	, 75
	.byte	VOL	, v105
	.byte	VOICE	, 23
	.byte	KEYSH	, 0
	.byte		N48	, Cn3, v127
	.byte	W48
	.byte	FINE

	.align 2
	.global song713
song713:	@ 0x08582B14
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song713_1		@ track
